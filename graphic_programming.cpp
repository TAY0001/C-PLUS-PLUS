#define NOMINMAX           
#define WIN32_LEAN_AND_MEAN

#include <Windows.h>
#include <gl/GL.h>
#include <vector>
#include <cmath>
#include <GL/glu.h>
#pragma comment(lib, "glu32.lib")
#pragma comment (lib, "OpenGL32.lib")

#define WINDOW_TITLE "OpenGL Window"

static inline float Lerp(float a, float b, float t);

#ifndef M_PI
#define M_PI 3.14159265358979323846
#endif
float angle = 0.0f;
float y_angle = 0.0f;
static const GLfloat COL_WHITE[3] = { 0.96f, 0.96f, 0.97f };
static const GLfloat COL_GOLD[3] = { 0.86f, 0.73f, 0.30f };
static const GLfloat COL_BLUE[3] = { 0.10f, 0.15f, 0.25f };
float gShirtTX = 0.0f, gShirtTY = 0.0f, gShirtTZ = 0.0f;
float gSkirtTX = 0.0f, gSkirtTY = 0.0f, gSkirtTZ = 0.0f;
float gHeadScale = 0.65f;          // < 1.0 = smaller head
const float HEAD_PIVOT_Y = 2.2f;   // head center used in face()
float gHeadTX = 0.0f, gHeadTY = 0.0f, gHeadTZ = 0.0f;
float gHandYaw_L = -90.0f;  // twist so palm faces the body by default
float gHandYaw_R = -90.0f;
float gHandPitch_L = -12.0f;
float gHandPitch_R = -12.0f;
float gHandRoll_L = +8.0f;
float gHandRoll_R = -8.0f;
//bool  gTDown = false;     // is T currently held
//int   gTDir = +1;        // +1 = turn toward +90°, -1 = toward -90°
//float gTurnStep = 3.0f;   // degrees per frame while held (tweak speed)

bool gRage = false;
static inline float wrap180(float a) { while (a > 180) a -= 360; while (a < -180) a += 360; return a; }


static int   gWinW = 800, gWinH = 600;   // track current window size
bool  usePerspective = true;             // <— toggle flag

float camDist = 12.0f;   // start at 12 units away
float orthoSize = 6.0f;  // smaller = zoom in, larger = zoom out

float eyeOpen = 1.0f;    // 1.0 = fully open, 0.0 = fully closed
bool  blinking = false;
float blinkSpeed = 0.03f; // speed of blink per frame

// --- Auto-blink frame counter ---
static int frameCount = 0;
const int blinkIntervalFrames = 1200; // ~ every 5s at 60 FPS
bool autoBlink = true;   // allow timed blinks?


float lightGain = 0.65f;
bool  useSpotlight = false;
float spotCutoff = 25.0f;  // degrees (1..90)
float spotExponent = 20.0f;  // falloff focus (0..128)

// =================== Sword Variables ===================
float gBladeScale = 1.0f;
float gBladeScaleTarget = 1.0f;
const float BLADE_ANIM_SPEED = 0.6f;
ULONGLONG gLastTick = 0;
const float BASE_BLADE_LEN = 2.0f;   // your original
const float BASE_TIP_LEN = 0.25f;  // keep tip looking the same proportionally if you want
const float EXTENDED_BLADE_SCALE = 1.20f; //  default extended size here
inline float BladeLength() { return BASE_BLADE_LEN * gBladeScale; }

// Sword textures
GLuint texSteel = 0, texGold = 0, texHolderBlack = 0, texHolderBrown = 0;
GLuint texDarkGold = 0, texDarkGrey = 0, texMetal = 0, texDragonRed = 0;
GLuint texBiegeCloth = 0, texDarkCloth = 0, texBelt = 0, texBelt2 = 0, texDragonCloth = 0,
texDragonClothBlank = 0, texBlackCloth = 0, texHemOri = 0, texHemAlt = 0, texDarkPants = 0, textAPants = 0, texPlainBlack = 0, texBrighterBeige = 0, texDGrey = 0, texGoldStrip = 0;

GLuint currentBeltTex = 0;  // will be set after textures load
GLuint currentSkirtSideTex = 0;
GLuint currentSkirtMidTex = 0;
GLuint currentHemTex = 0;  // active hem texture
GLuint currentPantsTex = 0;
GLuint currentUpperSleeveTex = 0;   // active texture for upper arm (sleeve)
GLuint currentLapelTex = 0;
GLuint currentCollarTex = 0; // active collar texture (ORI = texDarkCloth)
GLuint currentInnerShirtTex = 0;   // inner shirt active texture
GLuint currentWedgeTex = 0;
GLuint currentGoldStripTex = 0; // active trim texture

enum MaterialMode { MODE_ORI = 0, MODE_GOLD = 1 };
MaterialMode gSwordMode = MODE_ORI;

inline GLuint BladeTex() { return (gSwordMode == MODE_ORI) ? texSteel : texGold; }
inline GLuint HolderTex() { return (gSwordMode == MODE_ORI) ? texHolderBrown : texHolderBlack; }
inline GLuint JoinTex() { return (gSwordMode == MODE_ORI) ? texDarkGrey : texDarkGold; }

float gCharX = 0.0f, gCharZ = 0.0f;
float gWalkPhase = 0.0f;
float gWalkDir = 0.0f;
float swingDeg = sinf(gWalkPhase) * 5.0f;

float gHeadYawDeg = 0.0f;

float gManualArmL = 0.0f;
float gManualArmR = 0.0f;
float gManualLegL = 0.0f;
float gManualLegR = 0.0f;
const float LEG_FRONT_MAX = 35.0f;
const float LEG_BACK_MAX = 10.0f;
const float LEG_STEP_DEG = 5.0f;

GLfloat gRightWristM[16];
bool    gHasRightWristM = false;


struct BootPalette {
	GLfloat cuff[3];  // ankle/cuff block
	GLfloat heel[3];  // heel block
	GLfloat toe[3];   // toe block
};

// a few sample looks
static const BootPalette BOOT_PALS[] = {
	// 0: Navy classic
	{ {0.10f,0.15f,0.25f}, {0.10f,0.15f,0.25f}, {0.10f,0.15f,0.25f} },
	// 1: Black + gold cap
	{ {0.05f,0.05f,0.06f}, {0.08f,0.08f,0.10f}, {0.86f,0.73f,0.30f} },
	// 2: White + gold trims
	{ {0.95f,0.95f,0.96f}, {0.86f,0.73f,0.30f}, {0.95f,0.95f,0.96f} },
	// 3: Burgundy toe
	{ {0.22f,0.03f,0.05f}, {0.10f,0.02f,0.03f}, {0.55f,0.09f,0.12f} },
};
static int gBootPalIndex = 0;
static inline const BootPalette& CurrentBootPal() {
	return BOOT_PALS[gBootPalIndex % (int)(sizeof(BOOT_PALS) / sizeof(BOOT_PALS[0]))];
}



//FIGHTHING ANIMATION

//FIRE
static GLuint texFire = 0;

// --- pose animation ---
struct Pose {
	float hipX;                 // leg spacing
	float LYaw, LPitch, LRoll; // left hand/arm (uses your gHand* vars)
	float RYaw, RPitch, RRoll; // right hand/arm
};

inline float EaseInOut(float t) { return t * t * (3.0f - 2.0f * t); } // smooth 0..1

// live values driven by the animation
float gHipX = 0.35f; // used by drawPants (see Step 3)

// current logical poses
Pose gPoseIdle{ 0.35f,  -90.0f, -12.0f, +8.0f,  -90.0f, -12.0f, -8.0f };
Pose gPoseStance{ 0.70f,  -40.0f, -25.0f, +22.0f, -15.0f, +30.0f, -10.0f }; // ? 2nd image

// animation state
bool       gInStance = false;     // where we’ll end up after the toggle
bool       gAnimActive = false;
ULONGLONG  gAnimStartMs = 0;
float      gAnimDurMs = 600.0f;    // 0.6s blend
// Pose animation (0 = idle, 1 = fighting stance)
float gPoseT = 0.0f;
float gPoseTTarget = 0.0f;     // toggled by SPACE
//inline GLuint BladeTex() { return (gSwordMode == MODE_ORI) ? texSteel : texGold; }
//inline GLuint HolderTex() { return (gSwordMode == MODE_ORI) ? texHolderBrown : texHolderBlack; }
//inline GLuint JoinTex() { return (gSwordMode == MODE_ORI) ? texDarkGrey : texDarkGold; }
static void updateSwordAnim() {
	ULONGLONG ms = GetTickCount64();
	if (!gLastTick) { gLastTick = ms; return; }
	float dt = 0.001f * (float)(ms - gLastTick);
	gLastTick = ms;

	// critically-damped ease to target
	float k = powf(1.0f - BLADE_ANIM_SPEED, dt * 60.0f);
	gBladeScale = gBladeScale * k + gBladeScaleTarget * (1.0f - k);
}
// SPACE toggles these
bool  gDarkBG = false;          // black background when true
float gMouthExpr = +0.60f;      // used by drawMouth (smile by default)
const float MOUTH_SMILE = +0.60f;
const float MOUTH_NEUTRAL = 0.00f;

// Body yaw (turn whole character)
float gBodyYaw = 0.0f;   // current yaw in degrees
float gBodyYawTarget = 0.0f;   // where we want to face
static void updateBodyYaw() {
	// critically-damped ease on the shortest arc
	static ULONGLONG prev = 0;
	ULONGLONG now = GetTickCount64();
	float dt = (prev == 0) ? 0.0f : 0.001f * float(now - prev);
	prev = now;

	// blend factor per frame (tune 0.75–0.90 for snappier/slower)
	float k = powf(1.0f - 0.84f, dt * 60.0f);

	// shortest path in degrees
	float dy = wrap180(gBodyYawTarget - gBodyYaw);
	gBodyYaw += (1.0f - k) * dy;
	gBodyYaw = wrap180(gBodyYaw);
}
// --- sword move/rotate between hip ? hand (SPACE toggles) ---
bool  gSwordInHand = false;
float gSwordBlendT = 0.0f;    // 0..1 (0=hip, 1=hand)
float gSwordBlendTarget = 0.0f;
// ---- Sword placement state (ONE COPY ONLY) ----
struct TRS { float tx, ty, tz, rx, ry, rz; };

static const TRS SWORD_AT_HIP = { 0.70f, 0.55f, 0.35f,   -5.0f, 12.0f, 85.0f };
static const TRS SWORD_IN_HAND_DOWN = { -2.f, -3.f, 0.0f,  -170.0f, 170.0f, 90.0f };
static const TRS SWORD_IN_HAND_UP = { -2.f, -3.f, 0.0f,  -170.0f, 170.0f, 90.0f };


// use a unique name so it can’t collide
static inline float myLerp(float a, float b, float t) { return a + (b - a) * t; }
static inline float wrap180f(float a) { while (a > 180) a -= 360; while (a < -180) a += 360; return a; }

static TRS mixTRS(const TRS& a, const TRS& b, float t) {
	TRS o;
	o.tx = myLerp(a.tx, b.tx, t);  o.ty = myLerp(a.ty, b.ty, t);  o.tz = myLerp(a.tz, b.tz, t);
	o.rx = a.rx + wrap180f(b.rx - a.rx) * t;
	o.ry = a.ry + wrap180f(b.ry - a.ry) * t;
	o.rz = a.rz + wrap180f(b.rz - a.rz) * t;
	return o;
}

static void updateSwordMoveRot() {
	static ULONGLONG prev = 0; ULONGLONG now = GetTickCount64();
	float dt = (prev == 0) ? 0.0f : 0.001f * float(now - prev); prev = now;
	float k = powf(1.0f - 0.84f, dt * 60.0f);
	gSwordBlendT = gSwordBlendT * k + gSwordBlendTarget * (1.0f - k);
}
// === Right-arm swing driver (uses your drawSleeveDown params) ==========
struct RArmPose { float swingOutZ; float leanFwdX; float handYaw, handPitch, handRoll; };

// Idle vs. reach (Z = swing out, X = lean forward)
static const RArmPose R_IDLE = { 10.0f,  0.0f,  -90.0f, -12.0f,  -8.0f };
static const RArmPose R_REACH = { 85.0f, +14.0f, -60.0f,  -8.0f, -30.0f };
//                        ^higher out     ^slight lean   ^hand shaping


// Live state
static float gRArmT = 0.0f;          // 0..1 (0=idle, 1=reach)
static float gRArmTarget = 0.0f;     // toggled by SPACE

// Values we pass into drawSleeveDown for the RIGHT arm
static float gRSwingOutZ = R_IDLE.swingOutZ;
static float gRLeanFwdX = R_IDLE.leanFwdX;
static void updateRightArmAnim()
{
	static ULONGLONG prev = 0;
	ULONGLONG now = GetTickCount64();
	float dt = prev ? 0.001f * float(now - prev) : 0.0f;
	prev = now;

	// critically-damped easing toward target
	float k = powf(1.0f - 0.84f, dt * 60.0f);
	gRArmT = gRArmT * k + gRArmTarget * (1.0f - k);

	auto L = [&](float a, float b) { return Lerp(a, b, gRArmT); };

	// drive the two inputs that your right arm uses
	gRSwingOutZ = L(R_IDLE.swingOutZ, R_REACH.swingOutZ);
	gRLeanFwdX = L(R_IDLE.leanFwdX, R_REACH.leanFwdX);

	// (optional) shape the hand a bit
	gHandYaw_R = L(R_IDLE.handYaw, R_REACH.handYaw);
	gHandPitch_R = L(R_IDLE.handPitch, R_REACH.handPitch);
	gHandRoll_R = L(R_IDLE.handRoll, R_REACH.handRoll);
}


// ----- Sequence timing (total = 3s by default) -----
float gSeqDurAB = 1.5f;   // A->B
float gSeqDurBC = 1.5f;   // B->C

// ----- Keyframes (A = normal, B = first pose, C = second pose) -----
static const float SEQ_ARM_A = 0.00f, SEQ_ARM_B = 0.55f, SEQ_ARM_C = 1.00f;                 // right-arm blend
static const float SEQ_SWD_A = 0.00f, SEQ_SWD_B = 0.65f, SEQ_SWD_C = 1.00f;                 // sword blend
static const float SEQ_YAW_A = 0.0f, SEQ_YAW_B = 12.0f, SEQ_YAW_C = 20.0f;                 // body yaw (deg)
static const float SEQ_BLD_A = 1.00f, SEQ_BLD_B = 1.10f, SEQ_BLD_C = EXTENDED_BLADE_SCALE; // blade scale
static const float SEQ_POSE_A = 0.0f, SEQ_POSE_B = 0.5f, SEQ_POSE_C = 1.0f;                  // your pose blend


// ---- sword local rotation (current + target) ----
// (Use your current values if different)
float gSwordRX = -170.f, gSwordRY = +170.f, gSwordRZ = +90.f;
float gSwordRX_T = -170.f, gSwordRY_T = +170.f, gSwordRZ_T = +90.f;

// damper you already had:
//static inline float wrap180(float a) { while (a > 180)a -= 360; while (a < -180)a += 360; return a; }
// use your existing wrap180(float) defined earlier

// you already have these:
static inline float dampAngle(float a, float target, float dt) {
	float k = powf(1.0f - 0.84f, dt * 60.0f);
	float da = wrap180f(target - a);
	return wrap180f(a + (1.0f - k) * da);
}

static void updateSwordAngles(float dt) {
	gSwordRX = dampAngle(gSwordRX, gSwordRX_T, dt);
	gSwordRY = dampAngle(gSwordRY, gSwordRY_T, dt);
	gSwordRZ = dampAngle(gSwordRZ, gSwordRZ_T, dt);
}

// Draw a textured ribbon/pattern locked to the RIGHT wrist.
// Assumes gRightWristM was captured in drawSleeveDown(false, ...).
static void DrawPatternOnRightHand()
{
	if (!gHasRightWristM) return;

	// use an existing texture you already load
	extern GLuint texDragonRed;

	// --- artist knobs (tweak these) ---
	const float OFF_X = 0.02f;   // slide left/right relative to wrist
	const float OFF_Y = -0.03f;   // slide up/down relative to wrist
	const float OFF_Z = 0.00f;   // slide along forearm axis
	const float ROT_X = 0.0f;    // extra tilt
	const float ROT_Y = 0.0f;    // extra yaw
	const float ROT_Z = 0.0f;    // twist around forearm/hand
	const float WIDTH = 0.08f;   // half-width of the strip
	const float LENGTH = 0.24f;   // length of the strip along local +Y

	glPushMatrix();
	glMultMatrixf(gRightWristM);      // move into wrist space

	// fine alignment
	glTranslatef(OFF_X, OFF_Y, OFF_Z);
	glRotatef(ROT_Y, 0, 1, 0);
	glRotatef(ROT_X, 1, 0, 0);
	glRotatef(ROT_Z, 0, 0, 1);

	// draw a simple textured quad (upright in wrist space)
	glEnable(GL_TEXTURE_2D);
	glBindTexture(GL_TEXTURE_2D, texDragonRed);
	glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_MODULATE);
	glColor3f(1.0f, 1.0f, 1.0f);

	glBegin(GL_QUADS);
	// bottom edge (near wrist)
	glTexCoord2f(0.0f, 0.0f); glVertex3f(-WIDTH, 0.0f, 0.0f);
	glTexCoord2f(1.0f, 0.0f); glVertex3f(WIDTH, 0.0f, 0.0f);
	// top edge (toward hand/sword)
	glTexCoord2f(1.0f, 1.0f); glVertex3f(WIDTH, LENGTH, 0.0f);
	glTexCoord2f(0.0f, 1.0f); glVertex3f(-WIDTH, LENGTH, 0.0f);
	glEnd();

	glDisable(GL_TEXTURE_2D);
	glPopMatrix();
}
float gRShoulderYaw = 0.0f;   // current deg
float gRShoulderYaw_T = 0.0f;   // target deg
float gRShoulderFwd = 0.0f;  // units in your model space
float gRShoulderFwd_T = 0.0f;
static void updateRShoulderYaw(float dt) {
	gRShoulderYaw = dampAngle(gRShoulderYaw, gRShoulderYaw_T, dt);
	float k = powf(1.0f - 0.84f, dt * 60.0f);
	gRShoulderFwd = gRShoulderFwd * k + gRShoulderFwd_T * (1.0f - k);
}

// --- Right elbow (forearm curl) ---
float gRElbowDeg = 0.0f;   // current
float gRElbowDeg_T = 0.0f;   // target

static void updateRElbow(float dt) {
	gRElbowDeg = dampAngle(gRElbowDeg, gRElbowDeg_T, dt);
}

// --- Left shoulder openness (Z) + left elbow curl (forearm) ---
float gLSwingOutZ = 11.0f;   // current baseline "open" (your OPEN)
float gLSwingOutZ_T = 11.0f;   // target

float gLElbowDeg = 0.0f;    // current elbow bend
float gLElbowDeg_T = 0.0f;    // target

bool  gLeftMiniPose = false;   // toggle state

static void updateLeftMiniPose(float dt) {
	gLSwingOutZ = dampAngle(gLSwingOutZ, gLSwingOutZ_T, dt);
	gLElbowDeg = dampAngle(gLElbowDeg, gLElbowDeg_T, dt);
}

float gManualLegR_T = 0.0f, gManualLegL_T = 0.0f;

// put this near your other small inlines
static inline float ClampRangeF(float x, float a, float b) {
	return (x < a) ? a : ((x > b) ? b : x);
}

static void updateManualLegs(float dt) {
	gManualLegR_T = ClampRangeF(gManualLegR_T, -LEG_BACK_MAX, LEG_FRONT_MAX); // right: +forward
	gManualLegL_T = ClampRangeF(gManualLegL_T, -LEG_FRONT_MAX, LEG_BACK_MAX);  // left:  -forward
	gManualLegR = dampAngle(gManualLegR, gManualLegR_T, dt);
	gManualLegL = dampAngle(gManualLegL, gManualLegL_T, dt);
}



// ========================= KEYFRAME SEQUENCER =========================
namespace KF {
	constexpr int MAXK = 8;

	// key values per track (0..COUNT-1)
	float ARM[MAXK], SWD[MAXK], YAW[MAXK], BLD[MAXK], POSE[MAXK];
	// sword local rotation targets (you already have dampers for RX/RY/RZ)
	float SWRX[MAXK], SWRY[MAXK], SWRZ[MAXK];
	// add near the other tracks
	float RSHY[MAXK];  // Right SHoulder Yaw (deg)
	float RFWD[MAXK];
	float ELB[MAXK];
	float RLEG[MAXK];   // right thigh offset (+ = step forward)
	float LLEG[MAXK];   // left thigh offset  (− = step back a little)

	// per-segment durations between keys (COUNT-1 items)
	float SEG[MAXK - 1];
	int   COUNT = 0;

	// player state
	bool       Active = false;
	bool       Forward = true;      // true: 0?1?2?3, false: 3?2?1?0
	int        From = 0;         // current segment starts at key index From
	ULONGLONG  SegStart = 0;

	inline float Ease(float t) { return t * t * (3.f - 2.f * t); }   // smoothstep 0..1
	inline float Lerp(float a, float b, float t) { return a + (b - a) * t; }

	// -------------------- A (idle) ? B (open) ? C (ready) ? D (cut down) --------------------
	void Load_ABCDEF()
	{
		COUNT = 8; // A..H

		// Shoulder openness
		ARM[0] = 0.00f; ARM[1] = 0.70f; ARM[2] = 0.70f; ARM[3] = 0.50f;
		ARM[4] = 0.50f; ARM[5] = 0.40f; ARM[6] = 0.60f; ARM[7] = 0.40f;

		// Sword in hand from B
		SWD[0] = 0.00f; SWD[1] = 1.00f; SWD[2] = 1.00f; SWD[3] = 1.00f;
		SWD[4] = 1.00f; SWD[5] = 1.00f; SWD[6] = 1.00f; SWD[7] = 1.00f;

		// Body yaw
		YAW[0] = 0.0f; YAW[1] = +60.0f; YAW[2] = -60.0f; YAW[3] = -60.0f;
		YAW[4] = -60.0f; YAW[5] = -60.0f; YAW[6] = -60.0f; YAW[7] = -60.0f;

		// Blade scale / pose
		BLD[0] = 1.00f; BLD[1] = 1.08f; BLD[2] = EXTENDED_BLADE_SCALE; BLD[3] = EXTENDED_BLADE_SCALE;
		BLD[4] = EXTENDED_BLADE_SCALE; BLD[5] = EXTENDED_BLADE_SCALE; BLD[6] = EXTENDED_BLADE_SCALE; BLD[7] = EXTENDED_BLADE_SCALE;
		POSE[0] = 0.0f; POSE[1] = 0.6f; POSE[2] = 1.0f; POSE[3] = 1.0f; POSE[4] = 1.0f; POSE[5] = 1.0f; POSE[6] = 1.0f; POSE[7] = 1.0f;

		// Sword local orientation
		SWRX[0] = -170.f; SWRY[0] = +170.f; SWRZ[0] = +90.f;
		SWRX[1] = -115.f; SWRY[1] = +35.f; SWRZ[1] = +90.f;
		SWRX[2] = -175.f; SWRY[2] = +30.f; SWRZ[2] = -90.f;
		SWRX[3] = SWRX[2]; SWRY[3] = SWRY[2]; SWRZ[3] = SWRZ[2];
		SWRX[4] = SWRX[3]; SWRY[4] = SWRY[3]; SWRZ[4] = SWRZ[3];
		SWRX[5] = SWRX[3]; SWRY[5] = SWRY[3]; SWRZ[5] = SWRZ[3];
		SWRX[6] = SWRX[3]; SWRY[6] = SWRY[3]; SWRZ[6] = SWRZ[3];
		SWRX[7] = SWRX[3]; SWRY[7] = SWRY[3]; SWRZ[7] = SWRZ[3];

		// Shoulder yaw
		RSHY[0] = 0.0f; RSHY[1] = +25.0f; RSHY[2] = +25.0f; RSHY[3] = +25.0f;
		RSHY[4] = +25.0f; RSHY[5] = +25.0f; RSHY[6] = +30.0f; RSHY[7] = +25.0f;
		RFWD[0] = 0.0f; RFWD[1] = 0.0f; RFWD[2] = 0.0f; RFWD[3] = 0.0f;
		RFWD[4] = 0.0f; RFWD[5] = 0.0f; RFWD[6] = 0.0f; RFWD[7] = 0.0f;

		// Elbow curl (your current plan)
		ELB[0] = 0.0f; ELB[1] = 0.0f; ELB[2] = -5.0f; ELB[3] = -10.0f;
		ELB[4] = -105.0f; ELB[5] = 0.0f; ELB[6] = -115.0f; ELB[7] = 0.0f;

		// NEW: Right / Left thigh offsets (deg).  C = step forward.
// Right / Left thigh offsets (deg).  C = left step forward.
		RLEG[0] = 0.0f; RLEG[1] = 0.0f; RLEG[2] = -6.0f;  RLEG[3] = -6.0f;
		RLEG[4] = -4.0f; RLEG[5] = 0.0f;  RLEG[6] = 0.0f;  RLEG[7] = 0.0f;   // right moves slightly back

		LLEG[0] = 0.0f; LLEG[1] = 0.0f; LLEG[2] = -18.0f; LLEG[3] = -10.0f;   // left forward (negative)
		LLEG[4] = -5.0f; LLEG[5] = -3.0f; LLEG[6] = -3.0f; LLEG[7] = -3.0f;


		// Durations
		SEG[0] = 1.5f; SEG[1] = 1.5f; SEG[2] = 1.5f;
		SEG[3] = 0.6f; SEG[4] = 0.6f; SEG[5] = 0.5f; SEG[6] = 0.4f;
	}




	// start playing the loaded sequence
	void Start(bool forward = true)
	{
		Forward = forward;
		Active = true;
		From = forward ? 0 : (COUNT - 1);
		SegStart = GetTickCount64();
	}

	void Update()
	{
		if (!Active) return;

		int segIndex = Forward ? From : (From - 1);
		if (segIndex < 0 || segIndex >= COUNT - 1) { Active = false; return; }

		const float dur = SEG[segIndex];
		const ULONGLONG now = GetTickCount64();
		float u = dur > 0.f ? (0.001f * float(now - SegStart)) / dur : 1.f;
		if (u > 1.f) u = 1.f;

		const int i = From;
		const int j = From + (Forward ? +1 : -1);
		const float sBlend = Ease(u);

		// drive targets
		gRArmTarget = Lerp(ARM[i], ARM[j], sBlend);
		gSwordBlendTarget = Lerp(SWD[i], SWD[j], sBlend);
		gBodyYawTarget = Lerp(YAW[i], YAW[j], sBlend);
		gBladeScaleTarget = Lerp(BLD[i], BLD[j], sBlend);
		gPoseTTarget = Lerp(POSE[i], POSE[j], sBlend);

		gSwordRX_T = Lerp(SWRX[i], SWRX[j], sBlend);
		gSwordRY_T = Lerp(SWRY[i], SWRY[j], sBlend);
		gSwordRZ_T = Lerp(SWRZ[i], SWRZ[j], sBlend);
		gRShoulderYaw_T = Lerp(RSHY[i], RSHY[j], sBlend);
		gRShoulderFwd_T = Lerp(RFWD[i], RFWD[j], sBlend);
		gRElbowDeg_T = Lerp(ELB[i], ELB[j], sBlend);   // <--- NEW
		gManualLegR_T = Lerp(RLEG[i], RLEG[j], sBlend);
		gManualLegL_T = Lerp(LLEG[i], LLEG[j], sBlend);



		// after you compute i, j, sBlend, etc.


		// --- face camera on the last leg (C?D): set local yaw to cancel world+body
		extern float gBodyYaw;           // this refers to ::gBodyYaw
		auto yawToCamera = [](float bodyYawDeg, float worldYawDeg) {
			return wrap180f(-(bodyYawDeg + worldYawDeg));
			};

		const bool goingToD = Forward ? (j == 3) : (i == 3);
		if (goingToD) {
			const float bodyYawBlend = Lerp(YAW[i], YAW[j], sBlend);
			const float worldYawBlend = ::angle;   // <-- use your global scene yaw
			gSwordRY_T = yawToCamera(bodyYawBlend, worldYawBlend);
		}
		else {
			gSwordRY_T = Lerp(SWRY[i], SWRY[j], sBlend);
		}

		if (u >= 1.f) {
			From += (Forward ? +1 : -1);
			SegStart = now;
			if (From < 0 || From >= COUNT - 1) Active = false;
		}

	}

} // namespace KF

