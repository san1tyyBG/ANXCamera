.class public Lbytedance/framwork/core/sdkmonitor/CacheData;
.super Ljava/lang/Object;
.source "CacheData.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lbytedance/framwork/core/sdkmonitor/CacheData$SerViceMonitorData;
    }
.end annotation


# instance fields
.field private MAX_LIMIT_SIZE:I

.field private mHasHandleCache:Z

.field private final mServiceMonitorData:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Lbytedance/framwork/core/sdkmonitor/CacheData$SerViceMonitorData;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lbytedance/framwork/core/sdkmonitor/CacheData;->mServiceMonitorData:Ljava/util/LinkedList;

    const/16 v0, 0x64

    iput v0, p0, Lbytedance/framwork/core/sdkmonitor/CacheData;->MAX_LIMIT_SIZE:I

    return-void
.end method

.method static synthetic access$000(Lbytedance/framwork/core/sdkmonitor/CacheData;)Ljava/util/LinkedList;
    .locals 0

    iget-object p0, p0, Lbytedance/framwork/core/sdkmonitor/CacheData;->mServiceMonitorData:Ljava/util/LinkedList;

    return-object p0
.end method

.method static synthetic access$100(Lbytedance/framwork/core/sdkmonitor/CacheData;Lbytedance/framwork/core/sdkmonitor/SDKMonitor;Lbytedance/framwork/core/sdkmonitor/CacheData$SerViceMonitorData;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lbytedance/framwork/core/sdkmonitor/CacheData;->handleServiceMonitorData(Lbytedance/framwork/core/sdkmonitor/SDKMonitor;Lbytedance/framwork/core/sdkmonitor/CacheData$SerViceMonitorData;)V

    return-void
.end method

.method private handleServiceMonitorData(Lbytedance/framwork/core/sdkmonitor/SDKMonitor;Lbytedance/framwork/core/sdkmonitor/CacheData$SerViceMonitorData;)V
    .locals 3

    if-eqz p2, :cond_1

    iget-object v0, p2, Lbytedance/framwork/core/sdkmonitor/CacheData$SerViceMonitorData;->serviceName:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p2, Lbytedance/framwork/core/sdkmonitor/CacheData$SerViceMonitorData;->serviceName:Ljava/lang/String;

    iget v1, p2, Lbytedance/framwork/core/sdkmonitor/CacheData$SerViceMonitorData;->status:I

    iget-object v2, p2, Lbytedance/framwork/core/sdkmonitor/CacheData$SerViceMonitorData;->value:Lorg/json/JSONObject;

    iget-object p2, p2, Lbytedance/framwork/core/sdkmonitor/CacheData$SerViceMonitorData;->extrJson:Lorg/json/JSONObject;

    invoke-virtual {p1, v0, v1, v2, p2}, Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->monitorStatusAndDuration(Ljava/lang/String;ILorg/json/JSONObject;Lorg/json/JSONObject;)V

    return-void

    :cond_1
    :goto_0
    return-void
.end method


# virtual methods
.method public handleCacheData(Lbytedance/framwork/core/sdkmonitor/SDKMonitor;)V
    .locals 2

    iget-boolean v0, p0, Lbytedance/framwork/core/sdkmonitor/CacheData;->mHasHandleCache:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lbytedance/framwork/core/sdkmonitor/CacheData;->mHasHandleCache:Z

    new-instance v0, Lbytedance/framwork/core/sdkmonitor/CacheData$1;

    const-string v1, "handle_cache_monitor_data"

    invoke-direct {v0, p0, v1, p1}, Lbytedance/framwork/core/sdkmonitor/CacheData$1;-><init>(Lbytedance/framwork/core/sdkmonitor/CacheData;Ljava/lang/String;Lbytedance/framwork/core/sdkmonitor/SDKMonitor;)V

    invoke-virtual {v0}, Lbytedance/framwork/core/sdkmonitor/CacheData$1;->start()V

    return-void
.end method

.method public insertServiceMonitorData(Lbytedance/framwork/core/sdkmonitor/CacheData$SerViceMonitorData;)V
    .locals 3

    if-nez p1, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lbytedance/framwork/core/sdkmonitor/CacheData;->mServiceMonitorData:Ljava/util/LinkedList;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lbytedance/framwork/core/sdkmonitor/CacheData;->mServiceMonitorData:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    move-result v1

    iget v2, p0, Lbytedance/framwork/core/sdkmonitor/CacheData;->MAX_LIMIT_SIZE:I

    if-le v1, v2, :cond_1

    iget-object v1, p0, Lbytedance/framwork/core/sdkmonitor/CacheData;->mServiceMonitorData:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->poll()Ljava/lang/Object;

    :cond_1
    iget-object v1, p0, Lbytedance/framwork/core/sdkmonitor/CacheData;->mServiceMonitorData:Ljava/util/LinkedList;

    invoke-virtual {v1, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method
