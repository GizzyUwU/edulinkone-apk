.class public Lorg/apache/cordova/AllowListPlugin;
.super Lorg/apache/cordova/CordovaPlugin;
.source "AllowListPlugin.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/cordova/AllowListPlugin$CustomConfigXmlParser;
    }
.end annotation


# static fields
.field protected static final LOG_TAG:Ljava/lang/String; = "CordovaAllowListPlugin"

.field public static final PLUGIN_NAME:Ljava/lang/String; = "CordovaAllowListPlugin"


# instance fields
.field private allowedIntents:Lorg/apache/cordova/AllowList;

.field private allowedNavigations:Lorg/apache/cordova/AllowList;

.field private allowedRequests:Lorg/apache/cordova/AllowList;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 40
    invoke-direct {p0}, Lorg/apache/cordova/CordovaPlugin;-><init>()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 3

    .line 44
    new-instance v0, Lorg/apache/cordova/AllowList;

    invoke-direct {v0}, Lorg/apache/cordova/AllowList;-><init>()V

    new-instance v1, Lorg/apache/cordova/AllowList;

    invoke-direct {v1}, Lorg/apache/cordova/AllowList;-><init>()V

    const/4 v2, 0x0

    invoke-direct {p0, v0, v1, v2}, Lorg/apache/cordova/AllowListPlugin;-><init>(Lorg/apache/cordova/AllowList;Lorg/apache/cordova/AllowList;Lorg/apache/cordova/AllowList;)V

    .line 45
    new-instance v0, Lorg/apache/cordova/AllowListPlugin$CustomConfigXmlParser;

    invoke-direct {v0, p0, v2}, Lorg/apache/cordova/AllowListPlugin$CustomConfigXmlParser;-><init>(Lorg/apache/cordova/AllowListPlugin;Lorg/apache/cordova/AllowListPlugin$1;)V

    invoke-virtual {v0, p1}, Lorg/apache/cordova/AllowListPlugin$CustomConfigXmlParser;->parse(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Lorg/apache/cordova/AllowList;Lorg/apache/cordova/AllowList;Lorg/apache/cordova/AllowList;)V
    .locals 2

    .line 53
    invoke-direct {p0}, Lorg/apache/cordova/CordovaPlugin;-><init>()V

    if-nez p3, :cond_0

    .line 55
    new-instance p3, Lorg/apache/cordova/AllowList;

    invoke-direct {p3}, Lorg/apache/cordova/AllowList;-><init>()V

    .line 56
    const-string v0, "file:///*"

    const/4 v1, 0x0

    invoke-virtual {p3, v0, v1}, Lorg/apache/cordova/AllowList;->addAllowListEntry(Ljava/lang/String;Z)V

    .line 57
    const-string v0, "data:*"

    invoke-virtual {p3, v0, v1}, Lorg/apache/cordova/AllowList;->addAllowListEntry(Ljava/lang/String;Z)V

    .line 60
    :cond_0
    iput-object p1, p0, Lorg/apache/cordova/AllowListPlugin;->allowedNavigations:Lorg/apache/cordova/AllowList;

    .line 61
    iput-object p2, p0, Lorg/apache/cordova/AllowListPlugin;->allowedIntents:Lorg/apache/cordova/AllowList;

    .line 62
    iput-object p3, p0, Lorg/apache/cordova/AllowListPlugin;->allowedRequests:Lorg/apache/cordova/AllowList;

    return-void
.end method

.method public constructor <init>(Lorg/xmlpull/v1/XmlPullParser;)V
    .locals 3

    .line 49
    new-instance v0, Lorg/apache/cordova/AllowList;

    invoke-direct {v0}, Lorg/apache/cordova/AllowList;-><init>()V

    new-instance v1, Lorg/apache/cordova/AllowList;

    invoke-direct {v1}, Lorg/apache/cordova/AllowList;-><init>()V

    const/4 v2, 0x0

    invoke-direct {p0, v0, v1, v2}, Lorg/apache/cordova/AllowListPlugin;-><init>(Lorg/apache/cordova/AllowList;Lorg/apache/cordova/AllowList;Lorg/apache/cordova/AllowList;)V

    .line 50
    new-instance v0, Lorg/apache/cordova/AllowListPlugin$CustomConfigXmlParser;

    invoke-direct {v0, p0, v2}, Lorg/apache/cordova/AllowListPlugin$CustomConfigXmlParser;-><init>(Lorg/apache/cordova/AllowListPlugin;Lorg/apache/cordova/AllowListPlugin$1;)V

    invoke-virtual {v0, p1}, Lorg/apache/cordova/AllowListPlugin$CustomConfigXmlParser;->parse(Lorg/xmlpull/v1/XmlPullParser;)V

    return-void
.end method

.method static synthetic access$100(Lorg/apache/cordova/AllowListPlugin;)Lorg/apache/cordova/AllowList;
    .locals 0

    .line 31
    iget-object p0, p0, Lorg/apache/cordova/AllowListPlugin;->allowedNavigations:Lorg/apache/cordova/AllowList;

    return-object p0
.end method

.method static synthetic access$200(Lorg/apache/cordova/AllowListPlugin;)Lorg/apache/cordova/AllowList;
    .locals 0

    .line 31
    iget-object p0, p0, Lorg/apache/cordova/AllowListPlugin;->allowedIntents:Lorg/apache/cordova/AllowList;

    return-object p0
