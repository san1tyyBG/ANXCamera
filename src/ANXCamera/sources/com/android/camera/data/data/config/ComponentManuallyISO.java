package com.android.camera.data.data.config;

import android.annotation.TargetApi;
import android.util.Range;
import com.android.camera.CameraSettings;
import com.android.camera.R;
import com.android.camera.Util;
import com.android.camera.data.data.ComponentData;
import com.android.camera.data.data.ComponentDataItem;
import com.android.camera.log.Log;
import com.android.camera.module.loader.camera2.Camera2DataContainer;
import com.android.camera2.CameraCapabilities;
import java.util.ArrayList;
import java.util.List;

@TargetApi(21)
public class ComponentManuallyISO extends ComponentData {
    private static final String TAG = "ComponentManuallyISO";
    private ComponentDataItem[] mFullItems;

    public ComponentManuallyISO(DataItemConfig dataItemConfig) {
        super(dataItemConfig);
    }

    private ComponentDataItem[] getFullItems() {
        if (this.mFullItems != null) {
            return this.mFullItems;
        }
        this.mFullItems = new ComponentDataItem[]{new ComponentDataItem(-1, -1, R.string.pref_camera_iso_entry_auto, "0"), new ComponentDataItem(-1, -1, R.string.pref_camera_iso_entry_iso100, "100"), new ComponentDataItem(-1, -1, R.string.pref_camera_iso_entry_iso200, "200"), new ComponentDataItem(-1, -1, R.string.pref_camera_iso_entry_iso400, "400"), new ComponentDataItem(-1, -1, R.string.pref_camera_iso_entry_iso800, "800"), new ComponentDataItem(-1, -1, R.string.pref_camera_iso_entry_iso1600, "1600"), new ComponentDataItem(-1, -1, R.string.pref_camera_iso_entry_iso3200, "3200")};
        return this.mFullItems;
    }

    private List<ComponentDataItem> initItems() {
        ArrayList arrayList = new ArrayList();
        ComponentDataItem[] fullItems = getFullItems();
        arrayList.add(fullItems[0]);
        CameraCapabilities currentCameraCapabilities = Camera2DataContainer.getInstance().getCurrentCameraCapabilities();
        if (currentCameraCapabilities == null) {
            Log.w(TAG, "initItems: CameraCapabilities is null!!!");
            return arrayList;
        }
        Range isoRange = currentCameraCapabilities.getIsoRange();
        if (isoRange != null) {
            int intValue = ((Integer) isoRange.getLower()).intValue();
            int intValue2 = ((Integer) isoRange.getUpper()).intValue();
            for (int i = 1; i < fullItems.length; i++) {
                ComponentDataItem componentDataItem = fullItems[i];
                int parseInt = Integer.parseInt(componentDataItem.mValue);
                if (i == 0 || (intValue <= parseInt && parseInt <= intValue2)) {
                    arrayList.add(componentDataItem);
                }
            }
        }
        return arrayList;
    }

    /* access modifiers changed from: protected */
    public boolean checkValueValid(String str) {
        return Util.isStringValueContained((Object) str, (int) R.array.pref_camera_iso_entryvalues);
    }

    public String getComponentValue(int i) {
        String componentValue = super.getComponentValue(i);
        List items = getItems();
        if (items.isEmpty()) {
            return componentValue;
        }
        String str = ((ComponentDataItem) items.get(items.size() - 1)).mValue;
        return Integer.parseInt(componentValue) > Integer.parseInt(str) ? str : componentValue;
    }

    public String getDefaultValue(int i) {
        return "0";
    }

    public int getDisplayTitleString() {
        return R.string.pref_camera_iso_title;
    }

    public List<ComponentDataItem> getItems() {
        if (this.mItems == null) {
            this.mItems = initItems();
        }
        return this.mItems;
    }

    public String getKey(int i) {
        return CameraSettings.KEY_QC_ISO;
    }

    /* access modifiers changed from: protected */
    public void resetComponentValue(int i) {
        setComponentValue(i, getDefaultValue(i));
    }
}