float gCamYawDeg = 0.0f;
static inline float clamp01(float x) { return x < 0 ? 0 : (x > 1 ? 1 : x); }

static void updatePoseAnim()
{
	static ULONGLONG prev = 0;
	ULONGLONG now = GetTickCount64();
	float dt = (prev == 0) ? 0.0f : float(now - prev) / 1000.0f;
	prev = now;

	// smooth approach
	gPoseT = Lerp(gPoseT, gPoseTTarget, clamp01(dt * 6.0f));
}
//ANIMATION ENDDDDDDDDDDDDDD

// ====================== HELP OVERLAY MODULE (drop-in) ======================


// ---------- internal state ----------
namespace HELP {
	static bool   show = false;
	static GLuint fontBase = 0;         // first display list id
	static bool   fontReady = false;
	static int    fontPx = 12;          // font size (change if you want smaller/larger)

	typedef void (APIENTRY* PFNGLWINDOWPOS2FPROC)(GLfloat, GLfloat);
	static PFNGLWINDOWPOS2FPROC pglWindowPos2f = nullptr;

	static void DestroyFont() {
		if (fontBase) { glDeleteLists(fontBase, 96); fontBase = 0; }
		fontReady = false;
	}

	static void BuildFont(int px) {
		DestroyFont();

		if (!pglWindowPos2f)
			pglWindowPos2f = (PFNGLWINDOWPOS2FPROC)wglGetProcAddress("glWindowPos2f");

		fontBase = glGenLists(96);
		HDC hdc = wglGetCurrentDC();
		HFONT hFont = CreateFontA(
			-px, 0, 0, 0, FW_NORMAL, FALSE, FALSE, FALSE,
			ANSI_CHARSET, OUT_DEFAULT_PRECIS, CLIP_DEFAULT_PRECIS,
			ANTIALIASED_QUALITY, FF_DONTCARE | DEFAULT_PITCH, "Consolas"); // or "Tahoma"

		HFONT old = (HFONT)SelectObject(hdc, hFont);
		BOOL ok = wglUseFontBitmapsA(hdc, 32, 96, fontBase);
		SelectObject(hdc, old);
		DeleteObject(hFont);

		fontReady = (ok == TRUE);
	}

	static void EnsureFont() {
		if (!fontReady) BuildFont(fontPx);
	}

	// Print ASCII line at pixel coords from bottom-left
	static void Print(float x, float y, const char* s) {
		if (!s || !*s) return;
		EnsureFont(); if (!fontReady) return;

		glDisable(GL_TEXTURE_2D);
		glDisable(GL_LIGHTING);
		glDisable(GL_DEPTH_TEST);
		glColor4f(1, 1, 1, 1);

		if (pglWindowPos2f) {
			pglWindowPos2f(x, y);
		}
		else {
			// Fallback: set a quick ortho for raster pos
			GLint vp[4]; glGetIntegerv(GL_VIEWPORT, vp);
			glMatrixMode(GL_PROJECTION);
			glPushMatrix(); glLoadIdentity(); glOrtho(0, vp[2], 0, vp[3], -1, 1);
			glMatrixMode(GL_MODELVIEW);
			glPushMatrix(); glLoadIdentity();
			glRasterPos2f(x, y);
		}

		glListBase(fontBase - 32);
		GLsizei n = (GLsizei)strlen(s);
		glCallLists(n, GL_UNSIGNED_BYTE, (const GLubyte*)s);

		if (!pglWindowPos2f) {
			glPopMatrix(); // MODELVIEW
			glMatrixMode(GL_PROJECTION);
			glPopMatrix();
			glMatrixMode(GL_MODELVIEW);
		}
	}

	// Big help text for popup (F1) if you want it
	static const char* PopupText() {
		return
			"CONTROLS\n"
			"\n"
			"Camera / View\n"
			"  Arrow Left/Right  : Orbit yaw\n"
			"  Arrow Up/Down     : Orbit pitch\n"
			"  W / S             : Zoom in / out (perspective)\n"
			"  1 / 2             : Perspective / Orthographic\n"
			"\n"
			"Lighting\n"
			"  - / +             : Light gain\n"
			"  L                 : Toggle spotlight\n"
			"  [ / ]             : Spotlight cone (cutoff)\n"
			"  , / .             : Spotlight focus (exponent)\n"
			"\n"
			"Face / Blink\n"
			"  B                 : Blink now and enable auto blink\n"
			"  N                 : Stop blink, eyes open, disable auto blink\n"
			"\n"
			"Sword / Outfit\n"
			"  E / R             : Extend blade / Reset blade\n"
			"  X                 : Original sword + outfit set\n"
			"  Y                 : Gold sword + dragon outfit set\n"
			"\n"
			"Movement (walk demo)\n"
			"  G / F / H         : Walk forward / back / stop\n"
			"  J                 : Stop and reset position\n"
			"\n"
			"Head\n"
			"  O / P / I         : Head left / right / center\n"
			"\n"
			"Manual Pose\n"
			"  U / D             : Left arm up / down\n"
			"  T / V             : Right arm up / down\n"
			"  K / 5             : Left leg forward / back\n"
			"  Q / 6             : Right leg forward / back\n"
			"  C                 : Clear manual limbs\n"
			"\n"
			"Animation\n"
			"  SPACE             : Fight Mode Animation\n"
			"\n"
			"App\n"
			"  0                : Show help popup\n"
			"  ESC               : Quit";
	}
} // namespace HELP

// ---------- public API you call from your code ----------
static void Help_Toggle() { HELP::show = !HELP::show; }
static void Help_Show(bool on) { HELP::show = on; }
static void Help_SetFontPx(int px) { HELP::fontPx = px; HELP::BuildFont(px); }
static void Help_ShowPopup(HWND hWnd) {
	MessageBoxA(hWnd, HELP::PopupText(), "Controls", MB_OK | MB_ICONINFORMATION);
}

// =================== END HELP OVERLAY MODULE ===================


LRESULT WINAPI WindowProcedure(HWND hWnd, UINT msg, WPARAM wParam, LPARAM lParam)
{
	switch (msg)
	{
	case WM_DESTROY:
		PostQuitMessage(0);
		break;

	case WM_KEYDOWN:
		if (wParam == VK_ESCAPE) PostQuitMessage(0);

		if (wParam == VK_LEFT) {
			angle -= 2.0f;
		}
		else if (wParam == VK_RIGHT) {
			angle += 2.0f;
		}
		// Optional: Add vertical rotation
		else if (wParam == VK_UP) {
			y_angle += 2.0f;
		}
		else if (wParam == VK_DOWN) {
			y_angle -= 2.0f;
		}
		else if (wParam == 'W') {      // move camera closer
			camDist -= 0.5f;
			if (camDist < 2.0f) camDist = 2.0f;  // prevent too close
		}
		else if (wParam == 'S') {      // move camera farther
			camDist += 0.5f;
			if (camDist > 50.0f) camDist = 50.0f;  // prevent too far
		}
		else if (wParam == '1' || wParam == VK_NUMPAD1) { // 1 = Perspective
			usePerspective = true;
		}
		else if (wParam == '2' || wParam == VK_NUMPAD2) { // 2 = Orthographic
			usePerspective = false;
		}
		else if (wParam == 'B') {
			blinking = true;          // do one blink now
			autoBlink = true;         // (re)enable timed blinks
		}
		else if (wParam == 'N') {
			blinking = false;         // stop any blink
			eyeOpen = 1.0f;          // force fully open
			autoBlink = false;        // disable timed blinks
		}
		else if (wParam == VK_OEM_MINUS || wParam == VK_SUBTRACT) {  // '-'
			lightGain -= 0.05f; if (lightGain < 0.20f) lightGain = 0.20f;
		}
		else if (wParam == VK_OEM_PLUS || wParam == VK_ADD) {       // '+'
			lightGain += 0.05f; if (lightGain > 1.20f) lightGain = 1.20f;
		}
		else if (wParam == 'L') {               // toggle lighting mode
			useSpotlight = !useSpotlight;
		}
		else if (wParam == VK_OEM_4) {          // '[' tighter cone
			spotCutoff -= 1.0f; if (spotCutoff < 1.0f) spotCutoff = 1.0f;
		}
		else if (wParam == VK_OEM_6) {          // ']' wider cone
			spotCutoff += 1.0f; if (spotCutoff > 90.0f) spotCutoff = 90.0f;
		}
		else if (wParam == VK_OEM_COMMA) {      // ',' softer focus
			spotExponent -= 1.0f; if (spotExponent < 0.0f) spotExponent = 0.0f;
		}
		else if (wParam == VK_OEM_PERIOD) {     // '.' tighter focus
			spotExponent += 1.0f; if (spotExponent > 128.0f) spotExponent = 128.0f;
		}
		else if (wParam == 'E') {
			gBladeScaleTarget = EXTENDED_BLADE_SCALE;  // extend the blade length
		}
		else if (wParam == 'R') {
			gBladeScaleTarget = 1.0f;                   // reset the blade length
		}
		else if (wParam == 'X') {
			gSwordMode = MODE_ORI;      // existing
			currentBeltTex = texBelt;   // belt -> belt.bmp
			currentSkirtSideTex = texBiegeCloth;   // ORI: sides = beige
			currentSkirtMidTex = texBiegeCloth;   // ORI: middle = beige
			currentHemTex = texHemOri;      // hem -> original
			currentPantsTex = texDarkPants;
			currentUpperSleeveTex = texBiegeCloth;
			currentLapelTex = texBrighterBeige;
			currentCollarTex = texDarkCloth;
			currentInnerShirtTex = texDarkCloth;
			currentWedgeTex = texBrighterBeige;
			currentGoldStripTex = texHemOri;
		}
		else if (wParam == 'Y') {
			gSwordMode = MODE_GOLD;     // existing
			currentBeltTex = texBelt2;  // belt -> belt2.bmp
			currentSkirtSideTex = texDragonClothBlank; // DRAGON: sides = blank
			currentSkirtMidTex = texDragonCloth;      // DRAGON: middle = dragon pattern
			currentHemTex = texHemAlt;      // hem -> alternate
			currentPantsTex = textAPants;
			currentUpperSleeveTex = texBlackCloth;
			currentLapelTex = texPlainBlack;
			currentCollarTex = textAPants;
			currentInnerShirtTex = textAPants;
			currentWedgeTex = texDGrey;
			currentGoldStripTex = texGoldStrip;
		}
		else if (wParam == 'G') {
			gWalkDir = +1;  // moving forward
		}
		else if (wParam == 'F') {
			gWalkDir = -1;  // go back
		}
		else if (wParam == 'H') {
			gWalkDir = 0;
			gWalkPhase = 0.0f;
			swingDeg = 0.0f;
		}
		else if (wParam == 'J') {
			gWalkDir = 0;
			gWalkPhase = 0.0f;
			swingDeg = 0.0f;
			gCharX = 0.0f;
			gCharZ = 0.0f;
		}
		else if (wParam == 'O') {
			gHeadYawDeg -= 3.0f;
			if (gHeadYawDeg < -60.0f) gHeadYawDeg = -60.0f;   // head turn LEFT
		}
		else if (wParam == 'P') {
			gHeadYawDeg += 3.0f;
			if (gHeadYawDeg > 60.0f) gHeadYawDeg = 60.0f;   // head turn RIGHT
		}
		else if (wParam == 'I') {
			gHeadYawDeg = 0.0f;   // head reset (center)
		}
		else if (wParam == 'U') {
			gManualArmL += 5.0f;
			if (gManualArmL > 60.0f) gManualArmL = 60.0f;  // raise left arm
		}
		else if (wParam == 'D') {
			gManualArmL -= 5.0f;
			if (gManualArmL < -60.0f) gManualArmL = -60.0f;  // raise left arm
		}
		else if (wParam == 'T') {
			gManualArmR += 5.0f;
			if (gManualArmR > 60.0f) gManualArmR = 60.0f;   // raise right arm
		}
		else if (wParam == 'V') {
			gManualArmR -= 5.0f;
			if (gManualArmR < -60.0f) gManualArmR = -60.0f;   // raise right arm
		}
		else if (wParam == 'K') {                      // LEFT forward (left uses negative for forward)
			gManualLegL_T -= LEG_STEP_DEG;
			if (gManualLegL_T < -LEG_FRONT_MAX) gManualLegL_T = -LEG_FRONT_MAX;
		}
		else if (wParam == '5') {                      // LEFT backward
			gManualLegL_T += LEG_STEP_DEG;
			if (gManualLegL_T > LEG_BACK_MAX) gManualLegL_T = LEG_BACK_MAX;
		}
		else if (wParam == 'Q') {                      // RIGHT forward (right uses positive for forward)
			gManualLegR_T += LEG_STEP_DEG;
			if (gManualLegR_T > LEG_FRONT_MAX) gManualLegR_T = LEG_FRONT_MAX;
		}
		else if (wParam == '6') {                      // RIGHT backward
			gManualLegR_T -= LEG_STEP_DEG;
			if (gManualLegR_T < -LEG_BACK_MAX) gManualLegR_T = -LEG_BACK_MAX;
		}

		else if (wParam == 'C') {
			gManualArmL = gManualArmR = 0.0f;
			gManualLegL = gManualLegR = 0.0f;
			gManualLegL_T = gManualLegR_T = 0.0f;
		}

		else if (wParam == VK_SPACE) {
			gRage = !gRage;
			if (gRage) { blinking = false; eyeOpen = 1.0f; }
			gMouthExpr = gRage ? MOUTH_NEUTRAL : MOUTH_SMILE;
			gDarkBG = gRage;
			gSwordMode = (gSwordMode == MODE_ORI) ? MODE_GOLD : MODE_ORI;

			KF::Load_ABCDEF();
			KF::Start(/*forward=*/gRage);
		}
		else if (wParam == 'M') {            // press M to cycle boot colors
			gBootPalIndex = (gBootPalIndex + 1) % (int)(sizeof(BOOT_PALS) / sizeof(BOOT_PALS[0]));
		}
		else if (wParam == '0') { Help_ShowPopup(hWnd); }   // optional popup



	default:
		break;
	}

	return DefWindowProc(hWnd, msg, wParam, lParam);
}
//--------------------------------------------------------------------

bool initPixelFormat(HDC hdc)
{
	PIXELFORMATDESCRIPTOR pfd;
	ZeroMemory(&pfd, sizeof(PIXELFORMATDESCRIPTOR));

	pfd.cAlphaBits = 8;
	pfd.cColorBits = 32;
	pfd.cDepthBits = 24;
	pfd.cStencilBits = 0;

	pfd.dwFlags = PFD_DOUBLEBUFFER | PFD_SUPPORT_OPENGL | PFD_DRAW_TO_WINDOW;

	pfd.iLayerType = PFD_MAIN_PLANE;
	pfd.iPixelType = PFD_TYPE_RGBA;
	pfd.nSize = sizeof(PIXELFORMATDESCRIPTOR);
	pfd.nVersion = 1;

	// choose pixel format returns the number most similar pixel format available
	int n = ChoosePixelFormat(hdc, &pfd);

	// set pixel format returns whether it sucessfully set the pixel format
	if (SetPixelFormat(hdc, n, &pfd))
	{
		return true;
	}
	else
	{
		return false;
	}
}
//--------------------------------------------------------------------

// =================== Texture Loader (24/32-bit BMP) ===================
static GLuint loadTexture(const char* filename)
{
	HBITMAP hBMP = (HBITMAP)LoadImageA(GetModuleHandle(NULL), filename,
		IMAGE_BITMAP, 0, 0, LR_CREATEDIBSECTION | LR_LOADFROMFILE);
	if (!hBMP) { MessageBoxA(NULL, filename, "LoadImage failed", MB_OK); return 0; }

	BITMAP bm; GetObject(hBMP, sizeof(bm), &bm);
	const bool is32 = (bm.bmBitsPixel == 32);
	const GLenum srcFmt = is32 ? GL_BGRA_EXT : GL_BGR_EXT;
	const GLint  intFmt = is32 ? GL_RGBA : GL_RGB;

	GLuint id; glGenTextures(1, &id);
	glBindTexture(GL_TEXTURE_2D, id);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT);
	glPixelStorei(GL_UNPACK_ALIGNMENT, 4);

	glTexImage2D(GL_TEXTURE_2D, 0, intFmt, bm.bmWidth, bm.bmHeight, 0,
		srcFmt, GL_UNSIGNED_BYTE, bm.bmBits);

	DeleteObject(hBMP);
	return id;
}

static const GLfloat HAIR_ROOT[3] = { 0.96f, 0.89f, 0.66f }; // bright golden root
static const GLfloat HAIR_MID[3] = { 0.86f, 0.74f, 0.46f }; // saturated gold body
static const GLfloat HAIR_TIP[3] = { 0.65f, 0.52f, 0.30f }; // darker honey ends

static const GLfloat HAIR_INK[3] = { 0.20f, 0.17f, 0.12f }; // line/shadow strokes 
static const GLfloat HAIR_SPEC[3] = { 1.00f, 0.98f, 0.88f }; // highlight pass

static inline float clampf(float x, float a, float b) { return x < a ? a : (x > b ? b : x); }
static inline float smoothstepf(float a, float b, float x) {
	float t = clampf((x - a) / (b - a), 0.0f, 1.0f);
	return t * t * (3.0f - 2.0f * t);
}
static inline void mix3(const GLfloat A[3], const GLfloat B[3], float t, GLfloat out[3]) {
	out[0] = A[0] * (1.0f - t) + B[0] * t;
	out[1] = A[1] * (1.0f - t) + B[1] * t;
	out[2] = A[2] * (1.0f - t) + B[2] * t;
}

static inline void ApplyHeadYawPivot() {
	glTranslatef(0.0f, HEAD_PIVOT_Y, 0.0f);
	glRotatef(gHeadYawDeg, 0, 1, 0);
	glTranslatef(0.0f, -HEAD_PIVOT_Y, 0.0f);
}

// ---- helpers -----------------------------------------------------------
//FIRE
static void drawFireAuraBehind(float cx, float cy, float cz,
	float rx, float ry, float thickness)
{
	glPushMatrix();
	// put it slightly BEHIND the character (negative Z in your setup)
	glTranslatef(cx, cy, cz - 0.03f);

	// ---- save state
	GLboolean wasLight = glIsEnabled(GL_LIGHTING);
	GLboolean wasBlend = glIsEnabled(GL_BLEND);
	GLboolean wasCull = glIsEnabled(GL_CULL_FACE);
	GLboolean depthMask;
	glGetBooleanv(GL_DEPTH_WRITEMASK, &depthMask);

	glDisable(GL_LIGHTING);
	glDisable(GL_CULL_FACE);
	glEnable(GL_BLEND);
	glBlendFunc(GL_SRC_ALPHA, GL_ONE);   // additive
	glDepthMask(GL_FALSE);             // don't touch z-buffer

	const int   N = 72;
	const float TAU = 6.2831853f;
	ULONGLONG ms = GetTickCount64();
	float t = 0.001f * (float)(ms & 0xFFFFFFFF);

	// outer glow ring
	glBegin(GL_TRIANGLE_STRIP);
	for (int i = 0; i <= N; ++i) {
		float a = TAU * i / N;

		// some “licking” wobble
		float wobble = 0.15f * sinf(2.0f * a + 1.7f * t)
			+ 0.10f * sinf(5.0f * a - 1.1f * t)
			+ 0.05f * sinf(11.0f * a + 2.3f * t);

		float r0 = 0.85f + wobble;      // inner edge
		float r1 = r0 + thickness;      // outer edge

		// inner (hot) vertex
		glColor4f(1.00f, 0.85f, 0.25f, 0.55f);
		glVertex3f(rx * r0 * cosf(a), ry * r0 * sinf(a), 0.0f);

		// outer (cool/transparent) vertex
		glColor4f(1.00f, 0.15f, 0.05f, 0.00f);
		glVertex3f(rx * r1 * cosf(a), ry * r1 * sinf(a), 0.0f);
	}
	glEnd();

	// optional soft core
	glBegin(GL_TRIANGLE_FAN);
	glColor4f(1.0f, 0.65f, 0.10f, 0.25f);
	glVertex3f(0, 0, 0);
	for (int i = 0; i <= N; ++i) {
		float a = TAU * i / N;
		float r = 0.55f + 0.05f * sinf(6.0f * a + 1.9f * t);
		glVertex3f(rx * r * cosf(a), ry * r * sinf(a), 0.0f);
	}
	glEnd();

	// ---- restore state
	glDepthMask(depthMask);
	if (!wasBlend) glDisable(GL_BLEND);
	if (wasCull)  glEnable(GL_CULL_FACE);
	if (wasLight) glEnable(GL_LIGHTING);
	glPopMatrix();
}




//nose
static void normal3f(float ax, float ay, float az,
	float bx, float by, float bz,
	float cx, float cy, float cz)
{
	// n = (b-a) x (c-a)
	float ux = bx - ax, uy = by - ay, uz = bz - az;
	float vx = cx - ax, vy = cy - ay, vz = cz - az;
	float nx = uy * vz - uz * vy;
	float ny = uz * vx - ux * vz;
	float nz = ux * vy - uy * vx;
	float len = sqrtf(nx * nx + ny * ny + nz * nz);
	if (len < 1e-6f) { glNormal3f(0, 0, 1); return; }
	glNormal3f(nx / len, ny / len, nz / len);
}

// Rectangular base -> single apex wedge pointing along +Z (local space)
static void drawRectNoseWedge(float baseW, float baseH, float length)
{
	const float hw = baseW * 0.5f;
	const float hh = baseH * 0.5f;

	// Base rectangle (on Z=0)
	float bl[3] = { -hw, -hh, 0 };  // bottom-left
	float br[3] = { hw, -hh, 0 };  // bottom-right
	float tr[3] = { hw,  hh, 0 };  // top-right
	float tl[3] = { -hw,  hh, 0 };  // top-left

	// Apex (tip)
	float ap[3] = { 0, 0, length };

	glBegin(GL_TRIANGLES);
	// face 1: base bottom edge -> apex
	normal3f(bl[0], bl[1], bl[2], br[0], br[1], br[2], ap[0], ap[1], ap[2]);
	glVertex3fv(bl); glVertex3fv(br); glVertex3fv(ap);

	// face 2: base right edge -> apex
	normal3f(br[0], br[1], br[2], tr[0], tr[1], tr[2], ap[0], ap[1], ap[2]);
	glVertex3fv(br); glVertex3fv(tr); glVertex3fv(ap);

	// face 3: base top edge -> apex
	normal3f(tr[0], tr[1], tr[2], tl[0], tl[1], tl[2], ap[0], ap[1], ap[2]);
	glVertex3fv(tr); glVertex3fv(tl); glVertex3fv(ap);

	// face 4: base left edge -> apex
	normal3f(tl[0], tl[1], tl[2], bl[0], bl[1], bl[2], ap[0], ap[1], ap[2]);
	glVertex3fv(tl); glVertex3fv(bl); glVertex3fv(ap);
	glEnd();

	// Optional: draw a tiny base quad to close it against the face (flat normal)
	glBegin(GL_QUADS);
	glNormal3f(0, 0, -1);
	glVertex3fv(bl); glVertex3fv(br); glVertex3fv(tr); glVertex3fv(tl);
	glEnd();
}


//Face
void face() {
	// Head (slightly elongated sphere)
	glPushMatrix();
	glColor3f(1.0f, 0.92f, 0.8f);// skin color
	glTranslatef(0.0f, 2.2f, 0.0f);
	glRotatef(-25.0f, 1.0f, 0.0f, 0.0f);
	glScalef(1.0f, 1.2f, 1.0f); // elongate vertically
	GLUquadric* quad = gluNewQuadric();
	gluSphere(quad, 0.8, 32, 32);
	gluDeleteQuadric(quad);
	glPopMatrix();


	//nose
	glPushMatrix();
	glColor3f(1.0f, 0.90f, 0.75f);            // slightly darker skin tone
	glTranslatef(0.0f, 1.9f, 0.84f);         // where your old nose was

	// Local +Z should point out of the face
	glRotatef(-90.0f, 1, 0, 0);                 // align +Z forward (as you did)

	// Roll around Z so we see the "side" of the rectangle (like the reference)
	glRotatef(95.0f, 0, 0, 1);                  // try 15–35

	// Tilt nose slightly upward (node-ish tip)
	glRotatef(-2.0f, 1, 0, 0);                 // negative = tip up for your setup

	// Size (world units): width, height, length
	drawRectNoseWedge(0.32f, 0.1f, 0.45f);   // try 0.20–0.28 width, 0.08–0.12 height
	glPopMatrix();

}


//Ears
void fairyRightEar() {
	// Right Ear - fairy shape (pointing forward)
	glPushMatrix();
	glColor3f(1.0f, 0.85f, 0.75f); // skin color
	glTranslatef(0.8f, 2.2f, -0.1f); // move to right side of head
	glRotatef(-10.0f, 1.0f, 0.0f, 0.0f);
	glRotatef(195.0f, 0.0f, 1.0f, 0.0f); // rotate around Y-axis to face forward
	glRotatef(-120.0f, 0.0f, 0.0f, 1.0f); // slant outward like '\'
	glScalef(0.6f, 1.9f, 0.3f); // elongate vertically
	GLUquadric* ear = gluNewQuadric();
	gluCylinder(ear, 0.3, 0.0, 1.0, 16, 8); // cone-shaped ear
	gluDeleteQuadric(ear);
	glPopMatrix();

	// Red Piercing (sphere) at ear tip
	GLUquadric* pierce = gluNewQuadric();
	glPushMatrix();
	glColor3f(1.0f, 0.0f, 0.0f); // red
	glTranslatef(0.85f, 2.1f, -0.1f); // adjust to tip of forward-facing ear
	gluSphere(pierce, 0.05, 16, 16); // small red sphere
	glPopMatrix();
	gluDeleteQuadric(pierce);
}
void fairyLeftEar() {
	// Left Ear - fairy shape (pointing forward)
	glPushMatrix();
	glColor3f(1.0f, 0.85f, 0.75f); // skin color
	glTranslatef(-0.8f, 2.2f, -0.1f); // move to left side
	glRotatef(-10.0f, 1.0f, 0.0f, 0.0f); // rotate around X-axis opposite
	glRotatef(-195.0f, 0.0f, 1.0f, 0.0f); // rotate around Y-axis opposite
	glRotatef(120.0f, 0.0f, 0.0f, 1.0f); // slant outward like '/'
	glScalef(0.5f, 1.9f, 0.3f); // elongate vertically

	GLUquadric* ear = gluNewQuadric();
	gluCylinder(ear, 0.3, 0.0, 1.0, 16, 8);

	gluDeleteQuadric(ear);
	glPopMatrix();
}

//Horns
struct Vec2 { float x, y; };
static int W = 900, H = 1200;

Vec2 bezier(const Vec2 c[4], float t) {
	float u = 1.f - t;
	float b0 = u * u * u, b1 = 3 * u * u * t, b2 = 3 * u * t * t, b3 = t * t * t;
	return { b0 * c[0].x + b1 * c[1].x + b2 * c[2].x + b3 * c[3].x,
			 b0 * c[0].y + b1 * c[1].y + b2 * c[2].y + b3 * c[3].y };
}


