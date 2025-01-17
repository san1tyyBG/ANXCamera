package com.android.camera.ui;

import android.annotation.TargetApi;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.os.Message;
import android.os.SystemClock;
import android.provider.MiuiSettings.ScreenEffect;
import android.support.annotation.StringRes;
import android.util.AttributeSet;
import android.util.Range;
import android.util.Rational;
import android.view.GestureDetector;
import android.view.GestureDetector.SimpleOnGestureListener;
import android.view.MotionEvent;
import android.view.View;
import android.view.animation.Interpolator;
import com.android.camera.Camera;
import com.android.camera.CameraSettings;
import com.android.camera.R;
import com.android.camera.Util;
import com.android.camera.data.DataRepository;
import com.android.camera.log.Log;
import com.android.camera.module.loader.camera2.Camera2DataContainer;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.BottomPopupTips;
import com.android.camera.protocol.ModeProtocol.CameraAction;
import com.android.camera.protocol.ModeProtocol.EvChangedProtocol;
import com.android.camera.protocol.ModeProtocol.MainContentProtocol;
import com.android.camera.statistic.CameraStatUtil;
import com.android.camera.ui.drawable.focus.CameraFocusAnimateDrawable;
import com.android.camera.ui.drawable.focus.CameraIndicatorState;
import com.mi.config.b;
import com.mi.config.d;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import miui.view.animation.CubicEaseOutInterpolator;

