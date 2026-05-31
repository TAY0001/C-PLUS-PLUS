import streamlit as st
import PyPDF2
import pikepdf
import os
import nltk
from nltk.corpus import stopwords
from dotenv import load_dotenv
from PyPDF2 import PdfReader
from transformers import AutoModelForCausalLM, AutoTokenizer, Trainer, TrainingArguments, DataCollatorForLanguageModeling
from langchain.text_splitter import CharacterTextSplitter
from langchain_community.embeddings import HuggingFaceInstructEmbeddings
from langchain_community.vectorstores import FAISS
from langchain_community.llms import HuggingFaceHub
from langchain.llms import HuggingFaceHub
from langchain.memory import ConversationBufferMemory
from langchain.chains import ConversationalRetrievalChain
from htmlDesign import css, bot_template, user_template
from sklearn.metrics.pairwise import cosine_similarity
from sentence_transformers import SentenceTransformer
import re 
import string
from nltk.tokenize import word_tokenize
from spellchecker import SpellChecker
import spacy
import time
import pandas as pd
from transformers import GPT2Tokenizer, GPT2LMHeadModel, Trainer, TrainingArguments, DataCollatorForLanguageModeling
from datasets import Dataset
from typing import List
import torch
from transformers import T5Tokenizer, T5ForConditionalGeneration, Trainer, TrainingArguments, DataCollatorForSeq2Seq
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.metrics.pairwise import cosine_similarity
from nltk.translate.bleu_score import sentence_bleu, SmoothingFunction
from sentence_transformers import SentenceTransformer
import optuna
from sklearn.feature_extraction.text import TfidfVectorizer
import threading
from langchain.llms import HuggingFaceEndpoint

api_token = os.getenv("HUGGINGFACEHUB_API_TOKEN")
os.environ['CUDA_LAUNCH_BLOCKING'] = '1'
os.environ['TORCH_USE_CUDA_DSA'] = '1'

nlp = spacy.load("en_core_web_sm")
nltk.download('punkt_tab')
nltk.download('stopwords')

def get_stopwords(language='english'):
    return set(stopwords.words("english"))


def clean_text(text: str) -> str:
    text = text.lower()
    text = re.sub(r'[^a-zA-S\s]', '', text)
    text = re.sub(r'\s+', ' ', text).strip()
    return text

def remove_punctuation(text: str) -> str:
    translator = str.maketrans('', '', string.punctuation)
    return text.translate(translator)

def remove_stopwords(text: str, stop_words: set) -> str:
    words = word_tokenize(text)
    filtered_words = [word for word in words if word not in stop_words]
    return ' '.join(filtered_words)

def lemmatize_text(text: str, nlp) -> str:
    doc = nlp(text)
    lemmatized_words = [token.lemma_ for token in doc if not token.is_punct and not token.is_space]
    return ' '.join(lemmatized_words)

from spellchecker import SpellChecker

def correct_spelling(text):
    spell = SpellChecker()
    words = text.split()  
    corrected_words = []
    for word in words:
        corrected_word = spell.correction(word)  
        corrected_words.append(corrected_word if corrected_word is not None else word)
    corrected_input = ' '.join(corrected_words)
    return corrected_input

def get_pdfs_text(pdf_files):
    full_text = ""
    for pdf_file in pdf_files:
        try:
            pdf_reader = PyPDF2.PdfReader(pdf_file)
            for page in pdf_reader.pages:
                page_text = page.extract_text()
                full_text += page_text + "\n"
                full_text = full_text.replace('\n', ' ')  
                full_text = re.sub(r'(?<=\w)-\s*(?=\w)', '', full_text)  
        except Exception as e:
            print(f"Error extracting PDF text with PyPDF2: {e}")
            print("Attempting to fix the PDF using pikepdf...")
            try:
                with pikepdf.open(pdf_file) as pdf:
                    repaired_path = "repaired_" + os.path.basename(pdf_file.name)
                    pdf.save(repaired_path)
                print(f"PDF repaired and saved to {repaired_path}. Attempting extraction again.")
                with open(repaired_path, 'rb') as file:
                    pdf_reader = PdfReader(file)
                    for page in pdf_reader.pages:
                        page_text = page.extract_text()
                        full_text += page_text + "\n"
            except Exception as repair_error:
                print(f"Error during PDF repair: {repair_error}")
    return full_text

def extract_entities(user_input):
    doc = nlp(user_input)
    entities = [(entity.text, entity.label_) for entity in doc.ents]
    return entities

def handle_negations(user_input):
    negation_words = ["not", "no", "never", "n't"]
    negated = False
    user_input = user_input.lower()
    
    for word in negation_words:
        if word in user_input:
            negated = True
            break

    return negated

def prepare_input(input_text: str, language='english') -> dict:
    try:
        print("Step 1: Setting stopwords...")
        stop_words = get_stopwords(language)

        print("Step 2: Validating input text...")
        if not isinstance(input_text, str) or not input_text.strip():
            return {"error": "Input text is empty or invalid."}

        print("Step 3: Cleaning text...")
        cleaned_text = clean_text(input_text)
        print(f"Cleaned text :\n{cleaned_text}...")
        if not cleaned_text.strip():
            return {"error": "Text cleaning resulted in an empty string."}

        print("\nStep 4: Correcting spelling...")
        corrected_text = correct_spelling(cleaned_text)
        print(f"Corrected text:\n{corrected_text}...")

        print("\nStep 5: Removing punctuation...")
        without_punctuation_text = remove_punctuation(corrected_text)
        print(f"Text without punctuation:\n{without_punctuation_text}...")

        print("\nStep 6: Removing stopwords...")
        filtered_text = remove_stopwords(without_punctuation_text, stop_words)
        print(f"Text without stopwords:\n{filtered_text}...")

        print("\nStep 7: Lemmatizing text...")
        lemmatized_text = lemmatize_text(filtered_text, nlp)
        print(f"Lemmatized text:\n{lemmatized_text}...")

        print("\nStep 7: Negation text...")
        negation_text= handle_negations(lemmatized_text)
        print(f"Negation text:\n{negation_text}...")
        

        return {
            "raw_text": input_text,
            "cleaned_text": cleaned_text,
            "corrected_text": corrected_text,
            "without_punctuation_text": without_punctuation_text,
            "filtered_text": filtered_text,
            "lemmatized_text": lemmatized_text,
            "negation_text":negation_text
        }
        
    except Exception as e:
        return {"error": f"An error occurred while processing the text: {e}"}

