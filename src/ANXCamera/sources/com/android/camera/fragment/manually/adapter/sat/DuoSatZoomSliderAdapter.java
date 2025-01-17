package com.android.camera.fragment.manually.adapter.sat;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Paint.Align;
import android.text.Layout.Alignment;
import android.text.SpannableStringBuilder;
import android.text.StaticLayout;
import android.text.TextPaint;
import android.text.style.TextAppearanceSpan;
import android.util.Spline;
import com.android.camera.ActivityBase;
import com.android.camera.HybridZoomingSystem;
import com.android.camera.R;
import com.android.camera.Util;
import com.android.camera.data.data.ComponentData;
import com.android.camera.fragment.manually.ManuallyListener;
import com.android.camera.fragment.manually.adapter.AbstractZoomSliderAdapter;
import com.android.camera.module.BaseModule;
import com.android.camera.ui.HorizontalSlideView;

public class DuoSatZoomSliderAdapter extends AbstractZoomSliderAdapter {
    private static final int ENTRY_COUNT_1X_TO_2X = 11;
    private static final int ENTRY_COUNT_2X_TO_MAX = 38;
    private static final int ENTRY_COUNT_TOTAL = 48;
    private static final int ENTRY_INDEX_1X = 0;
    private static final int ENTRY_INDEX_2X = 10;
    private static final int ENTRY_INDEX_MAX = 47;
    private static final int[] sTextActivatedColorState = {16843518};
    private static final int[] sTextDefaultColorState = {0};
    private static float[] sX = {0.0f, 10.0f, 12.0f, 20.0f, 25.0f, 27.0f, 29.0f, 30.0f, 32.0f, 35.0f};
    private static float[] sY = {1.0f, 2.0f, 2.2f, 3.7f, 5.1f, 5.8f, 6.6f, 7.0f, 8.0f, 10.0f};
    private int ENTRY_INDEX_TELE_REAL = 10;
    private ComponentData mComponentData;
    private int mCurrentMode;
    private String mCurrentValue;
    private TextAppearanceSpan mDigitsTextStyle;
    private int mDotColorActivated;
    private int mDotRadius;
    private boolean mEnable;
    private CharSequence[] mEntries;
    private StaticLayout[] mEntryLayouts;
    private Spline mEntryToZoomRatioSpline;
    private int mLineColorDefault;
    private int mLineDotYGap;
    private float mLineHalfHeight;
    private int mLineLineGap;
    private int mLineTextGap;
    private int mLineWidth;
    private ManuallyListener mManuallyListener;
    private Paint mPaint;
    private ColorStateList mTextColor;
    private TextPaint mTextPaint;
    private int mTextSize;
    private TextAppearanceSpan mXTextStyle;
    private float mZoomRatioMax;
    private float mZoomRatioTele;
    private Spline mZoomRatioToEntrySpline;
    private float mZoomRatioWide;

