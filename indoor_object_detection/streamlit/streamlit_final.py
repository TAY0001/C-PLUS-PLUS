import time
from pathlib import Path
import tempfile
import threading
from collections import deque
import subprocess
import os
import shutil
import yaml
from collections import Counter

import cv2
import numpy as np
import streamlit as st
from ultralytics import YOLO
import torch
import matplotlib.pyplot as plt

# -----------------------
# Config
# -----------------------
st.set_page_config(page_title="IndoorVision Streamlit", layout="wide")

# Initialize session state variables
if "stream_handler" not in st.session_state:
    st.session_state.stream_handler = None
if "live_run" not in st.session_state:
    st.session_state.live_run = False
if "processed_videos" not in st.session_state:
    st.session_state.processed_videos = {}
if "main_mode" not in st.session_state:
    st.session_state.main_mode = "🔍 Object Detection"

MODEL_PATH = "models/best.pt" 
CONF_THRES = 0.25
IMGSZ = 640

# EDA Configuration
DATASET_PATH = r"C:\indoor_object_detection\dataset\merge_final_dataset"
YAML_PATH = os.path.join(DATASET_PATH, "data.yaml")

LABEL_DIRS = [
    os.path.join(DATASET_PATH, "train/labels"),
    os.path.join(DATASET_PATH, "valid/labels"),
    os.path.join(DATASET_PATH, "test/labels")
]

IMAGE_DIR = os.path.join(DATASET_PATH, "train/images")

# Training Results Configuration
RESULT_DIR = Path(r"C:\Users\admin\Pictures\result_hyperparameter tuning\test\result_custom")

@st.cache_resource
def load_model():
    model = YOLO(MODEL_PATH)
    
    if torch.cuda.is_available():
        device = 'cuda'
        model.to(device)
        
        # Don't convert to half here - let YOLO handle it
        if hasattr(model, 'model'):
            model.model.eval()
            torch.backends.cudnn.benchmark = True
        
        # Warm up with FP32 (safer)
        dummy_input = torch.randn(1, 3, 640, 640).to(device)
        if hasattr(model, 'model'):
            with torch.no_grad():
                _ = model.model(dummy_input)
    else:
        st.warning("⚠️ No GPU detected, using CPU")
    
    return model

model = load_model()

# -----------------------
# Helpers
# -----------------------
def draw_detections(frame_bgr, results):
    """Draw YOLO detections on a BGR frame."""
    if results.boxes is None:
        return frame_bgr

    names = results.names
    for b in results.boxes:
        cls_id = int(b.cls.item())
        conf = float(b.conf.item())
        x1, y1, x2, y2 = map(int, b.xyxy[0].tolist())

        label = f"{names[cls_id]} {conf:.2f}"
        cv2.rectangle(frame_bgr, (x1, y1), (x2, y2), (0, 255, 0), 2)
        cv2.putText(frame_bgr, label, (x1, max(20, y1 - 8)),
                    cv2.FONT_HERSHEY_SIMPLEX, 0.6, (0, 255, 0), 2)
    return frame_bgr

def draw_detections_with_scale(frame_bgr, results, scale_x=1.0, scale_y=1.0):
    """Draw YOLO detections with coordinate scaling"""
    if results.boxes is None:
        return frame_bgr

    names = results.names
    for b in results.boxes:
        cls_id = int(b.cls.item())
        conf = float(b.conf.item())
        
        # Get coordinates and scale them
        x1 = int(b.xyxy[0][0].item() * scale_x)
        y1 = int(b.xyxy[0][1].item() * scale_y)
        x2 = int(b.xyxy[0][2].item() * scale_x)
        y2 = int(b.xyxy[0][3].item() * scale_y)

        label = f"{names[cls_id]} {conf:.2f}"
        cv2.rectangle(frame_bgr, (x1, y1), (x2, y2), (0, 255, 0), 2)
        cv2.putText(frame_bgr, label, (x1, max(20, y1 - 8)),
                    cv2.FONT_HERSHEY_SIMPLEX, 0.6, (0, 255, 0), 2)
    return frame_bgr

def convert_with_ffmpeg(input_path, output_path):
    """Convert video to browser-playable format using FFmpeg"""
    
    # Path to ffmpeg - change this if you installed elsewhere
    FFMPEG_PATH = r"C:\ffmpeg\bin\ffmpeg.exe"
    
    # Check if FFmpeg exists
    if not os.path.exists(FFMPEG_PATH):
        st.warning("⚠️ FFmpeg not found. Video will be available for download only.")
        return False
    
    # FFmpeg command to convert to H.264 MP4
    cmd = [
        FFMPEG_PATH,
        '-i', input_path,           # Input file
        '-c:v', 'libx264',          # H.264 video codec
        '-preset', 'fast',          # Encoding speed
        '-pix_fmt', 'yuv420p',      # Pixel format (browser compatible)
        '-c:a', 'aac',              # AAC audio codec
        '-movflags', '+faststart',  # Optimize for streaming
        '-y',                       # Overwrite output file
        output_path
    ]
    
    try:
        # Run FFmpeg and wait for completion
        result = subprocess.run(cmd, capture_output=True, text=True, timeout=60)
        if result.returncode == 0:
            # Wait a moment for file to be fully written
            time.sleep(0.5)
            return True
        else:
            print(f"FFmpeg error: {result.stderr}")
            return False
    except subprocess.TimeoutExpired:
        print("FFmpeg timed out")
        return False
    except Exception as e:
        print(f"Error running FFmpeg: {e}")
        return False

def safe_remove_file(file_path):
    """Safely remove a file with retry logic"""
    for attempt in range(3):
        try:
            if os.path.exists(file_path):
                os.remove(file_path)
            return True
        except PermissionError:
            time.sleep(0.5)  # Wait and retry
    return False

