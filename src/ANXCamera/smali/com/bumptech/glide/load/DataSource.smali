.class public final enum Lcom/bumptech/glide/load/DataSource;
.super Ljava/lang/Enum;
.source "DataSource.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/bumptech/glide/load/DataSource;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum eh:Lcom/bumptech/glide/load/DataSource;

.field public static final enum ei:Lcom/bumptech/glide/load/DataSource;

.field public static final enum ej:Lcom/bumptech/glide/load/DataSource;

.field public static final enum ek:Lcom/bumptech/glide/load/DataSource;

.field public static final enum el:Lcom/bumptech/glide/load/DataSource;

.field private static final synthetic em:[Lcom/bumptech/glide/load/DataSource;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    new-instance v0, Lcom/bumptech/glide/load/DataSource;

    const-string v1, "LOCAL"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/bumptech/glide/load/DataSource;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/bumptech/glide/load/DataSource;->eh:Lcom/bumptech/glide/load/DataSource;

    new-instance v0, Lcom/bumptech/glide/load/DataSource;

    const-string v1, "REMOTE"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3}, Lcom/bumptech/glide/load/DataSource;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/bumptech/glide/load/DataSource;->ei:Lcom/bumptech/glide/load/DataSource;

    new-instance v0, Lcom/bumptech/glide/load/DataSource;

    const-string v1, "DATA_DISK_CACHE"

    const/4 v4, 0x2

    invoke-direct {v0, v1, v4}, Lcom/bumptech/glide/load/DataSource;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/bumptech/glide/load/DataSource;->ej:Lcom/bumptech/glide/load/DataSource;

    new-instance v0, Lcom/bumptech/glide/load/DataSource;

    const-string v1, "RESOURCE_DISK_CACHE"

    const/4 v5, 0x3

    invoke-direct {v0, v1, v5}, Lcom/bumptech/glide/load/DataSource;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/bumptech/glide/load/DataSource;->ek:Lcom/bumptech/glide/load/DataSource;

    new-instance v0, Lcom/bumptech/glide/load/DataSource;

    const-string v1, "MEMORY_CACHE"

    const/4 v6, 0x4

    invoke-direct {v0, v1, v6}, Lcom/bumptech/glide/load/DataSource;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/bumptech/glide/load/DataSource;->el:Lcom/bumptech/glide/load/DataSource;

    const/4 v0, 0x5

    new-array v0, v0, [Lcom/bumptech/glide/load/DataSource;

    sget-object v1, Lcom/bumptech/glide/load/DataSource;->eh:Lcom/bumptech/glide/load/DataSource;

    aput-object v1, v0, v2

    sget-object v1, Lcom/bumptech/glide/load/DataSource;->ei:Lcom/bumptech/glide/load/DataSource;

    aput-object v1, v0, v3

    sget-object v1, Lcom/bumptech/glide/load/DataSource;->ej:Lcom/bumptech/glide/load/DataSource;

    aput-object v1, v0, v4

    sget-object v1, Lcom/bumptech/glide/load/DataSource;->ek:Lcom/bumptech/glide/load/DataSource;

    aput-object v1, v0, v5

    sget-object v1, Lcom/bumptech/glide/load/DataSource;->el:Lcom/bumptech/glide/load/DataSource;

    aput-object v1, v0, v6

    sput-object v0, Lcom/bumptech/glide/load/DataSource;->em:[Lcom/bumptech/glide/load/DataSource;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/bumptech/glide/load/DataSource;
    .locals 1

    const-class v0, Lcom/bumptech/glide/load/DataSource;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/bumptech/glide/load/DataSource;

    return-object p0
.end method

.method public static values()[Lcom/bumptech/glide/load/DataSource;
    .locals 1

    sget-object v0, Lcom/bumptech/glide/load/DataSource;->em:[Lcom/bumptech/glide/load/DataSource;

    invoke-virtual {v0}, [Lcom/bumptech/glide/load/DataSource;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/bumptech/glide/load/DataSource;

    return-object v0
.end method
