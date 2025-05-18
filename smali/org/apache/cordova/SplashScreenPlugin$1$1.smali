.class Lorg/apache/cordova/SplashScreenPlugin$1$1;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SplashScreenPlugin.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/cordova/SplashScreenPlugin$1;->onSplashScreenExit(Landroidx/core/splashscreen/SplashScreenViewProvider;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lorg/apache/cordova/SplashScreenPlugin$1;

.field final synthetic val$splashScreenViewProvider:Landroidx/core/splashscreen/SplashScreenViewProvider;


# direct methods
.method constructor <init>(Lorg/apache/cordova/SplashScreenPlugin$1;Landroidx/core/splashscreen/SplashScreenViewProvider;)V
    .locals 0

    .line 153
    iput-object p1, p0, Lorg/apache/cordova/SplashScreenPlugin$1$1;->this$1:Lorg/apache/cordova/SplashScreenPlugin$1;

    iput-object p2, p0, Lorg/apache/cordova/SplashScreenPlugin$1$1;->val$splashScreenViewProvider:Landroidx/core/splashscreen/SplashScreenViewProvider;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 0

    .line 156
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 157
    iget-object p1, p0, Lorg/apache/cordova/SplashScreenPlugin$1$1;->val$splashScreenViewProvider:Landroidx/core/splashscreen/SplashScreenViewProvider;

    invoke-virtual {p1}, Landroidx/core/splashscreen/SplashScreenViewProvider;->remove()V

    return-void
.end method