def process_video_standard(input_path: str, output_path: str, conf=0.25, imgsz=640, progress_cb=None):
    """Process video and convert to playable format"""
    cap = cv2.VideoCapture(input_path)
    if not cap.isOpened():
        raise RuntimeError("Cannot open uploaded video.")

    fps = cap.get(cv2.CAP_PROP_FPS)
    if fps <= 1 or np.isnan(fps):
        fps = 25.0

    w = int(cap.get(cv2.CAP_PROP_FRAME_WIDTH))
    h = int(cap.get(cv2.CAP_PROP_FRAME_HEIGHT))

    # Create temp file with mp4v codec first
    temp_path = output_path.replace('.mp4', '_temp.mp4')
    fourcc = cv2.VideoWriter_fourcc(*"mp4v")
    out = cv2.VideoWriter(temp_path, fourcc, fps, (w, h))

    total = int(cap.get(cv2.CAP_PROP_FRAME_COUNT))
    i = 0
    device = 'cuda' if torch.cuda.is_available() else 'cpu'

    while True:
        ok, frame = cap.read()
        if not ok:
            break

        res = model.predict(frame, imgsz=imgsz, conf=conf, verbose=False, device=device)[0]
        frame = draw_detections(frame, res)
        out.write(frame)

        i += 1
        if progress_cb and total > 0 and i % 3 == 0:
            progress_cb(min(i / total, 1.0))

    cap.release()
    out.release()
    
    # Small delay to ensure VideoWriter releases the file
    time.sleep(0.3)
    
    # Convert to playable format using FFmpeg
    if not convert_with_ffmpeg(temp_path, output_path):
        # If conversion fails, use the temp file
        shutil.copy(temp_path, output_path)
    
    # Clean up temp file with retry
    safe_remove_file(temp_path)
    
    return output_path

def process_video_side_by_side_separate(input_path: str, output_original_path: str, output_detected_path: str, conf=0.25, imgsz=640, progress_cb=None):
    """Process video and save original and detected versions separately, then convert"""
    cap = cv2.VideoCapture(input_path)
    if not cap.isOpened():
        raise RuntimeError("Cannot open uploaded video.")

    fps = cap.get(cv2.CAP_PROP_FPS)
    if fps <= 1 or np.isnan(fps):
        fps = 25.0

    w = int(cap.get(cv2.CAP_PROP_FRAME_WIDTH))
    h = int(cap.get(cv2.CAP_PROP_FRAME_HEIGHT))

    # Create temp files with mp4v codec
    temp_original = output_original_path.replace('.mp4', '_temp.mp4')
    temp_detected = output_detected_path.replace('.mp4', '_temp.mp4')
    
    fourcc = cv2.VideoWriter_fourcc(*"mp4v")
    out_original = cv2.VideoWriter(temp_original, fourcc, fps, (w, h))
    out_detected = cv2.VideoWriter(temp_detected, fourcc, fps, (w, h))

    total = int(cap.get(cv2.CAP_PROP_FRAME_COUNT))
    i = 0
    device = 'cuda' if torch.cuda.is_available() else 'cpu'

    while True:
        ok, frame = cap.read()
        if not ok:
            break

        out_original.write(frame)
        
        res = model.predict(frame, imgsz=imgsz, conf=conf, verbose=False, device=device)[0]
        frame_with_detections = draw_detections(frame.copy(), res)
        out_detected.write(frame_with_detections)

        i += 1
        if progress_cb and total > 0 and i % 3 == 0:
            progress_cb(min(i / total, 1.0))

    cap.release()
    out_original.release()
    out_detected.release()
    
    # Small delay to ensure VideoWriter releases the files
    time.sleep(0.3)
    
    # Convert to playable format
    convert_with_ffmpeg(temp_original, output_original_path)
    convert_with_ffmpeg(temp_detected, output_detected_path)
    
    # Clean up temp files with retry
    safe_remove_file(temp_original)
    safe_remove_file(temp_detected)

def create_combined_video(video1_path, video2_path, output_path, scale_percent=100):
    """Combine two videos side by side and convert to playable format"""
    cap1 = cv2.VideoCapture(video1_path)
    cap2 = cv2.VideoCapture(video2_path)
    
    if not cap1.isOpened() or not cap2.isOpened():
        raise RuntimeError("Cannot open one or both video files")
    
    fps = cap1.get(cv2.CAP_PROP_FPS)
    h1 = int(cap1.get(cv2.CAP_PROP_FRAME_HEIGHT))
    w1 = int(cap1.get(cv2.CAP_PROP_FRAME_WIDTH))
    h2 = int(cap2.get(cv2.CAP_PROP_FRAME_HEIGHT))
    w2 = int(cap2.get(cv2.CAP_PROP_FRAME_WIDTH))
    
    output_h = max(h1, h2)
    output_w = w1 + w2
    
    # Create temp file
    temp_path = output_path.replace('.mp4', '_temp.mp4')
    fourcc = cv2.VideoWriter_fourcc(*"mp4v")
    out = cv2.VideoWriter(temp_path, fourcc, fps, (output_w, output_h))
    
    frame_count = 0
    while True:
        ret1, frame1 = cap1.read()
        ret2, frame2 = cap2.read()
        
        if not ret1 or not ret2:
            break
        
        if frame1.shape[0] != output_h:
            frame1 = cv2.resize(frame1, (w1, output_h))
        if frame2.shape[0] != output_h:
            frame2 = cv2.resize(frame2, (w2, output_h))
        
        combined = np.hstack((frame1, frame2))
        
        cv2.putText(combined, "ORIGINAL", (10, 30), 
                    cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 255, 0), 2)
        cv2.putText(combined, "WITH DETECTIONS", (w1 + 10, 30), 
                    cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 255, 0), 2)
        
        out.write(combined)
        frame_count += 1
    
    cap1.release()
    cap2.release()
    out.release()
    
    # Small delay to ensure VideoWriter releases the file
    time.sleep(0.3)
    
    # Convert to playable format
    if not convert_with_ffmpeg(temp_path, output_path):
        # If conversion fails, use temp file
        shutil.copy(temp_path, output_path)
    
    # Clean up with retry
    safe_remove_file(temp_path)
    
    if frame_count == 0:
        raise RuntimeError("No frames were written to the combined video")
    
    return output_path

