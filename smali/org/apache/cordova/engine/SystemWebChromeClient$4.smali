.class Lorg/apache/cordova/engine/SystemWebChromeClient$4;
.super Lorg/apache/cordova/CordovaPlugin;
.source "SystemWebChromeClient.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/cordova/engine/SystemWebChromeClient;->onShowFileChooser(Landroid/webkit/WebView;Landroid/webkit/ValueCallback;Landroid/webkit/WebChromeClient$FileChooserParams;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/cordova/engine/SystemWebChromeClient;

.field final synthetic val$captureUri:Landroid/net/Uri;

.field final synthetic val$filePathsCallback:Landroid/webkit/ValueCallback;


# direct methods
.method constructor <init>(Lorg/apache/cordova/engine/SystemWebChromeClient;Landroid/net/Uri;Landroid/webkit/ValueCallback;)V
    .locals 0

    .line 271
    iput-object p1, p0, Lorg/apache/cordova/engine/SystemWebChromeClient$4;->this$0:Lorg/apache/cordova/engine/SystemWebChromeClient;

    iput-object p2, p0, Lorg/apache/cordova/engine/SystemWebChromeClient$4;->val$captureUri:Landroid/net/Uri;

    iput-object p3, p0, Lorg/apache/cordova/engine/SystemWebChromeClient$4;->val$filePathsCallback:Landroid/webkit/ValueCallback;

    invoke-direct {p0}, Lorg/apache/cordova/CordovaPlugin;-><init>()V

    return-void
.end method


# virtual methods
.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 5

    const/4 p1, -0x1

    if-ne p2, p1, :cond_4

    .line 277
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 279
    const-string p2, "SystemWebChromeClient"

    if-eqz p3, :cond_0

    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 280
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Adding file (single): "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p2, v0}, Lorg/apache/cordova/LOG;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 281
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p3

    invoke-interface {p1, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 282
    :cond_0
    iget-object v0, p0, Lorg/apache/cordova/engine/SystemWebChromeClient$4;->val$captureUri:Landroid/net/Uri;

    if-eqz v0, :cond_1

    .line 283
    new-instance p3, Ljava/lang/StringBuilder;

    const-string v0, "Adding camera capture: "

    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v0, p0, Lorg/apache/cordova/engine/SystemWebChromeClient$4;->val$captureUri:Landroid/net/Uri;

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {p2, p3}, Lorg/apache/cordova/LOG;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 284
    iget-object p3, p0, Lorg/apache/cordova/engine/SystemWebChromeClient$4;->val$captureUri:Landroid/net/Uri;

    invoke-interface {p1, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_1
    if-eqz p3, :cond_3

    .line 285
    invoke-virtual {p3}, Landroid/content/Intent;->getClipData()Landroid/content/ClipData;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 286
    invoke-virtual {p3}, Landroid/content/Intent;->getClipData()Landroid/content/ClipData;

    move-result-object p3

    .line 287
    invoke-virtual {p3}, Landroid/content/ClipData;->getItemCount()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_3

    .line 289
    invoke-virtual {p3, v1}, Landroid/content/ClipData;->getItemAt(I)Landroid/content/ClipData$Item;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/ClipData$Item;->getUri()Landroid/net/Uri;

    move-result-object v2

    .line 290
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Adding file (multiple): "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {p2, v3}, Lorg/apache/cordova/LOG;->v(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz v2, :cond_2

    .line 292
    invoke-interface {p1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 297
    :cond_3
    :goto_1
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result p3

    if-nez p3, :cond_4

    .line 298
    new-instance p3, Ljava/lang/StringBuilder;

    const-string v0, "Receive file chooser URL: "

    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {p2, p3}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 299
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p2

    new-array p2, p2, [Landroid/net/Uri;

    invoke-interface {p1, p2}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Landroid/net/Uri;

    goto :goto_2

    :cond_4
    const/4 p1, 0x0

    .line 302
    :goto_2
    iget-object p2, p0, Lorg/apache/cordova/engine/SystemWebChromeClient$4;->val$filePathsCallback:Landroid/webkit/ValueCallback;

    invoke-interface {p2, p1}, Landroid/webkit/ValueCallback;->onReceiveValue(Ljava/lang/Object;)V

    return-void
.end method
