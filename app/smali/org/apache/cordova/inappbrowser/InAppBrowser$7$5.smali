.class Lorg/apache/cordova/inappbrowser/InAppBrowser$7$5;
.super Lorg/apache/cordova/inappbrowser/InAppChromeClient;
.source "InAppBrowser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lorg/apache/cordova/inappbrowser/InAppBrowser$7;


# direct methods
.method constructor <init>(Lorg/apache/cordova/inappbrowser/InAppBrowser$7;Lorg/apache/cordova/CordovaWebView;)V
    .locals 0

    .line 924
    iput-object p1, p0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7$5;->this$1:Lorg/apache/cordova/inappbrowser/InAppBrowser$7;

    invoke-direct {p0, p2}, Lorg/apache/cordova/inappbrowser/InAppChromeClient;-><init>(Lorg/apache/cordova/CordovaWebView;)V

    return-void
.end method


# virtual methods
.method public onShowFileChooser(Landroid/webkit/WebView;Landroid/webkit/ValueCallback;Landroid/webkit/WebChromeClient$FileChooserParams;)Z
    .locals 1
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

    .line 927
    const-string p1, "InAppBrowser"

    const-string p3, "File Chooser 5.0+"

    invoke-static {p1, p3}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 929
    iget-object p1, p0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7$5;->this$1:Lorg/apache/cordova/inappbrowser/InAppBrowser$7;

    iget-object p1, p1, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    invoke-static {p1}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$1500(Lorg/apache/cordova/inappbrowser/InAppBrowser;)Landroid/webkit/ValueCallback;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 930
    iget-object p1, p0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7$5;->this$1:Lorg/apache/cordova/inappbrowser/InAppBrowser$7;

    iget-object p1, p1, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    invoke-static {p1}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$1500(Lorg/apache/cordova/inappbrowser/InAppBrowser;)Landroid/webkit/ValueCallback;

    move-result-object p1

    const/4 p3, 0x0

    invoke-interface {p1, p3}, Landroid/webkit/ValueCallback;->onReceiveValue(Ljava/lang/Object;)V

    .line 932
    :cond_0
    iget-object p1, p0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7$5;->this$1:Lorg/apache/cordova/inappbrowser/InAppBrowser$7;

    iget-object p1, p1, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    invoke-static {p1, p2}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$1502(Lorg/apache/cordova/inappbrowser/InAppBrowser;Landroid/webkit/ValueCallback;)Landroid/webkit/ValueCallback;

    .line 935
    new-instance p1, Landroid/content/Intent;

    const-string p2, "android.intent.action.GET_CONTENT"

    invoke-direct {p1, p2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 936
    const-string p2, "android.intent.category.OPENABLE"

    invoke-virtual {p1, p2}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 937
    const-string p2, "*/*"

    invoke-virtual {p1, p2}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 940
    iget-object p2, p0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7$5;->this$1:Lorg/apache/cordova/inappbrowser/InAppBrowser$7;

    iget-object p2, p2, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    iget-object p2, p2, Lorg/apache/cordova/inappbrowser/InAppBrowser;->cordova:Lorg/apache/cordova/CordovaInterface;

    iget-object p3, p0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7$5;->this$1:Lorg/apache/cordova/inappbrowser/InAppBrowser$7;

    iget-object p3, p3, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    const-string v0, "Select File"

    invoke-static {p1, v0}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object p1

    const/4 v0, 0x1

    invoke-interface {p2, p3, p1, v0}, Lorg/apache/cordova/CordovaInterface;->startActivityForResult(Lorg/apache/cordova/CordovaPlugin;Landroid/content/Intent;I)V

    return v0
.end method