static inline void polyline(const std::vector<Vec2>& p,
	float r = 0, float g = 0, float b = 0, float a = 1, float w = 3.f)
{
	if (p.empty()) return;
	glLineWidth(w);
	glColor4f(r, g, b, a);
	glBegin(GL_LINE_STRIP);
	for (auto& v : p) glVertex2f(v.x, v.y);
	glEnd();
}

inline void polylineGradient(const std::vector<Vec2>& p,
	float r1, float g1, float b1, float a1,
	float r2, float g2, float b2, float a2,
	float w = 3.f)
{
	if (p.empty()) return;
	glLineWidth(w);
	glBegin(GL_LINE_STRIP);
	const int n = (int)p.size();
	for (int i = 0; i < n; ++i) {
		float t = (n > 1) ? (float)i / (n - 1) : 0.0f;
		float r = r1 * (1 - t) + r2 * t;
		float g = g1 * (1 - t) + g2 * t;
		float b = b1 * (1 - t) + b2 * t;
		float a = a1 * (1 - t) + a2 * t;
		glColor4f(r, g, b, a);
		glVertex2f(p[i].x, p[i].y);
	}
	glEnd();
}

static inline void triangleStrip(const std::vector<Vec2>& a, const std::vector<Vec2>& b,
	float r1, float g1, float b1,
	float r2, float g2, float b2)
{
	size_t n = std::min(a.size(), b.size());
	glBegin(GL_TRIANGLE_STRIP);
	for (size_t i = 0; i < n; ++i) {
		float t = (n > 1) ? float(i) / float(n - 1) : 0.0f;
		float rr = r1 * (1 - t) + r2 * t;
		float gg = g1 * (1 - t) + g2 * t;
		float bb = b1 * (1 - t) + b2 * t;
		glColor3f(rr, gg, bb);
		glVertex2f(a[i].x, a[i].y);
		glVertex2f(b[i].x, b[i].y);
	}
	glEnd();
}


// ---------- 3D horn: sweep an ellipse along a cubic Bézier ----------
struct Vec3 { float x, y, z; };
static inline Vec3 vadd(Vec3 a, Vec3 b) { return { a.x + b.x,a.y + b.y,a.z + b.z }; }
static inline Vec3 vsub(Vec3 a, Vec3 b) { return { a.x - b.x,a.y - b.y,a.z - b.z }; }
static inline Vec3 vmul(Vec3 a, float k) { return { a.x * k,a.y * k,a.z * k }; }
static inline Vec3 vcross(Vec3 a, Vec3 b) {
	return { a.y * b.z - a.z * b.y, a.z * b.x - a.x * b.z, a.x * b.y - a.y * b.x };
}
static inline float vdot(Vec3 a, Vec3 b) { return a.x * b.x + a.y * b.y + a.z * b.z; }
static inline Vec3 vnorm(Vec3 a) {
	float L = sqrtf(vdot(a, a)); return (L > 1e-8f) ? vmul(a, 1.0f / L) : Vec3{ 0,0,1 };
}

// Bézier point/tangent in 3D (use XY like before; z can be 0 or curved if you want)
static inline Vec3 bezP(float t, const Vec3 c[4]) {
	float u = 1.f - t, uu = u * u, tt = t * t;
	return vadd(vadd(vmul(c[0], uu * u), vmul(c[1], 3 * u * u * t)),
		vadd(vmul(c[2], 3 * u * tt), vmul(c[3], tt * t)));
}
static inline Vec3 bezT(float t, const Vec3 c[4]) {
	// derivative of cubic
	return vadd(vadd(vmul(vsub(c[1], c[0]), 3 * (1 - t) * (1 - t)),
		vmul(vsub(c[2], c[1]), 6 * (1 - t) * t)),
		vmul(vsub(c[3], c[2]), 3 * t * t));
}

// Sweep: spine control points, base→tip radii (major/minor), segments along, slices around
void drawHorn3D(const Vec3 ctrl[4],
	float baseMajor, float baseMinor,
	float tipMajor, float tipMinor,
	int seg = 28, int slices = 12)
{
	// color from base (warm) to tip (ivory)
	const GLfloat cBase[3] = { 0.86f, 0.74f, 0.50f };
	const GLfloat cTip[3] = { 0.97f, 0.93f, 0.82f };

	// build rings and connect them
	for (int i = 0; i < seg; ++i) {
		float t0 = (float)i / (float)seg;
		float t1 = (float)(i + 1) / (float)seg;

		Vec3 P0 = bezP(t0, ctrl);
		Vec3 P1 = bezP(t1, ctrl);
		Vec3 T0 = vnorm(bezT(t0, ctrl));
		Vec3 T1 = vnorm(bezT(t1, ctrl));

		// stable frame: choose an "up" that isn't parallel to T
		Vec3 up0 = (fabsf(T0.z) > 0.8f) ? Vec3{ 1,0,0 } : Vec3{ 0,0,1 };
		Vec3 N0 = vnorm(vcross(up0, T0));   // normal in ring plane
		Vec3 B0 = vnorm(vcross(T0, N0));    // binormal

		Vec3 up1 = (fabsf(T1.z) > 0.8f) ? Vec3{ 1,0,0 } : Vec3{ 0,0,1 };
		Vec3 N1 = vnorm(vcross(up1, T1));
		Vec3 B1 = vnorm(vcross(T1, N1));

		float a0 = baseMajor + (tipMajor - baseMajor) * t0;
		float b0 = baseMinor + (tipMinor - baseMinor) * t0;
		float a1 = baseMajor + (tipMajor - baseMajor) * t1;
		float b1 = baseMinor + (tipMinor - baseMinor) * t1;

		// slight flatten to look like antler plates: use fewer slices & a<b
		glBegin(GL_TRIANGLE_STRIP);
		for (int j = 0; j <= slices; ++j) {
			float ang = 2.0f * (float)M_PI * (float)j / (float)slices;
			float ca = cosf(ang), sa = sinf(ang);

			// ring 0
			Vec3 off0 = vadd(vmul(N0, a0 * ca), vmul(B0, b0 * sa));
			Vec3 V0 = vadd(P0, off0);
			Vec3 n0 = vnorm(off0);             // good enough for smooth shading
			GLfloat col0[3] = {
				cBase[0] * (1.f - t0) + cTip[0] * t0,
				cBase[1] * (1.f - t0) + cTip[1] * t0,
				cBase[2] * (1.f - t0) + cTip[2] * t0
			};
			glColor3fv(col0);
			glNormal3f(n0.x, n0.y, n0.z);
			glVertex3f(V0.x, V0.y, V0.z);

			// ring 1
			Vec3 off1 = vadd(vmul(N1, a1 * ca), vmul(B1, b1 * sa));
			Vec3 V1 = vadd(P1, off1);
			Vec3 n1 = vnorm(off1);
			GLfloat col1[3] = {
				cBase[0] * (1.f - t1) + cTip[0] * t1,
				cBase[1] * (1.f - t1) + cTip[1] * t1,
				cBase[2] * (1.f - t1) + cTip[2] * t1
			};
			glColor3fv(col1);
			glNormal3f(n1.x, n1.y, n1.z);
			glVertex3f(V1.x, V1.y, V1.z);
		}
		glEnd();
	}
}


// Eyes
static void fillEllipse3D(float rx, float ry, int seg = 64) {
	glBegin(GL_TRIANGLE_FAN);
	glVertex3f(0, 0, 0);
	for (int i = 0; i <= seg; ++i) {
		float t = 2.0f * M_PI * i / seg;
		glVertex3f(rx * cosf(t), ry * sinf(t), 0.0f);
	}
	glEnd();
}

// Draws a thin arc (eyeliner stroke) around an ellipse
// --- helper (same as before) ---
static void drawEyeliner(float rx, float ry,
	float startDeg, float endDeg,
	float thickness, float r, float g, float b,
	int seg = 64)
{
	// normalize so end >= start by adding 360 when needed
	if (endDeg < startDeg) endDeg += 360.0f;

	float a0 = startDeg * (float)M_PI / 180.0f;
	float a1 = endDeg * (float)M_PI / 180.0f;

	glColor3f(r, g, b);
	glBegin(GL_TRIANGLE_STRIP);
	for (int i = 0; i <= seg; ++i) {
		float t = a0 + (a1 - a0) * (float)i / seg;

		float x = rx * cosf(t);
		float y = ry * sinf(t);

		// outward normal for thickness
		float nx = cosf(t) / rx, ny = sinf(t) / ry;
		float L = sqrtf(nx * nx + ny * ny); nx /= L; ny /= L;

		glVertex3f(x + nx * thickness * 0.5f, y + ny * thickness * 0.5f, 0.0f);
		glVertex3f(x - nx * thickness * 0.5f, y - ny * thickness * 0.5f, 0.0f);
	}
	glEnd();
}
inline void setEyelinerColor(bool darker = false) {
	if (gRage) {
		// main red and slightly darker red for inner edge
		if (darker) glColor3f(0.42f, 0.10f, 0.10f);
		else        glColor3f(0.78f, 0.18f, 0.20f);
	}
	else {
		if (darker) glColor3f(0.0f, 0.0f, 0.0f);
		else        glColor3f(0.0f, 0.0f, 0.0f);
	}
}


void drawEye3D(float cx, float cy, float cz,
	float sx = 0.4f, float sy = 0.1f, bool flip = false)
{
	glPushMatrix();
	glTranslatef(cx, cy, cz);

	// Save & disable state (flat color + no z-fighting)
	GLboolean wasDepth = glIsEnabled(GL_DEPTH_TEST);
	GLboolean wasLight = glIsEnabled(GL_LIGHTING);
	if (wasLight) glDisable(GL_LIGHTING);
	//if (wasDepth) glDisable(GL_DEPTH_TEST);

	glScalef(flip ? -1.0f : 1.0f, 1.0f, 1.0f);

	// Nudge forward a hair to avoid z-fight with the face
	glTranslatef(0.f, 0.f, 0.01f);

	// --- your original blink-aware drawing (unchanged) ---
	float blinkSy = sy * eyeOpen;

	// Sclera
	glColor3f(0.99f, 0.98f, 0.98f);
	fillEllipse3D(sx, blinkSy);

	if (eyeOpen > 0.05f) {
		if (!gRage) {
			glTranslatef(0.02f, 0.0f, 0.002f);
			glColor3f(0.83f, 0.72f, 0.45f);            // iris
			fillEllipse3D(sx * 0.48f, blinkSy * 0.97f);

			glTranslatef(0.0f, 0.0f, 0.0015f);
			glColor3f(0.0f, 0.0f, 0.0f);               // pupil
			fillEllipse3D(sx * 0.26f, blinkSy * 0.55f);

			glTranslatef(0.05f, 0.04f, 0.001f);
			glColor3f(1.0f, 1.0f, 1.0f);               // highlight
			fillEllipse3D(sx * 0.15f, blinkSy * 0.15f);
		}
		else {
			// RAGE: fill the center with white (no iris/pupil)
			glTranslatef(0.01f, 0.0f, 0.0035f);
			glColor3f(1.0f, 1.0f, 1.0f);
			fillEllipse3D(sx * 0.52f, blinkSy * 0.98f);

			// tiny extra “glow” cap
			glTranslatef(0.0f, 0.0f, 0.001f);
			glColor3f(0.98f, 0.98f, 1.0f);
			fillEllipse3D(sx * 0.40f, blinkSy * 0.75f);
		}
	}


	// Eyeliner on top
	glTranslatef(-0.02f, 0.0f, 0.012f);
	drawEyeliner(sx, blinkSy, -10.0f, 170.0f, 0.14f * sx,
		gRage ? 0.78f : 0.0f,
		gRage ? 0.18f : 0.0f,
		gRage ? 0.20f : 0.0f);

	// Restore state
	if (wasLight) glEnable(GL_LIGHTING);
	if (wasDepth) glEnable(GL_DEPTH_TEST);
	glPopMatrix();
}
static inline Vec2 add(Vec2 a, Vec2 b) { return { a.x + b.x, a.y + b.y }; }
static inline Vec2 sub(Vec2 a, Vec2 b) { return { a.x - b.x, a.y - b.y }; }
static inline Vec2 mul(Vec2 a, float k) { return { a.x * k, a.y * k }; }
static inline float len(Vec2 a) { return sqrtf(a.x * a.x + a.y * a.y); }
static inline Vec2 norm(Vec2 a) { float L = len(a); return (L > 1e-6f) ? Vec2{ a.x / L,a.y / L } : Vec2{ 0,1 }; }

// --- cubic Bézier point & tangent ---
static inline Vec2 bezierP(float t, Vec2 p0, Vec2 p1, Vec2 p2, Vec2 p3) {
	float u = 1.0f - t;
	float uu = u * u, tt = t * t;
	return add(
		add(mul(p0, uu * u),             // u^3 P0
			mul(p1, 3 * u * u * t)),        // 3 u^2 t P1
		add(mul(p2, 3 * u * tt),           // 3 u t^2 P2
			mul(p3, tt * t))            // t^3 P3
	);
}
static inline Vec2 bezierT(float t, Vec2 p0, Vec2 p1, Vec2 p2, Vec2 p3) {
	// derivative of cubic: 3[(1-t)^2(P1-P0) + 2(1-t)t(P2-P1) + t^2(P3-P2)]
	Vec2 a = mul(sub(p1, p0), 3 * (1 - t) * (1 - t));
	Vec2 b = mul(sub(p2, p1), 6 * (1 - t) * t);
	Vec2 c = mul(sub(p3, p2), 3 * t * t);
	return add(add(a, b), c);
}

// --- draw a tapered stroke along a cubic Bézier as a triangle strip ---
static void drawTaperedBezier(Vec2 p0, Vec2 p1, Vec2 p2, Vec2 p3,
	float w_start, float w_mid, float w_end,
	float r, float g, float b,
	int seg = 48)
{
	glColor3f(r, g, b);
	glBegin(GL_TRIANGLE_STRIP);
	for (int i = 0; i <= seg; ++i) {
		float t = (float)i / (float)seg;

		// width profile: start -> mid -> end (simple 2-segment lerp)
		float w = (t < 0.5f)
			? (w_start + (w_mid - w_start) * (t / 0.5f))
			: (w_mid + (w_end - w_mid) * ((t - 0.5f) / 0.5f));

		Vec2 P = bezierP(t, p0, p1, p2, p3);
		Vec2 T = bezierT(t, p0, p1, p2, p3);
		Vec2 N = norm({ -T.y, T.x }); // left normal

		Vec2 A = add(P, mul(N, +0.5f * w));
		Vec2 B = add(P, mul(N, -0.5f * w));

		glVertex3f(A.x, A.y, 0.0f);
		glVertex3f(B.x, B.y, 0.0f);
	}
	glEnd();
}

void drawEyebrow(float cx, float cy, float cz,
	float scaleX = 1.0f, float scaleY = 1.0f,
	float rotDeg = 0.0f, bool flip = false)
{
	glPushMatrix();
	glTranslatef(cx, cy, cz);
	glRotatef(rotDeg, 0, 0, 1);
	glScalef((flip ? -scaleX : scaleX), scaleY, 1.0f);

	Vec2 p0 = { -0.45f,  0.05f };  // inner start
	Vec2 p1 = { -0.15f,  0.15f };  // lift
	Vec2 p2 = { 0.25f,  0.10f };  // descend
	Vec2 p3 = { 0.55f, -0.00f };  // outer tip

	// Base stroke (thicker mid)
	drawTaperedBezier(p0, p1, p2, p3,
		/*w_start*/0.035f, /*w_mid*/0.11f, /*w_end*/0.020f,
		/*color*/  0.65f, 0.52f, 0.30f);

	// Lower-edge darker pass for density
	glTranslatef(0.0f, -0.01f, 0.001f); // tiny down & forward
	drawTaperedBezier(p0, p1, p2, p3,
		0.018f, 0.045f, 0.012f,
		0.22f, 0.17f, 0.10f);

	glPopMatrix();
}


void drawRedEyeliner(float cx, float cy, float cz,
	float scaleX = 1.0f, float scaleY = 1.0f,
	float rotDeg = 0.0f, bool flip = false)
{
	glPushMatrix();
	glTranslatef(cx, cy, cz);
	glRotatef(rotDeg, 0, 0, 1);
	glScalef((flip ? -scaleX : scaleX), scaleY, 1.0f);

	Vec2 p0 = { -0.45f,  0.05f };  // inner start
	Vec2 p1 = { -0.15f,  0.15f };  // lift
	Vec2 p2 = { 0.25f,  0.10f };  // descend
	Vec2 p3 = { 0.55f, -0.00f };  // outer tip

	// Base stroke (thicker mid)
	drawTaperedBezier(p0, p1, p2, p3,
		0.035f, 0.11f, 0.020f,
		/*color*/ 0.78f, 0.20f, 0.20f);   // was 0.55,0.0,0.0

	// Lower-edge pass (still darker, but lighter than before)
	glTranslatef(0.0f, -0.01f, 0.001f);
	drawTaperedBezier(p0, p1, p2, p3,
		0.018f, 0.045f, 0.012f,
		0.35f, 0.20f, 0.18f);             // was 0.22,0.17,0.10

	glPopMatrix();
}



//Mouth
// Draw an anime mouth with options for smile/frown and opening.
// cx,cy,cz: position. scaleX=length, scaleY=height. rotDeg: tilt.
// expression: -1=frown, 0=neutral, +1=smile
// openT: 0=closed line, up to 1=fully open
// lipWidth: overall lip thickness (base for the tapered stroke)
void drawMouth(float cx, float cy, float cz,
	float scaleX = 1.0f, float scaleY = 1.0f,
	float rotDeg = 0.0f,
	float expression = 0.0f,
	float openT = 0.0f,
	float lipWidth = 0.06f)
{
	glPushMatrix();
	glTranslatef(cx, cy, cz);
	glRotatef(rotDeg, 0, 0, 1);
	glScalef(scaleX, scaleY, 1.0f);

	// --------- 1) Curve for the lip line (Bézier) ----------
	// Base span of the mouth
	float L = 0.70f;                   // horizontal half-length
	float arch = 0.12f * expression;   // positive = smile up, negative = frown down

	Vec2 p0 = { -L, 0.0f };
	Vec2 p3 = { L, 0.0f };
	// Control points: push up/down by arch for smile/frown
	Vec2 p1 = { -L * 0.35f, arch };
	Vec2 p2 = { L * 0.35f, arch };

	// --------- CLOSED mouth path (thin ? thick ? thin) ----------
	// If openT is tiny, just draw the tapered line and bail out.
	if (openT <= 0.02f) {
		drawTaperedBezier(p0, p1, p2, p3,
			lipWidth * 0.25f, lipWidth * 1.00f, lipWidth * 0.25f,
			/*color*/ 0.08f, 0.06f, 0.05f,
			/*seg*/ 48);
		glPopMatrix();
		return;
	}

	// --------- 2) OPEN mouth interior ----------
	// Height of opening scales with openT; also biased by expression (bigger when smiling)
	float h = (0.10f + 0.08f * fmaxf(0.0f, expression)) * openT;

	// Draw a simple rounded capsule for the inner mouth (dark)
	// We'll approximate a capsule with a triangle fan ellipse scaled in X.
	auto fillEllipse2D = [](float rx, float ry, float z = 0.0f, int seg = 48) {
		glBegin(GL_TRIANGLE_FAN);
		glVertex3f(0, 0, z);
		for (int i = 0; i <= seg; ++i) {
			float t = (float)i / (float)seg * 2.0f * (float)M_PI;
			glVertex3f(rx * cosf(t), ry * sinf(t), z);
		}
		glEnd();
		};

	// Inner mouth base
	glPushMatrix();
	glTranslatef(0.0f, arch * 0.6f, 0.001f); // follow the smile arc a bit
	glColor3f(0.05f, 0.02f, 0.03f);        // very dark red/brown
	fillEllipse2D(L * 0.80f, h, 0.0f, 64);

	// Teeth (top band) — small inset white ellipse
	glTranslatef(0.0f, h * 0.25f, 0.0008f);
	glColor3f(0.98f, 0.98f, 0.99f);
	fillEllipse2D(L * 0.62f, h * 0.35f, 0.0f, 48);

	// Tongue — bottom ellipse
	glTranslatef(0.0f, -h * 0.65f, 0.0006f);
	glColor3f(0.85f, 0.38f, 0.44f);
	fillEllipse2D(L * 0.45f, h * 0.45f, 0.0f, 48);
	glPopMatrix();

	// --------- 3) Lip outline over the top (tapered) ----------
	// Draw the same Bézier as a lip line to sharpen the silhouette.
	glTranslatef(0, 0, 0.0025f);
	drawTaperedBezier(p0, p1, p2, p3,
		lipWidth * 0.25f, lipWidth * 1.10f, lipWidth * 0.25f,
		0.07f, 0.05f, 0.04f,
		56);

	glPopMatrix();
}


void curvedHairStrandMesh(float baseRadius, float height, int slices, int stacks) {
	float stackHeight = height / stacks;

	// how much of the *end* is darkened and how strong it is
	const float bottomZone = 0.45f; // last 35% of the strand
	const float bottomDarkPower = 0.65f; // how strongly to pull toward dark

	for (int i = 0; i < stacks; ++i) {
		float z0 = i * stackHeight;
		float z1 = (i + 1) * stackHeight;

		float curveFactor0 = 0.2f * sinf(z0 / height * (float)M_PI);
		float curveFactor1 = 0.2f * sinf(z1 / height * (float)M_PI);

		float r0 = baseRadius * (1.0f - (float)i / stacks);
		float r1 = baseRadius * (1.0f - (float)(i + 1) / stacks);

		// normalized along-strand (0 at base → 1 at tip)
		float t0 = (float)i / (float)stacks;
		float t1 = (float)(i + 1) / (float)stacks;

		// base gradient (root → mid → tip)
		GLfloat base0[3]; { GLfloat rm[3]; mix3(HAIR_ROOT, HAIR_MID, t0, rm); mix3(rm, HAIR_TIP, t0, base0); }
		GLfloat base1[3]; { GLfloat rm[3]; mix3(HAIR_ROOT, HAIR_MID, t1, rm); mix3(rm, HAIR_TIP, t1, base1); }

		// darker target we’ll blend toward at the bottom
		GLfloat darkTarget[3]; mix3(HAIR_INK, HAIR_ROOT, 0.70f, darkTarget);

		// weight rises smoothly only near the *end* of the strand
		float w0 = smoothstepf(1.0f - bottomZone, 1.0f, t0) * bottomDarkPower;
		float w1 = smoothstepf(1.0f - bottomZone, 1.0f, t1) * bottomDarkPower;

		// final colors
		GLfloat C0[3], C1[3];
		C0[0] = base0[0] * (1.0f - w0) + darkTarget[0] * w0;
		C0[1] = base0[1] * (1.0f - w0) + darkTarget[1] * w0;
		C0[2] = base0[2] * (1.0f - w0) + darkTarget[2] * w0;

		C1[0] = base1[0] * (1.0f - w1) + darkTarget[0] * w1;
		C1[1] = base1[1] * (1.0f - w1) + darkTarget[1] * w1;
		C1[2] = base1[2] * (1.0f - w1) + darkTarget[2] * w1;

		glBegin(GL_TRIANGLE_STRIP);
		for (int j = 0; j <= slices; ++j) {
			float ang = j * 3.0f * (float)M_PI / slices;
			float cx = cosf(ang), cy = sinf(ang);
			glNormal3f(cx, cy, 0.0f);

			glColor3fv(C0);
			glVertex3f(r0 * cx + curveFactor0, r0 * cy, z0);

			glNormal3f(cx, cy, 0.0f);
			glColor3fv(C1);
			glVertex3f(r1 * cx + curveFactor1, r1 * cy, z1);
		}
		glEnd();
	}
}


#ifndef M_PI
#define M_PI 3.14159265358979323846
#endif


void drawHalfCircleCap(float radius, int slices, int stacks) {
	for (int i = 0; i < stacks; i++) {
		float t0 = (M_PI / 2.0f) * (float)i / (float)stacks;
		float t1 = (M_PI / 2.0f) * (float)(i + 1) / (float)stacks;

		glBegin(GL_TRIANGLE_STRIP);
		for (int j = 0; j <= slices; j++) {
			float p = (2.0f * M_PI * (float)j) / (float)slices;

			float x0 = cosf(t0) * cosf(p), y0 = sinf(t0), z0 = cosf(t0) * sinf(p);
			float x1 = cosf(t1) * cosf(p), y1 = sinf(t1), z1 = cosf(t1) * sinf(p);

			glColor3f(0.93f, 0.85f, 0.65f);
			glNormal3f(x0, y0, z0); glVertex3f(radius * x0, radius * y0, radius * z0);
			glNormal3f(x1, y1, z1); glVertex3f(radius * x1, radius * y1, radius * z1);
		}
		glEnd();
	}
}


