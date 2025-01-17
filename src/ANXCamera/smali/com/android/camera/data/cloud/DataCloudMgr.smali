.class public Lcom/android/camera/data/cloud/DataCloudMgr;
.super Ljava/lang/Object;
.source "DataCloudMgr.java"

# interfaces
.implements Lcom/android/camera/data/cloud/DataCloud$CloudManager;


# static fields
.field private static final CLOUD_DATA_MODULE_NAME:Ljava/lang/String; = "camera_settings_v3"

.field private static final CLOUD_DATA_UPDATE_INTERVAL:J = 0x5265c00L

.field private static final FEA_SENSI_WORD:Ljava/lang/String; = "pref_senstive_words"

.field private static final KEY_CLOUD_DATA_DEVICE_VERSION:Ljava/lang/String; = "cloud_data_device_version"

.field private static final KEY_CLOUD_DATA_LAST_UPDATE:Ljava/lang/String; = "cloud_data_last_update"

.field private static final KEY_CLOUD_DATA_VERSION:Ljava/lang/String; = "cloud_data_version"

.field private static final TAG:Ljava/lang/String; = "DataCloudMgr"

.field private static final VALUE:Ljava/lang/String; = "value"

.field private static final VERSION:Ljava/lang/String; = "version"


# instance fields
.field private mDataCloudFeatureController:Lcom/android/camera/data/cloud/DataCloudFeatureController;

.field private mDataCloudGlobal:Lcom/android/camera/data/cloud/DataCloudItemGlobal;

.field private mDataCloudItemConfigs:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lcom/android/camera/data/cloud/DataCloudItemConfig;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/android/camera/data/cloud/DataCloudItemGlobal;

    invoke-direct {v0}, Lcom/android/camera/data/cloud/DataCloudItemGlobal;-><init>()V

    iput-object v0, p0, Lcom/android/camera/data/cloud/DataCloudMgr;->mDataCloudGlobal:Lcom/android/camera/data/cloud/DataCloudItemGlobal;

    new-instance v0, Landroid/util/SparseArray;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Landroid/util/SparseArray;-><init>(I)V

    iput-object v0, p0, Lcom/android/camera/data/cloud/DataCloudMgr;->mDataCloudItemConfigs:Landroid/util/SparseArray;

    return-void
.end method