def prepare_input_demo():
    """Demo function to showcase `prepare_input`."""
    example_text = "Can you help me to analyse the firzt paragraph of the article ,     Rewrite in one paragrah to me ? ? ! "
    
    result = prepare_input(example_text, language='english')
    
    print("\n=== Prepare Input Demo Results ===")
    for key, value in result.items():
        print(f"{key}: {str(value)[:100]}...")


def get_text_chunks(text):
    text_splitter = CharacterTextSplitter(
        separator="\n",
        chunk_size=1000, 
        chunk_overlap=200,
        length_function=len
    )
    chunks = text_splitter.split_text(text)
    return chunks

def get_vectorstore(text_chunks):
    embeddings = HuggingFaceInstructEmbeddings(
        model_name="gpt2",
        model_kwargs={"device": "cuda"}
    )
    embeddings.client.tokenizer.add_special_tokens({'pad_token': '50526'})
    try:
        vectorstore = FAISS.from_texts(
            texts=text_chunks,
            embedding=embeddings
        )
        return vectorstore
    except Exception as e:
        print(f"Error creating vector store: {str(e)}")
        raise
    
def get_repo_id(model_choice):
    model_mapping = {
        "GPT-2": "gpt2",
        "GPT-NEO": "EleutherAI/gpt-neo-125M",
        "T5": "t5-small"
    }
    
    if model_choice not in model_mapping:
        raise ValueError(f"Invalid model choice: {model_choice}. Valid choices are: {list(model_mapping.keys())}")
    
    return model_mapping[model_choice]


def get_conversation_chain(vectorstore, model_choice="GPT-2"):
    try:
        # Initialize the language model (e.g., GPT-2)
        llm = HuggingFaceHub(
            repo_id=get_repo_id(model_choice),
            huggingfacehub_api_token="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",
            temperature=0.7,
            max_length=2048,
            pad_token_id=50256,
            do_sample=True,
            top_k=50,
            top_p=0.95
        )

        memory = ConversationBufferMemory(
            memory_key='chat_history',
            return_messages=True,
            output_key='answer',
            k=5,
            human_prefix="Human (en)",
            ai_prefix="Assistant (en)"
        )

        retriever = vectorstore.as_retriever(
            search_kwargs={
                "k": 5,
                "fetch_k": 10,
                "score_threshold": 0.5
            }
        )

        conversation_chain = ConversationalRetrievalChain.from_llm(
            llm=llm,
            retriever=retriever,
            memory=memory,
            return_source_documents=True,
            verbose=True,
            max_tokens_limit=512,
            chain_type="stuff"
        )

        return conversation_chain

    except Exception as e:
        print(f"Error creating conversation chain: {str(e)}")
        raise

def generate_response(prompt, context, model, tokenizer, max_length=200):
    input_text = f"Context: {context}\n\nQuestion: {prompt}\n\nAnswer:"
    inputs = tokenizer.encode(input_text, return_tensors="pt", max_length=1024, truncation=True)
    outputs = model.generate(
        inputs,
        max_length=max_length,
        num_return_sequences=1,
        temperature=0.7,
        top_k=50,
        top_p=0.9,
        do_sample=True
    )
    response = tokenizer.decode(outputs[0], skip_special_tokens=True)
    return response[len(input_text):].strip()


def summarize_text(text, model, tokenizer, device, max_length=300):
    input_text = "Summarize this: " + text
    inputs = tokenizer.encode(input_text, return_tensors="pt", truncation=True, max_length=1024).to(device)
    outputs = model.generate(
        inputs,
        max_length=max_length,
        num_return_sequences=1,
        temperature=0.7,
        top_k=50,
        top_p=0.9
    )
    summary = tokenizer.decode(outputs[0], skip_special_tokens=True)
    return summary


def count_words(text):
    return len(text.split())

    
def process_text(text, language='english'):
    text = correct_spelling(text)
    text = remove_punctuation(text)
    stop_words = get_stopwords(language)
    text = remove_stopwords(text, stop_words)
    return lemmatize_text(text, nlp)

      
