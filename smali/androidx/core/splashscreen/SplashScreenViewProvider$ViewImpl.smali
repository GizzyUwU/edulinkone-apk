.class Landroidx/core/splashscreen/SplashScreenViewProvider$ViewImpl;
.super Ljava/lang/Object;
.source "SplashScreenViewProvider.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/core/splashscreen/SplashScreenViewProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ViewImpl"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0010\t\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u0002\n\u0002\u0008\u0002\u0008\u0012\u0018\u00002\u00020\u0001B\r\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0004J\u0008\u0010\u0019\u001a\u00020\u001aH\u0016J\u0008\u0010\u001b\u001a\u00020\u001aH\u0016R\u001b\u0010\u0005\u001a\u00020\u00068BX\u0082\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\t\u0010\n\u001a\u0004\u0008\u0007\u0010\u0008R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000b\u0010\u000cR\u0014\u0010\r\u001a\u00020\u000e8VX\u0096\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u000f\u0010\u0010R\u0014\u0010\u0011\u001a\u00020\u000e8VX\u0096\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0012\u0010\u0010R\u0014\u0010\u0013\u001a\u00020\u00148VX\u0096\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0015\u0010\u0016R\u0014\u0010\u0017\u001a\u00020\u00068VX\u0096\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0018\u0010\u0008\u00a8\u0006\u001c"
    }
    d2 = {
        "Landroidx/core/splashscreen/SplashScreenViewProvider$ViewImpl;",
        "",
        "activity",
        "Landroid/app/Activity;",
        "(Landroid/app/Activity;)V",
        "_splashScreenView",
        "Landroid/view/ViewGroup;",
        "get_splashScreenView",
        "()Landroid/view/ViewGroup;",
        "_splashScreenView$delegate",
        "Lkotlin/Lazy;",
        "getActivity",
        "()Landroid/app/Activity;",
        "iconAnimationDurationMillis",
        "",
        "getIconAnimationDurationMillis",
        "()J",
        "iconAnimationStartMillis",
        "getIconAnimationStartMillis",
        "iconView",
        "Landroid/view/View;",
        "getIconView",
        "()Landroid/view/View;",
        "splashScreenView",
        "getSplashScreenView",
        "createSplashScreenView",
        "",
        "remove",
        "core-splashscreen_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x6,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private final _splashScreenView$delegate:Lkotlin/Lazy;

.field private final activity:Landroid/app/Activity;


# direct methods
.method public constructor <init>(Landroid/app/Activity;)V
    .locals 1

    const-string v0, "activity"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 91
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/core/splashscreen/SplashScreenViewProvider$ViewImpl;->activity:Landroid/app/Activity;

    .line 93
    new-instance p1, Landroidx/core/splashscreen/SplashScreenViewProvider$ViewImpl$_splashScreenView$2;

    invoke-direct {p1, p0}, Landroidx/core/splashscreen/SplashScreenViewProvider$ViewImpl$_splashScreenView$2;-><init>(Landroidx/core/splashscreen/SplashScreenViewProvider$ViewImpl;)V

    check-cast p1, Lkotlin/jvm/functions/Function0;

    invoke-static {p1}, Lkotlin/LazyKt;->lazy(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object p1

    iput-object p1, p0, Landroidx/core/splashscreen/SplashScreenViewProvider$ViewImpl;->_splashScreenView$delegate:Lkotlin/Lazy;

    return-void
.end method

.method private final get_splashScreenView()Landroid/view/ViewGroup;
    .locals 1

    .line 93
    iget-object v0, p0, Landroidx/core/splashscreen/SplashScreenViewProvider$ViewImpl;->_splashScreenView$delegate:Lkotlin/Lazy;

    invoke-interface {v0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    return-object v0
.end method


# virtual methods
.method public createSplashScreenView()V
    .locals 2

    .line 102
    iget-object v0, p0, Landroidx/core/splashscreen/SplashScreenViewProvider$ViewImpl;->activity:Landroid/app/Activity;

    const v1, 0x1020002

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 103
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getRootView()Landroid/view/View;

    move-result-object v0

    instance-of v1, v0, Landroid/view/ViewGroup;

    if-eqz v1, :cond_0

    check-cast v0, Landroid/view/ViewGroup;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    invoke-direct {p0}, Landroidx/core/splashscreen/SplashScreenViewProvider$ViewImpl;->get_splashScreenView()Landroid/view/ViewGroup;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    :cond_1
    return-void
.end method

.method public final getActivity()Landroid/app/Activity;
    .locals 1

    .line 91
    iget-object v0, p0, Landroidx/core/splashscreen/SplashScreenViewProvider$ViewImpl;->activity:Landroid/app/Activity;

    return-object v0
.end method

.method public getIconAnimationDurationMillis()J
    .locals 2

    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public getIconAnimationStartMillis()J
    .locals 2

    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public getIconView()Landroid/view/View;
    .locals 2

    .line 107
    invoke-virtual {p0}, Landroidx/core/splashscreen/SplashScreenViewProvider$ViewImpl;->getSplashScreenView()Landroid/view/ViewGroup;

    move-result-object v0

    sget v1, Landroidx/core/splashscreen/R$id;->splashscreen_icon_view:I

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const-string v1, "splashScreenView.findVie\u2026d.splashscreen_icon_view)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    return-object v0
.end method

.method public getSplashScreenView()Landroid/view/ViewGroup;
    .locals 1

    .line 106
    invoke-direct {p0}, Landroidx/core/splashscreen/SplashScreenViewProvider$ViewImpl;->get_splashScreenView()Landroid/view/ViewGroup;

    move-result-object v0

    return-object v0
.end method

.method public remove()V
    .locals 2

    .line 111
    invoke-virtual {p0}, Landroidx/core/splashscreen/SplashScreenViewProvider$ViewImpl;->getSplashScreenView()Landroid/view/ViewGroup;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v1, v0, Landroid/view/ViewGroup;

    if-eqz v1, :cond_0

    check-cast v0, Landroid/view/ViewGroup;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    invoke-virtual {p0}, Landroidx/core/splashscreen/SplashScreenViewProvider$ViewImpl;->getSplashScreenView()Landroid/view/ViewGroup;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_1
    return-void
.end method
