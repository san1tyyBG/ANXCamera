.class public Lcom/android/camera/fragment/live/FragmentLiveSpeed;
.super Lcom/android/camera/fragment/live/FragmentLiveBase;
.source "FragmentLiveSpeed.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/fragment/live/FragmentLiveSpeed$SpeedItemAdapter;,
        Lcom/android/camera/fragment/live/FragmentLiveSpeed$LiveSpeedItem;
    }
.end annotation


# static fields
.field private static final FRAGMENT_INFO:I = 0xffd

.field private static final TAG:Ljava/lang/String; = "FragmentLiveSpeed"

.field private static final sSpeedItemList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/camera/fragment/live/FragmentLiveSpeed$LiveSpeedItem;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mAdapter:Lcom/android/camera/fragment/live/FragmentLiveSpeed$SpeedItemAdapter;

.field private mLayoutManager:Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;

.field private mRootView:Landroid/view/View;

.field private mSelectIndex:I

.field private mSpeedListView:Landroid/support/v7/widget/RecyclerView;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/android/camera/fragment/live/FragmentLiveSpeed;->sSpeedItemList:Ljava/util/List;

    sget-object v0, Lcom/android/camera/CameraSettings;->sLiveSpeedTextList:[I

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget v3, v0, v2

    sget-object v4, Lcom/android/camera/fragment/live/FragmentLiveSpeed;->sSpeedItemList:Ljava/util/List;

    new-instance v5, Lcom/android/camera/fragment/live/FragmentLiveSpeed$LiveSpeedItem;

    invoke-direct {v5, v3}, Lcom/android/camera/fragment/live/FragmentLiveSpeed$LiveSpeedItem;-><init>(I)V

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/android/camera/fragment/live/FragmentLiveBase;-><init>()V

    return-void
.end method


# virtual methods
.method public getFragmentInto()I
    .locals 1

    const/16 v0, 0xffd

    return v0
.end method

.method protected getLayoutResourceId()I
    .locals 1

    const v0, 0x7f040026

    return v0
.end method

.method protected getSpeedItemList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/camera/fragment/live/FragmentLiveSpeed$LiveSpeedItem;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcom/android/camera/fragment/live/FragmentLiveSpeed;->sSpeedItemList:Ljava/util/List;

    return-object v0
.end method

.method protected initView(Landroid/view/View;)V
    .locals 5

    iput-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveSpeed;->mRootView:Landroid/view/View;

    invoke-virtual {p0}, Lcom/android/camera/fragment/live/FragmentLiveSpeed;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcom/android/camera/Util;->isLayoutRTL(Landroid/content/Context;)Z

    move-result p1

    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSpeed;->mRootView:Landroid/view/View;

    const v1, 0x7f0e008b

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/RecyclerView;

    iput-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSpeed;->mSpeedListView:Landroid/support/v7/widget/RecyclerView;

    invoke-static {}, Lcom/android/camera/CameraSettings;->getCurrentLiveSpeed()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSpeed;->mSelectIndex:I

    new-instance v0, Lcom/android/camera/fragment/live/FragmentLiveSpeed$SpeedItemAdapter;

    invoke-virtual {p0}, Lcom/android/camera/fragment/live/FragmentLiveSpeed;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {p0}, Lcom/android/camera/fragment/live/FragmentLiveSpeed;->getSpeedItemList()Ljava/util/List;

    move-result-object v2

    iget v3, p0, Lcom/android/camera/fragment/live/FragmentLiveSpeed;->mSelectIndex:I

    new-instance v4, Lcom/android/camera/fragment/live/FragmentLiveSpeed$1;

    invoke-direct {v4, p0}, Lcom/android/camera/fragment/live/FragmentLiveSpeed$1;-><init>(Lcom/android/camera/fragment/live/FragmentLiveSpeed;)V

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/android/camera/fragment/live/FragmentLiveSpeed$SpeedItemAdapter;-><init>(Landroid/content/Context;Ljava/util/List;ILandroid/widget/AdapterView$OnItemClickListener;)V

    iput-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSpeed;->mAdapter:Lcom/android/camera/fragment/live/FragmentLiveSpeed$SpeedItemAdapter;

    new-instance v0, Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;

    invoke-virtual {p0}, Lcom/android/camera/fragment/live/FragmentLiveSpeed;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "live_speed_list"

    invoke-direct {v0, v1, v2}, Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSpeed;->mLayoutManager:Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;

    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSpeed;->mLayoutManager:Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;->setOrientation(I)V

    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSpeed;->mSpeedListView:Landroid/support/v7/widget/RecyclerView;

    iget-object v1, p0, Lcom/android/camera/fragment/live/FragmentLiveSpeed;->mLayoutManager:Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSpeed;->mSpeedListView:Landroid/support/v7/widget/RecyclerView;

    new-instance v1, Lcom/android/camera/fragment/live/FragmentLiveSpeed$2;

    invoke-direct {v1, p0, p1}, Lcom/android/camera/fragment/live/FragmentLiveSpeed$2;-><init>(Lcom/android/camera/fragment/live/FragmentLiveSpeed;Z)V

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    iget-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveSpeed;->mSpeedListView:Landroid/support/v7/widget/RecyclerView;

    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSpeed;->mAdapter:Lcom/android/camera/fragment/live/FragmentLiveSpeed$SpeedItemAdapter;

    invoke-virtual {p1, v0}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    return-void
.end method

.method protected onItemSelected(I)V
    .locals 2

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->setCurrentLiveSpeed(Ljava/lang/String;)V

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xc9

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    if-eqz v0, :cond_0

    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;->setRecordSpeed(I)V

    :cond_0
    return-void
.end method