# -----------------------
# RTSP Stream Handler
# -----------------------
class SimpleRTSPHandler:
    def __init__(self, rtsp_url):
        self.rtsp_url = rtsp_url
        self.cap = None
        self.running = False
        self.thread = None
        self.latest_frame = None
        self.latest_timestamp = None
        self.lock = threading.Lock()
        
    def open(self):
        self.cap = cv2.VideoCapture(self.rtsp_url, cv2.CAP_FFMPEG)
        # Only buffer optimization - safe and effective
        self.cap.set(cv2.CAP_PROP_BUFFERSIZE, 1)
        self.cap.set(cv2.CAP_PROP_FPS, 30)
        return self.cap.isOpened()
    
    def capture_thread(self):
        while self.running and self.cap and self.cap.isOpened():
            ret, frame = self.cap.read()
            if ret and frame is not None:
                with self.lock:
                    self.latest_frame = frame
                    self.latest_timestamp = time.time()
            else:
                time.sleep(0.005)
                if self.running:
                    self.reconnect()
    
    def reconnect(self):
        if self.cap:
            self.cap.release()
        time.sleep(0.5)
        self.open()
    
    def start(self):
        if not self.open():
            return False
        self.running = True
        self.thread = threading.Thread(target=self.capture_thread, daemon=True)
        self.thread.start()
        return True
    
    def get_frame(self):
        with self.lock:
            if self.latest_frame is not None:
                return self.latest_frame.copy(), self.latest_timestamp
            return None
    
    def stop(self):
        self.running = False
        if self.thread:
            self.thread.join(timeout=1.0)
        if self.cap:
            self.cap.release()
            self.cap = None

# -----------------------
# EDA Functions
# -----------------------
@st.cache_data
def load_eda_data():
    """Load and cache EDA data"""
    # Load class names
    with open(YAML_PATH, "r") as f:
        data = yaml.safe_load(f)
    
    class_names = data["names"]
    if isinstance(class_names, dict):
        class_names = [class_names[i] for i in range(len(class_names))]
    
    # Count class instances
    class_counts = Counter()
    widths, heights, areas = [], [], []
    
    for label_dir in LABEL_DIRS:
        if not os.path.exists(label_dir):
            continue
        
        for file in os.listdir(label_dir):
            if file.endswith(".txt"):
                with open(os.path.join(label_dir, file), "r") as f:
                    for line in f.readlines():
                        parts = line.strip().split()
                        if len(parts) != 5:
                            continue
                        
                        class_id = int(float(parts[0]))
                        _, _, _, w, h = map(float, parts)
                        
                        class_counts[class_id] += 1
                        widths.append(w)
                        heights.append(h)
                        areas.append(w * h)
    
    return class_names, class_counts, widths, heights, areas

