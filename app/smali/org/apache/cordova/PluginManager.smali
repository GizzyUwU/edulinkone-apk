.class public Lorg/apache/cordova/PluginManager;
.super Ljava/lang/Object;
.source "PluginManager.java"


# static fields
.field private static DEFAULT_HOSTNAME:Ljava/lang/String; = "localhost"

.field private static SCHEME_HTTPS:Ljava/lang/String; = "https"

.field private static final SLOW_EXEC_WARNING_THRESHOLD:I

.field private static TAG:Ljava/lang/String; = "PluginManager"


# instance fields
.field private final app:Lorg/apache/cordova/CordovaWebView;

.field private final ctx:Lorg/apache/cordova/CordovaInterface;

.field private final entryMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lorg/apache/cordova/PluginEntry;",
            ">;"
        }
    .end annotation
.end field

.field private isInitialized:Z

.field private permissionRequester:Lorg/apache/cordova/CordovaPlugin;

.field private final pluginMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lorg/apache/cordova/CordovaPlugin;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 52
    invoke-static {}, Landroid/os/Debug;->isDebuggerConnected()Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 v0, 0x3c

    goto :goto_0

    :cond_0
    const/16 v0, 0x10

    :goto_0
    sput v0, Lorg/apache/cordova/PluginManager;->SLOW_EXEC_WARNING_THRESHOLD:I

    return-void
.end method

.method public constructor <init>(Lorg/apache/cordova/CordovaWebView;Lorg/apache/cordova/CordovaInterface;Ljava/util/Collection;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/cordova/CordovaWebView;",
            "Lorg/apache/cordova/CordovaInterface;",
            "Ljava/util/Collection<",
            "Lorg/apache/cordova/PluginEntry;",
            ">;)V"
        }
    .end annotation

    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/cordova/PluginManager;->pluginMap:Ljava/util/Map;

    .line 56
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/cordova/PluginManager;->entryMap:Ljava/util/Map;

    .line 65
    iput-object p2, p0, Lorg/apache/cordova/PluginManager;->ctx:Lorg/apache/cordova/CordovaInterface;

    .line 66
    iput-object p1, p0, Lorg/apache/cordova/PluginManager;->app:Lorg/apache/cordova/CordovaWebView;

    .line 67
    invoke-virtual {p0, p3}, Lorg/apache/cordova/PluginManager;->setPluginEntries(Ljava/util/Collection;)V

    return-void
.end method

.method private getLaunchUrlPrefix()Ljava/lang/String;
    .locals 4

    .line 386
    iget-object v0, p0, Lorg/apache/cordova/PluginManager;->app:Lorg/apache/cordova/CordovaWebView;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaWebView;->getPreferences()Lorg/apache/cordova/CordovaPreferences;

    move-result-object v0

    const-string v1, "AndroidInsecureFileModeEnabled"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/CordovaPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_0

    .line 387
    iget-object v0, p0, Lorg/apache/cordova/PluginManager;->app:Lorg/apache/cordova/CordovaWebView;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaWebView;->getPreferences()Lorg/apache/cordova/CordovaPreferences;

    move-result-object v0

    const-string v1, "scheme"

    sget-object v2, Lorg/apache/cordova/PluginManager;->SCHEME_HTTPS:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/CordovaPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    .line 388
    iget-object v1, p0, Lorg/apache/cordova/PluginManager;->app:Lorg/apache/cordova/CordovaWebView;

    invoke-interface {v1}, Lorg/apache/cordova/CordovaWebView;->getPreferences()Lorg/apache/cordova/CordovaPreferences;

    move-result-object v1

    const-string v2, "hostname"

    sget-object v3, Lorg/apache/cordova/PluginManager;->DEFAULT_HOSTNAME:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Lorg/apache/cordova/CordovaPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    .line 389
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "://"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x2f

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 392
    :cond_0
    const-string v0, "file://"

    return-object v0
.end method

