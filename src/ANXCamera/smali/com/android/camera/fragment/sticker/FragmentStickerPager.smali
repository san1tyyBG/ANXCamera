.class public Lcom/android/camera/fragment/sticker/FragmentStickerPager;
.super Landroid/support/v4/app/Fragment;
.source "FragmentStickerPager.java"


# static fields
.field private static final MSG_NOTIFY_ITEM:I = 0x1

.field private static final MSG_NOTIFY_LIST:I = 0x2

.field private static final TAG:Ljava/lang/String; = "FragmentStickerPager"


# instance fields
.field private mAdapter:Lcom/android/camera/fragment/sticker/StickerAdapter;

.field private mDefaultDownloadHelper:Lcom/android/camera/network/resource/DownloadHelper;

.field private mDownloadListener:Lcom/android/camera/network/resource/OnDownloadListener;

.field private mHandler:Landroid/os/Handler;

.field private mList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/camera/sticker/StickerInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mRecyclerView:Landroid/support/v7/widget/RecyclerView;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroid/support/v4/app/Fragment;-><init>()V

    new-instance v0, Lcom/android/camera/fragment/sticker/FragmentStickerPager$3;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/sticker/FragmentStickerPager$3;-><init>(Lcom/android/camera/fragment/sticker/FragmentStickerPager;)V

    iput-object v0, p0, Lcom/android/camera/fragment/sticker/FragmentStickerPager;->mDownloadListener:Lcom/android/camera/network/resource/OnDownloadListener;

    new-instance v0, Lcom/android/camera/fragment/sticker/FragmentStickerPager$4;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/sticker/FragmentStickerPager$4;-><init>(Lcom/android/camera/fragment/sticker/FragmentStickerPager;)V

    iput-object v0, p0, Lcom/android/camera/fragment/sticker/FragmentStickerPager;->mHandler:Landroid/os/Handler;

    new-instance v0, Lcom/android/camera/fragment/sticker/FragmentStickerPager$5;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/sticker/FragmentStickerPager$5;-><init>(Lcom/android/camera/fragment/sticker/FragmentStickerPager;)V

    iput-object v0, p0, Lcom/android/camera/fragment/sticker/FragmentStickerPager;->mDefaultDownloadHelper:Lcom/android/camera/network/resource/DownloadHelper;

    return-void
.end method

.method static synthetic access$000(Lcom/android/camera/fragment/sticker/FragmentStickerPager;)Lcom/android/camera/fragment/sticker/StickerAdapter;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/fragment/sticker/FragmentStickerPager;->mAdapter:Lcom/android/camera/fragment/sticker/StickerAdapter;

    return-object p0
.end method