def render_eda_dashboard():
    """Render the EDA dashboard with smaller graphs"""
    st.title("📊 Dataset Exploratory Data Analysis (EDA)")
    
    try:
        # Check if dataset exists
        if not os.path.exists(YAML_PATH):
            st.error(f"❌ Dataset not found at: {DATASET_PATH}")
            st.info("Please ensure your dataset is in the correct location and contains 'data.yaml'")
            return
        
        # Load data
        with st.spinner("Loading dataset information..."):
            class_names, class_counts, widths, heights, areas = load_eda_data()
        
        # ================================
        # CLASS DISTRIBUTION GRAPH - SMALLER
        # ================================
        st.subheader("1️⃣ Class Distribution (Instance-based)")
        
        sorted_items = sorted(class_counts.items(), key=lambda x: x[1], reverse=True)
        classes, counts = zip(*sorted_items)
        labels = [class_names[i] for i in classes]
        
        fig1, ax1 = plt.subplots(figsize=(8, 4))
        ax1.bar(labels, counts, color='skyblue', edgecolor='navy')
        ax1.set_xlabel("Class Name", fontsize=10)
        ax1.set_ylabel("Number of Objects", fontsize=10)
        ax1.set_title("Class Distribution Across Dataset", fontsize=12, fontweight='bold')
        plt.xticks(rotation=45, ha='right', fontsize=8)
        plt.yticks(fontsize=8)
        plt.tight_layout()
        
        st.pyplot(fig1)
        
        # Display counts as table
        with st.expander("📋 View Class Counts"):
            count_data = {"Class": labels, "Count": counts}
            st.dataframe(count_data, width='stretch')
        
        # ================================
        # SIZE CATEGORY GRAPH - SMALLER
        # ================================
        st.subheader("2️⃣ Bounding Box Size Distribution")
        
        size_counts = {"Small (<2%)": 0, "Medium (2-10%)": 0, "Large (>10%)": 0}
        
        for area in areas:
            if area < 0.02:
                size_counts["Small (<2%)"] += 1
            elif area < 0.10:
                size_counts["Medium (2-10%)"] += 1
            else:
                size_counts["Large (>10%)"] += 1
        
        fig2, ax2 = plt.subplots(figsize=(6, 4))
        colors = ['#ff9999', '#66b3ff', '#99ff99']
        bars = ax2.bar(size_counts.keys(), size_counts.values(), color=colors, edgecolor='black')
        ax2.set_xlabel("Object Size Category", fontsize=10)
        ax2.set_ylabel("Number of Objects", fontsize=10)
        ax2.set_title("Object Size Distribution", fontsize=12, fontweight='bold')
        
        # Add value labels on bars
        for bar in bars:
            height = bar.get_height()
            ax2.text(bar.get_x() + bar.get_width()/2., height,
                    f'{int(height)}', ha='center', va='bottom', fontsize=8)
        
        plt.xticks(rotation=0, fontsize=8)
        plt.yticks(fontsize=8)
        plt.tight_layout()
        
        st.pyplot(fig2)
        
        # ================================
        # BOUNDING BOX STATISTICS
        # ================================
        st.subheader("3️⃣ Bounding Box Statistics")
        
        col1, col2, col3, col4 = st.columns(4)
        with col1:
            st.metric("Total Objects", f"{len(areas):,}")
        with col2:
            st.metric("Number of Classes", len(class_names))
        with col3:
            avg_area = np.mean(areas) if areas else 0
            st.metric("Average Box Area", f"{avg_area:.3f}")
        with col4:
            if class_counts:
                max_class = max(class_counts, key=class_counts.get)
                st.metric("Most Common Class", class_names[max_class])
        
        # ================================
        # SAMPLE IMAGE DISPLAY
        # ================================
        st.subheader("4️⃣ Sample Annotated Image")
        
        if os.path.exists(IMAGE_DIR):
            image_files = [f for f in os.listdir(IMAGE_DIR) if f.endswith((".jpg", ".png", ".jpeg"))]
            
            if image_files:
                selected_img = st.selectbox("Select an image to visualize", image_files)
                
                img_path = os.path.join(IMAGE_DIR, selected_img)
                label_path = img_path.replace("images", "labels").replace(".jpg", ".txt").replace(".png", ".txt").replace(".jpeg", ".txt")
                
                img = cv2.imread(img_path)
                if img is not None:
                    h, w, _ = img.shape
                    
                    # Draw bounding boxes
                    if os.path.exists(label_path):
                        with open(label_path, "r") as f:
                            for line in f.readlines():
                                parts = line.strip().split()
                                if len(parts) != 5:
                                    continue
                                
                                cls, x, y, bw, bh = map(float, parts)
                                cls = int(cls)
                                
                                # Convert YOLO format to pixel
                                x1 = int((x - bw/2) * w)
                                y1 = int((y - bh/2) * h)
                                x2 = int((x + bw/2) * w)
                                y2 = int((y + bh/2) * h)
                                
                                # Ensure coordinates are within bounds
                                x1, y1 = max(0, x1), max(0, y1)
                                x2, y2 = min(w, x2), min(h, y2)
                                
                                cv2.rectangle(img, (x1, y1), (x2, y2), (0, 255, 0), 2)
                                cv2.putText(img, class_names[cls], (x1, y1-5),
                                          cv2.FONT_HERSHEY_SIMPLEX, 0.5, (0, 255, 0), 2)
                    
                    # Display image with adjustable size
                    img_rgb = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
                    st.image(img_rgb, caption=f"Annotated: {selected_img}", width='stretch')
                else:
                    st.error("Could not load image")
            else:
                st.warning("No images found in the dataset")
        else:
            st.warning(f"Image directory not found: {IMAGE_DIR}")
        
        # ================================
        # SUMMARY TEXT
        # ================================
        st.subheader("📌 Key Insights")
        
        # Calculate metrics for insights
        total_objects = len(areas)
        small_objects_pct = (size_counts["Small (<2%)"] / total_objects * 100) if total_objects > 0 else 0
        
        st.markdown(f"""
        - **Total objects analyzed:** {total_objects:,}
        - **Number of classes:** {len(class_names)}
        - **Dataset analyzed across:** Train, Validation, and Test splits
        - **Small objects presence:** {small_objects_pct:.1f}% of all objects are small (<2% of image area)
        """)
        
        # Additional recommendations
        with st.expander("💡 Recommendations"):
            if small_objects_pct > 30:
                st.markdown("""
                - **Small Objects:** Consider using higher resolution input (e.g., 1280px) or specialized small-object detection techniques
                - **Data Augmentation:** Apply mosaic and mixup augmentation to improve small object detection
                - **Anchors:** Consider re-clustering anchor boxes to better fit small objects
                """)
            else:
                st.markdown("""
                - Dataset appears well-balanced for object sizes
                - Current configuration should work well for most object sizes
                """)
    
    except Exception as e:
        st.error(f"Error loading EDA data: {str(e)}")
        st.info("Please check that your dataset structure matches the expected format:")
        st.code("""
        C:\\indoor_object_detection\\dataset\\merge_dataset\\
        ├── data.yaml
        ├── train\\
        │   ├── images\\
        │   └── labels\\
        ├── valid\\
        │   ├── images\\
        │   └── labels\\
        └── test\\
            ├── images\\
            └── labels\\
        """)

