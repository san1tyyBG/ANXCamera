.class abstract Lmiui/util/Pools$BasePool;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lmiui/util/Pools$Pool;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lmiui/util/Pools;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x408
    name = "BasePool"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lmiui/util/Pools$Pool<",
        "TT;>;"
    }
.end annotation


# instance fields
.field private final Co:Ljava/lang/Object;

.field private final Jt:I

.field private final LW:Lmiui/util/Pools$Manager;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lmiui/util/Pools$Manager<",
            "TT;>;"
        }
    .end annotation
.end field

.field private LX:Lmiui/util/Pools$IInstanceHolder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lmiui/util/Pools$IInstanceHolder<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lmiui/util/Pools$Manager;I)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lmiui/util/Pools$Manager<",
            "TT;>;I)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lmiui/util/Pools$BasePool$1;

    invoke-direct {v0, p0}, Lmiui/util/Pools$BasePool$1;-><init>(Lmiui/util/Pools$BasePool;)V

    iput-object v0, p0, Lmiui/util/Pools$BasePool;->Co:Ljava/lang/Object;

    if-eqz p1, :cond_31

    const/4 v0, 0x1

    if-lt p2, v0, :cond_31

    iput-object p1, p0, Lmiui/util/Pools$BasePool;->LW:Lmiui/util/Pools$Manager;

    iput p2, p0, Lmiui/util/Pools$BasePool;->Jt:I

    iget-object p1, p0, Lmiui/util/Pools$BasePool;->LW:Lmiui/util/Pools$Manager;

    invoke-virtual {p1}, Lmiui/util/Pools$Manager;->createInstance()Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_29

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p0, v0, p2}, Lmiui/util/Pools$BasePool;->d(Ljava/lang/Class;I)Lmiui/util/Pools$IInstanceHolder;

    move-result-object p2

    iput-object p2, p0, Lmiui/util/Pools$BasePool;->LX:Lmiui/util/Pools$IInstanceHolder;

    invoke-virtual {p0, p1}, Lmiui/util/Pools$BasePool;->doRelease(Ljava/lang/Object;)V

    return-void

    :cond_29
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "manager create instance cannot return null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_31
    iget-object p1, p0, Lmiui/util/Pools$BasePool;->Co:Ljava/lang/Object;

    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result p1

    iput p1, p0, Lmiui/util/Pools$BasePool;->Jt:I

    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "manager cannot be null and size cannot less then 1"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method abstract a(Lmiui/util/Pools$IInstanceHolder;I)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lmiui/util/Pools$IInstanceHolder<",
            "TT;>;I)V"
        }
    .end annotation
.end method

.method public acquire()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    invoke-virtual {p0}, Lmiui/util/Pools$BasePool;->doAcquire()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public close()V
    .registers 3

    iget-object v0, p0, Lmiui/util/Pools$BasePool;->LX:Lmiui/util/Pools$IInstanceHolder;

    if-eqz v0, :cond_e

    iget-object v0, p0, Lmiui/util/Pools$BasePool;->LX:Lmiui/util/Pools$IInstanceHolder;

    iget v1, p0, Lmiui/util/Pools$BasePool;->Jt:I

    invoke-virtual {p0, v0, v1}, Lmiui/util/Pools$BasePool;->a(Lmiui/util/Pools$IInstanceHolder;I)V

    const/4 v0, 0x0

    iput-object v0, p0, Lmiui/util/Pools$BasePool;->LX:Lmiui/util/Pools$IInstanceHolder;

    :cond_e
    return-void
.end method

.method abstract d(Ljava/lang/Class;I)Lmiui/util/Pools$IInstanceHolder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "TT;>;I)",
            "Lmiui/util/Pools$IInstanceHolder<",
            "TT;>;"
        }
    .end annotation
.end method

.method protected final doAcquire()Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    iget-object v0, p0, Lmiui/util/Pools$BasePool;->LX:Lmiui/util/Pools$IInstanceHolder;

    if-eqz v0, :cond_23

    iget-object v0, p0, Lmiui/util/Pools$BasePool;->LX:Lmiui/util/Pools$IInstanceHolder;

    invoke-interface {v0}, Lmiui/util/Pools$IInstanceHolder;->get()Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_1d

    iget-object v0, p0, Lmiui/util/Pools$BasePool;->LW:Lmiui/util/Pools$Manager;

    invoke-virtual {v0}, Lmiui/util/Pools$Manager;->createInstance()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_15

    goto :goto_1d

    :cond_15
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "manager create instance cannot return null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1d
    :goto_1d
    iget-object v1, p0, Lmiui/util/Pools$BasePool;->LW:Lmiui/util/Pools$Manager;

    invoke-virtual {v1, v0}, Lmiui/util/Pools$Manager;->onAcquire(Ljava/lang/Object;)V

    return-object v0

    :cond_23
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cannot acquire object after close()"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected final doRelease(Ljava/lang/Object;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    iget-object v0, p0, Lmiui/util/Pools$BasePool;->LX:Lmiui/util/Pools$IInstanceHolder;

    if-eqz v0, :cond_1a

    if-nez p1, :cond_7

    return-void

    :cond_7
    iget-object v0, p0, Lmiui/util/Pools$BasePool;->LW:Lmiui/util/Pools$Manager;

    invoke-virtual {v0, p1}, Lmiui/util/Pools$Manager;->onRelease(Ljava/lang/Object;)V

    iget-object v0, p0, Lmiui/util/Pools$BasePool;->LX:Lmiui/util/Pools$IInstanceHolder;

    invoke-interface {v0, p1}, Lmiui/util/Pools$IInstanceHolder;->put(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_19

    iget-object v0, p0, Lmiui/util/Pools$BasePool;->LW:Lmiui/util/Pools$Manager;

    invoke-virtual {v0, p1}, Lmiui/util/Pools$Manager;->onDestroy(Ljava/lang/Object;)V

    :cond_19
    return-void

    :cond_1a
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Cannot release object after close()"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public getSize()I
    .registers 2

    iget-object v0, p0, Lmiui/util/Pools$BasePool;->LX:Lmiui/util/Pools$IInstanceHolder;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    goto :goto_8

    :cond_6
    iget v0, p0, Lmiui/util/Pools$BasePool;->Jt:I

    :goto_8
    return v0
.end method

.method public release(Ljava/lang/Object;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    invoke-virtual {p0, p1}, Lmiui/util/Pools$BasePool;->doRelease(Ljava/lang/Object;)V

    return-void
.end method