void drawHair() {

	//short
	glPushMatrix();
	glTranslatef(0.73f, 2.8f, 0.35f); // attach to head
	glRotatef(85.0f, 1.0f, 0.0f, 0.0f); // orient Z as up
	glRotatef(-10.0f, 0.0f, 1.0f, 0.0f); // orient Z as up
	curvedHairStrandMesh(0.15f, 0.75f, 24, 20);
	glPopMatrix();

	glPushMatrix();
	glTranslatef(0.73f, 2.8f, 0.4f); // attach to head
	glRotatef(85.0f, 1.0f, 0.0f, 0.0f); // orient Z as up
	glRotatef(-23.0f, 0.0f, 1.0f, 0.0f); // orient Z as up
	curvedHairStrandMesh(0.19f, 0.65f, 24, 20);
	glPopMatrix();

	//long
	//middle
	glPushMatrix();
	glTranslatef(-0.13f, 3.3f, 0.43f); // attach to head
	glRotatef(73.0f, 1.0f, 0.0f, 0.0f); // x
	glRotatef(-25.0f, 0.0f, 1.0f, 0.0f); // y
	glRotatef(110.0f, 0.0f, 0.0f, 1.0f); // z
	curvedHairStrandMesh(0.27f, 1.2f, 24, 20);
	glPopMatrix();

	glPushMatrix();
	glTranslatef(0.12f, 3.3f, 0.43f); // attach to head
	glRotatef(73.0f, 1.0f, 0.0f, 0.0f); // orient Z as up
	glRotatef(-25.0f, 0.0f, 1.0f, 0.0f); // orient Z as up
	glRotatef(65.0f, 0.0f, 0.0f, 1.0f); // orient Z as up
	curvedHairStrandMesh(0.23f, 1.1f, 24, 20);
	glPopMatrix();

	glPushMatrix(); //middle the second one
	glTranslatef(0.25f, 3.3f, 0.45f); // attach to head
	glRotatef(73.0f, 1.0f, 0.0f, 0.0f); // orient Z as up
	glRotatef(-20.0f, 0.0f, 1.0f, 0.0f); // orient Z as up
	glRotatef(60.0f, 0.0f, 0.0f, 1.0f); // orient Z as up
	curvedHairStrandMesh(0.23f, 1.1f, 24, 20);
	glPopMatrix();

	//right side
	glPushMatrix();
	glTranslatef(0.38f, 3.15f, 0.44f); // attach to head
	glRotatef(80.0f, 1.0f, 0.0f, 0.0f); // orient Z as up
	glRotatef(30.0f, 0.0f, 1.0f, 0.0f); // orient Z as up
	glRotatef(85.0f, 0.0f, 0.0f, 1.0f); // orient Z as up
	curvedHairStrandMesh(0.22f, 1.1f, 24, 20);
	glPopMatrix();

	glPushMatrix();
	glTranslatef(0.5f, 3.1f, 0.45f); // attach to head
	glRotatef(90.0f, 1.0f, 0.0f, 0.0f); // orient Z as up
	glRotatef(40.0f, 0.0f, 1.0f, 0.0f); // orient Z as up
	glRotatef(90.0f, 0.0f, 0.0f, 1.0f); // orient Z as up
	curvedHairStrandMesh(0.20f, 1.0f, 24, 20);
	glPopMatrix();

	glPushMatrix();
	glTranslatef(0.6f, 3.1f, 0.45f); // attach to head
	glRotatef(90.0f, 1.0f, 0.0f, 0.0f); // orient Z as up
	glRotatef(10.0f, 0.0f, 1.0f, 0.0f); // orient Z as up
	glRotatef(0.0f, 0.0f, 0.0f, 1.0f); // orient Z as up
	curvedHairStrandMesh(0.18f, 1.1f, 24, 20);
	glPopMatrix();

	glPushMatrix();
	glTranslatef(0.65f, 3.1f, 0.3f); // attach to head
	glRotatef(95.0f, 1.0f, 0.0f, 0.0f); // orient Z as up
	glRotatef(10.0f, 0.0f, 1.0f, 0.0f); // orient Z as up
	glRotatef(0.0f, 0.0f, 0.0f, 1.0f); // orient Z as up
	curvedHairStrandMesh(0.18f, 1.4f, 24, 20);
	glPopMatrix();

	glPushMatrix();
	glTranslatef(0.7f, 3.0f, 0.15f); // attach to head
	glRotatef(95.0f, 1.0f, 0.0f, 0.0f); // orient Z as up
	glRotatef(5.0f, 0.0f, 1.0f, 0.0f); // orient Z as up
	glRotatef(0.0f, 0.0f, 0.0f, 1.0f); // orient Z as up
	curvedHairStrandMesh(0.26f, 1.1f, 24, 20);
	glPopMatrix();

	//left side
	glPushMatrix();
	glTranslatef(-0.48f, 3.25f, 0.50f); // attach to head
	glRotatef(90.0f, 1.0f, 0.0f, 0.0f); // orient Z as up
	glRotatef(-30.0f, 0.0f, 1.0f, 0.0f); // orient Z as up
	glRotatef(95.0f, 0.0f, 0.0f, 1.0f); // orient Z as up
	curvedHairStrandMesh(0.22f, 1.21f, 24, 20);
	glPopMatrix();

	glPushMatrix();
	glTranslatef(-0.61f, 3.2f, 0.45f); // attach to head
	glRotatef(90.0f, 1.0f, 0.0f, 0.0f); // orient Z as up
	glRotatef(-10.0f, 0.0f, 1.0f, 0.0f); // orient Z as up
	glRotatef(-180.0f, 0.0f, 0.0f, 1.0f); // orient Z as up
	curvedHairStrandMesh(0.21f, 1.2f, 24, 20);
	glPopMatrix();

	glPushMatrix();
	glTranslatef(-0.65f, 3.1f, 0.3f); // attach to head
	glRotatef(95.0f, 1.0f, 0.0f, 0.0f); // orient Z as up
	glRotatef(-10.0f, 0.0f, 1.0f, 0.0f); // orient Z as up
	glRotatef(-180.0f, 0.0f, 0.0f, 1.0f); // orient Z as up
	curvedHairStrandMesh(0.20f, 1.4f, 24, 20);
	glPopMatrix();

	glPushMatrix();
	glTranslatef(-0.68f, 3.1f, 0.10f); // attach to head
	glRotatef(95.0f, 1.0f, 0.0f, 0.0f); // orient Z as up
	glRotatef(-5.0f, 0.0f, 1.0f, 0.0f); // orient Z as up
	glRotatef(-180.0f, 0.0f, 0.0f, 1.0f); // orient Z as up
	curvedHairStrandMesh(0.26f, 1.2f, 24, 20);
	glPopMatrix();

	// short
	glPushMatrix();
	glTranslatef(-0.68f, 2.8f, 0.5f); // attach to head
	glRotatef(85.0f, 1.0f, 0.0f, 0.0f); // orient Z as up
	glRotatef(13.0f, 0.0f, 1.0f, 0.0f); // orient Z as up
	glRotatef(-180.0f, 0.0f, 0.0f, 1.0f); // orient Z as up
	curvedHairStrandMesh(0.15f, 0.75f, 24, 20);
	glPopMatrix();

	glPushMatrix();
	glTranslatef(-0.78f, 2.8f, 0.45f); // attach to head
	glRotatef(85.0f, 1.0f, 0.0f, 0.0f); // orient Z as up
	glRotatef(33.0f, 0.0f, 1.0f, 0.0f); // orient Z as up
	glRotatef(-180.0f, 0.0f, 0.0f, 1.0f); // orient Z as up
	curvedHairStrandMesh(0.13f, 0.65f, 24, 20);
	glPopMatrix();


	//top

	//most top
	//left
	glPushMatrix();
	glTranslatef(0.0f, 3.5f, 0.08f); // attach to head
	glRotatef(90.0f, 1.0f, 0.0f, 0.0f); // front / back
	glRotatef(-50.0f, 0.0f, 1.0f, 0.0f); // left and right
	glRotatef(180.0f, 0.0f, 0.0f, 1.0f); // rotate direction of hair
	curvedHairStrandMesh(0.35f, 1.75f, 24, 20);
	glPopMatrix();

	glPushMatrix();
	glTranslatef(0.0f, 3.51f, -0.2f); // attach to head
	glRotatef(90.0f, 1.0f, 0.0f, 0.0f); // front / back
	glRotatef(-50.0f, 0.0f, 1.0f, 0.0f); // left and right
	glRotatef(180.0f, 0.0f, 0.0f, 1.0f); // rotate direction of hair
	curvedHairStrandMesh(0.36f, 1.75f, 24, 20);
	glPopMatrix();

	glPushMatrix();
	glTranslatef(0.0f, 3.5f, -0.55f); // attach to head
	glRotatef(90.0f, 1.0f, 0.0f, 0.0f); // front / back
	glRotatef(-50.0f, 0.0f, 1.0f, 0.0f); // left and right
	glRotatef(180.0f, 0.0f, 0.0f, 1.0f); // rotate direction of hair
	curvedHairStrandMesh(0.35f, 1.75f, 24, 20);
	glPopMatrix();

	glPushMatrix();
	glTranslatef(0.0f, 3.42f, -0.77f); // attach to head
	glRotatef(90.0f, 1.0f, 0.0f, 0.0f); // front / back
	glRotatef(-50.0f, 0.0f, 1.0f, 0.0f); // left and right
	glRotatef(150.0f, 0.0f, 0.0f, 1.0f); // rotate direction of hair
	curvedHairStrandMesh(0.35f, 1.75f, 24, 20);
	glPopMatrix();

	glPushMatrix();
	glTranslatef(0.0f, 3.42f, -0.85f); // attach to head
	glRotatef(90.0f, 1.0f, 0.0f, 0.0f); // front / back
	glRotatef(-50.0f, 0.0f, 1.0f, 0.0f); // left and right
	glRotatef(250.0f, 0.0f, 0.0f, 1.0f); // rotate direction of hair
	curvedHairStrandMesh(0.35f, 1.75f, 24, 20);
	glPopMatrix();


	//right
	glPushMatrix();
	glTranslatef(0.0f, 3.5f, 0.08f); // attach to head
	glRotatef(-90.0f, 1.0f, 0.0f, 0.0f); // front / back
	glRotatef(130.0f, 0.0f, 1.0f, 0.0f); // left and right
	glRotatef(180.0f, 0.0f, 0.0f, 1.0f); // rotate direction of hair
	curvedHairStrandMesh(0.36f, 1.75f, 24, 20);
	glPopMatrix();

	glPushMatrix();
	glTranslatef(0.0f, 3.5f, -0.3f); // attach to head
	glRotatef(-90.0f, 1.0f, 0.0f, 0.0f); // front / back
	glRotatef(130.0f, 0.0f, 1.0f, 0.0f); // left and right
	glRotatef(180.0f, 0.0f, 0.0f, 1.0f); // rotate direction of hair
	curvedHairStrandMesh(0.35f, 1.75f, 24, 20);
	glPopMatrix();

	glPushMatrix();
	glTranslatef(0.0f, 3.46f, -0.56f); // attach to head
	glRotatef(-90.0f, 1.0f, 0.0f, 0.0f); // front / back
	glRotatef(133.0f, 0.0f, 1.0f, 0.0f); // left and right
	glRotatef(180.0f, 0.0f, 0.0f, 1.0f); // rotate direction of hair
	curvedHairStrandMesh(0.37f, 1.75f, 24, 20);
	glPopMatrix();

	glPushMatrix();
	glTranslatef(0.0f, 3.42f, -0.73f); // attach to head
	glRotatef(-90.0f, 1.0f, 0.0f, 0.0f); // front / back
	glRotatef(140.0f, 0.0f, 1.0f, 0.0f); // left and right
	glRotatef(150.0f, 0.0f, 0.0f, 1.0f); // rotate direction of hair
	curvedHairStrandMesh(0.36f, 1.75f, 24, 20);
	glPopMatrix();

	//circle 
	glPushMatrix();
	glTranslatef(0.0f, 2.75, -0.35f);
	glRotatef(-17.0f, 1.0f, 0.0f, 0.0f);// move to top of head
	drawHalfCircleCap(0.8f, 32, 16);       // radius, slices, stacks
	glPopMatrix();

	glPushMatrix();
	glTranslatef(0.0f, 2.4, -0.33f);
	glRotatef(-67.0f, 1.0f, 0.0f, 0.0f);// move to top of head
	drawHalfCircleCap(0.8f, 32, 16);       // radius, slices, stacks
	glPopMatrix();

	//top middle
	glPushMatrix();
	glTranslatef(0.10f, 3.4f, -0.75f); // attach to head
	glRotatef(110.0f, 1.0f, 0.0f, 0.0f); // orient Z as up
	glRotatef(30.0f, 0.0f, 1.0f, 0.0f); // orient Z as up
	glRotatef(270.0f, 0.0f, 0.0f, 1.0f); // orient Z as up
	curvedHairStrandMesh(0.35f, 1.7f, 24, 20);
	glPopMatrix();

	glPushMatrix();
	glTranslatef(-0.05f, 3.4f, -0.80f); // attach to head
	glRotatef(115.0f, 1.0f, 0.0f, 0.0f); // orient Z as up
	glRotatef(15.0f, 0.0f, 1.0f, 0.0f); // orient Z as up
	glRotatef(270.0f, 0.0f, 0.0f, 1.0f); // orient Z as up
	curvedHairStrandMesh(0.35f, 1.7f, 24, 20);
	glPopMatrix();

	glPushMatrix();
	glTranslatef(-0.12f, 3.38f, -0.79f); // attach to head
	glRotatef(115.0f, 1.0f, 0.0f, 0.0f); // orient Z as up
	glRotatef(-12.0f, 0.0f, 1.0f, 0.0f); // orient Z as up
	glRotatef(270.0f, 0.0f, 0.0f, 1.0f); // orient Z as up
	curvedHairStrandMesh(0.35f, 1.6f, 24, 20);
	glPopMatrix();

	//left on top on left ear
	glPushMatrix();
	glTranslatef(-0.78f, 3.0f, -0.18f); // attach to head
	glRotatef(90.0f, 1.0f, 0.0f, 0.0f); // front / back
	glRotatef(-45.0f, 0.0f, 1.0f, 0.0f); // left and right
	glRotatef(2.0f, 0.0f, 0.0f, 1.0f); // rotate direction of hair
	curvedHairStrandMesh(0.22f, 1.1f, 24, 20);
	glPopMatrix();

	//right on top on right ear
	glPushMatrix();
	glTranslatef(0.7f, 3.0f, -0.15f); // attach to head
	glRotatef(90.0f, 1.0f, 0.0f, 0.0f); // front / back
	glRotatef(45.0f, 0.0f, 1.0f, 0.0f); // left and right
	glRotatef(180.0f, 0.0f, 0.0f, 1.0f); // rotate direction of hair
	curvedHairStrandMesh(0.22f, 1.1f, 24, 20);
	glPopMatrix();



	//behind top
	//right
	glPushMatrix();
	glTranslatef(-0.65f, 3.1f, -0.3f); // attach to head
	glRotatef(95.0f, 1.0f, 0.0f, 0.0f); // orient Z as up
	glRotatef(0.0f, 0.0f, 1.0f, 0.0f); // orient Z as up
	glRotatef(220.0f, 0.0f, 0.0f, 1.0f); // orient Z as up
	curvedHairStrandMesh(0.25f, 1.7f, 24, 20);
	glPopMatrix();

	glPushMatrix();
	glTranslatef(-0.5f, 3.1f, -0.3f); // attach to head
	glRotatef(95.0f, 1.0f, 0.0f, 0.0f); // orient Z as up
	glRotatef(0.0f, 0.0f, 1.0f, 0.0f); // orient Z as up
	glRotatef(260.0f, 0.0f, 0.0f, 1.0f); // orient Z as up
	curvedHairStrandMesh(0.25f, 1.7f, 24, 20);
	glPopMatrix();


	//left
	glPushMatrix();
	glTranslatef(0.6f, 2.9f, -0.3f); // attach to head
	glRotatef(95.0f, 1.0f, 0.0f, 0.0f); // orient Z as up
	glRotatef(0.0f, 0.0f, 1.0f, 0.0f); // orient Z as up
	glRotatef(300.0f, 0.0f, 0.0f, 1.0f); // orient Z as up
	curvedHairStrandMesh(0.25f, 1.6f, 24, 20);
	glPopMatrix();

	glPushMatrix();
	glTranslatef(0.6f, 2.9f, -0.3f); // attach to head
	glRotatef(95.0f, 1.0f, 0.0f, 0.0f); // orient Z as up
	glRotatef(0.0f, 0.0f, 1.0f, 0.0f); // orient Z as up
	glRotatef(260.0f, 0.0f, 0.0f, 1.0f); // orient Z as up
	curvedHairStrandMesh(0.25f, 1.7f, 24, 20);
	glPopMatrix();


	//behind middle
	//middle
	glPushMatrix();
	glTranslatef(-0.05f, 3.2f, -0.68f); // attach to head
	glRotatef(95.0f, 1.0f, 0.0f, 0.0f); // orient Z as up
	glRotatef(0.0f, 0.0f, 1.0f, 0.0f); // orient Z as up
	glRotatef(270.0f, 0.0f, 0.0f, 1.0f); // orient Z as up
	curvedHairStrandMesh(0.45f, 2.3f, 24, 20);
	glPopMatrix();

	//right
	glPushMatrix();
	glTranslatef(-0.35f, 3.1f, -0.62f); // attach to head
	glRotatef(95.0f, 1.0f, 0.0f, 0.0f); // orient Z as up
	glRotatef(0.0f, 0.0f, 1.0f, 0.0f); // orient Z as up
	glRotatef(260.0f, 0.0f, 0.0f, 1.0f); // orient Z as up
	curvedHairStrandMesh(0.4f, 2.2f, 24, 20);
	glPopMatrix();

	glPushMatrix();
	glTranslatef(-0.5f, 3.1f, -0.55f); // attach to head
	glRotatef(95.0f, 1.0f, 0.0f, 0.0f); // orient Z as up
	glRotatef(0.0f, 0.0f, 1.0f, 0.0f); // orient Z as up
	glRotatef(250.0f, 0.0f, 0.0f, 1.0f); // orient Z as up
	curvedHairStrandMesh(0.3f, 2.2f, 24, 20);
	glPopMatrix();

	glPushMatrix();
	glTranslatef(-0.7f, 3.1f, -0.55f); // attach to head
	glRotatef(95.0f, 1.0f, 0.0f, 0.0f); // orient Z as up
	glRotatef(0.0f, 0.0f, 1.0f, 0.0f); // orient Z as up
	glRotatef(220.0f, 0.0f, 0.0f, 1.0f); // orient Z as up
	curvedHairStrandMesh(0.25f, 2.1f, 24, 20);
	glPopMatrix();

	//left
	glPushMatrix();
	glTranslatef(0.25f, 3.1f, -0.7f); // attach to head
	glRotatef(95.0f, 1.0f, 0.0f, 0.0f); // orient Z as up
	glRotatef(0.0f, 0.0f, 1.0f, 0.0f); // orient Z as up
	glRotatef(280.0f, 0.0f, 0.0f, 1.0f); // orient Z as up
	curvedHairStrandMesh(0.42f, 2.2f, 24, 20);
	glPopMatrix();


	glPushMatrix();
	glTranslatef(0.3f, 3.1f, -0.7f); // attach to head
	glRotatef(95.0f, 1.0f, 0.0f, 0.0f); // orient Z as up
	glRotatef(0.0f, 0.0f, 1.0f, 0.0f); // orient Z as up
	glRotatef(290.0f, 0.0f, 0.0f, 1.0f); // orient Z as up
	curvedHairStrandMesh(0.3f, 2.2f, 24, 20);
	glPopMatrix();

	glPushMatrix();
	glTranslatef(0.55f, 3.1f, -0.55f); // attach to head
	glRotatef(95.0f, 1.0f, 0.0f, 0.0f); // orient Z as up
	glRotatef(0.0f, 0.0f, 1.0f, 0.0f); // orient Z as up
	glRotatef(-80.0f, 0.0f, 0.0f, 1.0f); // orient Z as up
	curvedHairStrandMesh(0.3f, 2.1f, 24, 20);
	glPopMatrix();

	glPushMatrix();
	glTranslatef(0.58f, 2.9f, -0.5f); // attach to head
	glRotatef(95.0f, 1.0f, 0.0f, 0.0f); // orient Z as up
	glRotatef(0.0f, 0.0f, 1.0f, 0.0f); // orient Z as up
	glRotatef(-60.0f, 0.0f, 0.0f, 1.0f); // orient Z as up
	curvedHairStrandMesh(0.2f, 2.1f, 24, 20);
	glPopMatrix();



	// behind bottom
	//left
	glPushMatrix();
	glTranslatef(-0.05f, 1.7f, -0.55f); // attach to head
	glRotatef(120.0f, 1.0f, 0.0f, 0.0f); // orient Z as up
	glRotatef(-25.0f, 0.0f, 1.0f, 0.0f); // orient Z as up
	glRotatef(70.0f, 0.0f, 0.0f, 1.0f); // orient Z as up
	curvedHairStrandMesh(0.16f, 1.0f, 24, 20);
	glPopMatrix();

	glPushMatrix();
	glTranslatef(-0.3f, 1.7f, -0.5f); // attach to head
	glRotatef(120.0f, 1.0f, 0.0f, 0.0f); // orient Z as up
	glRotatef(-20.0f, 0.0f, 1.0f, 0.0f); // orient Z as up
	glRotatef(60.0f, 0.0f, 0.0f, 1.0f); // orient Z as up
	curvedHairStrandMesh(0.16f, 1.0f, 24, 20);
	glPopMatrix();

	glPushMatrix();
	glTranslatef(-0.5f, 1.75f, -0.42f); // attach to head
	glRotatef(120.0f, 1.0f, 0.0f, 0.0f); // orient Z as up
	glRotatef(-25.0f, 0.0f, 1.0f, 0.0f); // orient Z as up
	glRotatef(65.0f, 0.0f, 0.0f, 1.0f); // orient Z as up
	curvedHairStrandMesh(0.16f, 1.0f, 24, 20);
	glPopMatrix();

	//right
	glPushMatrix();
	glTranslatef(0.05f, 1.7f, -0.55f); // attach to head
	glRotatef(120.0f, 1.0f, 0.0f, 0.0f); // orient Z as up
	glRotatef(25.0f, 0.0f, 1.0f, 0.0f); // orient Z as up
	glRotatef(110.0f, 0.0f, 0.0f, 1.0f); // orient Z as up
	curvedHairStrandMesh(0.16f, 1.0f, 24, 20);
	glPopMatrix();

	glPushMatrix();
	glTranslatef(0.3f, 1.7f, -0.5f); // attach to head
	glRotatef(120.0f, 1.0f, 0.0f, 0.0f); // orient Z as up
	glRotatef(20.0f, 0.0f, 1.0f, 0.0f); // orient Z as up
	glRotatef(110.0f, 0.0f, 0.0f, 1.0f); // orient Z as up
	curvedHairStrandMesh(0.16f, 1.0f, 24, 20);
	glPopMatrix();

	glPushMatrix();
	glTranslatef(0.5f, 1.75f, -0.42f); // attach to head
	glRotatef(120.0f, 1.0f, 0.0f, 0.0f); // orient Z as up
	glRotatef(25.0f, 0.0f, 1.0f, 0.0f); // orient Z as up
	glRotatef(115.0f, 0.0f, 0.0f, 1.0f); // orient Z as up
	curvedHairStrandMesh(0.16f, 1.0f, 24, 20);
	glPopMatrix();


	//ponytail
	glPushMatrix();
	glTranslatef(-0.05f, 1.6f, -0.45f); // attach to head
	glRotatef(95.0f, 1.0f, 0.0f, 0.0f); // orient Z as up
	glRotatef(0.0f, 0.0f, 1.0f, 0.0f); // orient Z as up
	glRotatef(270.0f, 0.0f, 0.0f, 1.0f); // orient Z as up
	curvedHairStrandMesh(0.2f, 4.5f, 24, 20);
	glPopMatrix();
	glPushMatrix();
	glTranslatef(-0.1f, 1.6f, -0.45f); // attach to head
	glRotatef(95.0f, 1.0f, 0.0f, 0.0f); // orient Z as up
	glRotatef(0.0f, 0.0f, 1.0f, 0.0f); // orient Z as up
	glRotatef(310.0f, 0.0f, 0.0f, 1.0f); // orient Z as up
	curvedHairStrandMesh(0.2f, 4.5f, 24, 20);
	glPopMatrix();
	glPushMatrix();
	glTranslatef(0.1f, 1.6f, -0.45f); // attach to head
	glRotatef(95.0f, 1.0f, 0.0f, 0.0f); // orient Z as up
	glRotatef(0.0f, 0.0f, 1.0f, 0.0f); // orient Z as up
	glRotatef(200.0f, 0.0f, 0.0f, 1.0f); // orient Z as up
	curvedHairStrandMesh(0.2f, 4.5f, 24, 20);
	glPopMatrix();



}

void neck() {
	// Neck (cylinder)
	glPushMatrix();
	glColor3f(1.0f, 0.9f, 0.8f);
	glTranslatef(0.0f, 1.55f, -0.2f);
	glRotatef(-90, 1, 0, 0);
	GLUquadric* quad = gluNewQuadric();
	gluCylinder(quad, 0.3, 0.26, 0.7, 16, 16); // base radius, top radius, height, slice, stack
	gluDeleteQuadric(quad);
	glPopMatrix();
}


// --- Textured inner collar (lower neck fabric) ---
void collarBlack() {
	// Sizes relative to your neck: neck base=0.30, top=0.26, height=0.70
	const float yWorld = 1.45f;  // same base Y as your neck translate
	const float zWorld = -0.2f;  // same Z as your neck

	const float h = 0.45f;  // collar height (short)
	const float rInTop = 0.27f;  // inner radius (slightly larger than neck top 0.26)
	const float rInBot = 0.31f;  // inner radius at bottom (near neck base 0.30)
	const float rOut = 0.36f;  // outer radius (visible lip)

	GLUquadric* q = gluNewQuadric();
	gluQuadricNormals(q, GLU_SMOOTH);
	gluQuadricTexture(q, GL_TRUE);   // <-- let GLU generate proper tex coords

	glPushMatrix();
	// place at base of neck, same orientation as neck (-90° about X)
	glTranslatef(0.0f, yWorld, zWorld);
	glRotatef(-90, 1, 0, 0);

	// bind active collar texture
	glEnable(GL_TEXTURE_2D);
	glBindTexture(GL_TEXTURE_2D, currentCollarTex);
	glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_MODULATE);
	glColor3f(1, 1, 1);  // show texture as-is

	// inner wall (slight taper so it hugs the neck)
	gluCylinder(q, rInBot, rInTop, h, 32, 1);

	// outer wall (straight tube) + rings
	glPushMatrix();
	gluCylinder(q, rOut, rOut, h, 32, 1);     // outer tube
	glTranslatef(0, 0, h);
	gluDisk(q, rInTop, rOut, 32, 1);          // top ring cap (textured)
	glTranslatef(0, 0, -h);
	gluDisk(q, rInBot, rOut, 32, 1);          // bottom ring cap (textured)
	glPopMatrix();

	// optional: fill inner bottom so you can't see inside the collar
	// keeps it dark/solid even if the camera looks up into it
	gluDisk(q, 0.0f, rInBot, 32, 1);

	glDisable(GL_TEXTURE_2D);
	glPopMatrix();

	gluDeleteQuadric(q);
}


void drawNeck() {
	neck();        // your existing neck
	collarBlack(); // add the black fabric
}

void drawHead() {
	// === HEAD SCALE BLOCK ===
	glPushMatrix();
	ApplyHeadYawPivot();
	glTranslatef(0.0f, 2.65f, 0.0f);      // pivot at head center
	glRotatef(6.0f, 1.0f, 0.0f, 0.0f);
	glScalef(gHeadScale, gHeadScale, gHeadScale);
	glTranslatef(0.0f, -HEAD_PIVOT_Y, 0.0f);

	// head pieces (unchanged order)
	face();
	fairyLeftEar();
	fairyRightEar();

	// horns
	glPushMatrix();
	glTranslatef(-0.1f, 1.45f, 0.55f);
	Vec3 hornL[4] = { {-0.20f,1.80f,0.00f},{-0.10f,2.35f,0.05f},{-0.02f,2.90f,0.10f},{-0.08f,3.30f,0.00f} };
	drawHorn3D(hornL, 0.18f, 0.08f, 0.02f, 0.01f, 40, 16);
	glPopMatrix();

	glPushMatrix();
	glTranslatef(0.1f, 1.45f, 0.55f);
	Vec3 hornR[4] = { {0.20f,1.80f,0.00f},{0.10f,2.35f,0.05f},{0.02f,2.90f,0.10f},{0.08f,3.30f,0.00f} };
	drawHorn3D(hornR, 0.18f, 0.08f, 0.02f, 0.01f, 40, 16);
	glPopMatrix();

	// brows / eyes / liner
	glDisable(GL_LIGHTING);
	drawEyebrow(-0.34f, 2.43f, 0.8f, 0.55f, 0.70f, -21.0f, true);
	drawEyebrow(-0.34f, 2.51f, 0.7f, 0.45f, 0.4f, -35.0f, true);
	drawEyebrow(-0.30f, 2.37f, 0.8f, 0.35f, 0.22f, -12.0f, true);
	drawEyebrow(+0.34f, 2.43f, 0.8f, 0.55f, 0.70f, +21.0f, false);
	drawEyebrow(0.34f, 2.51f, 0.7f, 0.45f, 0.4f, 35.0f, true);
	drawEyebrow(+0.30f, 2.37f, 0.8f, 0.35f, 0.22f, +12.0f, false);

	drawEye3D(-0.30f, 2.22f, 0.8f, 0.2f, 0.09f, true);
	drawRedEyeliner(-0.58f, 2.23f, 0.8f, 0.15f, 0.18f, 32.0f, false);
	drawRedEyeliner(-0.58f, 2.15f, 0.8f, 0.17f, 0.18f, 35.0f, false);
	drawEye3D(+0.30f, 2.22f, 0.8f, 0.2f, 0.09f, false);
	drawRedEyeliner(0.58f, 2.23f, 0.8f, 0.15f, 0.18f, -32.0f, false);
	drawRedEyeliner(0.58f, 2.15f, 0.8f, 0.17f, 0.18f, -35.0f, true);
	glEnable(GL_LIGHTING);

	// mouth + hair
	float expr = gRage ? 0.0f : +0.65f;
	drawMouth(0.0f, 1.71f, 0.75f, 0.28f, 0.45f, 0.0f, -0.65f, 0.0f, 0.05f);
	drawHair();

	glPopMatrix(); // === END HEAD SCALE BLOCK ===

	drawNeck();
}

