.class public Lcom/android/camera/network/imageloader/ImageLoaderManager;
.super Ljava/lang/Object;
.source "ImageLoaderManager.java"


# static fields
.field private static sInstance:Lcom/android/camera/network/imageloader/ImageLoaderManager;


# instance fields
.field private mImageLoader:Lcom/android/volley/toolbox/ImageLoader;


# direct methods
.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getInstance()Lcom/android/camera/network/imageloader/ImageLoaderManager;
    .locals 2

    sget-object v0, Lcom/android/camera/network/imageloader/ImageLoaderManager;->sInstance:Lcom/android/camera/network/imageloader/ImageLoaderManager;

    if-nez v0, :cond_1

    const-class v0, Lcom/android/camera/network/imageloader/ImageLoaderManager;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/android/camera/network/imageloader/ImageLoaderManager;->sInstance:Lcom/android/camera/network/imageloader/ImageLoaderManager;

    if-nez v1, :cond_0

    new-instance v1, Lcom/android/camera/network/imageloader/ImageLoaderManager;

    invoke-direct {v1}, Lcom/android/camera/network/imageloader/ImageLoaderManager;-><init>()V

    sput-object v1, Lcom/android/camera/network/imageloader/ImageLoaderManager;->sInstance:Lcom/android/camera/network/imageloader/ImageLoaderManager;

    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    :cond_1
    :goto_0
    sget-object v0, Lcom/android/camera/network/imageloader/ImageLoaderManager;->sInstance:Lcom/android/camera/network/imageloader/ImageLoaderManager;

    return-object v0
.end method


# virtual methods
.method public initRequestQueue(Landroid/content/Context;)V
    .locals 2

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcom/android/volley/toolbox/Volley;->newRequestQueue(Landroid/content/Context;)Lcom/android/volley/RequestQueue;

    move-result-object p1

    new-instance v0, Lcom/android/volley/toolbox/ImageLoader;

    new-instance v1, Lcom/android/camera/network/imageloader/LruImageCache;

    invoke-direct {v1}, Lcom/android/camera/network/imageloader/LruImageCache;-><init>()V

    invoke-direct {v0, p1, v1}, Lcom/android/volley/toolbox/ImageLoader;-><init>(Lcom/android/volley/RequestQueue;Lcom/android/volley/toolbox/ImageLoader$ImageCache;)V

    iput-object v0, p0, Lcom/android/camera/network/imageloader/ImageLoaderManager;->mImageLoader:Lcom/android/volley/toolbox/ImageLoader;

    return-void
.end method

.method public loadImage(Landroid/widget/ImageView;Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/network/imageloader/ImageLoaderManager;->mImageLoader:Lcom/android/volley/toolbox/ImageLoader;

    if-nez v0, :cond_0

    invoke-virtual {p1}, Landroid/widget/ImageView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/camera/network/imageloader/ImageLoaderManager;->initRequestQueue(Landroid/content/Context;)V

    :cond_0
    nop

    const/4 v0, 0x0

    invoke-static {p1, v0, v0}, Lcom/android/volley/toolbox/ImageLoader;->getImageListener(Landroid/widget/ImageView;II)Lcom/android/volley/toolbox/ImageLoader$ImageListener;

    move-result-object p1

    iget-object v0, p0, Lcom/android/camera/network/imageloader/ImageLoaderManager;->mImageLoader:Lcom/android/volley/toolbox/ImageLoader;

    invoke-virtual {v0, p2, p1}, Lcom/android/volley/toolbox/ImageLoader;->get(Ljava/lang/String;Lcom/android/volley/toolbox/ImageLoader$ImageListener;)Lcom/android/volley/toolbox/ImageLoader$ImageContainer;

    return-void
.end method
