.class public Lorg/apache/cordova/CordovaInterfaceImpl;
.super Ljava/lang/Object;
.source "CordovaInterfaceImpl.java"

# interfaces
.implements Lorg/apache/cordova/CordovaInterface;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/cordova/CordovaInterfaceImpl$ActivityResultHolder;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "CordovaInterfaceImpl"


# instance fields
.field protected activity:Landroidx/appcompat/app/AppCompatActivity;

.field protected activityResultCallback:Lorg/apache/cordova/CordovaPlugin;

.field protected activityResultRequestCode:I

.field protected activityWasDestroyed:Z

.field protected initCallbackService:Ljava/lang/String;

.field protected permissionResultCallbacks:Lorg/apache/cordova/CallbackMap;

.field protected pluginManager:Lorg/apache/cordova/PluginManager;

.field protected savedPluginState:Landroid/os/Bundle;

.field protected savedResult:Lorg/apache/cordova/CordovaInterfaceImpl$ActivityResultHolder;

.field protected threadPool:Ljava/util/concurrent/ExecutorService;


# direct methods
.method public constructor <init>(Landroidx/appcompat/app/AppCompatActivity;)V
    .locals 1

    .line 56
    invoke-static {}, Ljava/util/concurrent/Executors;->newCachedThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lorg/apache/cordova/CordovaInterfaceImpl;-><init>(Landroidx/appcompat/app/AppCompatActivity;Ljava/util/concurrent/ExecutorService;)V

    return-void
.end method

.method public constructor <init>(Landroidx/appcompat/app/AppCompatActivity;Ljava/util/concurrent/ExecutorService;)V
    .locals 1

    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 52
    iput-boolean v0, p0, Lorg/apache/cordova/CordovaInterfaceImpl;->activityWasDestroyed:Z

    .line 60
    iput-object p1, p0, Lorg/apache/cordova/CordovaInterfaceImpl;->activity:Landroidx/appcompat/app/AppCompatActivity;

    .line 61
    iput-object p2, p0, Lorg/apache/cordova/CordovaInterfaceImpl;->threadPool:Ljava/util/concurrent/ExecutorService;

    .line 62
    new-instance p1, Lorg/apache/cordova/CallbackMap;

    invoke-direct {p1}, Lorg/apache/cordova/CallbackMap;-><init>()V

    iput-object p1, p0, Lorg/apache/cordova/CordovaInterfaceImpl;->permissionResultCallbacks:Lorg/apache/cordova/CallbackMap;

    return-void
.end method


# virtual methods
.method public getActivity()Landroidx/appcompat/app/AppCompatActivity;
    .locals 1

    .line 87
    iget-object v0, p0, Lorg/apache/cordova/CordovaInterfaceImpl;->activity:Landroidx/appcompat/app/AppCompatActivity;

    return-object v0
.end method

.method public getContext()Landroid/content/Context;
    .locals 1

    .line 92
    iget-object v0, p0, Lorg/apache/cordova/CordovaInterfaceImpl;->activity:Landroidx/appcompat/app/AppCompatActivity;

    return-object v0
.end method

.method public getThreadPool()Ljava/util/concurrent/ExecutorService;
    .locals 1

    .line 105
    iget-object v0, p0, Lorg/apache/cordova/CordovaInterfaceImpl;->threadPool:Ljava/util/concurrent/ExecutorService;

    return-object v0
.end method

