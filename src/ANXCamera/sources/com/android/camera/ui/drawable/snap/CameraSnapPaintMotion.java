package com.android.camera.ui.drawable.snap;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint.Style;
import com.android.camera.ui.drawable.CameraPaintBase;

public class CameraSnapPaintMotion extends CameraPaintBase {
    private boolean mIsOutstandingRound = false;
    private float mLastAngle = 0.0f;

    public CameraSnapPaintMotion(Context context) {
        super(context);
    }

    /* access modifiers changed from: protected */
    public void draw(Canvas canvas) {
        float f = this.mBaseRadius * this.mCurrentWidthPercent;
        if (this.timeAngle - this.mLastAngle < 0.0f) {
            this.mIsOutstandingRound = !this.mIsOutstandingRound;
        }
        for (int i = 0; i < 40; i++) {
            canvas.save();
            float f2 = (float) (i * 9);
            canvas.rotate(f2, this.mMiddleX, this.mMiddleY);
            int i2 = this.mCurrentAlpha;
            int i3 = 19;
            if (this.isRecording) {
                if (f2 == 0.0f && this.needZero) {
                    this.mPaint.setAlpha(ALPHA_OUTSTANDING);
                } else if (f2 < this.timeAngle) {
                    this.mPaint.setAlpha(this.mIsOutstandingRound ? ALPHA_OUTSTANDING : ALPHA_HINT);
                } else {
                    this.mPaint.setAlpha(this.mIsOutstandingRound ? ALPHA_HINT : ALPHA_OUTSTANDING);
                }
                if (f2 % 90.0f == 0.0f) {
                    canvas.drawLine(this.mMiddleX, this.mMiddleY - f, this.mMiddleX, (this.mMiddleY - f) + ((float) i3), this.mPaint);
                    this.mPaint.setAlpha(i2);
                    canvas.restore();
                }
            } else if (f2 % 90.0f == 0.0f) {
                canvas.drawLine(this.mMiddleX, this.mMiddleY - f, this.mMiddleX, (this.mMiddleY - f) + ((float) i3), this.mPaint);
                this.mPaint.setAlpha(i2);
                canvas.restore();
            }
            i3 = 12;
            canvas.drawLine(this.mMiddleX, this.mMiddleY - f, this.mMiddleX, (this.mMiddleY - f) + ((float) i3), this.mPaint);
            this.mPaint.setAlpha(i2);
            canvas.restore();
        }
        this.mLastAngle = this.timeAngle;
        if (this.isRecording) {
            canvas.rotate(this.timeAngle, this.mMiddleX, this.mMiddleY);
            int i4 = this.mCurrentAlpha;
            this.mPaint.setAlpha(ALPHA_OUTSTANDING);
            canvas.drawLine(this.mMiddleX, this.mMiddleY - f, this.mMiddleX, (this.mMiddleY - f) + 19.0f, this.mPaint);
            this.mPaint.setAlpha(i4);
        }
    }

    /* access modifiers changed from: protected */
    public void initPaint(Context context) {
        this.mPaint.setAntiAlias(true);
        this.mPaint.setStyle(Style.STROKE);
        this.mPaint.setStrokeWidth(3.0f);
    }
}
