.class public Lcom/android/camera/panorama/SensorFusion;
.super Ljava/lang/Object;
.source "SensorFusion.java"

# interfaces
.implements Landroid/hardware/SensorEventListener;


# static fields
.field public static final GYRO_CALIBRATED:I = 0x0

.field public static final GYRO_UNCALIBRATED:I = 0x1

.field private static final LOG_TAG:Ljava/lang/String; = "SensorFusion"

.field private static final MAX_DATA_NUM:I = 0x200

.field public static final MODE_USE_ACCELEROMETER_AND_MAGNETIC_FIELD:I = 0x3

.field public static final MODE_USE_ALL_SENSORS:I = 0x0

.field public static final MODE_USE_GYROSCOPE:I = 0x1

.field public static final MODE_USE_GYROSCOPE_AND_ROTATION_VECTOR:I = 0x4

.field public static final MODE_USE_GYROSCOPE_WITH_ACCELEROMETER:I = 0x2

.field public static final OFFSET_MODE_DYNAMIC:I = 0x1

.field public static final OFFSET_MODE_STATIC:I = 0x0

.field public static final ROTATE_0:I = 0x0

.field public static final ROTATE_180:I = 0x2

.field public static final ROTATE_270:I = 0x3

.field public static final ROTATE_90:I = 0x1

.field public static final SENSOR_TYPE_ACCELEROMETER:I = 0x1

.field public static final SENSOR_TYPE_GYROSCOPE:I = 0x0

.field public static final SENSOR_TYPE_MAGNETIC_FIELD:I = 0x2

.field public static final SENSOR_TYPE_NUM:I = 0x4

.field public static final SENSOR_TYPE_ROTATION_VECTOR:I = 0x3

.field public static final STATE_CALC_OFFSET:I = 0x0

.field public static final STATE_PROCESS:I = 0x1

.field public static final SensorSynchronizedObject:Ljava/lang/Object;


# instance fields
.field private camera_rotation:I

.field private mAllValueList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/util/ArrayList<",
            "Lcom/android/camera/panorama/MorphoSensorFusion$SensorData;",
            ">;>;"
        }
    .end annotation
.end field

.field private mGyroCalibratedMode:I

.field private mMode:I

.field private mMorphoSensorFusion:Lcom/android/camera/panorama/MorphoSensorFusion;

.field private final mPartOfAccelerometerList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/android/camera/panorama/MorphoSensorFusion$SensorData;",
            ">;"
        }
    .end annotation
.end field

.field private final mPartOfGyroscopeList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/android/camera/panorama/MorphoSensorFusion$SensorData;",
            ">;"
        }
    .end annotation
.end field

.field private final mPartOfGyroscopeUncalibratedList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/android/camera/panorama/MorphoSensorFusion$SensorData;",
            ">;"
        }
    .end annotation
.end field

.field private final mPartOfMagneticFieldList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/android/camera/panorama/MorphoSensorFusion$SensorData;",
            ">;"
        }
    .end annotation
.end field

.field private final mPartOfRotationVectorList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/android/camera/panorama/MorphoSensorFusion$SensorData;",
            ">;"
        }
    .end annotation
.end field