.method public hasPermission(Ljava/lang/String;)Z
    .locals 1

    .line 243
    iget-object v0, p0, Lorg/apache/cordova/CordovaInterfaceImpl;->activity:Landroidx/appcompat/app/AppCompatActivity;

    invoke-virtual {v0, p1}, Landroidx/appcompat/app/AppCompatActivity;->checkSelfPermission(Ljava/lang/String;)I

    move-result p1

    if-nez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public onActivityResult(IILandroid/content/Intent;)Z
    .locals 5

    .line 141
    iget-object v0, p0, Lorg/apache/cordova/CordovaInterfaceImpl;->activityResultCallback:Lorg/apache/cordova/CordovaPlugin;

    if-nez v0, :cond_0

    .line 142
    iget-object v1, p0, Lorg/apache/cordova/CordovaInterfaceImpl;->initCallbackService:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 145
    new-instance v1, Lorg/apache/cordova/CordovaInterfaceImpl$ActivityResultHolder;

    invoke-direct {v1, p1, p2, p3}, Lorg/apache/cordova/CordovaInterfaceImpl$ActivityResultHolder;-><init>(IILandroid/content/Intent;)V

    iput-object v1, p0, Lorg/apache/cordova/CordovaInterfaceImpl;->savedResult:Lorg/apache/cordova/CordovaInterfaceImpl$ActivityResultHolder;

    .line 146
    iget-object v1, p0, Lorg/apache/cordova/CordovaInterfaceImpl;->pluginManager:Lorg/apache/cordova/PluginManager;

    if-eqz v1, :cond_0

    .line 147
    iget-object v0, p0, Lorg/apache/cordova/CordovaInterfaceImpl;->initCallbackService:Ljava/lang/String;

    invoke-virtual {v1, v0}, Lorg/apache/cordova/PluginManager;->getPlugin(Ljava/lang/String;)Lorg/apache/cordova/CordovaPlugin;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 149
    iget-object v1, p0, Lorg/apache/cordova/CordovaInterfaceImpl;->savedPluginState:Landroid/os/Bundle;

    invoke-virtual {v0}, Lorg/apache/cordova/CordovaPlugin;->getServiceName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v1

    new-instance v2, Lorg/apache/cordova/ResumeCallback;

    .line 150
    invoke-virtual {v0}, Lorg/apache/cordova/CordovaPlugin;->getServiceName()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/cordova/CordovaInterfaceImpl;->pluginManager:Lorg/apache/cordova/PluginManager;

    invoke-direct {v2, v3, v4}, Lorg/apache/cordova/ResumeCallback;-><init>(Ljava/lang/String;Lorg/apache/cordova/PluginManager;)V

    .line 149
    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/CordovaPlugin;->onRestoreStateForActivityResult(Landroid/os/Bundle;Lorg/apache/cordova/CallbackContext;)V

    :cond_0
    const/4 v1, 0x0

    .line 154
    iput-object v1, p0, Lorg/apache/cordova/CordovaInterfaceImpl;->activityResultCallback:Lorg/apache/cordova/CordovaPlugin;

    .line 156
    const-string v2, "CordovaInterfaceImpl"

    if-eqz v0, :cond_1

    .line 157
    const-string v3, "Sending activity result to plugin"

    invoke-static {v2, v3}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 158
    iput-object v1, p0, Lorg/apache/cordova/CordovaInterfaceImpl;->initCallbackService:Ljava/lang/String;

    .line 159
    iput-object v1, p0, Lorg/apache/cordova/CordovaInterfaceImpl;->savedResult:Lorg/apache/cordova/CordovaInterfaceImpl$ActivityResultHolder;

    .line 160
    invoke-virtual {v0, p1, p2, p3}, Lorg/apache/cordova/CordovaPlugin;->onActivityResult(IILandroid/content/Intent;)V

    const/4 p1, 0x1

    return p1

    .line 163
    :cond_1
    iget-object p1, p0, Lorg/apache/cordova/CordovaInterfaceImpl;->savedResult:Lorg/apache/cordova/CordovaInterfaceImpl$ActivityResultHolder;

    if-eqz p1, :cond_2

    const-string p1, " yet!"

    goto :goto_0

    :cond_2
    const-string p1, "."

    :goto_0
    const-string p2, "Got an activity result, but no plugin was registered to receive it"

    invoke-virtual {p2, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Lorg/apache/cordova/LOG;->w(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x0

    return p1
.end method

.method public onCordovaInit(Lorg/apache/cordova/PluginManager;)V
    .locals 4

    .line 113
    iput-object p1, p0, Lorg/apache/cordova/CordovaInterfaceImpl;->pluginManager:Lorg/apache/cordova/PluginManager;

    .line 114
    iget-object v0, p0, Lorg/apache/cordova/CordovaInterfaceImpl;->savedResult:Lorg/apache/cordova/CordovaInterfaceImpl$ActivityResultHolder;

    if-eqz v0, :cond_0

    .line 115
    invoke-static {v0}, Lorg/apache/cordova/CordovaInterfaceImpl$ActivityResultHolder;->access$000(Lorg/apache/cordova/CordovaInterfaceImpl$ActivityResultHolder;)I

    move-result p1

    iget-object v0, p0, Lorg/apache/cordova/CordovaInterfaceImpl;->savedResult:Lorg/apache/cordova/CordovaInterfaceImpl$ActivityResultHolder;

    invoke-static {v0}, Lorg/apache/cordova/CordovaInterfaceImpl$ActivityResultHolder;->access$100(Lorg/apache/cordova/CordovaInterfaceImpl$ActivityResultHolder;)I

    move-result v0

    iget-object v1, p0, Lorg/apache/cordova/CordovaInterfaceImpl;->savedResult:Lorg/apache/cordova/CordovaInterfaceImpl$ActivityResultHolder;

    invoke-static {v1}, Lorg/apache/cordova/CordovaInterfaceImpl$ActivityResultHolder;->access$200(Lorg/apache/cordova/CordovaInterfaceImpl$ActivityResultHolder;)Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {p0, p1, v0, v1}, Lorg/apache/cordova/CordovaInterfaceImpl;->onActivityResult(IILandroid/content/Intent;)Z

    goto :goto_1

    .line 116
    :cond_0
    iget-boolean v0, p0, Lorg/apache/cordova/CordovaInterfaceImpl;->activityWasDestroyed:Z

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    .line 119
    iput-boolean v0, p0, Lorg/apache/cordova/CordovaInterfaceImpl;->activityWasDestroyed:Z

    if-eqz p1, :cond_1

    .line 122
    const-string v0, "CoreAndroid"

    invoke-virtual {p1, v0}, Lorg/apache/cordova/PluginManager;->getPlugin(Ljava/lang/String;)Lorg/apache/cordova/CordovaPlugin;

    move-result-object p1

    check-cast p1, Lorg/apache/cordova/CoreAndroid;

    if-eqz p1, :cond_1

    .line 124
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 126
    :try_start_0
    const-string v1, "action"

    const-string v2, "resume"

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    .line 128
    const-string v2, "CordovaInterfaceImpl"

    const-string v3, "Failed to create event message"

    invoke-static {v2, v3, v1}, Lorg/apache/cordova/LOG;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 130
    :goto_0
    new-instance v1, Lorg/apache/cordova/PluginResult;

    sget-object v2, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v1, v2, v0}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Lorg/json/JSONObject;)V

    invoke-virtual {p1, v1}, Lorg/apache/cordova/CoreAndroid;->sendResumeEvent(Lorg/apache/cordova/PluginResult;)V

    :cond_1
    :goto_1
    return-void
