.class public final synthetic Lorg/apache/cordova/PluginManager$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/BiConsumer;


# instance fields
.field public final synthetic f$0:Ljava/lang/String;

.field public final synthetic f$1:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/apache/cordova/PluginManager$$ExternalSyntheticLambda0;->f$0:Ljava/lang/String;

    iput-object p2, p0, Lorg/apache/cordova/PluginManager$$ExternalSyntheticLambda0;->f$1:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 2

    .line 0
    iget-object v0, p0, Lorg/apache/cordova/PluginManager$$ExternalSyntheticLambda0;->f$0:Ljava/lang/String;

    iget-object v1, p0, Lorg/apache/cordova/PluginManager$$ExternalSyntheticLambda0;->f$1:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    check-cast p2, Lorg/apache/cordova/CordovaPlugin;

    invoke-static {v0, v1, p1, p2}, Lorg/apache/cordova/PluginManager;->lambda$postMessage$0(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;Lorg/apache/cordova/CordovaPlugin;)V

    return-void
.end method
