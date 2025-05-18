.class Lorg/apache/cordova/AllowListPlugin$CustomConfigXmlParser;
.super Lorg/apache/cordova/ConfigXmlParser;
.source "AllowListPlugin.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/cordova/AllowListPlugin;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CustomConfigXmlParser"
.end annotation


# instance fields
.field private prefs:Lorg/apache/cordova/CordovaPreferences;

.field final synthetic this$0:Lorg/apache/cordova/AllowListPlugin;


# direct methods
.method private constructor <init>(Lorg/apache/cordova/AllowListPlugin;)V
    .locals 0

    .line 76
    iput-object p1, p0, Lorg/apache/cordova/AllowListPlugin$CustomConfigXmlParser;->this$0:Lorg/apache/cordova/AllowListPlugin;

    invoke-direct {p0}, Lorg/apache/cordova/ConfigXmlParser;-><init>()V

    .line 77
    new-instance p1, Lorg/apache/cordova/CordovaPreferences;

    invoke-direct {p1}, Lorg/apache/cordova/CordovaPreferences;-><init>()V

    iput-object p1, p0, Lorg/apache/cordova/AllowListPlugin$CustomConfigXmlParser;->prefs:Lorg/apache/cordova/CordovaPreferences;

    return-void
.end method

.method synthetic constructor <init>(Lorg/apache/cordova/AllowListPlugin;Lorg/apache/cordova/AllowListPlugin$1;)V
    .locals 0

    .line 76
    invoke-direct {p0, p1}, Lorg/apache/cordova/AllowListPlugin$CustomConfigXmlParser;-><init>(Lorg/apache/cordova/AllowListPlugin;)V

    return-void
.end method


# virtual methods
.method public handleEndTag(Lorg/xmlpull/v1/XmlPullParser;)V
    .locals 0

    return-void
.end method