// ============================================================ HEAD END =============================================================================================



// ---------- Simple box (centered) ----------
static void drawBox(float w, float h, float d) {
	float x = w * .5f, y = h * .5f, z = d * .5f;
	glBegin(GL_QUADS);
	glNormal3f(0, 0, 1); glVertex3f(-x, -y, z); glVertex3f(x, -y, z); glVertex3f(x, y, z); glVertex3f(-x, y, z);
	glNormal3f(0, 0, -1); glVertex3f(-x, -y, -z); glVertex3f(-x, y, -z); glVertex3f(x, y, -z); glVertex3f(x, -y, -z);
	glNormal3f(-1, 0, 0); glVertex3f(-x, -y, -z); glVertex3f(-x, -y, z); glVertex3f(-x, y, z); glVertex3f(-x, y, -z);
	glNormal3f(1, 0, 0);  glVertex3f(x, -y, -z); glVertex3f(x, y, -z); glVertex3f(x, y, z); glVertex3f(x, -y, z);
	glNormal3f(0, 1, 0);  glVertex3f(-x, y, -z); glVertex3f(-x, y, z); glVertex3f(x, y, z); glVertex3f(x, y, -z);
	glNormal3f(0, -1, 0); glVertex3f(-x, -y, -z); glVertex3f(x, -y, -z); glVertex3f(x, -y, z); glVertex3f(-x, -y, z);
	glEnd();
}

// -------- Small helpers --------
static void quadStripBorder(float x0, float y0, float z, float x1, float y1, float t) {
	// draws a thin rectangular strip (gold piping) on the Z plane
	glBegin(GL_QUADS);
	glVertex3f(x0, y0, z); glVertex3f(x1, y0, z);
	glVertex3f(x1, y0 - t, z); glVertex3f(x0, y0 - t, z);      // top strip
	glVertex3f(x0, y1, z); glVertex3f(x1, y1, z);
	glVertex3f(x1, y1 + t, z); glVertex3f(x0, y1 + t, z);      // bottom strip
	glEnd();
}
static void goldVerticalStrip(float x, float y0, float y1, float z, float w) {
	glBegin(GL_QUADS);
	glVertex3f(x - w, y0, z); glVertex3f(x + w, y0, z);
	glVertex3f(x + w, y1, z); glVertex3f(x - w, y1, z);
	glEnd();
}


// how much further down the shirt ends (so it touches the skirt)
static float tunicExtendY = 0.50f;   // = - (your skirt translate Y)

// Draw a thick 2D segment on the Z plane (used for the red sash lines)
static void drawThickSegment(float x0, float y0, float x1, float y1, float z, float t)
{
	float dx = x1 - x0, dy = y1 - y0;
	float len = sqrtf(dx * dx + dy * dy);
	if (len < 1e-6f) return;
	float nx = -dy / len, ny = dx / len;   // unit normal
	float ox = nx * (0.5f * t), oy = ny * (0.5f * t);

	glBegin(GL_QUADS);
	glVertex3f(x0 - ox, y0 - oy, z);
	glVertex3f(x0 + ox, y0 + oy, z);
	glVertex3f(x1 + ox, y1 + oy, z);
	glVertex3f(x1 - ox, y1 - oy, z);
	glEnd();
}

// Draw two parallel lines centered around the same segment, separated by `gap`
static void drawPairSym(float x0, float y0, float x1, float y1,
	float z, float t, float gap)
{
	float dx = x1 - x0, dy = y1 - y0;
	float len = sqrtf(dx * dx + dy * dy);
	if (len < 1e-6f) return;

	// unit normal (perpendicular to the segment)
	float nx = -dy / len, ny = dx / len;
	float ox = nx * (gap * 0.5f), oy = ny * (gap * 0.5f);

	// two lines, equally spaced about the center
	drawThickSegment(x0 - ox, y0 - oy, x1 - ox, y1 - oy, z, t);
	drawThickSegment(x0 + ox, y0 + oy, x1 + ox, y1 + oy, z, t);
}


// Scaled segment, shifted perpendicular by `offset` (gap control)
static void drawOffsetScaledSeg(float x0, float y0, float x1, float y1,
	float z, float t, float k, float offset)
{
	float dx = x1 - x0, dy = y1 - y0;
	float len = sqrtf(dx * dx + dy * dy);
	if (len < 1e-6f) return;

	// unit normal (perpendicular)
	float nx = -dy / len, ny = dx / len;

	// scale endpoint
	float sx1 = x0 + k * dx;
	float sy1 = y0 + k * dy;

	// shift whole segment by `offset` along the normal
	float ox = nx * offset, oy = ny * offset;

	drawThickSegment(x0 + ox, y0 + oy, sx1 + ox, sy1 + oy, z, t);
}


static void drawBelt()
{
	glEnable(GL_NORMALIZE);
	const float BELT_WIDTH = 1.42f;
	const float BELT_HEIGHT = 0.35f;
	const float BELT_DEPTH = 0.92f;

	const float halfW = BELT_WIDTH * 0.5f;
	const float halfH = BELT_HEIGHT * 0.5f;
	const float halfD = BELT_DEPTH * 0.5f;

	glPushMatrix();
	glTranslatef(0.0f, -0.7f, 0.0f);   // your offset
	glTranslatef(0.0f, 1.00f, 0.0f);  // belt height

	// --- Make sure we can see both faces (optional if your winding is correct)
	GLboolean wasCull = glIsEnabled(GL_CULL_FACE);
	if (wasCull) glDisable(GL_CULL_FACE);

	// --- Textured sash (ONLY this; remove any drawBox() belt body)
	glEnable(GL_TEXTURE_2D);
	glBindTexture(GL_TEXTURE_2D, currentBeltTex);
	glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_MODULATE);
	glColor3f(1, 1, 1);

	glNormal3f(0, 0, 1);
	glBegin(GL_QUADS);
	glTexCoord2f(0, 0); glVertex3f(-halfW, -halfH, halfD);
	glTexCoord2f(1, 0); glVertex3f(halfW, -halfH, halfD);
	glTexCoord2f(1, 1); glVertex3f(halfW, halfH, halfD);
	glTexCoord2f(0, 1); glVertex3f(-halfW, halfH, halfD);
	glEnd();

	// Back (-Z)
	glNormal3f(0, 0, -1);
	glBegin(GL_QUADS);
	glTexCoord2f(0, 0); glVertex3f(halfW, -halfH, -halfD);
	glTexCoord2f(1, 0); glVertex3f(-halfW, -halfH, -halfD);
	glTexCoord2f(1, 1); glVertex3f(-halfW, halfH, -halfD);
	glTexCoord2f(0, 1); glVertex3f(halfW, halfH, -halfD);
	glEnd();

	// Left (-X)
	glNormal3f(-1, 0, 0);
	glBegin(GL_QUADS);
	glTexCoord2f(0, 0); glVertex3f(-halfW, -halfH, -halfD);
	glTexCoord2f(1, 0); glVertex3f(-halfW, -halfH, halfD);
	glTexCoord2f(1, 1); glVertex3f(-halfW, halfH, halfD);
	glTexCoord2f(0, 1); glVertex3f(-halfW, halfH, -halfD);
	glEnd();

	// Right (+X)
	glNormal3f(1, 0, 0);
	glBegin(GL_QUADS);
	glTexCoord2f(0, 0); glVertex3f(halfW, -halfH, halfD);
	glTexCoord2f(1, 0); glVertex3f(halfW, -halfH, -halfD);
	glTexCoord2f(1, 1); glVertex3f(halfW, halfH, -halfD);
	glTexCoord2f(0, 1); glVertex3f(halfW, halfH, halfD);
	glEnd();

	// Top (+Y)
	glNormal3f(0, 1, 0);
	glBegin(GL_QUADS);
	glTexCoord2f(0, 0); glVertex3f(-halfW, halfH, halfD);
	glTexCoord2f(1, 0); glVertex3f(halfW, halfH, halfD);
	glTexCoord2f(1, 1); glVertex3f(halfW, halfH, -halfD);
	glTexCoord2f(0, 1); glVertex3f(-halfW, halfH, -halfD);
	glEnd();

	// Bottom (-Y)
	glNormal3f(0, -1, 0);
	glBegin(GL_QUADS);
	glTexCoord2f(0, 0); glVertex3f(-halfW, -halfH, -halfD);
	glTexCoord2f(1, 0); glVertex3f(halfW, -halfH, -halfD);
	glTexCoord2f(1, 1); glVertex3f(halfW, -halfH, halfD);
	glTexCoord2f(0, 1); glVertex3f(-halfW, -halfH, halfD);
	glEnd();

	glDisable(GL_TEXTURE_2D);

	if (wasCull) glEnable(GL_CULL_FACE);
	glPopMatrix();
}



// --- helpers to turn a front quad into a 3D prism ------------------
static void addSideQuad(float ax, float ay, float az, float bx, float by, float bz, float thick)
{
	// A,B are the edge on the front face; A',B' are the back edge (extruded in -Z)
	float apz = az - thick, bpz = bz - thick;

	// crude outward normal for lighting (perp to edge, in XY)
	float ex = bx - ax, ey = by - ay;
	glNormal3f(-ey, ex, 0.0f);

	glBegin(GL_QUADS);
	glVertex3f(ax, ay, az);
	glVertex3f(bx, by, bz);
	glVertex3f(bx, by, bpz);
	glVertex3f(ax, ay, apz);
	glEnd();
}

static void extrudeQuadToPrism(
	float x0, float y0, float z0,
	float x1, float y1, float z1,
	float x2, float y2, float z2,
	float x3, float y3, float z3,
	float thick)
{
	// front & back faces
	glBegin(GL_QUADS);
	glNormal3f(0, 0, 1);
	glVertex3f(x0, y0, z0); glVertex3f(x1, y1, z1); glVertex3f(x2, y2, z2); glVertex3f(x3, y3, z3);
	glNormal3f(0, 0, -1);
	glVertex3f(x3, y3, z3 - thick); glVertex3f(x2, y2, z2 - thick);
	glVertex3f(x1, y1, z1 - thick); glVertex3f(x0, y0, z0 - thick);
	glEnd();

	// four side walls
	addSideQuad(x0, y0, z0, x1, y1, z1, thick);
	addSideQuad(x1, y1, z1, x2, y2, z2, thick);
	addSideQuad(x2, y2, z2, x3, y3, z3, thick);
	addSideQuad(x3, y3, z3, x0, y0, z0, thick);
}


static void drawFrontSkirt()

{
	glTranslatef(0, 0, -0.12);
	//float(SPACE) without pulsing : fixed lift + gentle sway / tilt of the whole skirt
	float lift = 0.0f;   // constant raise when active
	float swayX = 0.0f;   // side-to-side drift (whole skirt)
	float swayZ = 0.0f;   // forward/back drift (whole skirt)
	float tiltZ = 0.0f;   // small roll (left/right)
	float tiltX = 0.0f;   // small pitch (front/back)

	if (gRage) {
		ULONGLONG ms = GetTickCount64();
		float t = 0.001f * (float)(ms & 0xFFFFFFFF);

		lift = 0.35f;                      // fixed raise (no bobbing)
		swayX = 0.08f * sinf(1.6f * t);     // gentle drift
		swayZ = 0.05f * sinf(1.2f * t + 1); // gentle drift
		tiltZ = 2.5f * sinf(1.4f * t);     // subtle roll in degrees
		tiltX = 1.8f * sinf(1.1f * t + .7f);
	}

	glPushMatrix();
	// move and tilt the entire skirt as a rigid piece
	glTranslatef(swayX, -0.95f + lift, swayZ);
	glRotatef(tiltZ, 0, 0, 1);
	glRotatef(tiltX, 1, 0, 0);
	/*glPushMatrix();
	glTranslatef(0.0f, -0.96f, -0.15f);*/

	// -------- INDEPENDENT KNOBS --------
	const float waistY = 1.10f;     // belt height (Y)
	const float hemY = -3.20f;      // lower = longer skirt
	const float waistHalf = 0.69f;  // half width at waist (X)
	const float hemHalf = 1.85f;    // half width at hem (X)

	// FRONT↔BACK thickness (make smaller to thin the sides)
	const float sideDepth = 0.90f;

	// Tiny bias to keep skirt slightly in front of the legs
	const float skirtZBias = 0.004f;

	const float depthTop = 0.60f + skirtZBias;  // front-of-waist Z
	const float backZ = depthTop - sideDepth;

	// ===== NEW: backward tilt in degrees (increase to tilt more) =====
	const float tiltBackDeg = 12.0f; // try 8–18
	const float Lvert = (waistY - hemY);              // vertical length (positive)
	const float backDelta = Lvert * tanf(tiltBackDeg * (float)M_PI / 180.0f);
	const float backZHem = backZ - backDelta;         // hem pushed further back

	// UV tiling
	const float mid_u = 1.2f, mid_v = 1.8f;
	const float side_u = 1.0f, side_v = 1.6f;

	// ---- Only the skirt should be double-sided: disable cull locally ----
	GLboolean wasCull = glIsEnabled(GL_CULL_FACE);
	if (wasCull) glDisable(GL_CULL_FACE);

	glEnable(GL_TEXTURE_2D);
	glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_MODULATE);
	glColor3f(1, 1, 1);

	// ================= MIDDLE / BACK PANEL (tilted) =================
	glBindTexture(GL_TEXTURE_2D, currentSkirtMidTex);
	// (Normal is approx; true normal would pitch a bit due to tilt)
	glNormal3f(0, 0, -1);
	glBegin(GL_QUADS);
	// top edge stays at backZ
	glTexCoord2f(0, 0);    glVertex3f(-waistHalf, waistY, backZ);
	glTexCoord2f(mid_u, 0);    glVertex3f(waistHalf, waistY, backZ);
	// bottom edge at backZHem (further back)
	glTexCoord2f(mid_u, mid_v); glVertex3f(hemHalf, hemY, backZHem);
	glTexCoord2f(0, mid_v); glVertex3f(-hemHalf, hemY, backZHem);
	glEnd();

	// ================= LEFT SIDE WALL (match tilted hem) =================
	glBindTexture(GL_TEXTURE_2D, currentSkirtSideTex);
	// normal is approximate (-X)
	glNormal3f(-1, 0, 0);
	glBegin(GL_QUADS);
	// top edge: from front (depthTop) to back (backZ)
	glTexCoord2f(0, 0);     glVertex3f(-waistHalf, waistY, depthTop);
	glTexCoord2f(side_u, 0);     glVertex3f(-waistHalf, waistY, backZ);
	// bottom edge: from front (depthTop) to new back (backZHem)
	glTexCoord2f(side_u, side_v); glVertex3f(-hemHalf, hemY, backZHem);
	glTexCoord2f(0, side_v); glVertex3f(-hemHalf, hemY, depthTop);
	glEnd();

	// ================= RIGHT SIDE WALL (match tilted hem) =================
	glNormal3f(1, 0, 0);
	glBegin(GL_QUADS);
	// note: winding keeps texture orientation consistent
	glTexCoord2f(0, 0);     glVertex3f(waistHalf, waistY, backZ);
	glTexCoord2f(side_u, 0);     glVertex3f(waistHalf, waistY, depthTop);
	glTexCoord2f(side_u, side_v); glVertex3f(hemHalf, hemY, depthTop);
	glTexCoord2f(0, side_v); glVertex3f(hemHalf, hemY, backZHem);
	glEnd();

	glDisable(GL_TEXTURE_2D);

	// ---------- HEM BAND (sit on the *tilted* back edge) ----------
	const float hemBandH = 0.20f;
	const float hemTopY = hemY + hemBandH;

	glEnable(GL_POLYGON_OFFSET_FILL);
	glPolygonOffset(-1.0f, -1.0f);

	glEnable(GL_TEXTURE_2D);
	glBindTexture(GL_TEXTURE_2D, currentHemTex);
	glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_MODULATE);
	glColor3f(1, 1, 1);

	// Front hem (actually the rear-facing strip) along backZHem
	glNormal3f(0, 0, -1);
	glBegin(GL_QUADS);
	glTexCoord2f(0, 0); glVertex3f(-hemHalf, hemY, backZHem);
	glTexCoord2f(1, 0); glVertex3f(hemHalf, hemY, backZHem);
	glTexCoord2f(1, 1); glVertex3f(hemHalf, hemTopY, backZHem);
	glTexCoord2f(0, 1); glVertex3f(-hemHalf, hemTopY, backZHem);
	glEnd();

	// Left hem side (bridges depthTop to backZHem at the hem)
	glNormal3f(-1, 0, 0);
	glBegin(GL_QUADS);
	glTexCoord2f(0, 0); glVertex3f(-hemHalf, hemY, backZHem);
	glTexCoord2f(1, 0); glVertex3f(-hemHalf, hemY, depthTop);
	glTexCoord2f(1, 1); glVertex3f(-hemHalf, hemTopY, depthTop);
	glTexCoord2f(0, 1); glVertex3f(-hemHalf, hemTopY, backZHem);
	glEnd();

	// Right hem side
	glNormal3f(1, 0, 0);
	glBegin(GL_QUADS);
	glTexCoord2f(0, 0); glVertex3f(hemHalf, hemY, depthTop);
	glTexCoord2f(1, 0); glVertex3f(hemHalf, hemY, backZHem);
	glTexCoord2f(1, 1); glVertex3f(hemHalf, hemTopY, backZHem);
	glTexCoord2f(0, 1); glVertex3f(hemHalf, hemTopY, depthTop);
	glEnd();

	glDisable(GL_TEXTURE_2D);
	glDisable(GL_POLYGON_OFFSET_FILL);

	// Restore cull state
	if (wasCull) glEnable(GL_CULL_FACE);

	glPopMatrix();
}


// --- Blocky pants (thigh + shin), easy to move with one glTranslate ---
static void drawTexturedUnitBox()
{
	glBegin(GL_QUADS);
	// +X
	glNormal3f(1, 0, 0);
	glTexCoord2f(0, 0); glVertex3f(0.5f, -0.5f, -0.5f);
	glTexCoord2f(1, 0); glVertex3f(0.5f, -0.5f, 0.5f);
	glTexCoord2f(1, 1); glVertex3f(0.5f, 0.5f, 0.5f);
	glTexCoord2f(0, 1); glVertex3f(0.5f, 0.5f, -0.5f);
	// -X
	glNormal3f(-1, 0, 0);
	glTexCoord2f(0, 0); glVertex3f(-0.5f, -0.5f, 0.5f);
	glTexCoord2f(1, 0); glVertex3f(-0.5f, -0.5f, -0.5f);
	glTexCoord2f(1, 1); glVertex3f(-0.5f, 0.5f, -0.5f);
	glTexCoord2f(0, 1); glVertex3f(-0.5f, 0.5f, 0.5f);
	// +Y (top)
	glNormal3f(0, 1, 0);
	glTexCoord2f(0, 0); glVertex3f(-0.5f, 0.5f, -0.5f);
	glTexCoord2f(1, 0); glVertex3f(0.5f, 0.5f, -0.5f);
	glTexCoord2f(1, 1); glVertex3f(0.5f, 0.5f, 0.5f);
	glTexCoord2f(0, 1); glVertex3f(-0.5f, 0.5f, 0.5f);
	// -Y (bottom)
	glNormal3f(0, -1, 0);
	glTexCoord2f(0, 0); glVertex3f(-0.5f, -0.5f, 0.5f);
	glTexCoord2f(1, 0); glVertex3f(0.5f, -0.5f, 0.5f);
	glTexCoord2f(1, 1); glVertex3f(0.5f, -0.5f, -0.5f);
	glTexCoord2f(0, 1); glVertex3f(-0.5f, -0.5f, -0.5f);
	// +Z (front)
	glNormal3f(0, 0, 1);
	glTexCoord2f(0, 0); glVertex3f(-0.5f, -0.5f, 0.5f);
	glTexCoord2f(1, 0); glVertex3f(0.5f, -0.5f, 0.5f);
	glTexCoord2f(1, 1); glVertex3f(0.5f, 0.5f, 0.5f);
	glTexCoord2f(0, 1); glVertex3f(-0.5f, 0.5f, 0.5f);
	// -Z (back)
	glNormal3f(0, 0, -1);
	glTexCoord2f(0, 0); glVertex3f(0.5f, -0.5f, -0.5f);
	glTexCoord2f(1, 0); glVertex3f(-0.5f, -0.5f, -0.5f);
	glTexCoord2f(1, 1); glVertex3f(-0.5f, 0.5f, -0.5f);
	glTexCoord2f(0, 1); glVertex3f(0.5f, 0.5f, -0.5f);
	glEnd();
}

static void drawPants(float swingDeg)
{
	const float hipY = 1.41f;   // top of pants (under belt)
	const float hipX = 0.35f;   // half spacing between legs (align to your boots)
	const float zHip = 0.28f;   // forward offset so legs sit in front of body

	// sizes (blocky look)
	const float thighH = 2.65f, thighW = 0.68f, thighD = 0.80f;
	const float shinH = 1.75f, shinW = 0.57f, shinD = 0.60f;
	const float intoBoot = 0.10f; // how much the shin extends into the boot

	glPushMatrix();
	glTranslatef(0.0f, -1.3f, -0.3f);   // single translate for easy positioning

	// ---- texture state for pants ----
	glEnable(GL_TEXTURE_2D);
	glBindTexture(GL_TEXTURE_2D, currentPantsTex);
	glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_MODULATE);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT);
	glColor3f(1, 1, 1);

	// helper: draw the unit box with UV tiling via texture matrix
	auto drawTiledUnitBox = [&](float uRep, float vRep)
		{
			glMatrixMode(GL_TEXTURE);
			glPushMatrix();
			glScalef(uRep, vRep, 1.0f);     // repeat fabric
			glMatrixMode(GL_MODELVIEW);

			drawTexturedUnitBox();

			glMatrixMode(GL_TEXTURE);
			glPopMatrix();
			glMatrixMode(GL_MODELVIEW);
		};

	auto leg = [&](float sgn, float thighSwingDeg, float kneeSwingDeg)
		{
			glPushMatrix();
			glTranslatef(sgn * hipX, hipY, zHip);
			glRotatef(thighSwingDeg, 1, 0, 0);

			// ---- thigh ----
			glPushMatrix();
			glTranslatef(0.0f, -thighH * 0.5f, 0.0f);
			glScalef(thighW, thighH, thighD);
			// a bit more repeats vertically than horizontally
			drawTiledUnitBox(/*uRep=*/1.4f, /*vRep=*/thighH * 0.7f);
			glPopMatrix();

			// ---- shin ----
			glPushMatrix();
			glTranslatef(0.0f, -thighH, 0.0f);
			glRotatef(kneeSwingDeg, 1, 0, 0);
			glTranslatef(0.0f, -(shinH + intoBoot) * 0.5f, 0.0f);
			glScalef(shinW, shinH + intoBoot, shinD);
			drawTiledUnitBox(/*uRep=*/1.2f, /*vRep=*/(shinH + intoBoot) * 0.7f);
			glPopMatrix();

			glPopMatrix();
		};

	// combine manual + walk swing (your existing logic)
	float leftThigh = gManualLegL + swingDeg;
	float rightThigh = -(gManualLegR + swingDeg);

	float autoKneeL = -0.5f * swingDeg;
	float autoKneeR = +0.5f * swingDeg;

	float fwdL = -gManualLegL; if (fwdL < 0.0f) fwdL = 0.0f;
	float fwdR = gManualLegR; if (fwdR < 0.0f) fwdR = 0.0f;

	float manualKneeL = 0.5f * fwdL;
	float manualKneeR = 0.5f * fwdR;

	float kneeL = autoKneeL + manualKneeL;
	float kneeR = autoKneeR + manualKneeR;

	leg(-1.0f, leftThigh, kneeL);   // left
	leg(+1.0f, rightThigh, kneeR);   // right


	glDisable(GL_TEXTURE_2D);
	glPopMatrix();
}


static void drawRoundedBoots(float swingDeg)
{
	// --- must match drawPants() ---
	const float hipY = 0.15f;
	const float hipX = 0.35f;
	const float zHip = -0.1f;
	const float thighH = 2.65f;
	const float shinH = 1.75f;
	const float intoBoot = 0.10f;

	// Keep your original silhouette
	const float ANKLE_W = 0.55f, ANKLE_H = 0.45f, ANKLE_D = 0.60f;
	const float HEEL_W = 0.55f, HEEL_H = 0.22f, HEEL_D = 0.28f;
	const float TOE_W = 0.55f, TOE_H = 0.29f, TOE_D = 0.35f;

	// tiny placement bias to keep your look
	const float BIAS_Y = -0.05f;
	const float BIAS_Z = +0.05f;

	const BootPalette& bp = CurrentBootPal();

	auto bootAtLeg = [&](float sgn, float thighSwingDeg, float kneeSwingDeg)
		{
			glPushMatrix();
			// HIP → THIGH ROT → to knee → KNEE ROT
			glTranslatef(sgn * hipX, hipY, zHip);
			glRotatef(thighSwingDeg, 1, 0, 0);
			glTranslatef(0.0f, -thighH, 0.0f);
			glRotatef(kneeSwingDeg, 1, 0, 0);

			// to ankle, then bias
			glTranslatef(0.0f, -(shinH + intoBoot), 0.0f);
			glTranslatef(0.0f, BIAS_Y, BIAS_Z);

			// Cuff (ankle)
			glPushMatrix();
			glTranslatef(0.0f, -ANKLE_H * 0.5f, 0.0f);
			glScalef(ANKLE_W, ANKLE_H, ANKLE_D);
			glColor3fv(bp.cuff);
			drawBox(1, 1, 1);
			glPopMatrix();

			// Heel
			glPushMatrix();
			glTranslatef(0.0f, -HEEL_H * 0.5f, -HEEL_D * 0.5f);
			glScalef(HEEL_W, HEEL_H, HEEL_D);
			glColor3fv(bp.heel);
			drawBox(1, 1, 1);
			glPopMatrix();

			// Toe
			glPushMatrix();
			glTranslatef(0.0f, -TOE_H * 0.95f, +TOE_D * 1.0f);
			glScalef(TOE_W, TOE_H, TOE_D);
			glColor3fv(bp.toe);
			drawBox(1, 1, 1);
			glPopMatrix();

			glPopMatrix();
		};

	// Same angle math as your legs so boots follow perfectly
	float leftThigh = gManualLegL + swingDeg;
	float rightThigh = -(gManualLegR + swingDeg);

	float autoKneeL = -0.5f * swingDeg;
	float autoKneeR = +0.5f * swingDeg;

	float fwdL = -gManualLegL; if (fwdL < 0.0f) fwdL = 0.0f;
	float fwdR = gManualLegR; if (fwdR < 0.0f) fwdR = 0.0f;

	float manualKneeL = 0.5f * fwdL;
	float manualKneeR = 0.5f * fwdR;

	float kneeL = autoKneeL + manualKneeL;
	float kneeR = autoKneeR + manualKneeR;

	bootAtLeg(-1.0f, leftThigh, kneeL);
	bootAtLeg(+1.0f, rightThigh, kneeR);
}



// ------- colors you can tweak -------
static const GLfloat COL_SKIN[3] = { 0.94f, 0.90f, 0.82f };
static const GLfloat COL_SHIRT[3] = { 0.10f, 0.15f, 0.25f }; // dark blue/black
static const GLfloat COL_ROBE_L[3] = { 0.70f, 0.93f, 0.90f }; // left lapel
static const GLfloat COL_ROBE_R[3] = { 0.76f, 0.96f, 0.93f }; // right lapel
//static const GLfloat COL_GOLD[3] = { 0.82f, 0.72f, 0.26f };

struct V2 { float x, y; };
struct V3 { float x, y, z; };
static inline float Lerp(float a, float b, float t) { return a + (b - a) * t; }
static inline void  norm2(float x, float y, float& nx, float& ny) {
	float L = std::sqrt(x * x + y * y); nx = (L > 1e-6f) ? x / L : 0.0f; ny = (L > 1e-6f) ? y / L : 1.0f;
}