def objective(trial, processed_data):
    tokenizer = GPT2Tokenizer.from_pretrained("gpt2")
    model = GPT2LMHeadModel.from_pretrained("gpt2")

    tokenizer.pad_token = tokenizer.eos_token
    model.config.pad_token_id = model.config.eos_token_id

    lr = trial.suggest_float("lr", 1e-5, 5e-5)
    batch_size = trial.suggest_int("batch_size", 4, 15)
    epochs = trial.suggest_int("epochs", 3, 8)
    weight_decay = trial.suggest_float("weight_decay", 0.0, 0.1)

    def tokenize_function(examples):
        encodings = tokenizer(
            examples["text"],
            truncation=True,
            padding="max_length",
            max_length=512,
            return_tensors="pt"
        )

        encodings['labels'] = encodings['input_ids'].clone()
        return encodings

    if isinstance(processed_data, dict) and 'cleaned_text' in processed_data:
        text_data = processed_data['cleaned_text'] if isinstance(processed_data['cleaned_text'], list) else [processed_data['cleaned_text']]
    elif isinstance(processed_data, pd.DataFrame):
        text_data = processed_data['cleaned_text'].tolist() 
    elif isinstance(processed_data, list):
        text_data = [str(item) for item in processed_data]
    else:
        text_data = [str(processed_data)]
        

    dataset = Dataset.from_dict({"text": text_data})
    tokenized_dataset = dataset.map(tokenize_function, batched=True, remove_columns=dataset.column_names)

    tokenized_dataset.set_format("torch")

    class CustomTrainer(Trainer):
        def __init__(self, *args, **kwargs):
            super().__init__(*args, **kwargs)
            self.training_losses = []

        def compute_loss(self, model, inputs, return_outputs=False, **kwargs):
            inputs = {k: v.to(model.device) for k, v in inputs.items()}

            outputs = model(**inputs)

            loss = outputs.loss

            self.training_losses.append(loss.item())

            return (loss, outputs) if return_outputs else loss

    training_args = TrainingArguments(
        output_dir="./results",
        num_train_epochs=epochs,  
        per_device_train_batch_size=batch_size,
        learning_rate=lr,
        weight_decay=weight_decay,  
        logging_dir='./logs',
        logging_steps=10,
        eval_strategy="no",
        save_strategy="no"
    )

    trainer = CustomTrainer(
        model=model,
        args=training_args,
        train_dataset=tokenized_dataset
    )

    trainer.train()

    if trainer.training_losses:
        return sum(trainer.training_losses) / len(trainer.training_losses)
    else:
        return float('inf')

def format_optuna_results(study):
    trials_df = pd.DataFrame([
        {
            'Trial': trial.number,
            'Learning Rate': trial.params['lr'],
            'Batch Size': trial.params['batch_size'],
            'Epochs':trial.params['epochs'],
            'Weight Decay':trial.params['weight_decay'],
            'Loss': trial.value
        }
        for trial in study.trials
    ])

    trials_df = trials_df.sort_values("Loss").reset_index(drop=True)

    trials_df.insert(0, 'Rank', range(1, len(trials_df) + 1))

    return trials_df


def get_best_hyperparameters(study):
    return {
        'learning_rate': study.best_params['lr'],
        'batch_size': study.best_params['batch_size'],
        'epochs':study.best_params['epochs'],
        'weight_decay':study.best_params['weight_decay']
    }

def print_training_summary(training_args, start_time, end_time, model_name="GPT-2"):
    training_time = end_time - start_time
    print("\n===== Training Summary =====")
    print(f"Model: {model_name}")
    print(f"Training Output Directory: {training_args.output_dir}")
    print(f"Number of Epochs: {training_args.num_train_epochs}")
    print(f"Batch Size: {training_args.per_device_train_batch_size}")
    print(f"Gradient Accumulation Steps: {training_args.gradient_accumulation_steps}")
    print(f"Learning Rate: {training_args.learning_rate}")
    print(f"Weight Decay: {training_args.weight_decay}")
    print(f"FP16 Enabled: {training_args.fp16}")
    print(f"Total Training Time: {training_time:.2f} seconds")
    print("============================\n")


def train_gpt2(
    processed_texts: List[str],
    output_dir="./gpt2_finetuned",
    best_hyperparameters = None
):
    device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
    print(f"Using device: {device}")

    tokenizer = GPT2Tokenizer.from_pretrained("gpt2")
    model = GPT2LMHeadModel.from_pretrained("gpt2").to(device)

    tokenizer.pad_token = tokenizer.eos_token
    model.config.pad_token_id = model.config.eos_token_id
    model.resize_token_embeddings(len(tokenizer))

    def tokenize_function(examples):
        return tokenizer(
            examples["text"],
            truncation=True,
            padding="max_length",
            max_length=128,
            return_tensors="pt"
        )

    dataset = Dataset.from_dict({"text": processed_texts})
    tokenized_dataset = dataset.map(tokenize_function, batched=True, remove_columns=["text"])

    training_args = TrainingArguments(
        output_dir=output_dir,
        overwrite_output_dir=True,
        num_train_epochs=best_hyperparameters['epochs'],
        per_device_train_batch_size=best_hyperparameters['batch_size'],
        gradient_accumulation_steps=4,  
        learning_rate=best_hyperparameters['learning_rate'],
        weight_decay=best_hyperparameters['weight_decay'],
        warmup_steps=500,
        lr_scheduler_type="linear",
        prediction_loss_only=True,
        save_steps=10_000,
        save_total_limit=2,
        logging_dir="./logs",
        logging_steps=500,
        do_train=True,
        do_eval=False,
        fp16=torch.cuda.is_available(), 
        label_smoothing_factor=0.1,
        max_grad_norm=1.0, 
    )

    data_collator = DataCollatorForLanguageModeling(
        tokenizer,
        mlm=False,
        mlm_probability=0.15
    )

    trainer = Trainer(
        model=model,
        args=training_args,
        train_dataset=tokenized_dataset,
        data_collator=data_collator,
    )

    try:
        start_time = time.time()
        trainer.train()
        end_time = time.time()
        print_training_summary(training_args, start_time, end_time, model_name="GPT-2 Fine-tuned")
    except Exception as e:
        print(f"Training interrupted: {e}")


    model.save_pretrained(output_dir)
    tokenizer.save_pretrained(output_dir)

    print(f"GPT-2 fine-tuned model saved to {output_dir}")
    return model, tokenizer

