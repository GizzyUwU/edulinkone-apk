.class public Lorg/apache/cordova/engine/SystemWebChromeClient;
.super Landroid/webkit/WebChromeClient;
.source "SystemWebChromeClient.java"


# static fields
.field private static final FILECHOOSER_RESULTCODE:I = 0x1435

.field private static final LOG_TAG:Ljava/lang/String; = "SystemWebChromeClient"


# instance fields
.field private MAX_QUOTA:J

.field private appContext:Landroid/content/Context;

.field private dialogsHelper:Lorg/apache/cordova/CordovaDialogsHelper;

.field private mCustomView:Landroid/view/View;

.field private mCustomViewCallback:Landroid/webkit/WebChromeClient$CustomViewCallback;

.field private mVideoProgressView:Landroid/view/View;

.field protected final parentEngine:Lorg/apache/cordova/engine/SystemWebViewEngine;


# direct methods
.method public constructor <init>(Lorg/apache/cordova/engine/SystemWebViewEngine;)V
    .locals 2

    .line 76
    invoke-direct {p0}, Landroid/webkit/WebChromeClient;-><init>()V

    const-wide/32 v0, 0x6400000

    .line 64
    iput-wide v0, p0, Lorg/apache/cordova/engine/SystemWebChromeClient;->MAX_QUOTA:J

    .line 77
    iput-object p1, p0, Lorg/apache/cordova/engine/SystemWebChromeClient;->parentEngine:Lorg/apache/cordova/engine/SystemWebViewEngine;

    .line 78
    iget-object p1, p1, Lorg/apache/cordova/engine/SystemWebViewEngine;->webView:Lorg/apache/cordova/engine/SystemWebView;

    invoke-virtual {p1}, Lorg/apache/cordova/engine/SystemWebView;->getContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lorg/apache/cordova/engine/SystemWebChromeClient;->appContext:Landroid/content/Context;

    .line 79
    new-instance p1, Lorg/apache/cordova/CordovaDialogsHelper;

    iget-object v0, p0, Lorg/apache/cordova/engine/SystemWebChromeClient;->appContext:Landroid/content/Context;

    invoke-direct {p1, v0}, Lorg/apache/cordova/CordovaDialogsHelper;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lorg/apache/cordova/engine/SystemWebChromeClient;->dialogsHelper:Lorg/apache/cordova/CordovaDialogsHelper;

    return-void
.end method

.method private createTempFile(Landroid/content/Context;)Ljava/io/File;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 314
    const-string v0, ".jpg"

    invoke-virtual {p1}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object p1

    const-string v1, "temp"

    invoke-static {v1, v0, p1}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Ljava/io/File;

    move-result-object p1

    return-object p1
.end method

.method private createUriForFile(Landroid/content/Context;Ljava/io/File;)Landroid/net/Uri;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 319
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    .line 320
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ".cdv.core.file.provider"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0, p2}, Landroidx/core/content/FileProvider;->getUriForFile(Landroid/content/Context;Ljava/lang/String;Ljava/io/File;)Landroid/net/Uri;

    move-result-object p1

    return-object p1
.end method


# virtual methods
.method public destroyLastDialog()V
    .locals 1

    .line 331
    iget-object v0, p0, Lorg/apache/cordova/engine/SystemWebChromeClient;->dialogsHelper:Lorg/apache/cordova/CordovaDialogsHelper;

    invoke-virtual {v0}, Lorg/apache/cordova/CordovaDialogsHelper;->destroyLastDialog()V

    return-void
.end method

.method public getVideoLoadingProgressView()Landroid/view/View;
    .locals 4

    .line 198
    iget-object v0, p0, Lorg/apache/cordova/engine/SystemWebChromeClient;->mVideoProgressView:Landroid/view/View;

    if-nez v0, :cond_0

    .line 202
    new-instance v0, Landroid/widget/LinearLayout;

    iget-object v1, p0, Lorg/apache/cordova/engine/SystemWebChromeClient;->parentEngine:Lorg/apache/cordova/engine/SystemWebViewEngine;

    invoke-virtual {v1}, Lorg/apache/cordova/engine/SystemWebViewEngine;->getView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x1

    .line 203
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 204
    new-instance v1, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v2, -0x2

    invoke-direct {v1, v2, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    const/16 v3, 0xd

    .line 205
    invoke-virtual {v1, v3}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 206
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 208
    new-instance v1, Landroid/widget/ProgressBar;

    iget-object v3, p0, Lorg/apache/cordova/engine/SystemWebChromeClient;->parentEngine:Lorg/apache/cordova/engine/SystemWebViewEngine;

    invoke-virtual {v3}, Lorg/apache/cordova/engine/SystemWebViewEngine;->getView()Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v1, v3}, Landroid/widget/ProgressBar;-><init>(Landroid/content/Context;)V

    .line 209
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v3, v2, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/16 v2, 0x11

    .line 210
    iput v2, v3, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 211
    invoke-virtual {v1, v3}, Landroid/widget/ProgressBar;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 212
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 214
    iput-object v0, p0, Lorg/apache/cordova/engine/SystemWebChromeClient;->mVideoProgressView:Landroid/view/View;

    .line 216
    :cond_0
    iget-object v0, p0, Lorg/apache/cordova/engine/SystemWebChromeClient;->mVideoProgressView:Landroid/view/View;

    return-object v0
