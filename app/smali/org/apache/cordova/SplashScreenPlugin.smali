.class public Lorg/apache/cordova/SplashScreenPlugin;
.super Lorg/apache/cordova/CordovaPlugin;
.source "SplashScreenPlugin.java"


# static fields
.field private static final DEFAULT_AUTO_HIDE:Z = true

.field private static final DEFAULT_DELAY_TIME:I = -0x1

.field private static final DEFAULT_FADE:Z = true

.field private static final DEFAULT_FADE_TIME:I = 0x1f4

.field static final PLUGIN_NAME:Ljava/lang/String; = "CordovaSplashScreenPlugin"


# instance fields
.field private autoHide:Z

.field private delayTime:I

.field private fadeDuration:I

.field private isFadeEnabled:Z

.field private keepOnScreen:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 37
    invoke-direct {p0}, Lorg/apache/cordova/CordovaPlugin;-><init>()V

    const/4 v0, 0x1

    .line 68
    iput-boolean v0, p0, Lorg/apache/cordova/SplashScreenPlugin;->keepOnScreen:Z

    return-void
.end method

.method static synthetic access$000(Lorg/apache/cordova/SplashScreenPlugin;)I
    .locals 0

    .line 37
    iget p0, p0, Lorg/apache/cordova/SplashScreenPlugin;->fadeDuration:I

    return p0
.end method

.method private attemptCloseOnPageFinished()V
    .locals 2

    .line 166
    iget-boolean v0, p0, Lorg/apache/cordova/SplashScreenPlugin;->autoHide:Z

    if-eqz v0, :cond_0

    iget v0, p0, Lorg/apache/cordova/SplashScreenPlugin;->delayTime:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    .line 167
    iput-boolean v0, p0, Lorg/apache/cordova/SplashScreenPlugin;->keepOnScreen:Z

    :cond_0
    return-void
.end method

.method private setupSplashScreen(Landroidx/core/splashscreen/SplashScreen;)V
    .locals 4

    .line 126
    new-instance v0, Lorg/apache/cordova/SplashScreenPlugin$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Lorg/apache/cordova/SplashScreenPlugin$$ExternalSyntheticLambda0;-><init>(Lorg/apache/cordova/SplashScreenPlugin;)V

    invoke-virtual {p1, v0}, Landroidx/core/splashscreen/SplashScreen;->setKeepOnScreenCondition(Landroidx/core/splashscreen/SplashScreen$KeepOnScreenCondition;)V

    .line 129
    iget-boolean v0, p0, Lorg/apache/cordova/SplashScreenPlugin;->autoHide:Z

    if-eqz v0, :cond_0

    iget v0, p0, Lorg/apache/cordova/SplashScreenPlugin;->delayTime:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 130
    new-instance v0, Landroid/os/Handler;

    iget-object v1, p0, Lorg/apache/cordova/SplashScreenPlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v1}, Lorg/apache/cordova/CordovaInterface;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 131
    new-instance v1, Lorg/apache/cordova/SplashScreenPlugin$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0}, Lorg/apache/cordova/SplashScreenPlugin$$ExternalSyntheticLambda1;-><init>(Lorg/apache/cordova/SplashScreenPlugin;)V

    iget v2, p0, Lorg/apache/cordova/SplashScreenPlugin;->delayTime:I

    int-to-long v2, v2

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 140
    :cond_0
    iget-boolean v0, p0, Lorg/apache/cordova/SplashScreenPlugin;->isFadeEnabled:Z

    if-eqz v0, :cond_1

    .line 142
    new-instance v0, Lorg/apache/cordova/SplashScreenPlugin$1;

    invoke-direct {v0, p0}, Lorg/apache/cordova/SplashScreenPlugin$1;-><init>(Lorg/apache/cordova/SplashScreenPlugin;)V

    invoke-virtual {p1, v0}, Landroidx/core/splashscreen/SplashScreen;->setOnExitAnimationListener(Landroidx/core/splashscreen/SplashScreen$OnExitAnimationListener;)V

    :cond_1
    return-void
.end method