def generate_text_finetuned(prompt, model, tokenizer, max_length=550, temperature=1.0, top_k=50, top_p=0.95):
    device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
    model = model.to(device)

    input_ids = tokenizer.encode(prompt, return_tensors="pt").to(device)
    output = model.generate(
        input_ids,
        max_length=max_length,
        temperature=temperature,
        top_k=top_k,
        top_p=top_p,
        do_sample=True,
    )
    return tokenizer.decode(output[0], skip_special_tokens=True)


def gptneo_objective(trial, processed_data):
    gptneo_model = "EleutherAI/gpt-neo-125M"
    tokenizer = AutoTokenizer.from_pretrained(gptneo_model)
    model = AutoModelForCausalLM.from_pretrained(gptneo_model)

    if tokenizer.pad_token is None:
        tokenizer.pad_token = "[PAD]"
        model.resize_token_embeddings(len(tokenizer))

    lr = trial.suggest_float("lr", 1e-5, 5e-5)
    batch_size = trial.suggest_int("batch_size", 2, 8)
    epochs = trial.suggest_int("epochs", 1, 5)
    weight_decay = trial.suggest_float("weight_decay", 0.0, 0.1)

    if isinstance(processed_data, dict) and 'cleaned_text' in processed_data:
        text_data = processed_data['cleaned_text'] if isinstance(processed_data['cleaned_text'], list) else [processed_data['cleaned_text']]
    elif isinstance(processed_data, pd.DataFrame):
        text_data = processed_data['cleaned_text'].tolist()
    elif isinstance(processed_data, list):
        text_data = [str(item) for item in processed_data]
    else:
        text_data = [str(processed_data)]

    def tokenize_function(examples):
        encodings = tokenizer(
            examples["text"],
            truncation=True,
            padding="max_length",
            max_length=2048,
            return_tensors="pt"
        )
        encodings['labels'] = encodings['input_ids'].clone()
        return encodings

    dataset = Dataset.from_dict({"text": text_data})
    tokenized_dataset = dataset.map(
        tokenize_function,
        batched=True,
        remove_columns=["text"]
    )
    tokenized_dataset.set_format("torch")

    class CustomTrainer(Trainer):
        def __init__(self, *args, **kwargs):
            super().__init__(*args, **kwargs)
            self.training_losses = []

        def compute_loss(self, model, inputs, return_outputs=False, **kwargs):
            inputs = {k: v.to(model.device) for k, v in inputs.items()}

            outputs = model(**inputs)

            loss = outputs.loss

            self.training_losses.append(loss.item())

            return (loss, outputs) if return_outputs else loss

    training_args = TrainingArguments(
        output_dir="./tmp",
        overwrite_output_dir=True,
        num_train_epochs=epochs,
        per_device_train_batch_size=batch_size,
        learning_rate=lr,
        weight_decay=weight_decay,
        logging_dir="./logs",
        logging_steps=500,
        evaluation_strategy="no",
        save_strategy="no",
        fp16=torch.cuda.is_available(),
    )

    trainer = CustomTrainer(
        model=model,
        args=training_args,
        train_dataset=tokenized_dataset,
    )

    try:
        trainer.train()
        final_loss = sum(trainer.training_losses) / len(trainer.training_losses)
    except Exception:
        final_loss = float("inf")

    return final_loss

def optuna_optimization(study):
    print("Best hyperparameters found: ", study.best_params)
    print("Best trial result: ", study.best_value)

    trials_df = format_optuna_results(study)
    trials_df.to_csv("optuna_results.csv", index=False)
    return study.best_params

def the_best_hyperparameters(study):
    best_params = optuna_optimization(study)
    return best_params

def print_training_summary(training_args, start_time, end_time, model_name="GPT-Neo"):
    training_time = end_time - start_time
    print("\n===== Training Summary =====")
    print(f"Model: {model_name}")
    print(f"Training Output Directory: {training_args.output_dir}")
    print(f"Number of Epochs: {training_args.num_train_epochs}")
    print(f"Batch Size: {training_args.per_device_train_batch_size}")
    print(f"Gradient Accumulation Steps: {training_args.gradient_accumulation_steps}")
    print(f"Learning Rate: {training_args.learning_rate}")
    print(f"Weight Decay: {training_args.weight_decay}")
    print(f"FP16 Enabled: {training_args.fp16}")
    print(f"Total Training Time: {training_time:.2f} seconds")
    print("============================\n")

def train_gptneo(processed_data: List[str], output_dir="./gptneo_finetuned", best_hyperparameters=None):
    device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
    print(f"Using device: {device}")

    gptneo_model = "EleutherAI/gpt-neo-125M"
    tokenizer = AutoTokenizer.from_pretrained(gptneo_model)
    model = AutoModelForCausalLM.from_pretrained(gptneo_model).to(device)

    if tokenizer.pad_token is None:
        tokenizer.pad_token = "[PAD]"
        model.resize_token_embeddings(len(tokenizer))

    def tokenize_function(examples):
        return tokenizer(
            examples["text"],
            truncation=True,
            padding="max_length",
            max_length=128,
            return_tensors="pt"
        )

    dataset = Dataset.from_dict({"text": processed_data})
    tokenized_dataset = dataset.map(
        tokenize_function,
        batched=True,
        remove_columns=["text"]
    )
    tokenized_dataset.set_format("torch")

    training_args = TrainingArguments(
        output_dir=output_dir,
        overwrite_output_dir=True,
        num_train_epochs=best_hyperparameters["epochs"],
        per_device_train_batch_size=best_hyperparameters["batch_size"],
        gradient_accumulation_steps=4,
        learning_rate=best_hyperparameters["lr"],
        weight_decay=best_hyperparameters["weight_decay"],
        warmup_steps=500,
        lr_scheduler_type="linear",
        save_steps=10_000,
        save_total_limit=2,
        logging_dir="./logs",
        logging_steps=500,
        fp16=torch.cuda.is_available(),
        label_smoothing_factor=0.1,
        max_grad_norm=1.0,
    )

    data_collator = DataCollatorForLanguageModeling(
        tokenizer=tokenizer,
        mlm=False, 
        mlm_probability=0.15 
    )

    trainer = Trainer(
        model=model,
        args=training_args,
        train_dataset=tokenized_dataset,
        data_collator=data_collator,
    )

    try:
        start_time = time.time()
        trainer.train()
        end_time = time.time()
        print_training_summary(training_args, start_time, end_time, model_name="GPT-Neo")
    except Exception as e:
        print(f"Training interrupted: {e}")

    model.save_pretrained(output_dir)
    tokenizer.save_pretrained(output_dir)
    print(f"GPT-Neo fine-tuned model saved to {output_dir}")

    return model, tokenizer

