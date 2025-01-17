.class public Lcom/miui/extravideo/interpolation/VideoInterpolator;
.super Ljava/lang/Object;
.source "VideoInterpolator.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "VideoInterpolator"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static doDecodeAndEncodeAsync(Ljava/lang/String;Ljava/lang/String;ZLcom/miui/extravideo/interpolation/EncodeListener;)V
    .locals 5

    const-string v0, "VideoInterpolator"

    const-string v1, "start doDecodeAndEncode async mode sdk version : %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const-string v3, "0.9.1"

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;

    invoke-direct {v0, p0, p1, p2}, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    invoke-virtual {v0, p3}, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;->setEncodeListener(Lcom/miui/extravideo/interpolation/EncodeListener;)V

    invoke-virtual {v0}, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;->doDecodeAndEncode()V

    return-void
.end method

.method public static doDecodeAndEncodeSync(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1

    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Lcom/miui/extravideo/interpolation/VideoInterpolator;->doDecodeAndEncodeSync(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result p0

    return p0
.end method

.method public static doDecodeAndEncodeSync(Ljava/lang/String;Ljava/lang/String;Z)Z
    .locals 6

    const-string v0, "VideoInterpolator"

    const-string v1, "start doDecodeAndEncode sync mode sdk version : %s"

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Object;

    const-string v4, "0.9.1"

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-static {v1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-array v0, v2, [Z

    new-instance v1, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {v1}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->newCondition()Ljava/util/concurrent/locks/Condition;

    move-result-object v2

    new-instance v3, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;

    invoke-direct {v3, p0, p1, p2}, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    new-instance p0, Lcom/miui/extravideo/interpolation/VideoInterpolator$1;

    invoke-direct {p0, v1, v0, v2}, Lcom/miui/extravideo/interpolation/VideoInterpolator$1;-><init>(Ljava/util/concurrent/locks/Lock;[ZLjava/util/concurrent/locks/Condition;)V

    invoke-virtual {v3, p0}, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;->setEncodeListener(Lcom/miui/extravideo/interpolation/EncodeListener;)V

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->lock()V

    :try_start_0
    invoke-virtual {v3}, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;->doDecodeAndEncode()V

    invoke-interface {v2}, Ljava/util/concurrent/locks/Condition;->await()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_0
    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    goto :goto_1

    :catchall_0
    move-exception p0

    goto :goto_2

    :catch_0
    move-exception p0

    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    aput-boolean v5, v0, v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :goto_1
    aget-boolean p0, v0, v5

    return p0

    :goto_2
    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw p0
.end method
