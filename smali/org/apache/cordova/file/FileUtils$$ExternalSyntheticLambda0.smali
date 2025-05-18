.class public final synthetic Lorg/apache/cordova/file/FileUtils$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroidx/webkit/WebViewAssetLoader$PathHandler;


# instance fields
.field public final synthetic f$0:Lorg/apache/cordova/file/FileUtils;


# direct methods
.method public synthetic constructor <init>(Lorg/apache/cordova/file/FileUtils;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/apache/cordova/file/FileUtils$$ExternalSyntheticLambda0;->f$0:Lorg/apache/cordova/file/FileUtils;

    return-void
.end method


# virtual methods
.method public final handle(Ljava/lang/String;)Landroid/webkit/WebResourceResponse;
    .locals 1

    .line 0
    iget-object v0, p0, Lorg/apache/cordova/file/FileUtils$$ExternalSyntheticLambda0;->f$0:Lorg/apache/cordova/file/FileUtils;

    invoke-virtual {v0, p1}, Lorg/apache/cordova/file/FileUtils;->lambda$getPathHandler$0$org-apache-cordova-file-FileUtils(Ljava/lang/String;)Landroid/webkit/WebResourceResponse;

    move-result-object p1

    return-object p1
.end method
