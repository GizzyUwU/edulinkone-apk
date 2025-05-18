.class public Lorg/apache/cordova/CordovaResourceApi;
.super Ljava/lang/Object;
.source "CordovaResourceApi.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;
    }
.end annotation


# static fields
.field private static final LOCAL_FILE_PROJECTION:[Ljava/lang/String;

.field private static final LOG_TAG:Ljava/lang/String; = "CordovaResourceApi"

.field public static final PLUGIN_URI_SCHEME:Ljava/lang/String; = "cdvplugin"

.field public static final URI_TYPE_ASSET:I = 0x1

.field public static final URI_TYPE_CONTENT:I = 0x2

.field public static final URI_TYPE_DATA:I = 0x4

.field public static final URI_TYPE_FILE:I = 0x0

.field public static final URI_TYPE_HTTP:I = 0x5

.field public static final URI_TYPE_HTTPS:I = 0x6

.field public static final URI_TYPE_PLUGIN:I = 0x7

.field public static final URI_TYPE_RESOURCE:I = 0x3

.field public static final URI_TYPE_UNKNOWN:I = -0x1

.field public static jsThread:Ljava/lang/Thread;


# instance fields
.field private final assetManager:Landroid/content/res/AssetManager;

.field private final contentResolver:Landroid/content/ContentResolver;

.field private final pluginManager:Lorg/apache/cordova/PluginManager;

.field private threadCheckingEnabled:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 80
    const-string v0, "_data"

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/apache/cordova/CordovaResourceApi;->LOCAL_FILE_PROJECTION:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lorg/apache/cordova/PluginManager;)V
    .locals 1

    .line 90
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 87
    iput-boolean v0, p0, Lorg/apache/cordova/CordovaResourceApi;->threadCheckingEnabled:Z

    .line 91
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/cordova/CordovaResourceApi;->contentResolver:Landroid/content/ContentResolver;

    .line 92
    invoke-virtual {p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object p1

    iput-object p1, p0, Lorg/apache/cordova/CordovaResourceApi;->assetManager:Landroid/content/res/AssetManager;

    .line 93
    iput-object p2, p0, Lorg/apache/cordova/CordovaResourceApi;->pluginManager:Lorg/apache/cordova/PluginManager;

    return-void
.end method

.method private assertBackgroundThread()V
    .locals 2

    .line 402
    iget-boolean v0, p0, Lorg/apache/cordova/CordovaResourceApi;->threadCheckingEnabled:Z

    if-eqz v0, :cond_2

    .line 403
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    .line 404
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-virtual {v1}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    move-result-object v1

    if-eq v0, v1, :cond_1

    .line 407
    sget-object v1, Lorg/apache/cordova/CordovaResourceApi;->jsThread:Ljava/lang/Thread;

    if-eq v0, v1, :cond_0

    goto :goto_0

    .line 408
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Tried to perform an IO operation on the WebCore thread. Use CordovaInterface.getThreadPool() instead."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 405
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Do not perform IO operations on the UI thread. Use CordovaInterface.getThreadPool() instead."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_2
    :goto_0
    return-void
.end method

.method private static assertNonRelative(Landroid/net/Uri;)V
    .locals 1

    .line 459
    invoke-virtual {p0}, Landroid/net/Uri;->isAbsolute()Z

    move-result p0

    if-eqz p0, :cond_0

    return-void

    .line 460
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Relative URIs are not supported."

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private getDataUriMimeType(Landroid/net/Uri;)Ljava/lang/String;
    .locals 3

    .line 414
    invoke-virtual {p1}, Landroid/net/Uri;->getSchemeSpecificPart()Ljava/lang/String;

    move-result-object p1

    const/16 v0, 0x2c

    .line 415
    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    const/4 v1, -0x1

    const/4 v2, 0x0

    if-ne v0, v1, :cond_0

    return-object v2

    :cond_0
    const/4 v1, 0x0

    .line 419
    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    const-string v0, ";"

    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    .line 420
    array-length v0, p1

    if-lez v0, :cond_1

    .line 421
    aget-object p1, p1, v1

    return-object p1

    :cond_1
    return-object v2
.end method

.method private getMimeTypeFromPath(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    const/16 v0, 0x2e

    .line 209
    invoke-virtual {p1, v0}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    add-int/lit8 v0, v0, 0x1

    .line 211
    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    .line 214
    :cond_0
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p1

    .line 215
    const-string v0, "3ga"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 216
    const-string p1, "audio/3gpp"

    return-object p1

    .line 217
    :cond_1
    const-string v0, "js"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 219
    const-string p1, "text/javascript"

    return-object p1

    .line 221
    :cond_2
    invoke-static {}, Landroid/webkit/MimeTypeMap;->getSingleton()Landroid/webkit/MimeTypeMap;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/webkit/MimeTypeMap;->getMimeTypeFromExtension(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public static getUriType(Landroid/net/Uri;)I
    .locals 2

    .line 106
    invoke-static {p0}, Lorg/apache/cordova/CordovaResourceApi;->assertNonRelative(Landroid/net/Uri;)V

    .line 107
    invoke-virtual {p0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v0

    .line 108
    const-string v1, "content"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 p0, 0x2

    return p0

    .line 111
    :cond_0
    const-string v1, "android.resource"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 p0, 0x3

    return p0

    .line 114
    :cond_1
    const-string v1, "file"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 115
    invoke-virtual {p0}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object p0

    const-string v0, "/android_asset/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_2

    const/4 p0, 0x1

    return p0

    :cond_2
    const/4 p0, 0x0

    return p0

    .line 120
    :cond_3
    const-string p0, "data"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_4

    const/4 p0, 0x4

    return p0

    .line 123
    :cond_4
    const-string p0, "http"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_5

    const/4 p0, 0x5

    return p0

    .line 126
    :cond_5
    const-string p0, "https"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_6

    const/4 p0, 0x6

    return p0

    .line 129
    :cond_6
    const-string p0, "cdvplugin"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_7

    const/4 p0, 0x7

    return p0

    :cond_7
    const/4 p0, -0x1

    return p0
.end method

.method private readDataUri(Landroid/net/Uri;)Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;
    .locals 12

    .line 427
    invoke-virtual {p1}, Landroid/net/Uri;->getSchemeSpecificPart()Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x2c

    .line 428
    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    const/4 v2, -0x1

    const/4 v3, 0x0

    if-ne v1, v2, :cond_0

    return-object v3

    :cond_0
    const/4 v2, 0x0

    .line 432
    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    const-string v5, ";"

    invoke-virtual {v4, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 435
    array-length v5, v4

    if-lez v5, :cond_1

    .line 436
    aget-object v3, v4, v2

    :cond_1
    move-object v8, v3

    const/4 v3, 0x1

    move v6, v2

    move v5, v3

    .line 438
    :goto_0
    array-length v7, v4

    if-ge v5, v7, :cond_3

    .line 439
    const-string v7, "base64"

    aget-object v9, v4, v5

    invoke-virtual {v7, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_2

    move v6, v3

    :cond_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    :cond_3
    add-int/2addr v1, v3

    .line 443
    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    if-eqz v6, :cond_4

    .line 446
    invoke-static {v0, v2}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v0

    goto :goto_1

    .line 449
    :cond_4
    :try_start_0
    const-string v1, "UTF-8"

    invoke-virtual {v0, v1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v0
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 451
    :catch_0
    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    .line 454
    :goto_1
    new-instance v7, Ljava/io/ByteArrayInputStream;

    invoke-direct {v7, v0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 455
    new-instance v1, Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;

    array-length v0, v0

    int-to-long v9, v0

    const/4 v11, 0x0

    move-object v5, v1

    move-object v6, p1

    invoke-direct/range {v5 .. v11}, Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;-><init>(Landroid/net/Uri;Ljava/io/InputStream;Ljava/lang/String;JLandroid/content/res/AssetFileDescriptor;)V

    return-object v1
.end method


# virtual methods
.method public copyResource(Landroid/net/Uri;Landroid/net/Uri;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 398
    invoke-virtual {p0, p1}, Lorg/apache/cordova/CordovaResourceApi;->openForRead(Landroid/net/Uri;)Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;

    move-result-object p1

    invoke-virtual {p0, p2}, Lorg/apache/cordova/CordovaResourceApi;->openOutputStream(Landroid/net/Uri;)Ljava/io/OutputStream;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lorg/apache/cordova/CordovaResourceApi;->copyResource(Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;Ljava/io/OutputStream;)V

    return-void
.end method

.method public copyResource(Landroid/net/Uri;Ljava/io/OutputStream;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 393
    invoke-virtual {p0, p1}, Lorg/apache/cordova/CordovaResourceApi;->openForRead(Landroid/net/Uri;)Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;

    move-result-object p1

    invoke-virtual {p0, p1, p2}, Lorg/apache/cordova/CordovaResourceApi;->copyResource(Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;Ljava/io/OutputStream;)V

    return-void
.end method

.method public copyResource(Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;Ljava/io/OutputStream;)V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 356
    invoke-direct {p0}, Lorg/apache/cordova/CordovaResourceApi;->assertBackgroundThread()V

    .line 358
    :try_start_0
    iget-object v0, p1, Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;->inputStream:Ljava/io/InputStream;

    .line 359
    instance-of v1, v0, Ljava/io/FileInputStream;

    if-eqz v1, :cond_1

    instance-of v1, p2, Ljava/io/FileOutputStream;

    if-eqz v1, :cond_1

    .line 360
    iget-object v0, p1, Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;->inputStream:Ljava/io/InputStream;

    check-cast v0, Ljava/io/FileInputStream;

    invoke-virtual {v0}, Ljava/io/FileInputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v2

    .line 361
    move-object v0, p2

    check-cast v0, Ljava/io/FileOutputStream;

    invoke-virtual {v0}, Ljava/io/FileOutputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v1

    .line 363
    iget-wide v5, p1, Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;->length:J

    .line 364
    iget-object v0, p1, Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;->assetFd:Landroid/content/res/AssetFileDescriptor;

    if-eqz v0, :cond_0

    .line 365
    iget-object v0, p1, Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;->assetFd:Landroid/content/res/AssetFileDescriptor;

    invoke-virtual {v0}, Landroid/content/res/AssetFileDescriptor;->getStartOffset()J

    move-result-wide v3

    goto :goto_0

    :cond_0
    const-wide/16 v3, 0x0

    .line 369
    :goto_0
    invoke-virtual {v2, v3, v4}, Ljava/nio/channels/FileChannel;->position(J)Ljava/nio/channels/FileChannel;

    const-wide/16 v3, 0x0

    .line 370
    invoke-virtual/range {v1 .. v6}, Ljava/nio/channels/FileChannel;->transferFrom(Ljava/nio/channels/ReadableByteChannel;JJ)J

    goto :goto_2

    :cond_1
    const/16 v1, 0x2000

    .line 373
    new-array v2, v1, [B

    :goto_1
    const/4 v3, 0x0

    .line 376
    invoke-virtual {v0, v2, v3, v1}, Ljava/io/InputStream;->read([BII)I

    move-result v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-gtz v4, :cond_3

    .line 385
    :goto_2
    iget-object p1, p1, Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;->inputStream:Ljava/io/InputStream;

    invoke-virtual {p1}, Ljava/io/InputStream;->close()V

    if-eqz p2, :cond_2

    .line 387
    invoke-virtual {p2}, Ljava/io/OutputStream;->close()V

    :cond_2
    return-void

    .line 381
    :cond_3
    :try_start_1
    invoke-virtual {p2, v2, v3, v4}, Ljava/io/OutputStream;->write([BII)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception v0

    .line 385
    iget-object p1, p1, Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;->inputStream:Ljava/io/InputStream;

    invoke-virtual {p1}, Ljava/io/InputStream;->close()V

    if-eqz p2, :cond_4

    .line 387
    invoke-virtual {p2}, Ljava/io/OutputStream;->close()V

    .line 389
    :cond_4
    throw v0
.end method

.method public createHttpConnection(Landroid/net/Uri;)Ljava/net/HttpURLConnection;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 349
    invoke-direct {p0}, Lorg/apache/cordova/CordovaResourceApi;->assertBackgroundThread()V

    .line 350
    new-instance v0, Ljava/net/URL;

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object p1

    check-cast p1, Ljava/net/HttpURLConnection;

    return-object p1
.end method

.method public getMimeType(Landroid/net/Uri;)Ljava/lang/String;
    .locals 2

    .line 176
    invoke-static {p1}, Lorg/apache/cordova/CordovaResourceApi;->getUriType(Landroid/net/Uri;)I

    move-result v0

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 189
    :pswitch_0
    :try_start_0
    new-instance v0, Ljava/net/URL;

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object p1

    check-cast p1, Ljava/net/HttpURLConnection;

    const/4 v0, 0x0

    .line 190
    invoke-virtual {p1, v0}, Ljava/net/HttpURLConnection;->setDoInput(Z)V

    .line 191
    const-string v1, "HEAD"

    invoke-virtual {p1, v1}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 192
    const-string v1, "Content-Type"

    invoke-virtual {p1, v1}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 194
    const-string v1, ";"

    invoke-virtual {p1, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    aget-object p1, p1, v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    return-object p1

    .line 184
    :pswitch_1
    invoke-direct {p0, p1}, Lorg/apache/cordova/CordovaResourceApi;->getDataUriMimeType(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 182
    :pswitch_2
    iget-object v0, p0, Lorg/apache/cordova/CordovaResourceApi;->contentResolver:Landroid/content/ContentResolver;

    invoke-virtual {v0, p1}, Landroid/content/ContentResolver;->getType(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 179
    :pswitch_3
    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lorg/apache/cordova/CordovaResourceApi;->getMimeTypeFromPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :catch_0
    :goto_0
    const/4 p1, 0x0

    return-object p1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public isThreadCheckingEnabled()Z
    .locals 1

    .line 101
    iget-boolean v0, p0, Lorg/apache/cordova/CordovaResourceApi;->threadCheckingEnabled:Z

    return v0
.end method

.method public mapUriToFile(Landroid/net/Uri;)Ljava/io/File;
    .locals 8

    .line 150
    invoke-direct {p0}, Lorg/apache/cordova/CordovaResourceApi;->assertBackgroundThread()V

    .line 151
    invoke-static {p1}, Lorg/apache/cordova/CordovaResourceApi;->getUriType(Landroid/net/Uri;)I

    move-result v0

    if-eqz v0, :cond_3

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    goto :goto_0

    .line 155
    :cond_0
    iget-object v2, p0, Lorg/apache/cordova/CordovaResourceApi;->contentResolver:Landroid/content/ContentResolver;

    sget-object v0, Lorg/apache/cordova/CordovaResourceApi;->LOCAL_FILE_PROJECTION:[Ljava/lang/String;

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v5, 0x0

    move-object v3, p1

    move-object v4, v0

    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1

    if-eqz p1, :cond_2

    const/4 v1, 0x0

    .line 158
    :try_start_0
    aget-object v0, v0, v1

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_1

    .line 159
    invoke-interface {p1}, Landroid/database/Cursor;->getCount()I

    move-result v1

    if-lez v1, :cond_1

    .line 160
    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    .line 161
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 163
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 167
    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    return-object v1

    :cond_1
    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    goto :goto_0

    :catchall_0
    move-exception v0

    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    .line 168
    throw v0

    :cond_2
    :goto_0
    const/4 p1, 0x0

    return-object p1

    .line 153
    :cond_3
    new-instance v0, Ljava/io/File;

    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public openForRead(Landroid/net/Uri;)Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 233
    invoke-virtual {p0, p1, v0}, Lorg/apache/cordova/CordovaResourceApi;->openForRead(Landroid/net/Uri;Z)Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;

    move-result-object p1

    return-object p1
.end method

.method public openForRead(Landroid/net/Uri;Z)Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    if-nez p2, :cond_0

    .line 246
    invoke-direct {p0}, Lorg/apache/cordova/CordovaResourceApi;->assertBackgroundThread()V

    .line 248
    :cond_0
    invoke-static {p1}, Lorg/apache/cordova/CordovaResourceApi;->getUriType(Landroid/net/Uri;)I

    move-result v0

    packed-switch v0, :pswitch_data_0

    goto/16 :goto_2

    .line 306
    :pswitch_0
    invoke-virtual {p1}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v0

    .line 307
    iget-object v2, p0, Lorg/apache/cordova/CordovaResourceApi;->pluginManager:Lorg/apache/cordova/PluginManager;

    invoke-virtual {v2, v0}, Lorg/apache/cordova/PluginManager;->getPlugin(Ljava/lang/String;)Lorg/apache/cordova/CordovaPlugin;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 311
    invoke-virtual {v0, p1}, Lorg/apache/cordova/CordovaPlugin;->handleOpenForRead(Landroid/net/Uri;)Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;

    move-result-object v0

    return-object v0

    .line 309
    :cond_1
    new-instance v0, Ljava/io/FileNotFoundException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Invalid plugin ID in URI: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 289
    :pswitch_1
    new-instance v0, Ljava/net/URL;

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;

    .line 290
    const-string v2, "Accept-Encoding"

    const-string v3, "gzip"

    invoke-virtual {v0, v2, v3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v2, 0x1

    .line 291
    invoke-virtual {v0, v2}, Ljava/net/HttpURLConnection;->setDoInput(Z)V

    .line 292
    const-string v2, "Content-Type"

    invoke-virtual {v0, v2}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_2

    .line 294
    const-string v4, ";"

    invoke-virtual {v2, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    const/4 v4, 0x0

    aget-object v2, v2, v4

    :cond_2
    move-object v4, v2

    .line 296
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getContentLength()I

    move-result v2

    .line 298
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getContentEncoding()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 299
    new-instance v3, Ljava/util/zip/GZIPInputStream;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    invoke-direct {v3, v0}, Ljava/util/zip/GZIPInputStream;-><init>(Ljava/io/InputStream;)V

    goto :goto_0

    .line 301
    :cond_3
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    move-object v3, v0

    .line 303
    :goto_0
    new-instance v7, Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;

    int-to-long v5, v2

    const/4 v8, 0x0

    move-object v0, v7

    move-object v1, p1

    move-object v2, v3

    move-object v3, v4

    move-wide v4, v5

    move-object v6, v8

    invoke-direct/range {v0 .. v6}, Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;-><init>(Landroid/net/Uri;Ljava/io/InputStream;Ljava/lang/String;JLandroid/content/res/AssetFileDescriptor;)V

    return-object v7

    .line 281
    :pswitch_2
    invoke-direct {p0, p1}, Lorg/apache/cordova/CordovaResourceApi;->readDataUri(Landroid/net/Uri;)Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;

    move-result-object v0

    if-eqz v0, :cond_4

    return-object v0

    .line 274
    :pswitch_3
    iget-object v0, p0, Lorg/apache/cordova/CordovaResourceApi;->contentResolver:Landroid/content/ContentResolver;

    invoke-virtual {v0, p1}, Landroid/content/ContentResolver;->getType(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v3

    .line 275
    iget-object v0, p0, Lorg/apache/cordova/CordovaResourceApi;->contentResolver:Landroid/content/ContentResolver;

    const-string v2, "r"

    invoke-virtual {v0, p1, v2}, Landroid/content/ContentResolver;->openAssetFileDescriptor(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    move-result-object v6

    .line 276
    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->createInputStream()Ljava/io/FileInputStream;

    move-result-object v2

    .line 277
    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->getLength()J

    move-result-wide v4

    .line 278
    new-instance v7, Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;

    move-object v0, v7

    move-object v1, p1

    invoke-direct/range {v0 .. v6}, Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;-><init>(Landroid/net/Uri;Ljava/io/InputStream;Ljava/lang/String;JLandroid/content/res/AssetFileDescriptor;)V

    return-object v7

    .line 256
    :pswitch_4
    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v0

    const/16 v2, 0xf

    invoke-virtual {v0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    const/4 v2, 0x0

    .line 261
    :try_start_0
    iget-object v3, p0, Lorg/apache/cordova/CordovaResourceApi;->assetManager:Landroid/content/res/AssetManager;

    invoke-virtual {v3, v0}, Landroid/content/res/AssetManager;->openFd(Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    move-result-object v2

    .line 262
    invoke-virtual {v2}, Landroid/content/res/AssetFileDescriptor;->createInputStream()Ljava/io/FileInputStream;

    move-result-object v3

    .line 263
    invoke-virtual {v2}, Landroid/content/res/AssetFileDescriptor;->getLength()J

    move-result-wide v4
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 266
    :catch_0
    iget-object v3, p0, Lorg/apache/cordova/CordovaResourceApi;->assetManager:Landroid/content/res/AssetManager;

    invoke-virtual {v3, v0}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v3

    .line 267
    invoke-virtual {v3}, Ljava/io/InputStream;->available()I

    move-result v4

    int-to-long v4, v4

    :goto_1
    move-object v6, v2

    move-object v2, v3

    .line 269
    invoke-direct {p0, v0}, Lorg/apache/cordova/CordovaResourceApi;->getMimeTypeFromPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 270
    new-instance v7, Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;

    move-object v0, v7

    move-object v1, p1

    invoke-direct/range {v0 .. v6}, Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;-><init>(Landroid/net/Uri;Ljava/io/InputStream;Ljava/lang/String;JLandroid/content/res/AssetFileDescriptor;)V

    return-object v7

    .line 250
    :pswitch_5
    new-instance v2, Ljava/io/FileInputStream;

    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .line 251
    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/apache/cordova/CordovaResourceApi;->getMimeTypeFromPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 252
    invoke-virtual {v2}, Ljava/io/FileInputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/channels/FileChannel;->size()J

    move-result-wide v4

    .line 253
    new-instance v7, Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;

    const/4 v6, 0x0

    move-object v0, v7

    move-object v1, p1

    invoke-direct/range {v0 .. v6}, Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;-><init>(Landroid/net/Uri;Ljava/io/InputStream;Ljava/lang/String;JLandroid/content/res/AssetFileDescriptor;)V

    return-object v7

    .line 314
    :cond_4
    :goto_2
    new-instance v0, Ljava/io/FileNotFoundException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "URI not supported by CordovaResourceApi: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public openOutputStream(Landroid/net/Uri;)Ljava/io/OutputStream;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 318
    invoke-virtual {p0, p1, v0}, Lorg/apache/cordova/CordovaResourceApi;->openOutputStream(Landroid/net/Uri;Z)Ljava/io/OutputStream;

    move-result-object p1

    return-object p1
.end method

.method public openOutputStream(Landroid/net/Uri;Z)Ljava/io/OutputStream;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 329
    invoke-direct {p0}, Lorg/apache/cordova/CordovaResourceApi;->assertBackgroundThread()V

    .line 330
    invoke-static {p1}, Lorg/apache/cordova/CordovaResourceApi;->getUriType(Landroid/net/Uri;)I

    move-result v0

    if-eqz v0, :cond_3

    const/4 v1, 0x2

    if-eq v0, v1, :cond_1

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    goto :goto_0

    .line 345
    :cond_0
    new-instance p2, Ljava/io/FileNotFoundException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "URI not supported by CordovaResourceApi: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 341
    :cond_1
    :goto_0
    iget-object v0, p0, Lorg/apache/cordova/CordovaResourceApi;->contentResolver:Landroid/content/ContentResolver;

    if-eqz p2, :cond_2

    const-string p2, "wa"

    goto :goto_1

    :cond_2
    const-string p2, "w"

    :goto_1
    invoke-virtual {v0, p1, p2}, Landroid/content/ContentResolver;->openAssetFileDescriptor(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    move-result-object p1

    .line 342
    invoke-virtual {p1}, Landroid/content/res/AssetFileDescriptor;->createOutputStream()Ljava/io/FileOutputStream;

    move-result-object p1

    return-object p1

    .line 332
    :cond_3
    new-instance v0, Ljava/io/File;

    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 333
    invoke-virtual {v0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object p1

    if-eqz p1, :cond_4

    .line 335
    invoke-virtual {p1}, Ljava/io/File;->mkdirs()Z

    .line 337
    :cond_4
    new-instance p1, Ljava/io/FileOutputStream;

    invoke-direct {p1, v0, p2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;Z)V

    return-object p1
.end method

.method public remapPath(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 142
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object p1

    invoke-virtual {p0, p1}, Lorg/apache/cordova/CordovaResourceApi;->remapUri(Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object p1

    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public remapUri(Landroid/net/Uri;)Landroid/net/Uri;
    .locals 1

    .line 136
    invoke-static {p1}, Lorg/apache/cordova/CordovaResourceApi;->assertNonRelative(Landroid/net/Uri;)V

    .line 137
    iget-object v0, p0, Lorg/apache/cordova/CordovaResourceApi;->pluginManager:Lorg/apache/cordova/PluginManager;

    invoke-virtual {v0, p1}, Lorg/apache/cordova/PluginManager;->remapUri(Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object v0

    if-eqz v0, :cond_0

    move-object p1, v0

    :cond_0
    return-object p1
.end method

.method public setThreadCheckingEnabled(Z)V
    .locals 0

    .line 97
    iput-boolean p1, p0, Lorg/apache/cordova/CordovaResourceApi;->threadCheckingEnabled:Z

    return-void
.end method