def t5_objective(trial, processed_data):
    tokenizer = T5Tokenizer.from_pretrained("t5-small", legacy=True)
    model = T5ForConditionalGeneration.from_pretrained("t5-small")
    model.config.use_cache = False

    tokenizer.pad_token = tokenizer.eos_token
    model.config.pad_token_id = model.config.eos_token_id

    lr = trial.suggest_float("lr", 1e-5, 5e-5)
    batch_size = trial.suggest_int("batch_size", 4, 16)
    epochs = trial.suggest_int("epochs", 3, 10)
    weight_decay = trial.suggest_float("weight_decay", 0.0, 0.1)

    def tokenize_function(examples):
        inputs = [f"summarize: {text}" for text in examples["text"]]  
        encodings = tokenizer(
            inputs,
            truncation=True,
            padding="max_length",
            max_length=512,
            return_tensors="pt"
        )

        labels = tokenizer(
            examples["text"], 
            truncation=True,
            padding="max_length",
            max_length=128,
            return_tensors="pt"
        ).input_ids

        labels[labels == tokenizer.pad_token_id] = -100
        encodings["labels"] = labels
        return encodings

    if isinstance(processed_data, dict) and 'cleaned_text' in processed_data:
        text_data = processed_data['cleaned_text'] if isinstance(processed_data['cleaned_text'], list) else [processed_data['cleaned_text']]
    elif isinstance(processed_data, pd.DataFrame):
        text_data = processed_data['cleaned_text'].tolist()  
    elif isinstance(processed_data, list):
        text_data = [str(item) for item in processed_data]
    else:
        text_data = [str(processed_data)]

    dataset = Dataset.from_dict({"text": text_data})
    tokenized_dataset = dataset.map(tokenize_function, batched=True, remove_columns=dataset.column_names)

    tokenized_dataset.set_format("torch")

    class CustomTrainer(Trainer):
        def __init__(self, *args, **kwargs):
            super().__init__(*args, **kwargs)
            self.training_losses = []

        def compute_loss(self, model, inputs, return_outputs=False, **kwargs):
            inputs = {k: v.to(model.device) for k, v in inputs.items()}

            outputs = model(**inputs)

            loss = outputs.loss

            self.training_losses.append(loss.item())

            return (loss, outputs) if return_outputs else loss

    training_args = TrainingArguments(
        output_dir="./results",
        num_train_epochs=epochs, 
        per_device_train_batch_size=batch_size,
        learning_rate=lr,
        weight_decay=weight_decay,  
        logging_dir='./logs',
        logging_steps=10,
        eval_strategy="no",
        save_strategy="no"
    )

    trainer = CustomTrainer(
        model=model,
        args=training_args,
        train_dataset=tokenized_dataset
    )

    trainer.train()

    if trainer.training_losses:
        return sum(trainer.training_losses) / len(trainer.training_losses)
    else:
        return float('inf')
    
def format_optuna_results_t5(study):
    trials_df = pd.DataFrame([
        {
            'Trial': trial.number,
            'Learning Rate': trial.params['lr'],
            'Batch Size': trial.params['batch_size'],
            'Epochs':trial.params['epochs'],
            'Weight Decay':trial.params['weight_decay'],
            'Loss': trial.value,
            'Duration (s)': trial.duration.total_seconds() 
        }
        for trial in study.trials
    ])

    trials_df = trials_df.sort_values("Loss").reset_index(drop=True)

    trials_df.insert(0, 'Rank', range(1, len(trials_df) + 1))

    return trials_df


def best_hyperparameters_t5(study):
    try:
        best_params = study.best_params
        return {
            'learning_rate': best_params.get('lr', None),
            'batch_size': best_params.get('batch_size', None),
            'epochs': best_params.get('epochs', None),
            'weight_decay': best_params.get('weight_decay', None)
        }
    except Exception as e:
        print(f"Error retrieving best hyperparameters: {e}")
        return {}
    
def print_training_summary(training_args, start_time, end_time, model_name="t5-small"):
    training_time = end_time - start_time
    print("\n===== Training Summary =====")
    print(f"Model: {model_name}")
    print(f"Training Output Directory: {training_args.output_dir}")
    print(f"Number of Epochs: {training_args.num_train_epochs}")
    print(f"Batch Size: {training_args.per_device_train_batch_size}")
    print(f"Gradient Accumulation Steps: {training_args.gradient_accumulation_steps}")
    print(f"Learning Rate: {training_args.learning_rate}")
    print(f"Weight Decay: {training_args.weight_decay}")
    print(f"FP16 Enabled: {training_args.fp16}")
    print(f"Total Training Time: {training_time:.2f} seconds")
    print("============================\n")