# virtual methods
.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 95
    const-string p2, "hide"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    const/4 p2, 0x0

    if-eqz p1, :cond_0

    iget-boolean p1, p0, Lorg/apache/cordova/SplashScreenPlugin;->autoHide:Z

    if-nez p1, :cond_0

    .line 100
    iput-boolean p2, p0, Lorg/apache/cordova/SplashScreenPlugin;->keepOnScreen:Z

    .line 105
    invoke-virtual {p3}, Lorg/apache/cordova/CallbackContext;->success()V

    const/4 p1, 0x1

    return p1

    :cond_0
    return p2
.end method

.method synthetic lambda$setupSplashScreen$0$org-apache-cordova-SplashScreenPlugin()Z
    .locals 1

    .line 126
    iget-boolean v0, p0, Lorg/apache/cordova/SplashScreenPlugin;->keepOnScreen:Z

    return v0
.end method

.method synthetic lambda$setupSplashScreen$1$org-apache-cordova-SplashScreenPlugin()V
    .locals 1

    .line 0
    const/4 v0, 0x0

    .line 131
    iput-boolean v0, p0, Lorg/apache/cordova/SplashScreenPlugin;->keepOnScreen:Z

    return-void
.end method

.method public onMessage(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 111
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    const-string v0, "onPageFinished"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "setupSplashScreen"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_0

    goto :goto_0

    .line 113
    :cond_0
    check-cast p2, Landroidx/core/splashscreen/SplashScreen;

    invoke-direct {p0, p2}, Lorg/apache/cordova/SplashScreenPlugin;->setupSplashScreen(Landroidx/core/splashscreen/SplashScreen;)V

    goto :goto_0

    .line 117
    :cond_1
    invoke-direct {p0}, Lorg/apache/cordova/SplashScreenPlugin;->attemptCloseOnPageFinished()V

    :goto_0
    const/4 p1, 0x0

    return-object p1
.end method

.method protected pluginInitialize()V
    .locals 5

    .line 73
    iget-object v0, p0, Lorg/apache/cordova/SplashScreenPlugin;->preferences:Lorg/apache/cordova/CordovaPreferences;

    const-string v1, "AutoHideSplashScreen"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/CordovaPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lorg/apache/cordova/SplashScreenPlugin;->autoHide:Z

    .line 74
    iget-object v0, p0, Lorg/apache/cordova/SplashScreenPlugin;->preferences:Lorg/apache/cordova/CordovaPreferences;

    const-string v1, "SplashScreenDelay"

    const/4 v3, -0x1

    invoke-virtual {v0, v1, v3}, Lorg/apache/cordova/CordovaPreferences;->getInteger(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lorg/apache/cordova/SplashScreenPlugin;->delayTime:I

    .line 75
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Auto Hide: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-boolean v1, p0, Lorg/apache/cordova/SplashScreenPlugin;->autoHide:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "CordovaSplashScreenPlugin"

    invoke-static {v1, v0}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 76
    iget v0, p0, Lorg/apache/cordova/SplashScreenPlugin;->delayTime:I

    const-string v4, "ms"

    if-eq v0, v3, :cond_0

    .line 77
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v3, "Delay: "

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v3, p0, Lorg/apache/cordova/SplashScreenPlugin;->delayTime:I

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 81
    :cond_0
    iget-object v0, p0, Lorg/apache/cordova/SplashScreenPlugin;->preferences:Lorg/apache/cordova/CordovaPreferences;

    const-string v3, "FadeSplashScreen"

    invoke-virtual {v0, v3, v2}, Lorg/apache/cordova/CordovaPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lorg/apache/cordova/SplashScreenPlugin;->isFadeEnabled:Z

    .line 82
    iget-object v0, p0, Lorg/apache/cordova/SplashScreenPlugin;->preferences:Lorg/apache/cordova/CordovaPreferences;

    const-string v2, "FadeSplashScreenDuration"

    const/16 v3, 0x1f4

    invoke-virtual {v0, v2, v3}, Lorg/apache/cordova/CordovaPreferences;->getInteger(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lorg/apache/cordova/SplashScreenPlugin;->fadeDuration:I

    .line 83
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "Fade: "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-boolean v2, p0, Lorg/apache/cordova/SplashScreenPlugin;->isFadeEnabled:Z

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 84
    iget-boolean v0, p0, Lorg/apache/cordova/SplashScreenPlugin;->isFadeEnabled:Z

    if-eqz v0, :cond_1

    .line 85
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "Fade Duration: "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v2, p0, Lorg/apache/cordova/SplashScreenPlugin;->fadeDuration:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    return-void
.end method