.field private final mSensorMatrix:[[D

.field private final mStock:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/android/camera/panorama/SensorFusion;->SensorSynchronizedObject:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Z)V
    .locals 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/panorama/SensorFusion;->mGyroCalibratedMode:I

    const/4 v1, 0x1

    iput v1, p0, Lcom/android/camera/panorama/SensorFusion;->camera_rotation:I

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/android/camera/panorama/SensorFusion;->mPartOfGyroscopeList:Ljava/util/ArrayList;

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/android/camera/panorama/SensorFusion;->mPartOfAccelerometerList:Ljava/util/ArrayList;

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/android/camera/panorama/SensorFusion;->mPartOfMagneticFieldList:Ljava/util/ArrayList;

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/android/camera/panorama/SensorFusion;->mPartOfRotationVectorList:Ljava/util/ArrayList;

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/android/camera/panorama/SensorFusion;->mPartOfGyroscopeUncalibratedList:Ljava/util/ArrayList;

    iput-boolean p1, p0, Lcom/android/camera/panorama/SensorFusion;->mStock:Z

    iget-boolean p1, p0, Lcom/android/camera/panorama/SensorFusion;->mStock:Z

    const/4 v2, 0x4

    if-eqz p1, :cond_0

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/android/camera/panorama/SensorFusion;->mAllValueList:Ljava/util/ArrayList;

    move p1, v0

    :goto_0
    if-ge p1, v2, :cond_0

    iget-object v3, p0, Lcom/android/camera/panorama/SensorFusion;->mAllValueList:Ljava/util/ArrayList;

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_0
    new-array p1, v2, [[D

    iput-object p1, p0, Lcom/android/camera/panorama/SensorFusion;->mSensorMatrix:[[D

    move p1, v0

    :goto_1
    iget-object v2, p0, Lcom/android/camera/panorama/SensorFusion;->mSensorMatrix:[[D

    array-length v2, v2

    if-ge p1, v2, :cond_1

    iget-object v2, p0, Lcom/android/camera/panorama/SensorFusion;->mSensorMatrix:[[D

    invoke-direct {p0}, Lcom/android/camera/panorama/SensorFusion;->createMatrix()[D

    move-result-object v3

    aput-object v3, v2, p1

    add-int/lit8 p1, p1, 0x1

    goto :goto_1

    :cond_1
    new-instance p1, Lcom/android/camera/panorama/MorphoSensorFusion;

    invoke-direct {p1}, Lcom/android/camera/panorama/MorphoSensorFusion;-><init>()V

    iput-object p1, p0, Lcom/android/camera/panorama/SensorFusion;->mMorphoSensorFusion:Lcom/android/camera/panorama/MorphoSensorFusion;

    iget-object p1, p0, Lcom/android/camera/panorama/SensorFusion;->mMorphoSensorFusion:Lcom/android/camera/panorama/MorphoSensorFusion;

    invoke-virtual {p1}, Lcom/android/camera/panorama/MorphoSensorFusion;->initialize()I

    move-result p1

    if-eqz p1, :cond_2

    const-string v2, "SensorFusion"

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "MorphoSensorFusion.initialize error ret:0x%08X"

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v1, v0

    invoke-static {v3, v4, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_2
    return-void
.end method

.method private calcRotationMatrix([DDDD)V
    .locals 8

    invoke-direct {p0}, Lcom/android/camera/panorama/SensorFusion;->createMatrix()[D

    move-result-object v0

    invoke-direct {p0}, Lcom/android/camera/panorama/SensorFusion;->createMatrix()[D

    move-result-object v1

    invoke-direct {p0}, Lcom/android/camera/panorama/SensorFusion;->createMatrix()[D

    move-result-object v2

    invoke-direct {p0}, Lcom/android/camera/panorama/SensorFusion;->createMatrix()[D

    move-result-object v3

    invoke-static {p4, p5}, Ljava/lang/Math;->cos(D)D

    move-result-wide v4

    const/4 v6, 0x4

    aput-wide v4, v0, v6

    invoke-static {p4, p5}, Ljava/lang/Math;->sin(D)D

    move-result-wide v4

    neg-double v4, v4

    const/4 v7, 0x5

    aput-wide v4, v0, v7

    invoke-static {p4, p5}, Ljava/lang/Math;->sin(D)D

    move-result-wide v4

    const/4 v7, 0x7

    aput-wide v4, v0, v7

    invoke-static {p4, p5}, Ljava/lang/Math;->cos(D)D

    move-result-wide p4

    const/16 v4, 0x8

    aput-wide p4, v0, v4

    invoke-static {p2, p3}, Ljava/lang/Math;->cos(D)D

    move-result-wide p4

    const/4 v5, 0x0

    aput-wide p4, v1, v5

    invoke-static {p2, p3}, Ljava/lang/Math;->sin(D)D

    move-result-wide p4

    const/4 v7, 0x2

    aput-wide p4, v1, v7

    invoke-static {p2, p3}, Ljava/lang/Math;->sin(D)D

    move-result-wide p4

    neg-double p4, p4

    const/4 v7, 0x6

    aput-wide p4, v1, v7

    invoke-static {p2, p3}, Ljava/lang/Math;->cos(D)D

    move-result-wide p2

    aput-wide p2, v1, v4

    invoke-static {p6, p7}, Ljava/lang/Math;->cos(D)D

    move-result-wide p2

    aput-wide p2, v2, v5

    invoke-static {p6, p7}, Ljava/lang/Math;->sin(D)D

    move-result-wide p2

    neg-double p2, p2

    const/4 p4, 0x1

    aput-wide p2, v2, p4

    invoke-static {p6, p7}, Ljava/lang/Math;->sin(D)D

    move-result-wide p2

    const/4 p4, 0x3

    aput-wide p2, v2, p4

    invoke-static {p6, p7}, Ljava/lang/Math;->cos(D)D

    move-result-wide p2

    aput-wide p2, v2, v6

    invoke-direct {p0, v3, v0, v1}, Lcom/android/camera/panorama/SensorFusion;->multMatrix([D[D[D)V

    invoke-direct {p0, p1, v3, v2}, Lcom/android/camera/panorama/SensorFusion;->multMatrix([D[D[D)V

    return-void
.end method

.method private createMatrix()[D
    .locals 1

    const/16 v0, 0x9

    new-array v0, v0, [D

    fill-array-data v0, :array_0

    return-object v0

    :array_0
    .array-data 8
        0x3ff0000000000000L    # 1.0
        0x0
        0x0
        0x0
        0x3ff0000000000000L    # 1.0
        0x0
        0x0
        0x0
        0x3ff0000000000000L    # 1.0
    .end array-data
.end method

.method private getSensorDataArray(Ljava/util/ArrayList;)[Ljava/lang/Object;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/android/camera/panorama/MorphoSensorFusion$SensorData;",
            ">;)[",
            "Ljava/lang/Object;"
        }
    .end annotation

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    new-array v1, v0, [Ljava/lang/Object;

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_0

    new-instance v3, Lcom/android/camera/panorama/MorphoSensorFusion$SensorData;

    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/camera/panorama/MorphoSensorFusion$SensorData;

    iget-wide v4, v4, Lcom/android/camera/panorama/MorphoSensorFusion$SensorData;->mTimeStamp:J

    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/android/camera/panorama/MorphoSensorFusion$SensorData;

    iget-object v6, v6, Lcom/android/camera/panorama/MorphoSensorFusion$SensorData;->mValues:[D

    invoke-direct {v3, v4, v5, v6}, Lcom/android/camera/panorama/MorphoSensorFusion$SensorData;-><init>(J[D)V

    aput-object v3, v1, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    return-object v1
.end method

.method private isUpdateSensorMatrix()Z
    .locals 4

    sget-object v0, Lcom/android/camera/panorama/SensorFusion;->SensorSynchronizedObject:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget v1, p0, Lcom/android/camera/panorama/SensorFusion;->mMode:I

    const/4 v2, 0x0

    const/4 v3, 0x1

    packed-switch v1, :pswitch_data_0

    monitor-exit v0

    goto/16 :goto_0

    :pswitch_0
    iget v1, p0, Lcom/android/camera/panorama/SensorFusion;->mGyroCalibratedMode:I

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/android/camera/panorama/SensorFusion;->mPartOfGyroscopeList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/android/camera/panorama/SensorFusion;->mPartOfRotationVectorList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    move v2, v3

    nop

    :cond_0
    monitor-exit v0

    return v2

    :cond_1
    iget-object v1, p0, Lcom/android/camera/panorama/SensorFusion;->mPartOfGyroscopeUncalibratedList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/android/camera/panorama/SensorFusion;->mPartOfRotationVectorList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_2

    move v2, v3

    nop

    :cond_2
    monitor-exit v0

    return v2

    :pswitch_1
    iget-object v1, p0, Lcom/android/camera/panorama/SensorFusion;->mPartOfAccelerometerList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_3

    iget-object v1, p0, Lcom/android/camera/panorama/SensorFusion;->mPartOfMagneticFieldList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_3

    move v2, v3

    nop

    :cond_3
    monitor-exit v0

    return v2

    :pswitch_2
    iget v1, p0, Lcom/android/camera/panorama/SensorFusion;->mGyroCalibratedMode:I

    if-nez v1, :cond_5

    iget-object v1, p0, Lcom/android/camera/panorama/SensorFusion;->mPartOfGyroscopeList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_4

    iget-object v1, p0, Lcom/android/camera/panorama/SensorFusion;->mPartOfAccelerometerList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_4

    move v2, v3

    nop

    :cond_4
    monitor-exit v0

    return v2

    :cond_5
    iget-object v1, p0, Lcom/android/camera/panorama/SensorFusion;->mPartOfGyroscopeUncalibratedList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_6

    iget-object v1, p0, Lcom/android/camera/panorama/SensorFusion;->mPartOfAccelerometerList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_6

    move v2, v3

    nop

    :cond_6
    monitor-exit v0

    return v2

    :pswitch_3
    iget v1, p0, Lcom/android/camera/panorama/SensorFusion;->mGyroCalibratedMode:I

    if-nez v1, :cond_7

    iget-object v1, p0, Lcom/android/camera/panorama/SensorFusion;->mPartOfGyroscopeList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    xor-int/2addr v1, v3

    monitor-exit v0

    return v1

    :cond_7
    iget-object v1, p0, Lcom/android/camera/panorama/SensorFusion;->mPartOfGyroscopeUncalibratedList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    xor-int/2addr v1, v3

    monitor-exit v0

    return v1

    :pswitch_4
    iget-object v1, p0, Lcom/android/camera/panorama/SensorFusion;->mPartOfGyroscopeList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_8

    iget-object v1, p0, Lcom/android/camera/panorama/SensorFusion;->mPartOfAccelerometerList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_8

    iget-object v1, p0, Lcom/android/camera/panorama/SensorFusion;->mPartOfMagneticFieldList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_8

    move v2, v3

    nop

    :cond_8
    monitor-exit v0

    return v2

    :goto_0
    return v2

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private multMatrix([D[D[D)V
    .locals 12

    const/16 v0, 0x9

    new-array v0, v0, [D

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    const/4 v3, 0x3

    if-ge v2, v3, :cond_2

    move v4, v1

    :goto_1
    if-ge v4, v3, :cond_1

    const-wide/16 v5, 0x0

    move-wide v6, v5

    move v5, v1

    :goto_2
    if-ge v5, v3, :cond_0

    mul-int/lit8 v8, v2, 0x3

    add-int/2addr v8, v5

    aget-wide v8, p2, v8

    mul-int/lit8 v10, v5, 0x3

    add-int/2addr v10, v4

    aget-wide v10, p3, v10

    mul-double/2addr v8, v10

    add-double/2addr v6, v8

    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    :cond_0
    mul-int/lit8 v5, v2, 0x3

    add-int/2addr v5, v4

    aput-wide v6, v0, v5

    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    array-length p2, v0

    invoke-static {v0, v1, p1, v1, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-void
.end method

.method private setInputSensorData([Ljava/lang/Object;I)I
    .locals 1

    if-nez p1, :cond_0

    const p1, -0x7fffffff

    return p1

    :cond_0
    iget-object v0, p0, Lcom/android/camera/panorama/SensorFusion;->mMorphoSensorFusion:Lcom/android/camera/panorama/MorphoSensorFusion;

    invoke-virtual {v0, p1, p2}, Lcom/android/camera/panorama/MorphoSensorFusion;->setSensorData([Ljava/lang/Object;I)I

    move-result p1

    return p1
.end method

.method private updateSensorMatrix()I
    .locals 13

    nop

    sget-object v0, Lcom/android/camera/panorama/SensorFusion;->SensorSynchronizedObject:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/android/camera/panorama/SensorFusion;->mPartOfGyroscopeList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/android/camera/panorama/SensorFusion;->mPartOfGyroscopeUncalibratedList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->clone()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/ArrayList;

    iget-object v3, p0, Lcom/android/camera/panorama/SensorFusion;->mPartOfAccelerometerList:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->clone()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/ArrayList;

    iget-object v4, p0, Lcom/android/camera/panorama/SensorFusion;->mPartOfMagneticFieldList:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->clone()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/ArrayList;

    iget-object v5, p0, Lcom/android/camera/panorama/SensorFusion;->mPartOfRotationVectorList:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->clone()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/ArrayList;

    iget-object v6, p0, Lcom/android/camera/panorama/SensorFusion;->mPartOfGyroscopeList:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->clear()V

    iget-object v6, p0, Lcom/android/camera/panorama/SensorFusion;->mPartOfGyroscopeUncalibratedList:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->clear()V

    iget-object v6, p0, Lcom/android/camera/panorama/SensorFusion;->mPartOfAccelerometerList:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->clear()V

    iget-object v6, p0, Lcom/android/camera/panorama/SensorFusion;->mPartOfMagneticFieldList:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->clear()V

    iget-object v6, p0, Lcom/android/camera/panorama/SensorFusion;->mPartOfRotationVectorList:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->clear()V

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-boolean v0, p0, Lcom/android/camera/panorama/SensorFusion;->mStock:Z

    const/4 v6, 0x2

    const/4 v7, 0x3

    const/4 v8, 0x1

    const/4 v9, 0x0

    if-eqz v0, :cond_1

    iget v0, p0, Lcom/android/camera/panorama/SensorFusion;->mGyroCalibratedMode:I

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/panorama/SensorFusion;->mAllValueList:Ljava/util/ArrayList;

    invoke-virtual {v0, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/android/camera/panorama/SensorFusion;->mAllValueList:Ljava/util/ArrayList;

    invoke-virtual {v0, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    :goto_0
    iget-object v0, p0, Lcom/android/camera/panorama/SensorFusion;->mAllValueList:Ljava/util/ArrayList;

    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    iget-object v0, p0, Lcom/android/camera/panorama/SensorFusion;->mAllValueList:Ljava/util/ArrayList;

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    iget-object v0, p0, Lcom/android/camera/panorama/SensorFusion;->mAllValueList:Ljava/util/ArrayList;

    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    :cond_1
    iget v0, p0, Lcom/android/camera/panorama/SensorFusion;->mGyroCalibratedMode:I

    if-nez v0, :cond_2

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_3

    invoke-direct {p0, v1}, Lcom/android/camera/panorama/SensorFusion;->getSensorDataArray(Ljava/util/ArrayList;)[Ljava/lang/Object;

    move-result-object v0

    invoke-direct {p0, v0, v9}, Lcom/android/camera/panorama/SensorFusion;->setInputSensorData([Ljava/lang/Object;I)I

    move-result v0

    if-eqz v0, :cond_4

    const-string v1, "SensorFusion"

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v10, "SensorFusion.setSensorData(SENSOR_TYPE_GYROSCOPE) error ret:0x%08X"

    new-array v11, v8, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v11, v9

    invoke-static {v2, v10, v11}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    :cond_2
    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_3

    invoke-direct {p0, v2}, Lcom/android/camera/panorama/SensorFusion;->getSensorDataArray(Ljava/util/ArrayList;)[Ljava/lang/Object;

    move-result-object v0

    invoke-direct {p0, v0, v9}, Lcom/android/camera/panorama/SensorFusion;->setInputSensorData([Ljava/lang/Object;I)I

    move-result v0

    if-eqz v0, :cond_4

    const-string v1, "SensorFusion"

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v10, "SensorFusion.setSensorData(SENSOR_TYPE_GYROSCOPE) error ret:0x%08X"

    new-array v11, v8, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v11, v9

    invoke-static {v2, v10, v11}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    :cond_3
    move v0, v9

    :cond_4
    :goto_1
    invoke-virtual {v3}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_5

    invoke-direct {p0, v3}, Lcom/android/camera/panorama/SensorFusion;->getSensorDataArray(Ljava/util/ArrayList;)[Ljava/lang/Object;

    move-result-object v0

    invoke-direct {p0, v0, v8}, Lcom/android/camera/panorama/SensorFusion;->setInputSensorData([Ljava/lang/Object;I)I

    move-result v0

    if-eqz v0, :cond_5

    const-string v1, "SensorFusion"

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "SensorFusion.setSensorData(SENSOR_TYPE_ACCELEROMETER) error ret:0x%08X"

    new-array v10, v8, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v10, v9

    invoke-static {v2, v3, v10}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_5
    invoke-virtual {v4}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_6

    invoke-direct {p0, v4}, Lcom/android/camera/panorama/SensorFusion;->getSensorDataArray(Ljava/util/ArrayList;)[Ljava/lang/Object;

    move-result-object v0

    invoke-direct {p0, v0, v6}, Lcom/android/camera/panorama/SensorFusion;->setInputSensorData([Ljava/lang/Object;I)I

    move-result v0

    if-eqz v0, :cond_6

    const-string v1, "SensorFusion"

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "SensorFusion.setSensorData(SENSOR_TYPE_MAGNETIC_FIELD) error ret:0x%08X"

    new-array v4, v8, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v9

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_6
    invoke-virtual {v5}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_7

    invoke-direct {p0, v5}, Lcom/android/camera/panorama/SensorFusion;->getSensorDataArray(Ljava/util/ArrayList;)[Ljava/lang/Object;

    move-result-object v0

    invoke-direct {p0, v0, v7}, Lcom/android/camera/panorama/SensorFusion;->setInputSensorData([Ljava/lang/Object;I)I

    move-result v0

    if-eqz v0, :cond_7

    const-string v1, "SensorFusion"

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "SensorFusion.setSensorData(SENSOR_TYPE_ROTATION_VECTOR) error ret:0x%08X"

    new-array v4, v8, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v9

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_7
    iget-object v1, p0, Lcom/android/camera/panorama/SensorFusion;->mMorphoSensorFusion:Lcom/android/camera/panorama/MorphoSensorFusion;

    invoke-virtual {v1}, Lcom/android/camera/panorama/MorphoSensorFusion;->calc()I

    move-result v1

    or-int/2addr v0, v1

    iget-object v1, p0, Lcom/android/camera/panorama/SensorFusion;->mMorphoSensorFusion:Lcom/android/camera/panorama/MorphoSensorFusion;

    iget-object v2, p0, Lcom/android/camera/panorama/SensorFusion;->mSensorMatrix:[[D

    aget-object v2, v2, v8

    invoke-virtual {v1, v8, v2}, Lcom/android/camera/panorama/MorphoSensorFusion;->outputRotationMatrix3x3(I[D)I

    move-result v1

    or-int/2addr v0, v1

    iget-object v1, p0, Lcom/android/camera/panorama/SensorFusion;->mMorphoSensorFusion:Lcom/android/camera/panorama/MorphoSensorFusion;

    iget-object v2, p0, Lcom/android/camera/panorama/SensorFusion;->mSensorMatrix:[[D

    aget-object v2, v2, v9

    invoke-virtual {v1, v9, v2}, Lcom/android/camera/panorama/MorphoSensorFusion;->outputRotationMatrix3x3(I[D)I

    move-result v1

    or-int/2addr v0, v1

    iget-object v1, p0, Lcom/android/camera/panorama/SensorFusion;->mMorphoSensorFusion:Lcom/android/camera/panorama/MorphoSensorFusion;

    iget-object v2, p0, Lcom/android/camera/panorama/SensorFusion;->mSensorMatrix:[[D

    aget-object v2, v2, v7

    invoke-virtual {v1, v7, v2}, Lcom/android/camera/panorama/MorphoSensorFusion;->outputRotationMatrix3x3(I[D)I

    move-result v1

    or-int/2addr v0, v1

    return v0

    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method


# virtual methods
.method public clearStockData()V
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/android/camera/panorama/SensorFusion;->mStock:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lcom/android/camera/panorama/SensorFusion;->mAllValueList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    iget-object v1, p0, Lcom/android/camera/panorama/SensorFusion;->mAllValueList:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public getSensorMatrix([D[D[D[I)I
    .locals 4

    nop

    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/android/camera/panorama/SensorFusion;->isUpdateSensorMatrix()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/android/camera/panorama/SensorFusion;->updateSensorMatrix()I

    move-result v0

    or-int/2addr v0, v1

    goto :goto_0

    :cond_0
    move v0, v1

    :goto_0
    if-eqz p1, :cond_1

    iget-object v2, p0, Lcom/android/camera/panorama/SensorFusion;->mSensorMatrix:[[D

    aget-object v2, v2, v1

    iget-object v3, p0, Lcom/android/camera/panorama/SensorFusion;->mSensorMatrix:[[D

    aget-object v3, v3, v1

    array-length v3, v3

    invoke-static {v2, v1, p1, v1, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_1
    if-eqz p2, :cond_2

    iget-object p1, p0, Lcom/android/camera/panorama/SensorFusion;->mSensorMatrix:[[D

    const/4 v2, 0x3

    aget-object p1, p1, v2

    iget-object v3, p0, Lcom/android/camera/panorama/SensorFusion;->mSensorMatrix:[[D

    aget-object v2, v3, v2

    array-length v2, v2

    invoke-static {p1, v1, p2, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_2
    const/4 p1, 0x1

    if-eqz p3, :cond_3

    iget-object p2, p0, Lcom/android/camera/panorama/SensorFusion;->mSensorMatrix:[[D

    aget-object p2, p2, p1

    iget-object v2, p0, Lcom/android/camera/panorama/SensorFusion;->mSensorMatrix:[[D

    aget-object v2, v2, p1

    array-length v2, v2

    invoke-static {p2, v1, p3, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_3
    iget-boolean p2, p0, Lcom/android/camera/panorama/SensorFusion;->mStock:Z

    if-eqz p2, :cond_4

    if-eqz p4, :cond_4

    array-length p2, p4

    iget-object p3, p0, Lcom/android/camera/panorama/SensorFusion;->mAllValueList:Ljava/util/ArrayList;

    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result p3

    if-ne p2, p3, :cond_4

    :goto_1
    iget-object p2, p0, Lcom/android/camera/panorama/SensorFusion;->mAllValueList:Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p2

    if-ge v1, p2, :cond_4

    iget-object p2, p0, Lcom/android/camera/panorama/SensorFusion;->mAllValueList:Ljava/util/ArrayList;

    invoke-virtual {p2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p2

    sub-int/2addr p2, p1

    aput p2, p4, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_4
    monitor-exit p0

    return v0

    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public getStockData()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/util/ArrayList<",
            "Lcom/android/camera/panorama/MorphoSensorFusion$SensorData;",
            ">;>;"
        }
    .end annotation

    iget-boolean v0, p0, Lcom/android/camera/panorama/SensorFusion;->mStock:Z

    if-eqz v0, :cond_0

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/android/camera/panorama/SensorFusion;->mAllValueList:Ljava/util/ArrayList;

    monitor-exit p0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    :goto_0
    return-object v0
.end method

.method public onAccuracyChanged(Landroid/hardware/Sensor;I)V
    .locals 0

    return-void
.end method

.method public onSensorChanged(Landroid/hardware/SensorEvent;)V
    .locals 7

    sget-object v0, Lcom/android/camera/panorama/SensorFusion;->SensorSynchronizedObject:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    new-instance v1, Lcom/android/camera/panorama/MorphoSensorFusion$SensorData;

    iget-wide v2, p1, Landroid/hardware/SensorEvent;->timestamp:J

    iget-object v4, p1, Landroid/hardware/SensorEvent;->values:[F

    invoke-direct {v1, v2, v3, v4}, Lcom/android/camera/panorama/MorphoSensorFusion$SensorData;-><init>(J[F)V

    iget-object p1, p1, Landroid/hardware/SensorEvent;->sensor:Landroid/hardware/Sensor;

    invoke-virtual {p1}, Landroid/hardware/Sensor;->getType()I

    move-result p1

    const/4 v2, 0x3

    const/4 v3, 0x1

    const/4 v4, 0x0

    sparse-switch p1, :sswitch_data_0

    goto :goto_0

    :sswitch_0
    iget p1, p0, Lcom/android/camera/panorama/SensorFusion;->camera_rotation:I

    if-ne p1, v2, :cond_0

    iget-object p1, v1, Lcom/android/camera/panorama/MorphoSensorFusion$SensorData;->mValues:[D

    iget-object v2, v1, Lcom/android/camera/panorama/MorphoSensorFusion$SensorData;->mValues:[D

    aget-wide v5, v2, v4

    neg-double v5, v5

    aput-wide v5, p1, v4

    iget-object p1, v1, Lcom/android/camera/panorama/MorphoSensorFusion$SensorData;->mValues:[D

    iget-object v2, v1, Lcom/android/camera/panorama/MorphoSensorFusion$SensorData;->mValues:[D

    aget-wide v5, v2, v3

    neg-double v5, v5

    aput-wide v5, p1, v3

    :cond_0
    iget-object p1, p0, Lcom/android/camera/panorama/SensorFusion;->mPartOfGyroscopeUncalibratedList:Ljava/util/ArrayList;

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :sswitch_1
    iget-object p1, p0, Lcom/android/camera/panorama/SensorFusion;->mPartOfRotationVectorList:Ljava/util/ArrayList;

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :sswitch_2
    iget p1, p0, Lcom/android/camera/panorama/SensorFusion;->camera_rotation:I

    if-ne p1, v2, :cond_1

    iget-object p1, v1, Lcom/android/camera/panorama/MorphoSensorFusion$SensorData;->mValues:[D

    iget-object v2, v1, Lcom/android/camera/panorama/MorphoSensorFusion$SensorData;->mValues:[D

    aget-wide v5, v2, v4

    neg-double v5, v5

    aput-wide v5, p1, v4

    iget-object p1, v1, Lcom/android/camera/panorama/MorphoSensorFusion$SensorData;->mValues:[D

    iget-object v2, v1, Lcom/android/camera/panorama/MorphoSensorFusion$SensorData;->mValues:[D

    aget-wide v5, v2, v3

    neg-double v5, v5

    aput-wide v5, p1, v3

    :cond_1
    iget-object p1, p0, Lcom/android/camera/panorama/SensorFusion;->mPartOfGyroscopeList:Ljava/util/ArrayList;

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :sswitch_3
    iget-object p1, p0, Lcom/android/camera/panorama/SensorFusion;->mPartOfMagneticFieldList:Ljava/util/ArrayList;

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :sswitch_4
    iget-object p1, p0, Lcom/android/camera/panorama/SensorFusion;->mPartOfAccelerometerList:Ljava/util/ArrayList;

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    nop

    :goto_0
    iget-object p1, p0, Lcom/android/camera/panorama/SensorFusion;->mPartOfGyroscopeList:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    const/16 v1, 0x200

    if-le p1, v1, :cond_2

    iget-object p1, p0, Lcom/android/camera/panorama/SensorFusion;->mPartOfGyroscopeList:Ljava/util/ArrayList;

    invoke-virtual {p1, v4}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    goto :goto_0

    :cond_2
    :goto_1
    iget-object p1, p0, Lcom/android/camera/panorama/SensorFusion;->mPartOfGyroscopeUncalibratedList:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-le p1, v1, :cond_3

    iget-object p1, p0, Lcom/android/camera/panorama/SensorFusion;->mPartOfGyroscopeUncalibratedList:Ljava/util/ArrayList;

    invoke-virtual {p1, v4}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    goto :goto_1

    :cond_3
    :goto_2
    iget-object p1, p0, Lcom/android/camera/panorama/SensorFusion;->mPartOfAccelerometerList:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-le p1, v1, :cond_4

    iget-object p1, p0, Lcom/android/camera/panorama/SensorFusion;->mPartOfAccelerometerList:Ljava/util/ArrayList;

    invoke-virtual {p1, v4}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    goto :goto_2

    :cond_4
    :goto_3
    iget-object p1, p0, Lcom/android/camera/panorama/SensorFusion;->mPartOfMagneticFieldList:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-le p1, v1, :cond_5

    iget-object p1, p0, Lcom/android/camera/panorama/SensorFusion;->mPartOfMagneticFieldList:Ljava/util/ArrayList;

    invoke-virtual {p1, v4}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    goto :goto_3

    :cond_5
    :goto_4
    iget-object p1, p0, Lcom/android/camera/panorama/SensorFusion;->mPartOfRotationVectorList:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-le p1, v1, :cond_6

    iget-object p1, p0, Lcom/android/camera/panorama/SensorFusion;->mPartOfRotationVectorList:Ljava/util/ArrayList;

    invoke-virtual {p1, v4}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    goto :goto_4

    :cond_6
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1

    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_4
        0x2 -> :sswitch_3
        0x4 -> :sswitch_2
        0xf -> :sswitch_1
        0x10 -> :sswitch_0
    .end sparse-switch
.end method

.method public release()V
    .locals 6

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/android/camera/panorama/SensorFusion;->mMorphoSensorFusion:Lcom/android/camera/panorama/MorphoSensorFusion;

    invoke-virtual {v0}, Lcom/android/camera/panorama/MorphoSensorFusion;->finish()I

    move-result v0

    if-eqz v0, :cond_0

    const-string v1, "SensorFusion"

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "MorphoSensorFusion.finish error ret:0x%08X"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v4, v5

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/panorama/SensorFusion;->mMorphoSensorFusion:Lcom/android/camera/panorama/MorphoSensorFusion;

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public resetOffsetValue()V
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/android/camera/panorama/SensorFusion;->mMorphoSensorFusion:Lcom/android/camera/panorama/MorphoSensorFusion;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/camera/panorama/MorphoSensorFusion;->setAppState(I)I

    iget-object v0, p0, Lcom/android/camera/panorama/SensorFusion;->mMorphoSensorFusion:Lcom/android/camera/panorama/MorphoSensorFusion;

    invoke-virtual {v0}, Lcom/android/camera/panorama/MorphoSensorFusion;->calc()I

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public setAppState(I)I
    .locals 1

    nop

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/android/camera/panorama/SensorFusion;->mMorphoSensorFusion:Lcom/android/camera/panorama/MorphoSensorFusion;

    invoke-virtual {v0, p1}, Lcom/android/camera/panorama/MorphoSensorFusion;->setAppState(I)I

    move-result p1

    const/4 v0, 0x0

    or-int/2addr p1, v0

    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public setInitialOrientation(I)V
    .locals 10

    int-to-double v0, p1

    invoke-static {v0, v1}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v0

    iget-object p1, p0, Lcom/android/camera/panorama/SensorFusion;->mSensorMatrix:[[D

    const/4 v2, 0x0

    aget-object v3, p1, v2

    const-wide/16 v4, 0x0

    const-wide/16 v6, 0x0

    move-object v2, p0

    move-wide v8, v0

    invoke-direct/range {v2 .. v9}, Lcom/android/camera/panorama/SensorFusion;->calcRotationMatrix([DDDD)V

    iget-object p1, p0, Lcom/android/camera/panorama/SensorFusion;->mSensorMatrix:[[D

    const/4 v2, 0x3

    aget-object v3, p1, v2

    move-object v2, p0

    invoke-direct/range {v2 .. v9}, Lcom/android/camera/panorama/SensorFusion;->calcRotationMatrix([DDDD)V

    iget-object p1, p0, Lcom/android/camera/panorama/SensorFusion;->mSensorMatrix:[[D

    const/4 v2, 0x1

    aget-object v3, p1, v2

    move-object v2, p0

    invoke-direct/range {v2 .. v9}, Lcom/android/camera/panorama/SensorFusion;->calcRotationMatrix([DDDD)V

    return-void
.end method

.method public setMode(I)I
    .locals 1

    nop

    monitor-enter p0

    :try_start_0
    iput p1, p0, Lcom/android/camera/panorama/SensorFusion;->mMode:I

    iget-object v0, p0, Lcom/android/camera/panorama/SensorFusion;->mMorphoSensorFusion:Lcom/android/camera/panorama/MorphoSensorFusion;

    invoke-virtual {v0, p1}, Lcom/android/camera/panorama/MorphoSensorFusion;->setMode(I)I

    move-result p1

    const/4 v0, 0x0

    or-int/2addr p1, v0

    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public setOffset(Lcom/android/camera/panorama/MorphoSensorFusion$SensorData;I)I
    .locals 2

    nop

    monitor-enter p0

    :try_start_0
    iget v0, p0, Lcom/android/camera/panorama/SensorFusion;->mMode:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/android/camera/panorama/SensorFusion;->mMorphoSensorFusion:Lcom/android/camera/panorama/MorphoSensorFusion;

    invoke-virtual {v0, p1, p2}, Lcom/android/camera/panorama/MorphoSensorFusion;->setOffset(Lcom/android/camera/panorama/MorphoSensorFusion$SensorData;I)I

    move-result p1

    const/4 p2, 0x0

    or-int/2addr p1, p2

    goto :goto_0

    :cond_0
    const p1, -0x7ffffffe

    :goto_0
    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public setOffsetMode(I)I
    .locals 1

    nop

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/android/camera/panorama/SensorFusion;->mMorphoSensorFusion:Lcom/android/camera/panorama/MorphoSensorFusion;

    invoke-virtual {v0, p1}, Lcom/android/camera/panorama/MorphoSensorFusion;->setOffsetMode(I)I

    move-result p1

    const/4 v0, 0x0

    or-int/2addr p1, v0

    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public setRotation(I)I
    .locals 1

    nop

    iput p1, p0, Lcom/android/camera/panorama/SensorFusion;->camera_rotation:I

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/android/camera/panorama/SensorFusion;->mMorphoSensorFusion:Lcom/android/camera/panorama/MorphoSensorFusion;

    invoke-virtual {v0, p1}, Lcom/android/camera/panorama/MorphoSensorFusion;->setRotation(I)I

    move-result p1

    const/4 v0, 0x0

    or-int/2addr p1, v0

    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public setUncalibratedMode()I
    .locals 1

    nop

    monitor-enter p0

    const/4 v0, 0x1

    :try_start_0
    iput v0, p0, Lcom/android/camera/panorama/SensorFusion;->mGyroCalibratedMode:I

    monitor-exit p0

    const/4 v0, 0x0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