def train_t5(
    processed_texts: List[str],
    output_dir="./t5_finetuned",
    best_hyperparameters=None
):
    device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
    print(f"Using device: {device}")

    tokenizer = T5Tokenizer.from_pretrained("t5-small", legacy=True)
    model = T5ForConditionalGeneration.from_pretrained("t5-small").to(device)
    model.config.use_cache = False

    tokenizer.pad_token = tokenizer.eos_token
    model.config.pad_token_id = model.config.eos_token_id
    model.resize_token_embeddings(len(tokenizer))

    def tokenize_function(examples):
        inputs = [f"task: {text}" for text in examples["text"]] 
        encodings = tokenizer(
            inputs,
            truncation=True,
            padding="max_length",
            max_length=512,
            return_tensors="pt"
        )

        labels = tokenizer(
            examples["text"],
            truncation=True,
            padding="max_length",
            max_length=128,
            return_tensors="pt"
        ).input_ids

        labels[labels == tokenizer.pad_token_id] = -100
        encodings["labels"] = labels
        return encodings

    dataset = Dataset.from_dict({"text": processed_texts})
    tokenized_dataset = dataset.map(tokenize_function, batched=True, remove_columns=["text"])
    
    training_hyperparameters = best_hyperparameters.copy()
    if 'lr' in training_hyperparameters:
        training_hyperparameters['learning_rate'] = training_hyperparameters.pop('lr')

    training_args = TrainingArguments(
        output_dir=output_dir,
        overwrite_output_dir=True,
        num_train_epochs=best_hyperparameters['epochs'],
        per_device_train_batch_size=best_hyperparameters['batch_size'],
        gradient_accumulation_steps=4, 
        learning_rate=best_hyperparameters['learning_rate'],
        weight_decay=best_hyperparameters['weight_decay'],
        warmup_steps=500,
        lr_scheduler_type="linear",
        prediction_loss_only=True,
        save_steps=10_000,
        save_total_limit=2,
        logging_dir="./logs",
        logging_steps=500,
        do_train=True,
        do_eval=False,
        fp16=False, 
        label_smoothing_factor=0.1,
        max_grad_norm=1.0, 
    )

    data_collator = DataCollatorForSeq2Seq(
        tokenizer,
        model=model,
        padding=True,
        return_tensors="pt"
    )
    
    class CustomT5Trainer(Trainer):
        def __init__(self, *args, **kwargs):
            super().__init__(*args, **kwargs)
            self.model.config.use_cache = False

    trainer = Trainer(
        model=model,
        args=training_args,
        train_dataset=tokenized_dataset,
        data_collator=data_collator,
    )

    try:
        start_time = time.time()
        trainer.train()
        end_time = time.time()
        print_training_summary(training_args, start_time, end_time, model_name="T5 Fine-tuned")
    except Exception as e:
        print(f"Training interrupted: {e}")

    model.save_pretrained(output_dir)
    tokenizer.save_pretrained(output_dir)

    print(f"T5 fine-tuned model saved to {output_dir}")
    return model, tokenizer

def validate_response(response: str, pdf_content: str) -> dict:
    vectorizer = TfidfVectorizer().fit([pdf_content, response])
    pdf_vector = vectorizer.transform([pdf_content]).toarray()
    response_vector = vectorizer.transform([response]).toarray()

    cosine_sim = cosine_similarity(pdf_vector, response_vector)[0][0]

    pdf_sentences = pdf_content.split(".") 
    response_tokens = response.split()
    references = [sentence.split() for sentence in pdf_sentences if sentence.strip()]
    smoothing = SmoothingFunction().method1
    bleu_score = sentence_bleu(references, response_tokens, smoothing_function=smoothing)

    model = SentenceTransformer('paraphrase-MiniLM-L6-v2')
    pdf_embedding = model.encode([pdf_content])[0]
    response_embedding = model.encode([response])[0]
    embedding_similarity = cosine_similarity([pdf_embedding], [response_embedding])[0][0]
    
    pdf_words = set(pdf_content.split())
    response_words = set(response.split())
    common_words = pdf_words.intersection(response_words)
    accuracy = len(common_words) / len(response_words) if response_words else 0
    
    results = {
        "cosine_similarity": round(cosine_sim, 3),
        "bleu_score": round(bleu_score, 3),
        "embedding_similarity": round(embedding_similarity, 3),
        "accuracy": round(accuracy * 100, 2)
    }

    print(f"**Validation Results:**")
    for metric, value in results.items():
        print(f"- {metric.replace('_', ' ').title()}: {value}")

    return results
    
def ensure_string_format(text):
    if isinstance(text, list):
        text = " ".join(text)
    if not isinstance(text, str) or not text.strip():
        raise ValueError("Lemmatized text must be a non-empty string.")
    return text

def train_model_async(model_choice, lemmatized_text, vectorstore, callback):
    try:
        processed_data = {"text": lemmatized_text, "paraphrase": lemmatized_text}
        if model_choice == "GPT-2":
            study = optuna.create_study(direction="minimize")
            study.optimize(lambda trial: objective(trial, processed_data), n_trials=10)
            formatted_results = format_optuna_results(study)
            best_hyperparameters = get_best_hyperparameters(study)
            callback(formatted_results, vectorstore, best_hyperparameters, model_choice)
            model, tokenizer = train_gpt2(
                lemmatized_text, best_hyperparameters=best_hyperparameters)
            prompt = "The impact of artificial intelligence on society"
            generated_text = generate_text_finetuned(prompt, model, tokenizer, max_length=100)
            print("Generated Text after Fine-tuning:")
            print(generated_text)

        elif model_choice == "GPT-NEO":
            study = optuna.create_study(direction="minimize")
            study.optimize(lambda trial: gptneo_objective(trial, processed_data), n_trials=10)
            formatted_results = format_optuna_results(study)
            best_hyperparameters = the_best_hyperparameters(study)
            callback(formatted_results, vectorstore, best_hyperparameters, model_choice)
            model, tokenizer = train_gptneo(
                lemmatized_text, best_hyperparameters=best_hyperparameters)
            prompt = "The impact of artificial intelligence on society"
            generated_text = generate_text_finetuned(prompt, model, tokenizer, max_length=100)
            print("Generated Text after Fine-tuning:")
            print(generated_text)

            
        elif model_choice == "T5":
            study = optuna.create_study(direction="minimize")
            study.optimize(lambda trial: t5_objective(trial, processed_data), n_trials=10)
            formatted_results = format_optuna_results_t5(study)
            best_hyperparameters = best_hyperparameters_t5(study)
            callback(formatted_results, vectorstore, best_hyperparameters, model_choice)
            model, tokenizer = train_t5(
                lemmatized_text, best_hyperparameters=best_hyperparameters)
            prompt = "The impact of artificial intelligence on society"
            generated_text = generate_text_finetuned(prompt, model, tokenizer, max_length=100)
            print("Generated Text after Fine-tuning:")
            print(generated_text)
        else:
            st.error("Invalid model choice.")
            return
        
        callback(model, tokenizer, None)

    except Exception as e:
        print(f"Error during training: {e}")
        
