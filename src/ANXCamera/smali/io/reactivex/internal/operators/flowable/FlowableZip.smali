.class public final Lio/reactivex/internal/operators/flowable/FlowableZip;
.super Lio/reactivex/Flowable;
.source "FlowableZip.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/operators/flowable/FlowableZip$ZipSubscriber;,
        Lio/reactivex/internal/operators/flowable/FlowableZip$ZipCoordinator;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "R:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/Flowable<",
        "TR;>;"
    }
.end annotation


# instance fields
.field final bufferSize:I

.field final delayError:Z

.field final sources:[Lorg/reactivestreams/Publisher;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Lorg/reactivestreams/Publisher<",
            "+TT;>;"
        }
    .end annotation
.end field

.field final sourcesIterable:Ljava/lang/Iterable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Iterable<",
            "+",
            "Lorg/reactivestreams/Publisher<",
            "+TT;>;>;"
        }
    .end annotation
.end field

.field final zipper:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function<",
            "-[",
            "Ljava/lang/Object;",
            "+TR;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>([Lorg/reactivestreams/Publisher;Ljava/lang/Iterable;Lio/reactivex/functions/Function;IZ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lorg/reactivestreams/Publisher<",
            "+TT;>;",
            "Ljava/lang/Iterable<",
            "+",
            "Lorg/reactivestreams/Publisher<",
            "+TT;>;>;",
            "Lio/reactivex/functions/Function<",
            "-[",
            "Ljava/lang/Object;",
            "+TR;>;IZ)V"
        }
    .end annotation

    invoke-direct {p0}, Lio/reactivex/Flowable;-><init>()V

    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableZip;->sources:[Lorg/reactivestreams/Publisher;

    iput-object p2, p0, Lio/reactivex/internal/operators/flowable/FlowableZip;->sourcesIterable:Ljava/lang/Iterable;

    iput-object p3, p0, Lio/reactivex/internal/operators/flowable/FlowableZip;->zipper:Lio/reactivex/functions/Function;

    iput p4, p0, Lio/reactivex/internal/operators/flowable/FlowableZip;->bufferSize:I

    iput-boolean p5, p0, Lio/reactivex/internal/operators/flowable/FlowableZip;->delayError:Z

    return-void
.end method


# virtual methods
.method public subscribeActual(Lorg/reactivestreams/Subscriber;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber<",
            "-TR;>;)V"
        }
    .end annotation

    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableZip;->sources:[Lorg/reactivestreams/Publisher;

    nop

    if-nez v0, :cond_2

    const/16 v0, 0x8

    new-array v0, v0, [Lorg/reactivestreams/Publisher;

    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableZip;->sourcesIterable:Ljava/lang/Iterable;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    const/4 v2, 0x0

    move-object v3, v0

    move v0, v2

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/reactivestreams/Publisher;

    array-length v5, v3

    if-ne v0, v5, :cond_0

    shr-int/lit8 v5, v0, 0x2

    add-int/2addr v5, v0

    new-array v5, v5, [Lorg/reactivestreams/Publisher;

    invoke-static {v3, v2, v5, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    nop

    move-object v3, v5

    :cond_0
    add-int/lit8 v5, v0, 0x1

    aput-object v4, v3, v0

    nop

    move v0, v5

    goto :goto_0

    :cond_1
    move-object v1, v3

    goto :goto_1

    :cond_2
    array-length v1, v0

    move v9, v1

    move-object v1, v0

    move v0, v9

    :goto_1
    if-nez v0, :cond_3

    invoke-static {p1}, Lio/reactivex/internal/subscriptions/EmptySubscription;->complete(Lorg/reactivestreams/Subscriber;)V

    return-void

    :cond_3
    new-instance v8, Lio/reactivex/internal/operators/flowable/FlowableZip$ZipCoordinator;

    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowableZip;->zipper:Lio/reactivex/functions/Function;

    iget v6, p0, Lio/reactivex/internal/operators/flowable/FlowableZip;->bufferSize:I

    iget-boolean v7, p0, Lio/reactivex/internal/operators/flowable/FlowableZip;->delayError:Z

    move-object v2, v8

    move-object v3, p1

    move v5, v0

    invoke-direct/range {v2 .. v7}, Lio/reactivex/internal/operators/flowable/FlowableZip$ZipCoordinator;-><init>(Lorg/reactivestreams/Subscriber;Lio/reactivex/functions/Function;IIZ)V

    invoke-interface {p1, v8}, Lorg/reactivestreams/Subscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V

    invoke-virtual {v8, v1, v0}, Lio/reactivex/internal/operators/flowable/FlowableZip$ZipCoordinator;->subscribe([Lorg/reactivestreams/Publisher;I)V

    return-void
.end method
