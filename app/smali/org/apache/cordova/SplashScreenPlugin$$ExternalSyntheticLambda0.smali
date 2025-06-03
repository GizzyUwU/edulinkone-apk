.class public final synthetic Lorg/apache/cordova/SplashScreenPlugin$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroidx/core/splashscreen/SplashScreen$KeepOnScreenCondition;


# instance fields
.field public final synthetic f$0:Lorg/apache/cordova/SplashScreenPlugin;


# direct methods
.method public synthetic constructor <init>(Lorg/apache/cordova/SplashScreenPlugin;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/apache/cordova/SplashScreenPlugin$$ExternalSyntheticLambda0;->f$0:Lorg/apache/cordova/SplashScreenPlugin;

    return-void
.end method


# virtual methods
.method public final shouldKeepOnScreen()Z
    .locals 1

    .line 0
    iget-object v0, p0, Lorg/apache/cordova/SplashScreenPlugin$$ExternalSyntheticLambda0;->f$0:Lorg/apache/cordova/SplashScreenPlugin;

    invoke-virtual {v0}, Lorg/apache/cordova/SplashScreenPlugin;->lambda$setupSplashScreen$0$org-apache-cordova-SplashScreenPlugin()Z

    move-result v0

    return v0
.end method
