.class public Lcom/bumptech/glide/load/engine/a/k;
.super Ljava/lang/Object;
.source "MemoryCacheAdapter.java"

# interfaces
.implements Lcom/bumptech/glide/load/engine/a/j;


# instance fields
.field private jo:Lcom/bumptech/glide/load/engine/a/j$a;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public O()V
    .locals 0

    return-void
.end method

.method public a(Lcom/bumptech/glide/load/engine/a/j$a;)V
    .locals 0
    .param p1    # Lcom/bumptech/glide/load/engine/a/j$a;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iput-object p1, p0, Lcom/bumptech/glide/load/engine/a/k;->jo:Lcom/bumptech/glide/load/engine/a/j$a;

    return-void
.end method

.method public b(Lcom/bumptech/glide/load/c;Lcom/bumptech/glide/load/engine/p;)Lcom/bumptech/glide/load/engine/p;
    .locals 0
    .param p1    # Lcom/bumptech/glide/load/c;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/bumptech/glide/load/engine/p;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/c;",
            "Lcom/bumptech/glide/load/engine/p<",
            "*>;)",
            "Lcom/bumptech/glide/load/engine/p<",
            "*>;"
        }
    .end annotation

    if-eqz p2, :cond_0

    iget-object p1, p0, Lcom/bumptech/glide/load/engine/a/k;->jo:Lcom/bumptech/glide/load/engine/a/j$a;

    invoke-interface {p1, p2}, Lcom/bumptech/glide/load/engine/a/j$a;->e(Lcom/bumptech/glide/load/engine/p;)V

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public b(F)V
    .locals 0

    return-void
.end method

.method public cg()J
    .locals 2

    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public g(Lcom/bumptech/glide/load/c;)Lcom/bumptech/glide/load/engine/p;
    .locals 0
    .param p1    # Lcom/bumptech/glide/load/c;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/c;",
            ")",
            "Lcom/bumptech/glide/load/engine/p<",
            "*>;"
        }
    .end annotation

    const/4 p1, 0x0

    return-object p1
.end method

.method public getMaxSize()J
    .locals 2

    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public trimMemory(I)V
    .locals 0

    return-void
.end method