.method static synthetic access$000(Lcom/android/camera/data/cloud/DataCloudMgr;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/camera/data/cloud/DataCloudMgr;->fillPreference()V

    return-void
.end method

.method private static checkLastUpdateTimeFormat()V
    .locals 4

    :try_start_0
    invoke-static {}, Lcom/android/camera/data/cloud/DataCloudMgr;->getCloudDataLastUpdateTime()J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    const-string v0, "DataCloudMgr"

    const-string v1, "get cloud_data_last_update long value failed, try String type"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :try_start_1
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    const-string v1, "cloud_data_last_update"

    const-string v2, "0"

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    nop

    const-string v1, "DataCloudMgr"

    const-string/jumbo v2, "try to convert the string value type to long for field [cloud_data_last_update]"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-wide/16 v0, 0x0

    goto :goto_0

    :cond_0
    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0

    :goto_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v2

    const-string v3, "cloud_data_last_update"

    invoke-interface {v2, v3}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->remove(Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v2

    const-string v3, "cloud_data_last_update"

    invoke-interface {v2, v3, v0, v1}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putLong(Ljava/lang/String;J)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->commit()Z

    :goto_1
    return-void

    :catch_1
    move-exception v0

    const-string v0, "DataCloudMgr"

    const-string v1, "get cloud_data_last_update string value failed"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method private fillPreference()V
    .locals 10

    nop

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/camera/data/cloud/DataCloudMgr;->provideDataCloudConfig(I)Lcom/android/camera/data/cloud/DataCloud$CloudItem;

    move-result-object v1

    nop

    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Lcom/android/camera/data/cloud/DataCloudMgr;->provideDataCloudConfig(I)Lcom/android/camera/data/cloud/DataCloud$CloudItem;

    move-result-object v3

    invoke-direct {p0}, Lcom/android/camera/data/cloud/DataCloudMgr;->getCloudSensitiveWords()V

    const-string v4, "camera_settings_v3"

    const-string/jumbo v5, "version"

    const/4 v6, 0x0

    invoke-static {v4, v5, v6}, Lcom/android/camera/data/cloud/DataCloudMgr;->getCloudDataString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {}, Lcom/android/camera/data/cloud/DataCloudMgr;->getCloudDataCommonVersion()Ljava/lang/String;

    move-result-object v5

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "camera_settings_v3_"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v8, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    const-string/jumbo v8, "version"

    invoke-static {v7, v8, v6}, Lcom/android/camera/data/cloud/DataCloudMgr;->getCloudDataString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {}, Lcom/android/camera/data/cloud/DataCloudMgr;->getCloudDataDeviceVersion()Ljava/lang/String;

    move-result-object v7

    iget-object v8, p0, Lcom/android/camera/data/cloud/DataCloudMgr;->mDataCloudGlobal:Lcom/android/camera/data/cloud/DataCloudItemGlobal;

    invoke-virtual {v8, v2}, Lcom/android/camera/data/cloud/DataCloudItemGlobal;->setReady(Z)V

    invoke-virtual {p0}, Lcom/android/camera/data/cloud/DataCloudMgr;->DataCloudFeature()Lcom/android/camera/data/cloud/DataCloud$CloudFeature;

    move-result-object v8

    invoke-interface {v8, v2}, Lcom/android/camera/data/cloud/DataCloud$CloudFeature;->setReady(Z)V

    invoke-interface {v1, v2}, Lcom/android/camera/data/cloud/DataCloud$CloudItem;->setReady(Z)V

    invoke-interface {v3, v2}, Lcom/android/camera/data/cloud/DataCloud$CloudItem;->setReady(Z)V

    if-eqz v4, :cond_0

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    :cond_0
    if-eqz v6, :cond_2

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    :cond_1
    iget-object v2, p0, Lcom/android/camera/data/cloud/DataCloudMgr;->mDataCloudGlobal:Lcom/android/camera/data/cloud/DataCloudItemGlobal;

    invoke-virtual {v2}, Lcom/android/camera/data/cloud/DataCloudItemGlobal;->editor()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-virtual {p0}, Lcom/android/camera/data/cloud/DataCloudMgr;->DataCloudFeature()Lcom/android/camera/data/cloud/DataCloud$CloudFeature;

    move-result-object v2

    invoke-interface {v2}, Lcom/android/camera/data/cloud/DataCloud$CloudFeature;->editor()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-interface {v1}, Lcom/android/camera/data/cloud/DataCloud$CloudItem;->editor()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-interface {v3}, Lcom/android/camera/data/cloud/DataCloud$CloudItem;->editor()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->apply()V

    const-string v2, "DataCloudMgr"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "updateSettingsFromCloudData common version "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, " -> "

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v2, v5}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {v4}, Lcom/android/camera/data/cloud/DataCloudMgr;->setCloudDataCommonVersion(Ljava/lang/String;)V

    const-string v2, "camera_settings_v3"

    invoke-direct {p0, v2}, Lcom/android/camera/data/cloud/DataCloudMgr;->updateSettingsFromCloudData(Ljava/lang/String;)V

    const-string v2, "DataCloudMgr"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "updateSettingsFromCloudData device version "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, " -> "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {v6}, Lcom/android/camera/data/cloud/DataCloudMgr;->setCloudDataDeviceVersion(Ljava/lang/String;)V

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "camera_settings_v3_"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v4, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/android/camera/data/cloud/DataCloudMgr;->updateSettingsFromCloudData(Ljava/lang/String;)V

    :cond_2
    iget-object v2, p0, Lcom/android/camera/data/cloud/DataCloudMgr;->mDataCloudGlobal:Lcom/android/camera/data/cloud/DataCloudItemGlobal;

    invoke-virtual {v2, v0}, Lcom/android/camera/data/cloud/DataCloudItemGlobal;->setReady(Z)V

    invoke-virtual {p0}, Lcom/android/camera/data/cloud/DataCloudMgr;->DataCloudFeature()Lcom/android/camera/data/cloud/DataCloud$CloudFeature;

    move-result-object v2

    invoke-interface {v2, v0}, Lcom/android/camera/data/cloud/DataCloud$CloudFeature;->setReady(Z)V

    invoke-interface {v1, v0}, Lcom/android/camera/data/cloud/DataCloud$CloudItem;->setReady(Z)V

    invoke-interface {v3, v0}, Lcom/android/camera/data/cloud/DataCloud$CloudItem;->setReady(Z)V

    return-void
.end method

.method private static getCloudDataCommonVersion()Ljava/lang/String;
    .locals 3

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    const-string v1, "cloud_data_version"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static getCloudDataDeviceVersion()Ljava/lang/String;
    .locals 3

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    const-string v1, "cloud_data_device_version"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static final getCloudDataInt(Ljava/lang/String;Ljava/lang/String;I)I
    .locals 1

    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-static {v0, p0, p1, p2}, Landroid/provider/MiuiSettings$SettingsCloudData;->getCloudDataInt(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;I)I

    move-result p0

    return p0
.end method

.method private static getCloudDataLastUpdateTime()J
    .locals 4

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    const-string v1, "cloud_data_last_update"

    const-wide/16 v2, 0x0

    invoke-virtual {v0, v1, v2, v3}, Lcom/android/camera/data/data/global/DataItemGlobal;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0
.end method

.method private static final getCloudDataString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    # invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    # move-result-object v0

    # invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    # move-result-object v0

    # invoke-static {v0, p0, p1, p2}, Landroid/provider/MiuiSettings$SettingsCloudData;->getCloudDataString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    # move-result-object p0

    # return-object p0

    
    const-string/jumbo v0, "getCloudDataString"
    
    invoke-static {v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-object p2
.end method

.method private getCloudSensitiveWords()V
    .locals 3

    const-string v0, "camera_settings_v3"

    const-string v1, "pref_senstive_words"

    const-string v2, ""

    invoke-static {v0, v1, v2}, Lcom/android/camera/data/cloud/DataCloudMgr;->getCloudDataString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    return-void

    :cond_0
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string/jumbo v0, "value"

    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v2, "version"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v1

    invoke-direct {p0, v1, v0}, Lcom/android/camera/data/cloud/DataCloudMgr;->updateSensitiveWords(ILjava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    :goto_0
    return-void
.end method

.method private static setCloudDataCommonVersion(Ljava/lang/String;)V
    .locals 2

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    const-string v1, "cloud_data_version"

    invoke-interface {v0, v1, p0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putString(Ljava/lang/String;Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object p0

    invoke-interface {p0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    return-void
.end method

.method private static setCloudDataDeviceVersion(Ljava/lang/String;)V
    .locals 2

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    const-string v1, "cloud_data_device_version"

    invoke-interface {v0, v1, p0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putString(Ljava/lang/String;Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object p0

    invoke-interface {p0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    return-void
.end method

.method private static setCloudDataLastUpdateTime(J)V
    .locals 2

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    const-string v1, "cloud_data_last_update"

    invoke-interface {v0, v1, p0, p1}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putLong(Ljava/lang/String;J)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object p0

    invoke-interface {p0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    return-void
.end method

.method private updateSensitiveWords(ILjava/lang/String;)V
    .locals 2

    invoke-static {p2}, Lcom/android/camera/CameraSettings;->getKeyCloudSenstiveWordsPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    new-instance v0, Ljava/io/File;

    const-string v1, "/data/data/com.android.camera/sensi_words"

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lcom/android/camera/CameraSettings;->getLocalWordsVersion()I

    move-result v1

    if-gt p1, v1, :cond_0

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_1

    if-eqz p1, :cond_1

    :cond_0
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Application;

    invoke-static {v0}, Lcom/android/camera/network/util/NetworkUtils;->bind(Landroid/app/Application;)V

    invoke-static {}, Lcom/android/camera/network/util/NetworkUtils;->isNetworkConnected()Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "/data/data/com.android.camera/"

    invoke-static {p2, v0}, Lcom/android/camera/sensitive/SensitiveFilter;->loadSensitiveWords(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_1

    invoke-static {p1}, Lcom/android/camera/CameraSettings;->setLocalWordsVersion(I)V

    :cond_1
    return-void
.end method

.method private updateSettingsFromCloudData(Ljava/lang/String;)V
    .locals 10

    :try_start_0
    const-string v0, "content"

    const/4 v1, 0x0

    invoke-static {p1, v0, v1}, Lcom/android/camera/data/cloud/DataCloudMgr;->getCloudDataString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    const/4 v3, 0x0

    if-nez v2, :cond_7

    new-instance v2, Lorg/json/JSONArray;

    invoke-direct {v2, v0}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    move v0, v3

    :goto_0
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-ge v0, v4, :cond_7

    iget-object v4, p0, Lcom/android/camera/data/cloud/DataCloudMgr;->mDataCloudGlobal:Lcom/android/camera/data/cloud/DataCloudItemGlobal;

    invoke-virtual {v2, v0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v5

    const-string/jumbo v6, "type"

    invoke-virtual {v5, v6}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1

    const-string/jumbo v6, "type"

    invoke-virtual {v5, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v7, "front"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    iget-object v4, p0, Lcom/android/camera/data/cloud/DataCloudMgr;->mDataCloudItemConfigs:Landroid/util/SparseArray;

    const/4 v6, 0x1

    invoke-virtual {v4, v6}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/camera/data/cloud/DataCloudItemBase;

    goto :goto_1

    :cond_0
    const-string v7, "back"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    iget-object v4, p0, Lcom/android/camera/data/cloud/DataCloudMgr;->mDataCloudItemConfigs:Landroid/util/SparseArray;

    invoke-virtual {v4, v3}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/camera/data/cloud/DataCloudItemBase;

    :cond_1
    :goto_1
    const-string v6, "key"

    invoke-virtual {v5, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4}, Lcom/android/camera/data/cloud/DataCloudItemBase;->editor()Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string/jumbo v7, "value"

    invoke-virtual {v5, v7}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    instance-of v7, v5, Ljava/lang/Boolean;

    if-eqz v7, :cond_2

    check-cast v5, Ljava/lang/Boolean;

    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    invoke-interface {v4, v6, v5}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    goto :goto_2

    :cond_2
    instance-of v7, v5, Ljava/lang/Integer;

    if-eqz v7, :cond_3

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-interface {v4, v6, v5}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    goto :goto_2

    :cond_3
    instance-of v7, v5, Ljava/lang/Long;

    if-eqz v7, :cond_4

    check-cast v5, Ljava/lang/Long;

    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v7

    invoke-interface {v4, v6, v7, v8}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    goto :goto_2

    :cond_4
    instance-of v7, v5, Ljava/lang/Float;

    if-eqz v7, :cond_5

    check-cast v5, Ljava/lang/Float;

    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    move-result v5

    invoke-interface {v4, v6, v5}, Landroid/content/SharedPreferences$Editor;->putFloat(Ljava/lang/String;F)Landroid/content/SharedPreferences$Editor;

    goto :goto_2

    :cond_5
    instance-of v7, v5, Ljava/lang/String;

    if-eqz v7, :cond_6

    check-cast v5, Ljava/lang/String;

    invoke-interface {v4, v6, v5}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    goto :goto_2

    :cond_6
    const-string v7, "DataCloudMgr"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Wrong camera setting type "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, ": "

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v7, v5}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_2
    invoke-interface {v4}, Landroid/content/SharedPreferences$Editor;->apply()V

    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_0

    :cond_7
    const-string v0, "feature"

    invoke-static {p1, v0, v1}, Lcom/android/camera/data/cloud/DataCloudMgr;->getCloudDataString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_9

    invoke-virtual {p0}, Lcom/android/camera/data/cloud/DataCloudMgr;->DataCloudFeature()Lcom/android/camera/data/cloud/DataCloud$CloudFeature;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/cloud/DataCloud$CloudFeature;->editor()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1, p1}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    :goto_3
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result p1

    if-ge v3, p1, :cond_8

    invoke-virtual {v1, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object p1

    const-string v2, "key"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v4, "value"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result p1

    invoke-interface {v0, v2, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    :cond_8
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_9
    goto :goto_4

    :catch_0
    move-exception p1

    const-string v0, "DataCloudMgr"

    const-string v1, "JSONException when get camera settings !"

    invoke-static {v0, v1, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_4
    return-void
.end method


# virtual methods
.method public DataCloudFeature()Lcom/android/camera/data/cloud/DataCloud$CloudFeature;
    .locals 1

    iget-object v0, p0, Lcom/android/camera/data/cloud/DataCloudMgr;->mDataCloudFeatureController:Lcom/android/camera/data/cloud/DataCloudFeatureController;

    if-nez v0, :cond_0

    new-instance v0, Lcom/android/camera/data/cloud/DataCloudFeatureController;

    invoke-direct {v0}, Lcom/android/camera/data/cloud/DataCloudFeatureController;-><init>()V

    iput-object v0, p0, Lcom/android/camera/data/cloud/DataCloudMgr;->mDataCloudFeatureController:Lcom/android/camera/data/cloud/DataCloudFeatureController;

    :cond_0
    iget-object v0, p0, Lcom/android/camera/data/cloud/DataCloudMgr;->mDataCloudFeatureController:Lcom/android/camera/data/cloud/DataCloudFeatureController;

    return-object v0
.end method

.method public fillCloudValues()V
    .locals 6

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-static {}, Lcom/android/camera/data/cloud/DataCloudMgr;->checkLastUpdateTimeFormat()V

    invoke-static {}, Lcom/android/camera/data/cloud/DataCloudMgr;->getCloudDataLastUpdateTime()J

    move-result-wide v2

    sub-long v2, v0, v2

    const-wide/32 v4, 0x5265c00

    cmp-long v2, v2, v4

    if-gez v2, :cond_0

    iget-object v0, p0, Lcom/android/camera/data/cloud/DataCloudMgr;->mDataCloudGlobal:Lcom/android/camera/data/cloud/DataCloudItemGlobal;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/camera/data/cloud/DataCloudItemGlobal;->setReady(Z)V

    invoke-virtual {p0}, Lcom/android/camera/data/cloud/DataCloudMgr;->DataCloudFeature()Lcom/android/camera/data/cloud/DataCloud$CloudFeature;

    move-result-object v0

    invoke-interface {v0, v1}, Lcom/android/camera/data/cloud/DataCloud$CloudFeature;->setReady(Z)V

    invoke-virtual {p0, v1}, Lcom/android/camera/data/cloud/DataCloudMgr;->provideDataCloudConfig(I)Lcom/android/camera/data/cloud/DataCloud$CloudItem;

    move-result-object v0

    invoke-interface {v0, v1}, Lcom/android/camera/data/cloud/DataCloud$CloudItem;->setReady(Z)V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/camera/data/cloud/DataCloudMgr;->provideDataCloudConfig(I)Lcom/android/camera/data/cloud/DataCloud$CloudItem;

    move-result-object v0

    invoke-interface {v0, v1}, Lcom/android/camera/data/cloud/DataCloud$CloudItem;->setReady(Z)V

    return-void

    :cond_0
    invoke-static {v0, v1}, Lcom/android/camera/data/cloud/DataCloudMgr;->setCloudDataLastUpdateTime(J)V

    new-instance v0, Lcom/android/camera/data/cloud/DataCloudMgr$1;

    invoke-direct {v0, p0}, Lcom/android/camera/data/cloud/DataCloudMgr$1;-><init>(Lcom/android/camera/data/cloud/DataCloudMgr;)V

    invoke-static {v0}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v0

    invoke-static {}, Lio/reactivex/schedulers/Schedulers;->io()Lio/reactivex/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/reactivex/Completable;->subscribeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Completable;

    move-result-object v0

    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/reactivex/Completable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Completable;

    move-result-object v0

    invoke-virtual {v0}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    return-void
.end method

.method public provideDataCloudConfig(I)Lcom/android/camera/data/cloud/DataCloud$CloudItem;
    .locals 2

    iget-object v0, p0, Lcom/android/camera/data/cloud/DataCloudMgr;->mDataCloudItemConfigs:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/data/cloud/DataCloudItemConfig;

    if-nez v0, :cond_0

    new-instance v0, Lcom/android/camera/data/cloud/DataCloudItemConfig;

    invoke-direct {v0, p1}, Lcom/android/camera/data/cloud/DataCloudItemConfig;-><init>(I)V

    iget-object v1, p0, Lcom/android/camera/data/cloud/DataCloudMgr;->mDataCloudItemConfigs:Landroid/util/SparseArray;

    invoke-virtual {v1, p1, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    :cond_0
    return-object v0
.end method

.method public provideDataCloudGlobal()Lcom/android/camera/data/cloud/DataCloud$CloudItem;
    .locals 1

    iget-object v0, p0, Lcom/android/camera/data/cloud/DataCloudMgr;->mDataCloudGlobal:Lcom/android/camera/data/cloud/DataCloudItemGlobal;

    if-nez v0, :cond_0

    new-instance v0, Lcom/android/camera/data/cloud/DataCloudItemGlobal;

    invoke-direct {v0}, Lcom/android/camera/data/cloud/DataCloudItemGlobal;-><init>()V

    iput-object v0, p0, Lcom/android/camera/data/cloud/DataCloudMgr;->mDataCloudGlobal:Lcom/android/camera/data/cloud/DataCloudItemGlobal;

    :cond_0
    iget-object v0, p0, Lcom/android/camera/data/cloud/DataCloudMgr;->mDataCloudGlobal:Lcom/android/camera/data/cloud/DataCloudItemGlobal;

    return-object v0
.end method
