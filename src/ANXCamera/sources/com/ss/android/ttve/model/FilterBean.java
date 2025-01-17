package com.ss.android.ttve.model;

public class FilterBean {
    private float mIntensity;
    private String mLeftResPath;
    private float mPosition;
    private String mRightResPath;

    public FilterBean() {
        this("", 0.0f);
    }

    public FilterBean(String str, float f) {
        this(str, str, 0.0f, f);
    }

    public FilterBean(String str, String str2, float f, float f2) {
        this.mIntensity = f2;
        this.mLeftResPath = str;
        this.mRightResPath = str2;
        this.mPosition = f;
    }

    public float getIntensity() {
        return this.mIntensity;
    }

    public String getLeftResPath() {
        return this.mLeftResPath;
    }

    public float getPosition() {
        return this.mPosition;
    }

    public String getRightResPath() {
        return this.mRightResPath;
    }

    public void setIntensity(float f) {
        this.mIntensity = f;
    }

    public void setLeftResPath(String str) {
        this.mLeftResPath = str;
    }

    public void setPosition(float f) {
        this.mPosition = f;
    }

    public void setRightResPath(String str) {
        this.mRightResPath = str;
    }
}
