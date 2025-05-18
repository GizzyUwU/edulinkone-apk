.class final Landroidx/core/splashscreen/SplashScreenViewProvider$ViewImpl$_splashScreenView$2;
.super Lkotlin/jvm/internal/Lambda;
.source "SplashScreenViewProvider.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/core/splashscreen/SplashScreenViewProvider$ViewImpl;-><init>(Landroid/app/Activity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/Lambda;",
        "Lkotlin/jvm/functions/Function0<",
        "Landroid/view/ViewGroup;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0008\n\u0000\n\u0002\u0018\u0002\n\u0000\u0010\u0000\u001a\u00020\u0001H\n\u00a2\u0006\u0002\u0008\u0002"
    }
    d2 = {
        "<anonymous>",
        "Landroid/view/ViewGroup;",
        "invoke"
    }
    k = 0x3
    mv = {
        0x1,
        0x6,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/core/splashscreen/SplashScreenViewProvider$ViewImpl;


# direct methods
.method constructor <init>(Landroidx/core/splashscreen/SplashScreenViewProvider$ViewImpl;)V
    .locals 0

    iput-object p1, p0, Landroidx/core/splashscreen/SplashScreenViewProvider$ViewImpl$_splashScreenView$2;->this$0:Landroidx/core/splashscreen/SplashScreenViewProvider$ViewImpl;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public final invoke()Landroid/view/ViewGroup;
    .locals 3

    .line 95
    iget-object v0, p0, Landroidx/core/splashscreen/SplashScreenViewProvider$ViewImpl$_splashScreenView$2;->this$0:Landroidx/core/splashscreen/SplashScreenViewProvider$ViewImpl;

    invoke-virtual {v0}, Landroidx/core/splashscreen/SplashScreenViewProvider$ViewImpl;->getActivity()Landroid/app/Activity;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    .line 96
    sget v1, Landroidx/core/splashscreen/R$layout;->splash_screen_view:I

    const/4 v2, 0x0

    .line 94
    invoke-static {v0, v1, v2}, Landroid/widget/FrameLayout;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    check-cast v0, Landroid/view/ViewGroup;

    return-object v0

    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "null cannot be cast to non-null type android.view.ViewGroup"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public bridge synthetic invoke()Ljava/lang/Object;
    .locals 1

    .line 93
    invoke-virtual {p0}, Landroidx/core/splashscreen/SplashScreenViewProvider$ViewImpl$_splashScreenView$2;->invoke()Landroid/view/ViewGroup;

    move-result-object v0

    return-object v0
.end method
