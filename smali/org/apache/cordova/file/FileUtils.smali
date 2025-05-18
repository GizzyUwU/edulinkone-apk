.class public Lorg/apache/cordova/file/FileUtils;
.super Lorg/apache/cordova/CordovaPlugin;
.source "FileUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/cordova/file/FileUtils$FileOp;
    }
.end annotation


# static fields
.field public static ABORT_ERR:I = 0x3

.field public static final ACTION_GET_DIRECTORY:I = 0x2

.field public static final ACTION_GET_FILE:I = 0x0

.field public static final ACTION_READ_ENTRIES:I = 0x3

.field public static final ACTION_WRITE:I = 0x1

.field public static ENCODING_ERR:I = 0x5

.field public static INVALID_MODIFICATION_ERR:I = 0x9

.field public static INVALID_STATE_ERR:I = 0x7

.field private static final LOG_TAG:Ljava/lang/String; = "FileUtils"

.field public static NOT_FOUND_ERR:I = 0x1

.field public static NOT_READABLE_ERR:I = 0x4

.field public static NO_MODIFICATION_ALLOWED_ERR:I = 0x6

.field public static PATH_EXISTS_ERR:I = 0xc

.field public static QUOTA_EXCEEDED_ERR:I = 0xa

.field public static final READ:I = 0x4

.field public static SECURITY_ERR:I = 0x2

.field public static SYNTAX_ERR:I = 0x8

.field public static TYPE_MISMATCH_ERR:I = 0xb

.field public static UNKNOWN_ERR:I = 0x3e8

.field public static final WRITE:I = 0x3

.field private static filePlugin:Lorg/apache/cordova/file/FileUtils;


# instance fields
.field private configured:Z

.field private filesystems:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lorg/apache/cordova/file/Filesystem;",
            ">;"
        }
    .end annotation
.end field

.field private pendingRequests:Lorg/apache/cordova/file/PendingRequests;

