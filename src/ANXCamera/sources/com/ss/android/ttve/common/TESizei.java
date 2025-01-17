package com.ss.android.ttve.common;

import com.android.camera.Util;

public class TESizei {
    public int height = 1280;
    public int width = Util.LIMIT_SURFACE_WIDTH;

    public TESizei() {
    }

    public TESizei(int i, int i2) {
        this.width = i;
        this.height = i2;
    }

    public boolean equals(Object obj) {
        boolean z = false;
        if (!(obj instanceof TESizei)) {
            return false;
        }
        TESizei tESizei = (TESizei) obj;
        if (this.width == tESizei.width && this.height == tESizei.height) {
            z = true;
        }
        return z;
    }

    public int hashCode() {
        return 1 + (65537 * this.width) + this.height;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(this.width);
        sb.append("x");
        sb.append(this.height);
        return sb.toString();
    }
}
