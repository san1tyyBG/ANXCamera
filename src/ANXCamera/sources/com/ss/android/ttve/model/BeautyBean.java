package com.ss.android.ttve.model;

public class BeautyBean {
    private int mBeautyFaceType;
    private String mResPath;
    private float mSmoothIntensity;
    private float mWhiteIntensity;

    public BeautyBean() {
        this(0, "", 0.0f, 0.0f);
    }

    public BeautyBean(int i, String str, float f, float f2) {
        this.mBeautyFaceType = i;
        this.mResPath = str;
        this.mSmoothIntensity = f;
        this.mWhiteIntensity = f2;
    }

    public String getResPath() {
        return this.mResPath;
    }

    public float getSmoothIntensity() {
        return this.mSmoothIntensity;
    }

    public int getType() {
        return this.mBeautyFaceType;
    }

    public float getWhiteIntensity() {
        return this.mWhiteIntensity;
    }

    public void setResPath(String str) {
        this.mResPath = str;
    }

    public void setSmoothIntensity(float f) {
        this.mSmoothIntensity = f;
    }

    public void setType(int i) {
        this.mBeautyFaceType = i;
    }

    public void setWhiteIntensity(float f) {
        this.mWhiteIntensity = f;
    }
}
