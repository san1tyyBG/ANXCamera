.class public Lcom/android/camera/constant/ShareConstant;
.super Ljava/lang/Object;
.source "ShareConstant.java"


# static fields
.field public static final DEFAULT_SHARE_LIST:[Ljava/lang/String;

.field public static final DEFAULT_SHARE_LIST_ICON:[I

.field public static final DEFAULT_SHARE_LIST_NAME:[I


# direct methods
.method static constructor <clinit>()V
    .locals 6

    const-string v0, "com.ss.android.ugc.aweme.share.SystemShareActivity"

    const-string v1, "com.ss.android.ugc.aweme.splash.SplashActivity"

    const-string v2, "com.tencent.mm.ui.tools.ShareImgUI"

    const-string v3, "com.tencent.mobileqq.activity.JumpActivity"

    const-string v4, "com.qzonex.module.maxvideo.activity.QzonePublishVideoActivity"

    const-string v5, "com.sina.weibo.composerinde.ComposerDispatchActivity"

    filled-new-array/range {v0 .. v5}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/constant/ShareConstant;->DEFAULT_SHARE_LIST:[Ljava/lang/String;

    const/4 v0, 0x6

    new-array v1, v0, [I

    fill-array-data v1, :array_0

    sput-object v1, Lcom/android/camera/constant/ShareConstant;->DEFAULT_SHARE_LIST_ICON:[I

    new-array v0, v0, [I

    fill-array-data v0, :array_1

    sput-object v0, Lcom/android/camera/constant/ShareConstant;->DEFAULT_SHARE_LIST_NAME:[I

    return-void

    :array_0
    .array-data 4
        0x7f0200f3
        0x7f0200f3
        0x7f0200f4
        0x7f0200f1
        0x7f0200f2
        0x7f0200f5
    .end array-data

    :array_1
    .array-data 4
        0x7f090392
        0x7f090392
        0x7f090393
        0x7f090395
        0x7f090396
        0x7f090397
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
