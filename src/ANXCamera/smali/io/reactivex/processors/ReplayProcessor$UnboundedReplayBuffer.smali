.class final Lio/reactivex/processors/ReplayProcessor$UnboundedReplayBuffer;
.super Ljava/lang/Object;
.source "ReplayProcessor.java"

# interfaces
.implements Lio/reactivex/processors/ReplayProcessor$ReplayBuffer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/processors/ReplayProcessor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "UnboundedReplayBuffer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lio/reactivex/processors/ReplayProcessor$ReplayBuffer<",
        "TT;>;"
    }
.end annotation


# instance fields
.field final buffer:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation
.end field

.field volatile done:Z

.field error:Ljava/lang/Throwable;

.field volatile size:I


# direct methods
.method constructor <init>(I)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    const-string v1, "capacityHint"

    invoke-static {p1, v1}, Lio/reactivex/internal/functions/ObjectHelper;->verifyPositive(ILjava/lang/String;)I

    move-result p1

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lio/reactivex/processors/ReplayProcessor$UnboundedReplayBuffer;->buffer:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public complete()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/processors/ReplayProcessor$UnboundedReplayBuffer;->done:Z

    return-void
.end method

.method public error(Ljava/lang/Throwable;)V
    .locals 0

    iput-object p1, p0, Lio/reactivex/processors/ReplayProcessor$UnboundedReplayBuffer;->error:Ljava/lang/Throwable;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lio/reactivex/processors/ReplayProcessor$UnboundedReplayBuffer;->done:Z

    return-void
.end method

.method public getError()Ljava/lang/Throwable;
    .locals 1

    iget-object v0, p0, Lio/reactivex/processors/ReplayProcessor$UnboundedReplayBuffer;->error:Ljava/lang/Throwable;

    return-object v0
.end method

