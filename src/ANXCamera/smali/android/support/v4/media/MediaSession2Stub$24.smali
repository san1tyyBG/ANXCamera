.class Landroid/support/v4/media/MediaSession2Stub$24;
.super Ljava/lang/Object;
.source "MediaSession2Stub.java"

# interfaces
.implements Landroid/support/v4/media/MediaSession2Stub$SessionRunnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/support/v4/media/MediaSession2Stub;->addPlaylistItem(Landroid/support/v4/media/IMediaController2;ILandroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/support/v4/media/MediaSession2Stub;

.field final synthetic val$index:I

.field final synthetic val$mediaItem:Landroid/os/Bundle;


# direct methods
.method constructor <init>(Landroid/support/v4/media/MediaSession2Stub;ILandroid/os/Bundle;)V
    .locals 0

    iput-object p1, p0, Landroid/support/v4/media/MediaSession2Stub$24;->this$0:Landroid/support/v4/media/MediaSession2Stub;

    iput p2, p0, Landroid/support/v4/media/MediaSession2Stub$24;->val$index:I

    iput-object p3, p0, Landroid/support/v4/media/MediaSession2Stub$24;->val$mediaItem:Landroid/os/Bundle;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run(Landroid/support/v4/media/MediaSession2$ControllerInfo;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object p1, p0, Landroid/support/v4/media/MediaSession2Stub$24;->this$0:Landroid/support/v4/media/MediaSession2Stub;

    iget-object p1, p1, Landroid/support/v4/media/MediaSession2Stub;->mSession:Landroid/support/v4/media/MediaSession2$SupportLibraryImpl;

    invoke-interface {p1}, Landroid/support/v4/media/MediaSession2$SupportLibraryImpl;->getInstance()Landroid/support/v4/media/MediaSession2;

    move-result-object p1

    iget v0, p0, Landroid/support/v4/media/MediaSession2Stub$24;->val$index:I

    iget-object v1, p0, Landroid/support/v4/media/MediaSession2Stub$24;->val$mediaItem:Landroid/os/Bundle;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Landroid/support/v4/media/MediaItem2;->fromBundle(Landroid/os/Bundle;Ljava/util/UUID;)Landroid/support/v4/media/MediaItem2;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/support/v4/media/MediaSession2;->addPlaylistItem(ILandroid/support/v4/media/MediaItem2;)V

    return-void
.end method