@TargetApi(21)
public class FocusView extends View implements FocusIndicator, Rotatable, V6FunctionUI {
    public static final int CENTER_CAPTURE = 2;
    public static final int CENTER_CIRCLE = 1;
    public static final int CENTER_LOCK = 5;
    public static final int CENTER_MOON = 4;
    public static final int CENTER_NONE = 0;
    public static final int CENTER_SUN = 3;
    public static final int CURSOR_GATHER = 1;
    public static final int CURSOR_NORMAL = 0;
    public static final int CURSOR_SLIDE_BACK = 2;
    private static final int DISAPPEAR_TIME = 1500;
    private static final int END_DISAPPEAR_TIMEOUT = 800;
    private static final float GAP_NUM = d.getFloat(d.wc, 0.0f).floatValue();
    public static final int MAX_SLIDE_DISTANCE = Util.dpToPixel(110.3f);
    private static final int MSG_ANIMATE_EV_CENTER = 7;
    private static final int MSG_FINISH_DISAPPEAR = 5;
    private static final int MSG_RESET_CENTER = 6;
    private static final int MSG_START_DISAPPEAR = 4;
    public static final int NORMAL_CAPTURE = 0;
    public static final int NORMAL_EV = 1;
    public static final int SET_BY_AUTO_DISAPPEAR = 6;
    public static final int SET_BY_AUTO_FOCUS_MOVING = 3;
    public static final int SET_BY_CANCEL_PREVIOUS_FOCUS = 2;
    public static final int SET_BY_CLEAR_VIEW = 7;
    public static final int SET_BY_DEVICE_KEEP_MOVING = 4;
    public static final int SET_BY_INITIALIZE = 8;
    public static final int SET_BY_RESET_CENTER = 5;
    public static final int SET_BY_RESET_TO_FACE_AREA = 9;
    public static final int SET_BY_TOUCH_DOWN = 1;
    private static final int START_DISAPPEAR_TIMEOUT = 5000;
    private static final int STATE_CHANGE_TIME = 500;
    private static final int STATE_FAIL = 3;
    private static final int STATE_IDLE = 0;
    private static final int STATE_START = 1;
    private static final int STATE_SUCCESS = 2;
    /* access modifiers changed from: private */
    public static final String TAG = FocusView.class.getSimpleName();
    /* access modifiers changed from: private */
    public static final int TRIANGLE_BASE_DIS = Util.dpToPixel(3.0f);
    public static final int ZERO_MINUS = 3;
    public static final int ZERO_PLUS = 4;
    /* access modifiers changed from: private */
    public Camera mActivity;
    /* access modifiers changed from: private */
    public RollAdapter mAdapter;
    private long mAdjustedDoneTime;
    /* access modifiers changed from: private */
    public boolean mBeingEvAdjusted;
    private int mBottomRelative;
    /* access modifiers changed from: private */
    public CameraFocusAnimateDrawable mCameraFocusAnimateDrawable;
    private Bitmap mCaptureBitmap;
    private int mCenterFlag = 0;
    private int mCenterX;
    private int mCenterY;
    /* access modifiers changed from: private */
    public int mCurrentDistanceY;
    /* access modifiers changed from: private */
    public int mCurrentItem;
    private int mCurrentMinusCircleCenter;
    private float mCurrentMinusCircleRadius;
    /* access modifiers changed from: private */
    public int mCurrentMode;
    private int mCurrentRadius;
    private int mCurrentRayBottom;
    private int mCurrentRayHeight;
    private int mCurrentRayWidth;
    /* access modifiers changed from: private */
    public int mCurrentViewState = 0;
    /* access modifiers changed from: private */
    public int mCursorState = 0;
    /* access modifiers changed from: private */
    public Rect mDisplayRect;
    /* access modifiers changed from: private */
    public float mEVAnimationRatio;
    /* access modifiers changed from: private */
    public long mEVAnimationStartTime;
    private float mEVCaptureRatio = -1.0f;
    /* access modifiers changed from: private */
    public float mEvValue;
    /* access modifiers changed from: private */
    public ExposureViewListener mExposureViewListener;
    private long mFailTime;
    private GestureDetector mGestureDetector;
    private Handler mHandler = new Handler() {
        public void handleMessage(Message message) {
            String access$000 = FocusView.TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("msg=");
            sb.append(message.what);
            sb.append(" ");
            sb.append(FocusView.this.mAdapter != null);
            Log.d(access$000, sb.toString());
            if (FocusView.this.mAdapter != null) {
                switch (message.what) {
                    case 4:
                    case 5:
                        if (FocusView.this.mIsDraw && FocusView.this.mIsDown) {
                            FocusView.this.clearMessages();
                            sendEmptyMessageDelayed(5, 50);
                            break;
                        } else {
                            FocusView.this.reset(6);
                            break;
                        }
                        break;
                    case 6:
                        FocusView.this.resetCenter();
                        break;
                    case 7:
                        long uptimeMillis = SystemClock.uptimeMillis() - FocusView.this.mEVAnimationStartTime;
                        if (uptimeMillis < 520) {
                            FocusView.this.mEVAnimationRatio = ((float) uptimeMillis) / 500.0f;
                            FocusView.this.calculateAttribute();
                            FocusView.this.invalidate();
                            sendEmptyMessageDelayed(7, 20);
                            break;
                        } else {
                            FocusView.this.mCurrentViewState = 1;
                            FocusView.this.mCursorState = 0;
                            return;
                        }
                }
            }
        }
    };
    private int mHeight;
    private CameraIndicatorState mIndicatorState;
    private Interpolator mInterpolator;
    /* access modifiers changed from: private */
    public boolean mIsDown;
    /* access modifiers changed from: private */
    public volatile boolean mIsDraw;
    /* access modifiers changed from: private */
    public boolean mIsEvAdjustable;
    private boolean mIsTouchFocus;
    /* access modifiers changed from: private */
    public int mLastItem;
    private Bitmap mLockBodyBitmap;
    private Bitmap mLockHeadBitmap;
    /* access modifiers changed from: private */
    public int mRotation;
    /* access modifiers changed from: private */
    public int mScrollDistanceY;
    private SimpleOnGestureListener mSimpleOnGestureListener = new SimpleOnGestureListener() {
        public boolean onDown(MotionEvent motionEvent) {
            boolean z = false;
            if (!FocusView.this.mIsDraw) {
                return false;
            }
            int access$1200 = FocusView.this.mCurrentMode;
            if ((access$1200 == 163 || access$1200 == 165 || access$1200 == 167 || access$1200 == 171 || access$1200 == 173 || access$1200 == 175 || access$1200 == 177) && FocusView.this.mExposureViewListener != null && FocusView.this.mExposureViewListener.isSupportFocusShoot() && !FocusView.this.mExposureViewListener.isShowAeAfLockIndicator()) {
                z = true;
            }
            if (FocusView.this.mCurrentViewState != 0 || !z || !FocusView.this.isInCircle(motionEvent.getX() - ((float) FocusView.this.mDisplayRect.left), motionEvent.getY() - ((float) FocusView.this.mDisplayRect.top), ((float) CameraFocusAnimateDrawable.BIG_RADIUS) * 0.5f)) {
                FocusView.this.mIsDown = true;
                FocusView.this.removeMessages();
                FocusView.this.setTouchDown();
            } else if (FocusView.this.mAdapter != null) {
                ((MainContentProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(166)).removeTiltShiftMask();
                CameraAction cameraAction = (CameraAction) ModeCoordinatorImpl.getInstance().getAttachProtocol(161);
                if (cameraAction != null && !cameraAction.isDoingAction()) {
                    cameraAction.onShutterButtonClick(90);
                }
            }
            return true;
        }

        public boolean onScroll(MotionEvent motionEvent, MotionEvent motionEvent2, float f, float f2) {
            if (!FocusView.this.mIsDown || motionEvent2 == null || !FocusView.this.mIsEvAdjustable) {
                return false;
            }
            int gestureOrientation = V6GestureRecognizer.getInstance(FocusView.this.mActivity).getGestureOrientation();
            if ((gestureOrientation != 200 || (FocusView.this.mRotation / 90) % 2 != 0) && (gestureOrientation != 100 || (FocusView.this.mRotation / 90) % 2 == 0)) {
                return false;
            }
            int access$2100 = FocusView.this.mScrollDistanceY;
            int access$2000 = FocusView.this.mRotation;
            if (access$2000 == 0) {
                access$2100 = (int) (((float) access$2100) - f2);
            } else if (access$2000 == 90) {
                access$2100 = (int) (((float) access$2100) + f);
            } else if (access$2000 == 180) {
                access$2100 = (int) (((float) access$2100) + f2);
            } else if (access$2000 == 270) {
                access$2100 = (int) (((float) access$2100) - f);
            }
            int i = (int) (((float) access$2100) / ((((float) Util.sWindowHeight) / 2.0f) / (((float) FocusView.MAX_SLIDE_DISTANCE) / 4.0f)));
            FocusView.this.mCurrentDistanceY = Util.clamp(i, ((-FocusView.MAX_SLIDE_DISTANCE) / 2) - FocusView.TRIANGLE_BASE_DIS, FocusView.MAX_SLIDE_DISTANCE / 2);
            if (i == FocusView.this.mCurrentDistanceY) {
                FocusView.this.mScrollDistanceY = access$2100;
            }
            FocusView.this.mBeingEvAdjusted = true;
            int access$2500 = FocusView.this.getItemByCoordinate();
            if (access$2500 != FocusView.this.mCurrentItem) {
                if (FocusView.this.mCurrentViewState != 3 && access$2500 < FocusView.this.mCurrentItem && FocusView.this.mCurrentItem >= FocusView.this.mAdapter.getCenterIndex() && access$2500 < FocusView.this.mAdapter.getCenterIndex()) {
                    FocusView.this.startAnimation();
                    FocusView.this.mLastItem = FocusView.this.mCurrentItem;
                    FocusView.this.mCurrentViewState = 3;
                } else if (FocusView.this.mCurrentViewState != 4 && access$2500 > FocusView.this.mCurrentItem && FocusView.this.mCurrentItem < FocusView.this.mAdapter.getCenterIndex() && access$2500 >= FocusView.this.mAdapter.getCenterIndex()) {
                    FocusView.this.startAnimation();
                    FocusView.this.mLastItem = FocusView.this.mCurrentItem;
                    FocusView.this.mCurrentViewState = 4;
                }
                FocusView.this.setCurrentItem(access$2500, false);
            }
            FocusView.this.mCameraFocusAnimateDrawable.setEvChanged((float) FocusView.this.mCurrentDistanceY, FocusView.this.mEvValue);
            if (FocusView.this.mCurrentViewState == 0 || FocusView.this.mCurrentViewState == 1) {
                FocusView.this.mCurrentViewState = 1;
                FocusView.this.calculateAttribute();
                FocusView.this.invalidate();
            }
            return true;
        }
    };
    private long mStartTime;
    private int mState;
    private long mSuccessTime;
    private int mWidth;

    @Retention(RetentionPolicy.SOURCE)
    public @interface CenterFlag {
    }

    @Retention(RetentionPolicy.SOURCE)
    public @interface CursorState {
    }

    public interface ExposureViewListener {
        boolean isMeteringAreaOnly();

        boolean isNeedHapticFeedback();

        boolean isShowAeAfLockIndicator();

        boolean isShowCaptureButton();

        boolean isSupportAELockOnly();

        boolean isSupportFocusShoot();
    }

    @Retention(RetentionPolicy.SOURCE)
    public @interface SetPositionType {
    }

    @Retention(RetentionPolicy.SOURCE)
    public @interface ViewState {
    }

    public FocusView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.mActivity = (Camera) context;
        this.mInterpolator = new CubicEaseOutInterpolator();
        this.mGestureDetector = new GestureDetector(context, this.mSimpleOnGestureListener);
        this.mGestureDetector.setIsLongpressEnabled(false);
        this.mCaptureBitmap = BitmapFactory.decodeResource(getResources(), R.drawable.bg_capture);
        this.mIndicatorState = new CameraIndicatorState();
        this.mCameraFocusAnimateDrawable = new CameraFocusAnimateDrawable(getContext());
        this.mCameraFocusAnimateDrawable.setIndicatorData(this.mIndicatorState, this.mCaptureBitmap);
        this.mLockHeadBitmap = BitmapFactory.decodeResource(getResources(), R.drawable.icon_aeaf_lock_head);
        this.mLockBodyBitmap = BitmapFactory.decodeResource(getResources(), R.drawable.icon_aeaf_lock_body);
        this.mCameraFocusAnimateDrawable.setLockIndicatorData(this.mIndicatorState, this.mLockHeadBitmap, this.mLockBodyBitmap);
        this.mCameraFocusAnimateDrawable.setCallback(this);
    }

