.class Lorg/apache/cordova/inappbrowser/InAppBrowser$7$6;
.super Ljava/lang/Object;
.source "InAppBrowser.java"

# interfaces
.implements Landroid/webkit/DownloadListener;


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
.method constructor <init>(Lorg/apache/cordova/inappbrowser/InAppBrowser$7;)V
    .locals 0

    .line 955
    iput-object p1, p0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7$6;->this$1:Lorg/apache/cordova/inappbrowser/InAppBrowser$7;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDownloadStart(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V
    .locals 3

    .line 960
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 961
    const-string v1, "type"

    const-string v2, "download"

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 962
    const-string v1, "url"

    invoke-virtual {v0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 963
    const-string p1, "userAgent"

    invoke-virtual {v0, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 964
    const-string p1, "contentDisposition"

    invoke-virtual {v0, p1, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 965
    const-string p1, "mimetype"

    invoke-virtual {v0, p1, p4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 966
    const-string p1, "contentLength"

    invoke-virtual {v0, p1, p5, p6}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 967
    iget-object p1, p0, Lorg/apache/cordova/inappbrowser/InAppBrowser$7$6;->this$1:Lorg/apache/cordova/inappbrowser/InAppBrowser$7;

    iget-object p1, p1, Lorg/apache/cordova/inappbrowser/InAppBrowser$7;->this$0:Lorg/apache/cordova/inappbrowser/InAppBrowser;

    const/4 p2, 0x1

    invoke-static {p1, v0, p2}, Lorg/apache/cordova/inappbrowser/InAppBrowser;->access$300(Lorg/apache/cordova/inappbrowser/InAppBrowser;Lorg/json/JSONObject;Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 970
    const-string p2, "InAppBrowser"

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Lorg/apache/cordova/LOG;->e(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void
.end method
