.class public Lcordova/plugin/pincheck/PinCheck;
.super Lorg/apache/cordova/CordovaPlugin;
.source "PinCheck.java"


# static fields
.field private static final ARC_DEVICE_PATTERN:Ljava/lang/String; = ".+_cheets|cheets_.+"

.field private static TAG:Ljava/lang/String;

.field private static final isDeviceSecureSupported:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x1

    .line 22
    sput-boolean v0, Lcordova/plugin/pincheck/PinCheck;->isDeviceSecureSupported:Z

    .line 23
    const-string v0, "PinCheck"

    sput-object v0, Lcordova/plugin/pincheck/PinCheck;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 21
    invoke-direct {p0}, Lorg/apache/cordova/CordovaPlugin;-><init>()V

    return-void
.end method

.method private isDeviceSecure(Landroid/content/Context;)Z
    .locals 3

    .line 51
    const-string v0, "keyguard"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/KeyguardManager;

    .line 52
    sget-boolean v1, Lcordova/plugin/pincheck/PinCheck;->isDeviceSecureSupported:Z

    if-eqz v1, :cond_0

    .line 53
    sget-object v1, Lcordova/plugin/pincheck/PinCheck;->TAG:Ljava/lang/String;

    const-string v2, "calling KeyguardManager.isDeviceSecure()"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 54
    invoke-virtual {v0}, Landroid/app/KeyguardManager;->isDeviceSecure()Z

    move-result v0

    goto :goto_0

    .line 56
    :cond_0
    sget-object v1, Lcordova/plugin/pincheck/PinCheck;->TAG:Ljava/lang/String;

    const-string v2, "calling KeyguardManager.isKeyguardSecure()"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 57
    invoke-virtual {v0}, Landroid/app/KeyguardManager;->isKeyguardSecure()Z

    move-result v0

    :goto_0
    const/4 v1, 0x1

    if-eqz v0, :cond_1

    return v1

    .line 65
    :cond_1
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p1

    const-string v0, "org.chromium.arc.device_management"

    invoke-virtual {p1, v0}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_2

    .line 66
    sget-object p1, Lcordova/plugin/pincheck/PinCheck;->TAG:Ljava/lang/String;

    const-string v0, "org.chromium.arc.device_management SystemFeature present"

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return v1

    .line 69
    :cond_2
    sget-object p1, Lcordova/plugin/pincheck/PinCheck;->TAG:Ljava/lang/String;

    const-string v0, "org.chromium.arc.device_management SystemFeature not present"

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 73
    sget-object p1, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    if-eqz p1, :cond_3

    .line 74
    sget-object p1, Lcordova/plugin/pincheck/PinCheck;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "Build.DEVICE: "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v2, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 75
    sget-object p1, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    const-string v0, ".+_cheets|cheets_.+"

    invoke-virtual {p1, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_3

    .line 76
    sget-object p1, Lcordova/plugin/pincheck/PinCheck;->TAG:Ljava/lang/String;

    const-string v0, "matches pattern: .+_cheets|cheets_.+"

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return v1

    :cond_3
    const/4 p1, 0x0

    return p1
.end method

.method private pinCheck(Lorg/apache/cordova/CallbackContext;)V
    .locals 2

    .line 36
    iget-object v0, p0, Lcordova/plugin/pincheck/PinCheck;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroidx/appcompat/app/AppCompatActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 37
    invoke-direct {p0, v0}, Lcordova/plugin/pincheck/PinCheck;->isDeviceSecure(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 39
    sget-object v0, Lcordova/plugin/pincheck/PinCheck;->TAG:Ljava/lang/String;

    const-string v1, "device IS secure"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 40
    const-string v0, "PIN_SETUP"

    invoke-virtual {p1, v0}, Lorg/apache/cordova/CallbackContext;->success(Ljava/lang/String;)V

    goto :goto_0

    .line 42
    :cond_0
    sget-object v0, Lcordova/plugin/pincheck/PinCheck;->TAG:Ljava/lang/String;

    const-string v1, "device NOT secure"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 43
    const-string v0, "NO_PIN_SETUP"

    invoke-virtual {p1, v0}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    :goto_0
    return-void
.end method


# virtual methods
.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 28
    const-string p2, "isPinSetup"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 29
    invoke-direct {p0, p3}, Lcordova/plugin/pincheck/PinCheck;->pinCheck(Lorg/apache/cordova/CallbackContext;)V

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method
