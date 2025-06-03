.class Lorg/apache/cordova/SplashScreenPlugin$1;
.super Ljava/lang/Object;
.source "SplashScreenPlugin.java"

# interfaces
.implements Landroidx/core/splashscreen/SplashScreen$OnExitAnimationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/cordova/SplashScreenPlugin;->setupSplashScreen(Landroidx/core/splashscreen/SplashScreen;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/cordova/SplashScreenPlugin;


# direct methods
.method constructor <init>(Lorg/apache/cordova/SplashScreenPlugin;)V
    .locals 0

    .line 142
    iput-object p1, p0, Lorg/apache/cordova/SplashScreenPlugin$1;->this$0:Lorg/apache/cordova/SplashScreenPlugin;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onSplashScreenExit(Landroidx/core/splashscreen/SplashScreenViewProvider;)V
    .locals 3

    .line 145
    invoke-virtual {p1}, Landroidx/core/splashscreen/SplashScreenViewProvider;->getView()Landroid/view/View;

    move-result-object v0

    .line 148
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const/4 v1, 0x0

    .line 149
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/cordova/SplashScreenPlugin$1;->this$0:Lorg/apache/cordova/SplashScreenPlugin;

    .line 150
    invoke-static {v1}, Lorg/apache/cordova/SplashScreenPlugin;->access$000(Lorg/apache/cordova/SplashScreenPlugin;)I

    move-result v1

    int-to-long v1, v1

    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const-wide/16 v1, 0x0

    .line 151
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setStartDelay(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    new-instance v1, Landroid/view/animation/AccelerateInterpolator;

    invoke-direct {v1}, Landroid/view/animation/AccelerateInterpolator;-><init>()V

    .line 152
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    new-instance v1, Lorg/apache/cordova/SplashScreenPlugin$1$1;

    invoke-direct {v1, p0, p1}, Lorg/apache/cordova/SplashScreenPlugin$1$1;-><init>(Lorg/apache/cordova/SplashScreenPlugin$1;Landroidx/core/splashscreen/SplashScreenViewProvider;)V

    .line 153
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    .line 159
    invoke-virtual {p1}, Landroid/view/ViewPropertyAnimator;->start()V

    return-void
.end method