.method private instantiatePlugin(Ljava/lang/String;)Lorg/apache/cordova/CordovaPlugin;
    .locals 4

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    .line 565
    :try_start_0
    const-string v1, ""

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 566
    invoke-static {p1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    goto :goto_0

    :catch_0
    move-exception v1

    goto :goto_2

    :cond_0
    move-object v1, v0

    :goto_0
    if-eqz v1, :cond_1

    const/4 v2, 0x1

    goto :goto_1

    :cond_1
    const/4 v2, 0x0

    .line 568
    :goto_1
    const-class v3, Lorg/apache/cordova/CordovaPlugin;

    invoke-virtual {v3, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v3

    and-int/2addr v2, v3

    if-eqz v2, :cond_2

    .line 569
    invoke-virtual {v1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/cordova/CordovaPlugin;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, v1

    goto :goto_3

    .line 572
    :goto_2
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 573
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Error adding plugin "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v2, "."

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    :cond_2
    :goto_3
    return-object v0
.end method

.method static synthetic lambda$postMessage$0(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;Lorg/apache/cordova/CordovaPlugin;)V
    .locals 0

    if-eqz p3, :cond_0

    .line 357
    invoke-virtual {p3, p0, p1}, Lorg/apache/cordova/CordovaPlugin;->onMessage(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return-void
.end method

.method private startupPlugins()V
    .locals 6

    .line 105
    iget-object v0, p0, Lorg/apache/cordova/PluginManager;->entryMap:Ljava/util/Map;

    monitor-enter v0

    .line 106
    :try_start_0
    iget-object v1, p0, Lorg/apache/cordova/PluginManager;->entryMap:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/cordova/PluginEntry;

    .line 109
    iget-boolean v3, v2, Lorg/apache/cordova/PluginEntry;->onload:Z

    if-eqz v3, :cond_0

    .line 110
    iget-object v2, v2, Lorg/apache/cordova/PluginEntry;->service:Ljava/lang/String;

    invoke-virtual {p0, v2}, Lorg/apache/cordova/PluginManager;->getPlugin(Ljava/lang/String;)Lorg/apache/cordova/CordovaPlugin;

    goto :goto_0

    .line 113
    :cond_0
    sget-object v3, Lorg/apache/cordova/PluginManager;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "startupPlugins: put - "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, v2, Lorg/apache/cordova/PluginEntry;->service:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 114
    iget-object v3, p0, Lorg/apache/cordova/PluginManager;->pluginMap:Ljava/util/Map;

    iget-object v2, v2, Lorg/apache/cordova/PluginEntry;->service:Ljava/lang/String;

    const/4 v4, 0x0

    invoke-interface {v3, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 117
    :cond_1
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method


# virtual methods
.method public addService(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    .line 202
    invoke-virtual {p0, p1, p2, v0}, Lorg/apache/cordova/PluginManager;->addService(Ljava/lang/String;Ljava/lang/String;Z)V

    return-void
.end method

.method public addService(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 1

    .line 213
    new-instance v0, Lorg/apache/cordova/PluginEntry;

    invoke-direct {v0, p1, p2, p3}, Lorg/apache/cordova/PluginEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 214
    invoke-virtual {p0, v0}, Lorg/apache/cordova/PluginManager;->addService(Lorg/apache/cordova/PluginEntry;)V

    return-void
.end method

.method public addService(Lorg/apache/cordova/PluginEntry;)V
    .locals 5

    .line 224
    iget-object v0, p0, Lorg/apache/cordova/PluginManager;->entryMap:Ljava/util/Map;

    iget-object v1, p1, Lorg/apache/cordova/PluginEntry;->service:Ljava/lang/String;

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 225
    iget-object v0, p1, Lorg/apache/cordova/PluginEntry;->plugin:Lorg/apache/cordova/CordovaPlugin;

    if-eqz v0, :cond_0

    .line 226
    iget-object v0, p1, Lorg/apache/cordova/PluginEntry;->plugin:Lorg/apache/cordova/CordovaPlugin;

    iget-object v1, p1, Lorg/apache/cordova/PluginEntry;->service:Ljava/lang/String;

    iget-object v2, p0, Lorg/apache/cordova/PluginManager;->ctx:Lorg/apache/cordova/CordovaInterface;

    iget-object v3, p0, Lorg/apache/cordova/PluginManager;->app:Lorg/apache/cordova/CordovaWebView;

    invoke-interface {v3}, Lorg/apache/cordova/CordovaWebView;->getPreferences()Lorg/apache/cordova/CordovaPreferences;

    move-result-object v4

    invoke-virtual {v0, v1, v2, v3, v4}, Lorg/apache/cordova/CordovaPlugin;->privateInitialize(Ljava/lang/String;Lorg/apache/cordova/CordovaInterface;Lorg/apache/cordova/CordovaWebView;Lorg/apache/cordova/CordovaPreferences;)V

    .line 227
    sget-object v0, Lorg/apache/cordova/PluginManager;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "addService: put - "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p1, Lorg/apache/cordova/PluginEntry;->service:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 228
    iget-object v0, p0, Lorg/apache/cordova/PluginManager;->pluginMap:Ljava/util/Map;

    iget-object v1, p1, Lorg/apache/cordova/PluginEntry;->service:Ljava/lang/String;

    iget-object p1, p1, Lorg/apache/cordova/PluginEntry;->plugin:Lorg/apache/cordova/CordovaPlugin;

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return-void
.end method

.method public exec(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 7

    const-string v0, "THREAD WARNING: exec() call to "

    .line 138
    invoke-virtual {p0, p1}, Lorg/apache/cordova/PluginManager;->getPlugin(Ljava/lang/String;)Lorg/apache/cordova/CordovaPlugin;

    move-result-object v1

    if-nez v1, :cond_0

    .line 140
    sget-object p2, Lorg/apache/cordova/PluginManager;->TAG:Ljava/lang/String;

    new-instance p4, Ljava/lang/StringBuilder;

    const-string v0, "exec() call to unknown plugin: "

    invoke-direct {p4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 141
    new-instance p1, Lorg/apache/cordova/PluginResult;

    sget-object p2, Lorg/apache/cordova/PluginResult$Status;->CLASS_NOT_FOUND_EXCEPTION:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {p1, p2}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .line 142
    iget-object p2, p0, Lorg/apache/cordova/PluginManager;->app:Lorg/apache/cordova/CordovaWebView;

    invoke-interface {p2, p1, p3}, Lorg/apache/cordova/CordovaWebView;->sendPluginResult(Lorg/apache/cordova/PluginResult;Ljava/lang/String;)V

    return-void

    .line 145
    :cond_0
    new-instance v2, Lorg/apache/cordova/CallbackContext;

    iget-object v3, p0, Lorg/apache/cordova/PluginManager;->app:Lorg/apache/cordova/CordovaWebView;

    invoke-direct {v2, p3, v3}, Lorg/apache/cordova/CallbackContext;-><init>(Ljava/lang/String;Lorg/apache/cordova/CordovaWebView;)V

    .line 147
    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    .line 148
    invoke-virtual {v1, p2, p4, v2}, Lorg/apache/cordova/CordovaPlugin;->execute(Ljava/lang/String;Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)Z

    move-result p3

    .line 149
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    sub-long/2addr v5, v3

    .line 151
    sget p4, Lorg/apache/cordova/PluginManager;->SLOW_EXEC_WARNING_THRESHOLD:I

    int-to-long v3, p4

    cmp-long p4, v5, v3

    if-lez p4, :cond_1

    .line 152
    sget-object p4, Lorg/apache/cordova/PluginManager;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, "."

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " blocked the main thread for "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, "ms. Plugin should use CordovaInterface.getThreadPool()."

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p4, p1}, Lorg/apache/cordova/LOG;->w(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    if-nez p3, :cond_2

    .line 155
    new-instance p1, Lorg/apache/cordova/PluginResult;

    sget-object p2, Lorg/apache/cordova/PluginResult$Status;->INVALID_ACTION:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {p1, p2}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .line 156
    invoke-virtual {v2, p1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 162
    sget-object p2, Lorg/apache/cordova/PluginManager;->TAG:Ljava/lang/String;

    const-string p3, "Uncaught exception from plugin"

    invoke-static {p2, p3, p1}, Lorg/apache/cordova/LOG;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 163
    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    goto :goto_0

    .line 159
    :catch_1
    new-instance p1, Lorg/apache/cordova/PluginResult;

    sget-object p2, Lorg/apache/cordova/PluginResult$Status;->JSON_EXCEPTION:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {p1, p2}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .line 160
    invoke-virtual {v2, p1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    :cond_2
    :goto_0
    return-void
.end method

.method public getPlugin(Ljava/lang/String;)Lorg/apache/cordova/CordovaPlugin;
    .locals 4

    .line 176
    iget-object v0, p0, Lorg/apache/cordova/PluginManager;->pluginMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/CordovaPlugin;

    if-nez v0, :cond_2

    .line 178
    iget-object v0, p0, Lorg/apache/cordova/PluginManager;->entryMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/PluginEntry;

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 182
    :cond_0
    iget-object v1, v0, Lorg/apache/cordova/PluginEntry;->plugin:Lorg/apache/cordova/CordovaPlugin;

    if-eqz v1, :cond_1

    .line 183
    iget-object v0, v0, Lorg/apache/cordova/PluginEntry;->plugin:Lorg/apache/cordova/CordovaPlugin;

    goto :goto_0

    .line 185
    :cond_1
    iget-object v0, v0, Lorg/apache/cordova/PluginEntry;->pluginClass:Ljava/lang/String;

    invoke-direct {p0, v0}, Lorg/apache/cordova/PluginManager;->instantiatePlugin(Ljava/lang/String;)Lorg/apache/cordova/CordovaPlugin;

    move-result-object v0

    .line 187
    :goto_0
    iget-object v1, p0, Lorg/apache/cordova/PluginManager;->ctx:Lorg/apache/cordova/CordovaInterface;

    iget-object v2, p0, Lorg/apache/cordova/PluginManager;->app:Lorg/apache/cordova/CordovaWebView;

    invoke-interface {v2}, Lorg/apache/cordova/CordovaWebView;->getPreferences()Lorg/apache/cordova/CordovaPreferences;

    move-result-object v3

    invoke-virtual {v0, p1, v1, v2, v3}, Lorg/apache/cordova/CordovaPlugin;->privateInitialize(Ljava/lang/String;Lorg/apache/cordova/CordovaInterface;Lorg/apache/cordova/CordovaWebView;Lorg/apache/cordova/CordovaPreferences;)V

    .line 188
    sget-object v1, Lorg/apache/cordova/PluginManager;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "getPlugin - put: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 189
    iget-object v1, p0, Lorg/apache/cordova/PluginManager;->pluginMap:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_2
    return-object v0
.end method

.method public getPluginEntries()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Lorg/apache/cordova/PluginEntry;",
            ">;"
        }
    .end annotation

    .line 71
    iget-object v0, p0, Lorg/apache/cordova/PluginManager;->entryMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method public getPluginPathHandlers()Ljava/util/ArrayList;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lorg/apache/cordova/CordovaPluginPathHandler;",
            ">;"
        }
    .end annotation

    .line 614
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 615
    iget-object v1, p0, Lorg/apache/cordova/PluginManager;->pluginMap:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/cordova/CordovaPlugin;

    if-eqz v2, :cond_0

    .line 616
    invoke-virtual {v2}, Lorg/apache/cordova/CordovaPlugin;->getPathHandler()Lorg/apache/cordova/CordovaPluginPathHandler;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 617
    invoke-virtual {v2}, Lorg/apache/cordova/CordovaPlugin;->getPathHandler()Lorg/apache/cordova/CordovaPluginPathHandler;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method public init()V
    .locals 2

    .line 93
    sget-object v0, Lorg/apache/cordova/PluginManager;->TAG:Ljava/lang/String;

    const-string v1, "init()"

    invoke-static {v0, v1}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x1

    .line 94
    iput-boolean v0, p0, Lorg/apache/cordova/PluginManager;->isInitialized:Z

    const/4 v0, 0x0

    .line 95
    invoke-virtual {p0, v0}, Lorg/apache/cordova/PluginManager;->onPause(Z)V

    .line 96
    invoke-virtual {p0}, Lorg/apache/cordova/PluginManager;->onDestroy()V

    .line 97
    iget-object v0, p0, Lorg/apache/cordova/PluginManager;->pluginMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 98
    invoke-direct {p0}, Lorg/apache/cordova/PluginManager;->startupPlugins()V

    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 3

    .line 584
    iget-object v0, p0, Lorg/apache/cordova/PluginManager;->pluginMap:Ljava/util/Map;

    monitor-enter v0

    .line 585
    :try_start_0
    iget-object v1, p0, Lorg/apache/cordova/PluginManager;->pluginMap:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/cordova/CordovaPlugin;

    if-eqz v2, :cond_0

    .line 587
    invoke-virtual {v2, p1}, Lorg/apache/cordova/CordovaPlugin;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    goto :goto_0

    .line 590
    :cond_1
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public onDestroy()V
    .locals 3

    .line 336
    iget-object v0, p0, Lorg/apache/cordova/PluginManager;->pluginMap:Ljava/util/Map;

    monitor-enter v0

    .line 337
    :try_start_0
    iget-object v1, p0, Lorg/apache/cordova/PluginManager;->pluginMap:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/cordova/CordovaPlugin;

    if-eqz v2, :cond_0

    .line 339
    invoke-virtual {v2}, Lorg/apache/cordova/CordovaPlugin;->onDestroy()V

    goto :goto_0

    .line 342
    :cond_1
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public onNewIntent(Landroid/content/Intent;)V
    .locals 3

    .line 368
    iget-object v0, p0, Lorg/apache/cordova/PluginManager;->pluginMap:Ljava/util/Map;

    monitor-enter v0

    .line 369
    :try_start_0
    iget-object v1, p0, Lorg/apache/cordova/PluginManager;->pluginMap:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/cordova/CordovaPlugin;

    if-eqz v2, :cond_0

    .line 371
    invoke-virtual {v2, p1}, Lorg/apache/cordova/CordovaPlugin;->onNewIntent(Landroid/content/Intent;)V

    goto :goto_0

    .line 374
    :cond_1
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public onOverrideUrlLoading(Ljava/lang/String;)Z
    .locals 4

    .line 520
    iget-object v0, p0, Lorg/apache/cordova/PluginManager;->entryMap:Ljava/util/Map;

    monitor-enter v0

    .line 521
    :try_start_0
    iget-object v1, p0, Lorg/apache/cordova/PluginManager;->entryMap:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/cordova/PluginEntry;

    .line 522
    iget-object v3, p0, Lorg/apache/cordova/PluginManager;->pluginMap:Ljava/util/Map;

    iget-object v2, v2, Lorg/apache/cordova/PluginEntry;->service:Ljava/lang/String;

    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/cordova/CordovaPlugin;

    if-eqz v2, :cond_0

    .line 523
    invoke-virtual {v2, p1}, Lorg/apache/cordova/CordovaPlugin;->onOverrideUrlLoading(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 524
    monitor-exit v0

    const/4 p1, 0x1

    return p1

    .line 527
    :cond_1
    monitor-exit v0

    const/4 p1, 0x0

    return p1

    :catchall_0
    move-exception p1

    .line 528
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public onPause(Z)V
    .locals 3

    .line 238
    iget-object v0, p0, Lorg/apache/cordova/PluginManager;->pluginMap:Ljava/util/Map;

    monitor-enter v0

    .line 239
    :try_start_0
    iget-object v1, p0, Lorg/apache/cordova/PluginManager;->pluginMap:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/cordova/CordovaPlugin;

    if-eqz v2, :cond_0

    .line 241
    invoke-virtual {v2, p1}, Lorg/apache/cordova/CordovaPlugin;->onPause(Z)V

    goto :goto_0

    .line 244
    :cond_1
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public onReceivedClientCertRequest(Lorg/apache/cordova/CordovaWebView;Lorg/apache/cordova/ICordovaClientCertRequest;)Z
    .locals 3

    .line 281
    iget-object p1, p0, Lorg/apache/cordova/PluginManager;->pluginMap:Ljava/util/Map;

    monitor-enter p1

    .line 282
    :try_start_0
    iget-object v0, p0, Lorg/apache/cordova/PluginManager;->pluginMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/cordova/CordovaPlugin;

    if-eqz v1, :cond_0

    .line 283
    iget-object v2, p0, Lorg/apache/cordova/PluginManager;->app:Lorg/apache/cordova/CordovaWebView;

    invoke-virtual {v1, v2, p2}, Lorg/apache/cordova/CordovaPlugin;->onReceivedClientCertRequest(Lorg/apache/cordova/CordovaWebView;Lorg/apache/cordova/ICordovaClientCertRequest;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 284
    monitor-exit p1

    const/4 p1, 0x1

    return p1

    .line 287
    :cond_1
    monitor-exit p1

    const/4 p1, 0x0

    return p1

    :catchall_0
    move-exception p2

    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p2
.end method

.method public onReceivedHttpAuthRequest(Lorg/apache/cordova/CordovaWebView;Lorg/apache/cordova/ICordovaHttpAuthHandler;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 3

    .line 260
    iget-object p1, p0, Lorg/apache/cordova/PluginManager;->pluginMap:Ljava/util/Map;

    monitor-enter p1

    .line 261
    :try_start_0
    iget-object v0, p0, Lorg/apache/cordova/PluginManager;->pluginMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/cordova/CordovaPlugin;

    if-eqz v1, :cond_0

    .line 262
    iget-object v2, p0, Lorg/apache/cordova/PluginManager;->app:Lorg/apache/cordova/CordovaWebView;

    invoke-virtual {v1, v2, p2, p3, p4}, Lorg/apache/cordova/CordovaPlugin;->onReceivedHttpAuthRequest(Lorg/apache/cordova/CordovaWebView;Lorg/apache/cordova/ICordovaHttpAuthHandler;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 263
    monitor-exit p1

    const/4 p1, 0x1

    return p1

    .line 266
    :cond_1
    monitor-exit p1

    const/4 p1, 0x0

    return p1

    :catchall_0
    move-exception p2

    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p2
.end method

.method public onRenderProcessGone(Landroid/webkit/WebView;Landroid/webkit/RenderProcessGoneDetail;)Z
    .locals 5

    .line 634
    iget-object v0, p0, Lorg/apache/cordova/PluginManager;->entryMap:Ljava/util/Map;

    monitor-enter v0

    .line 635
    :try_start_0
    iget-object v1, p0, Lorg/apache/cordova/PluginManager;->entryMap:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    const/4 v2, 0x0

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/cordova/PluginEntry;

    .line 636
    iget-object v4, p0, Lorg/apache/cordova/PluginManager;->pluginMap:Ljava/util/Map;

    iget-object v3, v3, Lorg/apache/cordova/PluginEntry;->service:Ljava/lang/String;

    invoke-interface {v4, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/cordova/CordovaPlugin;

    if-eqz v3, :cond_0

    .line 638
    invoke-virtual {v3, p1, p2}, Lorg/apache/cordova/CordovaPlugin;->onRenderProcessGone(Landroid/webkit/WebView;Landroid/webkit/RenderProcessGoneDetail;)Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    .line 643
    :cond_1
    monitor-exit v0

    return v2

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public onReset()V
    .locals 3

    .line 535
    iget-object v0, p0, Lorg/apache/cordova/PluginManager;->pluginMap:Ljava/util/Map;

    monitor-enter v0

    .line 536
    :try_start_0
    iget-object v1, p0, Lorg/apache/cordova/PluginManager;->pluginMap:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/cordova/CordovaPlugin;

    if-eqz v2, :cond_0

    .line 538
    invoke-virtual {v2}, Lorg/apache/cordova/CordovaPlugin;->onReset()V

    goto :goto_0

    .line 541
    :cond_1
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public onResume(Z)V
    .locals 3

    .line 297
    iget-object v0, p0, Lorg/apache/cordova/PluginManager;->pluginMap:Ljava/util/Map;

    monitor-enter v0

    .line 298
    :try_start_0
    iget-object v1, p0, Lorg/apache/cordova/PluginManager;->pluginMap:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/cordova/CordovaPlugin;

    if-eqz v2, :cond_0

    .line 300
    invoke-virtual {v2, p1}, Lorg/apache/cordova/CordovaPlugin;->onResume(Z)V

    goto :goto_0

    .line 303
    :cond_1
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public onSaveInstanceState()Landroid/os/Bundle;
    .locals 5

    .line 594
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 595
    iget-object v1, p0, Lorg/apache/cordova/PluginManager;->pluginMap:Ljava/util/Map;

    monitor-enter v1

    .line 596
    :try_start_0
    iget-object v2, p0, Lorg/apache/cordova/PluginManager;->pluginMap:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/cordova/CordovaPlugin;

    if-eqz v3, :cond_0

    .line 598
    invoke-virtual {v3}, Lorg/apache/cordova/CordovaPlugin;->onSaveInstanceState()Landroid/os/Bundle;

    move-result-object v4

    if-eqz v4, :cond_0

    .line 600
    invoke-virtual {v3}, Lorg/apache/cordova/CordovaPlugin;->getServiceName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3, v4}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    goto :goto_0

    .line 604
    :cond_1
    monitor-exit v1

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public onStart()V
    .locals 3

    .line 310
    iget-object v0, p0, Lorg/apache/cordova/PluginManager;->pluginMap:Ljava/util/Map;

    monitor-enter v0

    .line 311
    :try_start_0
    iget-object v1, p0, Lorg/apache/cordova/PluginManager;->pluginMap:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/cordova/CordovaPlugin;

    if-eqz v2, :cond_0

    .line 313
    invoke-virtual {v2}, Lorg/apache/cordova/CordovaPlugin;->onStart()V

    goto :goto_0

    .line 316
    :cond_1
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public onStop()V
    .locals 3

    .line 323
    iget-object v0, p0, Lorg/apache/cordova/PluginManager;->pluginMap:Ljava/util/Map;

    monitor-enter v0

    .line 324
    :try_start_0
    iget-object v1, p0, Lorg/apache/cordova/PluginManager;->pluginMap:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/cordova/CordovaPlugin;

    if-eqz v2, :cond_0

    .line 326
    invoke-virtual {v2}, Lorg/apache/cordova/CordovaPlugin;->onStop()V

    goto :goto_0

    .line 329
    :cond_1
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public postMessage(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    .line 353
    sget-object v0, Lorg/apache/cordova/PluginManager;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "postMessage: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 354
    iget-object v0, p0, Lorg/apache/cordova/PluginManager;->pluginMap:Ljava/util/Map;

    monitor-enter v0

    .line 355
    :try_start_0
    iget-object v1, p0, Lorg/apache/cordova/PluginManager;->pluginMap:Ljava/util/Map;

    new-instance v2, Lorg/apache/cordova/PluginManager$$ExternalSyntheticLambda0;

    invoke-direct {v2, p1, p2}, Lorg/apache/cordova/PluginManager$$ExternalSyntheticLambda0;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-interface {v1, v2}, Ljava/util/Map;->forEach(Ljava/util/function/BiConsumer;)V

    .line 360
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 361
    iget-object v0, p0, Lorg/apache/cordova/PluginManager;->ctx:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v0, p1, p2}, Lorg/apache/cordova/CordovaInterface;->onMessage(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    :catchall_0
    move-exception p1

    .line 360
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method remapUri(Landroid/net/Uri;)Landroid/net/Uri;
    .locals 3

    .line 545
    iget-object v0, p0, Lorg/apache/cordova/PluginManager;->pluginMap:Ljava/util/Map;

    monitor-enter v0

    .line 546
    :try_start_0
    iget-object v1, p0, Lorg/apache/cordova/PluginManager;->pluginMap:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/cordova/CordovaPlugin;

    if-eqz v2, :cond_0

    .line 548
    invoke-virtual {v2, p1}, Lorg/apache/cordova/CordovaPlugin;->remapUri(Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 550
    monitor-exit v0

    return-object v2

    .line 554
    :cond_1
    monitor-exit v0

    const/4 p1, 0x0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public setPluginEntries(Ljava/util/Collection;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Lorg/apache/cordova/PluginEntry;",
            ">;)V"
        }
    .end annotation

    .line 75
    iget-boolean v0, p0, Lorg/apache/cordova/PluginManager;->isInitialized:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    .line 76
    invoke-virtual {p0, v0}, Lorg/apache/cordova/PluginManager;->onPause(Z)V

    .line 77
    invoke-virtual {p0}, Lorg/apache/cordova/PluginManager;->onDestroy()V

    .line 78
    iget-object v0, p0, Lorg/apache/cordova/PluginManager;->pluginMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 79
    iget-object v0, p0, Lorg/apache/cordova/PluginManager;->entryMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 81
    :cond_0
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/PluginEntry;

    .line 82
    invoke-virtual {p0, v0}, Lorg/apache/cordova/PluginManager;->addService(Lorg/apache/cordova/PluginEntry;)V

    goto :goto_0

    .line 84
    :cond_1
    iget-boolean p1, p0, Lorg/apache/cordova/PluginManager;->isInitialized:Z

    if-eqz p1, :cond_2

    .line 85
    invoke-direct {p0}, Lorg/apache/cordova/PluginManager;->startupPlugins()V

    :cond_2
    return-void
.end method

.method public shouldAllowBridgeAccess(Ljava/lang/String;)Z
    .locals 4

    .line 468
    iget-object v0, p0, Lorg/apache/cordova/PluginManager;->entryMap:Ljava/util/Map;

    monitor-enter v0

    .line 469
    :try_start_0
    iget-object v1, p0, Lorg/apache/cordova/PluginManager;->entryMap:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/cordova/PluginEntry;

    .line 470
    iget-object v3, p0, Lorg/apache/cordova/PluginManager;->pluginMap:Ljava/util/Map;

    iget-object v2, v2, Lorg/apache/cordova/PluginEntry;->service:Ljava/lang/String;

    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/cordova/CordovaPlugin;

    if-eqz v2, :cond_0

    .line 472
    invoke-virtual {v2, p1}, Lorg/apache/cordova/CordovaPlugin;->shouldAllowBridgeAccess(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 474
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    monitor-exit v0

    return p1

    .line 478
    :cond_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 481
    invoke-direct {p0}, Lorg/apache/cordova/PluginManager;->getLaunchUrlPrefix()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p1

    return p1

    :catchall_0
    move-exception p1

    .line 478
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public shouldAllowNavigation(Ljava/lang/String;)Z
    .locals 4

    .line 447
    iget-object v0, p0, Lorg/apache/cordova/PluginManager;->entryMap:Ljava/util/Map;

    monitor-enter v0

    .line 448
    :try_start_0
    iget-object v1, p0, Lorg/apache/cordova/PluginManager;->entryMap:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/cordova/PluginEntry;

    .line 449
    iget-object v3, p0, Lorg/apache/cordova/PluginManager;->pluginMap:Ljava/util/Map;

    iget-object v2, v2, Lorg/apache/cordova/PluginEntry;->service:Ljava/lang/String;

    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/cordova/CordovaPlugin;

    if-eqz v2, :cond_0

    .line 451
    invoke-virtual {v2, p1}, Lorg/apache/cordova/CordovaPlugin;->shouldAllowNavigation(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 453
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    monitor-exit v0

    return p1

    .line 457
    :cond_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 460
    invoke-direct {p0}, Lorg/apache/cordova/PluginManager;->getLaunchUrlPrefix()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_3

    const-string v0, "about:blank"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_2

    goto :goto_0

    :cond_2
    const/4 p1, 0x0

    goto :goto_1

    :cond_3
    :goto_0
    const/4 p1, 0x1

    :goto_1
    return p1

    :catchall_0
    move-exception p1

    .line 457
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public shouldAllowRequest(Ljava/lang/String;)Z
    .locals 4

    .line 407
    iget-object v0, p0, Lorg/apache/cordova/PluginManager;->entryMap:Ljava/util/Map;

    monitor-enter v0

    .line 408
    :try_start_0
    iget-object v1, p0, Lorg/apache/cordova/PluginManager;->entryMap:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/cordova/PluginEntry;

    .line 409
    iget-object v3, p0, Lorg/apache/cordova/PluginManager;->pluginMap:Ljava/util/Map;

    iget-object v2, v2, Lorg/apache/cordova/PluginEntry;->service:Ljava/lang/String;

    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/cordova/CordovaPlugin;

    if-eqz v2, :cond_0

    .line 411
    invoke-virtual {v2, p1}, Lorg/apache/cordova/CordovaPlugin;->shouldAllowRequest(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 413
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    monitor-exit v0

    return p1

    .line 417
    :cond_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 420
    const-string v0, "blob:"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_5

    const-string v0, "data:"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_5

    const-string v0, "about:blank"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    goto :goto_0

    .line 424
    :cond_2
    const-string v0, "https://ssl.gstatic.com/accessibility/javascript/android/"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    return v1

    .line 427
    :cond_3
    const-string v0, "file://"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 430
    const-string v0, "/app_webview/"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    xor-int/2addr p1, v1

    return p1

    :cond_4
    const/4 p1, 0x0

    return p1

    :cond_5
    :goto_0
    return v1

    :catchall_0
    move-exception p1

    .line 417
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public shouldOpenExternalUrl(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 4

    .line 497
    iget-object v0, p0, Lorg/apache/cordova/PluginManager;->entryMap:Ljava/util/Map;

    monitor-enter v0

    .line 498
    :try_start_0
    iget-object v1, p0, Lorg/apache/cordova/PluginManager;->entryMap:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/cordova/PluginEntry;

    .line 499
    iget-object v3, p0, Lorg/apache/cordova/PluginManager;->pluginMap:Ljava/util/Map;

    iget-object v2, v2, Lorg/apache/cordova/PluginEntry;->service:Ljava/lang/String;

    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/cordova/CordovaPlugin;

    if-eqz v2, :cond_0

    .line 501
    invoke-virtual {v2, p1}, Lorg/apache/cordova/CordovaPlugin;->shouldOpenExternalUrl(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 503
    monitor-exit v0

    return-object v2

    .line 507
    :cond_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 p1, 0x0

    .line 510
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1

    :catchall_0
    move-exception p1

    .line 507
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method
