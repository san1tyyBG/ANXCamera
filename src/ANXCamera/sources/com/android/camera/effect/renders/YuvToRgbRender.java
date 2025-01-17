package com.android.camera.effect.renders;

import android.media.Image.Plane;
import android.opengl.GLES20;
import com.android.camera.effect.ShaderUtil;
import com.android.camera.effect.draw_mode.DrawAttribute;
import com.android.camera.effect.draw_mode.DrawYuvAttribute;
import com.android.camera.log.Log;
import com.android.gallery3d.ui.GLCanvas;
import com.xiaomi.camera.base.ImageUtil;
import java.nio.ByteBuffer;
import java.util.Locale;

public class YuvToRgbRender extends ShaderRender {
    private static final String FRAG = "precision highp float; \nvarying vec2 vTexCoord; \nuniform sampler2D uYTexture; \nuniform sampler2D uUVTexture; \nvoid main (void){ \n   float r, g, b, y, u, v; \n   y = texture2D(uYTexture, vTexCoord).r; \n   v = texture2D(uUVTexture, vTexCoord).a - 0.5; \n   u = texture2D(uUVTexture, vTexCoord).r - 0.5; \n   r = y + 1.402 * v;\n   g = y - 0.34414 * u - 0.71414 * v;\n   b = y + 1.772 * u;\n   gl_FragColor = vec4(r, g, b, 1); \n} \n";
    private static final String TAG = YuvToRgbRender.class.getSimpleName();
    private static final float[] TEXTURES = {0.0f, 1.0f, 1.0f, 1.0f, 0.0f, 0.0f, 1.0f, 0.0f};
    private static final float[] VERTICES = {0.0f, 1.0f, 1.0f, 1.0f, 0.0f, 0.0f, 1.0f, 0.0f};
    private int mUniformUVTexture;
    private int mUniformYTexture;
    private int[] mYuvTextureIds;

    public YuvToRgbRender(GLCanvas gLCanvas, int i) {
        super(gLCanvas, i);
    }

    private void drawTexture(int[] iArr, float f, float f2, float f3, float f4) {
        GLES20.glUseProgram(this.mProgram);
        updateViewport();
        setBlendEnabled(false);
        this.mGLCanvas.getState().pushState();
        this.mGLCanvas.getState().translate(f, f2, 0.0f);
        this.mGLCanvas.getState().scale(f3, f4, 1.0f);
        if (iArr[0] != -1) {
            GLES20.glActiveTexture(33984);
            GLES20.glBindTexture(3553, iArr[0]);
            GLES20.glUniform1i(this.mUniformYTexture, 0);
        }
        if (iArr[1] != -1) {
            GLES20.glActiveTexture(33985);
            GLES20.glBindTexture(3553, iArr[1]);
            GLES20.glUniform1i(this.mUniformUVTexture, 1);
        }
        initShaderValue();
        GLES20.glDrawArrays(5, 0, 4);
        this.mGLCanvas.getState().popState();
    }

