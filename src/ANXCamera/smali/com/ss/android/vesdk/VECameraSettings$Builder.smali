.class public Lcom/ss/android/vesdk/VECameraSettings$Builder;
.super Ljava/lang/Object;
.source "VECameraSettings.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/android/vesdk/VECameraSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private mExportCameraSettings:Lcom/ss/android/vesdk/VECameraSettings;


# direct methods
.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/ss/android/vesdk/VECameraSettings;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/ss/android/vesdk/VECameraSettings;-><init>(Lcom/ss/android/vesdk/VECameraSettings$1;)V

    iput-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings$Builder;->mExportCameraSettings:Lcom/ss/android/vesdk/VECameraSettings;

    return-void
.end method

.method public constructor <init>(Lcom/ss/android/vesdk/VECameraSettings;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/ss/android/vesdk/VECameraSettings$Builder;->mExportCameraSettings:Lcom/ss/android/vesdk/VECameraSettings;

    return-void
.end method

.method private getCameraHwLevelFromCloudConfig()Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;
    .locals 3

    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    iget v0, v0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mRecordCameraCompatLevel:I

    packed-switch v0, :pswitch_data_0

    sget-object v0, Lcom/ss/android/vesdk/VECameraSettings;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Fetch unexpected cameraLevel = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    iget v2, v2, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mRecordCameraCompatLevel:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings$Builder;->mExportCameraSettings:Lcom/ss/android/vesdk/VECameraSettings;

    invoke-static {v0}, Lcom/ss/android/vesdk/VECameraSettings;->access$500(Lcom/ss/android/vesdk/VECameraSettings;)Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;

    move-result-object v0

    return-object v0

    :pswitch_0
    sget-object v0, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;->CAMERA_HW_LEVEL_LEVEL_3:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;

    return-object v0

    :pswitch_1
    sget-object v0, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;->CAMERA_HW_LEVEL_FULL:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;

    return-object v0

    :pswitch_2
    sget-object v0, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;->CAMERA_HW_LEVEL_LIMITED:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;

    return-object v0

    :pswitch_3
    sget-object v0, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;->CAMERA_HW_LEVEL_LEGACY:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;

    return-object v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private getCameraTypeFromCloudConfig()Lcom/ss/android/vesdk/VECameraSettings$CAMERA_TYPE;
    .locals 3

    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    iget v0, v0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mRecordCameraType:I

    packed-switch v0, :pswitch_data_0

    sget-object v0, Lcom/ss/android/vesdk/VECameraSettings;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Fetch unexpected cameraType = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    iget v2, v2, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mRecordCameraType:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings$Builder;->mExportCameraSettings:Lcom/ss/android/vesdk/VECameraSettings;

    invoke-static {v0}, Lcom/ss/android/vesdk/VECameraSettings;->access$200(Lcom/ss/android/vesdk/VECameraSettings;)Lcom/ss/android/vesdk/VECameraSettings$CAMERA_TYPE;

    move-result-object v0

    return-object v0

    :pswitch_0
    sget-object v0, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_TYPE;->TYPE2:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_TYPE;

    return-object v0

    :pswitch_1
    sget-object v0, Lcom/ss/android/vesdk/VECameraSettings$CAMERA_TYPE;->TYPE1:Lcom/ss/android/vesdk/VECameraSettings$CAMERA_TYPE;

    return-object v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public build()Lcom/ss/android/vesdk/VECameraSettings;
    .locals 1

    iget-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings$Builder;->mExportCameraSettings:Lcom/ss/android/vesdk/VECameraSettings;

    return-object v0
.end method

.method public overrideWithCloudConfig()Lcom/ss/android/vesdk/VECameraSettings$Builder;
    .locals 4

    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    if-nez v0, :cond_0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Override with Cloud Configs failed. CloudConfig == null"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    iget-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings$Builder;->mExportCameraSettings:Lcom/ss/android/vesdk/VECameraSettings;

    invoke-direct {p0}, Lcom/ss/android/vesdk/VECameraSettings$Builder;->getCameraTypeFromCloudConfig()Lcom/ss/android/vesdk/VECameraSettings$CAMERA_TYPE;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ss/android/vesdk/VECameraSettings;->access$202(Lcom/ss/android/vesdk/VECameraSettings;Lcom/ss/android/vesdk/VECameraSettings$CAMERA_TYPE;)Lcom/ss/android/vesdk/VECameraSettings$CAMERA_TYPE;

    iget-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings$Builder;->mExportCameraSettings:Lcom/ss/android/vesdk/VECameraSettings;

    invoke-direct {p0}, Lcom/ss/android/vesdk/VECameraSettings$Builder;->getCameraHwLevelFromCloudConfig()Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ss/android/vesdk/VECameraSettings;->access$502(Lcom/ss/android/vesdk/VECameraSettings;Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;)Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;

    iget-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings$Builder;->mExportCameraSettings:Lcom/ss/android/vesdk/VECameraSettings;

    new-instance v1, Lcom/ss/android/vesdk/VESize;

    sget-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    iget v2, v2, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mCameraPreviewResolutionWidth:I

    sget-object v3, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    iget v3, v3, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mCameraPreviewResolutionHeight:I

    invoke-direct {v1, v2, v3}, Lcom/ss/android/vesdk/VESize;-><init>(II)V

    invoke-static {v0, v1}, Lcom/ss/android/vesdk/VECameraSettings;->access$302(Lcom/ss/android/vesdk/VECameraSettings;Lcom/ss/android/vesdk/VESize;)Lcom/ss/android/vesdk/VESize;

    return-object p0
.end method

.method public setCameraFacing(Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FACING_ID;)Lcom/ss/android/vesdk/VECameraSettings$Builder;
    .locals 1
    .param p1    # Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FACING_ID;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings$Builder;->mExportCameraSettings:Lcom/ss/android/vesdk/VECameraSettings;

    invoke-static {v0, p1}, Lcom/ss/android/vesdk/VECameraSettings;->access$102(Lcom/ss/android/vesdk/VECameraSettings;Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FACING_ID;)Lcom/ss/android/vesdk/VECameraSettings$CAMERA_FACING_ID;

    return-object p0
.end method

.method public setCameraType(Lcom/ss/android/vesdk/VECameraSettings$CAMERA_TYPE;)Lcom/ss/android/vesdk/VECameraSettings$Builder;
    .locals 1
    .param p1    # Lcom/ss/android/vesdk/VECameraSettings$CAMERA_TYPE;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings$Builder;->mExportCameraSettings:Lcom/ss/android/vesdk/VECameraSettings;

    invoke-static {v0, p1}, Lcom/ss/android/vesdk/VECameraSettings;->access$202(Lcom/ss/android/vesdk/VECameraSettings;Lcom/ss/android/vesdk/VECameraSettings$CAMERA_TYPE;)Lcom/ss/android/vesdk/VECameraSettings$CAMERA_TYPE;

    return-object p0
.end method

.method public setCaptureSize(II)Lcom/ss/android/vesdk/VECameraSettings$Builder;
    .locals 2

    iget-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings$Builder;->mExportCameraSettings:Lcom/ss/android/vesdk/VECameraSettings;

    new-instance v1, Lcom/ss/android/vesdk/VESize;

    invoke-direct {v1, p1, p2}, Lcom/ss/android/vesdk/VESize;-><init>(II)V

    invoke-static {v0, v1}, Lcom/ss/android/vesdk/VECameraSettings;->access$902(Lcom/ss/android/vesdk/VECameraSettings;Lcom/ss/android/vesdk/VESize;)Lcom/ss/android/vesdk/VESize;

    return-object p0
.end method

.method public setFps(I)Lcom/ss/android/vesdk/VECameraSettings$Builder;
    .locals 1

    iget-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings$Builder;->mExportCameraSettings:Lcom/ss/android/vesdk/VECameraSettings;

    invoke-static {v0, p1}, Lcom/ss/android/vesdk/VECameraSettings;->access$402(Lcom/ss/android/vesdk/VECameraSettings;I)I

    return-object p0
.end method

.method public setFpsRange([I)Lcom/ss/android/vesdk/VECameraSettings$Builder;
    .locals 1
    .param p1    # [I
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings$Builder;->mExportCameraSettings:Lcom/ss/android/vesdk/VECameraSettings;

    invoke-static {v0, p1}, Lcom/ss/android/vesdk/VECameraSettings;->access$602(Lcom/ss/android/vesdk/VECameraSettings;[I)[I

    return-object p0
.end method

.method public setHwLevel(Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;)Lcom/ss/android/vesdk/VECameraSettings$Builder;
    .locals 1
    .param p1    # Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings$Builder;->mExportCameraSettings:Lcom/ss/android/vesdk/VECameraSettings;

    invoke-static {v0, p1}, Lcom/ss/android/vesdk/VECameraSettings;->access$502(Lcom/ss/android/vesdk/VECameraSettings;Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;)Lcom/ss/android/vesdk/VECameraSettings$CAMERA_HW_LEVEL;

    return-object p0
.end method

.method public setOptionFlag(B)Lcom/ss/android/vesdk/VECameraSettings$Builder;
    .locals 1

    iget-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings$Builder;->mExportCameraSettings:Lcom/ss/android/vesdk/VECameraSettings;

    invoke-static {v0, p1}, Lcom/ss/android/vesdk/VECameraSettings;->access$802(Lcom/ss/android/vesdk/VECameraSettings;B)B

    return-object p0
.end method

.method public setOutPutMode(Lcom/ss/android/vesdk/VECameraSettings$CAMERA_OUTPUT_MODE;)Lcom/ss/android/vesdk/VECameraSettings$Builder;
    .locals 1

    iget-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings$Builder;->mExportCameraSettings:Lcom/ss/android/vesdk/VECameraSettings;

    invoke-static {v0, p1}, Lcom/ss/android/vesdk/VECameraSettings;->access$1002(Lcom/ss/android/vesdk/VECameraSettings;Lcom/ss/android/vesdk/VECameraSettings$CAMERA_OUTPUT_MODE;)Lcom/ss/android/vesdk/VECameraSettings$CAMERA_OUTPUT_MODE;

    return-object p0
.end method

.method public setPreviewSize(II)Lcom/ss/android/vesdk/VECameraSettings$Builder;
    .locals 2

    iget-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings$Builder;->mExportCameraSettings:Lcom/ss/android/vesdk/VECameraSettings;

    new-instance v1, Lcom/ss/android/vesdk/VESize;

    invoke-direct {v1, p1, p2}, Lcom/ss/android/vesdk/VESize;-><init>(II)V

    invoke-static {v0, v1}, Lcom/ss/android/vesdk/VECameraSettings;->access$302(Lcom/ss/android/vesdk/VECameraSettings;Lcom/ss/android/vesdk/VESize;)Lcom/ss/android/vesdk/VESize;

    return-object p0
.end method

.method public setSceneMode(Ljava/lang/String;)Lcom/ss/android/vesdk/VECameraSettings$Builder;
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/ss/android/vesdk/VECameraSettings$Builder;->mExportCameraSettings:Lcom/ss/android/vesdk/VECameraSettings;

    invoke-static {v0, p1}, Lcom/ss/android/vesdk/VECameraSettings;->access$702(Lcom/ss/android/vesdk/VECameraSettings;Ljava/lang/String;)Ljava/lang/String;

    return-object p0
.end method
