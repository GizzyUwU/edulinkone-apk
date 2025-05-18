.class public Lcom/gae/scaffolder/plugin/FCMPluginActivity;
.super Landroid/app/Activity;
.source "FCMPluginActivity.java"


# static fields
.field private static TAG:Ljava/lang/String; = "FCMPlugin"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 14
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method private forceMainActivityReload()V
    .locals 2

    .line 52
    invoke-virtual {p0}, Lcom/gae/scaffolder/plugin/FCMPluginActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    .line 53
    invoke-virtual {p0}, Lcom/gae/scaffolder/plugin/FCMPluginActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    .line 54
    invoke-virtual {p0, v0}, Lcom/gae/scaffolder/plugin/FCMPluginActivity;->startActivity(Landroid/content/Intent;)V

    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 7

    .line 25
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 26
    sget-object p1, Lcom/gae/scaffolder/plugin/FCMPluginActivity;->TAG:Ljava/lang/String;

    const-string v0, "==> FCMPluginActivity onCreate"

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 28
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 30
    invoke-virtual {p0}, Lcom/gae/scaffolder/plugin/FCMPluginActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 33
    sget-object v1, Lcom/gae/scaffolder/plugin/FCMPluginActivity;->TAG:Ljava/lang/String;

    const-string v2, "==> USER TAPPED NOTIFICATION"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v1, 0x1

    .line 35
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    const-string v2, "wasTapped"

    invoke-interface {p1, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    invoke-virtual {v0}, Landroid/os/Bundle;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 38
    invoke-virtual {v0, v2}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    .line 39
    sget-object v4, Lcom/gae/scaffolder/plugin/FCMPluginActivity;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "\tKey: "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " Value: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 40
    invoke-interface {p1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 44
    :cond_0
    invoke-static {p1}, Lcom/gae/scaffolder/plugin/FCMPlugin;->sendPushPayload(Ljava/util/Map;)V

    .line 46
    invoke-virtual {p0}, Lcom/gae/scaffolder/plugin/FCMPluginActivity;->finish()V

    .line 48
    invoke-direct {p0}, Lcom/gae/scaffolder/plugin/FCMPluginActivity;->forceMainActivityReload()V

    return-void
.end method

.method protected onResume()V
    .locals 2

    .line 59
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 60
    sget-object v0, Lcom/gae/scaffolder/plugin/FCMPluginActivity;->TAG:Ljava/lang/String;

    const-string v1, "==> FCMPluginActivity onResume"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 61
    const-string v0, "notification"

    invoke-virtual {p0, v0}, Lcom/gae/scaffolder/plugin/FCMPluginActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    .line 62
    invoke-virtual {v0}, Landroid/app/NotificationManager;->cancelAll()V

    return-void
.end method

.method public onStart()V
    .locals 2

    .line 67
    invoke-super {p0}, Landroid/app/Activity;->onStart()V

    .line 68
    sget-object v0, Lcom/gae/scaffolder/plugin/FCMPluginActivity;->TAG:Ljava/lang/String;

    const-string v1, "==> FCMPluginActivity onStart"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public onStop()V
    .locals 2

    .line 73
    invoke-super {p0}, Landroid/app/Activity;->onStop()V

    .line 74
    sget-object v0, Lcom/gae/scaffolder/plugin/FCMPluginActivity;->TAG:Ljava/lang/String;

    const-string v1, "==> FCMPluginActivity onStop"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method
