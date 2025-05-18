.class Lorg/apache/cordova/file/FileUtils$23;
.super Ljava/lang/Object;
.source "FileUtils.java"

# interfaces
.implements Lorg/apache/cordova/file/FileUtils$FileOp;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/cordova/file/FileUtils;->execute(Ljava/lang/String;Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/cordova/file/FileUtils;

.field final synthetic val$callbackContext:Lorg/apache/cordova/CallbackContext;

.field final synthetic val$rawArgs:Ljava/lang/String;


# direct methods
.method constructor <init>(Lorg/apache/cordova/file/FileUtils;Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 547
    iput-object p1, p0, Lorg/apache/cordova/file/FileUtils$23;->this$0:Lorg/apache/cordova/file/FileUtils;

    iput-object p2, p0, Lorg/apache/cordova/file/FileUtils$23;->val$rawArgs:Ljava/lang/String;

    iput-object p3, p0, Lorg/apache/cordova/file/FileUtils$23;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run(Lorg/json/JSONArray;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;,
            Lorg/json/JSONException;,
            Ljava/net/MalformedURLException;,
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 549
    invoke-virtual {p1, v0}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object p1

    .line 550
    iget-object v0, p0, Lorg/apache/cordova/file/FileUtils$23;->this$0:Lorg/apache/cordova/file/FileUtils;

    invoke-static {v0, p1}, Lorg/apache/cordova/file/FileUtils;->access$000(Lorg/apache/cordova/file/FileUtils;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "nativeURL"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 551
    iget-object v1, p0, Lorg/apache/cordova/file/FileUtils$23;->this$0:Lorg/apache/cordova/file/FileUtils;

    const/4 v2, 0x4

    invoke-static {v1, v0, v2}, Lorg/apache/cordova/file/FileUtils;->access$100(Lorg/apache/cordova/file/FileUtils;Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 552
    iget-object p1, p0, Lorg/apache/cordova/file/FileUtils$23;->this$0:Lorg/apache/cordova/file/FileUtils;

    iget-object v0, p0, Lorg/apache/cordova/file/FileUtils$23;->val$rawArgs:Ljava/lang/String;

    const/4 v1, 0x3

    iget-object v2, p0, Lorg/apache/cordova/file/FileUtils$23;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-static {p1, v0, v1, v2}, Lorg/apache/cordova/file/FileUtils;->access$900(Lorg/apache/cordova/file/FileUtils;Ljava/lang/String;ILorg/apache/cordova/CallbackContext;)V

    goto :goto_0

    .line 555
    :cond_0
    iget-object v0, p0, Lorg/apache/cordova/file/FileUtils$23;->this$0:Lorg/apache/cordova/file/FileUtils;

    invoke-static {v0, p1}, Lorg/apache/cordova/file/FileUtils;->access$1400(Lorg/apache/cordova/file/FileUtils;Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p1

    .line 556
    iget-object v0, p0, Lorg/apache/cordova/file/FileUtils$23;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v0, p1}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONArray;)V

    :goto_0
    return-void
.end method