def extract_keywords(text):
    """Extract important keywords from text using spaCy."""
    doc = nlp(text)
    keywords = []
    for token in doc:
        if token.pos_ in ['NOUN', 'PROPN', 'VERB'] and not token.is_stop:
            keywords.append(token.text.lower())
    return list(set(keywords))

def calculate_keyword_relevance(question_keywords, context_chunk):
    """Calculate relevance score based on keyword matches."""
    chunk_keywords = extract_keywords(context_chunk)
    matches = sum(1 for keyword in question_keywords if keyword in chunk_keywords)
    return matches / len(question_keywords) if question_keywords else 0

def find_relevant_context(question, full_context, max_chunks=3):
    """Find most relevant context chunks based on keyword matching."""
    question_keywords = extract_keywords(question)
    
    chunks = [chunk.strip() for chunk in full_context.split('.') if chunk.strip()]
    
    chunk_scores = []
    for chunk in chunks:
        score = calculate_keyword_relevance(question_keywords, chunk)
        chunk_scores.append((chunk, score))
    
    chunk_scores.sort(key=lambda x: x[1], reverse=True)
    relevant_chunks = [chunk for chunk, score in chunk_scores[:max_chunks] if score > 0]
    
    return ' '.join(relevant_chunks)

def analyze_question_type(question):
    """Determine the type of question being asked."""
    question_lower = question.lower()
    
    patterns = {
        'summary': ['summarize', 'summary', 'brief', 'overview'],
        'definition': ['what is', 'what are', 'define', 'explain', 'describe'],
        'comparison': ['compare', 'difference', 'similar', 'different'],
        'analysis': ['analyze', 'analyse', 'why', 'how does', 'impact'],
        'factual': ['who', 'when', 'where', 'which', 'how many', 'how much']
    }
    
    for q_type, keywords in patterns.items():
        if any(keyword in question_lower for keyword in keywords):
            return q_type
    return 'general'

def generate_enhanced_response(question, context, model, tokenizer, device, max_length=200):
    """Generate an enhanced response using question type analysis and keyword matching."""
    try:
        question_type = analyze_question_type(question)
        
        relevant_context = find_relevant_context(question, context)
        if not relevant_context:
            return {
                'response': "I'm sorry, but I couldn't find any relevant context to answer your question.",
                'question_type': question_type,
                'context_relevance': False,
                'keywords': extract_keywords(question),
            }
        
        if question_type == 'summary':
            prompt = f"Please provide a concise summary of this: {relevant_context}"
        elif question_type == 'definition':
            prompt = f"Please define or explain based on this context: {relevant_context}"
        elif question_type == 'comparison':
            prompt = f"Compare the elements mentioned in: {relevant_context}"
        elif question_type == 'analysis':
            prompt = f"Analyze the following and explain why: {relevant_context}"
        elif question_type == 'factual':
            prompt = f"Based on this context, provide the specific factual information: {relevant_context}"
        else:
            prompt = f"Based on this context, answer the following: {question}\n\nContext: {relevant_context}"

        inputs = tokenizer.encode(prompt, return_tensors="pt", max_length=1024, truncation=True).to(device)
        outputs = model.generate(
            inputs,
            max_length=max_length,
            num_return_sequences=1,
            temperature=0.7,
            top_k=50,
            top_p=0.95,
            do_sample=True
        )
        response = tokenizer.decode(outputs[0], skip_special_tokens=True)
        
        return {
            'response': response,
            'question_type': question_type,
            'context_relevance': len(relevant_context) > 0,
            'keywords': extract_keywords(question)
        }

    except Exception as e:
        print(f"Error generating response: {e}")
        return None
    
def training_callback(formatted_results, vectorstore, best_hyperparameters, model_choice, model=None, tokenizer=None, error=None):
        st.session_state["is_training"] = False
        if error:
            st.error(f"Training failed: {error}")
        else:
            st.session_state["trained_model"] = model
            st.session_state["trained_tokenizer"] = tokenizer
            st.session_state['model_choice']= model_choice
            st.session_state["conversation"] = get_conversation_chain(
                vectorstore, model_choice
            )
            st.success(f"{st.session_state['model_choice']} model trained successfully!")
            
            st.write(formatted_results)
            st.write(f"Best hyperparameters: {best_hyperparameters}")    