// cubic smoothstep 0..1 between edges
static inline float sstep(float e0, float e1, float x) {
	if (e0 == e1) return (x >= e1) ? 1.0f : 0.0f;
	float t = (x - e0) / (e1 - e0);
	if (t < 0.0f) t = 0.0f; else if (t > 1.0f) t = 1.0f;
	return t * t * (3.0f - 2.0f * t);
}


// ---- Torso outline (front view), 0 at top -> 1 at bottom
static float torsoHalfWidth(float t, float topHalf, float botHalf, float shoulderBulge, float waistIn) {
	float w = Lerp(topHalf, botHalf, t);
	float shoulder = shoulderBulge * std::sin(3.1415926f * fmaxf(0.f, 1.f - t));          // bulge near top
	float waist = -waistIn * std::sin(3.1415926f * fmaxf(0.f, (t - 0.45f) * 1.3f)); // pinch mid
	return fmaxf(0.02f, w + shoulder + waist);
}
static float torsoYCurve(float t, float topCurve, float botCurve) {
	float top = -topCurve * (1.f - t) * (1.f - t);
	float bot = botCurve * (t) * (t);
	return top + bot;
}

static void buildTorsoPolyline(std::vector<V2>& poly,
	float topWidth = 3.80f, float bottomWidth = 2.10f, float height = 2.30f, int seg = 44,
	float shoulderBulge = 0.07f, float waistIn = 0.03f, float topCurve = 0.10f, float bottomCurve = 0.07f)
{
	poly.clear(); poly.reserve(seg * 2 + 2);
	float topHalf = topWidth * 0.5f, botHalf = bottomWidth * 0.5f;
	for (int i = 0; i <= seg; ++i) {
		float t = (float)i / (float)seg;
		float hw = torsoHalfWidth(t, topHalf, botHalf, shoulderBulge, waistIn);
		float y = Lerp(+height * 0.5f, -height * 0.5f, t) + torsoYCurve(t, topCurve, bottomCurve);
		poly.push_back({ -hw, y }); // left edge
	}
	for (int i = seg; i >= 0; --i) {
		float t = (float)i / (float)seg;
		float hw = torsoHalfWidth(t, topHalf, botHalf, shoulderBulge, waistIn);
		float y = Lerp(+height * 0.5f, -height * 0.5f, t) + torsoYCurve(t, topCurve, bottomCurve);
		poly.push_back({ +hw, y }); // right edge
	}
}

// ---- Generic polygon extrusion with lit side walls
static void drawExtruded(const std::vector<V2>& poly, float thickness, bool fillFront = true, bool fillBack = true) {
	if (poly.size() < 3) return;
	float zf = +thickness * 0.5f, zb = -thickness * 0.5f;

	// centroid for triangle-fan fill
	V2 c{ 0,0 }; for (auto& p : poly) { c.x += p.x; c.y += p.y; } c.x /= poly.size(); c.y /= poly.size();

	if (fillFront) {
		glNormal3f(0, 0, 1);
		glBegin(GL_TRIANGLE_FAN);
		glVertex3f(c.x, c.y, zf);
		for (size_t i = 0; i < poly.size(); ++i) glVertex3f(poly[i].x, poly[i].y, zf);
		glVertex3f(poly[0].x, poly[0].y, zf);
		glEnd();
	}
	if (fillBack) {
		glNormal3f(0, 0, -1);
		glBegin(GL_TRIANGLE_FAN);
		glVertex3f(c.x, c.y, zb);
		for (int i = (int)poly.size() - 1; i >= 0; --i) glVertex3f(poly[i].x, poly[i].y, zb);
		glVertex3f(poly.back().x, poly.back().y, zb);
		glEnd();
	}
	glBegin(GL_QUADS);
	for (size_t i = 0; i < poly.size(); ++i) {
		size_t j = (i + 1) % poly.size();
		float dx = poly[j].x - poly[i].x, dy = poly[j].y - poly[i].y;
		float nx, ny; norm2(dy, -dx, nx, ny);   // outward 2D normal
		glNormal3f(nx, ny, 0.0f);
		glVertex3f(poly[i].x, poly[i].y, zb);
		glVertex3f(poly[i].x, poly[i].y, zf);
		glVertex3f(poly[j].x, poly[j].y, zf);
		glVertex3f(poly[j].x, poly[j].y, zb);
	}
	glEnd();
}

static void drawExtrudedPlanarXY(
	const std::vector<V2>& poly,
	float thickness,
	float uScale = 0.35f,
	float vScale = 0.35f,
	bool fillFront = true,
	bool fillBack = true)
{
	if (poly.size() < 3) return;
	const float zf = +thickness * 0.5f;
	const float zb = -thickness * 0.5f;

	// centroid for triangle-fan fill
	V2 c{ 0,0 }; for (auto& p : poly) { c.x += p.x; c.y += p.y; }
	c.x /= poly.size(); c.y /= poly.size();

	// FRONT fill (z = +thickness/2)
	if (fillFront) {
		glNormal3f(0, 0, 1);
		glBegin(GL_TRIANGLE_FAN);
		glTexCoord2f(c.x * uScale, c.y * vScale); glVertex3f(c.x, c.y, zf);
		for (size_t i = 0; i < poly.size(); ++i) {
			glTexCoord2f(poly[i].x * uScale, poly[i].y * vScale);
			glVertex3f(poly[i].x, poly[i].y, zf);
		}
		glTexCoord2f(poly[0].x * uScale, poly[0].y * vScale);
		glVertex3f(poly[0].x, poly[0].y, zf);
		glEnd();
	}

	// BACK fill (z = -thickness/2)
	if (fillBack) {
		glNormal3f(0, 0, -1);
		glBegin(GL_TRIANGLE_FAN);
		glTexCoord2f(c.x * uScale, c.y * vScale); glVertex3f(c.x, c.y, zb);
		for (int i = (int)poly.size() - 1; i >= 0; --i) {
			glTexCoord2f(poly[i].x * uScale, poly[i].y * vScale);
			glVertex3f(poly[i].x, poly[i].y, zb);
		}
		glTexCoord2f(poly.back().x * uScale, poly.back().y * vScale);
		glVertex3f(poly.back().x, poly.back().y, zb);
		glEnd();
	}

	// SIDE walls (map Y to V; thickness to U)
	glBegin(GL_QUADS);
	for (size_t i = 0; i < poly.size(); ++i) {
		size_t j = (i + 1) % poly.size();
		float dx = poly[j].x - poly[i].x, dy = poly[j].y - poly[i].y;
		float nx, ny; norm2(dy, -dx, nx, ny);
		glNormal3f(nx, ny, 0.0f);

		float v0 = poly[i].y * vScale;
		float v1 = poly[j].y * vScale;
		// U = 0 at back, U = 1 at front
		glTexCoord2f(0, v0); glVertex3f(poly[i].x, poly[i].y, zb);
		glTexCoord2f(1, v0); glVertex3f(poly[i].x, poly[i].y, zf);
		glTexCoord2f(1, v1); glVertex3f(poly[j].x, poly[j].y, zf);
		glTexCoord2f(0, v1); glVertex3f(poly[j].x, poly[j].y, zb);
	}
	glEnd();
}


static std::vector<V2> makePanel(const V2 a, const V2 b, const V2 c, const V2 d, bool quad = true) {
	std::vector<V2> P; P.reserve(4);
	P.push_back(a); P.push_back(b); P.push_back(c);
	if (quad) P.push_back(d);
	return P;
}

// thin strip centered along edge a->b
static std::vector<V2> makeEdgeStrip(V2 a, V2 b, float halfWidth) {
	float tx = b.x - a.x, ty = b.y - a.y;
	float L = std::sqrt(tx * tx + ty * ty); if (L < 1e-6f) L = 1.0f;
	float nx = -ty / L, ny = tx / L;
	return {
		{ a.x + nx * halfWidth, a.y + ny * halfWidth },
		{ a.x - nx * halfWidth, a.y - ny * halfWidth },
		{ b.x - nx * halfWidth, b.y - ny * halfWidth },
		{ b.x + nx * halfWidth, b.y + ny * halfWidth }
	};
}

// ---- Main “kimono torso” builder ---------------------------------
void drawKimonoTorso3D(
	float torsoTopW = 2.6f, float torsoBotW = 1.25f, float torsoH = 2.35f,
	float torsoThick = 0.18f, float clothThick = 0.06f, float lapelDepthOffset = 0.02f)
{
	std::vector<V2> torso;
	buildTorsoPolyline(torso, torsoTopW, torsoBotW, torsoH);

	glPushMatrix();

	// Bind the same cloth texture you use for the upper sleeve
	glEnable(GL_TEXTURE_2D);
	glBindTexture(GL_TEXTURE_2D, currentUpperSleeveTex);
	glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_MODULATE);
	glColor3f(1, 1, 1);

	// Nudge depth so lapels/trim render clean on top
	glEnable(GL_POLYGON_OFFSET_FILL);
	glPolygonOffset(1.0f, 1.0f);

	// Planar XY UVs for front/back; simple Y/thickness mapping on sides
	drawExtrudedPlanarXY(torso, torsoThick, /*uScale*/0.35f, /*vScale*/0.35f);

	glDisable(GL_POLYGON_OFFSET_FILL);
	glDisable(GL_TEXTURE_2D);


	// reference Y levels
	float yTop = torsoH * 0.42f;
	float yMid = 0.00f;
	float yLow = -torsoH * 0.33f;

	// half width at height y (approx inverse)
	auto halfAtY = [&](float y)->float {
		float t = (yTop - y) / (yTop - (-torsoH * 0.5f));
		if (t < 0) t = 0; if (t > 1) t = 1;
		return torsoHalfWidth(t, torsoTopW * 0.5f, torsoBotW * 0.5f, 0.22f, 0.16f);
		};

	// 1) Inner shirt — now textured, follows X/Y like lapels
	{
		float hwTop = halfAtY(yTop * 0.95f) * 0.55f;
		float hwMid = halfAtY(yMid) * 0.45f;
		float yTopEdge = torsoH * 0.45f - 0.01f;  // a hair under the absolute top

		std::vector<V2> inner = {
			{ -hwTop, yTopEdge }, {  hwTop, yTopEdge },
			{  hwMid, yMid     }, { -hwMid, yMid     }
		};

		glPushMatrix();
		glTranslatef(0, 0, +(torsoThick * 0.5f + lapelDepthOffset));

		glEnable(GL_TEXTURE_2D);
		glBindTexture(GL_TEXTURE_2D, currentInnerShirtTex);
		glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_MODULATE);
		glColor3f(1, 1, 1);

		// small offset so it layers cleanly on top of torso texture
		glEnable(GL_POLYGON_OFFSET_FILL);
		glPolygonOffset(1.0f, 1.0f);

		// planar mapping so cloth reads naturally
		drawExtrudedPlanarXY(inner, clothThick, /*uScale*/0.35f, /*vScale*/0.35f);

		glDisable(GL_POLYGON_OFFSET_FILL);
		glDisable(GL_TEXTURE_2D);

		glPopMatrix();
	}

	auto shift = [](V2 p, float dx, float dy) { return V2{ p.x + dx, p.y + dy }; };

	// ================= LEFT LAPEL (under) =================
	V2 L1, L2, L3, L4, L1s, L2s, L3s, L4s;
	{
		float Yt = yTop * 0.98f, Ym = yMid * 0.25f, Yb = yLow * 1.52f;
		L1 = { -halfAtY(Yt) * 0.98f, Yt };
		L4 = { -halfAtY(Yb) * 0.94f, Yb * 0.96f };
		L2 = { -halfAtY(Ym) * 0.06f, Ym };
		L3 = { -halfAtY(Yb) * 0.00f, Yb };

		const float dxL = +0.15f, dyL = +0.05f;
		L1s = { L1.x + dxL, L1.y + dyL };
		L2s = { L2.x + dxL, L2.y + dyL };
		L3s = { L3.x + dxL, L3.y + dyL };
		L4s = { L4.x + dxL, L4.y + dyL };

		auto lapelL = makePanel(L1s, L2s, L3s, L4s, true);

		glPushMatrix();
		glTranslatef(0, 0, +(torsoThick * 0.5f + lapelDepthOffset * 3.2f)); // only Z stack

		// --- textured lapel (same switching texture as sleeves/torso) ---
		glEnable(GL_TEXTURE_2D);
		glBindTexture(GL_TEXTURE_2D, currentLapelTex);
		glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_MODULATE);
		glColor3f(1, 1, 1);

		// tiny offset so it sits cleanly on top of torso texture
		glEnable(GL_POLYGON_OFFSET_FILL);
		glPolygonOffset(1.0f, 1.0f);

		// planar XY UVs so the cloth reads naturally
		drawExtrudedPlanarXY(lapelL, clothThick, /*uScale*/0.35f, /*vScale*/0.35f);

		glDisable(GL_POLYGON_OFFSET_FILL);
		glDisable(GL_TEXTURE_2D);

		glPopMatrix();
	}



	// ================= RIGHT LAPEL (over) =================
	V2 R1, R2, R3, R4, R1s, R2s, R3s, R4s;
	{
		float Yt = yTop * 0.98f, Ym = yMid * 0.20f, Yb = yLow * 1.52f;

		R1 = { +halfAtY(Yt) * 0.92f, Yt };
		R2 = { +halfAtY(Ym) * 0.02f, Ym };
		R3 = { +halfAtY(Yb) * 0.00f, Yb };
		R4 = { +halfAtY(Yb) * 0.90f, Yb * 0.96f };

		const float dxR = -0.15f, dyR = +0.05f;
		R1s = { R1.x + dxR, R1.y + dyR };
		R2s = { R2.x + dxR, R2.y + dyR };
		R3s = { R3.x + dxR, R3.y + dyR };
		R4s = { R4.x + dxR, R4.y + dyR };

		auto lapelR = makePanel(R1s, R2s, R3s, R4s, true);

		glPushMatrix();
		glTranslatef(0.02f, 0, +(torsoThick * 0.5f + lapelDepthOffset * 3.23f)); // only Z stack

		// --- textured lapel (same switching texture as sleeves/torso) ---
		glEnable(GL_TEXTURE_2D);
		glBindTexture(GL_TEXTURE_2D, currentLapelTex);
		glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_MODULATE);
		glColor3f(1, 1, 1);

		glEnable(GL_POLYGON_OFFSET_FILL);
		glPolygonOffset(1.0f, 1.0f);

		drawExtrudedPlanarXY(lapelR, clothThick, /*uScale*/0.35f, /*vScale*/0.35f);

		glDisable(GL_POLYGON_OFFSET_FILL);
		glDisable(GL_TEXTURE_2D);

		glPopMatrix();
	}


	// helper: interpolate between two points
	auto lerpV2 = [](V2 a, V2 b, float t) {
		return V2{ a.x + (b.x - a.x) * t, a.y + (b.y - a.y) * t };
		};


	// ================= GOLD TRIMS (shorter) — now textured with texHemOri =================
	{
		const float stripHalf = 0.060f;
		const float tthick = clothThick * 0.45f;

		// choose how “dense” the hem texture looks on the trims
		const float uScale = 0.90f;   // along X
		const float vScale = 0.90f;   // along Y

		// pick shorter end points: 0.7 = 70% of way down
		V2 L3short = lerpV2(L1s, L3s, 0.7f);
		V2 R3short = lerpV2(R1s, R3s, 0.7f);

		// build the two narrow quad strips
		auto goldL_inner = makeEdgeStrip(L1s, L3short, stripHalf);
		auto goldR_inner = makeEdgeStrip(R1s, R3short, stripHalf);

		// Draw LEFT textured trim
		glPushMatrix();
		glTranslatef(0.24f, 0.12f, +(torsoThick * 0.5f + lapelDepthOffset * 2.75f));
		glRotatef(16.0f, 0, 0, 1);

		glEnable(GL_TEXTURE_2D);
		glBindTexture(GL_TEXTURE_2D, currentGoldStripTex);
		// << use hem_ori texture
		glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_MODULATE);
		glColor3f(1, 1, 1);

		glEnable(GL_POLYGON_OFFSET_FILL);
		glPolygonOffset(1.0f, 1.0f);                              // keep it cleanly on top

		drawExtrudedPlanarXY(goldL_inner, tthick, uScale, vScale);

		glDisable(GL_POLYGON_OFFSET_FILL);
		glDisable(GL_TEXTURE_2D);
		glPopMatrix();

		// Draw RIGHT textured trim
		glPushMatrix();
		glTranslatef(-0.28f, 0.14f, +(torsoThick * 0.5f + lapelDepthOffset * 2.6f));
		glRotatef(-20.0f, 0, 0, 1);

		glEnable(GL_TEXTURE_2D);
		glBindTexture(GL_TEXTURE_2D, currentGoldStripTex);
		// << same hem texture
		glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_MODULATE);
		glColor3f(1, 1, 1);

		glEnable(GL_POLYGON_OFFSET_FILL);
		glPolygonOffset(1.0f, 1.0f);

		drawExtrudedPlanarXY(goldR_inner, tthick, uScale, vScale);

		glDisable(GL_POLYGON_OFFSET_FILL);
		glDisable(GL_TEXTURE_2D);
		glPopMatrix();
	}

	glPopMatrix();
}



// ================= Hand (palm + fingers) =================
static void drawBoxUnit(float W, float H, float D) {
	const float x = W * 0.5f, y = H * 0.5f, z = D * 0.5f;
	glBegin(GL_QUADS);
	glNormal3f(1, 0, 0); glVertex3f(+x, -y, -z); glVertex3f(+x, -y, +z); glVertex3f(+x, +y, +z); glVertex3f(+x, +y, -z);
	glNormal3f(-1, 0, 0); glVertex3f(-x, -y, +z); glVertex3f(-x, -y, -z); glVertex3f(-x, +y, -z); glVertex3f(-x, +y, +z);
	glNormal3f(0, 1, 0); glVertex3f(-x, +y, -z); glVertex3f(+x, +y, -z); glVertex3f(+x, +y, +z); glVertex3f(-x, +y, +z);
	glNormal3f(0, -1, 0); glVertex3f(-x, -y, +z); glVertex3f(+x, -y, +z); glVertex3f(+x, -y, -z); glVertex3f(-x, -y, -z);
	glNormal3f(0, 0, 1); glVertex3f(-x, -y, +z); glVertex3f(+x, -y, +z); glVertex3f(+x, +y, +z); glVertex3f(-x, +y, +z);
	glNormal3f(0, 0, -1); glVertex3f(+x, -y, -z); glVertex3f(-x, -y, -z); glVertex3f(-x, +y, -z); glVertex3f(+x, +y, -z);
	glEnd();
}

static void drawFinger(GLUquadric* q,
	float baseR, float midR, float tipR,
	float L1, float L2, float L3,
	float curl1Deg, float curl2Deg, float curl3Deg)
{
	// proximal
	gluCylinder(q, baseR, midR, L1, 16, 1);
	glTranslatef(0, 0, L1);
	gluDisk(q, 0, midR, 16, 1);
	glRotatef(curl2Deg, 1, 0, 0);

	// middle
	gluCylinder(q, midR, tipR, L2, 16, 1);
	glTranslatef(0, 0, L2);
	gluDisk(q, 0, tipR, 16, 1);
	glRotatef(curl3Deg, 1, 0, 0);

	// distal
	gluCylinder(q, tipR, 0.85f * tipR, L3, 16, 1);
	glTranslatef(0, 0, L3);
	gluDisk(q, 0, 0.85f * tipR, 16, 1);
}

// Attach at the wrist end of your forearm.
// Assumes local +Z points from wrist toward fingertips (how your sleeve uses it).
void drawHandAtWrist(
	bool  left,
	float yawDeg = 0.0f,   // twist in palm plane
	float pitchDeg = 0.0f,   // bend up/down
	float rollDeg = 0.0f,   // roll thumb↔pinky
	float curlAll = 0.0f,   // 0=open, ~60=loose fist
	float spread = 8.0f    // finger splay in degrees
) {
	const float sx = left ? -1.0f : 1.0f;

	// palm size
	const float PALM_W = 0.25f, PALM_H = 0.09f, PALM_D = 0.30f;

	// finger proportions
	const float L1 = 0.12f, L2 = 0.15f, L3 = 0.12f;
	const float LT1 = 0.13f, LT2 = 0.11f;
	const float R_BASE = 0.051f, R_MID = 0.038f, R_TIP = 0.022f;
	const float R_THB = 0.045f, R_THB2 = 0.027f;

	// placement helpers
	const float KNuckleDropZ = 0.18f; // lower fingers cluster along +Z (your “down”)
	const float zForward = -0.22f; // offset so fingers start near palm front

	GLUquadric* q = gluNewQuadric();
	gluQuadricNormals(q, GLU_SMOOTH);

	glPushMatrix();

	// wrist orientation
	glRotatef(yawDeg * sx, 0, 0, 1);
	glRotatef(pitchDeg, 1, 0, 0);
	glRotatef(rollDeg * sx, 0, 1, 0);

	// ----- palm block -----
	glPushMatrix();
	glTranslatef(0.0f, 0.0f, PALM_D * 0.45f);
	glColor3fv(COL_SKIN);
	drawBoxUnit(PALM_W, PALM_H, PALM_D);
	glPopMatrix();

	// ----- move to knuckle line -----
	glTranslatef(0.0f, 0.0f, PALM_D + KNuckleDropZ);

	const float spreadIdx[4] = {
		-spread * 0.30f, -spread * 0.10f, +spread * 0.10f, +spread * 0.35f
	};
	const float xPos[4] = {
		-PALM_W * 0.21f, -PALM_W * 0.04f, +PALM_W * 0.18f, +PALM_W * 0.31f
	};

	// four fingers
	for (int i = 0; i < 4; ++i) {
		glPushMatrix();
		glTranslatef(sx * xPos[i], 0.0f, zForward);
		glRotatef(spreadIdx[i] * sx, 0, 1, 0);     // yaw (splay)
		glRotatef(curlAll * 0.55f, 1, 0, 0);     // first joint bias
		glColor3fv(COL_SKIN);
		drawFinger(q, R_BASE, R_MID, R_TIP,
			L1, L2, L3,
			0.0f,                 // first joint already biased above
			curlAll * 0.65f,      // middle joint
			curlAll * 0.65f);     // distal joint
		glPopMatrix();
	}

	// thumb
	glPushMatrix();
	glTranslatef(sx * (-PALM_W * 0.37f), -PALM_H * 0.10f, -PALM_D * 1.0f + KNuckleDropZ * 0.6f);
	glRotatef(-10.0f * sx, 0, 1, 0);
	glRotatef(10.0f, 1, 0, 0);
	glRotatef(curlAll * 0.45f, 1, 0, 0);

	glColor3fv(COL_SKIN);
	gluCylinder(q, R_THB, R_THB2, LT1, 16, 1);
	glTranslatef(0, 0, LT1); gluDisk(q, 0, R_THB2, 16, 1);
	glRotatef(curlAll * 0.55f, 1, 0, 0);
	gluCylinder(q, R_THB2, 0.90f * R_THB2, LT2, 16, 1);
	glTranslatef(0, 0, LT2); gluDisk(q, 0, 0.90f * R_THB2, 16, 1);
	glPopMatrix();

	glPopMatrix();
	gluDeleteQuadric(q);
}


void DrawSword();

static void drawSleeveDown(
	bool  left,
	float swingOutZ = 0.0f,
	float leanFwdX = 0.0f,
	float upperLen = 1.40f,
	float rBase = 0.3f,
	float rTop = 0.25f,
	float foreLen = 1.30f,
	bool  roundTop = true,
	float yawFrontY = 0.0f,
	float advanceZ = 0.0f,
	float elbowCurlDeg = 0.0f
)
{
	// ===== placement =====
	const float SHOULDER_X = 0.8f;
	const float SHOULDER_Y = 1.9f;
	const float SHOULDER_Z = 0.00f;

	// ===== rings on the forearm =====
	const float RING_GAP = 0.09f;
	const float RING_H = 0.035f;
	const float RING_UP = 0.35f;

	float sx = left ? -1.0f : 1.0f;

	GLUquadric* q = gluNewQuadric();
	gluQuadricNormals(q, GLU_SMOOTH);
	gluQuadricTexture(q, GL_TRUE);   // <-- enable texcoords on GLU shapes

	glPushMatrix();

	// anchor at shoulder
	glTranslatef(SHOULDER_X * sx, SHOULDER_Y, SHOULDER_Z);

	glRotatef(yawFrontY * (left ? -1.0f : +1.0f), 0, 1, 0);
	glTranslatef(0.0f, 0.0f, advanceZ);

	// orientation
	glRotatef(sx * swingOutZ, 0, 0, 1);
	glRotatef(leanFwdX, 1, 0, 0);
	glRotatef(90.0f, 1, 0, 0);  // z+ points down

	// -------- rounded shoulder cap (TEXTURED cloth) --------
	glEnable(GL_TEXTURE_2D);
	glBindTexture(GL_TEXTURE_2D, currentUpperSleeveTex);
	glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_MODULATE);
	glColor3f(1, 1, 1);

	if (roundTop) {
		gluSphere(q, rBase, 24, 16);
	}
	else {
		gluDisk(q, 0.0f, rBase, 24, 1);
	}

	// -------- upper sleeve CYLINDER (TEXTURED cloth) --------
	gluCylinder(q, rBase, rTop, upperLen, 24, 1);

	// end cap at the cuff (still textured so it matches the sleeve)
	glTranslatef(0, 0, upperLen);
	gluDisk(q, 0.0f, rTop, 24, 1);

	// -------- gold cuff (UNtextured) --------
	glDisable(GL_TEXTURE_2D);
	glColor3fv(COL_GOLD);
	const float cuffH = 0.06f;
	gluCylinder(q, rTop, rTop, cuffH, 24, 1);

	// -------- forearm (UNtextured, your dark/navy) --------
	const float rForeTop = rTop * 0.99f;
	const float rWrist = rTop * 0.63f;

	glTranslatef(0, 0, cuffH);

	// Bend ONLY the forearm from the elbow forward/back.
	// Positive values curl the forearm upward toward the body.
	glRotatef(elbowCurlDeg, 1, 0, 0);

	glColor3f(0.05f, 0.07f, 0.12f);
	gluCylinder(q, rForeTop, rWrist, foreLen, 24, 1);


	// two thin white rings on the forearm
	{
		const float ringR = rForeTop + 0.010f; // tiny offset to avoid z-fighting
		glPushMatrix();
		glTranslatef(0, 0, RING_UP);
		glColor3f(1.0f, 1.0f, 1.0f);
		gluCylinder(q, ringR, ringR, RING_H, 24, 1);
		glTranslatef(0, 0, RING_GAP);
		gluCylinder(q, ringR, ringR, RING_H, 24, 1);
		glPopMatrix();
	}
	glGetFloatv(GL_MODELVIEW_MATRIX, gRightWristM);
	gHasRightWristM = true;
	// wrist end-cap (optional)
	glTranslatef(0, 0, foreLen);
	glColor3f(0.05f, 0.07f, 0.12f);
	gluDisk(q, 0.0f, rWrist, 24, 1);

	// ---- Hand (as you had) ----
	float yaw = left ? gHandYaw_L : gHandYaw_R;
	float pitch = left ? gHandPitch_L : gHandPitch_R;
	float roll = left ? gHandRoll_L : gHandRoll_R;

	// Keep left hand as-is; make right hand grip the sword
	float curl = left ? 8.0f : 80.0f;  // 35–55 looks like a strong grip
	float splay = left ? 6.0f : 2.0f;   // tighter finger spread while gripping

	drawHandAtWrist(left, yaw, pitch, roll, curl, splay);

	// ==== Attach sword to RIGHT wrist (follows arm swing) ====
	if (!left) {
		glPushMatrix();

		// Reapply wrist orientation so sword aligns with the hand frame
		glRotatef(yaw, 0, 0, 1);   // same axes/order as drawHandAtWrist
		glRotatef(pitch, 1, 0, 0);
		glRotatef(roll, 0, 1, 0);

		glRotatef(110.0f, 1.0f, 0.0f, 0.0f);
		glRotatef(83.0f, 0.0f, 0.0f, 1.0f);
		glTranslatef(0.3f, 1.3f, 0.3f);
		glScalef(1.4f, 1.4f, 1.4f);

		glEnable(GL_TEXTURE_2D);
		glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_MODULATE);
		DrawSword();
		glDisable(GL_TEXTURE_2D);

		glPopMatrix();
	}

	glPopMatrix();
	gluDeleteQuadric(q);
}