.method static synthetic access$100(Lcom/android/camera/fragment/sticker/FragmentStickerPager;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/sticker/FragmentStickerPager;->persistSticker(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$200(Lcom/android/camera/fragment/sticker/FragmentStickerPager;)Ljava/util/List;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/fragment/sticker/FragmentStickerPager;->mList:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$300(Lcom/android/camera/fragment/sticker/FragmentStickerPager;)Lcom/android/camera/network/resource/DownloadHelper;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/fragment/sticker/FragmentStickerPager;->mDefaultDownloadHelper:Lcom/android/camera/network/resource/DownloadHelper;

    return-object p0
.end method

.method static synthetic access$400(Lcom/android/camera/fragment/sticker/FragmentStickerPager;Ljava/util/List;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/sticker/FragmentStickerPager;->refreshDownloadState(Ljava/util/List;)V

    return-void
.end method

.method static synthetic access$500(Lcom/android/camera/fragment/sticker/FragmentStickerPager;Ljava/util/List;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/sticker/FragmentStickerPager;->refreshData(Ljava/util/List;)V

    return-void
.end method

.method static synthetic access$600(Lcom/android/camera/fragment/sticker/FragmentStickerPager;)Landroid/os/Handler;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/fragment/sticker/FragmentStickerPager;->mHandler:Landroid/os/Handler;

    return-object p0
.end method

.method private initView(Landroid/view/View;)V
    .locals 3

    const v0, 0x7f0e00d0

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/support/v7/widget/RecyclerView;

    iput-object p1, p0, Lcom/android/camera/fragment/sticker/FragmentStickerPager;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    new-instance p1, Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;

    invoke-virtual {p0}, Lcom/android/camera/fragment/sticker/FragmentStickerPager;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "sticker_item_list"

    const/4 v2, 0x0

    invoke-direct {p1, v0, v2, v2, v1}, Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;-><init>(Landroid/content/Context;IZLjava/lang/String;)V

    iget-object v0, p0, Lcom/android/camera/fragment/sticker/FragmentStickerPager;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    new-instance p1, Lcom/android/camera/fragment/sticker/StickerAdapter;

    invoke-virtual {p0}, Lcom/android/camera/fragment/sticker/FragmentStickerPager;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p1, v0}, Lcom/android/camera/fragment/sticker/StickerAdapter;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/android/camera/fragment/sticker/FragmentStickerPager;->mAdapter:Lcom/android/camera/fragment/sticker/StickerAdapter;

    iget-object p1, p0, Lcom/android/camera/fragment/sticker/FragmentStickerPager;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v0, p0, Lcom/android/camera/fragment/sticker/FragmentStickerPager;->mAdapter:Lcom/android/camera/fragment/sticker/StickerAdapter;

    invoke-virtual {p1, v0}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    iget-object p1, p0, Lcom/android/camera/fragment/sticker/FragmentStickerPager;->mAdapter:Lcom/android/camera/fragment/sticker/StickerAdapter;

    new-instance v0, Lcom/android/camera/fragment/sticker/FragmentStickerPager$1;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/sticker/FragmentStickerPager$1;-><init>(Lcom/android/camera/fragment/sticker/FragmentStickerPager;)V

    invoke-virtual {p1, v0}, Lcom/android/camera/fragment/sticker/StickerAdapter;->setItemSelectChangeListener(Lcom/android/camera/fragment/sticker/BaseSelectAdapter$ItemSelectChangeListener;)V

    invoke-static {}, Lcom/android/camera/network/resource/ResourceDownloadManager;->getInstance()Lcom/android/camera/network/resource/ResourceDownloadManager;

    move-result-object p1

    iget-object v0, p0, Lcom/android/camera/fragment/sticker/FragmentStickerPager;->mDownloadListener:Lcom/android/camera/network/resource/OnDownloadListener;

    invoke-virtual {p1, v0}, Lcom/android/camera/network/resource/ResourceDownloadManager;->addDownloadListener(Lcom/android/camera/network/resource/OnDownloadListener;)V

    invoke-direct {p0}, Lcom/android/camera/fragment/sticker/FragmentStickerPager;->loadData()V

    return-void
.end method

.method private loadData()V
    .locals 2

    new-instance v0, Lcom/android/camera/network/resource/StickerResourceRequest;

    invoke-direct {v0}, Lcom/android/camera/network/resource/StickerResourceRequest;-><init>()V

    new-instance v1, Lcom/android/camera/fragment/sticker/FragmentStickerPager$2;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/sticker/FragmentStickerPager$2;-><init>(Lcom/android/camera/fragment/sticker/FragmentStickerPager;)V

    invoke-virtual {v0, v1}, Lcom/android/camera/network/resource/StickerResourceRequest;->execute(Lcom/android/camera/network/net/base/ResponseListener;)V

    return-void
.end method

.method private persistSticker(Ljava/lang/String;)V
    .locals 2

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    const-string v1, "pref_sticker_path_key"

    invoke-interface {v0, v1, p1}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putString(Ljava/lang/String;Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    return-void
.end method

.method private refreshData(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/camera/sticker/StickerInfo;",
            ">;)V"
        }
    .end annotation

    invoke-static {}, Lcom/android/camera/sticker/StickerHelper;->getInstance()Lcom/android/camera/sticker/StickerHelper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/sticker/StickerHelper;->getLocalStick()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/sticker/FragmentStickerPager;->mList:Ljava/util/List;

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/sticker/FragmentStickerPager;->mList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    :cond_0
    iget-object p1, p0, Lcom/android/camera/fragment/sticker/FragmentStickerPager;->mAdapter:Lcom/android/camera/fragment/sticker/StickerAdapter;

    iget-object v0, p0, Lcom/android/camera/fragment/sticker/FragmentStickerPager;->mList:Ljava/util/List;

    invoke-virtual {p1, v0}, Lcom/android/camera/fragment/sticker/StickerAdapter;->setList(Ljava/util/List;)V

    invoke-direct {p0}, Lcom/android/camera/fragment/sticker/FragmentStickerPager;->setSelectItem()V

    iget-object p1, p0, Lcom/android/camera/fragment/sticker/FragmentStickerPager;->mHandler:Landroid/os/Handler;

    const/4 v0, 0x2

    invoke-virtual {p1, v0}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    return-void
.end method

.method private refreshDownloadState(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/camera/sticker/StickerInfo;",
            ">;)V"
        }
    .end annotation

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/sticker/StickerInfo;

    invoke-static {}, Lcom/android/camera/network/resource/ResourceDownloadManager;->getInstance()Lcom/android/camera/network/resource/ResourceDownloadManager;

    move-result-object v1

    iget-wide v2, v0, Lcom/android/camera/sticker/StickerInfo;->id:J

    invoke-virtual {v1, v2, v3}, Lcom/android/camera/network/resource/ResourceDownloadManager;->getDownloadState(J)I

    move-result v1

    iput v1, v0, Lcom/android/camera/sticker/StickerInfo;->downloadState:I

    goto :goto_0

    :cond_0
    return-void
.end method

.method private setSelectItem()V
    .locals 3

    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/effect/EffectController;->getCurrentSticker()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    iget-object v2, p0, Lcom/android/camera/fragment/sticker/FragmentStickerPager;->mList:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_1

    iget-object v2, p0, Lcom/android/camera/fragment/sticker/FragmentStickerPager;->mList:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/camera/sticker/StickerInfo;

    invoke-virtual {v2}, Lcom/android/camera/sticker/StickerInfo;->getSrcPath()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/sticker/FragmentStickerPager;->mAdapter:Lcom/android/camera/fragment/sticker/StickerAdapter;

    invoke-virtual {v0, v1}, Lcom/android/camera/fragment/sticker/StickerAdapter;->initSelectItem(I)V

    return-void

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method


# virtual methods
.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1
    .param p2    # Landroid/view/ViewGroup;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    const p3, 0x7f04003a

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/sticker/FragmentStickerPager;->initView(Landroid/view/View;)V

    return-object p1
.end method

.method public onDestroy()V
    .locals 2

    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onDestroy()V

    invoke-static {}, Lcom/android/camera/network/resource/ResourceDownloadManager;->getInstance()Lcom/android/camera/network/resource/ResourceDownloadManager;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera/fragment/sticker/FragmentStickerPager;->mDownloadListener:Lcom/android/camera/network/resource/OnDownloadListener;

    invoke-virtual {v0, v1}, Lcom/android/camera/network/resource/ResourceDownloadManager;->removeDownloadListener(Lcom/android/camera/network/resource/OnDownloadListener;)V

    return-void
.end method

.method public setUserVisibleHint(Z)V
    .locals 2

    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->setUserVisibleHint(Z)V

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/android/camera/fragment/sticker/FragmentStickerPager;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    if-eqz p1, :cond_0

    new-instance p1, Landroid/view/animation/AlphaAnimation;

    const/4 v0, 0x0

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-direct {p1, v0, v1}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    const-wide/16 v0, 0x12c

    invoke-virtual {p1, v0, v1}, Landroid/view/animation/AlphaAnimation;->setDuration(J)V

    iget-object v0, p0, Lcom/android/camera/fragment/sticker/FragmentStickerPager;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/RecyclerView;->startAnimation(Landroid/view/animation/Animation;)V

    :cond_0
    return-void
.end method