def main(language='english'):
    load_dotenv()
    st.write(css, unsafe_allow_html=True)

    for key in ["conversation", "chat_history", "vectorstore", "model_trained", "lemmatized_text", "user_input"]:
        if key not in st.session_state:
            st.session_state[key] = None if key != "user_input" else ""
    if "is_training" not in st.session_state:
        st.session_state["is_training"] = False
    if "trained_model" not in st.session_state:
        st.session_state["trained_model"] = None
    if "trained_tokenizer" not in st.session_state:
        st.session_state["trained_tokenizer"] = None

    st.header("Chat With Me :books:")
    
    with st.sidebar:
        st.subheader("Your documents")
        pdf_files = st.file_uploader("Upload your PDFs here", accept_multiple_files=True)
        if pdf_files:
            if st.button("Submit"):
                with st.spinner("Processing"):
                    raw_text = get_pdfs_text(pdf_files)
                    print("\nRaw text: ", raw_text[:200])
                    cleaned_text = clean_text(raw_text)
                    corrected_text = correct_spelling(cleaned_text)
                    without_punctuation_text = remove_punctuation(corrected_text)
                    stop_words = get_stopwords("english")
                    filtered_text = remove_stopwords(without_punctuation_text, stop_words)
                    lemmatized_text = lemmatize_text(filtered_text, nlp)
                    print("\nLemmatized text : ",lemmatized_text[:100])
                    entities_text =extract_entities(lemmatized_text)
                    print("\nEntities : ",entities_text[:100])
                    try:
                        lemmatized_text = ensure_string_format(lemmatized_text)
                    except ValueError as e:
                        st.error(str(e))
                        return
                    st.session_state.raw_text = raw_text
                    st.session_state.corrected_text = corrected_text
                    st.session_state.lemmatized_text = lemmatized_text
                    text_chunks = get_text_chunks(lemmatized_text)
                    if text_chunks:
                        st.session_state.vectorstore = get_vectorstore(text_chunks)
                        st.success("File uploaded successfully")
                    else:
                        st.error("Failed to create text chunks. Check your document content.")
    
    if st.session_state.vectorstore is None:
        st.warning("Please upload documents to start a conversation.")
        return

    if st.session_state.vectorstore:
        st.subheader("Choose and Train a Model")
        model_choice = st.radio("Choose a model to train:", ["GPT-2", "GPT-NEO", "T5"])
        st.session_state["model_choice"] = model_choice

        if st.button("Start Modeling") and not st.session_state["is_training"]:
            st.session_state["is_training"] = True
            thread = threading.Thread(
                target=train_model_async,
                args=(
                    model_choice,
                    st.session_state.lemmatized_text,
                    st.session_state.vectorstore,
                    training_callback,
                ),
                daemon=True
            )
            thread.start()

        if st.session_state["is_training"]:
            st.warning("Model training in progress. You can continue chatting.")
            st.session_state.conversation = True
        
    
                    
    if st.session_state.conversation:
        st.subheader("Chat Interface")
        user_question = st.text_input("Ask your question:")
        

        if user_question:
            with st.spinner("Processing..."):
                try:
                    processed_question = process_text(user_question, language="en")
                    device = torch.device("cuda" if torch.cuda.is_available() else "cpu") 
                    if model_choice=="GPT-2":
                        tokenizer = GPT2Tokenizer.from_pretrained("gpt2")
                        model = GPT2LMHeadModel.from_pretrained("gpt2").to(device)  
                    elif model_choice=="GPT-NEO":      
                        tokenizer = AutoTokenizer.from_pretrained("./gptneo_finetuned")
                        model = AutoModelForCausalLM.from_pretrained("./gptneo_finetuned").to(device)
                    elif model_choice=="T5":
                        tokenizer = T5Tokenizer.from_pretrained("t5-small", legacy=True)
                        model = T5ForConditionalGeneration.from_pretrained("t5-small").to(device)
                    st.session_state.trained_model=model
                    st.session_state.trained_tokenizer=tokenizer
                    
                    if "summary" in user_question.lower():
                        summary = summarize_text(
                            st.session_state.corrected_text,
                            st.session_state.trained_model,
                            st.session_state.trained_tokenizer,
                            device
                        )
                        st.write(f"**Summary:** {summary}")
                        return
                    
                    if "how many words" in user_question.lower():
                        word_count = count_words(st.session_state.raw_text)
                        st.write(f"**The total word of this document:** {word_count}")
                        return
                    
                    response_data = generate_enhanced_response(
                        processed_question,
                        st.session_state.corrected_text,
                        st.session_state.trained_model,
                        st.session_state.trained_tokenizer,
                        device
                    )
                    
                    if response_data:
                        st.write(f"**You:** {user_question}")
                        st.write(f"**Bot:** {response_data['response']}")
                        
                        if "chat_history" not in st.session_state or st.session_state["chat_history"] is None:
                            st.session_state["chat_history"] = []  # Initialize if not present
                            
                            st.markdown("### Chat History:")
                            for message in st.session_state["chat_history"]:
                                st.markdown(f"**You:** {message['user']}")
                                st.markdown(f"**Bot:** {message['bot']}")
                                st.markdown("---") 
                                            
                        with st.expander("Response Details"):
                            st.write(f"Question Type: {response_data['question_type']}")
                            st.write(f"Detected Keywords: {', '.join(response_data['keywords'])}")
                        
                        # Validate response
                        validation_metrics = validate_response(response_data['response'], st.session_state.raw_text)
                        if validation_metrics["cosine_similarity"] > 0.5:
                            st.success(f"Response is valid with similarity: {validation_metrics['cosine_similarity']:.2f}")
                        else:
                            st.warning("The response may not align well with the document content.")
                    else:
                        st.error("Failed to generate a response. Please try again.")

                except Exception as e:
                    st.error(f"Error processing question: {str(e)}")
                    
                        
if __name__ == '__main__':
    print("\nRunning `prepare_input_demo`...")
    prepare_input_demo()
    main()