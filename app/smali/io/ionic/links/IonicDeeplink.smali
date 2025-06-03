.class public Lio/ionic/links/IonicDeeplink;
.super Lorg/apache/cordova/CordovaPlugin;
.source "IonicDeeplink.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "IonicDeeplinkPlugin"


# instance fields
.field private _handlers:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lorg/apache/cordova/CallbackContext;",
            ">;"
        }
    .end annotation
.end field

.field private lastEvent:Lorg/json/JSONObject;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 45
    invoke-direct {p0}, Lorg/apache/cordova/CordovaPlugin;-><init>()V

    .line 50
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lio/ionic/links/IonicDeeplink;->_handlers:Ljava/util/ArrayList;

    return-void
.end method

.method private _bundleToJson(Landroid/os/Bundle;)Lorg/json/JSONObject;
    .locals 7

    if-nez p1, :cond_0

    .line 134
    new-instance p1, Lorg/json/JSONObject;

    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    return-object p1

    .line 137
    :cond_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 138
    invoke-virtual {p1}, Landroid/os/Bundle;->keySet()Ljava/util/Set;

    move-result-object v1

    .line 139
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :catch_0
    :cond_1
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 141
    :try_start_0
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    const/4 v4, 0x1

    .line 142
    new-array v4, v4, [Ljava/lang/Class;

    .line 143
    const-class v5, Ljava/lang/String;

    const/4 v6, 0x0

    aput-object v5, v4, v6
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 146
    :try_start_1
    const-string v5, "wrap"

    invoke-virtual {v3, v5, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 147
    invoke-virtual {p1, v2}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Lorg/json/JSONObject;->wrap(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 151
    :catch_1
    :try_start_2
    invoke-virtual {p1, v2}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    invoke-direct {p0, v3}, Lio/ionic/links/IonicDeeplink;->_wrap(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    :cond_2
    return-object v0
.end method

.method private _wrap(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return-object v0

    .line 163
    :cond_0
    instance-of v1, p1, Lorg/json/JSONArray;

    if-nez v1, :cond_9

    instance-of v1, p1, Lorg/json/JSONObject;

    if-eqz v1, :cond_1

    goto/16 :goto_1

    .line 166
    :cond_1
    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    return-object p1

    .line 170
    :cond_2
    :try_start_0
    instance-of v1, p1, Ljava/util/Collection;

    if-eqz v1, :cond_3

    .line 171
    new-instance v1, Lorg/json/JSONArray;

    check-cast p1, Ljava/util/Collection;

    invoke-direct {v1, p1}, Lorg/json/JSONArray;-><init>(Ljava/util/Collection;)V

    return-object v1

    .line 172
    :cond_3
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->isArray()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 173
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1, p1}, Lorg/json/JSONArray;-><init>(Ljava/lang/Object;)V

    return-object v1

    .line 175
    :cond_4
    instance-of v1, p1, Ljava/util/Map;

    if-eqz v1, :cond_5

    .line 176
    new-instance v1, Lorg/json/JSONObject;

    check-cast p1, Ljava/util/Map;

    invoke-direct {v1, p1}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    return-object v1

    .line 178
    :cond_5
    instance-of v1, p1, Ljava/lang/Boolean;

    if-nez v1, :cond_7

    instance-of v1, p1, Ljava/lang/Byte;

    if-nez v1, :cond_7

    instance-of v1, p1, Ljava/lang/Character;

    if-nez v1, :cond_7

    instance-of v1, p1, Ljava/lang/Double;

    if-nez v1, :cond_7

    instance-of v1, p1, Ljava/lang/Float;

    if-nez v1, :cond_7

    instance-of v1, p1, Ljava/lang/Integer;

    if-nez v1, :cond_7

    instance-of v1, p1, Ljava/lang/Long;

    if-nez v1, :cond_7

    instance-of v1, p1, Ljava/lang/Short;

    if-nez v1, :cond_7

    instance-of v1, p1, Ljava/lang/String;

    if-eqz v1, :cond_6

    goto :goto_0

    .line 189
    :cond_6
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getPackage()Ljava/lang/Package;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Package;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "java."

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_8

    .line 190
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_7
    :goto_0
    return-object p1

    :catch_0
    :cond_8
    return-object v0

    :cond_9
    :goto_1
    return-object p1
.end method

.method private addHandler(Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)V
    .locals 0

    .line 128
    iget-object p1, p0, Lio/ionic/links/IonicDeeplink;->_handlers:Ljava/util/ArrayList;

    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 129
    invoke-direct {p0}, Lio/ionic/links/IonicDeeplink;->consumeEvents()V

    return-void
.end method

.method private canOpenApp(Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V
    .locals 2

    .line 202
    iget-object v0, p0, Lio/ionic/links/IonicDeeplink;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroidx/appcompat/app/AppCompatActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 203
    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    const/4 v1, 0x1

    .line 206
    :try_start_0
    invoke-virtual {v0, p1, v1}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    .line 207
    invoke-virtual {p2}, Lorg/apache/cordova/CallbackContext;->success()V
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 210
    :catch_0
    const-string p1, ""

    invoke-virtual {p2, p1}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    return-void
.end method

.method private consumeEvents()V
    .locals 3

    .line 111
    iget-object v0, p0, Lio/ionic/links/IonicDeeplink;->_handlers:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lio/ionic/links/IonicDeeplink;->lastEvent:Lorg/json/JSONObject;

    if-nez v0, :cond_0

    goto :goto_1

    .line 115
    :cond_0
    iget-object v0, p0, Lio/ionic/links/IonicDeeplink;->_handlers:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/cordova/CallbackContext;

    .line 116
    iget-object v2, p0, Lio/ionic/links/IonicDeeplink;->lastEvent:Lorg/json/JSONObject;

    invoke-direct {p0, v2, v1}, Lio/ionic/links/IonicDeeplink;->sendToJs(Lorg/json/JSONObject;Lorg/apache/cordova/CallbackContext;)V

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 118
    iput-object v0, p0, Lio/ionic/links/IonicDeeplink;->lastEvent:Lorg/json/JSONObject;

    :cond_2
    :goto_1
    return-void
.end method

.method private getHardwareInfo(Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)V
    .locals 2

    .line 214
    iget-object p1, p0, Lio/ionic/links/IonicDeeplink;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {p1}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroidx/appcompat/app/AppCompatActivity;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/appcompat/app/AppCompatActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    const-string v0, "android_id"

    invoke-static {p1, v0}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 216
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 218
    :try_start_0
    const-string v1, "uuid"

    invoke-virtual {v0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 219
    const-string p1, "platform"

    invoke-direct {p0}, Lio/ionic/links/IonicDeeplink;->getPlatform()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 220
    const-string p1, "tz"

    invoke-direct {p0}, Lio/ionic/links/IonicDeeplink;->getTimeZoneID()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 221
    const-string p1, "tz_offset"

    invoke-direct {p0}, Lio/ionic/links/IonicDeeplink;->getTimeZoneOffset()I

    move-result v1

    invoke-virtual {v0, p1, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 222
    const-string p1, "os_version"

    invoke-direct {p0}, Lio/ionic/links/IonicDeeplink;->getOSVersion()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 223
    const-string p1, "sdk_version"

    invoke-direct {p0}, Lio/ionic/links/IonicDeeplink;->getSDKVersion()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 226
    :catch_0
    new-instance p1, Lorg/apache/cordova/PluginResult;

    sget-object v1, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {p1, v1, v0}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Lorg/json/JSONObject;)V

    .line 227
    invoke-virtual {p2, p1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    return-void
.end method

.method private getOSVersion()Ljava/lang/String;
    .locals 1

    .line 252
    sget-object v0, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    return-object v0
.end method

.method private getPlatform()Ljava/lang/String;
    .locals 1

    .line 257
    invoke-direct {p0}, Lio/ionic/links/IonicDeeplink;->isAmazonDevice()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 258
    const-string v0, "amazon-fireos"

    goto :goto_0

    .line 260
    :cond_0
    const-string v0, "android"

    :goto_0
    return-object v0
.end method

.method private getSDKVersion()Ljava/lang/String;
    .locals 1

    .line 248
    sget-object v0, Landroid/os/Build$VERSION;->SDK:Ljava/lang/String;

    return-object v0
.end method

.method private getTimeZoneID()Ljava/lang/String;
    .locals 1

    .line 237
    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object v0

    .line 238
    invoke-virtual {v0}, Ljava/util/TimeZone;->getID()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getTimeZoneOffset()I
    .locals 3

    .line 242
    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object v0

    .line 243
    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/util/TimeZone;->getOffset(J)I

    move-result v0

    div-int/lit16 v0, v0, 0x3e8

    div-int/lit8 v0, v0, 0x3c

    return v0
.end method

.method private isAmazonDevice()Z
    .locals 2

    .line 231
    sget-object v0, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    const-string v1, "Amazon"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method private sendToJs(Lorg/json/JSONObject;Lorg/apache/cordova/CallbackContext;)V
    .locals 2

    .line 122
    new-instance v0, Lorg/apache/cordova/PluginResult;

    sget-object v1, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v0, v1, p1}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Lorg/json/JSONObject;)V

    const/4 p1, 0x1

    .line 123
    invoke-virtual {v0, p1}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 124
    invoke-virtual {p2, v0}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    return-void
.end method


# virtual methods
.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 95
    const-string v0, "onDeepLink"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 96
    invoke-direct {p0, p2, p3}, Lio/ionic/links/IonicDeeplink;->addHandler(Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)V

    goto :goto_0

    .line 97
    :cond_0
    const-string v0, "canOpenApp"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 p1, 0x0

    .line 98
    invoke-virtual {p2, p1}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object p1

    .line 99
    invoke-direct {p0, p1, p3}, Lio/ionic/links/IonicDeeplink;->canOpenApp(Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V

    goto :goto_0

    .line 100
    :cond_1
    const-string v0, "getHardwareInfo"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    .line 101
    invoke-direct {p0, p2, p3}, Lio/ionic/links/IonicDeeplink;->getHardwareInfo(Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)V

    :cond_2
    :goto_0
    const/4 p1, 0x1

    return p1
.end method

.method public handleIntent(Landroid/content/Intent;)V
    .locals 6

    .line 65
    invoke-virtual {p1}, Landroid/content/Intent;->getDataString()Ljava/lang/String;

    move-result-object v0

    .line 68
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    .line 69
    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v2

    .line 70
    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v3

    invoke-direct {p0, v3}, Lio/ionic/links/IonicDeeplink;->_bundleToJson(Landroid/os/Bundle;)Lorg/json/JSONObject;

    move-result-object v3

    .line 71
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Got a new intent: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, " "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Landroid/content/Intent;->getScheme()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "IonicDeeplinkPlugin"

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 74
    const-string p1, "android.intent.action.VIEW"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    if-nez v2, :cond_0

    goto :goto_0

    .line 80
    :cond_0
    :try_start_0
    new-instance p1, Lorg/json/JSONObject;

    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    iput-object p1, p0, Lio/ionic/links/IonicDeeplink;->lastEvent:Lorg/json/JSONObject;

    .line 81
    const-string v1, "url"

    invoke-virtual {v2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v1, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 82
    iget-object p1, p0, Lio/ionic/links/IonicDeeplink;->lastEvent:Lorg/json/JSONObject;

    const-string v1, "path"

    invoke-virtual {v2}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v1, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 83
    iget-object p1, p0, Lio/ionic/links/IonicDeeplink;->lastEvent:Lorg/json/JSONObject;

    const-string v1, "queryString"

    invoke-virtual {v2}, Landroid/net/Uri;->getQuery()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v1, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 84
    iget-object p1, p0, Lio/ionic/links/IonicDeeplink;->lastEvent:Lorg/json/JSONObject;

    const-string v1, "scheme"

    invoke-virtual {v2}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v1, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 85
    iget-object p1, p0, Lio/ionic/links/IonicDeeplink;->lastEvent:Lorg/json/JSONObject;

    const-string v1, "host"

    invoke-virtual {v2}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v1, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 86
    iget-object p1, p0, Lio/ionic/links/IonicDeeplink;->lastEvent:Lorg/json/JSONObject;

    const-string v1, "fragment"

    invoke-virtual {v2}, Landroid/net/Uri;->getFragment()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 87
    iget-object p1, p0, Lio/ionic/links/IonicDeeplink;->lastEvent:Lorg/json/JSONObject;

    const-string v1, "extra"

    invoke-virtual {p1, v1, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 88
    invoke-direct {p0}, Lio/ionic/links/IonicDeeplink;->consumeEvents()V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 90
    const-string v1, "Unable to process URL scheme deeplink"

    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_1
    :goto_0
    return-void
.end method

.method public initialize(Lorg/apache/cordova/CordovaInterface;Lorg/apache/cordova/CordovaWebView;)V
    .locals 1

    .line 53
    invoke-super {p0, p1, p2}, Lorg/apache/cordova/CordovaPlugin;->initialize(Lorg/apache/cordova/CordovaInterface;Lorg/apache/cordova/CordovaWebView;)V

    .line 54
    const-string p2, "IonicDeeplinkPlugin"

    const-string v0, "IonicDeepLinkPlugin: firing up..."

    invoke-static {p2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 56
    invoke-interface {p1}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroidx/appcompat/app/AppCompatActivity;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/appcompat/app/AppCompatActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p0, p1}, Lio/ionic/links/IonicDeeplink;->handleIntent(Landroid/content/Intent;)V

    return-void
.end method

.method public onNewIntent(Landroid/content/Intent;)V
    .locals 0

    .line 61
    invoke-virtual {p0, p1}, Lio/ionic/links/IonicDeeplink;->handleIntent(Landroid/content/Intent;)V

    return-void
.end method