// Collar
static const GLfloat COL_BEIGE[4] = { 0.95f, 0.92f, 0.86f, 1.0f };

// ----- tiny vec helpers -----
static inline void sub3(const GLfloat a[3], const GLfloat b[3], GLfloat o[3]) {
	o[0] = a[0] - b[0]; o[1] = a[1] - b[1]; o[2] = a[2] - b[2];
}
static inline void cross3(const GLfloat u[3], const GLfloat v[3], GLfloat o[3]) {
	o[0] = u[1] * v[2] - u[2] * v[1];
	o[1] = u[2] * v[0] - u[0] * v[2];
	o[2] = u[0] * v[1] - u[1] * v[0];
}
static inline void norm3(GLfloat n[3]) {
	float L = sqrtf(n[0] * n[0] + n[1] * n[1] + n[2] * n[2]);
	if (L > 1e-8f) { n[0] /= L; n[1] /= L; n[2] /= L; }
}

// Emit a normal for a quad using first 3 vertices (p0,p1,p2) in the SAME order as glVertex
static inline void normalForQuad(const GLfloat p0[3], const GLfloat p1[3], const GLfloat p2[3]) {
	GLfloat u[3], v[3], n[3];
	sub3(p1, p0, u);           // u = p1 - p0
	sub3(p2, p0, v);           // v = p2 - p0
	cross3(u, v, n);           // n = u x v  (right-handed; respects vertex winding)
	norm3(n);
	glNormal3f(n[0], n[1], n[2]);
}

// ----- tiny vec helpers you already have (keep as-is) -----
// sub3, cross3, norm3, normalForQuad ...

// Draw one triangular prism with a bound texture
static void drawTriPrismTex(const GLfloat A[3], const GLfloat B[3], const GLfloat C[3],
	float thick, GLuint tex)
{
	const float zf = +thick * 0.5f;  // front
	const float zb = -thick * 0.5f;  // back

	// convenience lambdas
	auto Vz = [](const GLfloat v[3], float z) { glVertex3f(v[0], v[1], z); };
	auto UV = [](float x, float y, float uS, float vS) { glTexCoord2f(x * uS, y * vS); };

	// tweak these if you want more/less tiling
	const float uScale = 0.55f;
	const float vScale = 0.55f;

	// precompute front/back verts we’ll reuse
	GLfloat A_f[3] = { A[0], A[1], zf }, A_b[3] = { A[0], A[1], zb };
	GLfloat B_f[3] = { B[0], B[1], zf }, B_b[3] = { B[0], B[1], zb };
	GLfloat C_f[3] = { C[0], C[1], zf }, C_b[3] = { C[0], C[1], zb };

	glEnable(GL_TEXTURE_2D);
	glBindTexture(GL_TEXTURE_2D, tex);
	glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_MODULATE);
	glColor3f(1, 1, 1);

	// -------- FRONT (planar XY) --------
	glBegin(GL_TRIANGLES);
	glNormal3f(0, 0, 1);
	UV(A[0], A[1], uScale, vScale); Vz(A, zf);
	UV(B[0], B[1], uScale, vScale); Vz(B, zf);
	UV(C[0], C[1], uScale, vScale); Vz(C, zf);
	glEnd();

	// -------- BACK (planar XY, reversed winding) --------
	glBegin(GL_TRIANGLES);
	glNormal3f(0, 0, -1);
	UV(C[0], C[1], uScale, vScale); Vz(C, zb);
	UV(B[0], B[1], uScale, vScale); Vz(B, zb);
	UV(A[0], A[1], uScale, vScale); Vz(A, zb);
	glEnd();

	// -------- SIDES (U = thickness 0..1, V = Y * vScale) --------

	// AB side
	glBegin(GL_QUADS);
	normalForQuad(A_f, B_f, B_b);
	glTexCoord2f(0, A[1] * vScale); glVertex3fv(A_f);
	glTexCoord2f(0, B[1] * vScale); glVertex3fv(B_f);
	glTexCoord2f(1, B[1] * vScale); glVertex3fv(B_b);
	glTexCoord2f(1, A[1] * vScale); glVertex3fv(A_b);
	glEnd();

	// BC side
	glBegin(GL_QUADS);
	normalForQuad(B_f, C_f, C_b);
	glTexCoord2f(0, B[1] * vScale); glVertex3fv(B_f);
	glTexCoord2f(0, C[1] * vScale); glVertex3fv(C_f);
	glTexCoord2f(1, C[1] * vScale); glVertex3fv(C_b);
	glTexCoord2f(1, B[1] * vScale); glVertex3fv(B_b);
	glEnd();

	// AC side
	glBegin(GL_QUADS);
	normalForQuad(A_f, C_f, C_b);
	glTexCoord2f(0, A[1] * vScale); glVertex3fv(A_f);
	glTexCoord2f(0, C[1] * vScale); glVertex3fv(C_f);
	glTexCoord2f(1, C[1] * vScale); glVertex3fv(C_b);
	glTexCoord2f(1, A[1] * vScale); glVertex3fv(A_b);
	glEnd();

	glDisable(GL_TEXTURE_2D);
}

// Draw the two mirrored wedges (smaller), textured
void drawGoldSideWedges()
{
	const float s = 0.60f;  // scale
	const float t = 0.18f;  // thickness

	// Straighter wedges
	GLfloat A_L[3] = { -0.90f * s,  1.20f * s, 0.0f };   // top
	GLfloat B_L[3] = { -1.00f * s,  0.10f * s, 0.0f };   // outer
	GLfloat C_L[3] = { -0.20f * s, -1.00f * s, 0.0f };   // bottom

	GLfloat A_R[3] = { +0.90f * s,  1.20f * s, 0.0f };
	GLfloat B_R[3] = { +1.00f * s,  0.10f * s, 0.0f };
	GLfloat C_R[3] = { +0.20f * s, -1.00f * s, 0.0f };

	glPushMatrix();
	glTranslatef(-0.17f, -0.15f, 0.38f);
	glRotatef(-10.0f, 0, 0, 1);
	drawTriPrismTex(A_L, B_L, C_L, t, currentWedgeTex);
	glPopMatrix();

	glPushMatrix();
	glTranslatef(0.16f, -0.15f, 0.38f);
	glRotatef(10.0f, 0, 0, 1);
	drawTriPrismTex(A_R, B_R, C_R, t, currentWedgeTex);
	glPopMatrix();
}


static void drawBodyWithPattern()
{
	glPushMatrix();
	glTranslatef(0.0f, -0.65f, -0.15f);     // anchor body under neck

	glPushMatrix();
	glTranslatef(0.0f, 1.5f, 0.0f);
	glColor3fv(COL_WHITE);

	glPushMatrix();
	glTranslatef(0.0f, -0.22f, 0.0f);        // position in world
	glScalef(1.2f, 1.2f, 1.2f);            // overall size tweak
	glEnable(GL_LIGHTING); glEnable(GL_LIGHT0); // your usual lights
	drawKimonoTorso3D(
		1.25f,   // torsoTopW (wider shoulders)
		1.2f,  // torsoBotW
		1.7f,  // torsoH
		0.6f,  // torsoThick
		0.03f,  // clothThick
		0.02f   // lapelDepthOffset (avoid z-fight, controls overlap)
	);

	drawGoldSideWedges();
	glPopMatrix();
	drawBelt();          // sash + buckle
	drawPants(swingDeg);
	drawFrontSkirt();    // front split with hem chevron

	// Keep original outward pose (OPEN), only add forward/back lean when walking
	const float OPEN = 11.0f;   // your original side splay stays the same
	const float UPPER = 1.37f;
	const float FORE = 1.35f;

	float moving = (gWalkDir != 0.0f) ? 1.0f : 0.0f;  // 0 when stopped → arms snap back
	float ampDeg = 18.0f;                              // swing size; tweak if needed
	float phase = gWalkPhase;                          // advanced only while walking
	float leanR = moving * sinf(phase) * ampDeg;     // right arm forward/back
	float leanL = moving * -sinf(phase) * ampDeg;     // left arm opposite

	float armLeanL = leanL - gManualArmL;   // left hand key ‘U’
	float armLeanR = leanR - gManualArmR;   // right hand key ‘T’

	// Keep swingOutZ = OPEN (unchanged baseline), only modulate leanFwdX
	drawSleeveDown(true, OPEN, armLeanL, UPPER, 0.3f, 0.27f, FORE, true, gLElbowDeg);   // left arm
	float finalLeanR = gRLeanFwdX - gManualArmR;   // manual override from T/V
	drawSleeveDown(false, gRSwingOutZ, finalLeanR, UPPER, 0.3f, 0.27f, FORE, true,
		gRShoulderYaw, gRShoulderFwd, gRElbowDeg);



	drawRoundedBoots(swingDeg);  // boots closer to the ref

	glPopMatrix();
}


// ======================================================================================= Sword Parts ==================================================================================================
// =================== Geometry Helpers ===================
void Ring(float rOuter, float rInner, float y, float h, int seg = 36) {
	glBegin(GL_QUAD_STRIP);                // outer wall
	for (int i = 0; i <= seg; ++i) {
		float a = 2.0f * (float)M_PI * i / seg, x = cosf(a), z = sinf(a);
		glVertex3f(rOuter * x, y, rOuter * z);
		glVertex3f(rOuter * x, y + h, rOuter * z);
	}
	glEnd();
	glBegin(GL_QUAD_STRIP);                // inner wall
	for (int i = 0; i <= seg; ++i) {
		float a = 2.0f * (float)M_PI * i / seg, x = cosf(a), z = sinf(a);
		glVertex3f(rInner * x, y + h, rInner * z);
		glVertex3f(rInner * x, y, rInner * z);
	}
	glEnd();
	glBegin(GL_TRIANGLE_STRIP);            // top cap
	for (int i = 0; i <= seg; ++i) {
		float a = 2.0f * (float)M_PI * i / seg, x = cosf(a), z = sinf(a);
		glVertex3f(rInner * x, y + h, rInner * z);
		glVertex3f(rOuter * x, y + h, rOuter * z);
	}
	glEnd();
	glBegin(GL_TRIANGLE_STRIP);            // bottom cap
	for (int i = 0; i <= seg; ++i) {
		float a = 2.0f * (float)M_PI * i / seg, x = cosf(a), z = sinf(a);
		glVertex3f(rOuter * x, y, rOuter * z);
		glVertex3f(rInner * x, y, rInner * z);
	}
	glEnd();
}

void SpiralBandTapered(float rTop, float rBot,
	float yTop, float yBot,
	float turns, float bandWidth, float thickness,
	int seg = 220)
{
	float len = yTop - yBot;
	float dTheta = 2.0f * (float)M_PI * turns / seg;

	glBegin(GL_QUAD_STRIP);
	for (int i = 0; i <= seg; ++i) {
		float t = (float)i / seg;
		float y = yTop - t * len;
		float r = rTop + (rBot - rTop) * t;
		float th = dTheta * i;

		float nx = cosf(th), nz = sinf(th);
		float cx = r * nx, cz = r * nz;

		float tx = -r * sinf(th) * dTheta;
		float ty = -len / seg;
		float tz = r * cosf(th) * dTheta;
		float inv = 1.0f / sqrtf(tx * tx + ty * ty + tz * tz);
		tx *= inv; ty *= inv; tz *= inv;

		float nxx = nx, nyy = 0.0f, nzz = nz;

		float bx = ty * nzz - tz * nyy;
		float by = tz * nxx - tx * nzz;
		float bz = tx * nyy - ty * nxx;
		inv = 1.0f / sqrtf(bx * bx + by * by + bz * bz);
		bx *= inv; by *= inv; bz *= inv;

		float rIn = r + 0.0008f;
		float rOut = r + thickness;

		glVertex3f(rOut * nxx + (cx - r * nxx) + (bandWidth * 0.5f) * bx,
			y + (bandWidth * 0.5f) * by,
			rOut * nzz + (cz - r * nzz) + (bandWidth * 0.5f) * bz);

		glVertex3f(rIn * nxx + (cx - r * nxx) - (bandWidth * 0.5f) * bx,
			y - (bandWidth * 0.5f) * by,
			rIn * nzz + (cz - r * nzz) - (bandWidth * 0.5f) * bz);
	}
	glEnd();
}


void DrawBlade() {
	float baseWidth = 0.16f, thickness = 0.1f;
	float bladeLength = BladeLength(), tipLength = BASE_TIP_LEN;
	float vTip = 1.0f + tipLength / bladeLength;

	glBindTexture(GL_TEXTURE_2D, BladeTex());
	glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_MODULATE);
	glColor3f(1, 1, 1);

	// Front rectangle (+Z)
	glBegin(GL_QUADS);
	glNormal3f(0, 0, 1);
	glTexCoord2f(0, 0); glVertex3f(-baseWidth / 2, 0, thickness / 2);
	glTexCoord2f(1, 0); glVertex3f(baseWidth / 2, 0, thickness / 2);
	glTexCoord2f(1, 1); glVertex3f(baseWidth / 2, bladeLength, thickness / 2);
	glTexCoord2f(0, 1); glVertex3f(-baseWidth / 2, bladeLength, thickness / 2);
	glEnd();

	// Front tip (+Z)
	glBegin(GL_TRIANGLES);
	glNormal3f(0, 0, 1);
	glTexCoord2f(0, 1);   glVertex3f(-baseWidth / 2, bladeLength, thickness / 2);
	glTexCoord2f(1, 1);   glVertex3f(baseWidth / 2, bladeLength, thickness / 2);
	glTexCoord2f(0.5f, vTip); glVertex3f(0.0f, bladeLength + tipLength, thickness / 2);
	glEnd();

	// Back rectangle (−Z)
	glBegin(GL_QUADS);
	glNormal3f(0, 0, -1);
	glTexCoord2f(0, 0); glVertex3f(-baseWidth / 2, 0, -thickness / 2);
	glTexCoord2f(1, 0); glVertex3f(baseWidth / 2, 0, -thickness / 2);
	glTexCoord2f(1, 1); glVertex3f(baseWidth / 2, bladeLength, -thickness / 2);
	glTexCoord2f(0, 1); glVertex3f(-baseWidth / 2, bladeLength, -thickness / 2);
	glEnd();

	// Back tip (−Z)
	glBegin(GL_TRIANGLES);
	glNormal3f(0, 0, -1);
	glTexCoord2f(0, 1);   glVertex3f(-baseWidth / 2, bladeLength, -thickness / 2);
	glTexCoord2f(1, 1);   glVertex3f(baseWidth / 2, bladeLength, -thickness / 2);
	glTexCoord2f(0.5f, vTip); glVertex3f(0.0f, bladeLength + tipLength, -thickness / 2);
	glEnd();

	// Left side (−X)
	glBegin(GL_QUADS);
	glNormal3f(-1, 0, 0);
	glTexCoord2f(0, 0); glVertex3f(-baseWidth / 2, 0, -thickness / 2);
	glTexCoord2f(1, 0); glVertex3f(-baseWidth / 2, 0, thickness / 2);
	glTexCoord2f(1, 1); glVertex3f(-baseWidth / 2, bladeLength, thickness / 2);
	glTexCoord2f(0, 1); glVertex3f(-baseWidth / 2, bladeLength, -thickness / 2);
	glEnd();

	// Right side (+X)
	glBegin(GL_QUADS);
	glNormal3f(1, 0, 0);
	glTexCoord2f(0, 0); glVertex3f(baseWidth / 2, 0, -thickness / 2);
	glTexCoord2f(1, 0); glVertex3f(baseWidth / 2, 0, thickness / 2);
	glTexCoord2f(1, 1); glVertex3f(baseWidth / 2, bladeLength, thickness / 2);
	glTexCoord2f(0, 1); glVertex3f(baseWidth / 2, bladeLength, -thickness / 2);
	glEnd();
}

// Textured ring: u wraps around, v goes along height
void RingTex(float rOuter, float rInner, float y, float h, int seg = 36) {
	// outer wall
	glBegin(GL_QUAD_STRIP);
	for (int i = 0; i <= seg; ++i) {
		float a = 2.0f * (float)M_PI * i / seg, x = cosf(a), z = sinf(a);
		float u = (float)i / seg;
		glNormal3f(x, 0, z);
		glTexCoord2f(u, 0.0f); glVertex3f(rOuter * x, y, rOuter * z);
		glTexCoord2f(u, 1.0f); glVertex3f(rOuter * x, y + h, rOuter * z);
	}
	glEnd();

	// inner wall
	glBegin(GL_QUAD_STRIP);
	for (int i = 0; i <= seg; ++i) {
		float a = 2.0f * (float)M_PI * i / seg, x = cosf(a), z = sinf(a);
		float u = (float)i / seg;
		glNormal3f(-x, 0, -z);
		glTexCoord2f(u, 1.0f); glVertex3f(rInner * x, y + h, rInner * z);
		glTexCoord2f(u, 0.0f); glVertex3f(rInner * x, y, rInner * z);
	}
	glEnd();

	// top cap (simple radial mapping)
	glBegin(GL_TRIANGLE_STRIP);
	glNormal3f(0, 1, 0);
	for (int i = 0; i <= seg; ++i) {
		float a = 2.0f * (float)M_PI * i / seg, x = cosf(a), z = sinf(a);
		float u = 0.5f + 0.5f * x, v = 0.5f + 0.5f * z;
		glTexCoord2f(u, v); glVertex3f(rInner * x, y + h, rInner * z);
		glTexCoord2f(u, v); glVertex3f(rOuter * x, y + h, rOuter * z);
	}
	glEnd();

	// bottom cap
	glBegin(GL_TRIANGLE_STRIP);
	glNormal3f(0, -1, 0);
	for (int i = 0; i <= seg; ++i) {
		float a = 2.0f * (float)M_PI * i / seg, x = cosf(a), z = sinf(a);
		float u = 0.5f + 0.5f * x, v = 0.5f + 0.5f * z;
		glTexCoord2f(u, v); glVertex3f(rOuter * x, y, rOuter * z);
		glTexCoord2f(u, v); glVertex3f(rInner * x, y, rInner * z);
	}
	glEnd();
}

void SpiralBandTaperedTex(float rTop, float rBot,
	float yTop, float yBot, float turns,
	float bandWidth, float thickness, int seg /*=220*/) {
	float len = yTop - yBot;
	float dTheta = 2.0f * (float)M_PI * turns / (float)seg;

	glBegin(GL_QUAD_STRIP);
	for (int i = 0; i <= seg; ++i) {
		float t = (float)i / (float)seg;
		float y = yTop - t * len;
		float r = rTop + (rBot - rTop) * t;
		float th = dTheta * i;

		// radial direction at this angle
		float nx = cosf(th), nz = sinf(th);

		// center of the helix at this step
		float cx = r * nx, cz = r * nz;

		// tangent along the helix (normalized)
		float tx = -r * sinf(th) * dTheta;
		float ty = -len / (float)seg;
		float tz = r * cosf(th) * dTheta;
		float invT = 1.0f / sqrtf(tx * tx + ty * ty + tz * tz);
		tx *= invT; ty *= invT; tz *= invT;

		// reference outward normal (radial)
		float nxx = nx, nyy = 0.0f, nzz = nz;

		// binormal across the band (normalized): B = normalize(cross(T, Nref))
		float bx = ty * nzz - tz * nyy;
		float by = tz * nxx - tx * nzz;
		float bz = tx * nyy - ty * nxx;
		float invB = 1.0f / sqrtf(bx * bx + by * by + bz * bz);
		bx *= invB; by *= invB; bz *= invB;

		// final surface normal (same for both verts at this i):
		// N = normalize(cross(T, B))
		float sx = ty * bz - tz * by;
		float sy = tz * bx - tx * bz;
		float sz = tx * by - ty * bx;
		float invS = 1.0f / sqrtf(sx * sx + sy * sy + sz * sz);
		sx *= invS; sy *= invS; sz *= invS;

		// --- IMPORTANT: lift off the grip so the band clears bumps and avoids z-fighting ---
		const float clearance = 0.0035f;   // ~3.5 mm; > 5% bump (~2.7 mm) on your grip
		float rIn = r + clearance;
		float rOut = rIn + thickness;      // thickness grows outward from the cleared surface

		// progress along the helix (repeats every turn)
		float u = turns * t;

		// Outer/upper edge (v = 1)
		glNormal3f(sx, sy, sz);
		glTexCoord2f(u, 1.0f);
		glVertex3f(rOut * nxx + (cx - r * nxx) + (bandWidth * 0.5f) * bx,
			y + (bandWidth * 0.5f) * by,
			rOut * nzz + (cz - r * nzz) + (bandWidth * 0.5f) * bz);

		// Inner/lower edge (v = 0)
		glNormal3f(sx, sy, sz);
		glTexCoord2f(u, 0.0f);
		glVertex3f(rIn * nxx + (cx - r * nxx) - (bandWidth * 0.5f) * bx,
			y - (bandWidth * 0.5f) * by,
			rIn * nzz + (cz - r * nzz) - (bandWidth * 0.5f) * bz);
	}
	glEnd();
}

// Cylinder-like segment with UVs: u wraps around (0..1), v goes along length (v1..v2)
static void DrawDragonSegmentTex(float x1, float y1, float z1,
	float x2, float y2, float z2,
	float radius, float v1, float v2)
{
	const int angSeg = 16; // smoothness around
	glBegin(GL_QUAD_STRIP);
	for (int i = 0; i <= angSeg; ++i) {
		float a = 2.0f * (float)M_PI * i / angSeg;
		float nx = cosf(a), nz = sinf(a);        // radial direction
		float u = (float)i / angSeg;            // wrap once around

		// simple radial normals (good for a mostly vertical tube)
		glNormal3f(nx, 0.0f, nz);
		glTexCoord2f(u, v1); glVertex3f(x1 + nx * radius, y1, z1 + nz * radius);
		glNormal3f(nx, 0.0f, nz);
		glTexCoord2f(u, v2); glVertex3f(x2 + nx * radius, y2, z2 + nz * radius);
	}
	glEnd();
}

void DrawWrappedDragon() {
	glBindTexture(GL_TEXTURE_2D, texDragonRed);
	glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_MODULATE);
	glColor3f(1, 1, 1);

	float bladeLength = BladeLength();
	int   coils = 3;
	int   segments = 60;
	float dragonRadius = 0.04f;
	float wrapRadius = 0.12f;

	// Thin tube + wings should be visible from both sides
	GLboolean wasCull = glIsEnabled(GL_CULL_FACE);
	glDisable(GL_CULL_FACE);

	// ---- Dragon body (helical tube) ----
	for (int i = 0; i < segments - 1; ++i) {
		float t1 = (float)i / (segments - 1);
		float t2 = (float)(i + 1) / (segments - 1);

		float y1 = t1 * bladeLength, y2 = t2 * bladeLength;
		float a1 = t1 * coils * 2.0f * (float)M_PI;
		float a2 = t2 * coils * 2.0f * (float)M_PI;

		float r1 = wrapRadius * (1.0f - t1 * 0.3f);
		float r2 = wrapRadius * (1.0f - t2 * 0.3f);

		float x1 = cosf(a1) * r1, z1 = sinf(a1) * r1;
		float x2 = cosf(a2) * r2, z2 = sinf(a2) * r2;

		// slight pulsation of body radius
		float body1 = dragonRadius * (1.0f + 0.3f * sinf(t1 * 8.0f * (float)M_PI));
		float body2 = dragonRadius * (1.0f + 0.3f * sinf(t2 * 8.0f * (float)M_PI));
		float r = 0.5f * (body1 + body2);

		// v goes 0..1 along the dragon
		DrawDragonSegmentTex(x1, y1, z1, x2, y2, z2, r, t1, t2);
	}

	// ---- Wings (planar triangles, textured both sides) ----
	for (int i = 0; i < 6; ++i) {
		float t = 0.2f + i * 0.12f;
		float y = t * bladeLength;
		float ang = t * coils * 2.0f * (float)M_PI;
		float R = wrapRadius * (1.0f - t * 0.3f);
		float x = cosf(ang) * R, z = sinf(ang) * R;

		float wing = 0.06f;
		float p = ang + (float)M_PI * 0.5f;
		float nx = cosf(p), nz = sinf(p); // sideways from the helix

		// front-ish face normal for lighting (arbitrary but consistent)
		glBegin(GL_TRIANGLES);
		glNormal3f(0, 0, 1);
		glTexCoord2f(0.0f, 0.0f); glVertex3f(x, y, z);
		glTexCoord2f(1.0f, 0.0f); glVertex3f(x + nx * wing, y + wing * 0.3f, z + nz * wing);
		glTexCoord2f(0.5f, 1.0f); glVertex3f(x + nx * wing * 0.5f, y - wing * 0.2f, z + nz * wing * 0.5f);

		// mirrored triangle (other side)
		glNormal3f(0, 0, -1);
		glTexCoord2f(0.0f, 0.0f); glVertex3f(x, y, z);
		glTexCoord2f(1.0f, 0.0f); glVertex3f(x - nx * wing, y + wing * 0.3f, z - nz * wing);
		glTexCoord2f(0.5f, 1.0f); glVertex3f(x - nx * wing * 0.5f, y - wing * 0.2f, z - nz * wing * 0.5f);
		glEnd();
	}

	if (wasCull) glEnable(GL_CULL_FACE);
}