    public DuoSatZoomSliderAdapter(Context context, ComponentData componentData, int i, ManuallyListener manuallyListener) {
        this.mComponentData = componentData;
        this.mCurrentMode = i;
        this.mManuallyListener = manuallyListener;
        this.mCurrentValue = componentData.getComponentValue(this.mCurrentMode);
        BaseModule baseModule = (BaseModule) ((ActivityBase) context).getCurrentModule();
        this.mZoomRatioWide = HybridZoomingSystem.FLOAT_ZOOM_RATIO_WIDE;
        this.mZoomRatioTele = HybridZoomingSystem.FLOAT_ZOOM_RATIO_TELE;
        this.mZoomRatioMax = baseModule.getMaxZoomRatio();
        float[] convertSplineXToEntryX = convertSplineXToEntryX(sX);
        float[] convertSplineYToZoomRatioY = convertSplineYToZoomRatioY(sY);
        this.mEntryToZoomRatioSpline = Spline.createMonotoneCubicSpline(convertSplineXToEntryX, convertSplineYToZoomRatioY);
        this.mZoomRatioToEntrySpline = Spline.createMonotoneCubicSpline(convertSplineYToZoomRatioY, convertSplineXToEntryX);
        initStyle(context);
        this.mEntries = new CharSequence[]{getDisplayedZoomRatio(this.mZoomRatioWide), getDisplayedZoomRatio(this.mZoomRatioTele), getDisplayedZoomRatio(this.mZoomRatioMax)};
        this.mEntryLayouts = new StaticLayout[this.mEntries.length];
        for (int i2 = 0; i2 < this.mEntries.length; i2++) {
            StaticLayout[] staticLayoutArr = this.mEntryLayouts;
            StaticLayout staticLayout = new StaticLayout(this.mEntries[i2], this.mTextPaint, Util.sWindowWidth, Alignment.ALIGN_NORMAL, 1.0f, 0.0f, false);
            staticLayoutArr[i2] = staticLayout;
        }
        int realZoomRatioTele = getRealZoomRatioTele();
        float f = (float) realZoomRatioTele;
        if (f != this.mZoomRatioTele * 10.0f && f > this.mZoomRatioWide * 10.0f && f < this.mZoomRatioTele * 10.0f) {
            this.ENTRY_INDEX_TELE_REAL = realZoomRatioTele - (((int) this.mZoomRatioWide) * 10);
        }
    }

    private float[] convertSplineXToEntryX(float[] fArr) {
        int i = (int) ((fArr[fArr.length - 1] - 10.0f) + 1.0f);
        float[] fArr2 = new float[fArr.length];
        for (int i2 = 0; i2 < fArr.length; i2++) {
            if (fArr[i2] <= 10.0f) {
                fArr2[i2] = fArr[i2];
            } else {
                fArr2[i2] = (((fArr[i2] - 10.0f) / ((float) (i - 1))) * 37.0f) + 10.0f;
            }
        }
        return fArr2;
    }

    private float[] convertSplineYToZoomRatioY(float[] fArr) {
        int i = (int) fArr[fArr.length - 1];
        float[] fArr2 = new float[fArr.length];
        for (int i2 = 0; i2 < fArr.length; i2++) {
            if (fArr[i2] <= this.mZoomRatioTele) {
                fArr2[i2] = fArr[i2];
            } else {
                fArr2[i2] = (((fArr[i2] - this.mZoomRatioTele) / (((float) i) - this.mZoomRatioTele)) * (this.mZoomRatioMax - this.mZoomRatioTele)) + this.mZoomRatioTele;
            }
        }
        return fArr2;
    }

    private void drawText(int i, Canvas canvas) {
        float lineAscent = (float) (this.mEntryLayouts[i].getLineAscent(0) - this.mEntryLayouts[i].getLineDescent(0));
        canvas.save();
        canvas.translate(0.0f, lineAscent / 2.0f);
        this.mEntryLayouts[i].draw(canvas);
        canvas.restore();
    }

    private CharSequence getDisplayedZoomRatio(float f) {
        SpannableStringBuilder spannableStringBuilder = new SpannableStringBuilder();
        Util.appendInApi26(spannableStringBuilder, String.valueOf((int) f), this.mDigitsTextStyle, 33);
        Util.appendInApi26(spannableStringBuilder, "X", this.mXTextStyle, 33);
        return spannableStringBuilder;
    }

    private int indexToSection(int i) {
        if (i == 0) {
            return 0;
        }
        if (i == 10) {
            return 1;
        }
        return i == 47 ? 2 : -1;
    }

