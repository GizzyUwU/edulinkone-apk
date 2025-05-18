.class public final synthetic Lorg/apache/cordova/engine/SystemWebViewClient$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroidx/webkit/WebViewAssetLoader$PathHandler;


# instance fields
.field public final synthetic f$0:Lorg/apache/cordova/engine/SystemWebViewClient;

.field public final synthetic f$1:Lorg/apache/cordova/engine/SystemWebViewEngine;


# direct methods
.method public synthetic constructor <init>(Lorg/apache/cordova/engine/SystemWebViewClient;Lorg/apache/cordova/engine/SystemWebViewEngine;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/apache/cordova/engine/SystemWebViewClient$$ExternalSyntheticLambda0;->f$0:Lorg/apache/cordova/engine/SystemWebViewClient;

    iput-object p2, p0, Lorg/apache/cordova/engine/SystemWebViewClient$$ExternalSyntheticLambda0;->f$1:Lorg/apache/cordova/engine/SystemWebViewEngine;

    return-void
.end method


# virtual methods
.method public final handle(Ljava/lang/String;)Landroid/webkit/WebResourceResponse;
    .locals 2

    .line 0
    iget-object v0, p0, Lorg/apache/cordova/engine/SystemWebViewClient$$ExternalSyntheticLambda0;->f$0:Lorg/apache/cordova/engine/SystemWebViewClient;

    iget-object v1, p0, Lorg/apache/cordova/engine/SystemWebViewClient$$ExternalSyntheticLambda0;->f$1:Lorg/apache/cordova/engine/SystemWebViewEngine;

    invoke-virtual {v0, v1, p1}, Lorg/apache/cordova/engine/SystemWebViewClient;->lambda$new$0$org-apache-cordova-engine-SystemWebViewClient(Lorg/apache/cordova/engine/SystemWebViewEngine;Ljava/lang/String;)Landroid/webkit/WebResourceResponse;

    move-result-object p1

    return-object p1
.end method