    /* access modifiers changed from: private */
    public void calculateAttribute() {
        float itemRatio = getItemRatio(this.mCurrentItem);
        float itemRatio2 = getItemRatio(this.mLastItem);
        int i = 1;
        switch (this.mCurrentViewState) {
            case 0:
                if (this.mIsTouchFocus && this.mExposureViewListener != null && this.mExposureViewListener.isShowCaptureButton() && this.mExposureViewListener.isSupportFocusShoot()) {
                    i = 2;
                }
                this.mCenterFlag = i;
                break;
            case 1:
                if (this.mCurrentItem >= this.mAdapter.getCenterIndex()) {
                    this.mCurrentRayWidth = Util.dpToPixel(1.5f);
                    float f = 5.0f + (2.0f * itemRatio);
                    this.mCurrentRayHeight = Util.dpToPixel(f);
                    this.mCurrentRayBottom = Util.dpToPixel(7.5f + (3.0f * itemRatio));
                    this.mCurrentRadius = Util.dpToPixel(f);
                    this.mCenterFlag = 3;
                    break;
                } else {
                    this.mCurrentRadius = Util.dpToPixel(6.0f + (2.0f * itemRatio));
                    this.mCurrentMinusCircleCenter = (int) (((float) this.mCurrentRadius) * 0.5f);
                    this.mCurrentMinusCircleRadius = ((float) this.mCurrentRadius) * 0.8f;
                    this.mCenterFlag = 4;
                    break;
                }
            case 3:
                if (this.mEVAnimationRatio > 0.5f) {
                    float f2 = (this.mEVAnimationRatio - 0.5f) * 2.0f;
                    this.mCurrentRadius = Util.dpToPixel(8.0f - (2.0f * ((1.0f - itemRatio) * f2)));
                    float f3 = 1.0f - f2;
                    this.mCurrentMinusCircleCenter = (int) (((float) this.mCurrentRadius) * (0.5f + (0.914f * f3)));
                    this.mCurrentMinusCircleRadius = ((float) this.mCurrentRadius) * (0.8f + (0.2f * f3));
                    this.mCenterFlag = 4;
                    break;
                } else {
                    float f4 = this.mEVAnimationRatio * 2.0f;
                    this.mCurrentRayWidth = Util.dpToPixel(1.5f);
                    float f5 = 1.0f - f4;
                    float f6 = (itemRatio2 * f5) - f4;
                    this.mCurrentRayHeight = Util.dpToPixel((2.0f * f6) + 5.0f);
                    this.mCurrentRayBottom = Util.dpToPixel(7.5f + (f6 * 3.0f));
                    this.mCurrentRadius = Util.dpToPixel(5.0f + (3.0f * f4) + (2.0f * itemRatio2 * f5));
                    this.mCenterFlag = 3;
                    break;
                }
            case 4:
                if (this.mEVAnimationRatio >= 0.5f) {
                    float f7 = (this.mEVAnimationRatio - 0.5f) * 2.0f;
                    this.mCurrentRayWidth = Util.dpToPixel(1.5f);
                    float f8 = 1.0f - f7;
                    float f9 = (itemRatio * f7) - f8;
                    this.mCurrentRayHeight = Util.dpToPixel((2.0f * f9) + 5.0f);
                    this.mCurrentRayBottom = Util.dpToPixel(7.5f + (f9 * 3.0f));
                    this.mCurrentRadius = Util.dpToPixel(5.0f + (3.0f * f8) + (2.0f * itemRatio * f7));
                    this.mCenterFlag = 3;
                    break;
                } else {
                    float f10 = this.mEVAnimationRatio * 2.0f;
                    this.mCurrentRadius = Util.dpToPixel(6.0f + (2.0f * (itemRatio2 + ((1.0f - itemRatio2) * f10))));
                    this.mCurrentMinusCircleCenter = (int) (((float) this.mCurrentRadius) * (0.5f + (0.914f * f10)));
                    this.mCurrentMinusCircleRadius = ((float) this.mCurrentRadius) * (0.8f + (0.2f * f10));
                    this.mCenterFlag = 4;
                    break;
                }
            default:
                this.mCenterFlag = 1;
                break;
        }
        this.mCameraFocusAnimateDrawable.cancelResetCenter();
        this.mIndicatorState.mCenterFlag = this.mCenterFlag;
        this.mIndicatorState.mCurrentRadius = this.mCurrentRadius;
        this.mIndicatorState.mCurrentAngle = (float) getCurrentAngle();
        this.mIndicatorState.mCurrentRayWidth = this.mCurrentRayWidth;
        this.mIndicatorState.mCurrentRayHeight = this.mCurrentRayHeight;
        this.mIndicatorState.mCurrentRayBottom = this.mCurrentRayBottom;
        this.mIndicatorState.mCurrentMinusCircleCenter = this.mCurrentMinusCircleCenter;
        this.mIndicatorState.mCurrentMinusCircleRadius = this.mCurrentMinusCircleRadius;
    }

