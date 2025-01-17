.class public Lcom/android/camera/fragment/music/FragmentLiveMusic;
.super Landroid/support/v4/app/DialogFragment;
.source "FragmentLiveMusic.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/fragment/music/FragmentLiveMusic$MusicPagerAdapter;,
        Lcom/android/camera/fragment/music/FragmentLiveMusic$Mp3DownloadCallback;
    }
.end annotation


# static fields
.field public static final LOCAL:I = 0x1

.field public static final ONLINE:I

.field public static final TAG:Ljava/lang/String;


# instance fields
.field private mCloseImageView:Landroid/widget/ImageView;

.field private mCurrentItemIndex:I

.field private mHotMusicText:Landroid/widget/TextView;

.field private mLocalMusicText:Landroid/widget/TextView;

.field private mOldOriginVolumeStream:I

.field private mViewPager:Landroid/support/v4/view/ViewPager;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/android/camera/fragment/music/FragmentLiveMusic;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/fragment/music/FragmentLiveMusic;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/support/v4/app/DialogFragment;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/android/camera/fragment/music/FragmentLiveMusic;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/camera/fragment/music/FragmentLiveMusic;->onClickOnline()V

    return-void
.end method

.method static synthetic access$100(Lcom/android/camera/fragment/music/FragmentLiveMusic;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/camera/fragment/music/FragmentLiveMusic;->onClickLocal()V

    return-void
.end method

.method private onClickLocal()V
    .locals 3

    invoke-virtual {p0}, Lcom/android/camera/fragment/music/FragmentLiveMusic;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0b005d

    invoke-static {v0, v1}, Landroid/support/v4/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v0

    iget v1, p0, Lcom/android/camera/fragment/music/FragmentLiveMusic;->mCurrentItemIndex:I

    if-nez v1, :cond_0

    const/4 v1, 0x1

    iput v1, p0, Lcom/android/camera/fragment/music/FragmentLiveMusic;->mCurrentItemIndex:I

    iget-object v2, p0, Lcom/android/camera/fragment/music/FragmentLiveMusic;->mLocalMusicText:Landroid/widget/TextView;

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v0, p0, Lcom/android/camera/fragment/music/FragmentLiveMusic;->mLocalMusicText:Landroid/widget/TextView;

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setAlpha(F)V

    iget-object v0, p0, Lcom/android/camera/fragment/music/FragmentLiveMusic;->mHotMusicText:Landroid/widget/TextView;

    const/high16 v2, 0x3f000000    # 0.5f

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setAlpha(F)V

    iget-object v0, p0, Lcom/android/camera/fragment/music/FragmentLiveMusic;->mHotMusicText:Landroid/widget/TextView;

    const/high16 v2, -0x1000000

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v0, p0, Lcom/android/camera/fragment/music/FragmentLiveMusic;->mViewPager:Landroid/support/v4/view/ViewPager;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/view/ViewPager;->setCurrentItem(IZ)V

    :cond_0
    return-void
.end method

.method private onClickOnline()V
    .locals 4

    invoke-virtual {p0}, Lcom/android/camera/fragment/music/FragmentLiveMusic;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0b005d

    invoke-static {v0, v1}, Landroid/support/v4/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v0

    iget v1, p0, Lcom/android/camera/fragment/music/FragmentLiveMusic;->mCurrentItemIndex:I

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    const/4 v1, 0x0

    iput v1, p0, Lcom/android/camera/fragment/music/FragmentLiveMusic;->mCurrentItemIndex:I

    iget-object v2, p0, Lcom/android/camera/fragment/music/FragmentLiveMusic;->mLocalMusicText:Landroid/widget/TextView;

    const/high16 v3, -0x1000000

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v2, p0, Lcom/android/camera/fragment/music/FragmentLiveMusic;->mLocalMusicText:Landroid/widget/TextView;

    const/high16 v3, 0x3f000000    # 0.5f

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setAlpha(F)V

    iget-object v2, p0, Lcom/android/camera/fragment/music/FragmentLiveMusic;->mHotMusicText:Landroid/widget/TextView;

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setAlpha(F)V

    iget-object v2, p0, Lcom/android/camera/fragment/music/FragmentLiveMusic;->mHotMusicText:Landroid/widget/TextView;

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v0, p0, Lcom/android/camera/fragment/music/FragmentLiveMusic;->mViewPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v0, v1, v1}, Landroid/support/v4/view/ViewPager;->setCurrentItem(IZ)V

    :cond_0
    return-void
.end method


