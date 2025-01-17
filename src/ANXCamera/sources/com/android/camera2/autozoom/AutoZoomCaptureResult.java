package com.android.camera2.autozoom;

import android.hardware.camera2.CaptureResult;
import android.hardware.camera2.CaptureResult.Key;
import android.util.Log;
import com.android.camera2.vendortag.CaptureResultVendorTags;
import com.android.camera2.vendortag.VendorTag;
import com.android.camera2.vendortag.VendorTagHelper;

public class AutoZoomCaptureResult {
    private static final String TAG = AutoZoomCaptureResult.class.getSimpleName();
    private int[] mAutoZoomActiveObjects;
    private boolean mAutoZoomAvailable = true;
    private float[] mAutoZoomBounds;
    private float[] mAutoZoomObjectBoundsStabilized;
    private float[] mAutoZoomObjectBoundsZoomed;
    private int[] mAutoZoomPausedObjects;
    private int[] mAutoZoomSelectedObjects;
    private int mAutoZoomStatus;
    private float[] mAutoZoomTargetBoundsStabilized;
    private float[] mAutoZoomTargetBoundsZoomed;

    public AutoZoomCaptureResult(CaptureResult captureResult) {
        if (this.mAutoZoomAvailable) {
            try {
                Integer num = (Integer) getAutoZoomResult(CaptureResultVendorTags.AUTOZOOM_STATUS, captureResult);
                this.mAutoZoomStatus = num == null ? 0 : num.intValue();
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("autozoom status is ");
                sb.append(this.mAutoZoomStatus);
                Log.i(str, sb.toString());
                this.mAutoZoomBounds = (float[]) getAutoZoomResult(CaptureResultVendorTags.AUTOZOOM_BOUNDS, captureResult);
                String str2 = TAG;
                StringBuilder sb2 = new StringBuilder();
                sb2.append("autoZoomBound is ");
                sb2.append(this.mAutoZoomBounds);
                Log.i(str2, sb2.toString());
                if (this.mAutoZoomBounds != null) {
                    String str3 = TAG;
                    StringBuilder sb3 = new StringBuilder();
                    sb3.append("bounds left ");
                    sb3.append(this.mAutoZoomBounds[0]);
                    sb3.append(" top ");
                    sb3.append(this.mAutoZoomBounds[1]);
                    sb3.append(" right ");
                    sb3.append(this.mAutoZoomBounds[2]);
                    sb3.append(" bottom ");
                    sb3.append(this.mAutoZoomBounds[3]);
                    Log.i(str3, sb3.toString());
                }
                this.mAutoZoomTargetBoundsStabilized = (float[]) getAutoZoomResult(CaptureResultVendorTags.AUTOZOOM_TARGET_BOUNDS_STABILIZED, captureResult);
                this.mAutoZoomTargetBoundsZoomed = (float[]) getAutoZoomResult(CaptureResultVendorTags.AUTOZOOM_TARGET_BOUNDS_ZOOMED, captureResult);
                this.mAutoZoomActiveObjects = (int[]) getAutoZoomResult(CaptureResultVendorTags.AUTOZOOM_ACTIVE_OBJECTS, captureResult);
                this.mAutoZoomSelectedObjects = (int[]) getAutoZoomResult(CaptureResultVendorTags.AUTOZOOM_SELECTED_OBJECTS, captureResult);
                this.mAutoZoomPausedObjects = (int[]) getAutoZoomResult(CaptureResultVendorTags.AUTOZOOM_PAUSED_OBJECTS, captureResult);
                this.mAutoZoomObjectBoundsStabilized = (float[]) getAutoZoomResult(CaptureResultVendorTags.AUTOZOOM_OBJECT_BOUNDS_STABILIZED, captureResult);
                this.mAutoZoomObjectBoundsZoomed = (float[]) getAutoZoomResult(CaptureResultVendorTags.AUTOZOOM_OBJECT_BOUNDS_ZOOMED, captureResult);
            } catch (Exception e) {
                this.mAutoZoomAvailable = false;
                Log.e(TAG, "Could not read AutoZoom tags from CaptureResult. This instance of Device will not try to read AutoZoom tags from subsequent results", e);
            }
        }
    }

    private <T> T getAutoZoomResult(VendorTag<Key<T>> vendorTag, CaptureResult captureResult) {
        return VendorTagHelper.getValueQuietly(captureResult, vendorTag);
    }

    public int[] getAutoZoomActiveObjects() {
        return this.mAutoZoomActiveObjects;
    }

    public float[] getAutoZoomBounds() {
        return this.mAutoZoomBounds;
    }

    public float[] getAutoZoomObjectBoundsStabilized() {
        return this.mAutoZoomObjectBoundsStabilized;
    }

    public float[] getAutoZoomObjectBoundsZoomed() {
        return this.mAutoZoomObjectBoundsZoomed;
    }

    public int[] getAutoZoomPausedObjects() {
        return this.mAutoZoomPausedObjects;
    }

    public int[] getAutoZoomSelectedObjects() {
        return this.mAutoZoomSelectedObjects;
    }

    public int getAutoZoomStatus() {
        return this.mAutoZoomStatus;
    }

    public float[] getAutoZoomTargetBoundsStabilized() {
        return this.mAutoZoomTargetBoundsStabilized;
    }

    public float[] getAutoZoomTargetBoundsZoomed() {
        return this.mAutoZoomTargetBoundsZoomed;
    }
}