# -----------------------
# Training Results Functions
# -----------------------
def render_training_results():
    """Render the training results dashboard with better quality images"""
    st.title("📈 Custom Model Training Results")
    
    if not RESULT_DIR.exists():
        st.error(f"❌ Folder not found: {RESULT_DIR}")
        st.info("Please ensure your training results folder exists at the specified path")
        return
    
    def show_if_exists(title: str, filename: str, caption: str | None = None):
        file_path = RESULT_DIR / filename
        if file_path.exists():
            st.subheader(title)
            # Remove width parameter to show full quality
            st.image(str(file_path), caption=caption or filename, use_container_width=True)
    
    # =========================
    # 1. Main summary graphs
    # =========================
    st.header("1. Main Result Graphs")
    
    show_if_exists("Training Summary", "results.png")
    show_if_exists("mAP Curve", "map_curve.png")
    show_if_exists("Label Distribution", "labels.jpg")
    
    # =========================
    # 2. Evaluation curves
    # =========================
    st.header("2. Evaluation Curves")
    
    col1, col2 = st.columns(2)
    
    with col1:
        show_if_exists("Precision Curve", "BoxP_curve.png")
        show_if_exists("F1 Curve", "BoxF1_curve.png")
    
    with col2:
        show_if_exists("Recall Curve", "BoxR_curve.png")
        show_if_exists("Precision-Recall Curve", "BoxPR_curve.png")
    
    # =========================
    # 3. Confusion matrices
    # =========================
    st.header("3. Confusion Matrix")
    
    col3, col4 = st.columns(2)
    
    with col3:
        show_if_exists("Confusion Matrix", "confusion_matrix.png")
    
    with col4:
        show_if_exists("Normalized Confusion Matrix", "confusion_matrix_normalized.png")
    
    # =========================
    # 4. Training batch samples
    # =========================
    st.header("4. Training Batch Samples")
    
    train_images = sorted(RESULT_DIR.glob("train_batch*.jpg"))
    if train_images:
        # Display in 2 columns without fixed width
        for i in range(0, len(train_images), 2):
            cols = st.columns(2)
            for j, img in enumerate(train_images[i:i+2]):
                with cols[j]:
                    st.image(str(img), caption=img.name, use_container_width=True)
    else:
        st.info("No training batch images found")
    
    # =========================
    # 5. Validation predictions
    # =========================
    st.header("5. Validation Results")
    
    val_label_images = sorted(RESULT_DIR.glob("val_batch*_labels.jpg"))
    val_pred_images = sorted(RESULT_DIR.glob("val_batch*_pred.jpg"))
    
    if val_label_images and val_pred_images:
        for label_img, pred_img in zip(val_label_images, val_pred_images):
            c1, c2 = st.columns(2)
            with c1:
                st.image(str(label_img), caption=f"Ground Truth: {label_img.name}", use_container_width=True)
            with c2:
                st.image(str(pred_img), caption=f"Predictions: {pred_img.name}", use_container_width=True)
            st.markdown("---")
    else:
        st.info("No validation result images found")

# -----------------------
# UI - Sidebar Mode Selection
# -----------------------
st.title("IndoorVision — Streamlit")

# Sidebar for mode selection
with st.sidebar:
    st.markdown("## 🎯 Mode Selection")
    st.markdown("---")
    
    main_mode = st.radio(
        "Select Main Mode",
        ["🔍 Object Detection", "📊 EDA Dashboard", "📈 Training Results"],
        index=["🔍 Object Detection", "📊 EDA Dashboard", "📈 Training Results"].index(st.session_state.main_mode),
        key="main_mode"
    )
    
    st.markdown("---")
    
    if main_mode == "🔍 Object Detection":
        detection_mode = st.radio(
            "Detection Mode",
            ["📤 Upload Video", "📹 RTSP Live Stream"],
            index=0,
            key="detection_mode"
        )
    
    st.markdown("---")
    st.caption("IndoorVision v1.0")

