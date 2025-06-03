.class Lch/ti8m/phonegap/plugins/DocumentHandler$FileDownloaderAsyncTask;
.super Landroid/os/AsyncTask;
.source "DocumentHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lch/ti8m/phonegap/plugins/DocumentHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FileDownloaderAsyncTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/io/File;",
        ">;"
    }
.end annotation


# instance fields
.field private final callbackContext:Lorg/apache/cordova/CallbackContext;

.field private final fileName:Ljava/lang/String;

.field final synthetic this$0:Lch/ti8m/phonegap/plugins/DocumentHandler;

.field private final type:Ljava/lang/String;

.field private final url:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lch/ti8m/phonegap/plugins/DocumentHandler;Lorg/apache/cordova/CallbackContext;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 265
    iput-object p1, p0, Lch/ti8m/phonegap/plugins/DocumentHandler$FileDownloaderAsyncTask;->this$0:Lch/ti8m/phonegap/plugins/DocumentHandler;

    .line 266
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 267
    iput-object p2, p0, Lch/ti8m/phonegap/plugins/DocumentHandler$FileDownloaderAsyncTask;->callbackContext:Lorg/apache/cordova/CallbackContext;

    .line 268
    iput-object p3, p0, Lch/ti8m/phonegap/plugins/DocumentHandler$FileDownloaderAsyncTask;->url:Ljava/lang/String;

    .line 269
    iput-object p4, p0, Lch/ti8m/phonegap/plugins/DocumentHandler$FileDownloaderAsyncTask;->fileName:Ljava/lang/String;

    .line 270
    iput-object p5, p0, Lch/ti8m/phonegap/plugins/DocumentHandler$FileDownloaderAsyncTask;->type:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/io/File;
    .locals 3

    .line 275
    iget-object p1, p0, Lch/ti8m/phonegap/plugins/DocumentHandler$FileDownloaderAsyncTask;->url:Ljava/lang/String;

    const-string v0, "file://"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_0

    .line 276
    iget-object p1, p0, Lch/ti8m/phonegap/plugins/DocumentHandler$FileDownloaderAsyncTask;->this$0:Lch/ti8m/phonegap/plugins/DocumentHandler;

    iget-object v0, p0, Lch/ti8m/phonegap/plugins/DocumentHandler$FileDownloaderAsyncTask;->fileName:Ljava/lang/String;

    iget-object v1, p0, Lch/ti8m/phonegap/plugins/DocumentHandler$FileDownloaderAsyncTask;->url:Ljava/lang/String;

    iget-object v2, p0, Lch/ti8m/phonegap/plugins/DocumentHandler$FileDownloaderAsyncTask;->callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-static {p1, v0, v1, v2}, Lch/ti8m/phonegap/plugins/DocumentHandler;->access$000(Lch/ti8m/phonegap/plugins/DocumentHandler;Ljava/lang/String;Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)Ljava/io/File;

    move-result-object p1

    return-object p1

    .line 278
    :cond_0
    new-instance p1, Ljava/io/File;

    iget-object v1, p0, Lch/ti8m/phonegap/plugins/DocumentHandler$FileDownloaderAsyncTask;->url:Ljava/lang/String;

    const-string v2, ""

    invoke-virtual {v1, v0, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    return-object p1
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 257
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lch/ti8m/phonegap/plugins/DocumentHandler$FileDownloaderAsyncTask;->doInBackground([Ljava/lang/Void;)Ljava/io/File;

    move-result-object p1

    return-object p1
.end method

.method protected onPostExecute(Ljava/io/File;)V
    .locals 5

    if-nez p1, :cond_0

    return-void

    .line 290
    :cond_0
    iget-object v0, p0, Lch/ti8m/phonegap/plugins/DocumentHandler$FileDownloaderAsyncTask;->this$0:Lch/ti8m/phonegap/plugins/DocumentHandler;

    iget-object v0, v0, Lch/ti8m/phonegap/plugins/DocumentHandler;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroidx/appcompat/app/AppCompatActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 293
    iget-object v1, p0, Lch/ti8m/phonegap/plugins/DocumentHandler$FileDownloaderAsyncTask;->type:Ljava/lang/String;

    .line 294
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_1

    iget-object v1, p0, Lch/ti8m/phonegap/plugins/DocumentHandler$FileDownloaderAsyncTask;->url:Ljava/lang/String;

    invoke-static {v1}, Lch/ti8m/phonegap/plugins/DocumentHandler;->access$100(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    :cond_1
    const/4 v2, 0x1

    if-nez v1, :cond_2

    .line 296
    iget-object p1, p0, Lch/ti8m/phonegap/plugins/DocumentHandler$FileDownloaderAsyncTask;->callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {p1, v2}, Lorg/apache/cordova/CallbackContext;->error(I)V

    return-void

    .line 302
    :cond_2
    :try_start_0
    new-instance v3, Landroid/content/Intent;

    const-string v4, "android.intent.action.VIEW"

    invoke-direct {v3, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 303
    invoke-static {}, Lch/ti8m/phonegap/plugins/DocumentHandler;->access$200()Ljava/lang/String;

    move-result-object v4

    invoke-static {v0, v4, p1}, Landroidx/core/content/FileProvider;->getUriForFile(Landroid/content/Context;Ljava/lang/String;Ljava/io/File;)Landroid/net/Uri;

    move-result-object p1

    .line 304
    invoke-virtual {v3, p1, v1}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    const/high16 p1, 0x10000000

    .line 305
    invoke-virtual {v3, p1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 306
    invoke-virtual {v3, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 307
    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 308
    invoke-virtual {v0, v3}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 310
    iget-object p1, p0, Lch/ti8m/phonegap/plugins/DocumentHandler$FileDownloaderAsyncTask;->callbackContext:Lorg/apache/cordova/CallbackContext;

    iget-object v0, p0, Lch/ti8m/phonegap/plugins/DocumentHandler$FileDownloaderAsyncTask;->fileName:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lorg/apache/cordova/CallbackContext;->success(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 314
    invoke-virtual {p1}, Landroid/content/ActivityNotFoundException;->printStackTrace()V

    .line 315
    iget-object p1, p0, Lch/ti8m/phonegap/plugins/DocumentHandler$FileDownloaderAsyncTask;->callbackContext:Lorg/apache/cordova/CallbackContext;

    const/16 v0, 0x35

    invoke-virtual {p1, v0}, Lorg/apache/cordova/CallbackContext;->error(I)V

    :goto_0
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .line 257
    check-cast p1, Ljava/io/File;

    invoke-virtual {p0, p1}, Lch/ti8m/phonegap/plugins/DocumentHandler$FileDownloaderAsyncTask;->onPostExecute(Ljava/io/File;)V

    return-void
.end method
