.class public Lcom/android/zxing/HandGestureDecoder;
.super Lcom/android/zxing/Decoder;
.source "HandGestureDecoder.java"


# static fields
.field private static DEBUG:Z = false

.field private static DETECTION_FRAMES_PER_SECOND:I = 0x0

.field public static final TAG:Ljava/lang/String; = "HandGestureDecoder"


# instance fields
.field private mCameraId:I

.field private mContinuousInterval:Ljava/util/concurrent/atomic/AtomicInteger;

.field private mHandGesture:Lcom/android/camera/handgesture/HandGesture;

.field private mTargetDetected:Z

.field private mTipShowInterval:I

.field private mTipVisible:Z

.field private mTriggeringPhoto:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    sput-boolean v0, Lcom/android/zxing/HandGestureDecoder;->DEBUG:Z

    const/16 v0, 0x10

    sput v0, Lcom/android/zxing/HandGestureDecoder;->DETECTION_FRAMES_PER_SECOND:I

    return-void
.end method

.method constructor <init>()V
    .locals 3

    invoke-direct {p0}, Lcom/android/zxing/Decoder;-><init>()V

    sget v0, Lcom/android/zxing/HandGestureDecoder;->DETECTION_FRAMES_PER_SECOND:I

    iput v0, p0, Lcom/android/zxing/HandGestureDecoder;->mTipShowInterval:I

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/zxing/HandGestureDecoder;->mTriggeringPhoto:Z

    iput-boolean v0, p0, Lcom/android/zxing/HandGestureDecoder;->mTargetDetected:Z

    new-instance v1, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v1, v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v1, p0, Lcom/android/zxing/HandGestureDecoder;->mContinuousInterval:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/zxing/HandGestureDecoder;->mTipVisible:Z

    invoke-static {}, Lio/reactivex/subjects/PublishSubject;->create()Lio/reactivex/subjects/PublishSubject;

    move-result-object v1

    iput-object v1, p0, Lcom/android/zxing/HandGestureDecoder;->mSubjects:Lio/reactivex/subjects/PublishSubject;

    new-instance v1, Lcom/android/camera/handgesture/HandGesture;

    invoke-direct {v1}, Lcom/android/camera/handgesture/HandGesture;-><init>()V

    iput-object v1, p0, Lcom/android/zxing/HandGestureDecoder;->mHandGesture:Lcom/android/camera/handgesture/HandGesture;

    const/16 v1, 0x1388

    iput v1, p0, Lcom/android/zxing/HandGestureDecoder;->mDecodeMaxCount:I

    sget v1, Lcom/android/zxing/HandGestureDecoder;->DETECTION_FRAMES_PER_SECOND:I

    const/16 v2, 0x3e8

    div-int/2addr v2, v1

    int-to-long v1, v2

    iput-wide v1, p0, Lcom/android/zxing/HandGestureDecoder;->mDecodeAutoInterval:J

    iput-boolean v0, p0, Lcom/android/zxing/HandGestureDecoder;->mEnable:Z

    iget-object v0, p0, Lcom/android/zxing/HandGestureDecoder;->mSubjects:Lio/reactivex/subjects/PublishSubject;

    sget-object v1, Lio/reactivex/BackpressureStrategy;->LATEST:Lio/reactivex/BackpressureStrategy;

    invoke-virtual {v0, v1}, Lio/reactivex/subjects/PublishSubject;->toFlowable(Lio/reactivex/BackpressureStrategy;)Lio/reactivex/Flowable;

    move-result-object v0

    invoke-static {}, Lio/reactivex/schedulers/Schedulers;->computation()Lio/reactivex/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/reactivex/Flowable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Flowable;

    move-result-object v0

    new-instance v1, Lcom/android/zxing/-$$Lambda$HandGestureDecoder$k5Tz3QC2-fujaBf7OR4Blfav0bI;

    invoke-direct {v1, p0}, Lcom/android/zxing/-$$Lambda$HandGestureDecoder$k5Tz3QC2-fujaBf7OR4Blfav0bI;-><init>(Lcom/android/zxing/HandGestureDecoder;)V

    invoke-virtual {v0, v1}, Lio/reactivex/Flowable;->map(Lio/reactivex/functions/Function;)Lio/reactivex/Flowable;

    move-result-object v0

    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/reactivex/Flowable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Flowable;

    move-result-object v0

    new-instance v1, Lcom/android/zxing/-$$Lambda$HandGestureDecoder$sN1MVln00IdujCmlnc2CDH2Xra0;

    invoke-direct {v1, p0}, Lcom/android/zxing/-$$Lambda$HandGestureDecoder$sN1MVln00IdujCmlnc2CDH2Xra0;-><init>(Lcom/android/zxing/HandGestureDecoder;)V

    invoke-virtual {v0, v1}, Lio/reactivex/Flowable;->subscribe(Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    return-void
.end method

.method private dumpPreviewImage(Lcom/android/zxing/PreviewImage;)V
    .locals 12

    nop

    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p1}, Lcom/android/zxing/PreviewImage;->getTimestamp()J

    move-result-wide v1

    invoke-virtual {p1}, Lcom/android/zxing/PreviewImage;->getWidth()I

    move-result v9

    invoke-virtual {p1}, Lcom/android/zxing/PreviewImage;->getHeight()I

    move-result v10

    new-instance v11, Ljava/io/FileOutputStream;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lmiui/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v4, "/DCIM/Camera/hand_"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, ".jpg"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v11, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    const-string v0, "HandGestureDecoder"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "PreviewImage timestamp: ["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, "]"

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v0, Landroid/graphics/YuvImage;

    invoke-virtual {p1}, Lcom/android/zxing/PreviewImage;->getData()[B

    move-result-object v4

    const/16 v5, 0x11

    const/4 v8, 0x0

    move-object v3, v0

    move v6, v9

    move v7, v10

    invoke-direct/range {v3 .. v8}, Landroid/graphics/YuvImage;-><init>([BIII[I)V

    new-instance p1, Landroid/graphics/Rect;

    const/4 v1, 0x0

    invoke-direct {p1, v1, v1, v9, v10}, Landroid/graphics/Rect;-><init>(IIII)V

    const/16 v1, 0x64

    invoke-virtual {v0, p1, v1, v11}, Landroid/graphics/YuvImage;->compressToJpeg(Landroid/graphics/Rect;ILjava/io/OutputStream;)Z
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    nop

    :try_start_2
    invoke-virtual {v11}, Ljava/io/FileOutputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_1

    :catchall_0
    move-exception p1

    move-object v0, v11

    goto :goto_3

    :catch_0
    move-exception p1

    move-object v0, v11

    goto :goto_0

    :catchall_1
    move-exception p1

    goto :goto_3

    :catch_1
    move-exception p1

    :goto_0
    :try_start_3
    const-string v1, "HandGestureDecoder"

    const-string v2, "Dump preview Image failed!"

    invoke-static {v1, v2, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    if-eqz v0, :cond_0

    :try_start_4
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    goto :goto_1

    :catch_2
    move-exception p1

    const-string v0, "HandGestureDecoder"

    const-string v1, "Close stream failed!"

    invoke-static {v0, v1, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_2

    :cond_0
    :goto_1
    nop

    :goto_2
    return-void

    :goto_3
    nop

    if-eqz v0, :cond_1

    :try_start_5
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_3

    goto :goto_4

    :catch_3
    move-exception v0

    const-string v1, "HandGestureDecoder"

    const-string v2, "Close stream failed!"

    invoke-static {v1, v2, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    nop

    :cond_1
    :goto_4
    throw p1
.end method

.method public static synthetic lambda$new$0(Lcom/android/zxing/HandGestureDecoder;Lcom/android/zxing/PreviewImage;)Ljava/lang/Integer;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const-string v0, "HandGestureDecoder"

    const-string v1, "HandGestureDecoder: decode E"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p1}, Lcom/android/zxing/PreviewImage;->getPreviewStatus()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    :try_start_0
    iget-object p1, p0, Lcom/android/zxing/HandGestureDecoder;->mHandGesture:Lcom/android/camera/handgesture/HandGesture;

    invoke-virtual {p1}, Lcom/android/camera/handgesture/HandGesture;->unInit()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    goto :goto_0

    :pswitch_1
    invoke-virtual {p1}, Lcom/android/zxing/PreviewImage;->getData()[B

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-virtual {p1}, Lcom/android/zxing/PreviewImage;->getData()[B

    move-result-object v0

    array-length v0, v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    sget-boolean v0, Lcom/android/zxing/HandGestureDecoder;->DEBUG:Z

    if-eqz v0, :cond_1

    invoke-direct {p0, p1}, Lcom/android/zxing/HandGestureDecoder;->dumpPreviewImage(Lcom/android/zxing/PreviewImage;)V

    :cond_1
    :try_start_1
    invoke-virtual {p0, p1}, Lcom/android/zxing/HandGestureDecoder;->decode(Lcom/android/zxing/PreviewImage;)I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    return-object p1

    :catch_1
    move-exception p1

    goto :goto_0

    :pswitch_2
    :try_start_2
    iget-object v0, p0, Lcom/android/zxing/HandGestureDecoder;->mHandGesture:Lcom/android/camera/handgesture/HandGesture;

    invoke-virtual {p1}, Lcom/android/zxing/PreviewImage;->getCameraId()I

    move-result p1

    invoke-virtual {v0, p1}, Lcom/android/camera/handgesture/HandGesture;->init(I)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_0

    :catch_2
    move-exception p1

    nop

    :cond_2
    :goto_0
    const/4 p1, -0x1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    return-object p1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static synthetic lambda$new$1(Lcom/android/zxing/HandGestureDecoder;Ljava/lang/Integer;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const-string v0, "HandGestureDecoder"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Detected rect left = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/android/zxing/HandGestureDecoder;->mTipShowInterval:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-ltz p1, :cond_0

    iput-boolean v1, p0, Lcom/android/zxing/HandGestureDecoder;->mTargetDetected:Z

    goto :goto_0

    :cond_0
    iput-boolean v0, p0, Lcom/android/zxing/HandGestureDecoder;->mTargetDetected:Z

    iget-object p1, p0, Lcom/android/zxing/HandGestureDecoder;->mContinuousInterval:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {p1, v0}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    :goto_0
    iget-boolean p1, p0, Lcom/android/zxing/HandGestureDecoder;->mTriggeringPhoto:Z

    if-eqz p1, :cond_1

    return-void

    :cond_1
    const-string p1, "HandGestureDecoder"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Continuous interval: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/android/zxing/HandGestureDecoder;->mContinuousInterval:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {p1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lcom/android/zxing/HandGestureDecoder;->mContinuousInterval:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result p1

    if-lez p1, :cond_2

    iget-object p1, p0, Lcom/android/zxing/HandGestureDecoder;->mContinuousInterval:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndDecrement()I

    goto :goto_1

    :cond_2
    iget-boolean p1, p0, Lcom/android/zxing/HandGestureDecoder;->mTargetDetected:Z

    if-eqz p1, :cond_3

    const-string p1, "HandGestureDecoder"

    const-string v2, "Triggering countdown..."

    invoke-static {p1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v2, 0xa1

    invoke-virtual {p1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$CameraAction;

    if-eqz p1, :cond_3

    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->isDoingAction()Z

    move-result v2

    if-nez v2, :cond_3

    const/16 v2, 0x64

    invoke-interface {p1, v2}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->onShutterButtonClick(I)V

    iput-boolean v1, p0, Lcom/android/zxing/HandGestureDecoder;->mTriggeringPhoto:Z

    iget-object p1, p0, Lcom/android/zxing/HandGestureDecoder;->mContinuousInterval:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v2, 0x3

    sget v3, Lcom/android/zxing/HandGestureDecoder;->DETECTION_FRAMES_PER_SECOND:I

    mul-int/2addr v2, v3

    invoke-virtual {p1, v2}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object p1

    iget-boolean v2, p0, Lcom/android/zxing/HandGestureDecoder;->mTriggeringPhoto:Z

    xor-int/2addr v2, v1

    invoke-virtual {p1, v2}, Lcom/android/camera/data/data/runing/DataItemRunning;->setHandGestureRunning(Z)V

    iput-boolean v0, p0, Lcom/android/zxing/HandGestureDecoder;->mTipVisible:Z

    sget p1, Lcom/android/zxing/HandGestureDecoder;->DETECTION_FRAMES_PER_SECOND:I

    iput p1, p0, Lcom/android/zxing/HandGestureDecoder;->mTipShowInterval:I

    :cond_3
    :goto_1
    iget-boolean p1, p0, Lcom/android/zxing/HandGestureDecoder;->mTipVisible:Z

    if-nez p1, :cond_5

    iget p1, p0, Lcom/android/zxing/HandGestureDecoder;->mTipShowInterval:I

    if-gtz p1, :cond_5

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object p1

    invoke-virtual {p1, v1}, Lcom/android/camera/data/data/runing/DataItemRunning;->setHandGestureRunning(Z)V

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v0, 0xac

    invoke-virtual {p1, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    if-eqz p1, :cond_4

    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->isExtraMenuShowing()Z

    move-result v0

    if-nez v0, :cond_4

    invoke-interface {p1, v1}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->reInitAlert(Z)V

    :cond_4
    iput-boolean v1, p0, Lcom/android/zxing/HandGestureDecoder;->mTipVisible:Z

    :cond_5
    iget p1, p0, Lcom/android/zxing/HandGestureDecoder;->mTipShowInterval:I

    if-lez p1, :cond_6

    iget p1, p0, Lcom/android/zxing/HandGestureDecoder;->mTipShowInterval:I

    sub-int/2addr p1, v1

    iput p1, p0, Lcom/android/zxing/HandGestureDecoder;->mTipShowInterval:I

    :cond_6
    return-void
.end method


# virtual methods
.method protected decode(Lcom/android/zxing/PreviewImage;)I
    .locals 4

    invoke-virtual {p1}, Lcom/android/zxing/PreviewImage;->getOrientation()I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    :cond_0
    iget v1, p0, Lcom/android/zxing/HandGestureDecoder;->mCameraId:I

    const/4 v2, 0x1

    if-ne v1, v2, :cond_1

    rsub-int v0, v0, 0x10e

    goto :goto_0

    :cond_1
    const/16 v1, 0x5a

    add-int/2addr v1, v0

    rem-int/lit16 v0, v1, 0x168

    :goto_0
    iget-object v1, p0, Lcom/android/zxing/HandGestureDecoder;->mHandGesture:Lcom/android/camera/handgesture/HandGesture;

    invoke-virtual {p1}, Lcom/android/zxing/PreviewImage;->getData()[B

    move-result-object v2

    invoke-virtual {p1}, Lcom/android/zxing/PreviewImage;->getWidth()I

    move-result v3

    invoke-virtual {p1}, Lcom/android/zxing/PreviewImage;->getHeight()I

    move-result p1

    invoke-virtual {v1, v2, v3, p1, v0}, Lcom/android/camera/handgesture/HandGesture;->detectGesture([BIII)I

    move-result p1

    return p1
.end method

.method public init(I)V
    .locals 3

    invoke-virtual {p0}, Lcom/android/zxing/HandGestureDecoder;->reset()V

    iput p1, p0, Lcom/android/zxing/HandGestureDecoder;->mCameraId:I

    iget-object v0, p0, Lcom/android/zxing/HandGestureDecoder;->mSubjects:Lio/reactivex/subjects/PublishSubject;

    new-instance v1, Lcom/android/zxing/PreviewImage;

    const/4 v2, 0x1

    invoke-direct {v1, v2, p1}, Lcom/android/zxing/PreviewImage;-><init>(II)V

    invoke-virtual {v0, v1}, Lio/reactivex/subjects/PublishSubject;->onNext(Ljava/lang/Object;)V

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object p1

    invoke-virtual {p1, v2}, Lcom/android/camera/data/data/runing/DataItemRunning;->setHandGestureRunning(Z)V

    return-void
.end method

.method public needPreviewFrame()Z
    .locals 1

    invoke-static {}, Lcom/android/camera/CameraSettings;->isHandGestureOpen()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-super {p0}, Lcom/android/zxing/Decoder;->needPreviewFrame()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public onPreviewFrame(Lcom/android/zxing/PreviewImage;)V
    .locals 1

    iget-object v0, p0, Lcom/android/zxing/HandGestureDecoder;->mSubjects:Lio/reactivex/subjects/PublishSubject;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/zxing/HandGestureDecoder;->mSubjects:Lio/reactivex/subjects/PublishSubject;

    invoke-virtual {v0, p1}, Lio/reactivex/subjects/PublishSubject;->onNext(Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method public quit()V
    .locals 4

    invoke-super {p0}, Lcom/android/zxing/Decoder;->quit()V

    iget-object v0, p0, Lcom/android/zxing/HandGestureDecoder;->mSubjects:Lio/reactivex/subjects/PublishSubject;

    new-instance v1, Lcom/android/zxing/PreviewImage;

    iget v2, p0, Lcom/android/zxing/HandGestureDecoder;->mCameraId:I

    const/4 v3, 0x3

    invoke-direct {v1, v3, v2}, Lcom/android/zxing/PreviewImage;-><init>(II)V

    invoke-virtual {v0, v1}, Lio/reactivex/subjects/PublishSubject;->onNext(Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/android/zxing/HandGestureDecoder;->mSubjects:Lio/reactivex/subjects/PublishSubject;

    invoke-virtual {v0}, Lio/reactivex/subjects/PublishSubject;->onComplete()V

    return-void
.end method

.method public reset()V
    .locals 2

    const-string v0, "HandGestureDecoder"

    const-string v1, "Reset"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/zxing/HandGestureDecoder;->mDecodingCount:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    iput-boolean v1, p0, Lcom/android/zxing/HandGestureDecoder;->mTriggeringPhoto:Z

    return-void
.end method

.method public startDecode()V
    .locals 2

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/zxing/HandGestureDecoder;->mDecoding:Z

    iget-object v0, p0, Lcom/android/zxing/HandGestureDecoder;->mDecodingCount:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    return-void
.end method
