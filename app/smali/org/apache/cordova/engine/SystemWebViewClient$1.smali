.class Lorg/apache/cordova/engine/SystemWebViewClient$1;
.super Landroid/webkit/ServiceWorkerClient;
.source "SystemWebViewClient.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/cordova/engine/SystemWebViewClient;-><init>(Lorg/apache/cordova/engine/SystemWebViewEngine;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/cordova/engine/SystemWebViewClient;


# direct methods
.method constructor <init>(Lorg/apache/cordova/engine/SystemWebViewClient;)V
    .locals 0

    .line 126
    iput-object p1, p0, Lorg/apache/cordova/engine/SystemWebViewClient$1;->this$0:Lorg/apache/cordova/engine/SystemWebViewClient;

    invoke-direct {p0}, Landroid/webkit/ServiceWorkerClient;-><init>()V

    return-void
.end method


# virtual methods
.method public shouldInterceptRequest(Landroid/webkit/WebResourceRequest;)Landroid/webkit/WebResourceResponse;
    .locals 1

    .line 129
    iget-object v0, p0, Lorg/apache/cordova/engine/SystemWebViewClient$1;->this$0:Lorg/apache/cordova/engine/SystemWebViewClient;

    invoke-static {v0}, Lorg/apache/cordova/engine/SystemWebViewClient;->access$000(Lorg/apache/cordova/engine/SystemWebViewClient;)Landroidx/webkit/WebViewAssetLoader;

    move-result-object v0

    invoke-interface {p1}, Landroid/webkit/WebResourceRequest;->getUrl()Landroid/net/Uri;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroidx/webkit/WebViewAssetLoader;->shouldInterceptRequest(Landroid/net/Uri;)Landroid/webkit/WebResourceResponse;

    move-result-object p1

    return-object p1
.end method
