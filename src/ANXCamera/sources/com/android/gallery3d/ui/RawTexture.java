package com.android.gallery3d.ui;

import android.opengl.GLES20;
import com.android.camera.log.Log;

public class RawTexture extends BasicTexture {
    private static final String TAG = "RawTexture";
    private static final int[] sTextureId = new int[1];
    private final boolean mOpaque;

    public RawTexture(int i, int i2, boolean z) {
        this.mOpaque = z;
        setSize(i, i2);
    }

    public int getTarget() {
        return 3553;
    }

    public boolean isOpaque() {
        return this.mOpaque;
    }

    public boolean onBind(GLCanvas gLCanvas) {
        if (isLoaded()) {
            return true;
        }
        Log.w(TAG, "lost the content due to context change");
        return false;
    }

    public void prepare(GLCanvas gLCanvas) {
        GLES20.glGenTextures(1, sTextureId, 0);
        GLES20.glBindTexture(3553, sTextureId[0]);
        GLES20.glTexParameteri(3553, 10242, 33071);
        GLES20.glTexParameteri(3553, 10243, 33071);
        GLES20.glTexParameterf(3553, 10241, 9729.0f);
        GLES20.glTexParameterf(3553, 10240, 9729.0f);
        GLES20.glTexImage2D(3553, 0, 6408, getTextureWidth(), getTextureHeight(), 0, 6408, 5121, null);
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("prepare textureSize=");
        sb.append(getTextureWidth());
        sb.append("x");
        sb.append(getTextureHeight());
        sb.append(" id=");
        sb.append(sTextureId[0]);
        Log.v(str, sb.toString());
        this.mId = sTextureId[0];
        this.mState = 1;
        setAssociatedCanvas(gLCanvas);
    }

    public void yield() {
    }
}