    /* access modifiers changed from: private */
    public void clearMessages() {
        this.mHandler.removeMessages(4);
        this.mHandler.removeMessages(5);
        this.mHandler.removeMessages(6);
        this.mHandler.removeMessages(7);
    }

    private int getCurrentAngle() {
        if (this.mCursorState == 2 && this.mCurrentViewState != 3 && this.mCurrentViewState != 4) {
            return 360 - Util.clamp(this.mCurrentItem >= this.mAdapter.getCenterIndex() ? ((this.mCurrentItem - this.mAdapter.getCenterIndex()) * ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT) / this.mAdapter.getCenterIndex() : 0, 0, (int) ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT);
        } else if (this.mCurrentViewState == 1) {
            int clamp = Util.clamp(this.mBottomRelative - this.mCurrentDistanceY, 0, MAX_SLIDE_DISTANCE);
            return 360 - Util.clamp(clamp >= MAX_SLIDE_DISTANCE / 2 ? ((clamp - (MAX_SLIDE_DISTANCE / 2)) * ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT) / (MAX_SLIDE_DISTANCE / 2) : 0, 0, (int) ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT);
        } else if (this.mCurrentViewState == 3) {
            return Util.clamp((int) (135.0f * this.mEVAnimationRatio * 2.0f), 0, 135);
        } else {
            if (this.mCurrentViewState == 4) {
                return Util.clamp((int) (135.0f * (1.0f - ((this.mEVAnimationRatio - 0.5f) * 2.0f))), 0, 135);
            }
            return 0;
        }
    }

