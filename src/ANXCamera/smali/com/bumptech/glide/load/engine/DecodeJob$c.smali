.class Lcom/bumptech/glide/load/engine/DecodeJob$c;
.super Ljava/lang/Object;
.source "DecodeJob.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bumptech/glide/load/engine/DecodeJob;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "c"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Z:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private gA:Lcom/bumptech/glide/load/h;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/load/h<",
            "TZ;>;"
        }
    .end annotation
.end field

.field private gB:Lcom/bumptech/glide/load/engine/o;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/load/engine/o<",
            "TZ;>;"
        }
    .end annotation
.end field

.field private key:Lcom/bumptech/glide/load/c;


# direct methods
.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method a(Lcom/bumptech/glide/load/c;Lcom/bumptech/glide/load/h;Lcom/bumptech/glide/load/engine/o;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<X:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/bumptech/glide/load/c;",
            "Lcom/bumptech/glide/load/h<",
            "TX;>;",
            "Lcom/bumptech/glide/load/engine/o<",
            "TX;>;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/bumptech/glide/load/engine/DecodeJob$c;->key:Lcom/bumptech/glide/load/c;

    iput-object p2, p0, Lcom/bumptech/glide/load/engine/DecodeJob$c;->gA:Lcom/bumptech/glide/load/h;

    iput-object p3, p0, Lcom/bumptech/glide/load/engine/DecodeJob$c;->gB:Lcom/bumptech/glide/load/engine/o;

    return-void
.end method

.method a(Lcom/bumptech/glide/load/engine/DecodeJob$d;Lcom/bumptech/glide/load/f;)V
    .locals 4

    const-string v0, "DecodeJob.encode"

    invoke-static {v0}, Lcom/bumptech/glide/util/a/b;->beginSection(Ljava/lang/String;)V

    :try_start_0
    invoke-interface {p1}, Lcom/bumptech/glide/load/engine/DecodeJob$d;->aW()Lcom/bumptech/glide/load/engine/a/a;

    move-result-object p1

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/DecodeJob$c;->key:Lcom/bumptech/glide/load/c;

    new-instance v1, Lcom/bumptech/glide/load/engine/c;

    iget-object v2, p0, Lcom/bumptech/glide/load/engine/DecodeJob$c;->gA:Lcom/bumptech/glide/load/h;

    iget-object v3, p0, Lcom/bumptech/glide/load/engine/DecodeJob$c;->gB:Lcom/bumptech/glide/load/engine/o;

    invoke-direct {v1, v2, v3, p2}, Lcom/bumptech/glide/load/engine/c;-><init>(Lcom/bumptech/glide/load/a;Ljava/lang/Object;Lcom/bumptech/glide/load/f;)V

    invoke-interface {p1, v0, v1}, Lcom/bumptech/glide/load/engine/a/a;->a(Lcom/bumptech/glide/load/c;Lcom/bumptech/glide/load/engine/a/a$b;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object p1, p0, Lcom/bumptech/glide/load/engine/DecodeJob$c;->gB:Lcom/bumptech/glide/load/engine/o;

    invoke-virtual {p1}, Lcom/bumptech/glide/load/engine/o;->unlock()V

    invoke-static {}, Lcom/bumptech/glide/util/a/b;->endSection()V

    nop

    return-void

    :catchall_0
    move-exception p1

    iget-object p2, p0, Lcom/bumptech/glide/load/engine/DecodeJob$c;->gB:Lcom/bumptech/glide/load/engine/o;

    invoke-virtual {p2}, Lcom/bumptech/glide/load/engine/o;->unlock()V

    invoke-static {}, Lcom/bumptech/glide/util/a/b;->endSection()V

    throw p1
.end method

.method br()Z
    .locals 1

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/DecodeJob$c;->gB:Lcom/bumptech/glide/load/engine/o;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method clear()V
    .locals 1

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/bumptech/glide/load/engine/DecodeJob$c;->key:Lcom/bumptech/glide/load/c;

    iput-object v0, p0, Lcom/bumptech/glide/load/engine/DecodeJob$c;->gA:Lcom/bumptech/glide/load/h;

    iput-object v0, p0, Lcom/bumptech/glide/load/engine/DecodeJob$c;->gB:Lcom/bumptech/glide/load/engine/o;

    return-void
.end method