.end method

.method public onMessage(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 97
    const-string p2, "exit"

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 98
    iget-object p1, p0, Lorg/apache/cordova/CordovaInterfaceImpl;->activity:Landroidx/appcompat/app/AppCompatActivity;

    invoke-virtual {p1}, Landroidx/appcompat/app/AppCompatActivity;->finish()V

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public onRequestPermissionResult(I[Ljava/lang/String;[I)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 220
    iget-object v0, p0, Lorg/apache/cordova/CordovaInterfaceImpl;->permissionResultCallbacks:Lorg/apache/cordova/CallbackMap;

    invoke-virtual {v0, p1}, Lorg/apache/cordova/CallbackMap;->getAndRemoveCallback(I)Landroid/util/Pair;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 222
    iget-object v0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v0, Lorg/apache/cordova/CordovaPlugin;

    iget-object p1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-virtual {v0, p1, p2, p3}, Lorg/apache/cordova/CordovaPlugin;->onRequestPermissionResult(I[Ljava/lang/String;[I)V

    :cond_0
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2

    .line 180
    iget-object v0, p0, Lorg/apache/cordova/CordovaInterfaceImpl;->activityResultCallback:Lorg/apache/cordova/CordovaPlugin;

    if-eqz v0, :cond_0

    .line 181
    invoke-virtual {v0}, Lorg/apache/cordova/CordovaPlugin;->getServiceName()Ljava/lang/String;

    move-result-object v0

    .line 182
    const-string v1, "callbackService"

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 184
    :cond_0
    iget-object v0, p0, Lorg/apache/cordova/CordovaInterfaceImpl;->pluginManager:Lorg/apache/cordova/PluginManager;

    if-eqz v0, :cond_1

    .line 185
    const-string v1, "plugin"

    invoke-virtual {v0}, Lorg/apache/cordova/PluginManager;->onSaveInstanceState()Landroid/os/Bundle;

    move-result-object v0

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    :cond_1
    return-void
.end method

.method public requestPermission(Lorg/apache/cordova/CordovaPlugin;ILjava/lang/String;)V
    .locals 0

    .line 229
    filled-new-array {p3}, [Ljava/lang/String;

    move-result-object p3

    .line 230
    invoke-virtual {p0, p1, p2, p3}, Lorg/apache/cordova/CordovaInterfaceImpl;->requestPermissions(Lorg/apache/cordova/CordovaPlugin;I[Ljava/lang/String;)V

    return-void
.end method

.method public requestPermissions(Lorg/apache/cordova/CordovaPlugin;I[Ljava/lang/String;)V
    .locals 1

    .line 236
    iget-object v0, p0, Lorg/apache/cordova/CordovaInterfaceImpl;->permissionResultCallbacks:Lorg/apache/cordova/CallbackMap;

    invoke-virtual {v0, p1, p2}, Lorg/apache/cordova/CallbackMap;->registerCallback(Lorg/apache/cordova/CordovaPlugin;I)I

    move-result p1

    .line 237
    invoke-virtual {p0}, Lorg/apache/cordova/CordovaInterfaceImpl;->getActivity()Landroidx/appcompat/app/AppCompatActivity;

    move-result-object p2

    invoke-virtual {p2, p3, p1}, Landroidx/appcompat/app/AppCompatActivity;->requestPermissions([Ljava/lang/String;I)V

    return-void
.end method

.method public restoreInstanceState(Landroid/os/Bundle;)V
    .locals 1

    .line 194
    const-string v0, "callbackService"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/cordova/CordovaInterfaceImpl;->initCallbackService:Ljava/lang/String;

    .line 195
    const-string v0, "plugin"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object p1

    iput-object p1, p0, Lorg/apache/cordova/CordovaInterfaceImpl;->savedPluginState:Landroid/os/Bundle;

    const/4 p1, 0x1

    .line 196
    iput-boolean p1, p0, Lorg/apache/cordova/CordovaInterfaceImpl;->activityWasDestroyed:Z

    return-void
.end method

.method public setActivityResultCallback(Lorg/apache/cordova/CordovaPlugin;)V
    .locals 4

    .line 79
    iget-object v0, p0, Lorg/apache/cordova/CordovaInterfaceImpl;->activityResultCallback:Lorg/apache/cordova/CordovaPlugin;

    if-eqz v0, :cond_0

    .line 80
    iget v1, p0, Lorg/apache/cordova/CordovaInterfaceImpl;->activityResultRequestCode:I

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Lorg/apache/cordova/CordovaPlugin;->onActivityResult(IILandroid/content/Intent;)V

    .line 82
    :cond_0
    iput-object p1, p0, Lorg/apache/cordova/CordovaInterfaceImpl;->activityResultCallback:Lorg/apache/cordova/CordovaPlugin;

    return-void
.end method

.method public setActivityResultRequestCode(I)V
    .locals 0

    .line 173
    iput p1, p0, Lorg/apache/cordova/CordovaInterfaceImpl;->activityResultRequestCode:I

    return-void
.end method

.method public startActivityForResult(Lorg/apache/cordova/CordovaPlugin;Landroid/content/Intent;I)V
    .locals 0

    .line 67
    invoke-virtual {p0, p1}, Lorg/apache/cordova/CordovaInterfaceImpl;->setActivityResultCallback(Lorg/apache/cordova/CordovaPlugin;)V

    .line 69
    :try_start_0
    iget-object p1, p0, Lorg/apache/cordova/CordovaInterfaceImpl;->activity:Landroidx/appcompat/app/AppCompatActivity;

    invoke-virtual {p1, p2, p3}, Landroidx/appcompat/app/AppCompatActivity;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    const/4 p2, 0x0

    .line 71
    iput-object p2, p0, Lorg/apache/cordova/CordovaInterfaceImpl;->activityResultCallback:Lorg/apache/cordova/CordovaPlugin;

    .line 72
    throw p1
.end method