.field private permissions:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 67
    invoke-direct {p0}, Lorg/apache/cordova/CordovaPlugin;-><init>()V

    const/4 v0, 0x0

    .line 98
    iput-boolean v0, p0, Lorg/apache/cordova/file/FileUtils;->configured:Z

    .line 106
    const-string v0, "android.permission.READ_EXTERNAL_STORAGE"

    const-string v1, "android.permission.WRITE_EXTERNAL_STORAGE"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/cordova/file/FileUtils;->permissions:[Ljava/lang/String;

    return-void
.end method

.method static synthetic access$000(Lorg/apache/cordova/file/FileUtils;Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/json/JSONException;
        }
    .end annotation

    .line 67
    invoke-direct {p0, p1}, Lorg/apache/cordova/file/FileUtils;->resolveLocalFileSystemURI(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$100(Lorg/apache/cordova/file/FileUtils;Ljava/lang/String;I)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 67
    invoke-direct {p0, p1, p2}, Lorg/apache/cordova/file/FileUtils;->needPermission(Ljava/lang/String;I)Z

    move-result p0

    return p0
.end method

.method static synthetic access$1000(Lorg/apache/cordova/file/FileUtils;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;Z)Lorg/json/JSONObject;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/cordova/file/FileExistsException;,
            Ljava/io/IOException;,
            Lorg/apache/cordova/file/TypeMismatchException;,
            Lorg/apache/cordova/file/EncodingException;,
            Lorg/json/JSONException;
        }
    .end annotation

    .line 67
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/apache/cordova/file/FileUtils;->getFile(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;Z)Lorg/json/JSONObject;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1100(Lorg/apache/cordova/file/FileUtils;Ljava/lang/String;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/cordova/file/NoModificationAllowedException;,
            Lorg/apache/cordova/file/InvalidModificationException;,
            Ljava/net/MalformedURLException;
        }
    .end annotation

    .line 67
    invoke-direct {p0, p1}, Lorg/apache/cordova/file/FileUtils;->remove(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method static synthetic access$1200(Lorg/apache/cordova/file/FileUtils;Ljava/lang/String;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/cordova/file/FileExistsException;,
            Lorg/apache/cordova/file/NoModificationAllowedException;,
            Ljava/net/MalformedURLException;
        }
    .end annotation

    .line 67
    invoke-direct {p0, p1}, Lorg/apache/cordova/file/FileUtils;->removeRecursively(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method static synthetic access$1300(Lorg/apache/cordova/file/FileUtils;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lorg/json/JSONObject;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;,
            Lorg/apache/cordova/file/NoModificationAllowedException;,
            Ljava/io/IOException;,
            Lorg/apache/cordova/file/InvalidModificationException;,
            Lorg/apache/cordova/file/EncodingException;,
            Lorg/apache/cordova/file/FileExistsException;
        }
    .end annotation

    .line 67
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/apache/cordova/file/FileUtils;->transferTo(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1400(Lorg/apache/cordova/file/FileUtils;Ljava/lang/String;)Lorg/json/JSONArray;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;,
            Lorg/json/JSONException;,
            Ljava/net/MalformedURLException;
        }
    .end annotation

    .line 67
    invoke-direct {p0, p1}, Lorg/apache/cordova/file/FileUtils;->readEntries(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$200(Lorg/apache/cordova/file/FileUtils;Ljava/lang/String;ILorg/apache/cordova/CallbackContext;)V
    .locals 0

    .line 67
    invoke-direct {p0, p1, p2, p3}, Lorg/apache/cordova/file/FileUtils;->getWritePermission(Ljava/lang/String;ILorg/apache/cordova/CallbackContext;)V

    return-void
.end method

.method static synthetic access$300(Lorg/apache/cordova/file/FileUtils;Ljava/lang/String;J)J
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;,
            Ljava/io/IOException;,
            Lorg/apache/cordova/file/NoModificationAllowedException;
        }
    .end annotation

    .line 67
    invoke-direct {p0, p1, p2, p3}, Lorg/apache/cordova/file/FileUtils;->truncateFile(Ljava/lang/String;J)J

    move-result-wide p0

    return-wide p0
.end method

.method static synthetic access$400(Lorg/apache/cordova/file/FileUtils;)Lorg/json/JSONArray;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/json/JSONException;
        }
    .end annotation

    .line 67
    invoke-direct {p0}, Lorg/apache/cordova/file/FileUtils;->requestAllFileSystems()Lorg/json/JSONArray;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$500(Lorg/apache/cordova/file/FileUtils;)Lorg/json/JSONObject;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 67
    invoke-direct {p0}, Lorg/apache/cordova/file/FileUtils;->requestAllPaths()Lorg/json/JSONObject;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$600(Lorg/apache/cordova/file/FileUtils;IJLorg/apache/cordova/CallbackContext;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 67
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/apache/cordova/file/FileUtils;->requestFileSystem(IJLorg/apache/cordova/CallbackContext;)V

    return-void
.end method

.method static synthetic access$700(Lorg/apache/cordova/file/FileUtils;Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;,
            Lorg/json/JSONException;,
            Ljava/net/MalformedURLException;
        }
    .end annotation

    .line 67
    invoke-direct {p0, p1}, Lorg/apache/cordova/file/FileUtils;->getFileMetadata(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$800(Lorg/apache/cordova/file/FileUtils;Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 67
    invoke-direct {p0, p1}, Lorg/apache/cordova/file/FileUtils;->getParent(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$900(Lorg/apache/cordova/file/FileUtils;Ljava/lang/String;ILorg/apache/cordova/CallbackContext;)V
    .locals 0

    .line 67
    invoke-direct {p0, p1, p2, p3}, Lorg/apache/cordova/file/FileUtils;->getReadPermission(Ljava/lang/String;ILorg/apache/cordova/CallbackContext;)V

    return-void
.end method

.method private filesystemForName(Ljava/lang/String;)Lorg/apache/cordova/file/Filesystem;
    .locals 3

    .line 126
    iget-object v0, p0, Lorg/apache/cordova/file/FileUtils;->filesystems:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/cordova/file/Filesystem;

    if-eqz v1, :cond_0

    .line 127
    iget-object v2, v1, Lorg/apache/cordova/file/Filesystem;->name:Ljava/lang/String;

    if-eqz v2, :cond_0

    iget-object v2, v1, Lorg/apache/cordova/file/Filesystem;->name:Ljava/lang/String;

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    return-object v1

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method private filesystemForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Lorg/apache/cordova/file/Filesystem;
    .locals 0

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 253
    :cond_0
    iget-object p1, p1, Lorg/apache/cordova/file/LocalFilesystemURL;->fsName:Ljava/lang/String;

    invoke-direct {p0, p1}, Lorg/apache/cordova/file/FileUtils;->filesystemForName(Ljava/lang/String;)Lorg/apache/cordova/file/Filesystem;

    move-result-object p1

    return-object p1
.end method

.method public static getEntry(Ljava/io/File;)Lorg/json/JSONObject;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1069
    invoke-static {}, Lorg/apache/cordova/file/FileUtils;->getFilePlugin()Lorg/apache/cordova/file/FileUtils;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1070
    invoke-static {}, Lorg/apache/cordova/file/FileUtils;->getFilePlugin()Lorg/apache/cordova/file/FileUtils;

    move-result-object v0

    invoke-virtual {v0, p0}, Lorg/apache/cordova/file/FileUtils;->getEntryForFile(Ljava/io/File;)Lorg/json/JSONObject;

    move-result-object p0

    return-object p0

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method private getFile(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;Z)Lorg/json/JSONObject;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/cordova/file/FileExistsException;,
            Ljava/io/IOException;,
            Lorg/apache/cordova/file/TypeMismatchException;,
            Lorg/apache/cordova/file/EncodingException;,
            Lorg/json/JSONException;
        }
    .end annotation

    .line 906
    :try_start_0
    invoke-static {p1}, Lorg/apache/cordova/file/LocalFilesystemURL;->parse(Ljava/lang/String;)Lorg/apache/cordova/file/LocalFilesystemURL;

    move-result-object p1

    .line 908
    invoke-direct {p0, p1}, Lorg/apache/cordova/file/FileUtils;->filesystemForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Lorg/apache/cordova/file/Filesystem;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 912
    invoke-virtual {v0, p1, p2, p3, p4}, Lorg/apache/cordova/file/Filesystem;->getFileForLocalURL(Lorg/apache/cordova/file/LocalFilesystemURL;Ljava/lang/String;Lorg/json/JSONObject;Z)Lorg/json/JSONObject;

    move-result-object p1

    return-object p1

    .line 910
    :cond_0
    new-instance p1, Ljava/net/MalformedURLException;

    const-string p2, "No installed handlers for this URL"

    invoke-direct {p1, p2}, Ljava/net/MalformedURLException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception p1

    .line 915
    new-instance p2, Ljava/net/MalformedURLException;

    const-string p3, "Unrecognized filesystem URL"

    invoke-direct {p2, p3}, Ljava/net/MalformedURLException;-><init>(Ljava/lang/String;)V

    .line 916
    invoke-virtual {p2, p1}, Ljava/net/MalformedURLException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 917
    throw p2
.end method

.method private getFileMetadata(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;,
            Lorg/json/JSONException;,
            Ljava/net/MalformedURLException;
        }
    .end annotation

    .line 949
    :try_start_0
    invoke-static {p1}, Lorg/apache/cordova/file/LocalFilesystemURL;->parse(Ljava/lang/String;)Lorg/apache/cordova/file/LocalFilesystemURL;

    move-result-object p1

    .line 950
    invoke-direct {p0, p1}, Lorg/apache/cordova/file/FileUtils;->filesystemForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Lorg/apache/cordova/file/Filesystem;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 954
    invoke-virtual {v0, p1}, Lorg/apache/cordova/file/Filesystem;->getFileMetadataForLocalURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Lorg/json/JSONObject;

    move-result-object p1

    return-object p1

    .line 952
    :cond_0
    new-instance p1, Ljava/net/MalformedURLException;

    const-string v0, "No installed handlers for this URL"

    invoke-direct {p1, v0}, Ljava/net/MalformedURLException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception p1

    .line 957
    new-instance v0, Ljava/net/MalformedURLException;

    const-string v1, "Unrecognized filesystem URL"

    invoke-direct {v0, v1}, Ljava/net/MalformedURLException;-><init>(Ljava/lang/String;)V

    .line 958
    invoke-virtual {v0, p1}, Ljava/net/MalformedURLException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 959
    throw v0
.end method

.method public static getFilePlugin()Lorg/apache/cordova/file/FileUtils;
    .locals 1

    .line 248
    sget-object v0, Lorg/apache/cordova/file/FileUtils;->filePlugin:Lorg/apache/cordova/file/FileUtils;

    return-object v0
.end method

.method private getMimeType(Landroid/net/Uri;)Ljava/lang/String;
    .locals 1

    .line 1263
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/webkit/MimeTypeMap;->getFileExtensionFromUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p1

    .line 1264
    invoke-static {}, Landroid/webkit/MimeTypeMap;->getSingleton()Landroid/webkit/MimeTypeMap;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/webkit/MimeTypeMap;->getMimeTypeFromExtension(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private getParent(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 928
    :try_start_0
    invoke-static {p1}, Lorg/apache/cordova/file/LocalFilesystemURL;->parse(Ljava/lang/String;)Lorg/apache/cordova/file/LocalFilesystemURL;

    move-result-object p1

    .line 929
    invoke-direct {p0, p1}, Lorg/apache/cordova/file/FileUtils;->filesystemForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Lorg/apache/cordova/file/Filesystem;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 933
    invoke-virtual {v0, p1}, Lorg/apache/cordova/file/Filesystem;->getParentForLocalURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Lorg/json/JSONObject;

    move-result-object p1

    return-object p1

    .line 931
    :cond_0
    new-instance p1, Ljava/net/MalformedURLException;

    const-string v0, "No installed handlers for this URL"

    invoke-direct {p1, v0}, Ljava/net/MalformedURLException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception p1

    .line 936
    new-instance v0, Ljava/net/MalformedURLException;

    const-string v1, "Unrecognized filesystem URL"

    invoke-direct {v0, v1}, Ljava/net/MalformedURLException;-><init>(Ljava/lang/String;)V

    .line 937
    invoke-virtual {v0, p1}, Ljava/net/MalformedURLException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 938
    throw v0
.end method

.method private getReadPermission(Ljava/lang/String;ILorg/apache/cordova/CallbackContext;)V
    .locals 1

    .line 579
    iget-object v0, p0, Lorg/apache/cordova/file/FileUtils;->pendingRequests:Lorg/apache/cordova/file/PendingRequests;

    invoke-virtual {v0, p1, p2, p3}, Lorg/apache/cordova/file/PendingRequests;->createRequest(Ljava/lang/String;ILorg/apache/cordova/CallbackContext;)I

    move-result p1

    .line 580
    const-string p2, "android.permission.READ_EXTERNAL_STORAGE"

    invoke-static {p0, p1, p2}, Lorg/apache/cordova/PermissionHelper;->requestPermission(Lorg/apache/cordova/CordovaPlugin;ILjava/lang/String;)V

    return-void
.end method

.method private getWritePermission(Ljava/lang/String;ILorg/apache/cordova/CallbackContext;)V
    .locals 1

    .line 584
    iget-object v0, p0, Lorg/apache/cordova/file/FileUtils;->pendingRequests:Lorg/apache/cordova/file/PendingRequests;

    invoke-virtual {v0, p1, p2, p3}, Lorg/apache/cordova/file/PendingRequests;->createRequest(Ljava/lang/String;ILorg/apache/cordova/CallbackContext;)I

    move-result p1

    .line 585
    const-string p2, "android.permission.WRITE_EXTERNAL_STORAGE"

    invoke-static {p0, p1, p2}, Lorg/apache/cordova/PermissionHelper;->requestPermission(Lorg/apache/cordova/CordovaPlugin;ILjava/lang/String;)V

    return-void
.end method

.method private hasReadPermission()Z
    .locals 1

    .line 589
    const-string v0, "android.permission.READ_EXTERNAL_STORAGE"

    invoke-static {p0, v0}, Lorg/apache/cordova/PermissionHelper;->hasPermission(Lorg/apache/cordova/CordovaPlugin;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method private hasWritePermission()Z
    .locals 1

    .line 593
    const-string v0, "android.permission.WRITE_EXTERNAL_STORAGE"

    invoke-static {p0, v0}, Lorg/apache/cordova/PermissionHelper;->hasPermission(Lorg/apache/cordova/CordovaPlugin;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method private needPermission(Ljava/lang/String;I)Z
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 597
    invoke-direct {p0}, Lorg/apache/cordova/file/FileUtils;->requestAllPaths()Lorg/json/JSONObject;

    move-result-object v0

    .line 598
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 599
    const-string v2, "applicationDirectory"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 600
    const-string v2, "applicationStorageDirectory"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 601
    const-string v2, "externalApplicationStorageDirectory"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 602
    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_0
    const/4 v0, 0x4

    const/4 v2, 0x0

    if-ne p2, v0, :cond_1

    .line 605
    invoke-direct {p0}, Lorg/apache/cordova/file/FileUtils;->hasReadPermission()Z

    move-result v0

    if-eqz v0, :cond_1

    return v2

    :cond_1
    const/4 v0, 0x3

    if-ne p2, v0, :cond_2

    .line 608
    invoke-direct {p0}, Lorg/apache/cordova/file/FileUtils;->hasWritePermission()Z

    move-result p2

    if-eqz p2, :cond_2

    return v2

    .line 613
    :cond_2
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :cond_3
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 614
    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    return v2

    :cond_4
    const/4 p1, 0x1

    return p1
.end method

.method private readEntries(Ljava/lang/String;)Lorg/json/JSONArray;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;,
            Lorg/json/JSONException;,
            Ljava/net/MalformedURLException;
        }
    .end annotation

    .line 779
    :try_start_0
    invoke-static {p1}, Lorg/apache/cordova/file/LocalFilesystemURL;->parse(Ljava/lang/String;)Lorg/apache/cordova/file/LocalFilesystemURL;

    move-result-object p1

    .line 780
    invoke-direct {p0, p1}, Lorg/apache/cordova/file/FileUtils;->filesystemForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Lorg/apache/cordova/file/Filesystem;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 784
    invoke-virtual {v0, p1}, Lorg/apache/cordova/file/Filesystem;->readEntriesAtLocalURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Lorg/json/JSONArray;

    move-result-object p1

    return-object p1

    .line 782
    :cond_0
    new-instance p1, Ljava/net/MalformedURLException;

    const-string v0, "No installed handlers for this URL"

    invoke-direct {p1, v0}, Ljava/net/MalformedURLException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception p1

    .line 787
    new-instance v0, Ljava/net/MalformedURLException;

    const-string v1, "Unrecognized filesystem URL"

    invoke-direct {v0, v1}, Ljava/net/MalformedURLException;-><init>(Ljava/lang/String;)V

    .line 788
    invoke-virtual {v0, p1}, Ljava/net/MalformedURLException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 789
    throw v0
.end method

.method private remove(Ljava/lang/String;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/cordova/file/NoModificationAllowedException;,
            Lorg/apache/cordova/file/InvalidModificationException;,
            Ljava/net/MalformedURLException;
        }
    .end annotation

    .line 870
    :try_start_0
    invoke-static {p1}, Lorg/apache/cordova/file/LocalFilesystemURL;->parse(Ljava/lang/String;)Lorg/apache/cordova/file/LocalFilesystemURL;

    move-result-object p1

    .line 872
    const-string v0, ""

    iget-object v1, p1, Lorg/apache/cordova/file/LocalFilesystemURL;->path:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "/"

    iget-object v1, p1, Lorg/apache/cordova/file/LocalFilesystemURL;->path:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 877
    invoke-direct {p0, p1}, Lorg/apache/cordova/file/FileUtils;->filesystemForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Lorg/apache/cordova/file/Filesystem;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 881
    invoke-virtual {v0, p1}, Lorg/apache/cordova/file/Filesystem;->removeFileAtLocalURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Z

    move-result p1

    return p1

    .line 879
    :cond_0
    new-instance p1, Ljava/net/MalformedURLException;

    const-string v0, "No installed handlers for this URL"

    invoke-direct {p1, v0}, Ljava/net/MalformedURLException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 874
    :cond_1
    new-instance p1, Lorg/apache/cordova/file/NoModificationAllowedException;

    const-string v0, "You can\'t delete the root directory"

    invoke-direct {p1, v0}, Lorg/apache/cordova/file/NoModificationAllowedException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception p1

    .line 884
    new-instance v0, Ljava/net/MalformedURLException;

    const-string v1, "Unrecognized filesystem URL"

    invoke-direct {v0, v1}, Ljava/net/MalformedURLException;-><init>(Ljava/lang/String;)V

    .line 885
    invoke-virtual {v0, p1}, Ljava/net/MalformedURLException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 886
    throw v0
.end method

.method private removeRecursively(Ljava/lang/String;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/cordova/file/FileExistsException;,
            Lorg/apache/cordova/file/NoModificationAllowedException;,
            Ljava/net/MalformedURLException;
        }
    .end annotation

    .line 839
    :try_start_0
    invoke-static {p1}, Lorg/apache/cordova/file/LocalFilesystemURL;->parse(Ljava/lang/String;)Lorg/apache/cordova/file/LocalFilesystemURL;

    move-result-object p1

    .line 841
    const-string v0, ""

    iget-object v1, p1, Lorg/apache/cordova/file/LocalFilesystemURL;->path:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "/"

    iget-object v1, p1, Lorg/apache/cordova/file/LocalFilesystemURL;->path:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 845
    invoke-direct {p0, p1}, Lorg/apache/cordova/file/FileUtils;->filesystemForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Lorg/apache/cordova/file/Filesystem;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 849
    invoke-virtual {v0, p1}, Lorg/apache/cordova/file/Filesystem;->recursiveRemoveFileAtLocalURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Z

    move-result p1

    return p1

    .line 847
    :cond_0
    new-instance p1, Ljava/net/MalformedURLException;

    const-string v0, "No installed handlers for this URL"

    invoke-direct {p1, v0}, Ljava/net/MalformedURLException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 842
    :cond_1
    new-instance p1, Lorg/apache/cordova/file/NoModificationAllowedException;

    const-string v0, "You can\'t delete the root directory"

    invoke-direct {p1, v0}, Lorg/apache/cordova/file/NoModificationAllowedException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception p1

    .line 852
    new-instance v0, Ljava/net/MalformedURLException;

    const-string v1, "Unrecognized filesystem URL"

    invoke-direct {v0, v1}, Ljava/net/MalformedURLException;-><init>(Ljava/lang/String;)V

    .line 853
    invoke-virtual {v0, p1}, Ljava/net/MalformedURLException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 854
    throw v0
.end method

.method private requestAllFileSystems()Lorg/json/JSONArray;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/json/JSONException;
        }
    .end annotation

    .line 1004
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 1005
    iget-object v1, p0, Lorg/apache/cordova/file/FileUtils;->filesystems:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/cordova/file/Filesystem;

    .line 1006
    invoke-virtual {v2}, Lorg/apache/cordova/file/Filesystem;->getRootEntry()Lorg/json/JSONObject;

    move-result-object v2

    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method private requestAllPaths()Lorg/json/JSONObject;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 1016
    iget-object v0, p0, Lorg/apache/cordova/file/FileUtils;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroidx/appcompat/app/AppCompatActivity;

    move-result-object v0

    .line 1017
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 1018
    const-string v2, "applicationDirectory"

    const-string v3, "file:///android_asset/"

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1019
    invoke-virtual {v0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v2

    invoke-static {v2}, Lorg/apache/cordova/file/FileUtils;->toDirUrl(Ljava/io/File;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "applicationStorageDirectory"

    invoke-virtual {v1, v3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1020
    invoke-virtual {v0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v2

    invoke-static {v2}, Lorg/apache/cordova/file/FileUtils;->toDirUrl(Ljava/io/File;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "dataDirectory"

    invoke-virtual {v1, v3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1021
    invoke-virtual {v0}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v2

    invoke-static {v2}, Lorg/apache/cordova/file/FileUtils;->toDirUrl(Ljava/io/File;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "cacheDirectory"

    invoke-virtual {v1, v3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1022
    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v2

    const-string v3, "mounted"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1024
    :try_start_0
    const-string v2, "externalApplicationStorageDirectory"

    const/4 v3, 0x0

    invoke-virtual {v0, v3}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v4

    invoke-static {v4}, Lorg/apache/cordova/file/FileUtils;->toDirUrl(Ljava/io/File;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v2, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1025
    const-string v2, "externalDataDirectory"

    invoke-virtual {v0, v3}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v3

    invoke-static {v3}, Lorg/apache/cordova/file/FileUtils;->toDirUrl(Ljava/io/File;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1026
    const-string v2, "externalCacheDirectory"

    invoke-virtual {v0}, Landroid/content/Context;->getExternalCacheDir()Ljava/io/File;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/cordova/file/FileUtils;->toDirUrl(Ljava/io/File;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1027
    const-string v0, "externalRootDirectory"

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v2

    invoke-static {v2}, Lorg/apache/cordova/file/FileUtils;->toDirUrl(Ljava/io/File;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1031
    :catch_0
    const-string v0, "FileUtils"

    const-string v2, "Unable to access these paths, most liklely due to USB storage"

    invoke-static {v0, v2}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    :goto_0
    return-object v1
.end method

.method private requestFileSystem(IJLorg/apache/cordova/CallbackContext;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 974
    :try_start_0
    iget-object v0, p0, Lorg/apache/cordova/file/FileUtils;->filesystems:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/apache/cordova/file/Filesystem;
    :try_end_0
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const/4 p1, 0x0

    :goto_0
    if-nez p1, :cond_0

    .line 979
    new-instance p1, Lorg/apache/cordova/PluginResult;

    sget-object p2, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    sget p3, Lorg/apache/cordova/file/FileUtils;->NOT_FOUND_ERR:I

    invoke-direct {p1, p2, p3}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;I)V

    invoke-virtual {p4, p1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto :goto_1

    :cond_0
    const-wide/16 v0, 0x0

    cmp-long v2, p2, v0

    if-lez v2, :cond_1

    .line 984
    invoke-virtual {p1}, Lorg/apache/cordova/file/Filesystem;->getFreeSpaceInBytes()J

    move-result-wide v0

    :cond_1
    cmp-long p2, v0, p2

    if-gez p2, :cond_2

    .line 988
    new-instance p1, Lorg/apache/cordova/PluginResult;

    sget-object p2, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    sget p3, Lorg/apache/cordova/file/FileUtils;->QUOTA_EXCEEDED_ERR:I

    invoke-direct {p1, p2, p3}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;I)V

    invoke-virtual {p4, p1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto :goto_1

    .line 990
    :cond_2
    new-instance p2, Lorg/json/JSONObject;

    invoke-direct {p2}, Lorg/json/JSONObject;-><init>()V

    .line 991
    const-string p3, "name"

    iget-object v0, p1, Lorg/apache/cordova/file/Filesystem;->name:Ljava/lang/String;

    invoke-virtual {p2, p3, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 992
    const-string p3, "root"

    invoke-virtual {p1}, Lorg/apache/cordova/file/Filesystem;->getRootEntry()Lorg/json/JSONObject;

    move-result-object p1

    invoke-virtual {p2, p3, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 993
    invoke-virtual {p4, p2}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONObject;)V

    :goto_1
    return-void
.end method

.method private resolveLocalFileSystemURI(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/json/JSONException;
        }
    .end annotation

    .line 734
    const-string v0, "Unrecognized filesystem URL"

    if-eqz p1, :cond_4

    .line 737
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    .line 740
    invoke-static {p1}, Lorg/apache/cordova/file/LocalFilesystemURL;->parse(Landroid/net/Uri;)Lorg/apache/cordova/file/LocalFilesystemURL;

    move-result-object v1

    if-nez v1, :cond_0

    .line 743
    invoke-virtual {p0, p1}, Lorg/apache/cordova/file/FileUtils;->resolveNativeUri(Landroid/net/Uri;)Lorg/apache/cordova/file/LocalFilesystemURL;

    move-result-object v1

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 748
    :goto_0
    :try_start_0
    invoke-direct {p0, v1}, Lorg/apache/cordova/file/FileUtils;->filesystemForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Lorg/apache/cordova/file/Filesystem;

    move-result-object v2

    if-eqz v2, :cond_3

    .line 752
    invoke-virtual {v2, v1}, Lorg/apache/cordova/file/Filesystem;->exists(Lorg/apache/cordova/file/LocalFilesystemURL;)Z

    move-result v3

    if-eqz v3, :cond_2

    if-nez p1, :cond_1

    .line 756
    invoke-virtual {v2, v1}, Lorg/apache/cordova/file/Filesystem;->toNativeUri(Lorg/apache/cordova/file/LocalFilesystemURL;)Landroid/net/Uri;

    move-result-object p1

    invoke-virtual {v2, p1}, Lorg/apache/cordova/file/Filesystem;->toLocalUri(Landroid/net/Uri;)Lorg/apache/cordova/file/LocalFilesystemURL;

    move-result-object v1

    .line 759
    :cond_1
    invoke-virtual {v2, v1}, Lorg/apache/cordova/file/Filesystem;->getEntryForLocalURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Lorg/json/JSONObject;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    .line 766
    :cond_2
    new-instance p1, Ljava/io/FileNotFoundException;

    invoke-direct {p1}, Ljava/io/FileNotFoundException;-><init>()V

    throw p1

    .line 750
    :cond_3
    :try_start_1
    new-instance p1, Ljava/net/MalformedURLException;

    const-string v1, "No installed handlers for this URL"

    invoke-direct {p1, v1}, Ljava/net/MalformedURLException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_0

    :catch_0
    move-exception p1

    .line 762
    new-instance v1, Ljava/net/MalformedURLException;

    invoke-direct {v1, v0}, Ljava/net/MalformedURLException;-><init>(Ljava/lang/String;)V

    .line 763
    invoke-virtual {v1, p1}, Ljava/net/MalformedURLException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 764
    throw v1

    .line 735
    :cond_4
    new-instance p1, Ljava/net/MalformedURLException;

    invoke-direct {p1, v0}, Ljava/net/MalformedURLException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private threadhelper(Lorg/apache/cordova/file/FileUtils$FileOp;Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V
    .locals 2

    .line 686
    iget-object v0, p0, Lorg/apache/cordova/file/FileUtils;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaInterface;->getThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    new-instance v1, Lorg/apache/cordova/file/FileUtils$25;

    invoke-direct {v1, p0, p2, p1, p3}, Lorg/apache/cordova/file/FileUtils$25;-><init>(Lorg/apache/cordova/file/FileUtils;Ljava/lang/String;Lorg/apache/cordova/file/FileUtils$FileOp;Lorg/apache/cordova/CallbackContext;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method private static toDirUrl(Ljava/io/File;)Ljava/lang/String;
    .locals 1

    .line 1012
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p0}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object p0

    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const/16 v0, 0x2f

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private transferTo(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lorg/json/JSONObject;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;,
            Lorg/apache/cordova/file/NoModificationAllowedException;,
            Ljava/io/IOException;,
            Lorg/apache/cordova/file/InvalidModificationException;,
            Lorg/apache/cordova/file/EncodingException;,
            Lorg/apache/cordova/file/FileExistsException;
        }
    .end annotation

    if-eqz p1, :cond_2

    if-eqz p2, :cond_2

    .line 812
    invoke-static {p1}, Lorg/apache/cordova/file/LocalFilesystemURL;->parse(Ljava/lang/String;)Lorg/apache/cordova/file/LocalFilesystemURL;

    move-result-object v4

    .line 813
    invoke-static {p2}, Lorg/apache/cordova/file/LocalFilesystemURL;->parse(Ljava/lang/String;)Lorg/apache/cordova/file/LocalFilesystemURL;

    move-result-object v1

    .line 815
    invoke-direct {p0, v4}, Lorg/apache/cordova/file/FileUtils;->filesystemForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Lorg/apache/cordova/file/Filesystem;

    move-result-object v3

    .line 816
    invoke-direct {p0, v1}, Lorg/apache/cordova/file/FileUtils;->filesystemForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Lorg/apache/cordova/file/Filesystem;

    move-result-object v0

    if-eqz p3, :cond_1

    .line 819
    const-string p1, ":"

    invoke-virtual {p3, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_0

    goto :goto_0

    .line 820
    :cond_0
    new-instance p1, Lorg/apache/cordova/file/EncodingException;

    const-string p2, "Bad file name"

    invoke-direct {p1, p2}, Lorg/apache/cordova/file/EncodingException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    :goto_0
    move-object v2, p3

    move v5, p4

    .line 823
    invoke-virtual/range {v0 .. v5}, Lorg/apache/cordova/file/Filesystem;->copyFileToURL(Lorg/apache/cordova/file/LocalFilesystemURL;Ljava/lang/String;Lorg/apache/cordova/file/Filesystem;Lorg/apache/cordova/file/LocalFilesystemURL;Z)Lorg/json/JSONObject;

    move-result-object p1

    return-object p1

    .line 809
    :cond_2
    new-instance p1, Ljava/io/FileNotFoundException;

    invoke-direct {p1}, Ljava/io/FileNotFoundException;-><init>()V

    throw p1
.end method

.method private truncateFile(Ljava/lang/String;J)J
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;,
            Ljava/io/IOException;,
            Lorg/apache/cordova/file/NoModificationAllowedException;
        }
    .end annotation

    .line 1179
    :try_start_0
    invoke-static {p1}, Lorg/apache/cordova/file/LocalFilesystemURL;->parse(Ljava/lang/String;)Lorg/apache/cordova/file/LocalFilesystemURL;

    move-result-object p1

    .line 1180
    invoke-direct {p0, p1}, Lorg/apache/cordova/file/FileUtils;->filesystemForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Lorg/apache/cordova/file/Filesystem;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1185
    invoke-virtual {v0, p1, p2, p3}, Lorg/apache/cordova/file/Filesystem;->truncateFileAtURL(Lorg/apache/cordova/file/LocalFilesystemURL;J)J

    move-result-wide p1

    return-wide p1

    .line 1182
    :cond_0
    new-instance p1, Ljava/net/MalformedURLException;

    const-string p2, "No installed handlers for this URL"

    invoke-direct {p1, p2}, Ljava/net/MalformedURLException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception p1

    .line 1187
    new-instance p2, Ljava/net/MalformedURLException;

    const-string p3, "Unrecognized filesystem URL"

    invoke-direct {p2, p3}, Ljava/net/MalformedURLException;-><init>(Ljava/lang/String;)V

    .line 1188
    invoke-virtual {p2, p1}, Ljava/net/MalformedURLException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 1189
    throw p2
.end method


# virtual methods
.method public execute(Ljava/lang/String;Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)Z
    .locals 2

    .line 281
    iget-boolean v0, p0, Lorg/apache/cordova/file/FileUtils;->configured:Z

    const/4 v1, 0x1

    if-nez v0, :cond_0

    .line 282
    new-instance p1, Lorg/apache/cordova/PluginResult;

    sget-object p2, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    const-string v0, "File plugin is not configured. Please see the README.md file for details on how to update config.xml"

    invoke-direct {p1, p2, v0}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Ljava/lang/String;)V

    invoke-virtual {p3, p1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    return v1

    .line 286
    :cond_0
    const-string v0, "testSaveLocationExists"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 287
    new-instance p1, Lorg/apache/cordova/file/FileUtils$1;

    invoke-direct {p1, p0, p3}, Lorg/apache/cordova/file/FileUtils$1;-><init>(Lorg/apache/cordova/file/FileUtils;Lorg/apache/cordova/CallbackContext;)V

    invoke-direct {p0, p1, p2, p3}, Lorg/apache/cordova/file/FileUtils;->threadhelper(Lorg/apache/cordova/file/FileUtils$FileOp;Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V

    goto/16 :goto_0

    .line 295
    :cond_1
    const-string v0, "getFreeDiskSpace"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 296
    new-instance p1, Lorg/apache/cordova/file/FileUtils$2;

    invoke-direct {p1, p0, p3}, Lorg/apache/cordova/file/FileUtils$2;-><init>(Lorg/apache/cordova/file/FileUtils;Lorg/apache/cordova/CallbackContext;)V

    invoke-direct {p0, p1, p2, p3}, Lorg/apache/cordova/file/FileUtils;->threadhelper(Lorg/apache/cordova/file/FileUtils$FileOp;Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V

    goto/16 :goto_0

    .line 306
    :cond_2
    const-string v0, "testFileExists"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 307
    new-instance p1, Lorg/apache/cordova/file/FileUtils$3;

    invoke-direct {p1, p0, p3}, Lorg/apache/cordova/file/FileUtils$3;-><init>(Lorg/apache/cordova/file/FileUtils;Lorg/apache/cordova/CallbackContext;)V

    invoke-direct {p0, p1, p2, p3}, Lorg/apache/cordova/file/FileUtils;->threadhelper(Lorg/apache/cordova/file/FileUtils$FileOp;Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V

    goto/16 :goto_0

    .line 315
    :cond_3
    const-string v0, "testDirectoryExists"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 316
    new-instance p1, Lorg/apache/cordova/file/FileUtils$4;

    invoke-direct {p1, p0, p3}, Lorg/apache/cordova/file/FileUtils$4;-><init>(Lorg/apache/cordova/file/FileUtils;Lorg/apache/cordova/CallbackContext;)V

    invoke-direct {p0, p1, p2, p3}, Lorg/apache/cordova/file/FileUtils;->threadhelper(Lorg/apache/cordova/file/FileUtils$FileOp;Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V

    goto/16 :goto_0

    .line 324
    :cond_4
    const-string v0, "readAsText"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 325
    new-instance p1, Lorg/apache/cordova/file/FileUtils$5;

    invoke-direct {p1, p0, p3}, Lorg/apache/cordova/file/FileUtils$5;-><init>(Lorg/apache/cordova/file/FileUtils;Lorg/apache/cordova/CallbackContext;)V

    invoke-direct {p0, p1, p2, p3}, Lorg/apache/cordova/file/FileUtils;->threadhelper(Lorg/apache/cordova/file/FileUtils$FileOp;Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V

    goto/16 :goto_0

    .line 335
    :cond_5
    const-string v0, "readAsDataURL"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 336
    new-instance p1, Lorg/apache/cordova/file/FileUtils$6;

    invoke-direct {p1, p0, p3}, Lorg/apache/cordova/file/FileUtils$6;-><init>(Lorg/apache/cordova/file/FileUtils;Lorg/apache/cordova/CallbackContext;)V

    invoke-direct {p0, p1, p2, p3}, Lorg/apache/cordova/file/FileUtils;->threadhelper(Lorg/apache/cordova/file/FileUtils$FileOp;Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V

    goto/16 :goto_0

    .line 345
    :cond_6
    const-string v0, "readAsArrayBuffer"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 346
    new-instance p1, Lorg/apache/cordova/file/FileUtils$7;

    invoke-direct {p1, p0, p3}, Lorg/apache/cordova/file/FileUtils$7;-><init>(Lorg/apache/cordova/file/FileUtils;Lorg/apache/cordova/CallbackContext;)V

    invoke-direct {p0, p1, p2, p3}, Lorg/apache/cordova/file/FileUtils;->threadhelper(Lorg/apache/cordova/file/FileUtils$FileOp;Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V

    goto/16 :goto_0

    .line 355
    :cond_7
    const-string v0, "readAsBinaryString"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 356
    new-instance p1, Lorg/apache/cordova/file/FileUtils$8;

    invoke-direct {p1, p0, p3}, Lorg/apache/cordova/file/FileUtils$8;-><init>(Lorg/apache/cordova/file/FileUtils;Lorg/apache/cordova/CallbackContext;)V

    invoke-direct {p0, p1, p2, p3}, Lorg/apache/cordova/file/FileUtils;->threadhelper(Lorg/apache/cordova/file/FileUtils$FileOp;Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V

    goto/16 :goto_0

    .line 365
    :cond_8
    const-string v0, "write"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 366
    new-instance p1, Lorg/apache/cordova/file/FileUtils$9;

    invoke-direct {p1, p0, p2, p3}, Lorg/apache/cordova/file/FileUtils$9;-><init>(Lorg/apache/cordova/file/FileUtils;Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V

    invoke-direct {p0, p1, p2, p3}, Lorg/apache/cordova/file/FileUtils;->threadhelper(Lorg/apache/cordova/file/FileUtils$FileOp;Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V

    goto/16 :goto_0

    .line 385
    :cond_9
    const-string v0, "truncate"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 386
    new-instance p1, Lorg/apache/cordova/file/FileUtils$10;

    invoke-direct {p1, p0, p3}, Lorg/apache/cordova/file/FileUtils$10;-><init>(Lorg/apache/cordova/file/FileUtils;Lorg/apache/cordova/CallbackContext;)V

    invoke-direct {p0, p1, p2, p3}, Lorg/apache/cordova/file/FileUtils;->threadhelper(Lorg/apache/cordova/file/FileUtils$FileOp;Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V

    goto/16 :goto_0

    .line 395
    :cond_a
    const-string v0, "requestAllFileSystems"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 396
    new-instance p1, Lorg/apache/cordova/file/FileUtils$11;

    invoke-direct {p1, p0, p3}, Lorg/apache/cordova/file/FileUtils$11;-><init>(Lorg/apache/cordova/file/FileUtils;Lorg/apache/cordova/CallbackContext;)V

    invoke-direct {p0, p1, p2, p3}, Lorg/apache/cordova/file/FileUtils;->threadhelper(Lorg/apache/cordova/file/FileUtils$FileOp;Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V

    goto/16 :goto_0

    .line 401
    :cond_b
    const-string v0, "requestAllPaths"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c

    .line 402
    iget-object p1, p0, Lorg/apache/cordova/file/FileUtils;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {p1}, Lorg/apache/cordova/CordovaInterface;->getThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object p1

    new-instance p2, Lorg/apache/cordova/file/FileUtils$12;

    invoke-direct {p2, p0, p3}, Lorg/apache/cordova/file/FileUtils$12;-><init>(Lorg/apache/cordova/file/FileUtils;Lorg/apache/cordova/CallbackContext;)V

    invoke-interface {p1, p2}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    goto/16 :goto_0

    .line 414
    :cond_c
    const-string v0, "requestFileSystem"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d

    .line 415
    new-instance p1, Lorg/apache/cordova/file/FileUtils$13;

    invoke-direct {p1, p0, p3}, Lorg/apache/cordova/file/FileUtils$13;-><init>(Lorg/apache/cordova/file/FileUtils;Lorg/apache/cordova/CallbackContext;)V

    invoke-direct {p0, p1, p2, p3}, Lorg/apache/cordova/file/FileUtils;->threadhelper(Lorg/apache/cordova/file/FileUtils$FileOp;Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V

    goto/16 :goto_0

    .line 423
    :cond_d
    const-string v0, "resolveLocalFileSystemURI"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_e

    .line 424
    new-instance p1, Lorg/apache/cordova/file/FileUtils$14;

    invoke-direct {p1, p0, p3}, Lorg/apache/cordova/file/FileUtils$14;-><init>(Lorg/apache/cordova/file/FileUtils;Lorg/apache/cordova/CallbackContext;)V

    invoke-direct {p0, p1, p2, p3}, Lorg/apache/cordova/file/FileUtils;->threadhelper(Lorg/apache/cordova/file/FileUtils$FileOp;Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V

    goto/16 :goto_0

    .line 432
    :cond_e
    const-string v0, "getFileMetadata"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_f

    .line 433
    new-instance p1, Lorg/apache/cordova/file/FileUtils$15;

    invoke-direct {p1, p0, p3}, Lorg/apache/cordova/file/FileUtils$15;-><init>(Lorg/apache/cordova/file/FileUtils;Lorg/apache/cordova/CallbackContext;)V

    invoke-direct {p0, p1, p2, p3}, Lorg/apache/cordova/file/FileUtils;->threadhelper(Lorg/apache/cordova/file/FileUtils$FileOp;Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V

    goto/16 :goto_0

    .line 441
    :cond_f
    const-string v0, "getParent"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_10

    .line 442
    new-instance p1, Lorg/apache/cordova/file/FileUtils$16;

    invoke-direct {p1, p0, p3}, Lorg/apache/cordova/file/FileUtils$16;-><init>(Lorg/apache/cordova/file/FileUtils;Lorg/apache/cordova/CallbackContext;)V

    invoke-direct {p0, p1, p2, p3}, Lorg/apache/cordova/file/FileUtils;->threadhelper(Lorg/apache/cordova/file/FileUtils$FileOp;Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V

    goto/16 :goto_0

    .line 450
    :cond_10
    const-string v0, "getDirectory"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_11

    .line 451
    new-instance p1, Lorg/apache/cordova/file/FileUtils$17;

    invoke-direct {p1, p0, p2, p3}, Lorg/apache/cordova/file/FileUtils$17;-><init>(Lorg/apache/cordova/file/FileUtils;Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V

    invoke-direct {p0, p1, p2, p3}, Lorg/apache/cordova/file/FileUtils;->threadhelper(Lorg/apache/cordova/file/FileUtils$FileOp;Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V

    goto/16 :goto_0

    .line 471
    :cond_11
    const-string v0, "getFile"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_12

    .line 472
    new-instance p1, Lorg/apache/cordova/file/FileUtils$18;

    invoke-direct {p1, p0, p3, p2}, Lorg/apache/cordova/file/FileUtils$18;-><init>(Lorg/apache/cordova/file/FileUtils;Lorg/apache/cordova/CallbackContext;Ljava/lang/String;)V

    invoke-direct {p0, p1, p2, p3}, Lorg/apache/cordova/file/FileUtils;->threadhelper(Lorg/apache/cordova/file/FileUtils$FileOp;Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V

    goto :goto_0

    .line 498
    :cond_12
    const-string v0, "remove"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_13

    .line 499
    new-instance p1, Lorg/apache/cordova/file/FileUtils$19;

    invoke-direct {p1, p0, p3}, Lorg/apache/cordova/file/FileUtils$19;-><init>(Lorg/apache/cordova/file/FileUtils;Lorg/apache/cordova/CallbackContext;)V

    invoke-direct {p0, p1, p2, p3}, Lorg/apache/cordova/file/FileUtils;->threadhelper(Lorg/apache/cordova/file/FileUtils$FileOp;Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V

    goto :goto_0

    .line 511
    :cond_13
    const-string v0, "removeRecursively"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_14

    .line 512
    new-instance p1, Lorg/apache/cordova/file/FileUtils$20;

    invoke-direct {p1, p0, p3}, Lorg/apache/cordova/file/FileUtils$20;-><init>(Lorg/apache/cordova/file/FileUtils;Lorg/apache/cordova/CallbackContext;)V

    invoke-direct {p0, p1, p2, p3}, Lorg/apache/cordova/file/FileUtils;->threadhelper(Lorg/apache/cordova/file/FileUtils$FileOp;Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V

    goto :goto_0

    .line 524
    :cond_14
    const-string v0, "moveTo"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_15

    .line 525
    new-instance p1, Lorg/apache/cordova/file/FileUtils$21;

    invoke-direct {p1, p0, p3}, Lorg/apache/cordova/file/FileUtils$21;-><init>(Lorg/apache/cordova/file/FileUtils;Lorg/apache/cordova/CallbackContext;)V

    invoke-direct {p0, p1, p2, p3}, Lorg/apache/cordova/file/FileUtils;->threadhelper(Lorg/apache/cordova/file/FileUtils$FileOp;Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V

    goto :goto_0

    .line 535
    :cond_15
    const-string v0, "copyTo"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_16

    .line 536
    new-instance p1, Lorg/apache/cordova/file/FileUtils$22;

    invoke-direct {p1, p0, p3}, Lorg/apache/cordova/file/FileUtils$22;-><init>(Lorg/apache/cordova/file/FileUtils;Lorg/apache/cordova/CallbackContext;)V

    invoke-direct {p0, p1, p2, p3}, Lorg/apache/cordova/file/FileUtils;->threadhelper(Lorg/apache/cordova/file/FileUtils$FileOp;Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V

    goto :goto_0

    .line 546
    :cond_16
    const-string v0, "readEntries"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_17

    .line 547
    new-instance p1, Lorg/apache/cordova/file/FileUtils$23;

    invoke-direct {p1, p0, p2, p3}, Lorg/apache/cordova/file/FileUtils$23;-><init>(Lorg/apache/cordova/file/FileUtils;Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V

    invoke-direct {p0, p1, p2, p3}, Lorg/apache/cordova/file/FileUtils;->threadhelper(Lorg/apache/cordova/file/FileUtils$FileOp;Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V

    goto :goto_0

    .line 561
    :cond_17
    const-string v0, "_getLocalFilesystemPath"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_18

    .line 564
    new-instance p1, Lorg/apache/cordova/file/FileUtils$24;

    invoke-direct {p1, p0, p3}, Lorg/apache/cordova/file/FileUtils$24;-><init>(Lorg/apache/cordova/file/FileUtils;Lorg/apache/cordova/CallbackContext;)V

    invoke-direct {p0, p1, p2, p3}, Lorg/apache/cordova/file/FileUtils;->threadhelper(Lorg/apache/cordova/file/FileUtils$FileOp;Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V

    :goto_0
    return v1

    :cond_18
    const/4 p1, 0x0

    return p1
.end method

.method public filesystemPathForURL(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/MalformedURLException;
        }
    .end annotation

    .line 648
    :try_start_0
    invoke-static {p1}, Lorg/apache/cordova/file/LocalFilesystemURL;->parse(Ljava/lang/String;)Lorg/apache/cordova/file/LocalFilesystemURL;

    move-result-object p1

    .line 649
    invoke-direct {p0, p1}, Lorg/apache/cordova/file/FileUtils;->filesystemForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Lorg/apache/cordova/file/Filesystem;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 653
    invoke-virtual {v0, p1}, Lorg/apache/cordova/file/Filesystem;->filesystemPathForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 651
    :cond_0
    new-instance p1, Ljava/net/MalformedURLException;

    const-string v0, "No installed handlers for this URL"

    invoke-direct {p1, v0}, Ljava/net/MalformedURLException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception p1

    .line 655
    new-instance v0, Ljava/net/MalformedURLException;

    const-string v1, "Unrecognized filesystem URL"

    invoke-direct {v0, v1}, Ljava/net/MalformedURLException;-><init>(Ljava/lang/String;)V

    .line 656
    invoke-virtual {v0, p1}, Ljava/net/MalformedURLException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 657
    throw v0
.end method

.method public filesystemURLforLocalPath(Ljava/lang/String;)Lorg/apache/cordova/file/LocalFilesystemURL;
    .locals 5

    .line 667
    iget-object v0, p0, Lorg/apache/cordova/file/FileUtils;->filesystems:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/cordova/file/Filesystem;

    .line 668
    invoke-virtual {v3, p1}, Lorg/apache/cordova/file/Filesystem;->URLforFilesystemPath(Ljava/lang/String;)Lorg/apache/cordova/file/LocalFilesystemURL;

    move-result-object v3

    if-eqz v3, :cond_0

    if-eqz v1, :cond_1

    .line 672
    iget-object v4, v3, Lorg/apache/cordova/file/LocalFilesystemURL;->path:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v4, v2, :cond_0

    .line 674
    :cond_1
    iget-object v1, v3, Lorg/apache/cordova/file/LocalFilesystemURL;->path:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    move v2, v1

    move-object v1, v3

    goto :goto_0

    :cond_2
    return-object v1
.end method

.method protected getAvailableFileSystems(Landroid/app/Activity;)Ljava/util/HashMap;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            ")",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 162
    invoke-virtual {p1}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    .line 163
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 165
    invoke-virtual {p1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    const-string v2, "files"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 166
    new-instance v1, Ljava/io/File;

    invoke-virtual {p1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v2

    const-string v3, "Documents"

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    const-string v2, "documents"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 167
    invoke-virtual {p1}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    const-string v2, "cache"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 168
    const-string v1, "root"

    const-string v2, "/"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 169
    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v1

    const-string v2, "mounted"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 171
    :try_start_0
    const-string v1, "files-external"

    const/4 v2, 0x0

    invoke-virtual {p1, v2}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 172
    const-string v1, "sdcard"

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 173
    const-string v1, "cache-external"

    invoke-virtual {p1}, Landroid/content/Context;->getExternalCacheDir()Ljava/io/File;

    move-result-object p1

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 176
    :catch_0
    const-string p1, "FileUtils"

    const-string v1, "External storage unavailable, check to see if USB Mass Storage Mode is on"

    invoke-static {p1, v1}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    :goto_0
    return-object v0
.end method

.method public getEntryForFile(Ljava/io/File;)Lorg/json/JSONObject;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 1048
    iget-object v0, p0, Lorg/apache/cordova/file/FileUtils;->filesystems:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/cordova/file/Filesystem;

    .line 1049
    invoke-virtual {v1, p1}, Lorg/apache/cordova/file/Filesystem;->makeEntryForFile(Ljava/io/File;)Lorg/json/JSONObject;

    move-result-object v1

    if-eqz v1, :cond_0

    return-object v1

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method protected getExtraFileSystemsPreference(Landroid/app/Activity;)[Ljava/lang/String;
    .locals 2

    .line 135
    iget-object p1, p0, Lorg/apache/cordova/file/FileUtils;->preferences:Lorg/apache/cordova/CordovaPreferences;

    const-string v0, "androidextrafilesystems"

    const-string v1, "files,files-external,documents,sdcard,cache,cache-external,assets,root"

    invoke-virtual {p1, v0, v1}, Lorg/apache/cordova/CordovaPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 136
    const-string v0, ","

    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getPathHandler()Lorg/apache/cordova/CordovaPluginPathHandler;
    .locals 2

    .line 1268
    new-instance v0, Lorg/apache/cordova/file/FileUtils$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Lorg/apache/cordova/file/FileUtils$$ExternalSyntheticLambda0;-><init>(Lorg/apache/cordova/file/FileUtils;)V

    .line 1339
    new-instance v1, Lorg/apache/cordova/CordovaPluginPathHandler;

    invoke-direct {v1, v0}, Lorg/apache/cordova/CordovaPluginPathHandler;-><init>(Landroidx/webkit/WebViewAssetLoader$PathHandler;)V

    return-object v1
.end method

.method public initialize(Lorg/apache/cordova/CordovaInterface;Lorg/apache/cordova/CordovaWebView;)V
    .locals 16

    move-object/from16 v0, p0

    .line 185
    invoke-super/range {p0 .. p2}, Lorg/apache/cordova/CordovaPlugin;->initialize(Lorg/apache/cordova/CordovaInterface;Lorg/apache/cordova/CordovaWebView;)V

    .line 186
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, v0, Lorg/apache/cordova/file/FileUtils;->filesystems:Ljava/util/ArrayList;

    .line 187
    new-instance v1, Lorg/apache/cordova/file/PendingRequests;

    invoke-direct {v1}, Lorg/apache/cordova/file/PendingRequests;-><init>()V

    iput-object v1, v0, Lorg/apache/cordova/file/FileUtils;->pendingRequests:Lorg/apache/cordova/file/PendingRequests;

    .line 192
    invoke-interface/range {p1 .. p1}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroidx/appcompat/app/AppCompatActivity;

    move-result-object v1

    .line 193
    invoke-virtual {v1}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v2

    .line 195
    iget-object v3, v0, Lorg/apache/cordova/file/FileUtils;->preferences:Lorg/apache/cordova/CordovaPreferences;

    const-string v4, "androidpersistentfilelocation"

    const-string v5, "internal"

    invoke-virtual {v3, v4, v5}, Lorg/apache/cordova/CordovaPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 197
    invoke-virtual {v1}, Landroid/app/Activity;->getCacheDir()Ljava/io/File;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    .line 198
    invoke-virtual {v5, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    const/4 v6, 0x1

    if-eqz v5, :cond_0

    .line 199
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Landroid/app/Activity;->getFilesDir()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/files/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 200
    iput-boolean v6, v0, Lorg/apache/cordova/file/FileUtils;->configured:Z

    goto :goto_1

    .line 201
    :cond_0
    const-string v5, "compatibility"

    invoke-virtual {v5, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 209
    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v3

    const-string v5, "mounted"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 210
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    .line 211
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v5

    invoke-virtual {v5}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "/Android/data/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, "/cache/"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    move-object v2, v3

    goto :goto_0

    .line 214
    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v5, "/data/data/"

    invoke-direct {v3, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 216
    :goto_0
    iput-boolean v6, v0, Lorg/apache/cordova/file/FileUtils;->configured:Z

    goto :goto_1

    :cond_2
    const/4 v2, 0x0

    .line 219
    :goto_1
    iget-boolean v3, v0, Lorg/apache/cordova/file/FileUtils;->configured:Z

    if-eqz v3, :cond_3

    .line 221
    new-instance v9, Ljava/io/File;

    invoke-direct {v9, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 222
    new-instance v14, Ljava/io/File;

    invoke-direct {v14, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 223
    invoke-virtual {v9}, Ljava/io/File;->mkdirs()Z

    .line 224
    invoke-virtual {v14}, Ljava/io/File;->mkdirs()Z

    .line 230
    new-instance v2, Lorg/apache/cordova/file/LocalFilesystem;

    invoke-interface/range {p2 .. p2}, Lorg/apache/cordova/CordovaWebView;->getContext()Landroid/content/Context;

    move-result-object v7

    invoke-interface/range {p2 .. p2}, Lorg/apache/cordova/CordovaWebView;->getResourceApi()Lorg/apache/cordova/CordovaResourceApi;

    move-result-object v8

    iget-object v10, v0, Lorg/apache/cordova/file/FileUtils;->preferences:Lorg/apache/cordova/CordovaPreferences;

    const-string v6, "temporary"

    move-object v5, v2

    invoke-direct/range {v5 .. v10}, Lorg/apache/cordova/file/LocalFilesystem;-><init>(Ljava/lang/String;Landroid/content/Context;Lorg/apache/cordova/CordovaResourceApi;Ljava/io/File;Lorg/apache/cordova/CordovaPreferences;)V

    invoke-virtual {v0, v2}, Lorg/apache/cordova/file/FileUtils;->registerFilesystem(Lorg/apache/cordova/file/Filesystem;)V

    .line 231
    new-instance v2, Lorg/apache/cordova/file/LocalFilesystem;

    invoke-interface/range {p2 .. p2}, Lorg/apache/cordova/CordovaWebView;->getContext()Landroid/content/Context;

    move-result-object v12

    invoke-interface/range {p2 .. p2}, Lorg/apache/cordova/CordovaWebView;->getResourceApi()Lorg/apache/cordova/CordovaResourceApi;

    move-result-object v13

    iget-object v15, v0, Lorg/apache/cordova/file/FileUtils;->preferences:Lorg/apache/cordova/CordovaPreferences;

    const-string v11, "persistent"

    move-object v10, v2

    invoke-direct/range {v10 .. v15}, Lorg/apache/cordova/file/LocalFilesystem;-><init>(Ljava/lang/String;Landroid/content/Context;Lorg/apache/cordova/CordovaResourceApi;Ljava/io/File;Lorg/apache/cordova/CordovaPreferences;)V

    invoke-virtual {v0, v2}, Lorg/apache/cordova/file/FileUtils;->registerFilesystem(Lorg/apache/cordova/file/Filesystem;)V

    .line 232
    new-instance v2, Lorg/apache/cordova/file/ContentFilesystem;

    invoke-interface/range {p2 .. p2}, Lorg/apache/cordova/CordovaWebView;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-interface/range {p2 .. p2}, Lorg/apache/cordova/CordovaWebView;->getResourceApi()Lorg/apache/cordova/CordovaResourceApi;

    move-result-object v4

    iget-object v5, v0, Lorg/apache/cordova/file/FileUtils;->preferences:Lorg/apache/cordova/CordovaPreferences;

    invoke-direct {v2, v3, v4, v5}, Lorg/apache/cordova/file/ContentFilesystem;-><init>(Landroid/content/Context;Lorg/apache/cordova/CordovaResourceApi;Lorg/apache/cordova/CordovaPreferences;)V

    invoke-virtual {v0, v2}, Lorg/apache/cordova/file/FileUtils;->registerFilesystem(Lorg/apache/cordova/file/Filesystem;)V

    .line 233
    new-instance v2, Lorg/apache/cordova/file/AssetFilesystem;

    invoke-interface/range {p2 .. p2}, Lorg/apache/cordova/CordovaWebView;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v3

    invoke-interface/range {p2 .. p2}, Lorg/apache/cordova/CordovaWebView;->getResourceApi()Lorg/apache/cordova/CordovaResourceApi;

    move-result-object v4

    iget-object v5, v0, Lorg/apache/cordova/file/FileUtils;->preferences:Lorg/apache/cordova/CordovaPreferences;

    invoke-direct {v2, v3, v4, v5}, Lorg/apache/cordova/file/AssetFilesystem;-><init>(Landroid/content/res/AssetManager;Lorg/apache/cordova/CordovaResourceApi;Lorg/apache/cordova/CordovaPreferences;)V

    invoke-virtual {v0, v2}, Lorg/apache/cordova/file/FileUtils;->registerFilesystem(Lorg/apache/cordova/file/Filesystem;)V

    .line 235
    invoke-virtual {v0, v1}, Lorg/apache/cordova/file/FileUtils;->getExtraFileSystemsPreference(Landroid/app/Activity;)[Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1}, Lorg/apache/cordova/file/FileUtils;->getAvailableFileSystems(Landroid/app/Activity;)Ljava/util/HashMap;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Lorg/apache/cordova/file/FileUtils;->registerExtraFileSystems([Ljava/lang/String;Ljava/util/HashMap;)V

    .line 238
    sget-object v1, Lorg/apache/cordova/file/FileUtils;->filePlugin:Lorg/apache/cordova/file/FileUtils;

    if-nez v1, :cond_4

    .line 239
    sput-object v0, Lorg/apache/cordova/file/FileUtils;->filePlugin:Lorg/apache/cordova/file/FileUtils;

    goto :goto_2

    .line 242
    :cond_3
    const-string v2, "FileUtils"

    const-string v3, "File plugin configuration error: Please set AndroidPersistentFileLocation in config.xml to one of \"internal\" (for new applications) or \"compatibility\" (for compatibility with previous versions)"

    invoke-static {v2, v3}, Lorg/apache/cordova/LOG;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 243
    invoke-virtual {v1}, Landroid/app/Activity;->finish()V

    :cond_4
    :goto_2
    return-void
.end method

.method synthetic lambda$getPathHandler$0$org-apache-cordova-file-FileUtils(Ljava/lang/String;)Landroid/webkit/WebResourceResponse;
    .locals 8

    .line 1271
    const-string v0, "persistent"

    invoke-static {v0}, Lorg/apache/cordova/file/LocalFilesystemURL;->fsNameToCdvKeyword(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    const-string v2, "assets"

    const/4 v3, 0x0

    if-eqz v1, :cond_0

    goto/16 :goto_0

    .line 1273
    :cond_0
    const-string v0, "temporary"

    invoke-static {v0}, Lorg/apache/cordova/file/LocalFilesystemURL;->fsNameToCdvKeyword(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    goto/16 :goto_0

    .line 1275
    :cond_1
    const-string v0, "files"

    invoke-static {v0}, Lorg/apache/cordova/file/LocalFilesystemURL;->fsNameToCdvKeyword(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    goto :goto_0

    .line 1277
    :cond_2
    const-string v0, "documents"

    invoke-static {v0}, Lorg/apache/cordova/file/LocalFilesystemURL;->fsNameToCdvKeyword(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    goto :goto_0

    .line 1279
    :cond_3
    const-string v0, "cache"

    invoke-static {v0}, Lorg/apache/cordova/file/LocalFilesystemURL;->fsNameToCdvKeyword(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4

    goto :goto_0

    .line 1281
    :cond_4
    const-string v0, "root"

    invoke-static {v0}, Lorg/apache/cordova/file/LocalFilesystemURL;->fsNameToCdvKeyword(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_5

    goto :goto_0

    .line 1283
    :cond_5
    const-string v0, "files-external"

    invoke-static {v0}, Lorg/apache/cordova/file/LocalFilesystemURL;->fsNameToCdvKeyword(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_6

    goto :goto_0

    .line 1285
    :cond_6
    const-string v0, "sdcard"

    invoke-static {v0}, Lorg/apache/cordova/file/LocalFilesystemURL;->fsNameToCdvKeyword(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_7

    goto :goto_0

    .line 1287
    :cond_7
    const-string v0, "cache-external"

    invoke-static {v0}, Lorg/apache/cordova/file/LocalFilesystemURL;->fsNameToCdvKeyword(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_8

    goto :goto_0

    .line 1289
    :cond_8
    invoke-static {v2}, Lorg/apache/cordova/file/LocalFilesystemURL;->fsNameToCdvKeyword(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_9

    move-object v0, v2

    goto :goto_0

    :cond_9
    move-object v0, v3

    :goto_0
    if-ne v0, v2, :cond_a

    const/4 v1, 0x1

    goto :goto_1

    :cond_a
    const/4 v1, 0x0

    :goto_1
    if-eqz v0, :cond_f

    .line 1297
    iget-object v2, p0, Lorg/apache/cordova/file/FileUtils;->filesystems:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_b
    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_f

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/apache/cordova/file/Filesystem;

    .line 1305
    iget-object v5, v4, Lorg/apache/cordova/file/Filesystem;->name:Ljava/lang/String;

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_b

    .line 1307
    iget-object v4, v4, Lorg/apache/cordova/file/Filesystem;->rootUri:Landroid/net/Uri;

    invoke-virtual {v4}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "file://"

    const-string v6, ""

    invoke-virtual {v4, v5, v6}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v4

    .line 1308
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {v0}, Lorg/apache/cordova/file/LocalFilesystemURL;->fsNameToCdvKeyword(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v7, "/"

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1, v5, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v4

    if-eqz v1, :cond_c

    .line 1312
    const-string v5, "/android_asset/"

    invoke-virtual {v4, v5, v6}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v4

    move-object v5, v3

    goto :goto_3

    .line 1314
    :cond_c
    new-instance v5, Ljava/io/File;

    invoke-direct {v5, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1318
    :goto_3
    const-string v6, "FileUtils"

    if-nez v1, :cond_d

    .line 1319
    :try_start_0
    new-instance v7, Ljava/io/FileInputStream;

    invoke-direct {v7, v5}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    goto :goto_4

    .line 1320
    :cond_d
    iget-object v7, p0, Lorg/apache/cordova/file/FileUtils;->webView:Lorg/apache/cordova/CordovaWebView;

    invoke-interface {v7}, Lorg/apache/cordova/CordovaWebView;->getContext()Landroid/content/Context;

    move-result-object v7

    invoke-virtual {v7}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v7

    invoke-virtual {v7, v4}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v7

    :goto_4
    if-nez v1, :cond_e

    .line 1322
    invoke-virtual {v5}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v4

    .line 1323
    :cond_e
    invoke-static {v4}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    .line 1324
    invoke-direct {p0, v4}, Lorg/apache/cordova/file/FileUtils;->getMimeType(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v4

    .line 1326
    new-instance v5, Landroid/webkit/WebResourceResponse;

    invoke-direct {v5, v4, v3, v7}, Landroid/webkit/WebResourceResponse;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/io/InputStream;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v5

    :catch_0
    move-exception v4

    .line 1330
    invoke-virtual {v4}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-static {v6, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_2

    :catch_1
    move-exception v4

    .line 1328
    invoke-virtual {v4}, Ljava/io/FileNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-static {v6, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_2

    :cond_f
    return-object v3
.end method

.method public onRequestPermissionResult(I[Ljava/lang/String;[I)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 1201
    iget-object p2, p0, Lorg/apache/cordova/file/FileUtils;->pendingRequests:Lorg/apache/cordova/file/PendingRequests;

    invoke-virtual {p2, p1}, Lorg/apache/cordova/file/PendingRequests;->getAndRemove(I)Lorg/apache/cordova/file/PendingRequests$Request;

    move-result-object p1

    if-eqz p1, :cond_6

    .line 1203
    array-length p2, p3

    const/4 v0, 0x0

    :goto_0
    if-ge v0, p2, :cond_1

    aget v1, p3, v0

    const/4 v2, -0x1

    if-ne v1, v2, :cond_0

    .line 1207
    invoke-virtual {p1}, Lorg/apache/cordova/file/PendingRequests$Request;->getCallbackContext()Lorg/apache/cordova/CallbackContext;

    move-result-object p1

    new-instance p2, Lorg/apache/cordova/PluginResult;

    sget-object p3, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    sget v0, Lorg/apache/cordova/file/FileUtils;->SECURITY_ERR:I

    invoke-direct {p2, p3, v0}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;I)V

    invoke-virtual {p1, p2}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    return-void

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1211
    :cond_1
    invoke-virtual {p1}, Lorg/apache/cordova/file/PendingRequests$Request;->getAction()I

    move-result p2

    if-eqz p2, :cond_5

    const/4 p3, 0x1

    if-eq p2, p3, :cond_4

    const/4 p3, 0x2

    if-eq p2, p3, :cond_3

    const/4 p3, 0x3

    if-eq p2, p3, :cond_2

    goto :goto_1

    .line 1248
    :cond_2
    new-instance p2, Lorg/apache/cordova/file/FileUtils$30;

    invoke-direct {p2, p0, p1}, Lorg/apache/cordova/file/FileUtils$30;-><init>(Lorg/apache/cordova/file/FileUtils;Lorg/apache/cordova/file/PendingRequests$Request;)V

    .line 1254
    invoke-virtual {p1}, Lorg/apache/cordova/file/PendingRequests$Request;->getRawArgs()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p1}, Lorg/apache/cordova/file/PendingRequests$Request;->getCallbackContext()Lorg/apache/cordova/CallbackContext;

    move-result-object p1

    .line 1248
    invoke-direct {p0, p2, p3, p1}, Lorg/apache/cordova/file/FileUtils;->threadhelper(Lorg/apache/cordova/file/FileUtils$FileOp;Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V

    goto :goto_1

    .line 1225
    :cond_3
    new-instance p2, Lorg/apache/cordova/file/FileUtils$28;

    invoke-direct {p2, p0, p1}, Lorg/apache/cordova/file/FileUtils$28;-><init>(Lorg/apache/cordova/file/FileUtils;Lorg/apache/cordova/file/PendingRequests$Request;)V

    .line 1233
    invoke-virtual {p1}, Lorg/apache/cordova/file/PendingRequests$Request;->getRawArgs()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p1}, Lorg/apache/cordova/file/PendingRequests$Request;->getCallbackContext()Lorg/apache/cordova/CallbackContext;

    move-result-object p1

    .line 1225
    invoke-direct {p0, p2, p3, p1}, Lorg/apache/cordova/file/FileUtils;->threadhelper(Lorg/apache/cordova/file/FileUtils$FileOp;Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V

    goto :goto_1

    .line 1236
    :cond_4
    new-instance p2, Lorg/apache/cordova/file/FileUtils$29;

    invoke-direct {p2, p0, p1}, Lorg/apache/cordova/file/FileUtils$29;-><init>(Lorg/apache/cordova/file/FileUtils;Lorg/apache/cordova/file/PendingRequests$Request;)V

    .line 1245
    invoke-virtual {p1}, Lorg/apache/cordova/file/PendingRequests$Request;->getRawArgs()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p1}, Lorg/apache/cordova/file/PendingRequests$Request;->getCallbackContext()Lorg/apache/cordova/CallbackContext;

    move-result-object p1

    .line 1236
    invoke-direct {p0, p2, p3, p1}, Lorg/apache/cordova/file/FileUtils;->threadhelper(Lorg/apache/cordova/file/FileUtils$FileOp;Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V

    goto :goto_1

    .line 1214
    :cond_5
    new-instance p2, Lorg/apache/cordova/file/FileUtils$27;

    invoke-direct {p2, p0, p1}, Lorg/apache/cordova/file/FileUtils$27;-><init>(Lorg/apache/cordova/file/FileUtils;Lorg/apache/cordova/file/PendingRequests$Request;)V

    .line 1222
    invoke-virtual {p1}, Lorg/apache/cordova/file/PendingRequests$Request;->getRawArgs()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p1}, Lorg/apache/cordova/file/PendingRequests$Request;->getCallbackContext()Lorg/apache/cordova/CallbackContext;

    move-result-object p1

    .line 1214
    invoke-direct {p0, p2, p3, p1}, Lorg/apache/cordova/file/FileUtils;->threadhelper(Lorg/apache/cordova/file/FileUtils$FileOp;Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V

    goto :goto_1

    .line 1258
    :cond_6
    const-string p1, "FileUtils"

    const-string p2, "Received permission callback for unknown request code"

    invoke-static {p1, p2}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    :goto_1
    return-void
.end method

.method public readFileAs(Ljava/lang/String;IILorg/apache/cordova/CallbackContext;Ljava/lang/String;I)V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/MalformedURLException;
        }
    .end annotation

    .line 1088
    :try_start_0
    invoke-static {p1}, Lorg/apache/cordova/file/LocalFilesystemURL;->parse(Ljava/lang/String;)Lorg/apache/cordova/file/LocalFilesystemURL;

    move-result-object v1

    .line 1089
    invoke-direct {p0, v1}, Lorg/apache/cordova/file/FileUtils;->filesystemForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Lorg/apache/cordova/file/Filesystem;

    move-result-object v0

    if-eqz v0, :cond_0

    int-to-long v2, p2

    int-to-long v4, p3

    .line 1094
    new-instance v6, Lorg/apache/cordova/file/FileUtils$26;

    invoke-direct {v6, p0, p6, p5, p4}, Lorg/apache/cordova/file/FileUtils$26;-><init>(Lorg/apache/cordova/file/FileUtils;ILjava/lang/String;Lorg/apache/cordova/CallbackContext;)V

    invoke-virtual/range {v0 .. v6}, Lorg/apache/cordova/file/Filesystem;->readFileAtURL(Lorg/apache/cordova/file/LocalFilesystemURL;JJLorg/apache/cordova/file/Filesystem$ReadFileCallback;)V

    goto :goto_0

    .line 1091
    :cond_0
    new-instance p1, Ljava/net/MalformedURLException;

    const-string p2, "No installed handlers for this URL"

    invoke-direct {p1, p2}, Ljava/net/MalformedURLException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception p1

    .line 1143
    const-string p2, "FileUtils"

    invoke-virtual {p1}, Ljava/io/IOException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1144
    new-instance p1, Lorg/apache/cordova/PluginResult;

    sget-object p2, Lorg/apache/cordova/PluginResult$Status;->IO_EXCEPTION:Lorg/apache/cordova/PluginResult$Status;

    sget p3, Lorg/apache/cordova/file/FileUtils;->NOT_READABLE_ERR:I

    invoke-direct {p1, p2, p3}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;I)V

    invoke-virtual {p4, p1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto :goto_0

    .line 1141
    :catch_1
    new-instance p1, Lorg/apache/cordova/PluginResult;

    sget-object p2, Lorg/apache/cordova/PluginResult$Status;->IO_EXCEPTION:Lorg/apache/cordova/PluginResult$Status;

    sget p3, Lorg/apache/cordova/file/FileUtils;->NOT_FOUND_ERR:I

    invoke-direct {p1, p2, p3}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;I)V

    invoke-virtual {p4, p1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    :goto_0
    return-void

    :catch_2
    move-exception p1

    .line 1137
    new-instance p2, Ljava/net/MalformedURLException;

    const-string p3, "Unrecognized filesystem URL"

    invoke-direct {p2, p3}, Ljava/net/MalformedURLException;-><init>(Ljava/lang/String;)V

    .line 1138
    invoke-virtual {p2, p1}, Ljava/net/MalformedURLException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 1139
    throw p2
.end method

.method protected registerExtraFileSystems([Ljava/lang/String;Ljava/util/HashMap;)V
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/String;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 140
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 143
    array-length v1, p1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_4

    aget-object v9, p1, v2

    .line 144
    invoke-virtual {v0, v9}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    .line 145
    invoke-virtual {p2, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 146
    const-string v4, "FileUtils"

    if-eqz v3, :cond_2

    .line 147
    new-instance v7, Ljava/io/File;

    invoke-direct {v7, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 148
    invoke-virtual {v7}, Ljava/io/File;->mkdirs()Z

    move-result v3

    if-nez v3, :cond_1

    invoke-virtual {v7}, Ljava/io/File;->isDirectory()Z

    move-result v3

    if-eqz v3, :cond_0

    goto :goto_1

    .line 152
    :cond_0
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v5, "Unable to create root dir for filesystem \""

    invoke-direct {v3, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, "\", skipping"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v4, v3}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    .line 149
    :cond_1
    :goto_1
    new-instance v10, Lorg/apache/cordova/file/LocalFilesystem;

    iget-object v3, p0, Lorg/apache/cordova/file/FileUtils;->webView:Lorg/apache/cordova/CordovaWebView;

    invoke-interface {v3}, Lorg/apache/cordova/CordovaWebView;->getContext()Landroid/content/Context;

    move-result-object v5

    iget-object v3, p0, Lorg/apache/cordova/file/FileUtils;->webView:Lorg/apache/cordova/CordovaWebView;

    invoke-interface {v3}, Lorg/apache/cordova/CordovaWebView;->getResourceApi()Lorg/apache/cordova/CordovaResourceApi;

    move-result-object v6

    iget-object v8, p0, Lorg/apache/cordova/file/FileUtils;->preferences:Lorg/apache/cordova/CordovaPreferences;

    move-object v3, v10

    move-object v4, v9

    invoke-direct/range {v3 .. v8}, Lorg/apache/cordova/file/LocalFilesystem;-><init>(Ljava/lang/String;Landroid/content/Context;Lorg/apache/cordova/CordovaResourceApi;Ljava/io/File;Lorg/apache/cordova/CordovaPreferences;)V

    invoke-virtual {p0, v10}, Lorg/apache/cordova/file/FileUtils;->registerFilesystem(Lorg/apache/cordova/file/Filesystem;)V

    .line 150
    invoke-virtual {v0, v9}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 155
    :cond_2
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v5, "Unrecognized extra filesystem identifier: "

    invoke-direct {v3, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v4, v3}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_3
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_4
    return-void
.end method

.method public registerFilesystem(Lorg/apache/cordova/file/Filesystem;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 120
    iget-object v0, p1, Lorg/apache/cordova/file/Filesystem;->name:Ljava/lang/String;

    invoke-direct {p0, v0}, Lorg/apache/cordova/file/FileUtils;->filesystemForName(Ljava/lang/String;)Lorg/apache/cordova/file/Filesystem;

    move-result-object v0

    if-nez v0, :cond_0

    .line 121
    iget-object v0, p0, Lorg/apache/cordova/file/FileUtils;->filesystems:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_0
    return-void
.end method

.method public remapUri(Landroid/net/Uri;)Landroid/net/Uri;
    .locals 4

    const-string v0, "file://"

    .line 259
    const-string v1, "cdvfile"

    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_0

    return-object v2

    .line 264
    :cond_0
    :try_start_0
    invoke-static {p1}, Lorg/apache/cordova/file/LocalFilesystemURL;->parse(Landroid/net/Uri;)Lorg/apache/cordova/file/LocalFilesystemURL;

    move-result-object p1

    .line 265
    invoke-direct {p0, p1}, Lorg/apache/cordova/file/FileUtils;->filesystemForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Lorg/apache/cordova/file/Filesystem;

    move-result-object v1

    if-nez v1, :cond_1

    return-object v2

    .line 269
    :cond_1
    invoke-virtual {v1, p1}, Lorg/apache/cordova/file/Filesystem;->filesystemPathForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_2

    .line 272
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Lorg/apache/cordova/file/Filesystem;->filesystemPathForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    :cond_2
    return-object v2
.end method

.method public resolveNativeUri(Landroid/net/Uri;)Lorg/apache/cordova/file/LocalFilesystemURL;
    .locals 5

    .line 627
    iget-object v0, p0, Lorg/apache/cordova/file/FileUtils;->filesystems:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v1, 0x0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/cordova/file/Filesystem;

    .line 628
    invoke-virtual {v2, p1}, Lorg/apache/cordova/file/Filesystem;->toLocalUri(Landroid/net/Uri;)Lorg/apache/cordova/file/LocalFilesystemURL;

    move-result-object v2

    if-eqz v2, :cond_0

    if-eqz v1, :cond_1

    .line 632
    iget-object v3, v2, Lorg/apache/cordova/file/LocalFilesystemURL;->uri:Landroid/net/Uri;

    invoke-virtual {v3}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {v1}, Lorg/apache/cordova/file/LocalFilesystemURL;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v3, v4, :cond_0

    :cond_1
    move-object v1, v2

    goto :goto_0

    :cond_2
    return-object v1
.end method

.method public write(Ljava/lang/String;Ljava/lang/String;IZ)J
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;,
            Ljava/io/IOException;,
            Lorg/apache/cordova/file/NoModificationAllowedException;
        }
    .end annotation

    .line 1159
    :try_start_0
    invoke-static {p1}, Lorg/apache/cordova/file/LocalFilesystemURL;->parse(Ljava/lang/String;)Lorg/apache/cordova/file/LocalFilesystemURL;

    move-result-object p1

    .line 1160
    invoke-direct {p0, p1}, Lorg/apache/cordova/file/FileUtils;->filesystemForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Lorg/apache/cordova/file/Filesystem;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1165
    invoke-virtual {v0, p1, p2, p3, p4}, Lorg/apache/cordova/file/Filesystem;->writeToFileAtURL(Lorg/apache/cordova/file/LocalFilesystemURL;Ljava/lang/String;IZ)J

    move-result-wide p1

    return-wide p1

    .line 1162
    :cond_0
    new-instance p1, Ljava/net/MalformedURLException;

    const-string p2, "No installed handlers for this URL"

    invoke-direct {p1, p2}, Ljava/net/MalformedURLException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception p1

    .line 1167
    new-instance p2, Ljava/net/MalformedURLException;

    const-string p3, "Unrecognized filesystem URL"

    invoke-direct {p2, p3}, Ljava/net/MalformedURLException;-><init>(Ljava/lang/String;)V

    .line 1168
    invoke-virtual {p2, p1}, Ljava/net/MalformedURLException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 1169
    throw p2
.end method