.method public handleStartTag(Lorg/xmlpull/v1/XmlPullParser;)V
    .locals 8

    .line 81
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v0

    .line 82
    const-string v1, "content"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    if-eqz v1, :cond_0

    .line 83
    const-string v0, "src"

    invoke-interface {p1, v2, v0}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 84
    iget-object v0, p0, Lorg/apache/cordova/AllowListPlugin$CustomConfigXmlParser;->this$0:Lorg/apache/cordova/AllowListPlugin;

    invoke-static {v0}, Lorg/apache/cordova/AllowListPlugin;->access$100(Lorg/apache/cordova/AllowListPlugin;)Lorg/apache/cordova/AllowList;

    move-result-object v0

    invoke-virtual {v0, p1, v3}, Lorg/apache/cordova/AllowList;->addAllowListEntry(Ljava/lang/String;Z)V

    goto/16 :goto_0

    .line 85
    :cond_0
    const-string v1, "allow-navigation"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const-string v4, "https://*/*"

    const-string v5, "http://*/*"

    const-string v6, "*"

    const-string v7, "href"

    if-eqz v1, :cond_2

    .line 86
    invoke-interface {p1, v2, v7}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 87
    invoke-virtual {v6, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 88
    iget-object p1, p0, Lorg/apache/cordova/AllowListPlugin$CustomConfigXmlParser;->this$0:Lorg/apache/cordova/AllowListPlugin;

    invoke-static {p1}, Lorg/apache/cordova/AllowListPlugin;->access$100(Lorg/apache/cordova/AllowListPlugin;)Lorg/apache/cordova/AllowList;

    move-result-object p1

    invoke-virtual {p1, v5, v3}, Lorg/apache/cordova/AllowList;->addAllowListEntry(Ljava/lang/String;Z)V

    .line 89
    iget-object p1, p0, Lorg/apache/cordova/AllowListPlugin$CustomConfigXmlParser;->this$0:Lorg/apache/cordova/AllowListPlugin;

    invoke-static {p1}, Lorg/apache/cordova/AllowListPlugin;->access$100(Lorg/apache/cordova/AllowListPlugin;)Lorg/apache/cordova/AllowList;

    move-result-object p1

    invoke-virtual {p1, v4, v3}, Lorg/apache/cordova/AllowList;->addAllowListEntry(Ljava/lang/String;Z)V

    .line 90
    iget-object p1, p0, Lorg/apache/cordova/AllowListPlugin$CustomConfigXmlParser;->this$0:Lorg/apache/cordova/AllowListPlugin;

    invoke-static {p1}, Lorg/apache/cordova/AllowListPlugin;->access$100(Lorg/apache/cordova/AllowListPlugin;)Lorg/apache/cordova/AllowList;

    move-result-object p1

    const-string v0, "data:*"

    invoke-virtual {p1, v0, v3}, Lorg/apache/cordova/AllowList;->addAllowListEntry(Ljava/lang/String;Z)V

    goto :goto_0

    .line 92
    :cond_1
    iget-object v0, p0, Lorg/apache/cordova/AllowListPlugin$CustomConfigXmlParser;->this$0:Lorg/apache/cordova/AllowListPlugin;

    invoke-static {v0}, Lorg/apache/cordova/AllowListPlugin;->access$100(Lorg/apache/cordova/AllowListPlugin;)Lorg/apache/cordova/AllowList;

    move-result-object v0

    invoke-virtual {v0, p1, v3}, Lorg/apache/cordova/AllowList;->addAllowListEntry(Ljava/lang/String;Z)V

    goto :goto_0

    .line 94
    :cond_2
    const-string v1, "allow-intent"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 95
    invoke-interface {p1, v2, v7}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 96
    iget-object v0, p0, Lorg/apache/cordova/AllowListPlugin$CustomConfigXmlParser;->this$0:Lorg/apache/cordova/AllowListPlugin;

    invoke-static {v0}, Lorg/apache/cordova/AllowListPlugin;->access$200(Lorg/apache/cordova/AllowListPlugin;)Lorg/apache/cordova/AllowList;

    move-result-object v0

    invoke-virtual {v0, p1, v3}, Lorg/apache/cordova/AllowList;->addAllowListEntry(Ljava/lang/String;Z)V

    goto :goto_0

    .line 97
    :cond_3
    const-string v1, "access"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 98
    const-string v0, "origin"

    invoke-interface {p1, v2, v0}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_6

    .line 101
    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 102
    iget-object p1, p0, Lorg/apache/cordova/AllowListPlugin$CustomConfigXmlParser;->this$0:Lorg/apache/cordova/AllowListPlugin;

    invoke-static {p1}, Lorg/apache/cordova/AllowListPlugin;->access$300(Lorg/apache/cordova/AllowListPlugin;)Lorg/apache/cordova/AllowList;

    move-result-object p1

    invoke-virtual {p1, v5, v3}, Lorg/apache/cordova/AllowList;->addAllowListEntry(Ljava/lang/String;Z)V

    .line 103
    iget-object p1, p0, Lorg/apache/cordova/AllowListPlugin$CustomConfigXmlParser;->this$0:Lorg/apache/cordova/AllowListPlugin;

    invoke-static {p1}, Lorg/apache/cordova/AllowListPlugin;->access$300(Lorg/apache/cordova/AllowListPlugin;)Lorg/apache/cordova/AllowList;

    move-result-object p1

    invoke-virtual {p1, v4, v3}, Lorg/apache/cordova/AllowList;->addAllowListEntry(Ljava/lang/String;Z)V

    goto :goto_0

    .line 105
    :cond_4
    const-string v1, "subdomains"

    invoke-interface {p1, v2, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 106
    iget-object v1, p0, Lorg/apache/cordova/AllowListPlugin$CustomConfigXmlParser;->this$0:Lorg/apache/cordova/AllowListPlugin;

    invoke-static {v1}, Lorg/apache/cordova/AllowListPlugin;->access$300(Lorg/apache/cordova/AllowListPlugin;)Lorg/apache/cordova/AllowList;

    move-result-object v1

    if-eqz p1, :cond_5

    const-string v2, "true"

    invoke-virtual {p1, v2}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result p1

    if-nez p1, :cond_5

    const/4 v3, 0x1

    :cond_5
    invoke-virtual {v1, v0, v3}, Lorg/apache/cordova/AllowList;->addAllowListEntry(Ljava/lang/String;Z)V

    :cond_6
    :goto_0
    return-void
.end method
