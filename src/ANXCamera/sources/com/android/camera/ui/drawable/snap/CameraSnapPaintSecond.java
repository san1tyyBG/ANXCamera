package com.android.camera.ui.drawable.snap;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint.Style;
import com.android.camera.Util;
import com.android.camera.ui.drawable.CameraPaintBase;

public class CameraSnapPaintSecond extends CameraPaintBase {
    private boolean mNeedSpacing;

    public CameraSnapPaintSecond(Context context) {
        super(context);
    }

    /* access modifiers changed from: protected */
    public void draw(Canvas canvas) {
        float f = this.mBaseRadius * this.mCurrentWidthPercent;
        for (int i = 0; i < 90; i++) {
            canvas.save();
            float f2 = (float) (i * 4);
            canvas.rotate(f2, this.mMiddleX, this.mMiddleY);
            int i2 = this.isRecording ? (f2 != 0.0f || !this.needZero) ? f2 < this.timeAngle ? this.isClockwise ? ALPHA_OUTSTANDING : ALPHA_HINT : this.isClockwise ? ALPHA_HINT : ALPHA_OUTSTANDING : ALPHA_OUTSTANDING : this.mCurrentAlpha;
            if (this.mNeedSpacing && i > 67 && i < 90 && i % 2 != 0) {
                i2 = 0;
            }
            this.mPaint.setAlpha(i2);
            canvas.drawLine(this.mMiddleX, this.mMiddleY - f, this.mMiddleX, (this.mMiddleY - f) + ((float) Util.dpToPixel(5.0f)), this.mPaint);
            canvas.restore();
        }
    }

    /* access modifiers changed from: protected */
    public void initPaint(Context context) {
        this.mPaint.setAntiAlias(true);
        this.mPaint.setStyle(Style.STROKE);
        this.mPaint.setStrokeWidth(3.0f);
    }

    public void setNeedSpacing(boolean z) {
        this.mNeedSpacing = z;
    }
}
