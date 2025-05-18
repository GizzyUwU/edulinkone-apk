.class Lorg/apache/cordova/CordovaWebViewImpl$2;
.super Ljava/lang/Object;
.source "CordovaWebViewImpl.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/cordova/CordovaWebViewImpl;->loadUrlIntoView(Ljava/lang/String;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/cordova/CordovaWebViewImpl;

.field final synthetic val$currentLoadUrlTimeout:I

.field final synthetic val$loadError:Ljava/lang/Runnable;

.field final synthetic val$loadUrlTimeoutValue:I


# direct methods
.method constructor <init>(Lorg/apache/cordova/CordovaWebViewImpl;IILjava/lang/Runnable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 171
    iput-object p1, p0, Lorg/apache/cordova/CordovaWebViewImpl$2;->this$0:Lorg/apache/cordova/CordovaWebViewImpl;

    iput p2, p0, Lorg/apache/cordova/CordovaWebViewImpl$2;->val$loadUrlTimeoutValue:I

    iput p3, p0, Lorg/apache/cordova/CordovaWebViewImpl$2;->val$currentLoadUrlTimeout:I

    iput-object p4, p0, Lorg/apache/cordova/CordovaWebViewImpl$2;->val$loadError:Ljava/lang/Runnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 175
    :try_start_0
    monitor-enter p0
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 176
    :try_start_1
    iget v0, p0, Lorg/apache/cordova/CordovaWebViewImpl$2;->val$loadUrlTimeoutValue:I

    int-to-long v0, v0

    invoke-virtual {p0, v0, v1}, Ljava/lang/Object;->wait(J)V

    .line 177
    monitor-exit p0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw v0
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0

    :catch_0
    move-exception v0

    .line 179
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    .line 183
    :goto_0
    iget-object v0, p0, Lorg/apache/cordova/CordovaWebViewImpl$2;->this$0:Lorg/apache/cordova/CordovaWebViewImpl;

    invoke-static {v0}, Lorg/apache/cordova/CordovaWebViewImpl;->access$100(Lorg/apache/cordova/CordovaWebViewImpl;)I

    move-result v0

    iget v1, p0, Lorg/apache/cordova/CordovaWebViewImpl$2;->val$currentLoadUrlTimeout:I

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lorg/apache/cordova/CordovaWebViewImpl$2;->this$0:Lorg/apache/cordova/CordovaWebViewImpl;

    invoke-static {v0}, Lorg/apache/cordova/CordovaWebViewImpl;->access$200(Lorg/apache/cordova/CordovaWebViewImpl;)Lorg/apache/cordova/CordovaInterface;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroidx/appcompat/app/AppCompatActivity;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 184
    iget-object v0, p0, Lorg/apache/cordova/CordovaWebViewImpl$2;->this$0:Lorg/apache/cordova/CordovaWebViewImpl;

    invoke-static {v0}, Lorg/apache/cordova/CordovaWebViewImpl;->access$200(Lorg/apache/cordova/CordovaWebViewImpl;)Lorg/apache/cordova/CordovaInterface;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroidx/appcompat/app/AppCompatActivity;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/cordova/CordovaWebViewImpl$2;->val$loadError:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroidx/appcompat/app/AppCompatActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_1

    .line 185
    :cond_0
    iget-object v0, p0, Lorg/apache/cordova/CordovaWebViewImpl$2;->this$0:Lorg/apache/cordova/CordovaWebViewImpl;

    invoke-static {v0}, Lorg/apache/cordova/CordovaWebViewImpl;->access$200(Lorg/apache/cordova/CordovaWebViewImpl;)Lorg/apache/cordova/CordovaInterface;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroidx/appcompat/app/AppCompatActivity;

    move-result-object v0

    if-nez v0, :cond_1

    .line 186
    const-string v0, "CordovaWebViewImpl"

    const-string v1, "Cordova activity does not exist."

    invoke-static {v0, v1}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    :goto_1
    return-void
.end method
