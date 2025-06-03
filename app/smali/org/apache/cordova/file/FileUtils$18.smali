.class Lorg/apache/cordova/file/FileUtils$18;
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
.method constructor <init>(Lorg/apache/cordova/file/FileUtils;Lorg/apache/cordova/CallbackContext;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 472
    iput-object p1, p0, Lorg/apache/cordova/file/FileUtils$18;->this$0:Lorg/apache/cordova/file/FileUtils;

    iput-object p2, p0, Lorg/apache/cordova/file/FileUtils$18;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    iput-object p3, p0, Lorg/apache/cordova/file/FileUtils$18;->val$rawArgs:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run(Lorg/json/JSONArray;)V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/cordova/file/FileExistsException;,
            Ljava/io/IOException;,
            Lorg/apache/cordova/file/TypeMismatchException;,
            Lorg/apache/cordova/file/EncodingException;,
            Lorg/json/JSONException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 474
    invoke-virtual {p1, v0}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    .line 475
    invoke-virtual {p1, v2}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 477
    const-string v4, "__cdvfile_"

    invoke-virtual {v1, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    const/4 v5, 0x2

    if-ne v4, v2, :cond_0

    .line 478
    iget-object v2, p0, Lorg/apache/cordova/file/FileUtils$18;->this$0:Lorg/apache/cordova/file/FileUtils;

    invoke-virtual {p1, v5}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object p1

    invoke-static {v2, v1, v3, p1, v0}, Lorg/apache/cordova/file/FileUtils;->access$1000(Lorg/apache/cordova/file/FileUtils;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;Z)Lorg/json/JSONObject;

    move-result-object p1

    .line 479
    iget-object v0, p0, Lorg/apache/cordova/file/FileUtils$18;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v0, p1}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONObject;)V

    goto :goto_1

    .line 481
    :cond_0
    iget-object v2, p0, Lorg/apache/cordova/file/FileUtils$18;->this$0:Lorg/apache/cordova/file/FileUtils;

    invoke-static {v2, v1}, Lorg/apache/cordova/file/FileUtils;->access$000(Lorg/apache/cordova/file/FileUtils;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    const-string v4, "nativeURL"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 482
    invoke-virtual {p1, v5}, Lorg/json/JSONArray;->isNull(I)Z

    move-result v4

    if-eqz v4, :cond_1

    move v4, v0

    goto :goto_0

    :cond_1
    invoke-virtual {p1, v5}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    const-string v6, "create"

    invoke-virtual {v4, v6, v0}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v4

    :goto_0
    if-eqz v4, :cond_2

    .line 484
    iget-object v6, p0, Lorg/apache/cordova/file/FileUtils$18;->this$0:Lorg/apache/cordova/file/FileUtils;

    const/4 v7, 0x3

    invoke-static {v6, v2, v7}, Lorg/apache/cordova/file/FileUtils;->access$100(Lorg/apache/cordova/file/FileUtils;Ljava/lang/String;I)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 485
    iget-object p1, p0, Lorg/apache/cordova/file/FileUtils$18;->this$0:Lorg/apache/cordova/file/FileUtils;

    iget-object v1, p0, Lorg/apache/cordova/file/FileUtils$18;->val$rawArgs:Ljava/lang/String;

    iget-object v2, p0, Lorg/apache/cordova/file/FileUtils$18;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-static {p1, v1, v0, v2}, Lorg/apache/cordova/file/FileUtils;->access$200(Lorg/apache/cordova/file/FileUtils;Ljava/lang/String;ILorg/apache/cordova/CallbackContext;)V

    goto :goto_1

    :cond_2
    if-nez v4, :cond_3

    .line 487
    iget-object v4, p0, Lorg/apache/cordova/file/FileUtils$18;->this$0:Lorg/apache/cordova/file/FileUtils;

    const/4 v6, 0x4

    invoke-static {v4, v2, v6}, Lorg/apache/cordova/file/FileUtils;->access$100(Lorg/apache/cordova/file/FileUtils;Ljava/lang/String;I)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 488
    iget-object p1, p0, Lorg/apache/cordova/file/FileUtils$18;->this$0:Lorg/apache/cordova/file/FileUtils;

    iget-object v1, p0, Lorg/apache/cordova/file/FileUtils$18;->val$rawArgs:Ljava/lang/String;

    iget-object v2, p0, Lorg/apache/cordova/file/FileUtils$18;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-static {p1, v1, v0, v2}, Lorg/apache/cordova/file/FileUtils;->access$900(Lorg/apache/cordova/file/FileUtils;Ljava/lang/String;ILorg/apache/cordova/CallbackContext;)V

    goto :goto_1

    .line 491
    :cond_3
    iget-object v2, p0, Lorg/apache/cordova/file/FileUtils$18;->this$0:Lorg/apache/cordova/file/FileUtils;

    invoke-virtual {p1, v5}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object p1

    invoke-static {v2, v1, v3, p1, v0}, Lorg/apache/cordova/file/FileUtils;->access$1000(Lorg/apache/cordova/file/FileUtils;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;Z)Lorg/json/JSONObject;

    move-result-object p1

    .line 492
    iget-object v0, p0, Lorg/apache/cordova/file/FileUtils$18;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v0, p1}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONObject;)V

    :goto_1
    return-void
.end method
