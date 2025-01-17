package com.android.camera.module.loader;

import com.android.camera.CameraSettings;
import com.android.camera.CameraSize;
import com.android.camera.constant.GlobalConstant;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.config.DataItemConfig;
import com.android.camera.data.data.global.DataItemGlobal;
import com.android.camera.data.data.runing.DataItemRunning;
import com.android.camera.module.BaseModule;
import io.reactivex.Scheduler;
import io.reactivex.annotations.NonNull;

public class FunctionDataSetup extends Func1Base<BaseModule, BaseModule> {
    public FunctionDataSetup(int i) {
        super(i);
    }

    public NullHolder<BaseModule> apply(@NonNull NullHolder<BaseModule> nullHolder) throws Exception {
        if (!nullHolder.isPresent()) {
            return nullHolder;
        }
        BaseModule baseModule = (BaseModule) nullHolder.get();
        if (baseModule.isDeparted()) {
            return NullHolder.ofNullable(baseModule, 225);
        }
        if (!baseModule.isCreated()) {
            return nullHolder;
        }
        DataItemGlobal dataItemGlobal = DataRepository.dataItemGlobal();
        DataItemConfig dataItemConfig = DataRepository.dataItemConfig();
        DataItemRunning dataItemRunning = DataRepository.dataItemRunning();
        dataItemConfig.reInitComponent(this.mTargetMode, baseModule.getBogusCameraId(), baseModule.getCameraCapabilities());
        dataItemRunning.reInitComponent(this.mTargetMode, baseModule.getBogusCameraId(), baseModule.getCameraCapabilities());
        dataItemGlobal.reInit();
        CameraSize previewSize = baseModule.getPreviewSize();
        DataRepository.dataItemRunning().setUiStyle(CameraSettings.getUIStyleByPreview(previewSize.width, previewSize.height));
        return nullHolder;
    }

    public Scheduler getWorkThread() {
        return GlobalConstant.sCameraSetupScheduler;
    }
}
