.class public Lorg/apache/cordova/CordovaActivity;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "CordovaActivity.java"


# static fields
.field private static ACTIVITY_EXITING:I = 0x2

.field private static ACTIVITY_RUNNING:I = 0x1

.field private static ACTIVITY_STARTING:I = 0x0

.field public static TAG:Ljava/lang/String; = "CordovaActivity"


# instance fields
.field protected appView:Lorg/apache/cordova/CordovaWebView;

.field protected cordovaInterface:Lorg/apache/cordova/CordovaInterfaceImpl;

.field protected immersiveMode:Z

.field protected keepRunning:Z

.field protected launchUrl:Ljava/lang/String;

.field protected pluginEntries:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lorg/apache/cordova/PluginEntry;",
            ">;"
        }
    .end annotation
.end field

.field protected preferences:Lorg/apache/cordova/CordovaPreferences;

.field private splashScreen:Landroidx/core/splashscreen/SplashScreen;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 78
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    const/4 v0, 0x1

    .line 91
    iput-boolean v0, p0, Lorg/apache/cordova/CordovaActivity;->keepRunning:Z

    return-void
.end method


# virtual methods
.method protected createViews()V
    .locals 3

    .line 185
    iget-object v0, p0, Lorg/apache/cordova/CordovaActivity;->appView:Lorg/apache/cordova/CordovaWebView;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaWebView;->getView()Landroid/view/View;

    move-result-object v0

    const/16 v1, 0x64

    invoke-virtual {v0, v1}, Landroid/view/View;->setId(I)V

    .line 186
    iget-object v0, p0, Lorg/apache/cordova/CordovaActivity;->appView:Lorg/apache/cordova/CordovaWebView;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaWebView;->getView()Landroid/view/View;

    move-result-object v0

    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v2, -0x1

    invoke-direct {v1, v2, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 190
    iget-object v0, p0, Lorg/apache/cordova/CordovaActivity;->appView:Lorg/apache/cordova/CordovaWebView;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaWebView;->getView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/cordova/CordovaActivity;->setContentView(Landroid/view/View;)V

    .line 192
    iget-object v0, p0, Lorg/apache/cordova/CordovaActivity;->preferences:Lorg/apache/cordova/CordovaPreferences;

    const-string v1, "BackgroundColor"

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CordovaPreferences;->contains(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 194
    :try_start_0
    iget-object v0, p0, Lorg/apache/cordova/CordovaActivity;->preferences:Lorg/apache/cordova/CordovaPreferences;

    const/high16 v2, -0x1000000

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/CordovaPreferences;->getInteger(Ljava/lang/String;I)I

    move-result v0

    .line 196
    iget-object v1, p0, Lorg/apache/cordova/CordovaActivity;->appView:Lorg/apache/cordova/CordovaWebView;

    invoke-interface {v1}, Lorg/apache/cordova/CordovaWebView;->getView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/View;->setBackgroundColor(I)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 199
    invoke-virtual {v0}, Ljava/lang/NumberFormatException;->printStackTrace()V

    .line 203
    :cond_0
    :goto_0
    iget-object v0, p0, Lorg/apache/cordova/CordovaActivity;->appView:Lorg/apache/cordova/CordovaWebView;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaWebView;->getView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->requestFocusFromTouch()Z

    return-void
.end method

.method public displayError(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 8

    .line 420
    new-instance v7, Lorg/apache/cordova/CordovaActivity$4;

    move-object v0, v7

    move-object v1, p0

    move-object v2, p0

    move-object v3, p2

    move-object v4, p1

    move-object v5, p3

    move v6, p4

    invoke-direct/range {v0 .. v6}, Lorg/apache/cordova/CordovaActivity$4;-><init>(Lorg/apache/cordova/CordovaActivity;Lorg/apache/cordova/CordovaActivity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    invoke-virtual {p0, v7}, Lorg/apache/cordova/CordovaActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method protected init()V
    .locals 4

    .line 153
    invoke-virtual {p0}, Lorg/apache/cordova/CordovaActivity;->makeWebView()Lorg/apache/cordova/CordovaWebView;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/cordova/CordovaActivity;->appView:Lorg/apache/cordova/CordovaWebView;

    .line 154
    invoke-virtual {p0}, Lorg/apache/cordova/CordovaActivity;->createViews()V

    .line 155
    iget-object v0, p0, Lorg/apache/cordova/CordovaActivity;->appView:Lorg/apache/cordova/CordovaWebView;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaWebView;->isInitialized()Z

    move-result v0

    if-nez v0, :cond_0

    .line 156
    iget-object v0, p0, Lorg/apache/cordova/CordovaActivity;->appView:Lorg/apache/cordova/CordovaWebView;

    iget-object v1, p0, Lorg/apache/cordova/CordovaActivity;->cordovaInterface:Lorg/apache/cordova/CordovaInterfaceImpl;

    iget-object v2, p0, Lorg/apache/cordova/CordovaActivity;->pluginEntries:Ljava/util/ArrayList;

    iget-object v3, p0, Lorg/apache/cordova/CordovaActivity;->preferences:Lorg/apache/cordova/CordovaPreferences;

    invoke-interface {v0, v1, v2, v3}, Lorg/apache/cordova/CordovaWebView;->init(Lorg/apache/cordova/CordovaInterface;Ljava/util/List;Lorg/apache/cordova/CordovaPreferences;)V

    .line 158
    :cond_0
    iget-object v0, p0, Lorg/apache/cordova/CordovaActivity;->cordovaInterface:Lorg/apache/cordova/CordovaInterfaceImpl;

    iget-object v1, p0, Lorg/apache/cordova/CordovaActivity;->appView:Lorg/apache/cordova/CordovaWebView;

    invoke-interface {v1}, Lorg/apache/cordova/CordovaWebView;->getPluginManager()Lorg/apache/cordova/PluginManager;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CordovaInterfaceImpl;->onCordovaInit(Lorg/apache/cordova/PluginManager;)V

    .line 161
    iget-object v0, p0, Lorg/apache/cordova/CordovaActivity;->cordovaInterface:Lorg/apache/cordova/CordovaInterfaceImpl;

    iget-object v0, v0, Lorg/apache/cordova/CordovaInterfaceImpl;->pluginManager:Lorg/apache/cordova/PluginManager;

    const-string v1, "setupSplashScreen"

    iget-object v2, p0, Lorg/apache/cordova/CordovaActivity;->splashScreen:Landroidx/core/splashscreen/SplashScreen;

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/PluginManager;->postMessage(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 164
    iget-object v0, p0, Lorg/apache/cordova/CordovaActivity;->preferences:Lorg/apache/cordova/CordovaPreferences;

    const-string v1, "DefaultVolumeStream"

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/CordovaPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 165
    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "media"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x3

    .line 166
    invoke-virtual {p0, v0}, Lorg/apache/cordova/CordovaActivity;->setVolumeControlStream(I)V

    :cond_1
    return-void
.end method

.method protected loadConfig()V
    .locals 3

    .line 172
    new-instance v0, Lorg/apache/cordova/ConfigXmlParser;

    invoke-direct {v0}, Lorg/apache/cordova/ConfigXmlParser;-><init>()V

    .line 173
    invoke-virtual {v0, p0}, Lorg/apache/cordova/ConfigXmlParser;->parse(Landroid/content/Context;)V

    .line 174
    invoke-virtual {v0}, Lorg/apache/cordova/ConfigXmlParser;->getPreferences()Lorg/apache/cordova/CordovaPreferences;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/cordova/CordovaActivity;->preferences:Lorg/apache/cordova/CordovaPreferences;

    .line 175
    invoke-virtual {p0}, Lorg/apache/cordova/CordovaActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/cordova/CordovaPreferences;->setPreferencesBundle(Landroid/os/Bundle;)V

    .line 176
    invoke-virtual {v0}, Lorg/apache/cordova/ConfigXmlParser;->getLaunchUrl()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/cordova/CordovaActivity;->launchUrl:Ljava/lang/String;

    .line 177
    invoke-virtual {v0}, Lorg/apache/cordova/ConfigXmlParser;->getPluginEntries()Ljava/util/ArrayList;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/cordova/CordovaActivity;->pluginEntries:Ljava/util/ArrayList;

    .line 178
    sput-object v0, Lorg/apache/cordova/Config;->parser:Lorg/apache/cordova/ConfigXmlParser;

    return-void
.end method

.method public loadUrl(Ljava/lang/String;)V
    .locals 3

    .line 233
    iget-object v0, p0, Lorg/apache/cordova/CordovaActivity;->appView:Lorg/apache/cordova/CordovaWebView;

    if-nez v0, :cond_0

    .line 234
    invoke-virtual {p0}, Lorg/apache/cordova/CordovaActivity;->init()V

    .line 238
    :cond_0
    iget-object v0, p0, Lorg/apache/cordova/CordovaActivity;->preferences:Lorg/apache/cordova/CordovaPreferences;

    const-string v1, "KeepRunning"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/CordovaPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lorg/apache/cordova/CordovaActivity;->keepRunning:Z

    .line 240
    iget-object v0, p0, Lorg/apache/cordova/CordovaActivity;->appView:Lorg/apache/cordova/CordovaWebView;

    invoke-interface {v0, p1, v2}, Lorg/apache/cordova/CordovaWebView;->loadUrlIntoView(Ljava/lang/String;Z)V

    return-void
.end method

.method protected makeCordovaInterface()Lorg/apache/cordova/CordovaInterfaceImpl;
    .locals 1

    .line 220
    new-instance v0, Lorg/apache/cordova/CordovaActivity$1;

    invoke-direct {v0, p0, p0}, Lorg/apache/cordova/CordovaActivity$1;-><init>(Lorg/apache/cordova/CordovaActivity;Landroidx/appcompat/app/AppCompatActivity;)V

    return-object v0
.end method

.method protected makeWebView()Lorg/apache/cordova/CordovaWebView;
    .locals 2

    .line 212
    new-instance v0, Lorg/apache/cordova/CordovaWebViewImpl;

    invoke-virtual {p0}, Lorg/apache/cordova/CordovaActivity;->makeWebViewEngine()Lorg/apache/cordova/CordovaWebViewEngine;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/cordova/CordovaWebViewImpl;-><init>(Lorg/apache/cordova/CordovaWebViewEngine;)V

    return-object v0
.end method

.method protected makeWebViewEngine()Lorg/apache/cordova/CordovaWebViewEngine;
    .locals 1

    .line 216
    iget-object v0, p0, Lorg/apache/cordova/CordovaActivity;->preferences:Lorg/apache/cordova/CordovaPreferences;

    invoke-static {p0, v0}, Lorg/apache/cordova/CordovaWebViewImpl;->createEngine(Landroid/content/Context;Lorg/apache/cordova/CordovaPreferences;)Lorg/apache/cordova/CordovaWebViewEngine;

    move-result-object v0

    return-object v0
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 3

    .line 373
    sget-object v0, Lorg/apache/cordova/CordovaActivity;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Incoming Result. Request code = "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 374
    invoke-super {p0, p1, p2, p3}, Landroidx/appcompat/app/AppCompatActivity;->onActivityResult(IILandroid/content/Intent;)V

    .line 375
    iget-object v0, p0, Lorg/apache/cordova/CordovaActivity;->cordovaInterface:Lorg/apache/cordova/CordovaInterfaceImpl;

    invoke-virtual {v0, p1, p2, p3}, Lorg/apache/cordova/CordovaInterfaceImpl;->onActivityResult(IILandroid/content/Intent;)Z

    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 1

    .line 508
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 509
    iget-object v0, p0, Lorg/apache/cordova/CordovaActivity;->appView:Lorg/apache/cordova/CordovaWebView;

    if-nez v0, :cond_0

    return-void

    .line 512
    :cond_0
    invoke-interface {v0}, Lorg/apache/cordova/CordovaWebView;->getPluginManager()Lorg/apache/cordova/PluginManager;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 514
    invoke-virtual {v0, p1}, Lorg/apache/cordova/PluginManager;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    :cond_1
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 5

    .line 110
    invoke-static {p0}, Landroidx/core/splashscreen/SplashScreen;->installSplashScreen(Landroid/app/Activity;)Landroidx/core/splashscreen/SplashScreen;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/cordova/CordovaActivity;->splashScreen:Landroidx/core/splashscreen/SplashScreen;

    .line 113
    invoke-virtual {p0}, Lorg/apache/cordova/CordovaActivity;->loadConfig()V

    .line 115
    iget-object v0, p0, Lorg/apache/cordova/CordovaActivity;->preferences:Lorg/apache/cordova/CordovaPreferences;

    const-string v1, "loglevel"

    const-string v2, "ERROR"

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/CordovaPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 116
    invoke-static {v0}, Lorg/apache/cordova/LOG;->setLogLevel(Ljava/lang/String;)V

    .line 118
    sget-object v0, Lorg/apache/cordova/CordovaActivity;->TAG:Ljava/lang/String;

    const-string v1, "Apache Cordova native platform version 13.0.0 is starting"

    invoke-static {v0, v1}, Lorg/apache/cordova/LOG;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 119
    sget-object v0, Lorg/apache/cordova/CordovaActivity;->TAG:Ljava/lang/String;

    const-string v1, "CordovaActivity.onCreate()"

    invoke-static {v0, v1}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 121
    iget-object v0, p0, Lorg/apache/cordova/CordovaActivity;->preferences:Lorg/apache/cordova/CordovaPreferences;

    const-string v1, "ShowTitle"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/CordovaPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_0

    .line 122
    invoke-virtual {p0}, Lorg/apache/cordova/CordovaActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/Window;->requestFeature(I)Z

    .line 125
    :cond_0
    iget-object v0, p0, Lorg/apache/cordova/CordovaActivity;->preferences:Lorg/apache/cordova/CordovaPreferences;

    const-string v3, "SetFullscreen"

    invoke-virtual {v0, v3, v2}, Lorg/apache/cordova/CordovaPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    const-string v3, "Fullscreen"

    if-eqz v0, :cond_1

    .line 126
    sget-object v0, Lorg/apache/cordova/CordovaActivity;->TAG:Ljava/lang/String;

    const-string v4, "The SetFullscreen configuration is deprecated in favor of Fullscreen, and will be removed in a future version."

    invoke-static {v0, v4}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 127
    iget-object v0, p0, Lorg/apache/cordova/CordovaActivity;->preferences:Lorg/apache/cordova/CordovaPreferences;

    invoke-virtual {v0, v3, v1}, Lorg/apache/cordova/CordovaPreferences;->set(Ljava/lang/String;Z)V

    .line 129
    :cond_1
    iget-object v0, p0, Lorg/apache/cordova/CordovaActivity;->preferences:Lorg/apache/cordova/CordovaPreferences;

    invoke-virtual {v0, v3, v2}, Lorg/apache/cordova/CordovaPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 132
    iget-object v0, p0, Lorg/apache/cordova/CordovaActivity;->preferences:Lorg/apache/cordova/CordovaPreferences;

    const-string v3, "FullscreenNotImmersive"

    invoke-virtual {v0, v3, v2}, Lorg/apache/cordova/CordovaPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_2

    .line 133
    iput-boolean v1, p0, Lorg/apache/cordova/CordovaActivity;->immersiveMode:Z

    .line 134
    invoke-virtual {p0}, Lorg/apache/cordova/CordovaActivity;->setImmersiveUiVisibility()V

    goto :goto_0

    .line 136
    :cond_2
    invoke-virtual {p0}, Lorg/apache/cordova/CordovaActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v1, 0x400

    invoke-virtual {v0, v1, v1}, Landroid/view/Window;->setFlags(II)V

    goto :goto_0

    .line 140
    :cond_3
    invoke-virtual {p0}, Lorg/apache/cordova/CordovaActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v1, 0x800

    invoke-virtual {v0, v1, v1}, Landroid/view/Window;->setFlags(II)V

    .line 144
    :goto_0
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 146
    invoke-virtual {p0}, Lorg/apache/cordova/CordovaActivity;->makeCordovaInterface()Lorg/apache/cordova/CordovaInterfaceImpl;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/cordova/CordovaActivity;->cordovaInterface:Lorg/apache/cordova/CordovaInterfaceImpl;

    if-eqz p1, :cond_4

    .line 148
    invoke-virtual {v0, p1}, Lorg/apache/cordova/CordovaInterfaceImpl;->restoreInstanceState(Landroid/os/Bundle;)V

    :cond_4
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2

    .line 452
    iget-object v0, p0, Lorg/apache/cordova/CordovaActivity;->appView:Lorg/apache/cordova/CordovaWebView;

    if-eqz v0, :cond_0

    .line 453
    invoke-interface {v0}, Lorg/apache/cordova/CordovaWebView;->getPluginManager()Lorg/apache/cordova/PluginManager;

    move-result-object v0

    const-string v1, "onCreateOptionsMenu"

    invoke-virtual {v0, v1, p1}, Lorg/apache/cordova/PluginManager;->postMessage(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 455
    :cond_0
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    move-result p1

    return p1
.end method

.method public onDestroy()V
    .locals 2

    .line 323
    sget-object v0, Lorg/apache/cordova/CordovaActivity;->TAG:Ljava/lang/String;

    const-string v1, "CordovaActivity.onDestroy()"

    invoke-static {v0, v1}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 324
    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->onDestroy()V

    .line 326
    iget-object v0, p0, Lorg/apache/cordova/CordovaActivity;->appView:Lorg/apache/cordova/CordovaWebView;

    if-eqz v0, :cond_0

    .line 327
    invoke-interface {v0}, Lorg/apache/cordova/CordovaWebView;->handleDestroy()V

    :cond_0
    return-void
.end method

.method public onMessage(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 482
    const-string v0, "onReceivedError"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 483
    check-cast p2, Lorg/json/JSONObject;

    .line 485
    :try_start_0
    const-string p1, "errorCode"

    invoke-virtual {p2, p1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result p1

    const-string v0, "description"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "url"

    invoke-virtual {p2, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/cordova/CordovaActivity;->onReceivedError(ILjava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 487
    invoke-virtual {p1}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0

    .line 489
    :cond_0
    const-string p2, "exit"

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 490
    invoke-virtual {p0}, Lorg/apache/cordova/CordovaActivity;->finish()V

    :cond_1
    :goto_0
    const/4 p1, 0x0

    return-object p1
.end method

.method protected onNewIntent(Landroid/content/Intent;)V
    .locals 1

    .line 264
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onNewIntent(Landroid/content/Intent;)V

    .line 266
    iget-object v0, p0, Lorg/apache/cordova/CordovaActivity;->appView:Lorg/apache/cordova/CordovaWebView;

    if-eqz v0, :cond_0

    .line 267
    invoke-interface {v0, p1}, Lorg/apache/cordova/CordovaWebView;->onNewIntent(Landroid/content/Intent;)V

    :cond_0
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2

    .line 468
    iget-object v0, p0, Lorg/apache/cordova/CordovaActivity;->appView:Lorg/apache/cordova/CordovaWebView;

    if-eqz v0, :cond_0

    .line 469
    invoke-interface {v0}, Lorg/apache/cordova/CordovaWebView;->getPluginManager()Lorg/apache/cordova/PluginManager;

    move-result-object v0

    const-string v1, "onOptionsItemSelected"

    invoke-virtual {v0, v1, p1}, Lorg/apache/cordova/PluginManager;->postMessage(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    const/4 p1, 0x1

    return p1
.end method

.method protected onPause()V
    .locals 2

    .line 248
    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->onPause()V

    .line 249
    sget-object v0, Lorg/apache/cordova/CordovaActivity;->TAG:Ljava/lang/String;

    const-string v1, "Paused the activity."

    invoke-static {v0, v1}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 251
    iget-object v0, p0, Lorg/apache/cordova/CordovaActivity;->appView:Lorg/apache/cordova/CordovaWebView;

    if-eqz v0, :cond_2

    .line 254
    iget-boolean v0, p0, Lorg/apache/cordova/CordovaActivity;->keepRunning:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lorg/apache/cordova/CordovaActivity;->cordovaInterface:Lorg/apache/cordova/CordovaInterfaceImpl;

    iget-object v0, v0, Lorg/apache/cordova/CordovaInterfaceImpl;->activityResultCallback:Lorg/apache/cordova/CordovaPlugin;

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 255
    :goto_1
    iget-object v1, p0, Lorg/apache/cordova/CordovaActivity;->appView:Lorg/apache/cordova/CordovaWebView;

    invoke-interface {v1, v0}, Lorg/apache/cordova/CordovaWebView;->handlePause(Z)V

    :cond_2
    return-void
.end method

.method public onPrepareOptionsMenu(Landroid/view/Menu;)Z
    .locals 2

    .line 460
    iget-object v0, p0, Lorg/apache/cordova/CordovaActivity;->appView:Lorg/apache/cordova/CordovaWebView;

    if-eqz v0, :cond_0

    .line 461
    invoke-interface {v0}, Lorg/apache/cordova/CordovaWebView;->getPluginManager()Lorg/apache/cordova/PluginManager;

    move-result-object v0

    const-string v1, "onPrepareOptionsMenu"

    invoke-virtual {v0, v1, p1}, Lorg/apache/cordova/PluginManager;->postMessage(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    const/4 p1, 0x1

    return p1
.end method

.method public onReceivedError(ILjava/lang/String;Ljava/lang/String;)V
    .locals 6

    .line 390
    iget-object v0, p0, Lorg/apache/cordova/CordovaActivity;->preferences:Lorg/apache/cordova/CordovaPreferences;

    const-string v1, "errorUrl"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/CordovaPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 391
    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lorg/apache/cordova/CordovaActivity;->appView:Lorg/apache/cordova/CordovaWebView;

    if-eqz v1, :cond_0

    .line 393
    new-instance p1, Lorg/apache/cordova/CordovaActivity$2;

    invoke-direct {p1, p0, p0, v0}, Lorg/apache/cordova/CordovaActivity$2;-><init>(Lorg/apache/cordova/CordovaActivity;Lorg/apache/cordova/CordovaActivity;Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Lorg/apache/cordova/CordovaActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_1

    :cond_0
    const/4 v0, -0x2

    if-eq p1, v0, :cond_1

    const/4 p1, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    :goto_0
    move v2, p1

    .line 403
    new-instance p1, Lorg/apache/cordova/CordovaActivity$3;

    move-object v0, p1

    move-object v1, p0

    move-object v3, p0

    move-object v4, p2

    move-object v5, p3

    invoke-direct/range {v0 .. v5}, Lorg/apache/cordova/CordovaActivity$3;-><init>(Lorg/apache/cordova/CordovaActivity;ZLorg/apache/cordova/CordovaActivity;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Lorg/apache/cordova/CordovaActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    :goto_1
    return-void
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .locals 1

    .line 528
    invoke-super {p0, p1, p2, p3}, Landroidx/appcompat/app/AppCompatActivity;->onRequestPermissionsResult(I[Ljava/lang/String;[I)V

    .line 532
    :try_start_0
    iget-object v0, p0, Lorg/apache/cordova/CordovaActivity;->cordovaInterface:Lorg/apache/cordova/CordovaInterfaceImpl;

    invoke-virtual {v0, p1, p2, p3}, Lorg/apache/cordova/CordovaInterfaceImpl;->onRequestPermissionResult(I[Ljava/lang/String;[I)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 536
    sget-object p2, Lorg/apache/cordova/CordovaActivity;->TAG:Ljava/lang/String;

    const-string p3, "JSONException: Parameters fed into the method are not valid"

    invoke-static {p2, p3}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 537
    invoke-virtual {p1}, Lorg/json/JSONException;->printStackTrace()V

    :goto_0
    return-void
.end method

.method protected onResume()V
    .locals 2

    .line 275
    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->onResume()V

    .line 276
    sget-object v0, Lorg/apache/cordova/CordovaActivity;->TAG:Ljava/lang/String;

    const-string v1, "Resumed the activity."

    invoke-static {v0, v1}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 278
    iget-object v0, p0, Lorg/apache/cordova/CordovaActivity;->appView:Lorg/apache/cordova/CordovaWebView;

    if-nez v0, :cond_0

    return-void

    .line 281
    :cond_0
    invoke-virtual {p0}, Lorg/apache/cordova/CordovaActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->hasFocus()Z

    move-result v0

    if-nez v0, :cond_1

    .line 284
    invoke-virtual {p0}, Lorg/apache/cordova/CordovaActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    .line 287
    :cond_1
    iget-object v0, p0, Lorg/apache/cordova/CordovaActivity;->appView:Lorg/apache/cordova/CordovaWebView;

    iget-boolean v1, p0, Lorg/apache/cordova/CordovaActivity;->keepRunning:Z

    invoke-interface {v0, v1}, Lorg/apache/cordova/CordovaWebView;->handleResume(Z)V

    return-void
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 1

    .line 497
    iget-object v0, p0, Lorg/apache/cordova/CordovaActivity;->cordovaInterface:Lorg/apache/cordova/CordovaInterfaceImpl;

    invoke-virtual {v0, p1}, Lorg/apache/cordova/CordovaInterfaceImpl;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 498
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onSaveInstanceState(Landroid/os/Bundle;)V

    return-void
.end method

.method protected onStart()V
    .locals 2

    .line 309
    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->onStart()V

    .line 310
    sget-object v0, Lorg/apache/cordova/CordovaActivity;->TAG:Ljava/lang/String;

    const-string v1, "Started the activity."

    invoke-static {v0, v1}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 312
    iget-object v0, p0, Lorg/apache/cordova/CordovaActivity;->appView:Lorg/apache/cordova/CordovaWebView;

    if-nez v0, :cond_0

    return-void

    .line 315
    :cond_0
    invoke-interface {v0}, Lorg/apache/cordova/CordovaWebView;->handleStart()V

    return-void
.end method

.method protected onStop()V
    .locals 2

    .line 295
    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->onStop()V

    .line 296
    sget-object v0, Lorg/apache/cordova/CordovaActivity;->TAG:Ljava/lang/String;

    const-string v1, "Stopped the activity."

    invoke-static {v0, v1}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 298
    iget-object v0, p0, Lorg/apache/cordova/CordovaActivity;->appView:Lorg/apache/cordova/CordovaWebView;

    if-nez v0, :cond_0

    return-void

    .line 301
    :cond_0
    invoke-interface {v0}, Lorg/apache/cordova/CordovaWebView;->handleStop()V

    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 0

    .line 336
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onWindowFocusChanged(Z)V

    if-eqz p1, :cond_0

    .line 337
    iget-boolean p1, p0, Lorg/apache/cordova/CordovaActivity;->immersiveMode:Z

    if-eqz p1, :cond_0

    .line 338
    invoke-virtual {p0}, Lorg/apache/cordova/CordovaActivity;->setImmersiveUiVisibility()V

    :cond_0
    return-void
.end method

.method protected setImmersiveUiVisibility()V
    .locals 2

    .line 351
    invoke-virtual {p0}, Lorg/apache/cordova/CordovaActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    const/16 v1, 0x1706

    invoke-virtual {v0, v1}, Landroid/view/View;->setSystemUiVisibility(I)V

    return-void
.end method

.method public startActivityForResult(Landroid/content/Intent;ILandroid/os/Bundle;)V
    .locals 1

    .line 358
    iget-object v0, p0, Lorg/apache/cordova/CordovaActivity;->cordovaInterface:Lorg/apache/cordova/CordovaInterfaceImpl;

    invoke-virtual {v0, p2}, Lorg/apache/cordova/CordovaInterfaceImpl;->setActivityResultRequestCode(I)V

    .line 359
    invoke-super {p0, p1, p2, p3}, Landroidx/appcompat/app/AppCompatActivity;->startActivityForResult(Landroid/content/Intent;ILandroid/os/Bundle;)V

    return-void
.end method