# virtual methods
.method protected initView(Landroid/view/View;)V
    .locals 4

    const v0, 0x7f0e0057

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/camera/fragment/music/FragmentLiveMusic;->mHotMusicText:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/android/camera/fragment/music/FragmentLiveMusic;->mHotMusicText:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f0e0058

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/camera/fragment/music/FragmentLiveMusic;->mLocalMusicText:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/android/camera/fragment/music/FragmentLiveMusic;->mLocalMusicText:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f0e0056

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/camera/fragment/music/FragmentLiveMusic;->mCloseImageView:Landroid/widget/ImageView;

    iget-object v0, p0, Lcom/android/camera/fragment/music/FragmentLiveMusic;->mCloseImageView:Landroid/widget/ImageView;

    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f0e0059

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/support/v4/view/ViewPager;

    iput-object p1, p0, Lcom/android/camera/fragment/music/FragmentLiveMusic;->mViewPager:Landroid/support/v4/view/ViewPager;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    new-instance v0, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;

    invoke-direct {v0}, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;-><init>()V

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "ITEM_TYPE"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    invoke-virtual {v0, v1}, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->setArguments(Landroid/os/Bundle;)V

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "ITEM_TYPE"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    new-instance v1, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;

    invoke-direct {v1}, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;-><init>()V

    invoke-virtual {v1, v0}, Lcom/android/camera/fragment/music/FragmentLiveMusicPager;->setArguments(Landroid/os/Bundle;)V

    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v0, Lcom/android/camera/fragment/music/FragmentLiveMusic$MusicPagerAdapter;

    invoke-virtual {p0}, Lcom/android/camera/fragment/music/FragmentLiveMusic;->getChildFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    invoke-direct {v0, p0, v1, p1}, Lcom/android/camera/fragment/music/FragmentLiveMusic$MusicPagerAdapter;-><init>(Lcom/android/camera/fragment/music/FragmentLiveMusic;Landroid/support/v4/app/FragmentManager;Ljava/util/List;)V

    iget-object p1, p0, Lcom/android/camera/fragment/music/FragmentLiveMusic;->mViewPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {p1, v0}, Landroid/support/v4/view/ViewPager;->setAdapter(Landroid/support/v4/view/PagerAdapter;)V

    iget-object p1, p0, Lcom/android/camera/fragment/music/FragmentLiveMusic;->mViewPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {p1, v3}, Landroid/support/v4/view/ViewPager;->setCurrentItem(I)V

    iget-object p1, p0, Lcom/android/camera/fragment/music/FragmentLiveMusic;->mViewPager:Landroid/support/v4/view/ViewPager;

    new-instance v0, Lcom/android/camera/fragment/music/FragmentLiveMusic$1;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/music/FragmentLiveMusic$1;-><init>(Lcom/android/camera/fragment/music/FragmentLiveMusic;)V

    invoke-virtual {p1, v0}, Landroid/support/v4/view/ViewPager;->addOnPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)V

    sget-boolean p1, Lcom/android/camera/Util;->isNotchDevice:Z

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcom/android/camera/fragment/music/FragmentLiveMusic;->getDialog()Landroid/app/Dialog;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-static {p1}, Lcom/android/camera/lib/compatibility/util/CompatibilityUtils;->setCutoutModeShortEdges(Landroid/view/Window;)V

    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/fragment/music/FragmentLiveMusic;->getDialog()Landroid/app/Dialog;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p1

    const/16 v0, 0x300

    invoke-virtual {p1, v0}, Landroid/view/View;->setSystemUiVisibility(I)V

    invoke-virtual {p0}, Lcom/android/camera/fragment/music/FragmentLiveMusic;->getDialog()Landroid/app/Dialog;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object p1

    const/high16 v0, -0x80000000

    invoke-virtual {p1, v0}, Landroid/view/Window;->addFlags(I)V

    invoke-virtual {p0}, Lcom/android/camera/fragment/music/FragmentLiveMusic;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/app/FragmentActivity;->getVolumeControlStream()I

    move-result p1

    iput p1, p0, Lcom/android/camera/fragment/music/FragmentLiveMusic;->mOldOriginVolumeStream:I

    invoke-virtual {p0}, Lcom/android/camera/fragment/music/FragmentLiveMusic;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object p1

    const/4 v0, 0x3

    invoke-virtual {p1, v0}, Landroid/support/v4/app/FragmentActivity;->setVolumeControlStream(I)V

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 1

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    invoke-direct {p0}, Lcom/android/camera/fragment/music/FragmentLiveMusic;->onClickLocal()V

    goto :goto_0

    :pswitch_1
    invoke-direct {p0}, Lcom/android/camera/fragment/music/FragmentLiveMusic;->onClickOnline()V

    goto :goto_0

    :pswitch_2
    invoke-virtual {p0}, Lcom/android/camera/fragment/music/FragmentLiveMusic;->getFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object p1

    sget-object v0, Lcom/android/camera/fragment/music/FragmentLiveMusic;->TAG:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/android/camera/fragment/FragmentUtils;->removeFragmentByTag(Landroid/support/v4/app/FragmentManager;Ljava/lang/String;)Z

    nop

    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x7f0e0056
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1
    .param p1    # Landroid/view/LayoutInflater;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/view/ViewGroup;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    const p3, 0x7f040016

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/music/FragmentLiveMusic;->initView(Landroid/view/View;)V

    return-object p1
.end method

.method public onDestroyView()V
    .locals 2

    invoke-super {p0}, Landroid/support/v4/app/DialogFragment;->onDestroyView()V

    invoke-virtual {p0}, Lcom/android/camera/fragment/music/FragmentLiveMusic;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    iget v1, p0, Lcom/android/camera/fragment/music/FragmentLiveMusic;->mOldOriginVolumeStream:I

    invoke-virtual {v0, v1}, Landroid/support/v4/app/FragmentActivity;->setVolumeControlStream(I)V

    return-void
.end method
