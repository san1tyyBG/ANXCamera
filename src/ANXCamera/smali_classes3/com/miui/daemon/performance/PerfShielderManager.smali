.class public Lcom/miui/daemon/performance/PerfShielderManager;
.super Ljava/lang/Object;
.source "PerfShielderManager.java"


# static fields
.field public static final PerfShieldService:Ljava/lang/String; = "perfshielder"

.field private static volatile sPerfManager:Lcom/android/internal/app/IPerfShielder;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static checkService()Z
    .registers 1

    invoke-static {}, Lcom/miui/daemon/performance/PerfShielderManager;->getService()Lcom/android/internal/app/IPerfShielder;

    move-result-object v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    goto :goto_9

    :cond_8
    const/4 v0, 0x0

    :goto_9
    return v0
.end method

.method public static getFreeMemory()Ljava/lang/Long;
    .registers 4

    invoke-static {}, Lcom/miui/daemon/performance/PerfShielderManager;->checkService()Z

    const-wide/16 v0, 0x0

    sget-object v2, Lcom/miui/daemon/performance/PerfShielderManager;->sPerfManager:Lcom/android/internal/app/IPerfShielder;

    if-eqz v2, :cond_19

    :try_start_9
    sget-object v2, Lcom/miui/daemon/performance/PerfShielderManager;->sPerfManager:Lcom/android/internal/app/IPerfShielder;

    invoke-interface {v2}, Lcom/android/internal/app/IPerfShielder;->getFreeMemory()J

    move-result-wide v2
    :try_end_f
    .catch Landroid/os/RemoteException; {:try_start_9 .. :try_end_f} :catch_11

    move-wide v0, v2

    goto :goto_19

    :catch_11
    move-exception v2

    invoke-static {}, Landroid/os/Process;->getFreeMemory()J

    move-result-wide v0

    invoke-virtual {v2}, Landroid/os/RemoteException;->printStackTrace()V

    :cond_19
    :goto_19
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    return-object v2
.end method

.method public static getService()Lcom/android/internal/app/IPerfShielder;
    .registers 4

    sget-object v0, Lcom/miui/daemon/performance/PerfShielderManager;->sPerfManager:Lcom/android/internal/app/IPerfShielder;

    if-nez v0, :cond_24

    const-class v0, Lcom/miui/daemon/performance/PerfShielderManager;

    monitor-enter v0

    :try_start_7
    sget-object v1, Lcom/miui/daemon/performance/PerfShielderManager;->sPerfManager:Lcom/android/internal/app/IPerfShielder;

    if-nez v1, :cond_1f

    const-string v1, "perfshielder"

    invoke-static {v1}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v1

    invoke-static {v1}, Lcom/android/internal/app/IPerfShielder$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/app/IPerfShielder;

    move-result-object v1

    const-class v2, Lcom/miui/daemon/performance/PerfShielderManager;

    monitor-enter v2
    :try_end_18
    .catchall {:try_start_7 .. :try_end_18} :catchall_21

    :try_start_18
    sput-object v1, Lcom/miui/daemon/performance/PerfShielderManager;->sPerfManager:Lcom/android/internal/app/IPerfShielder;

    monitor-exit v2

    goto :goto_1f

    :catchall_1c
    move-exception v3

    monitor-exit v2
    :try_end_1e
    .catchall {:try_start_18 .. :try_end_1e} :catchall_1c

    :try_start_1e
    throw v3

    :cond_1f
    :goto_1f
    monitor-exit v0

    goto :goto_24

    :catchall_21
    move-exception v1

    monitor-exit v0
    :try_end_23
    .catchall {:try_start_1e .. :try_end_23} :catchall_21

    throw v1

    :cond_24
    :goto_24
    sget-object v0, Lcom/miui/daemon/performance/PerfShielderManager;->sPerfManager:Lcom/android/internal/app/IPerfShielder;

    return-object v0
.end method