    public boolean draw(DrawAttribute drawAttribute) {
        if (!isAttriSupported(drawAttribute.getTarget())) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("unsupported target ");
            sb.append(drawAttribute.getTarget());
            Log.w(str, sb.toString());
            return false;
        }
        if (drawAttribute.getTarget() != 11) {
            String str2 = TAG;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("unsupported target ");
            sb2.append(drawAttribute.getTarget());
            Log.w(str2, sb2.toString());
        } else {
            long currentTimeMillis = System.currentTimeMillis();
            DrawYuvAttribute drawYuvAttribute = (DrawYuvAttribute) drawAttribute;
            if (drawYuvAttribute.mYuvImage != null) {
                genMiYuvTextures(drawYuvAttribute);
                Log.e(TAG, "yuv image not available !!!");
            } else if (drawYuvAttribute.mBlockWidth == 0 && drawYuvAttribute.mBlockHeight == 0) {
                genYUVTextures(drawYuvAttribute);
            } else {
                genBlockYUVTextures(drawYuvAttribute);
            }
            if (drawYuvAttribute.mBlockWidth == 0 && drawYuvAttribute.mBlockHeight == 0) {
                drawTexture(this.mYuvTextureIds, 0.0f, 0.0f, (float) drawYuvAttribute.mPictureSize.getWidth(), (float) drawYuvAttribute.mPictureSize.getHeight());
            } else {
                drawTexture(this.mYuvTextureIds, 0.0f, 0.0f, (float) drawYuvAttribute.mBlockWidth, (float) drawYuvAttribute.mBlockHeight);
            }
            Log.d(TAG, String.format(Locale.ENGLISH, "draw: size=%s time=%d", new Object[]{drawYuvAttribute.mPictureSize, Long.valueOf(System.currentTimeMillis() - currentTimeMillis)}));
        }
        return true;
    }

    public void genBlockYUVTextures(DrawYuvAttribute drawYuvAttribute) {
        drawYuvAttribute.mImage.getWidth();
        drawYuvAttribute.mImage.getHeight();
        ShaderUtil.loadYuvImageTextures(drawYuvAttribute.mBlockWidth, drawYuvAttribute.mBlockHeight, drawYuvAttribute.mOffsetY, drawYuvAttribute.mOffsetUV, this.mYuvTextureIds);
    }

    public void genMiYuvTextures(DrawYuvAttribute drawYuvAttribute) {
        int i = drawYuvAttribute.mYuvImage.mWidth;
        int i2 = drawYuvAttribute.mYuvImage.mHeight;
        ByteBuffer yBuffer = drawYuvAttribute.mYuvImage.getYBuffer();
        ByteBuffer uVBuffer = drawYuvAttribute.mYuvImage.getUVBuffer();
        if (yBuffer != null && uVBuffer != null) {
            ShaderUtil.loadYuvToTextures(yBuffer, uVBuffer, i, i2, this.mYuvTextureIds);
        }
    }

    public void genYUVTextures(DrawYuvAttribute drawYuvAttribute) {
        int width = drawYuvAttribute.mImage.getWidth();
        int height = drawYuvAttribute.mImage.getHeight();
        Plane[] planes = drawYuvAttribute.mImage.getPlanes();
        Plane plane = planes[0];
        Plane plane2 = planes[2];
        ShaderUtil.loadYuvToTextures(plane.getRowStride() == width ? plane.getBuffer() : ImageUtil.removePadding(plane, width, height), plane2.getRowStride() == width ? plane2.getBuffer() : ImageUtil.removePadding(plane2, width / 2, height / 2), width, height, this.mYuvTextureIds);
    }

    public String getFragShaderString() {
        return FRAG;
    }

    /* access modifiers changed from: protected */
    public void initShader() {
        this.mProgram = ShaderUtil.createProgram(getVertexShaderString(), getFragShaderString());
        if (this.mProgram != 0) {
            GLES20.glUseProgram(this.mProgram);
            this.mUniformMVPMatrixH = GLES20.glGetUniformLocation(this.mProgram, "uMVPMatrix");
            this.mUniformSTMatrixH = GLES20.glGetUniformLocation(this.mProgram, "uSTMatrix");
            this.mAttributePositionH = GLES20.glGetAttribLocation(this.mProgram, "aPosition");
            this.mAttributeTexCoorH = GLES20.glGetAttribLocation(this.mProgram, "aTexCoord");
            this.mUniformYTexture = GLES20.glGetUniformLocation(this.mProgram, "uYTexture");
            this.mUniformUVTexture = GLES20.glGetUniformLocation(this.mProgram, "uUVTexture");
            this.mYuvTextureIds = new int[2];
            GLES20.glGenTextures(2, this.mYuvTextureIds, 0);
            Log.d(TAG, String.format(Locale.ENGLISH, "genTexture: %d %d", new Object[]{Integer.valueOf(this.mYuvTextureIds[0]), Integer.valueOf(this.mYuvTextureIds[1])}));
            return;
        }
        StringBuilder sb = new StringBuilder();
        sb.append(getClass());
        sb.append(": mProgram = 0");
        throw new IllegalArgumentException(sb.toString());
    }

    /* access modifiers changed from: protected */
    public void initShaderValue() {
        GLES20.glVertexAttribPointer(this.mAttributePositionH, 2, 5126, false, 8, this.mVertexBuffer);
        GLES20.glVertexAttribPointer(this.mAttributeTexCoorH, 2, 5126, false, 8, this.mTexCoorBuffer);
        GLES20.glEnableVertexAttribArray(this.mAttributePositionH);
        GLES20.glEnableVertexAttribArray(this.mAttributeTexCoorH);
        GLES20.glUniformMatrix4fv(this.mUniformMVPMatrixH, 1, false, this.mGLCanvas.getState().getFinalMatrix(), 0);
        GLES20.glUniformMatrix4fv(this.mUniformSTMatrixH, 1, false, this.mGLCanvas.getState().getTexMatrix(), 0);
    }

    /* access modifiers changed from: protected */
    public void initSupportAttriList() {
        this.mAttriSupportedList.add(Integer.valueOf(11));
    }

    /* access modifiers changed from: protected */
    public void initVertexData() {
        this.mVertexBuffer = allocateByteBuffer((VERTICES.length * 32) / 8).asFloatBuffer();
        this.mVertexBuffer.put(VERTICES);
        this.mVertexBuffer.position(0);
        this.mTexCoorBuffer = allocateByteBuffer((TEXTURES.length * 32) / 8).asFloatBuffer();
        this.mTexCoorBuffer.put(TEXTURES);
        this.mTexCoorBuffer.position(0);
    }
}
