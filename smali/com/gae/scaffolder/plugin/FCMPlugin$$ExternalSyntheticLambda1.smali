.class public final synthetic Lcom/gae/scaffolder/plugin/FCMPlugin$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lorg/apache/cordova/CallbackContext;


# direct methods
.method public synthetic constructor <init>(Lorg/apache/cordova/CallbackContext;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/gae/scaffolder/plugin/FCMPlugin$$ExternalSyntheticLambda1;->f$0:Lorg/apache/cordova/CallbackContext;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 0
    iget-object v0, p0, Lcom/gae/scaffolder/plugin/FCMPlugin$$ExternalSyntheticLambda1;->f$0:Lorg/apache/cordova/CallbackContext;

    invoke-static {v0}, Lcom/gae/scaffolder/plugin/FCMPlugin;->lambda$processPluginAction$1(Lorg/apache/cordova/CallbackContext;)V

    return-void
.end method