    private float getInterpolation(float f) {
        float interpolation = this.mInterpolator.getInterpolation(f);
        if (((double) interpolation) > 1.0d) {
            return 1.0f;
        }
        return interpolation;
    }

    /* access modifiers changed from: private */
    public int getItemByCoordinate() {
        return Util.clamp((this.mAdapter.getMaxItem() * (this.mBottomRelative - this.mCurrentDistanceY)) / MAX_SLIDE_DISTANCE, 0, this.mAdapter.getMaxItem());
    }

    private float getItemRatio(int i) {
        float maxItem = ((float) i) / ((float) this.mAdapter.getMaxItem());
        if (maxItem >= 0.5f) {
            maxItem -= 0.5f;
        }
        return 2.0f * maxItem;
    }

    private void initRect() {
        this.mDisplayRect = Util.getPreviewRect(getContext());
        this.mWidth = this.mDisplayRect.width();
        this.mHeight = this.mDisplayRect.height();
        this.mCenterX = this.mWidth / 2;
        this.mCenterY = this.mHeight / 2;
        setPivotX((float) this.mCenterX);
        setPivotY((float) this.mCenterY);
        CameraFocusAnimateDrawable cameraFocusAnimateDrawable = this.mCameraFocusAnimateDrawable;
        boolean z = true;
        if (1 != getLayoutDirection()) {
            z = false;
        }
        cameraFocusAnimateDrawable.setRtlAndDisplayRect(z, this.mDisplayRect);
        this.mCameraFocusAnimateDrawable.setCenter(this.mCenterX, this.mCenterY);
    }