void DrawGuard() {
	// -------- sizes --------
	const float guardLength = 0.40f;
	const float guardThickness = 0.08f;
	const float guardHeight = 0.12f;
	const float diamondSize = 0.12f;

	// Curved “)(”
	const float curveLength = 0.20f;
	const float curveHeight = 0.08f;
	const float curveThickness = 0.05f;
	const float zEps = 0.002f;  // lift ornaments slightly off the face
	const float U_SCALE = 1.25f;   // texture repeat along the curve

	// ===== rectangular body (textured) =====
	glBindTexture(GL_TEXTURE_2D, JoinTex());
	glColor3f(1, 1, 1);

	// Front (+Z)
	glBegin(GL_QUADS);
	glNormal3f(0, 0, 1);
	glTexCoord2f(0, 0); glVertex3f(-guardLength / 2, 0, guardThickness / 2);
	glTexCoord2f(1, 0); glVertex3f(guardLength / 2, 0, guardThickness / 2);
	glTexCoord2f(1, 1); glVertex3f(guardLength / 2, -guardHeight, guardThickness / 2);
	glTexCoord2f(0, 1); glVertex3f(-guardLength / 2, -guardHeight, guardThickness / 2);
	glEnd();

	// Back (−Z)
	glBegin(GL_QUADS);
	glNormal3f(0, 0, -1);
	glTexCoord2f(0, 0); glVertex3f(-guardLength / 2, 0, -guardThickness / 2);
	glTexCoord2f(1, 0); glVertex3f(guardLength / 2, 0, -guardThickness / 2);
	glTexCoord2f(1, 1); glVertex3f(guardLength / 2, -guardHeight, -guardThickness / 2);
	glTexCoord2f(0, 1); glVertex3f(-guardLength / 2, -guardHeight, -guardThickness / 2);
	glEnd();

	// Top (+Y)
	glBegin(GL_QUADS);
	glNormal3f(0, 1, 0);
	glTexCoord2f(0, 0); glVertex3f(-guardLength / 2, 0, -guardThickness / 2);
	glTexCoord2f(1, 0); glVertex3f(guardLength / 2, 0, -guardThickness / 2);
	glTexCoord2f(1, 1); glVertex3f(guardLength / 2, 0, guardThickness / 2);
	glTexCoord2f(0, 1); glVertex3f(-guardLength / 2, 0, guardThickness / 2);
	glEnd();

	// Bottom (−Y)
	glBegin(GL_QUADS);
	glNormal3f(0, -1, 0);
	glTexCoord2f(0, 0); glVertex3f(-guardLength / 2, -guardHeight, -guardThickness / 2);
	glTexCoord2f(1, 0); glVertex3f(guardLength / 2, -guardHeight, -guardThickness / 2);
	glTexCoord2f(1, 1); glVertex3f(guardLength / 2, -guardHeight, guardThickness / 2);
	glTexCoord2f(0, 1); glVertex3f(-guardLength / 2, -guardHeight, guardThickness / 2);
	glEnd();

	// Diamond ends (simple planar mapping)
	// left front (+Z)
	glBegin(GL_TRIANGLES);
	glNormal3f(0, 0, 1);
	glTexCoord2f(0, 0);   glVertex3f(-guardLength / 2, 0, guardThickness / 2);
	glTexCoord2f(-1, 0.5); glVertex3f(-guardLength / 2 - diamondSize, -guardHeight / 2, guardThickness / 2);
	glTexCoord2f(0, 1);   glVertex3f(-guardLength / 2, -guardHeight, guardThickness / 2);
	glEnd();

	// left back (−Z)
	glBegin(GL_TRIANGLES);
	glNormal3f(0, 0, -1);
	glTexCoord2f(0, 0);   glVertex3f(-guardLength / 2, 0, -guardThickness / 2);
	glTexCoord2f(-1, 0.5); glVertex3f(-guardLength / 2 - diamondSize, -guardHeight / 2, -guardThickness / 2);
	glTexCoord2f(0, 1);   glVertex3f(-guardLength / 2, -guardHeight, -guardThickness / 2);
	glEnd();

	// right front (+Z)
	glBegin(GL_TRIANGLES);
	glNormal3f(0, 0, 1);
	glTexCoord2f(1, 0);    glVertex3f(guardLength / 2, 0, guardThickness / 2);
	glTexCoord2f(2, 0.5f); glVertex3f(guardLength / 2 + diamondSize, -guardHeight / 2, guardThickness / 2);
	glTexCoord2f(1, 1);    glVertex3f(guardLength / 2, -guardHeight, guardThickness / 2);
	glEnd();

	// right back (−Z)
	glBegin(GL_TRIANGLES);
	glNormal3f(0, 0, -1);
	glTexCoord2f(1, 0);    glVertex3f(guardLength / 2, 0, -guardThickness / 2);
	glTexCoord2f(2, 0.5f); glVertex3f(guardLength / 2 + diamondSize, -guardHeight / 2, -guardThickness / 2);
	glTexCoord2f(1, 1);    glVertex3f(guardLength / 2, -guardHeight, -guardThickness / 2);
	glEnd();

	// ===== “)(” ornaments (thin sheets → render double-sided) =====
	auto topCurveTextured = [&](float sideSign) {
		// Outer band (upper edge)
		glBegin(GL_QUAD_STRIP);
		for (int i = 0; i <= 8; ++i) {
			float t = (float)i / 8.0f;
			float ang = t * (float)M_PI * 0.5f;
			float x = sideSign * (guardLength / 4 + curveLength * 0.5f * t);
			float y = curveHeight * sinf(ang);
			float u = t * U_SCALE;

			// front (+Z) and back (−Z) vertices at same x,y (sheet)
			glNormal3f(0, 0, 1);
			glTexCoord2f(u, 0.0f); glVertex3f(x, y + curveThickness / 2, guardThickness / 2 + zEps);
			glNormal3f(0, 0, -1);
			glTexCoord2f(u, 1.0f); glVertex3f(x, y + curveThickness / 2, -guardThickness / 2 - zEps);
		}
		glEnd();

		// Inner band (lower edge)
		glBegin(GL_QUAD_STRIP);
		for (int i = 0; i <= 8; ++i) {
			float t = (float)i / 8.0f;
			float ang = t * (float)M_PI * 0.5f;
			float x = sideSign * (guardLength / 4 + curveLength * 0.5f * t);
			float y = curveHeight * sinf(ang);
			float u = t * U_SCALE;

			glNormal3f(0, 0, 1);
			glTexCoord2f(u, 0.0f); glVertex3f(x, y - curveThickness / 2, guardThickness / 2 + zEps);
			glNormal3f(0, 0, -1);
			glTexCoord2f(u, 1.0f); glVertex3f(x, y - curveThickness / 2, -guardThickness / 2 - zEps);
		}
		glEnd();

		// End caps (front/back quads so texture continuity looks OK)
		glBegin(GL_QUADS);
		for (int i = 0; i <= 7; ++i) {
			float t1 = (float)i / 8.0f, t2 = (float)(i + 1) / 8.0f;
			float a1 = t1 * (float)M_PI * 0.5f, a2 = t2 * (float)M_PI * 0.5f;
			float x1 = sideSign * (guardLength / 4 + curveLength * 0.5f * t1);
			float x2 = sideSign * (guardLength / 4 + curveLength * 0.5f * t2);
			float y1 = curveHeight * sinf(a1), y2 = curveHeight * sinf(a2);
			float u1 = t1 * U_SCALE, u2 = t2 * U_SCALE;

			// front cap (+Z)
			glNormal3f(0, 0, 1);
			glTexCoord2f(u1, 0.0f); glVertex3f(x1, y1 + curveThickness / 2, guardThickness / 2 + zEps);
			glTexCoord2f(u2, 0.0f); glVertex3f(x2, y2 + curveThickness / 2, guardThickness / 2 + zEps);
			glTexCoord2f(u2, 1.0f); glVertex3f(x2, y2 - curveThickness / 2, guardThickness / 2 + zEps);
			glTexCoord2f(u1, 1.0f); glVertex3f(x1, y1 - curveThickness / 2, guardThickness / 2 + zEps);

			// back cap (−Z)
			glNormal3f(0, 0, -1);
			glTexCoord2f(u1, 0.0f); glVertex3f(x1, y1 + curveThickness / 2, -guardThickness / 2 - zEps);
			glTexCoord2f(u2, 0.0f); glVertex3f(x2, y2 + curveThickness / 2, -guardThickness / 2 - zEps);
			glTexCoord2f(u2, 1.0f); glVertex3f(x2, y2 - curveThickness / 2, -guardThickness / 2 - zEps);
			glTexCoord2f(u1, 1.0f); glVertex3f(x1, y1 - curveThickness / 2, -guardThickness / 2 - zEps);
		}
		glEnd();
		};

	auto bottomCurveTextured = [&](float sideSign) {
		// lower outer edge
		glBegin(GL_QUAD_STRIP);
		for (int i = 0; i <= 8; ++i) {
			float t = (float)i / 8.0f;
			float ang = t * (float)M_PI * 0.5f;
			float x = sideSign * (guardLength / 4 + curveLength * 0.5f * t);
			float y = -guardHeight - curveHeight * sinf(ang);
			float u = t * U_SCALE;

			glNormal3f(0, 0, 1);
			glTexCoord2f(u, 0.0f); glVertex3f(x, y - curveThickness / 2, guardThickness / 2 + zEps);
			glNormal3f(0, 0, -1);
			glTexCoord2f(u, 1.0f); glVertex3f(x, y - curveThickness / 2, -guardThickness / 2 - zEps);
		}
		glEnd();

		// lower inner edge
		glBegin(GL_QUAD_STRIP);
		for (int i = 0; i <= 8; ++i) {
			float t = (float)i / 8.0f;
			float ang = t * (float)M_PI * 0.5f;
			float x = sideSign * (guardLength / 4 + curveLength * 0.5f * t);
			float y = -guardHeight - curveHeight * sinf(ang);
			float u = t * U_SCALE;

			glNormal3f(0, 0, 1);
			glTexCoord2f(u, 0.0f); glVertex3f(x, y + curveThickness / 2, guardThickness / 2 + zEps);
			glNormal3f(0, 0, -1);
			glTexCoord2f(u, 1.0f); glVertex3f(x, y + curveThickness / 2, -guardThickness / 2 - zEps);
		}
		glEnd();

		// end caps
		glBegin(GL_QUADS);
		for (int i = 0; i <= 7; ++i) {
			float t1 = (float)i / 8.0f, t2 = (float)(i + 1) / 8.0f;
			float a1 = t1 * (float)M_PI * 0.5f, a2 = t2 * (float)M_PI * 0.5f;
			float x1 = sideSign * (guardLength / 4 + curveLength * 0.5f * t1);
			float x2 = sideSign * (guardLength / 4 + curveLength * 0.5f * t2);
			float y1 = -guardHeight - curveHeight * sinf(a1);
			float y2 = -guardHeight - curveHeight * sinf(a2);
			float u1 = t1 * U_SCALE, u2 = t2 * U_SCALE;

			// front (+Z)
			glNormal3f(0, 0, 1);
			glTexCoord2f(u1, 0.0f); glVertex3f(x1, y1 - curveThickness / 2, guardThickness / 2 + zEps);
			glTexCoord2f(u2, 0.0f); glVertex3f(x2, y2 - curveThickness / 2, guardThickness / 2 + zEps);
			glTexCoord2f(u2, 1.0f); glVertex3f(x2, y2 + curveThickness / 2, guardThickness / 2 + zEps);
			glTexCoord2f(u1, 1.0f); glVertex3f(x1, y1 + curveThickness / 2, guardThickness / 2 + zEps);

			// back (−Z)
			glNormal3f(0, 0, -1);
			glTexCoord2f(u1, 0.0f); glVertex3f(x1, y1 - curveThickness / 2, -guardThickness / 2 - zEps);
			glTexCoord2f(u2, 0.0f); glVertex3f(x2, y2 - curveThickness / 2, -guardThickness / 2 - zEps);
			glTexCoord2f(u2, 1.0f); glVertex3f(x2, y2 + curveThickness / 2, -guardThickness / 2 - zEps);
			glTexCoord2f(u1, 1.0f); glVertex3f(x1, y1 + curveThickness / 2, -guardThickness / 2 - zEps);
		}
		glEnd();
		};

	// ---- draw the four curves; make them double-sided ----
	GLboolean wasCull = glIsEnabled(GL_CULL_FACE);
	glDisable(GL_CULL_FACE);

	topCurveTextured(-1.0f);    // top-left "("
	topCurveTextured(+1.0f);    // top-right ")"
	bottomCurveTextured(-1.0f); // bottom-left ")"
	bottomCurveTextured(+1.0f); // bottom-right "("

	if (wasCull) glEnable(GL_CULL_FACE);
}

void DrawHandleOrnate() {
	const int seg = 36;
	float gripTopR = 0.055f, gripBotR = 0.050f, gripLen = 0.50f;

	// ---- Textured grip (bumpy) ----
	glBindTexture(GL_TEXTURE_2D, HolderTex());
	glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_MODULATE);
	glColor3f(1, 1, 1);

	glBegin(GL_QUAD_STRIP);
	for (int i = 0; i <= seg; ++i) {
		float a = 2.0f * (float)M_PI * i / seg, x = cosf(a), z = sinf(a);
		float rTop = gripTopR * (1.0f + 0.05f * sinf(3 * a));
		float rBot = gripBotR * (1.0f + 0.05f * sinf(3 * a));
		float s = (float)i / seg;
		glNormal3f(x, 0, z);
		glTexCoord2f(s, 1.0f); glVertex3f(rTop * x, 0.0f, rTop * z);
		glNormal3f(x, 0, z);
		glTexCoord2f(s, 0.0f); glVertex3f(rBot * x, -gripLen, rBot * z);
	}
	glEnd();

	// ---- Metal parts (textured) ----
	glBindTexture(GL_TEXTURE_2D, texMetal);
	glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_MODULATE);

	// collars
	RingTex(gripTopR + 0.020f, gripTopR - 0.002f, 0.00f, 0.06f);
	RingTex(gripBotR + 0.018f, gripBotR - 0.002f, -gripLen - 0.04f, 0.035f);

	// ---- Spiral vine band (thin sheet → draw double-sided) ----
	float yTop = 0.058f, yBot = -gripLen;

	GLboolean wasCull = glIsEnabled(GL_CULL_FACE);                          // <<< added
	GLint wasTwoSide; glGetIntegerv(GL_LIGHT_MODEL_TWO_SIDE, &wasTwoSide);  // <<< added
	glDisable(GL_CULL_FACE);                                                // <<< added
	glLightModeli(GL_LIGHT_MODEL_TWO_SIDE, GL_TRUE);                        // <<< added

	SpiralBandTaperedTex(0.055f, 0.050f, yTop, yBot, 3.4f, 0.030f, 0.008f, 220);

	if (wasCull) glEnable(GL_CULL_FACE);                                    // <<< added
	if (!wasTwoSide) glLightModeli(GL_LIGHT_MODEL_TWO_SIDE, GL_FALSE);      // <<< added

	// ---- Pommel (simple cylindrical unwrap) ----
	float py = -gripLen - 0.04f, pr = 0.060f;
	int   wedges = 6;
	glBegin(GL_TRIANGLES);
	for (int i = 0; i < wedges; ++i) {
		float a0 = 2.0f * (float)M_PI * i / wedges;
		float a1 = 2.0f * (float)M_PI * (i + 1) / wedges;
		float x0 = pr * cosf(a0), z0 = pr * sinf(a0);
		float x1 = pr * cosf(a1), z1 = pr * sinf(a1);
		float u0 = (float)i / wedges, u1 = (float)(i + 1) / wedges;
		float nx = cosf((a0 + a1) * 0.5f), nz = sinf((a0 + a1) * 0.5f);
		glNormal3f(nx, 0, nz);
		glTexCoord2f(u0, 0.0f);               glVertex3f(x0, py, z0);
		glTexCoord2f(u1, 0.0f);               glVertex3f(x1, py, z1);
		glTexCoord2f(0.5f * (u0 + u1), 1.0f);     glVertex3f(0.0f, py - 0.18f, 0.0f);
	}
	glEnd();
}

// ---- Draw Sword (all parts) ----
void DrawSword() {

	glPushMatrix();
	glTranslatef(0, -0.5f, -0.2);
	DrawBlade();
	// DrawBladeDecoration(); // disabled so the blade texture is visible
	DrawWrappedDragon();
	DrawGuard();
	glTranslatef(0, -0.17f, 0);
	DrawHandleOrnate();
	glPopMatrix();
}
static void DrawSwordPlaced()
{
	const TRS& handPose = gRage ? SWORD_IN_HAND_UP : SWORD_IN_HAND_DOWN;
	TRS m = mixTRS(SWORD_AT_HIP, handPose, gSwordBlendT);

	glPushMatrix();
	glTranslatef(m.tx, m.ty, m.tz);
	glRotatef(m.rz, 0, 0, 1);
	glRotatef(m.ry, 0, 1, 0);
	glRotatef(m.rx, 1, 0, 0);

	glRotatef(-90.0f, 0, 0, 1);

	// compensate your inner translate in DrawSword(): (0, -0.5, -0.2)
	glTranslatef(-.5f, -0.4f, 0.0f);

	DrawSword();   // your original function
	glPopMatrix();
}


static inline void updateBladeScale(float dt)
{
	float delta = gBladeScaleTarget - gBladeScale;
	if (fabsf(delta) < 1e-5f) return;

	float step = BLADE_ANIM_SPEED * dt;
	if (fabsf(delta) <= step) {
		gBladeScale = gBladeScaleTarget;      // snap when close enough
	}
	else {
		gBladeScale += (delta > 0.0f ? step : -step);
	}
}

enum { LIGHT_CAMERA_DIR = 0, LIGHT_WORLD_SPOT = 1 };
int gLightMode = LIGHT_CAMERA_DIR;   // change at runtime if you like
// -----------------------------------
void display()
{
	//// -- hand turning while T is held --
	//if (gTDown) {
	//	auto stepTowardLimit = [&](float& a) {
	//		a += gTurnStep * gTDir;
	//		if (a > 90.0f) a = 90.0f;
	//		if (a < -90.0f) a = -90.0f;
	//		};
	//	stepTowardLimit(gHandYaw_L);
	//	stepTowardLimit(gHandYaw_R);
	//}
	// --- time step ---
	ULONGLONG now = GetTickCount64();
	double dt = (gLastTick == 0) ? (1.0 / 60.0) : (now - gLastTick) / 1000.0;
	gLastTick = now;

	// --- animate blade scale toward target ---
	updateBladeScale((float)dt);

	// moving
	if (gWalkDir != 0) {
		float speed = 1.0f;
		gCharZ += gWalkDir * speed * float(dt);

		gWalkPhase += 6.0f * float(dt);
		if (gWalkPhase > 2.0f * M_PI) gWalkPhase -= 2.0f * M_PI;
	}

	glEnable(GL_DEPTH_TEST);
	if (gRage) {
		glClearColor(0.02f, 0.02f, 0.03f, 1.0f);   // near-black
	}
	else {
		glClearColor(0.8f, 0.9f, 1.0f, 1.0f);      // light blue
	}
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
	static ULONGLONG prev = 0;
	ULONGLONG nowTick = GetTickCount64();
	float dtSec = (prev == 0) ? 0.0f : 0.001f * float(nowTick - prev);
	prev = nowTick;

	float k = powf(1.0f - 0.84f, dtSec * 60.0f);


	KF::Update();

	updatePoseAnim();
	updateBodyYaw();
	updateSwordMoveRot();  // <— add this
	updateRightArmAnim();
	updateRShoulderYaw(dt);
	updateRElbow(dtSec);
	updateManualLegs(dtSec);


	// --------- Lighting: common ---------
	glEnable(GL_LIGHTING);
	glEnable(GL_NORMALIZE);
	glEnable(GL_COLOR_MATERIAL);
	glColorMaterial(GL_FRONT_AND_BACK, GL_AMBIENT_AND_DIFFUSE);
	glShadeModel(GL_SMOOTH);

	// soft global ambient (scaled by lightGain)
	const GLfloat sceneAmb[] = {
		0.24f * lightGain, 0.24f * lightGain, 0.24f * lightGain, 1.0f
	};
	glLightModelfv(GL_LIGHT_MODEL_AMBIENT, sceneAmb);
	glLightModeli(GL_LIGHT_MODEL_LOCAL_VIEWER, GL_TRUE);

	// reset lights
	glDisable(GL_LIGHT0);
	glDisable(GL_LIGHT1);

	// --------- KEY light (camera-locked directional) = LIGHT0 ---------
	// place in EYE space so it follows the camera view
	glMatrixMode(GL_MODELVIEW);
	glPushMatrix();
	glLoadIdentity();

	const GLfloat L0pos[] = { 0.0f, 0.0f, 1.0f, 0.0f }; // w=0 → directional
	const GLfloat L0diff[] = { 1.0f, 1.0f, 1.0f, 1.0f };
	const GLfloat L0spec[] = { 1.0f, 1.0f, 1.0f, 1.0f };
	const GLfloat L0amb[] = { 0.0f, 0.0f, 0.0f, 1.0f }; // rely on sceneAmb

	glLightfv(GL_LIGHT0, GL_POSITION, L0pos);
	glLightfv(GL_LIGHT0, GL_DIFFUSE, L0diff);
	glLightfv(GL_LIGHT0, GL_SPECULAR, L0spec);
	glLightfv(GL_LIGHT0, GL_AMBIENT, L0amb);
	glEnable(GL_LIGHT0);

	glPopMatrix();

	// soften specular so we don’t get tiny hot dots
	glMaterialf(GL_FRONT_AND_BACK, GL_SHININESS, 24.0f);

	// --------- PROJECTION ---------
	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();
	const double aspect = (gWinH > 0) ? (double)gWinW / (double)gWinH : (800.0 / 600.0);
	if (usePerspective) {
		gluPerspective(50.0, aspect, 0.1, 100.0);
	}
	else {
		double halfW = orthoSize * aspect, halfH = orthoSize;
		glOrtho(-halfW, halfW, -halfH, halfH, -20.0, 100.0);
	}

	// --------- VIEW (camera) ---------
	glMatrixMode(GL_MODELVIEW);
	glLoadIdentity();
	gluLookAt(0, 2, camDist, 0, 2, 0, 0, 1, 0);

	// --------- Optional SPOTLIGHT (world space) = LIGHT1 ---------
	if (useSpotlight) {
		// place AFTER the view so it's in world space
		//const GLfloat pos[] = { 0.0f, 3.8f, 2.5f, 1.0f }; // positional light
		//GLfloat dir[3] = { 0.0f - pos[0], 2.2f - pos[1], 0.8f - pos[2] };
		// place AFTER the view so it's in world space
		const GLfloat pos[] = { 0.0f, 5.2f, 1.6f, 1.0f };  // higher Y => above
		const GLfloat target[] = { 0.0f, 2.2f, 0.8f };     // face center
		GLfloat dir[3] = { target[0] - pos[0],
						   target[1] - pos[1],
						   target[2] - pos[2] };
		glLightfv(GL_LIGHT1, GL_POSITION, pos);
		glLightfv(GL_LIGHT1, GL_SPOT_DIRECTION, dir);

		// a bit brighter so the effect reads over the key
		const GLfloat diff[] = { 1.2f, 1.2f, 1.2f, 1.0f };
		const GLfloat spec[] = { 1.0f, 1.0f, 1.0f, 1.0f };
		const GLfloat amb[] = { 0.0f, 0.0f, 0.0f, 1.0f };

		glLightfv(GL_LIGHT1, GL_POSITION, pos);
		glLightfv(GL_LIGHT1, GL_SPOT_DIRECTION, dir);
		glLightf(GL_LIGHT1, GL_SPOT_CUTOFF, spotCutoff);    // [ / ]
		glLightf(GL_LIGHT1, GL_SPOT_EXPONENT, spotExponent);  // , / .
		glLightf(GL_LIGHT1, GL_CONSTANT_ATTENUATION, 0.85f);
		glLightf(GL_LIGHT1, GL_LINEAR_ATTENUATION, 0.06f);
		glLightf(GL_LIGHT1, GL_QUADRATIC_ATTENUATION, 0.02f);

		glLightfv(GL_LIGHT1, GL_DIFFUSE, diff);
		glLightfv(GL_LIGHT1, GL_SPECULAR, spec);
		glLightfv(GL_LIGHT1, GL_AMBIENT, amb);
		glEnable(GL_LIGHT1);
	}
	if (gRage) {
		// width, height, edge thickness – tweak to taste
		drawFireAuraBehind(0.0f, 1.90f, -0.7f, 2.0f, 4.6f, 0.70f);
	}
	// --------- Scene root ---------
	glPushMatrix();
	glTranslatef(0.0f, 3.0f, 0.0f);
	glRotatef(angle, 0.0f, 1.0f, 0.0f);
	glRotatef(y_angle, 1.0f, 0.0f, 0.0f);
	glRotatef(gBodyYaw, 0.0f, 1.0f, 0.0f);
	glTranslatef(gCharX, 0.0f, gCharZ);
	drawHead();
	drawNeck();
	swingDeg = sinf(gWalkPhase) * 5.0f;
	drawBodyWithPattern();
	glPopMatrix(); // end scene root

	// blink animation
	if (blinking) {
		eyeOpen -= blinkSpeed;
		if (eyeOpen <= 0.0f) { eyeOpen = 0.0f; blinking = false; }
	}
	else {
		if (eyeOpen < 1.0f) {
			eyeOpen += blinkSpeed * 0.5f;
			if (eyeOpen > 1.0f) eyeOpen = 1.0f;
		}
	}
}



int WINAPI WinMain(HINSTANCE hInst, HINSTANCE, LPSTR, int nCmdShow)
{
	WNDCLASSEX wc;
	ZeroMemory(&wc, sizeof(WNDCLASSEX));

	wc.cbSize = sizeof(WNDCLASSEX);
	wc.hInstance = GetModuleHandle(NULL);
	wc.lpfnWndProc = WindowProcedure;
	wc.lpszClassName = WINDOW_TITLE;
	wc.style = CS_HREDRAW | CS_VREDRAW;

	if (!RegisterClassEx(&wc)) return false;

	HWND hWnd = CreateWindow(WINDOW_TITLE, WINDOW_TITLE, WS_OVERLAPPEDWINDOW,
		CW_USEDEFAULT, CW_USEDEFAULT, 800, 600,
		NULL, NULL, wc.hInstance, NULL);

	//--------------------------------
	//	Initialize window for OpenGL
	//--------------------------------

	HDC hdc = GetDC(hWnd);

	//	initialize pixel format for the window
	initPixelFormat(hdc);

	//	get an openGL context
	HGLRC hglrc = wglCreateContext(hdc);

	//	make context current
	if (!wglMakeCurrent(hdc, hglrc)) return false;
	glEnable(GL_NORMALIZE);   // important if we scale parts; keeps lighting correct

	// Load sword textures
	texSteel = loadTexture("steel.bmp");
	texGold = loadTexture("gold.bmp");
	texHolderBrown = loadTexture("holderbrown.bmp");
	texHolderBlack = loadTexture("holderblack.bmp");
	texDarkGrey = loadTexture("darkergrey.bmp");
	texDarkGold = loadTexture("darkergold.bmp");
	texMetal = loadTexture("metal.bmp");
	texDragonRed = loadTexture("dragonred.bmp");
	texBiegeCloth = loadTexture("biegeCloth.bmp");
	texDarkCloth = loadTexture("darkCloth.bmp");
	texBelt = loadTexture("belt.bmp");
	texBelt2 = loadTexture("belt2.bmp");
	texDGrey = loadTexture("darkgrey.bmp");
	texGoldStrip = loadTexture("goldd.bmp");
	currentBeltTex = texBelt;          // you already have this
	currentSkirtSideTex = texBiegeCloth;    // ORI default
	currentSkirtMidTex = texBiegeCloth;    // ORI default

	texDragonCloth = loadTexture("dragonCloth.bmp");
	texDragonClothBlank = loadTexture("dragonblank.bmp");
	texBlackCloth = loadTexture("blackCloth.bmp");

	// Example (optional)
	texHemOri = loadTexture("hem_ori.bmp");   // <- name these as you like
	texHemAlt = loadTexture("hem_alt.bmp");

	currentHemTex = texHemOri;  // start with original hem

	texDarkPants = loadTexture("brightPants.bmp");
	textAPants = loadTexture("darkred.bmp");
	currentPantsTex = texDarkPants;   // ORI at start

	currentUpperSleeveTex = texBiegeCloth;

	texPlainBlack = loadTexture("plainBlack.bmp");
	texBrighterBeige = loadTexture("brightBeige.bmp");
	currentLapelTex = texBrighterBeige; // start with beige

	currentCollarTex = texDarkCloth;
	currentInnerShirtTex = texDarkCloth;
	currentGoldStripTex = texHemOri;  // default = hem_ori
	//--------------------------------
	//	End initialization
	//--------------------------------

	ShowWindow(hWnd, nCmdShow);

	MSG msg;
	ZeroMemory(&msg, sizeof(msg));

	while (true)
	{
		if (PeekMessage(&msg, NULL, 0, 0, PM_REMOVE))
		{
			if (msg.message == WM_QUIT) break;

			TranslateMessage(&msg);
			DispatchMessage(&msg);
		}

		// ---- per-frame work ----
		frameCount++;
		if (autoBlink && !blinking && eyeOpen >= 1.0f &&
			(frameCount % blinkIntervalFrames) == 0)
		{
			blinking = true;  // start a blink this frame
		}


		display();
		SwapBuffers(hdc);
	}

	UnregisterClass(WINDOW_TITLE, wc.hInstance);

	return true;
}
//--------------------------------------------------------------------