.end method

.method public onExceededDatabaseQuota(Ljava/lang/String;Ljava/lang/String;JJJLandroid/webkit/WebStorage$QuotaUpdater;)V
    .locals 0

    .line 154
    invoke-static {p5, p6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    invoke-static {p7, p8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p3

    filled-new-array {p1, p2, p3}, [Ljava/lang/Object;

    move-result-object p1

    const-string p2, "SystemWebChromeClient"

    const-string p3, "onExceededDatabaseQuota estimatedSize: %d  currentQuota: %d  totalUsedQuota: %d"

    invoke-static {p2, p3, p1}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 155
    iget-wide p1, p0, Lorg/apache/cordova/engine/SystemWebChromeClient;->MAX_QUOTA:J

    invoke-interface {p9, p1, p2}, Landroid/webkit/WebStorage$QuotaUpdater;->updateQuota(J)V

    return-void
.end method

.method public onGeolocationPermissionsShowPrompt(Ljava/lang/String;Landroid/webkit/GeolocationPermissions$Callback;)V
    .locals 2

    .line 168
    invoke-super {p0, p1, p2}, Landroid/webkit/WebChromeClient;->onGeolocationPermissionsShowPrompt(Ljava/lang/String;Landroid/webkit/GeolocationPermissions$Callback;)V

    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 169
    invoke-interface {p2, p1, v0, v1}, Landroid/webkit/GeolocationPermissions$Callback;->invoke(Ljava/lang/String;ZZ)V

    .line 171
    iget-object p1, p0, Lorg/apache/cordova/engine/SystemWebChromeClient;->parentEngine:Lorg/apache/cordova/engine/SystemWebViewEngine;

    iget-object p1, p1, Lorg/apache/cordova/engine/SystemWebViewEngine;->pluginManager:Lorg/apache/cordova/PluginManager;

    const-string p2, "Geolocation"

    invoke-virtual {p1, p2}, Lorg/apache/cordova/PluginManager;->getPlugin(Ljava/lang/String;)Lorg/apache/cordova/CordovaPlugin;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 172
    invoke-virtual {p1}, Lorg/apache/cordova/CordovaPlugin;->hasPermisssion()Z

    move-result p2

    if-nez p2, :cond_0

    .line 174
    invoke-virtual {p1, v1}, Lorg/apache/cordova/CordovaPlugin;->requestPermissions(I)V

    :cond_0
    return-void
.end method

.method public onHideCustomView()V
    .locals 1

    .line 188
    iget-object v0, p0, Lorg/apache/cordova/engine/SystemWebChromeClient;->parentEngine:Lorg/apache/cordova/engine/SystemWebViewEngine;

    invoke-virtual {v0}, Lorg/apache/cordova/engine/SystemWebViewEngine;->getCordovaWebView()Lorg/apache/cordova/CordovaWebView;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/cordova/CordovaWebView;->hideCustomView()V

    return-void
.end method

.method public onJsAlert(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsResult;)Z
    .locals 0

    .line 87
    iget-object p1, p0, Lorg/apache/cordova/engine/SystemWebChromeClient;->dialogsHelper:Lorg/apache/cordova/CordovaDialogsHelper;

    new-instance p2, Lorg/apache/cordova/engine/SystemWebChromeClient$1;

    invoke-direct {p2, p0, p4}, Lorg/apache/cordova/engine/SystemWebChromeClient$1;-><init>(Lorg/apache/cordova/engine/SystemWebChromeClient;Landroid/webkit/JsResult;)V

    invoke-virtual {p1, p3, p2}, Lorg/apache/cordova/CordovaDialogsHelper;->showAlert(Ljava/lang/String;Lorg/apache/cordova/CordovaDialogsHelper$Result;)V

    const/4 p1, 0x1

    return p1
.end method

.method public onJsConfirm(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsResult;)Z
    .locals 0

    .line 104
    iget-object p1, p0, Lorg/apache/cordova/engine/SystemWebChromeClient;->dialogsHelper:Lorg/apache/cordova/CordovaDialogsHelper;

    new-instance p2, Lorg/apache/cordova/engine/SystemWebChromeClient$2;

    invoke-direct {p2, p0, p4}, Lorg/apache/cordova/engine/SystemWebChromeClient$2;-><init>(Lorg/apache/cordova/engine/SystemWebChromeClient;Landroid/webkit/JsResult;)V

    invoke-virtual {p1, p3, p2}, Lorg/apache/cordova/CordovaDialogsHelper;->showConfirm(Ljava/lang/String;Lorg/apache/cordova/CordovaDialogsHelper$Result;)V

    const/4 p1, 0x1

    return p1
.end method

.method public onJsPrompt(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsPromptResult;)Z
    .locals 0

    .line 128
    iget-object p1, p0, Lorg/apache/cordova/engine/SystemWebChromeClient;->parentEngine:Lorg/apache/cordova/engine/SystemWebViewEngine;

    iget-object p1, p1, Lorg/apache/cordova/engine/SystemWebViewEngine;->bridge:Lorg/apache/cordova/CordovaBridge;

    invoke-virtual {p1, p2, p3, p4}, Lorg/apache/cordova/CordovaBridge;->promptOnJsPrompt(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 130
    invoke-virtual {p5, p1}, Landroid/webkit/JsPromptResult;->confirm(Ljava/lang/String;)V

    goto :goto_0

    .line 132
    :cond_0
    iget-object p1, p0, Lorg/apache/cordova/engine/SystemWebChromeClient;->dialogsHelper:Lorg/apache/cordova/CordovaDialogsHelper;

    new-instance p2, Lorg/apache/cordova/engine/SystemWebChromeClient$3;

    invoke-direct {p2, p0, p5}, Lorg/apache/cordova/engine/SystemWebChromeClient$3;-><init>(Lorg/apache/cordova/engine/SystemWebChromeClient;Landroid/webkit/JsPromptResult;)V

    invoke-virtual {p1, p3, p4, p2}, Lorg/apache/cordova/CordovaDialogsHelper;->showPrompt(Ljava/lang/String;Ljava/lang/String;Lorg/apache/cordova/CordovaDialogsHelper$Result;)V

    :goto_0
    const/4 p1, 0x1

    return p1
.end method

.method public onPermissionRequest(Landroid/webkit/PermissionRequest;)V
    .locals 2

    .line 326
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "onPermissionRequest: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Landroid/webkit/PermissionRequest;->getResources()[Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "SystemWebChromeClient"

    invoke-static {v1, v0}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 327
    invoke-virtual {p1}, Landroid/webkit/PermissionRequest;->getResources()[Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/webkit/PermissionRequest;->grant([Ljava/lang/String;)V

    return-void
.end method

.method public onShowCustomView(Landroid/view/View;Landroid/webkit/WebChromeClient$CustomViewCallback;)V
    .locals 1

    .line 182
    iget-object v0, p0, Lorg/apache/cordova/engine/SystemWebChromeClient;->parentEngine:Lorg/apache/cordova/engine/SystemWebViewEngine;

    invoke-virtual {v0}, Lorg/apache/cordova/engine/SystemWebViewEngine;->getCordovaWebView()Lorg/apache/cordova/CordovaWebView;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Lorg/apache/cordova/CordovaWebView;->showCustomView(Landroid/view/View;Landroid/webkit/WebChromeClient$CustomViewCallback;)V

    return-void
.end method

.method public onShowFileChooser(Landroid/webkit/WebView;Landroid/webkit/ValueCallback;Landroid/webkit/WebChromeClient$FileChooserParams;)Z
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/webkit/WebView;",
            "Landroid/webkit/ValueCallback<",
            "[",
            "Landroid/net/Uri;",
            ">;",
            "Landroid/webkit/WebChromeClient$FileChooserParams;",
            ")Z"
        }
    .end annotation

    const-string p1, "Temporary photo capture URI: "

    const-string v0, "Temporary photo capture file: "

    .line 222
    invoke-virtual {p3}, Landroid/webkit/WebChromeClient$FileChooserParams;->createIntent()Landroid/content/Intent;

    move-result-object v1

    const/4 v2, 0x0

    .line 225
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    .line 226
    invoke-virtual {p3}, Landroid/webkit/WebChromeClient$FileChooserParams;->getMode()I

    move-result v4

    const/4 v5, 0x1

    if-ne v4, v5, :cond_0

    .line 227
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    .line 229
    :cond_0
    const-string v4, "android.intent.extra.ALLOW_MULTIPLE"

    invoke-virtual {v1, v4, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 232
    invoke-virtual {p3}, Landroid/webkit/WebChromeClient$FileChooserParams;->getAcceptTypes()[Ljava/lang/String;

    move-result-object v3

    .line 233
    array-length v4, v3

    if-le v4, v5, :cond_1

    .line 234
    const-string v4, "*/*"

    invoke-virtual {v1, v4}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 235
    const-string v4, "android.intent.extra.MIME_TYPES"

    invoke-virtual {v1, v4, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/Intent;

    .line 241
    :cond_1
    invoke-virtual {p3}, Landroid/webkit/WebChromeClient$FileChooserParams;->isCaptureEnabled()Z

    move-result p3

    const-string v3, "SystemWebChromeClient"

    const/4 v4, 0x0

    if-eqz p3, :cond_3

    .line 242
    new-instance p3, Landroid/content/Intent;

    const-string v6, "android.media.action.IMAGE_CAPTURE"

    invoke-direct {p3, v6}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 243
    iget-object v6, p0, Lorg/apache/cordova/engine/SystemWebChromeClient;->parentEngine:Lorg/apache/cordova/engine/SystemWebViewEngine;

    invoke-virtual {v6}, Lorg/apache/cordova/engine/SystemWebViewEngine;->getView()Landroid/view/View;

    move-result-object v6

    invoke-virtual {v6}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v6

    .line 244
    invoke-virtual {v6}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v7

    const-string v8, "android.hardware.camera.any"

    invoke-virtual {v7, v8}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 245
    invoke-virtual {v6}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v7

    invoke-virtual {p3, v7}, Landroid/content/Intent;->resolveActivity(Landroid/content/pm/PackageManager;)Landroid/content/ComponentName;

    move-result-object v7

    if-eqz v7, :cond_2

    .line 247
    :try_start_0
    invoke-direct {p0, v6}, Lorg/apache/cordova/engine/SystemWebChromeClient;->createTempFile(Landroid/content/Context;)Ljava/io/File;

    move-result-object v7

    .line 248
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 249
    invoke-direct {p0, v6, v7}, Lorg/apache/cordova/engine/SystemWebChromeClient;->createUriForFile(Landroid/content/Context;Ljava/io/File;)Landroid/net/Uri;

    move-result-object v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 250
    :try_start_1
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v3, p1}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 251
    const-string p1, "output"

    invoke-virtual {p3, p1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    :catch_0
    move-exception p1

    goto :goto_0

    :catch_1
    move-exception p1

    move-object v0, v4

    .line 253
    :goto_0
    const-string p3, "Unable to create temporary file for photo capture"

    invoke-static {v3, p3, p1}, Lorg/apache/cordova/LOG;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    move-object p3, v4

    goto :goto_1

    .line 257
    :cond_2
    const-string p1, "Device does not support photo capture"

    invoke-static {v3, p1}, Lorg/apache/cordova/LOG;->w(Ljava/lang/String;Ljava/lang/String;)V

    :cond_3
    move-object p3, v4

    move-object v0, p3

    .line 264
    :goto_1
    invoke-static {v1, v4}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object p1

    if-eqz p3, :cond_4

    .line 266
    new-array v1, v5, [Landroid/content/Intent;

    aput-object p3, v1, v2

    const-string p3, "android.intent.extra.INITIAL_INTENTS"

    invoke-virtual {p1, p3, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 270
    :cond_4
    :try_start_2
    const-string p3, "Starting intent for file chooser"

    invoke-static {v3, p3}, Lorg/apache/cordova/LOG;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 271
    iget-object p3, p0, Lorg/apache/cordova/engine/SystemWebChromeClient;->parentEngine:Lorg/apache/cordova/engine/SystemWebViewEngine;

    iget-object p3, p3, Lorg/apache/cordova/engine/SystemWebViewEngine;->cordova:Lorg/apache/cordova/CordovaInterface;

    new-instance v1, Lorg/apache/cordova/engine/SystemWebChromeClient$4;

    invoke-direct {v1, p0, v0, p2}, Lorg/apache/cordova/engine/SystemWebChromeClient$4;-><init>(Lorg/apache/cordova/engine/SystemWebChromeClient;Landroid/net/Uri;Landroid/webkit/ValueCallback;)V

    const/16 v0, 0x1435

    invoke-interface {p3, v1, p1, v0}, Lorg/apache/cordova/CordovaInterface;->startActivityForResult(Lorg/apache/cordova/CordovaPlugin;Landroid/content/Intent;I)V
    :try_end_2
    .catch Landroid/content/ActivityNotFoundException; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_2

    :catch_2
    move-exception p1

    .line 306
    const-string p3, "No activity found to handle file chooser intent."

    invoke-static {v3, p3, p1}, Lorg/apache/cordova/LOG;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 307
    invoke-interface {p2, v4}, Landroid/webkit/ValueCallback;->onReceiveValue(Ljava/lang/Object;)V

    :goto_2
    return v5
.end method