    private void initStyle(Context context) {
        TypedArray obtainStyledAttributes = context.obtainStyledAttributes(R.style.SingeTextItemTextStyle, new int[]{16842901, 16842904});
        this.mTextSize = obtainStyledAttributes.getDimensionPixelSize(obtainStyledAttributes.getIndex(0), this.mTextSize);
        this.mTextColor = obtainStyledAttributes.getColorStateList(obtainStyledAttributes.getIndex(1));
        obtainStyledAttributes.recycle();
        Resources resources = context.getResources();
        this.mLineHalfHeight = ((float) resources.getDimensionPixelSize(R.dimen.focus_line_height)) / 2.0f;
        this.mLineWidth = resources.getDimensionPixelSize(R.dimen.focus_line_width);
        this.mDotRadius = resources.getDimensionPixelSize(R.dimen.zoom_popup_dot_radius);
        this.mLineLineGap = resources.getDimensionPixelSize(R.dimen.focus_line_line_gap);
        this.mLineTextGap = resources.getDimensionPixelSize(R.dimen.focus_line_text_gap);
        this.mLineDotYGap = resources.getDimensionPixelSize(R.dimen.zoom_popup_line_dot_y_gap);
        this.mLineColorDefault = resources.getColor(R.color.zoom_popup_line_color_default);
        this.mDotColorActivated = resources.getColor(R.color.zoom_popup_dot_color_activated);
        this.mPaint = new Paint();
        this.mPaint.setAntiAlias(true);
        this.mPaint.setStrokeWidth((float) this.mLineWidth);
        this.mPaint.setTextSize((float) this.mTextSize);
        this.mPaint.setTextAlign(Align.LEFT);
        this.mTextPaint = new TextPaint(this.mPaint);
        this.mDigitsTextStyle = new TextAppearanceSpan(context, R.style.ZoomPopupDigitsTextStyle);
        this.mXTextStyle = new TextAppearanceSpan(context, R.style.ZoomPopupXTextStyle);
    }

    public void draw(int i, Canvas canvas, boolean z) {
        if (i == 0 || i == 10 || i == 47) {
            this.mTextPaint.drawableState = z ? sTextActivatedColorState : sTextDefaultColorState;
            drawText(indexToSection(i), canvas);
            return;
        }
        this.mPaint.setColor(z ? this.mTextColor.getColorForState(sTextActivatedColorState, 0) : this.mLineColorDefault);
        canvas.drawLine(0.0f, -this.mLineHalfHeight, 0.0f, this.mLineHalfHeight, this.mPaint);
        if (i == this.ENTRY_INDEX_TELE_REAL) {
            this.mPaint.setColor(z ? this.mDotColorActivated : this.mLineColorDefault);
            canvas.drawCircle(0.0f, ((-this.mLineHalfHeight) - ((float) this.mLineDotYGap)) - ((float) this.mDotRadius), (float) this.mDotRadius, this.mPaint);
        }
    }

    public Align getAlign(int i) {
        return (i == 0 || i == 10 || i == 47) ? Align.LEFT : Align.CENTER;
    }

    public int getCount() {
        return 48;
    }

    public boolean isEnable() {
        return this.mEnable;
    }

    public float mapPositionToZoomRatio(float f) {
        return this.mEntryToZoomRatioSpline.interpolate(f);
    }

    public float mapZoomRatioToPosition(float f) {
        return this.mZoomRatioToEntrySpline.interpolate(f);
    }

    public float measureGap(int i) {
        return (i == 0 || i == 10 || i == 47) ? (float) this.mLineTextGap : (float) this.mLineLineGap;
    }

    public float measureWidth(int i) {
        return (i == 0 || i == 10 || i == 47) ? this.mEntryLayouts[indexToSection(i)].getLineWidth(0) : (float) this.mLineWidth;
    }

    public void onPositionSelect(HorizontalSlideView horizontalSlideView, int i, float f) {
        if (this.mEnable) {
            String valueOf = String.valueOf(mapPositionToZoomRatio(f * ((float) (getCount() - 1))));
            if (!valueOf.equals(this.mCurrentValue)) {
                this.mComponentData.setComponentValue(this.mCurrentMode, valueOf);
                if (this.mManuallyListener != null) {
                    this.mManuallyListener.onManuallyDataChanged(this.mComponentData, this.mCurrentValue, valueOf, false);
                }
                this.mCurrentValue = valueOf;
            }
        }
    }

    public void setEnable(boolean z) {
        this.mEnable = z;
    }
}