.method public getValue()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    iget v0, p0, Lio/reactivex/processors/ReplayProcessor$UnboundedReplayBuffer;->size:I

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    :cond_0
    iget-object v1, p0, Lio/reactivex/processors/ReplayProcessor$UnboundedReplayBuffer;->buffer:Ljava/util/List;

    add-int/lit8 v0, v0, -0x1

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getValues([Ljava/lang/Object;)[Ljava/lang/Object;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TT;)[TT;"
        }
    .end annotation

    iget v0, p0, Lio/reactivex/processors/ReplayProcessor$UnboundedReplayBuffer;->size:I

    const/4 v1, 0x0

    const/4 v2, 0x0

    if-nez v0, :cond_1

    array-length v0, p1

    if-eqz v0, :cond_0

    aput-object v1, p1, v2

    :cond_0
    return-object p1

    :cond_1
    iget-object v3, p0, Lio/reactivex/processors/ReplayProcessor$UnboundedReplayBuffer;->buffer:Ljava/util/List;

    array-length v4, p1

    if-ge v4, v0, :cond_2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object p1

    invoke-static {p1, v0}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Ljava/lang/Object;

    :cond_2
    :goto_0
    if-ge v2, v0, :cond_3

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    aput-object v4, p1, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_3
    array-length v2, p1

    if-le v2, v0, :cond_4

    aput-object v1, p1, v0

    :cond_4
    return-object p1
.end method

.method public isDone()Z
    .locals 1

    iget-boolean v0, p0, Lio/reactivex/processors/ReplayProcessor$UnboundedReplayBuffer;->done:Z

    return v0
.end method

.method public next(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    iget-object v0, p0, Lio/reactivex/processors/ReplayProcessor$UnboundedReplayBuffer;->buffer:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget p1, p0, Lio/reactivex/processors/ReplayProcessor$UnboundedReplayBuffer;->size:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lio/reactivex/processors/ReplayProcessor$UnboundedReplayBuffer;->size:I

    return-void
.end method

.method public replay(Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;)V
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/processors/ReplayProcessor$ReplaySubscription<",
            "TT;>;)V"
        }
    .end annotation

    invoke-virtual {p1}, Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;->getAndIncrement()I

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    nop

    iget-object v0, p0, Lio/reactivex/processors/ReplayProcessor$UnboundedReplayBuffer;->buffer:Ljava/util/List;

    iget-object v1, p1, Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;->actual:Lorg/reactivestreams/Subscriber;

    iget-object v2, p1, Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;->index:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Integer;

    const/4 v3, 0x0

    if-eqz v2, :cond_1

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v3

    goto :goto_0

    :cond_1
    nop

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iput-object v2, p1, Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;->index:Ljava/lang/Object;

    :goto_0
    iget-wide v4, p1, Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;->emitted:J

    const/4 v2, 0x1

    move v6, v2

    :goto_1
    iget-object v7, p1, Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v7}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v7

    :goto_2
    cmp-long v9, v4, v7

    const/4 v10, 0x0

    if-eqz v9, :cond_6

    iget-boolean v11, p1, Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;->cancelled:Z

    if-eqz v11, :cond_2

    iput-object v10, p1, Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;->index:Ljava/lang/Object;

    return-void

    :cond_2
    iget-boolean v11, p0, Lio/reactivex/processors/ReplayProcessor$UnboundedReplayBuffer;->done:Z

    iget v12, p0, Lio/reactivex/processors/ReplayProcessor$UnboundedReplayBuffer;->size:I

    if-eqz v11, :cond_4

    if-ne v3, v12, :cond_4

    iput-object v10, p1, Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;->index:Ljava/lang/Object;

    iput-boolean v2, p1, Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;->cancelled:Z

    iget-object p1, p0, Lio/reactivex/processors/ReplayProcessor$UnboundedReplayBuffer;->error:Ljava/lang/Throwable;

    if-nez p1, :cond_3

    invoke-interface {v1}, Lorg/reactivestreams/Subscriber;->onComplete()V

    goto :goto_3

    :cond_3
    invoke-interface {v1, p1}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    :goto_3
    return-void

    :cond_4
    if-ne v3, v12, :cond_5

    goto :goto_4

    :cond_5
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    invoke-interface {v1, v9}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    add-int/lit8 v3, v3, 0x1

    const-wide/16 v9, 0x1

    add-long/2addr v4, v9

    goto :goto_2

    :cond_6
    :goto_4
    if-nez v9, :cond_9

    iget-boolean v7, p1, Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;->cancelled:Z

    if-eqz v7, :cond_7

    iput-object v10, p1, Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;->index:Ljava/lang/Object;

    return-void

    :cond_7
    iget-boolean v7, p0, Lio/reactivex/processors/ReplayProcessor$UnboundedReplayBuffer;->done:Z

    iget v8, p0, Lio/reactivex/processors/ReplayProcessor$UnboundedReplayBuffer;->size:I

    if-eqz v7, :cond_9

    if-ne v3, v8, :cond_9

    iput-object v10, p1, Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;->index:Ljava/lang/Object;

    iput-boolean v2, p1, Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;->cancelled:Z

    iget-object p1, p0, Lio/reactivex/processors/ReplayProcessor$UnboundedReplayBuffer;->error:Ljava/lang/Throwable;

    if-nez p1, :cond_8

    invoke-interface {v1}, Lorg/reactivestreams/Subscriber;->onComplete()V

    goto :goto_5

    :cond_8
    invoke-interface {v1, p1}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    :goto_5
    return-void

    :cond_9
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    iput-object v7, p1, Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;->index:Ljava/lang/Object;

    iput-wide v4, p1, Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;->emitted:J

    neg-int v6, v6

    invoke-virtual {p1, v6}, Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;->addAndGet(I)I

    move-result v6

    if-nez v6, :cond_a

    nop

    return-void

    :cond_a
    goto :goto_1
.end method

.method public size()I
    .locals 1

    iget v0, p0, Lio/reactivex/processors/ReplayProcessor$UnboundedReplayBuffer;->size:I

    return v0
.end method