    /* access modifiers changed from: private */
    public boolean isInCircle(float f, float f2, float f3) {
        float f4 = f - ((float) this.mCenterX);
        float f5 = f2 - ((float) this.mCenterY);
        return Math.sqrt((double) ((f4 * f4) + (f5 * f5))) <= ((double) f3);
    }

    private boolean isStableStart() {
        if (this.mIsTouchFocus && this.mExposureViewListener != null) {
            return this.mExposureViewListener.isMeteringAreaOnly();
        }
        return false;
    }

    private void processParameterIfNeeded(float f) {
        if (this.mIsTouchFocus && this.mEVCaptureRatio != -1.0f && this.mCenterFlag == 0) {
            this.mCenterFlag = 2;
        }
    }

    private void reload() {
        if (this.mAdapter != null) {
            this.mCurrentItem = this.mAdapter.getItemIndexByValue(Integer.valueOf(CameraSettings.readExposure()));
            updateEV();
        }
    }

    /* access modifiers changed from: private */
    public void removeMessages() {
    }

    /* access modifiers changed from: private */
    public void reset(int i) {
        if (this.mIsDraw || i == 8 || i == 2) {
            clearMessages();
            this.mState = 0;
            setPosition(i, this.mWidth / 2, this.mHeight / 2);
            this.mCurrentViewState = 0;
            this.mCenterFlag = 0;
            this.mIsDown = false;
            stopEvAdjust();
            setDraw(false);
            invalidate();
        }
    }

    /* access modifiers changed from: private */
    public void resetCenter() {
        this.mCurrentViewState = 0;
        this.mAdjustedDoneTime = System.currentTimeMillis();
        if (this.mExposureViewListener != null) {
            if (this.mExposureViewListener.isShowAeAfLockIndicator() && CameraSettings.isAEAFLockSupport()) {
                this.mCenterFlag = 5;
                this.mIndicatorState.mCenterFlag = this.mCenterFlag;
                invalidate();
            } else if (this.mExposureViewListener.isShowCaptureButton() && this.mExposureViewListener.isSupportFocusShoot()) {
                this.mCenterFlag = 2;
                this.mIndicatorState.mCenterFlag = this.mCenterFlag;
                invalidate();
            }
        }
    }

    private void resetEvValue() {
        this.mBeingEvAdjusted = false;
        this.mEvValue = 0.0f;
        this.mCurrentItem = 0;
        this.mScrollDistanceY = 0;
        this.mCurrentDistanceY = 0;
        this.mCameraFocusAnimateDrawable.reset();
    }

