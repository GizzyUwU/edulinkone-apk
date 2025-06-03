.class Lorg/apache/cordova/file/FileUtils$30;
.super Ljava/lang/Object;
.source "FileUtils.java"

# interfaces
.implements Lorg/apache/cordova/file/FileUtils$FileOp;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/cordova/file/FileUtils;->onRequestPermissionResult(I[Ljava/lang/String;[I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/cordova/file/FileUtils;

.field final synthetic val$req:Lorg/apache/cordova/file/PendingRequests$Request;


# direct methods
.method constructor <init>(Lorg/apache/cordova/file/FileUtils;Lorg/apache/cordova/file/PendingRequests$Request;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1248
    iput-object p1, p0, Lorg/apache/cordova/file/FileUtils$30;->this$0:Lorg/apache/cordova/file/FileUtils;

    iput-object p2, p0, Lorg/apache/cordova/file/FileUtils$30;->val$req:Lorg/apache/cordova/file/PendingRequests$Request;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run(Lorg/json/JSONArray;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;,
            Lorg/json/JSONException;,
            Ljava/net/MalformedURLException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 1250
    invoke-virtual {p1, v0}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object p1

    .line 1251
    iget-object v0, p0, Lorg/apache/cordova/file/FileUtils$30;->this$0:Lorg/apache/cordova/file/FileUtils;

    invoke-static {v0, p1}, Lorg/apache/cordova/file/FileUtils;->access$1400(Lorg/apache/cordova/file/FileUtils;Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p1

    .line 1252
    iget-object v0, p0, Lorg/apache/cordova/file/FileUtils$30;->val$req:Lorg/apache/cordova/file/PendingRequests$Request;

    invoke-virtual {v0}, Lorg/apache/cordova/file/PendingRequests$Request;->getCallbackContext()Lorg/apache/cordova/CallbackContext;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONArray;)V

    return-void
.end method
