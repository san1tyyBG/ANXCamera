.class Landroid/support/v4/media/MediaSession2ImplBase$MyPlayerEventCallback$1;
.super Ljava/lang/Object;
.source "MediaSession2ImplBase.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/support/v4/media/MediaSession2ImplBase$MyPlayerEventCallback;->onCurrentDataSourceChanged(Landroid/support/v4/media/BaseMediaPlayer;Landroid/support/v4/media/DataSourceDesc;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/support/v4/media/MediaSession2ImplBase$MyPlayerEventCallback;

.field final synthetic val$dsd:Landroid/support/v4/media/DataSourceDesc;

.field final synthetic val$player:Landroid/support/v4/media/BaseMediaPlayer;

.field final synthetic val$session:Landroid/support/v4/media/MediaSession2ImplBase;


# direct methods
.method constructor <init>(Landroid/support/v4/media/MediaSession2ImplBase$MyPlayerEventCallback;Landroid/support/v4/media/DataSourceDesc;Landroid/support/v4/media/MediaSession2ImplBase;Landroid/support/v4/media/BaseMediaPlayer;)V
    .locals 0

    iput-object p1, p0, Landroid/support/v4/media/MediaSession2ImplBase$MyPlayerEventCallback$1;->this$0:Landroid/support/v4/media/MediaSession2ImplBase$MyPlayerEventCallback;

    iput-object p2, p0, Landroid/support/v4/media/MediaSession2ImplBase$MyPlayerEventCallback$1;->val$dsd:Landroid/support/v4/media/DataSourceDesc;

    iput-object p3, p0, Landroid/support/v4/media/MediaSession2ImplBase$MyPlayerEventCallback$1;->val$session:Landroid/support/v4/media/MediaSession2ImplBase;

    iput-object p4, p0, Landroid/support/v4/media/MediaSession2ImplBase$MyPlayerEventCallback$1;->val$player:Landroid/support/v4/media/BaseMediaPlayer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    iget-object v0, p0, Landroid/support/v4/media/MediaSession2ImplBase$MyPlayerEventCallback$1;->val$dsd:Landroid/support/v4/media/DataSourceDesc;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Landroid/support/v4/media/MediaSession2ImplBase$MyPlayerEventCallback$1;->this$0:Landroid/support/v4/media/MediaSession2ImplBase$MyPlayerEventCallback;

    iget-object v1, p0, Landroid/support/v4/media/MediaSession2ImplBase$MyPlayerEventCallback$1;->val$session:Landroid/support/v4/media/MediaSession2ImplBase;

    iget-object v2, p0, Landroid/support/v4/media/MediaSession2ImplBase$MyPlayerEventCallback$1;->val$dsd:Landroid/support/v4/media/DataSourceDesc;

    invoke-static {v0, v1, v2}, Landroid/support/v4/media/MediaSession2ImplBase$MyPlayerEventCallback;->access$300(Landroid/support/v4/media/MediaSession2ImplBase$MyPlayerEventCallback;Landroid/support/v4/media/MediaSession2ImplBase;Landroid/support/v4/media/DataSourceDesc;)Landroid/support/v4/media/MediaItem2;

    move-result-object v0

    if-nez v0, :cond_1

    const-string v0, "MS2ImplBase"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Cannot obtain media item from the dsd="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Landroid/support/v4/media/MediaSession2ImplBase$MyPlayerEventCallback$1;->val$dsd:Landroid/support/v4/media/DataSourceDesc;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_1
    :goto_0
    iget-object v1, p0, Landroid/support/v4/media/MediaSession2ImplBase$MyPlayerEventCallback$1;->val$session:Landroid/support/v4/media/MediaSession2ImplBase;

    invoke-virtual {v1}, Landroid/support/v4/media/MediaSession2ImplBase;->getCallback()Landroid/support/v4/media/MediaSession2$SessionCallback;

    move-result-object v1

    iget-object v2, p0, Landroid/support/v4/media/MediaSession2ImplBase$MyPlayerEventCallback$1;->val$session:Landroid/support/v4/media/MediaSession2ImplBase;

    invoke-virtual {v2}, Landroid/support/v4/media/MediaSession2ImplBase;->getInstance()Landroid/support/v4/media/MediaSession2;

    move-result-object v2

    iget-object v3, p0, Landroid/support/v4/media/MediaSession2ImplBase$MyPlayerEventCallback$1;->val$player:Landroid/support/v4/media/BaseMediaPlayer;

    invoke-virtual {v1, v2, v3, v0}, Landroid/support/v4/media/MediaSession2$SessionCallback;->onCurrentMediaItemChanged(Landroid/support/v4/media/MediaSession2;Landroid/support/v4/media/BaseMediaPlayer;Landroid/support/v4/media/MediaItem2;)V

    iget-object v1, p0, Landroid/support/v4/media/MediaSession2ImplBase$MyPlayerEventCallback$1;->val$session:Landroid/support/v4/media/MediaSession2ImplBase;

    new-instance v2, Landroid/support/v4/media/MediaSession2ImplBase$MyPlayerEventCallback$1$1;

    invoke-direct {v2, p0, v0}, Landroid/support/v4/media/MediaSession2ImplBase$MyPlayerEventCallback$1$1;-><init>(Landroid/support/v4/media/MediaSession2ImplBase$MyPlayerEventCallback$1;Landroid/support/v4/media/MediaItem2;)V

    invoke-virtual {v1, v2}, Landroid/support/v4/media/MediaSession2ImplBase;->notifyToAllControllers(Landroid/support/v4/media/MediaSession2ImplBase$NotifyRunnable;)V

    return-void
.end method
