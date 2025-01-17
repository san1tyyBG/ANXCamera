package com.android.camera.sticker.glutils;

import android.content.Context;
import android.graphics.Bitmap;
import android.opengl.GLES20;
import android.opengl.GLUtils;
import android.support.annotation.Nullable;
import android.support.annotation.RawRes;
import com.android.camera.log.Log;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.FloatBuffer;

public class GlUtil {
    public static final int NO_TEXTURE = -1;
    private static final int SIZEOF_FLOAT = 4;
    private static final String TAG = "GlDemoUtil";

    private GlUtil() {
    }

    public static void checkGlError(String str) {
        int glGetError = GLES20.glGetError();
        if (glGetError != 0) {
            StringBuilder sb = new StringBuilder();
            sb.append(str);
            sb.append(": glError 0x");
            sb.append(Integer.toHexString(glGetError));
            String sb2 = sb.toString();
            Log.e(TAG, sb2);
            throw new RuntimeException(sb2);
        }
    }

    public static FloatBuffer createFloatBuffer(float[] fArr) {
        ByteBuffer allocateDirect = ByteBuffer.allocateDirect(fArr.length * 4);
        allocateDirect.order(ByteOrder.nativeOrder());
        FloatBuffer asFloatBuffer = allocateDirect.asFloatBuffer();
        asFloatBuffer.put(fArr);
        asFloatBuffer.position(0);
        return asFloatBuffer;
    }

    public static int createProgram(Context context, @RawRes int i, @RawRes int i2) {
        return createProgram(readTextFromRawResource(context, i), readTextFromRawResource(context, i2));
    }

    public static int createProgram(String str, String str2) {
        int loadShader = loadShader(35633, str);
        if (loadShader == 0) {
            return 0;
        }
        int loadShader2 = loadShader(35632, str2);
        if (loadShader2 == 0) {
            return 0;
        }
        int glCreateProgram = GLES20.glCreateProgram();
        checkGlError("glCreateProgram");
        if (glCreateProgram == 0) {
            Log.e(TAG, "Could not create program");
        }
        GLES20.glAttachShader(glCreateProgram, loadShader);
        checkGlError("glAttachShader");
        GLES20.glAttachShader(glCreateProgram, loadShader2);
        checkGlError("glAttachShader");
        GLES20.glLinkProgram(glCreateProgram);
        int[] iArr = new int[1];
        GLES20.glGetProgramiv(glCreateProgram, 35714, iArr, 0);
        if (iArr[0] != 1) {
            Log.e(TAG, "Could not link program: ");
            Log.e(TAG, GLES20.glGetProgramInfoLog(glCreateProgram));
            GLES20.glDeleteProgram(glCreateProgram);
            glCreateProgram = 0;
        }
        String str3 = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("linkStatus:");
        sb.append(iArr[0]);
        Log.i(str3, sb.toString());
        return glCreateProgram;
    }

    public static int createTexture(int i) {
        return createTexture(i, null, 9729, 9729, 33071, 33071);
    }

    public static int createTexture(int i, Bitmap bitmap) {
        return createTexture(i, bitmap, 9729, 9729, 33071, 33071);
    }

    public static int createTexture(int i, @Nullable Bitmap bitmap, int i2, int i3, int i4, int i5) {
        int[] iArr = new int[1];
        GLES20.glGenTextures(1, iArr, 0);
        checkGlError("glGenTextures");
        GLES20.glBindTexture(i, iArr[0]);
        StringBuilder sb = new StringBuilder();
        sb.append("glBindTexture ");
        sb.append(iArr[0]);
        checkGlError(sb.toString());
        GLES20.glTexParameterf(i, 10241, (float) i2);
        GLES20.glTexParameterf(i, 10240, (float) i3);
        GLES20.glTexParameteri(i, 10242, i4);
        GLES20.glTexParameteri(i, 10243, i5);
        if (bitmap != null) {
            GLUtils.texImage2D(3553, 0, bitmap, 0);
        }
        checkGlError("glTexParameter");
        return iArr[0];
    }

    public static int initEffectTexture(int i, int i2, int[] iArr, int i3) {
        GLES20.glGenTextures(1, iArr, 0);
        GLES20.glBindTexture(i3, iArr[0]);
        GLES20.glTexParameterf(i3, 10240, 9729.0f);
        GLES20.glTexParameterf(i3, 10241, 9729.0f);
        GLES20.glTexParameterf(i3, 10242, 33071.0f);
        GLES20.glTexParameterf(i3, 10243, 33071.0f);
        GLES20.glTexImage2D(i3, 0, 6408, i, i2, 0, 6408, 5121, null);
        return iArr[0];
    }

    public static int loadShader(int i, String str) {
        int glCreateShader = GLES20.glCreateShader(i);
        StringBuilder sb = new StringBuilder();
        sb.append("glCreateShader type=");
        sb.append(i);
        checkGlError(sb.toString());
        GLES20.glShaderSource(glCreateShader, str);
        GLES20.glCompileShader(glCreateShader);
        int[] iArr = new int[1];
        GLES20.glGetShaderiv(glCreateShader, 35713, iArr, 0);
        if (iArr[0] != 0) {
            return glCreateShader;
        }
        String str2 = TAG;
        StringBuilder sb2 = new StringBuilder();
        sb2.append("Could not compile shader ");
        sb2.append(i);
        sb2.append(":");
        Log.e(str2, sb2.toString());
        String str3 = TAG;
        StringBuilder sb3 = new StringBuilder();
        sb3.append(" ");
        sb3.append(GLES20.glGetShaderInfoLog(glCreateShader));
        Log.e(str3, sb3.toString());
        GLES20.glDeleteShader(glCreateShader);
        return 0;
    }

    public static String readTextFromRawResource(Context context, @RawRes int i) {
        InputStream openRawResource = context.getResources().openRawResource(i);
        InputStreamReader inputStreamReader = new InputStreamReader(openRawResource);
        BufferedReader bufferedReader = new BufferedReader(inputStreamReader);
        StringBuilder sb = new StringBuilder();
        while (true) {
            try {
                String readLine = bufferedReader.readLine();
                if (readLine == null) {
                    break;
                }
                sb.append(readLine);
                sb.append(10);
            } catch (IOException e) {
                if (openRawResource != null) {
                    try {
                        openRawResource.close();
                    } catch (IOException e2) {
                        return null;
                    }
                }
                inputStreamReader.close();
                bufferedReader.close();
                return null;
            } catch (Throwable th) {
                if (openRawResource != null) {
                    try {
                        openRawResource.close();
                    } catch (IOException e3) {
                        throw th;
                    }
                }
                inputStreamReader.close();
                bufferedReader.close();
                throw th;
            }
        }
        if (openRawResource != null) {
            try {
                openRawResource.close();
            } catch (IOException e4) {
            }
        }
        inputStreamReader.close();
        bufferedReader.close();
        return sb.toString();
    }
}