    /* access modifiers changed from: private */
    public void setCurrentItem(int i, boolean z) {
        if (i != this.mCurrentItem) {
            this.mCurrentItem = i;
            if (this.mAdapter != null) {
                EvChangedProtocol evChangedProtocol = (EvChangedProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(169);
                if (evChangedProtocol == null) {
                    Log.d(TAG, "needEvPresenter");
                } else {
                    evChangedProtocol.onEvChanged(this.mAdapter.getItemValue(i), 1);
                }
            }
            updateEV();
        }
    }

    private void setDraw(boolean z) {
        if (z && this.mIsTouchFocus && this.mIsDraw != z) {
            reload();
        }
        this.mIsDraw = z;
    }

    /* access modifiers changed from: private */
    public void setTouchDown() {
        this.mBottomRelative = (int) (((float) MAX_SLIDE_DISTANCE) * 0.5f);
    }

    private void showTipMessage(int i, @StringRes int i2) {
        BottomPopupTips bottomPopupTips = (BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
        if (bottomPopupTips != null) {
            if (bottomPopupTips.isPortraitHintVisible()) {
                bottomPopupTips.setPortraitHintVisible(8);
            }
            bottomPopupTips.showTips(i, i2, 2);
        }
    }

    /* access modifiers changed from: private */
    public void startAnimation() {
        this.mEVAnimationStartTime = SystemClock.uptimeMillis();
        this.mHandler.removeMessages(7);
        this.mHandler.sendEmptyMessage(7);
    }

    private void stopEvAdjust() {
        if (this.mBeingEvAdjusted) {
            this.mBeingEvAdjusted = false;
            EvChangedProtocol evChangedProtocol = (EvChangedProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(169);
            if (evChangedProtocol != null) {
                evChangedProtocol.onEvChanged(0, 2);
            }
        }
    }

    private void updateEV() {
        Rational exposureCompensationRational = Camera2DataContainer.getInstance().getCurrentCameraCapabilities().getExposureCompensationRational();
        if (this.mAdapter != null) {
            this.mEvValue = ((float) this.mAdapter.getItemValue(this.mCurrentItem)) * exposureCompensationRational.floatValue();
        } else {
            this.mEvValue = 0.0f;
        }
    }

    public void clear() {
        reset(7);
    }

    public void clear(int i) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("clear: ");
        sb.append(i);
        Log.d(str, sb.toString());
        if (this.mCameraFocusAnimateDrawable != null) {
            this.mCameraFocusAnimateDrawable.cancelFocusingAnimation();
        }
        reset(i);
    }

    public void enableControls(boolean z) {
    }

    public void initialize(ExposureViewListener exposureViewListener) {
        this.mExposureViewListener = exposureViewListener;
        reset(8);
    }

    public void invalidateDrawable(Drawable drawable) {
        invalidate();
    }

    public boolean isEvAdjusted() {
        return this.mBeingEvAdjusted;
    }

    public boolean isEvAdjustedTime() {
        return isShown() && this.mIsTouchFocus && (this.mBeingEvAdjusted || !Util.isTimeout(System.currentTimeMillis(), this.mAdjustedDoneTime, 1500));
    }

    public boolean isVisible() {
        return this.mIsDraw;
    }

    public void onCameraOpen() {
    }

    public void onCreate() {
    }

    /* access modifiers changed from: protected */
    public void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        if (this.mCameraFocusAnimateDrawable != null) {
            this.mCameraFocusAnimateDrawable.cancelFocusingAnimation();
            this.mCameraFocusAnimateDrawable.setCallback(null);
        }
        if (this.mHandler != null) {
            this.mHandler.removeCallbacksAndMessages(null);
        }
    }

    /* access modifiers changed from: protected */
    public void onDraw(Canvas canvas) {
        if (this.mIsDraw && this.mCameraFocusAnimateDrawable != null) {
            this.mCameraFocusAnimateDrawable.draw(canvas);
        }
    }

    public void onPause() {
        setDraw(false);
    }

    public void onResume() {
        setDraw(false);
    }

    public boolean onViewTouchEvent(MotionEvent motionEvent) {
        boolean z = false;
        if (this.mAdapter == null || !this.mIsTouchFocus || (this.mState != 2 && !isStableStart())) {
            return false;
        }
        this.mGestureDetector.onTouchEvent(motionEvent);
        boolean z2 = this.mIsDown;
        if (motionEvent.getActionMasked() == 5 && this.mIsDown) {
            this.mIsDown = false;
        }
        if (1 == motionEvent.getAction() || 3 == motionEvent.getAction()) {
            if (this.mBeingEvAdjusted) {
                CameraStatUtil.trackEvAdjusted();
                stopEvAdjust();
                this.mAdjustedDoneTime = System.currentTimeMillis();
                this.mHandler.removeMessages(6);
                this.mHandler.sendEmptyMessageDelayed(6, 1000);
            }
            if (this.mIsDraw) {
                this.mIsDown = false;
            }
        }
        if (z2 || this.mIsDown) {
            z = true;
        }
        return z;
    }

    public void reInit() {
        Log.d(TAG, "onCameraOpen>>");
        initRect();
        Range exposureCompensationRange = Camera2DataContainer.getInstance().getCurrentCameraCapabilities().getExposureCompensationRange();
        int intValue = ((Integer) exposureCompensationRange.getLower()).intValue();
        int intValue2 = ((Integer) exposureCompensationRange.getUpper()).intValue();
        if (intValue2 != 0 && intValue2 != intValue) {
            this.mAdapter = new FloatSlideAdapter(intValue, intValue2, GAP_NUM == 0.0f ? 1.0f : ((float) (intValue2 - intValue)) / GAP_NUM);
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("onCameraOpen: adapter=");
            sb.append(this.mAdapter);
            Log.w(str, sb.toString());
            if (this.mAdapter != null) {
                resetEvValue();
                this.mCurrentMode = DataRepository.dataItemGlobal().getCurrentMode();
                if (this.mCurrentMode != 167) {
                    this.mCameraFocusAnimateDrawable.setEvTextVisible(8);
                } else {
                    this.mCameraFocusAnimateDrawable.setEvTextVisible(0);
                }
                setEvAdjustable(CameraSettings.isEvAdjustable());
                int itemIndexByValue = this.mAdapter.getItemIndexByValue(Integer.valueOf(CameraSettings.readExposure()));
                if (itemIndexByValue < 0) {
                    this.mCurrentItem = this.mAdapter.getMaxItem() / 2;
                } else {
                    this.mCurrentItem = itemIndexByValue;
                }
                updateEV();
            }
        }
    }

    public void releaseListener() {
        this.mExposureViewListener = null;
    }

    public void setEvAdjustable(boolean z) {
        if (this.mAdapter != null) {
            this.mIsEvAdjustable = z;
            resetEvValue();
            calculateAttribute();
            this.mCameraFocusAnimateDrawable.setEvAdjustVisible(z ? 0 : 8);
            if (!z) {
                this.mCameraFocusAnimateDrawable.setEvTextVisible(8);
            }
            invalidate();
        }
    }

    public void setFocusType(boolean z) {
        this.mIsTouchFocus = z;
    }

    public void setOrientation(int i, boolean z) {
        if (this.mRotation != i) {
            this.mRotation = i;
            this.mCameraFocusAnimateDrawable.setOrientation(i);
            if (this.mIsDraw) {
                invalidate();
            }
        }
    }

    public void setPosition(int i, int i2, int i3) {
        this.mCenterX = i2;
        this.mCenterY = i3;
        setPivotX((float) i2);
        setPivotY((float) i3);
        this.mCameraFocusAnimateDrawable.setCenter(i2, i3);
        removeMessages();
        if (this.mEvValue != 0.0f) {
            if (i != 5) {
                switch (i) {
                    case 1:
                    case 2:
                        break;
                }
            }
            EvChangedProtocol evChangedProtocol = (EvChangedProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(169);
            if (evChangedProtocol != null) {
                evChangedProtocol.resetEvValue();
            }
        }
        if (this.mCurrentDistanceY != 0 && i != 7) {
            resetEvValue();
        }
    }

    public void showFail() {
        this.mCameraFocusAnimateDrawable.startFocusFailAnimation();
        Log.d(TAG, "showFail");
        if (this.mState == 1) {
            clearMessages();
            setDraw(true);
            this.mState = 3;
            this.mFailTime = SystemClock.uptimeMillis();
            this.mHandler.sendEmptyMessageDelayed(5, 800);
            invalidate();
        }
    }

    public void showStart() {
        Log.d(TAG, "showStart");
        clearMessages();
        this.mState = 1;
        this.mCursorState = 1;
        this.mStartTime = SystemClock.uptimeMillis();
        setDraw(true);
        this.mCameraFocusAnimateDrawable.startTouchDownAnimation();
        if (isStableStart()) {
            this.mEVCaptureRatio = 1.0f;
            showSuccess();
        } else {
            this.mEVCaptureRatio = -1.0f;
            this.mCenterFlag = 0;
            processParameterIfNeeded(0.0f);
            this.mHandler.sendEmptyMessageDelayed(4, 5000);
        }
        invalidate();
    }

    public void showSuccess() {
        Log.d(TAG, "showSuccess");
        if (this.mState == 1) {
            clearMessages();
            setDraw(true);
            this.mState = 2;
            this.mSuccessTime = SystemClock.uptimeMillis();
            if (!this.mIsTouchFocus) {
                this.mHandler.sendEmptyMessageDelayed(5, 800);
            }
        }
        if (this.mExposureViewListener == null) {
            Log.d(TAG, "needExposurePresenter");
            return;
        }
        if (this.mExposureViewListener.isShowAeAfLockIndicator() && CameraSettings.isAEAFLockSupport()) {
            int i = R.string.hint_ae_af_lock;
            if (this.mExposureViewListener.isSupportAELockOnly()) {
                i = R.string.hint_ae_lock;
            }
            if (b.gE() && DataRepository.dataItemGlobal().getBoolean(CameraSettings.KEY_EN_FIRST_CHOICE_LOCK_AE_AF_TOAST, false) && getResources().getConfiguration().getLocales().get(0).getLanguage().equalsIgnoreCase("en")) {
                DataRepository.dataItemGlobal().editor().putBoolean(CameraSettings.KEY_EN_FIRST_CHOICE_LOCK_AE_AF_TOAST, false).apply();
                i = R.string.hint_ae_af_lock_extra;
            }
            showTipMessage(8, i);
            this.mCenterFlag = 5;
        } else if (!this.mExposureViewListener.isShowCaptureButton() || !this.mExposureViewListener.isSupportFocusShoot()) {
            this.mCenterFlag = 1;
        } else {
            this.mCenterFlag = 2;
        }
        this.mCameraFocusAnimateDrawable.startFocusSuccessAnimation(this.mCenterFlag, this.mIsTouchFocus);
    }
}