.end method

.method static synthetic access$300(Lorg/apache/cordova/AllowListPlugin;)Lorg/apache/cordova/AllowList;
    .locals 0

    .line 31
    iget-object p0, p0, Lorg/apache/cordova/AllowListPlugin;->allowedRequests:Lorg/apache/cordova/AllowList;

    return-object p0
.end method


# virtual methods
.method public getAllowedIntents()Lorg/apache/cordova/AllowList;
    .locals 1

    .line 146
    iget-object v0, p0, Lorg/apache/cordova/AllowListPlugin;->allowedIntents:Lorg/apache/cordova/AllowList;

    return-object v0
.end method

.method public getAllowedNavigations()Lorg/apache/cordova/AllowList;
    .locals 1

    .line 138
    iget-object v0, p0, Lorg/apache/cordova/AllowListPlugin;->allowedNavigations:Lorg/apache/cordova/AllowList;

    return-object v0
.end method

.method public getAllowedRequests()Lorg/apache/cordova/AllowList;
    .locals 1

    .line 154
    iget-object v0, p0, Lorg/apache/cordova/AllowListPlugin;->allowedRequests:Lorg/apache/cordova/AllowList;

    return-object v0
.end method

.method public pluginInitialize()V
    .locals 2

    .line 67
    iget-object v0, p0, Lorg/apache/cordova/AllowListPlugin;->allowedNavigations:Lorg/apache/cordova/AllowList;

    if-nez v0, :cond_0

    .line 68
    new-instance v0, Lorg/apache/cordova/AllowList;

    invoke-direct {v0}, Lorg/apache/cordova/AllowList;-><init>()V

    iput-object v0, p0, Lorg/apache/cordova/AllowListPlugin;->allowedNavigations:Lorg/apache/cordova/AllowList;

    .line 69
    new-instance v0, Lorg/apache/cordova/AllowList;

    invoke-direct {v0}, Lorg/apache/cordova/AllowList;-><init>()V

    iput-object v0, p0, Lorg/apache/cordova/AllowListPlugin;->allowedIntents:Lorg/apache/cordova/AllowList;

    .line 70
    new-instance v0, Lorg/apache/cordova/AllowList;

    invoke-direct {v0}, Lorg/apache/cordova/AllowList;-><init>()V

    iput-object v0, p0, Lorg/apache/cordova/AllowListPlugin;->allowedRequests:Lorg/apache/cordova/AllowList;

    .line 72
    new-instance v0, Lorg/apache/cordova/AllowListPlugin$CustomConfigXmlParser;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lorg/apache/cordova/AllowListPlugin$CustomConfigXmlParser;-><init>(Lorg/apache/cordova/AllowListPlugin;Lorg/apache/cordova/AllowListPlugin$1;)V

    iget-object v1, p0, Lorg/apache/cordova/AllowListPlugin;->webView:Lorg/apache/cordova/CordovaWebView;

    invoke-interface {v1}, Lorg/apache/cordova/CordovaWebView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/cordova/AllowListPlugin$CustomConfigXmlParser;->parse(Landroid/content/Context;)V

    :cond_0
    return-void
.end method

.method public setAllowedIntents(Lorg/apache/cordova/AllowList;)V
    .locals 0

    .line 150
    iput-object p1, p0, Lorg/apache/cordova/AllowListPlugin;->allowedIntents:Lorg/apache/cordova/AllowList;

    return-void
.end method

.method public setAllowedNavigations(Lorg/apache/cordova/AllowList;)V
    .locals 0

    .line 142
    iput-object p1, p0, Lorg/apache/cordova/AllowListPlugin;->allowedNavigations:Lorg/apache/cordova/AllowList;

    return-void
.end method

.method public setAllowedRequests(Lorg/apache/cordova/AllowList;)V
    .locals 0

    .line 158
    iput-object p1, p0, Lorg/apache/cordova/AllowListPlugin;->allowedRequests:Lorg/apache/cordova/AllowList;

    return-void
.end method

.method public shouldAllowNavigation(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 1

    .line 118
    iget-object v0, p0, Lorg/apache/cordova/AllowListPlugin;->allowedNavigations:Lorg/apache/cordova/AllowList;

    invoke-virtual {v0, p1}, Lorg/apache/cordova/AllowList;->isUrlAllowListed(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    .line 119
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return-object p1
.end method

.method public shouldAllowRequest(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 2

    .line 125
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {p0, p1}, Lorg/apache/cordova/AllowListPlugin;->shouldAllowNavigation(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lorg/apache/cordova/AllowListPlugin;->allowedRequests:Lorg/apache/cordova/AllowList;

    invoke-virtual {v0, p1}, Lorg/apache/cordova/AllowList;->isUrlAllowListed(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    .line 126
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    :goto_1
    return-object p1
.end method

.method public shouldOpenExternalUrl(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 1

    .line 132
    iget-object v0, p0, Lorg/apache/cordova/AllowListPlugin;->allowedIntents:Lorg/apache/cordova/AllowList;

    invoke-virtual {v0, p1}, Lorg/apache/cordova/AllowList;->isUrlAllowListed(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    .line 133
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return-object p1
.end method