# Main content based on selection
if main_mode == "🔍 Object Detection":
    # This is Mode 1 with two choices (Upload Video and RTSP)
    if detection_mode == "📤 Upload Video":
        # =========================================================
        # UPLOAD VIDEO SECTION (COMPLETELY UNCHANGED)
        # =========================================================
        st.subheader("Upload a video → detect objects → show labeled output video")
        
        # Add display option
        display_option = st.radio(
            "Display Mode",
            ["Side by Side (Original + Detection)", "Detection Only"],
            horizontal=True,
            help="Choose how to display the processed video"
        )
        
        colA, colB = st.columns([1, 1])

        with colA:
            uploaded = st.file_uploader("Upload MP4 video", type=["mp4", "mov", "m4v", "avi"])
            conf = st.slider("Confidence", 0.05, 0.90, float(CONF_THRES), 0.05)
            imgsz = st.selectbox("Image Size (imgsz)", [416, 512, 640, 768, 896], index=2)
            
            # Create two columns for buttons side by side
            col_btn1, col_btn2 = st.columns(2)
            
            with col_btn1:
                run_btn = st.button("🚀 Run Detection", type="primary", width='stretch', disabled=(uploaded is None))
            
            with col_btn2:
                # Only show clear button when results exist
                if st.session_state.processed_videos.get('has_data', False):
                    if st.button("🗑️ Clear Results", type="secondary", width='stretch', key="clear_results_btn"):
                        st.session_state.processed_videos = {}
                        st.rerun()
                else:
                    # Placeholder to maintain layout when button is hidden
                    st.empty()

        with colB:
            st.markdown("**Tips**")
            st.markdown("- **Side by Side** view shows original video next to detection results")
            st.markdown("- **Detection Only** shows only the annotated video")
            st.markdown("- If it's slow, try smaller **imgsz** or higher **confidence**")
            if torch.cuda.is_available():
                st.info("🚀 GPU acceleration is ENABLED")

        # Store processed videos in session state
        if "processed_videos" not in st.session_state:
            st.session_state.processed_videos = {}
        
        if run_btn and uploaded is not None:
            with tempfile.TemporaryDirectory() as td:
                td = Path(td)
                in_path = td / "input.mp4"
                
                # Create paths for output videos
                out_path_original = td / "original_video.mp4"
                out_path_detected = td / "detected_video.mp4"

                in_path.write_bytes(uploaded.read())

                prog = st.progress(0.0, text="Processing video...")
                try:
                    if display_option == "Side by Side (Original + Detection)":
                        # Process videos separately
                        process_video_side_by_side_separate(
                            str(in_path),
                            str(out_path_original),
                            str(out_path_detected),
                            conf=conf,
                            imgsz=imgsz,
                            progress_cb=lambda p: prog.progress(p, text=f"Processing... {int(p*100)}%")
                        )
                        st.success("✅ Detection completed!")
                        
                        # Read video files and store in session state
                        with open(out_path_original, 'rb') as f:
                            st.session_state.processed_videos['original'] = f.read()
                        with open(out_path_detected, 'rb') as f:
                            st.session_state.processed_videos['detected'] = f.read()
                        
                        # Create combined video
                        with st.spinner("🔄 Creating side-by-side comparison video..."):
                            combined_path = td / "combined_video.mp4"
                            create_combined_video(
                                str(out_path_original), 
                                str(out_path_detected), 
                                str(combined_path),
                            )
                        
                        with open(combined_path, 'rb') as f:
                            st.session_state.processed_videos['combined'] = f.read()
                        
                        st.session_state.processed_videos['has_data'] = True
                        st.session_state.processed_videos['mode'] = 'side_by_side'
                        
                    else:  # Detection Only mode
                        process_video_standard(
                            str(in_path),
                            str(out_path_detected),
                            conf=conf,
                            imgsz=imgsz,
                            progress_cb=lambda p: prog.progress(p, text=f"Processing... {int(p*100)}%")
                        )
                        st.success("✅ Detection completed!")
                        
                        with open(out_path_detected, 'rb') as f:
                            st.session_state.processed_videos['detected'] = f.read()
                        
                        st.session_state.processed_videos['has_data'] = True
                        st.session_state.processed_videos['mode'] = 'detection_only'
                    
                    prog.progress(1.0, text="Done!")
                    st.rerun()  # Force rerun to show the clear button immediately
                    
                except Exception as e:
                    st.error(f"❌ Processing failed: {str(e)}")
                    st.info("💡 Possible solutions:\n"
                            "- Check video file format (MP4 recommended)\n"
                            "- Try reducing Image Size (imgsz)\n"
                            "- Check available disk space")
                    st.session_state.processed_videos['has_data'] = False
                    import traceback
                    with st.expander("Technical details"):
                        st.code(traceback.format_exc())
        
        # Display processed videos from session state (persists across reruns)
        if st.session_state.processed_videos.get('has_data', False):
            mode = st.session_state.processed_videos.get('mode')
            
            if mode == 'side_by_side':
                # Display combined video with size control
                st.markdown("### 📊 Comparison View (Perfectly Synchronized)")
                st.markdown("**⬅️ Original Video | Video with Detections ➡️**")

                # Add a width control slider
                video_width = st.slider(
                    "Video Display Width", 
                    min_value=400, 
                    max_value=1400, 
                    value=800, 
                    step=50,
                    key="video_width_slider",
                    help="Adjust the display size (does NOT affect quality)"
                )

                # Display combined video
                combined_video_bytes = st.session_state.processed_videos.get('combined')
                if combined_video_bytes:
                    import base64
                    video_base64 = base64.b64encode(combined_video_bytes).decode()
                    st.markdown(f'''
                        <video width="{video_width}" controls autoplay loop muted playsinline style="border-radius: 8px;">
                            <source src="data:video/mp4;base64,{video_base64}" type="video/mp4">
                            Your browser does not support the video tag.
                        </video>
                    ''', unsafe_allow_html=True)
                    st.caption("💡 Use the slider above to adjust display size. Video quality remains unchanged.")
                
                # Download options
                st.markdown("---")
                st.markdown("### 📥 Download Options")
                
                col_download1, col_download2, col_download3 = st.columns(3)
                with col_download1:
                    original_bytes = st.session_state.processed_videos.get('original')
                    if original_bytes:
                        st.download_button(
                            "📥 Original Video", 
                            data=original_bytes,
                            file_name="original_video.mp4", 
                            mime="video/mp4",
                            width='stretch',
                            key="download_original"
                        )
                with col_download2:
                    detected_bytes = st.session_state.processed_videos.get('detected')
                    if detected_bytes:
                        st.download_button(
                            "📥 Detection Video", 
                            data=detected_bytes,
                            file_name="detected_video.mp4", 
                            mime="video/mp4",
                            width='stretch',
                            key="download_detected"
                        )
                with col_download3:
                    combined_bytes = st.session_state.processed_videos.get('combined')
                    if combined_bytes:
                        st.download_button(
                            "📥 Combined Video", 
                            data=combined_bytes,
                            file_name="side_by_side_comparison.mp4", 
                            mime="video/mp4",
                            width='stretch',
                            key="download_combined"
                        )
            
            elif mode == 'detection_only':
                # Display detection only video
                st.markdown("### 🔍 Detection Result")
                
                # Add width control for detection only mode
                video_width = st.slider(
                    "Video Display Width", 
                    min_value=400, 
                    max_value=1400, 
                    value=800, 
                    step=50,
                    key="video_width_slider_detection",
                    help="Adjust the display size"
                )
                
                detected_bytes = st.session_state.processed_videos.get('detected')
                if detected_bytes:
                    import base64
                    video_base64 = base64.b64encode(detected_bytes).decode()
                    st.markdown(f'''
                        <video width="{video_width}" controls autoplay loop muted playsinline style="border-radius: 8px;">
                            <source src="data:video/mp4;base64,{video_base64}" type="video/mp4">
                            Your browser does not support the video tag.
                        </video>
                    ''', unsafe_allow_html=True)
                
                st.download_button(
                    "Download annotated video", 
                    data=detected_bytes,
                    file_name="annotated_output.mp4", 
                    mime="video/mp4",
                    width='stretch',
                    key="download_annotated"
                )
    
    else:  # RTSP Live Stream
        # =========================================================
        # RTSP LIVE STREAM SECTION (COMPLETELY UNCHANGED)
        # =========================================================
        # Add performance presets
        st.markdown("### Performance Mode")
        perf_mode = st.radio(
            "Select Speed Preference",
            ["🚀 Fastest (Low Latency)", "⚖️ Balanced", "🎯 Best Quality"],
            horizontal=True,
            help="Fastest = 320px inference, Balanced = 416px, Best Quality = 640px"
        )
        
        # Set values based on performance mode
        if perf_mode == "🚀 Fastest (Low Latency)":
            default_inference = 320
            default_display = 350
            st.info("⚡ Fastest mode: 320px inference size for minimal latency")
        elif perf_mode == "⚖️ Balanced":
            default_inference = 416
            default_display = 400
            st.info("⚖️ Balanced mode: 416px inference size for good quality/speed")
        else:
            default_inference = 640
            default_display = 450
            st.info("🎯 Best quality mode: 640px inference size (higher latency)")
        
        # Controls
        col1, col2, col3 = st.columns(3)
        with col1:
            conf2 = st.slider("Confidence", 0.05, 0.90, 0.35, 0.05)
        with col2:
            imgsz2 = st.selectbox("Inference Size", [224, 320, 416, 512, 640], 
                                 index=[224, 320, 416, 512, 640].index(default_inference),
                                 help="Smaller = Faster AI processing. 320ms is best for low latency")
        with col3:
            display_options = [250, 300, 350, 400, 450, 500, 550, 600, 650]
            display_width = st.selectbox(
                "Display Size",
                display_options,
                index=display_options.index(default_display),
                help="How large the video appears"
            )
        
        # Add frame skipping option for high latency situations
        st.markdown("### Latency Optimization")
        col_skip1, col_skip2 = st.columns(2)
        with col_skip1:
            process_every_n = st.selectbox("Process every N frames", [1, 2, 3, 5], index=0,
                                           help="1=every frame (smoothest), 2=every other frame (faster)")
        with col_skip2:
            auto_adjust = st.checkbox("Auto-adjust for low latency", value=True,
                                     help="Automatically reduces inference size if latency > 100ms")
        
        st.markdown("### RTSP Settings")
        
        rtsp_host = st.text_input("Camera IP", value="172.16.14.165")
        rtsp_port = st.text_input("Port", value="8554")
        rtsp_path = st.text_input("Stream Path", value="/live")
        rtsp_user = st.text_input("Username", value="admin")
        rtsp_pass = st.text_input("Password", value="12345", type="password")
        
        # Build RTSP URL
        if rtsp_user and rtsp_pass:
            rtsp_url = f"rtsp://{rtsp_user}:{rtsp_pass}@{rtsp_host}:{rtsp_port}{rtsp_path}"
        else:
            rtsp_url = f"rtsp://{rtsp_host}:{rtsp_port}{rtsp_path}"
        
        st.caption(f"RTSP URL: {rtsp_url.replace(rtsp_pass,'******')}")
        
        start = st.button("🚀 START STREAM", type="primary")
        stop = st.button("⏹️ STOP", type="secondary")
        
        if start:
            if st.session_state.stream_handler:
                st.session_state.stream_handler.stop()
            st.session_state.stream_handler = SimpleRTSPHandler(rtsp_url)
            if st.session_state.stream_handler.start():
                st.session_state.live_run = True
                st.rerun()
            else:
                st.error("Failed to connect to RTSP stream")
        
        if stop:
            st.session_state.live_run = False
            if st.session_state.stream_handler:
                st.session_state.stream_handler.stop()
                st.session_state.stream_handler = None
            st.rerun()
        
        # Only show the side-by-side layout when stream is active
        if st.session_state.live_run and st.session_state.stream_handler:
            # Add custom CSS to reduce gaps
            st.markdown("""
                <style>
                .row-widget.stHorizontal {
                    gap: 0.5rem !important;
                }
                .stColumn {
                    padding-left: 0.2rem !important;
                    padding-right: 0.2rem !important;
                }
                </style>
            """, unsafe_allow_html=True)
            
            # Create two columns
            col_video, col_performance = st.columns([2.5, 2.5])
            
            with col_video:
                st.markdown("### 📹 Live Stream")
                frame_box = st.empty()
            
            with col_performance:
                # Create a placeholder for the performance panel
                perf_placeholder = st.empty()
            
            # RTSP processing loop
            device = 'cuda' if torch.cuda.is_available() else 'cpu'
            frame_count = 0
            inference_times = deque(maxlen=30)
            total_times = deque(maxlen=30)
            target_size = imgsz2
            
            # FPS calculation
            fps_counter = 0
            fps_timer = time.time()
            current_fps = 0
            
            # For frame skipping
            process_counter = 0
            
            # Store last frame
            last_frame = None
            res = None 
            detection_count = 0 
            
            while st.session_state.live_run:
                loop_start = time.time()
                
                # Get frame with its actual capture timestamp
                frame, frame_timestamp = st.session_state.stream_handler.get_frame()
                if frame is None:
                    time.sleep(0.001)
                    continue

                # Use the frame's actual capture time (not current time!)
                frame_capture_time = frame_timestamp  
                
                # Apply fixed rotation (90° Clockwise)
                frame = cv2.rotate(frame, cv2.ROTATE_90_CLOCKWISE)

                # DOWNSCALE FRAME
                scale_percent = 50  # Reduce to 50% size
                width = int(frame.shape[1] * scale_percent / 100)
                height = int(frame.shape[0] * scale_percent / 100)
                frame = cv2.resize(frame, (width, height))
                
                # Get resolution
                frame_h, frame_w = frame.shape[:2]
                
                # Auto-adjust inference size if latency is too high
                if auto_adjust and frame_count > 30 and len(total_times) > 0:
                    avg_latency_check = sum(total_times) / len(total_times)
                    if avg_latency_check > 100 and target_size > 320:
                        target_size = 320
                    elif avg_latency_check < 50 and target_size < imgsz2 and target_size < 416:
                        target_size = min(imgsz2, 416)
                
                # Frame skipping logic
                process_counter += 1
                skip_frame = process_counter < process_every_n
                
                if not skip_frame:
                    process_counter = 0
                    
                    # Resize for faster inference
                    h, w = frame.shape[:2]
                    if max(h, w) > target_size:
                        scale = target_size / max(h, w)
                        new_w = int(w * scale)
                        new_h = int(h * scale)
                        frame_small = cv2.resize(frame, (new_w, new_h))
                        scale_x = w / new_w
                        scale_y = h / new_h
                    else:
                        frame_small = frame
                        scale_x = 1.0
                        scale_y = 1.0
                    
                    # Run inference
                    inference_start = time.time()
                    res = model.predict(frame_small, imgsz=target_size, conf=conf2, 
                                      verbose=False, device=device)[0]
                    inference_time = (time.time() - inference_start) * 1000
                    
                    # Draw boxes
                    frame_with_boxes = draw_detections_with_scale(frame, res, scale_x, scale_y)
                    last_frame = frame_with_boxes
                else:
                    # Use last processed frame
                    if last_frame is not None:
                        frame_with_boxes = last_frame
                    else:
                        frame_with_boxes = frame
                    inference_time = 0     
                
                # Calculate FPS
                fps_counter += 1
                if time.time() - fps_timer >= 1.0:
                    current_fps = fps_counter / (time.time() - fps_timer)
                    fps_counter = 0
                    fps_timer = time.time()
                
                # Update video display
                frame_rgb = cv2.cvtColor(frame_with_boxes, cv2.COLOR_BGR2RGB)
                display_start = time.time()
                frame_box.image(frame_rgb, width=display_width)
                total_latency = (display_start - frame_capture_time) * 1000
                
                if not skip_frame:
                    inference_times.append(inference_time)
                    total_times.append(total_latency)  # Use the new total_latency
                
                # Calculate averages
                avg_inference = sum(inference_times) / len(inference_times) if inference_times else 0
                avg_latency = sum(total_times) / len(total_times) if total_times else 0
                if not skip_frame and res is not None and res.boxes is not None:
                    detection_count = len(res.boxes)
                
                # Status text and colors
                if avg_inference < 30:
                    inf_text = "Fast"
                    inf_class = "good"
                elif avg_inference < 60:
                    inf_text = "OK"
                    inf_class = "warn"
                else:
                    inf_text = "Slow"
                    inf_class = "bad"

                if avg_latency < 50:
                    lat_text = "Excellent"
                    lat_class = "good"
                elif avg_latency < 100:
                    lat_text = "Acceptable"
                    lat_class = "warn"
                else:
                    lat_text = "High"
                    lat_class = "bad"
                
                # Update the performance panel
                perf_placeholder.markdown(f"""
                <style>
                .perf-panel {{
                    background: #ffffff;
                    border: 1px solid #e5e7eb;
                    border-radius: 16px;
                    padding: 20px;
                    margin-top: 50px;
                    box-shadow: 0 1px 3px rgba(0,0,0,0.06);
                }}
                .perf-title {{
                    font-size: 22px;
                    font-weight: 700;
                    margin-bottom: 18px;
                    color: #111827;
                }}
                .perf-grid {{
                    display: grid;
                    grid-template-columns: 1fr 1fr;
                    gap: 15px;
                }}
                .perf-card {{
                    background: #f9fafb;
                    border: 1px solid #e5e7eb;
                    border-radius: 12px;
                    padding: 14px;
                }}
                .perf-label {{
                    font-size: 13px;
                    color: #6b7280;
                    margin-bottom: 6px;
                }}
                .perf-value {{
                    font-size: 24px;
                    font-weight: 700;
                    color: #111827;
                    line-height: 1.2;
                }}
                .perf-value.small {{
                    font-size: 18px;
                }}
                .perf-note {{
                    margin-top: 6px;
                    font-size: 12px;
                    font-weight: 600;
                }}
                .good {{ color: #16a34a; }}
                .warn {{ color: #d97706; }}
                .bad  {{ color: #dc2626; }}
                .badge {{
                    display: inline-block;
                    padding: 4px 10px;
                    border-radius: 999px;
                    background: #dcfce7;
                    color: #166534;
                    font-size: 12px;
                    font-weight: 700;
                }}
                </style>

                <div class="perf-panel">
                    <div class="perf-title">📊 Live Performance</div>
                    <div class="perf-grid">
                        <div class="perf-card">
                            <div class="perf-label">FPS</div>
                            <div class="perf-value">{current_fps:.1f}</div>
                        </div>
                        <div class="perf-card">
                            <div class="perf-label">Inference</div>
                            <div class="perf-value">{avg_inference:.1f} ms</div>
                            <div class="perf-note {inf_class}">{inf_text}</div>
                        </div>
                        <div class="perf-card">
                            <div class="perf-label">Latency</div>
                            <div class="perf-value">{avg_latency:.1f} ms</div>
                            <div class="perf-note {lat_class}">{lat_text}</div>
                        </div>
                        <div class="perf-card">
                            <div class="perf-label">Detections</div>
                            <div class="perf-value">{detection_count}</div>
                        </div>
                        <div class="perf-card">
                            <div class="perf-label">Frames</div>
                            <div class="perf-value">{frame_count}</div>
                        </div>
                        <div class="perf-card">
                            <div class="perf-label">AI Size</div>
                            <div class="perf-value">{target_size}px</div>
                        </div>
                        <div class="perf-card">
                            <div class="perf-label">Resolution</div>
                            <div class="perf-value small">{frame_w}×{frame_h}</div>
                        </div>
                        <div class="perf-card">
                            <div class="perf-label">Status</div>
                            <div class="perf-value small"><span class="badge">Active</span></div>
                        </div>
                    </div>
                </div>
                """, unsafe_allow_html=True)
                
                frame_count += 1
                if frame_count > 999999:
                    frame_count = 0
            
            # Cleanup
            if st.session_state.stream_handler:
                st.session_state.stream_handler.stop()
                st.session_state.stream_handler = None
            frame_box.empty()

        elif not st.session_state.live_run:
            st.info("⏸️ Stream stopped. Click 'START STREAM' to begin.")
            if st.session_state.stream_handler:
                st.session_state.stream_handler.stop()
                st.session_state.stream_handler = None

elif main_mode == "📊 EDA Dashboard":
    render_eda_dashboard()

else:  # Training Results
    render_training_results()