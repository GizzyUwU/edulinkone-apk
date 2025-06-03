.class public Lorg/apache/cordova/file/LocalFilesystem;
.super Lorg/apache/cordova/file/Filesystem;
.source "LocalFilesystem.java"


# instance fields
.field private final context:Landroid/content/Context;


# direct methods
.method public constructor <init>(Ljava/lang/String;Landroid/content/Context;Lorg/apache/cordova/CordovaResourceApi;Ljava/io/File;Lorg/apache/cordova/CordovaPreferences;)V
    .locals 1

    .line 50
    invoke-static {p4}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object p4

    invoke-virtual {p4}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object p4

    const-string v0, ""

    invoke-virtual {p4, v0}, Landroid/net/Uri$Builder;->appendEncodedPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p4

    invoke-virtual {p4}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p4

    invoke-direct {p0, p4, p1, p3, p5}, Lorg/apache/cordova/file/Filesystem;-><init>(Landroid/net/Uri;Ljava/lang/String;Lorg/apache/cordova/CordovaResourceApi;Lorg/apache/cordova/CordovaPreferences;)V

    .line 51
    iput-object p2, p0, Lorg/apache/cordova/file/LocalFilesystem;->context:Landroid/content/Context;

    return-void
.end method

.method private broadcastNewFile(Landroid/net/Uri;)V
    .locals 2

    .line 440
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.MEDIA_SCANNER_SCAN_FILE"

    invoke-direct {v0, v1, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 441
    iget-object p1, p0, Lorg/apache/cordova/file/LocalFilesystem;->context:Landroid/content/Context;

    invoke-virtual {p1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    return-void
.end method

.method private copyDirectory(Lorg/apache/cordova/file/Filesystem;Lorg/apache/cordova/file/LocalFilesystemURL;Ljava/io/File;Z)V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/cordova/file/NoModificationAllowedException;,
            Lorg/apache/cordova/file/InvalidModificationException;,
            Lorg/apache/cordova/file/FileExistsException;
        }
    .end annotation

    .line 284
    const-string v0, "directory is not empty"

    if-eqz p4, :cond_2

    .line 285
    invoke-virtual {p1, p2}, Lorg/apache/cordova/file/Filesystem;->filesystemPathForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 287
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 289
    invoke-virtual {p3}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 290
    invoke-virtual {p3}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v1

    array-length v1, v1

    if-gtz v1, :cond_0

    .line 293
    invoke-virtual {p3}, Ljava/io/File;->delete()Z

    goto :goto_0

    .line 291
    :cond_0
    new-instance p1, Lorg/apache/cordova/file/InvalidModificationException;

    invoke-direct {p1, v0}, Lorg/apache/cordova/file/InvalidModificationException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 296
    :cond_1
    :goto_0
    invoke-virtual {v2, p3}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v1

    if-eqz v1, :cond_2

    return-void

    .line 303
    :cond_2
    invoke-virtual {p3}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 304
    invoke-virtual {p3}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v1

    array-length v1, v1

    if-gtz v1, :cond_3

    goto :goto_1

    .line 305
    :cond_3
    new-instance p1, Lorg/apache/cordova/file/InvalidModificationException;

    invoke-direct {p1, v0}, Lorg/apache/cordova/file/InvalidModificationException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 308
    :cond_4
    invoke-virtual {p3}, Ljava/io/File;->mkdir()Z

    move-result v0

    if-eqz v0, :cond_8

    .line 314
    :goto_1
    invoke-virtual {p1, p2}, Lorg/apache/cordova/file/Filesystem;->listChildren(Lorg/apache/cordova/file/LocalFilesystemURL;)[Lorg/apache/cordova/file/LocalFilesystemURL;

    move-result-object v0

    .line 315
    array-length v1, v0

    const/4 v2, 0x0

    move v3, v2

    :goto_2
    if-ge v3, v1, :cond_6

    aget-object v4, v0, v3

    .line 316
    new-instance v5, Ljava/io/File;

    new-instance v6, Ljava/io/File;

    iget-object v7, v4, Lorg/apache/cordova/file/LocalFilesystemURL;->path:Ljava/lang/String;

    invoke-direct {v6, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, p3, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 317
    iget-boolean v6, v4, Lorg/apache/cordova/file/LocalFilesystemURL;->isDirectory:Z

    if-eqz v6, :cond_5

    .line 318
    invoke-direct {p0, p1, v4, v5, v2}, Lorg/apache/cordova/file/LocalFilesystem;->copyDirectory(Lorg/apache/cordova/file/Filesystem;Lorg/apache/cordova/file/LocalFilesystemURL;Ljava/io/File;Z)V

    goto :goto_3

    .line 320
    :cond_5
    invoke-direct {p0, p1, v4, v5, v2}, Lorg/apache/cordova/file/LocalFilesystem;->copyFile(Lorg/apache/cordova/file/Filesystem;Lorg/apache/cordova/file/LocalFilesystemURL;Ljava/io/File;Z)V

    :goto_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    :cond_6
    if-eqz p4, :cond_7

    .line 325
    invoke-virtual {p1, p2}, Lorg/apache/cordova/file/Filesystem;->recursiveRemoveFileAtLocalURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Z

    :cond_7
    return-void

    .line 310
    :cond_8
    new-instance p1, Lorg/apache/cordova/file/NoModificationAllowedException;

    const-string p2, "Couldn\'t create the destination directory"

    invoke-direct {p1, p2}, Lorg/apache/cordova/file/NoModificationAllowedException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private copyFile(Lorg/apache/cordova/file/Filesystem;Lorg/apache/cordova/file/LocalFilesystemURL;Ljava/io/File;Z)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/cordova/file/InvalidModificationException;,
            Lorg/apache/cordova/file/NoModificationAllowedException;
        }
    .end annotation

    if-eqz p4, :cond_0

    .line 265
    invoke-virtual {p1, p2}, Lorg/apache/cordova/file/Filesystem;->filesystemPathForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 267
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 268
    invoke-virtual {v1, p3}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 275
    :cond_0
    iget-object v0, p0, Lorg/apache/cordova/file/LocalFilesystem;->resourceApi:Lorg/apache/cordova/CordovaResourceApi;

    invoke-virtual {p1, p2}, Lorg/apache/cordova/file/Filesystem;->toNativeUri(Lorg/apache/cordova/file/LocalFilesystemURL;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CordovaResourceApi;->openForRead(Landroid/net/Uri;)Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;

    move-result-object v0

    .line 276
    iget-object v1, p0, Lorg/apache/cordova/file/LocalFilesystem;->resourceApi:Lorg/apache/cordova/CordovaResourceApi;

    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, p3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    invoke-virtual {v1, v0, v2}, Lorg/apache/cordova/CordovaResourceApi;->copyResource(Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;Ljava/io/OutputStream;)V

    if-eqz p4, :cond_1

    .line 279
    invoke-virtual {p1, p2}, Lorg/apache/cordova/file/Filesystem;->removeFileAtLocalURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Z

    :cond_1
    return-void
.end method

.method private fullPathForFilesystemPath(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    if-eqz p1, :cond_0

    .line 64
    iget-object v0, p0, Lorg/apache/cordova/file/LocalFilesystem;->rootUri:Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 65
    iget-object v0, p0, Lorg/apache/cordova/file/LocalFilesystem;->rootUri:Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method private isPublicDirectory(Ljava/lang/String;)Z
    .locals 4

    .line 425
    iget-object v0, p0, Lorg/apache/cordova/file/LocalFilesystem;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getExternalMediaDirs()[Ljava/io/File;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    if-eqz v3, :cond_0

    .line 426
    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 432
    :cond_1
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    .line 433
    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p1

    return p1
.end method


# virtual methods
.method public URLforFilesystemPath(Ljava/lang/String;)Lorg/apache/cordova/file/LocalFilesystemURL;
    .locals 0

    .line 108
    invoke-direct {p0, p1}, Lorg/apache/cordova/file/LocalFilesystem;->fullPathForFilesystemPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lorg/apache/cordova/file/LocalFilesystem;->localUrlforFullPath(Ljava/lang/String;)Lorg/apache/cordova/file/LocalFilesystemURL;

    move-result-object p1

    return-object p1
.end method

.method public canRemoveFileAtLocalURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Z
    .locals 1

    .line 470
    invoke-virtual {p0, p1}, Lorg/apache/cordova/file/LocalFilesystem;->filesystemPathForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Ljava/lang/String;

    move-result-object p1

    .line 471
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 472
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result p1

    return p1
.end method

.method public copyFileToURL(Lorg/apache/cordova/file/LocalFilesystemURL;Ljava/lang/String;Lorg/apache/cordova/file/Filesystem;Lorg/apache/cordova/file/LocalFilesystemURL;Z)Lorg/json/JSONObject;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/cordova/file/InvalidModificationException;,
            Lorg/json/JSONException;,
            Lorg/apache/cordova/file/NoModificationAllowedException;,
            Lorg/apache/cordova/file/FileExistsException;
        }
    .end annotation

    .line 334
    invoke-virtual {p0, p1}, Lorg/apache/cordova/file/LocalFilesystem;->filesystemPathForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Ljava/lang/String;

    move-result-object v0

    .line 335
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 336
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_9

    .line 342
    iget-boolean v0, p4, Lorg/apache/cordova/file/LocalFilesystemURL;->isDirectory:Z

    invoke-virtual {p0, p2, p4, p1, v0}, Lorg/apache/cordova/file/LocalFilesystem;->makeDestinationURL(Ljava/lang/String;Lorg/apache/cordova/file/LocalFilesystemURL;Lorg/apache/cordova/file/LocalFilesystemURL;Z)Lorg/apache/cordova/file/LocalFilesystemURL;

    move-result-object p1

    .line 344
    invoke-virtual {p0, p1}, Lorg/apache/cordova/file/LocalFilesystem;->toNativeUri(Lorg/apache/cordova/file/LocalFilesystemURL;)Landroid/net/Uri;

    move-result-object p2

    .line 345
    invoke-virtual {p3, p4}, Lorg/apache/cordova/file/Filesystem;->toNativeUri(Lorg/apache/cordova/file/LocalFilesystemURL;)Landroid/net/Uri;

    move-result-object v0

    .line 347
    invoke-virtual {p2, v0}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_8

    if-eqz p5, :cond_1

    .line 351
    invoke-virtual {p3, p4}, Lorg/apache/cordova/file/Filesystem;->canRemoveFileAtLocalURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 352
    :cond_0
    new-instance p1, Lorg/apache/cordova/file/InvalidModificationException;

    const-string p2, "Source URL is read-only (cannot move)"

    invoke-direct {p1, p2}, Lorg/apache/cordova/file/InvalidModificationException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 355
    :cond_1
    :goto_0
    new-instance v1, Ljava/io/File;

    invoke-virtual {p2}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 356
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_5

    .line 357
    iget-boolean v2, p4, Lorg/apache/cordova/file/LocalFilesystemURL;->isDirectory:Z

    if-nez v2, :cond_3

    invoke-virtual {v1}, Ljava/io/File;->isDirectory()Z

    move-result v2

    if-nez v2, :cond_2

    goto :goto_1

    .line 358
    :cond_2
    new-instance p1, Lorg/apache/cordova/file/InvalidModificationException;

    const-string p2, "Can\'t copy/move a file to an existing directory"

    invoke-direct {p1, p2}, Lorg/apache/cordova/file/InvalidModificationException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 359
    :cond_3
    :goto_1
    iget-boolean v2, p4, Lorg/apache/cordova/file/LocalFilesystemURL;->isDirectory:Z

    if-eqz v2, :cond_5

    invoke-virtual {v1}, Ljava/io/File;->isFile()Z

    move-result v2

    if-nez v2, :cond_4

    goto :goto_2

    .line 360
    :cond_4
    new-instance p1, Lorg/apache/cordova/file/InvalidModificationException;

    const-string p2, "Can\'t copy/move a directory to an existing file"

    invoke-direct {p1, p2}, Lorg/apache/cordova/file/InvalidModificationException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 364
    :cond_5
    :goto_2
    iget-boolean v2, p4, Lorg/apache/cordova/file/LocalFilesystemURL;->isDirectory:Z

    if-eqz v2, :cond_7

    .line 366
    invoke-virtual {p2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p2

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v2, 0x2f

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p2

    if-nez p2, :cond_6

    .line 369
    invoke-direct {p0, p3, p4, v1, p5}, Lorg/apache/cordova/file/LocalFilesystem;->copyDirectory(Lorg/apache/cordova/file/Filesystem;Lorg/apache/cordova/file/LocalFilesystemURL;Ljava/io/File;Z)V

    goto :goto_3

    .line 367
    :cond_6
    new-instance p1, Lorg/apache/cordova/file/InvalidModificationException;

    const-string p2, "Can\'t copy directory into itself"

    invoke-direct {p1, p2}, Lorg/apache/cordova/file/InvalidModificationException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 371
    :cond_7
    invoke-direct {p0, p3, p4, v1, p5}, Lorg/apache/cordova/file/LocalFilesystem;->copyFile(Lorg/apache/cordova/file/Filesystem;Lorg/apache/cordova/file/LocalFilesystemURL;Ljava/io/File;Z)V

    .line 373
    :goto_3
    invoke-virtual {p0, p1}, Lorg/apache/cordova/file/LocalFilesystem;->makeEntryForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Lorg/json/JSONObject;

    move-result-object p1

    return-object p1

    .line 348
    :cond_8
    new-instance p1, Lorg/apache/cordova/file/InvalidModificationException;

    const-string p2, "Can\'t copy onto itself"

    invoke-direct {p1, p2}, Lorg/apache/cordova/file/InvalidModificationException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 338
    :cond_9
    new-instance p1, Ljava/io/FileNotFoundException;

    const-string p2, "The source does not exist"

    invoke-direct {p1, p2}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public exists(Lorg/apache/cordova/file/LocalFilesystemURL;)Z
    .locals 1

    .line 190
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0, p1}, Lorg/apache/cordova/file/LocalFilesystem;->filesystemPathForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 191
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result p1

    return p1
.end method

.method public filesystemPathForFullPath(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 55
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lorg/apache/cordova/file/LocalFilesystem;->rootUri:Landroid/net/Uri;

    invoke-virtual {v1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public filesystemPathForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Ljava/lang/String;
    .locals 0

    .line 60
    iget-object p1, p1, Lorg/apache/cordova/file/LocalFilesystemURL;->path:Ljava/lang/String;

    invoke-virtual {p0, p1}, Lorg/apache/cordova/file/LocalFilesystem;->filesystemPathForFullPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getFileForLocalURL(Lorg/apache/cordova/file/LocalFilesystemURL;Ljava/lang/String;Lorg/json/JSONObject;Z)Lorg/json/JSONObject;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/cordova/file/FileExistsException;,
            Ljava/io/IOException;,
            Lorg/apache/cordova/file/TypeMismatchException;,
            Lorg/apache/cordova/file/EncodingException;,
            Lorg/json/JSONException;
        }
    .end annotation

    const/4 v0, 0x0

    if-eqz p3, :cond_1

    .line 118
    const-string v1, "create"

    invoke-virtual {p3, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 120
    const-string v0, "exclusive"

    invoke-virtual {p3, v0}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v0

    :cond_0
    move p3, v0

    move v0, v1

    goto :goto_0

    :cond_1
    move p3, v0

    .line 125
    :goto_0
    const-string v1, ":"

    invoke-virtual {p2, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_d

    .line 132
    const-string v1, "/"

    if-eqz p4, :cond_2

    invoke-virtual {p2, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 133
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 135
    :cond_2
    invoke-virtual {p2, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 136
    invoke-static {p2}, Lorg/apache/cordova/file/LocalFilesystem;->normalizePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lorg/apache/cordova/file/LocalFilesystem;->localUrlforFullPath(Ljava/lang/String;)Lorg/apache/cordova/file/LocalFilesystemURL;

    move-result-object p1

    goto :goto_1

    .line 138
    :cond_3
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object p1, p1, Lorg/apache/cordova/file/LocalFilesystemURL;->path:Ljava/lang/String;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lorg/apache/cordova/file/LocalFilesystem;->normalizePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lorg/apache/cordova/file/LocalFilesystem;->localUrlforFullPath(Ljava/lang/String;)Lorg/apache/cordova/file/LocalFilesystemURL;

    move-result-object p1

    .line 141
    :goto_1
    new-instance p2, Ljava/io/File;

    invoke-virtual {p0, p1}, Lorg/apache/cordova/file/LocalFilesystem;->filesystemPathForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p2, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    if-eqz v0, :cond_8

    if-eqz p3, :cond_5

    .line 144
    invoke-virtual {p2}, Ljava/io/File;->exists()Z

    move-result p3

    if-nez p3, :cond_4

    goto :goto_2

    .line 145
    :cond_4
    new-instance p1, Lorg/apache/cordova/file/FileExistsException;

    const-string p2, "create/exclusive fails"

    invoke-direct {p1, p2}, Lorg/apache/cordova/file/FileExistsException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_5
    :goto_2
    if-eqz p4, :cond_6

    .line 148
    invoke-virtual {p2}, Ljava/io/File;->mkdir()Z

    goto :goto_3

    .line 150
    :cond_6
    invoke-virtual {p2}, Ljava/io/File;->createNewFile()Z

    .line 152
    :goto_3
    invoke-virtual {p2}, Ljava/io/File;->exists()Z

    move-result p2

    if-eqz p2, :cond_7

    goto :goto_4

    .line 153
    :cond_7
    new-instance p1, Lorg/apache/cordova/file/FileExistsException;

    const-string p2, "create fails"

    invoke-direct {p1, p2}, Lorg/apache/cordova/file/FileExistsException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 157
    :cond_8
    invoke-virtual {p2}, Ljava/io/File;->exists()Z

    move-result p3

    if-eqz p3, :cond_c

    if-eqz p4, :cond_a

    .line 161
    invoke-virtual {p2}, Ljava/io/File;->isFile()Z

    move-result p2

    if-nez p2, :cond_9

    goto :goto_4

    .line 162
    :cond_9
    new-instance p1, Lorg/apache/cordova/file/TypeMismatchException;

    const-string p2, "path doesn\'t exist or is file"

    invoke-direct {p1, p2}, Lorg/apache/cordova/file/TypeMismatchException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 165
    :cond_a
    invoke-virtual {p2}, Ljava/io/File;->isDirectory()Z

    move-result p2

    if-nez p2, :cond_b

    .line 172
    :goto_4
    invoke-virtual {p0, p1}, Lorg/apache/cordova/file/LocalFilesystem;->makeEntryForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Lorg/json/JSONObject;

    move-result-object p1

    return-object p1

    .line 166
    :cond_b
    new-instance p1, Lorg/apache/cordova/file/TypeMismatchException;

    const-string p2, "path doesn\'t exist or is directory"

    invoke-direct {p1, p2}, Lorg/apache/cordova/file/TypeMismatchException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 158
    :cond_c
    new-instance p1, Ljava/io/FileNotFoundException;

    const-string p2, "path does not exist"

    invoke-direct {p1, p2}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 126
    :cond_d
    new-instance p1, Lorg/apache/cordova/file/EncodingException;

    const-string p2, "This path has an invalid \":\" in it."

    invoke-direct {p1, p2}, Lorg/apache/cordova/file/EncodingException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public getFileMetadataForLocalURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Lorg/json/JSONObject;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .line 243
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0, p1}, Lorg/apache/cordova/file/LocalFilesystem;->filesystemPathForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 245
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 249
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 252
    :try_start_0
    const-string v2, "size"

    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v3

    if-eqz v3, :cond_0

    const-wide/16 v3, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v3

    :goto_0
    invoke-virtual {v1, v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 253
    const-string v2, "type"

    iget-object v3, p0, Lorg/apache/cordova/file/LocalFilesystem;->resourceApi:Lorg/apache/cordova/CordovaResourceApi;

    invoke-static {v0}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/apache/cordova/CordovaResourceApi;->getMimeType(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 254
    const-string v2, "name"

    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 255
    const-string v2, "fullPath"

    iget-object p1, p1, Lorg/apache/cordova/file/LocalFilesystemURL;->path:Ljava/lang/String;

    invoke-virtual {v1, v2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 256
    const-string p1, "lastModifiedDate"

    invoke-virtual {v0}, Ljava/io/File;->lastModified()J

    move-result-wide v2

    invoke-virtual {v1, p1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    :catch_0
    const/4 p1, 0x0

    return-object p1

    .line 246
    :cond_1
    new-instance v0, Ljava/io/FileNotFoundException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "File at "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p1, p1, Lorg/apache/cordova/file/LocalFilesystemURL;->uri:Landroid/net/Uri;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v1, " does not exist."

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getFreeSpaceInBytes()J
    .locals 2

    .line 196
    iget-object v0, p0, Lorg/apache/cordova/file/LocalFilesystem;->rootUri:Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/cordova/file/DirectoryManager;->getFreeSpaceInBytes(Ljava/lang/String;)J

    move-result-wide v0

    return-wide v0
.end method

.method public listChildren(Lorg/apache/cordova/file/LocalFilesystemURL;)[Lorg/apache/cordova/file/LocalFilesystemURL;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .line 221
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0, p1}, Lorg/apache/cordova/file/LocalFilesystem;->filesystemPathForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 223
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result p1

    if-eqz p1, :cond_2

    .line 228
    invoke-virtual {v0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object p1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 233
    :cond_0
    array-length v0, p1

    new-array v0, v0, [Lorg/apache/cordova/file/LocalFilesystemURL;

    const/4 v1, 0x0

    .line 234
    :goto_0
    array-length v2, p1

    if-ge v1, v2, :cond_1

    .line 235
    aget-object v2, p1, v1

    invoke-virtual {v2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lorg/apache/cordova/file/LocalFilesystem;->URLforFilesystemPath(Ljava/lang/String;)Lorg/apache/cordova/file/LocalFilesystemURL;

    move-result-object v2

    aput-object v2, v0, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-object v0

    .line 225
    :cond_2
    new-instance p1, Ljava/io/FileNotFoundException;

    invoke-direct {p1}, Ljava/io/FileNotFoundException;-><init>()V

    throw p1
.end method

.method public recursiveRemoveFileAtLocalURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/cordova/file/FileExistsException;
        }
    .end annotation

    .line 201
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0, p1}, Lorg/apache/cordova/file/LocalFilesystem;->filesystemPathForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 202
    invoke-virtual {p0, v0}, Lorg/apache/cordova/file/LocalFilesystem;->removeDirRecursively(Ljava/io/File;)Z

    move-result p1

    return p1
.end method

.method protected removeDirRecursively(Ljava/io/File;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/cordova/file/FileExistsException;
        }
    .end annotation

    .line 206
    invoke-virtual {p1}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 207
    invoke-virtual {p1}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    .line 208
    invoke-virtual {p0, v3}, Lorg/apache/cordova/file/LocalFilesystem;->removeDirRecursively(Ljava/io/File;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 212
    :cond_0
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 p1, 0x1

    return p1

    .line 213
    :cond_1
    new-instance v0, Lorg/apache/cordova/file/FileExistsException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "could not delete: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Lorg/apache/cordova/file/FileExistsException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public removeFileAtLocalURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/cordova/file/InvalidModificationException;
        }
    .end annotation

    .line 178
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0, p1}, Lorg/apache/cordova/file/LocalFilesystem;->filesystemPathForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 181
    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result p1

    if-eqz p1, :cond_1

    invoke-virtual {v0}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object p1

    array-length p1, p1

    if-gtz p1, :cond_0

    goto :goto_0

    .line 182
    :cond_0
    new-instance p1, Lorg/apache/cordova/file/InvalidModificationException;

    const-string v0, "You can\'t delete a directory that is not empty."

    invoke-direct {p1, v0}, Lorg/apache/cordova/file/InvalidModificationException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 185
    :cond_1
    :goto_0
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    move-result p1

    return p1
.end method

.method public toLocalUri(Landroid/net/Uri;)Lorg/apache/cordova/file/LocalFilesystemURL;
    .locals 6

    .line 77
    const-string v0, "file"

    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    .line 80
    :cond_0
    new-instance v0, Ljava/io/File;

    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 82
    invoke-static {v0}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object p1

    .line 83
    iget-object v2, p0, Lorg/apache/cordova/file/LocalFilesystem;->rootUri:Landroid/net/Uri;

    invoke-virtual {v2}, Landroid/net/Uri;->getEncodedPath()Ljava/lang/String;

    move-result-object v2

    .line 84
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    const/4 v4, 0x1

    sub-int/2addr v3, v4

    const/4 v5, 0x0

    invoke-virtual {v2, v5, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 85
    invoke-virtual {p1}, Landroid/net/Uri;->getEncodedPath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_1

    return-object v1

    .line 88
    :cond_1
    invoke-virtual {p1}, Landroid/net/Uri;->getEncodedPath()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    .line 90
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_2

    .line 91
    invoke-virtual {p1, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    .line 94
    :cond_2
    invoke-virtual {p0}, Lorg/apache/cordova/file/LocalFilesystem;->createLocalUriBuilder()Landroid/net/Uri$Builder;

    move-result-object v1

    .line 96
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_3

    .line 97
    invoke-virtual {v1, p1}, Landroid/net/Uri$Builder;->appendEncodedPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 99
    :cond_3
    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result p1

    if-eqz p1, :cond_4

    .line 101
    const-string p1, ""

    invoke-virtual {v1, p1}, Landroid/net/Uri$Builder;->appendEncodedPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 103
    :cond_4
    invoke-virtual {v1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p1

    invoke-static {p1}, Lorg/apache/cordova/file/LocalFilesystemURL;->parse(Landroid/net/Uri;)Lorg/apache/cordova/file/LocalFilesystemURL;

    move-result-object p1

    return-object p1
.end method

.method public toNativeUri(Lorg/apache/cordova/file/LocalFilesystemURL;)Landroid/net/Uri;
    .locals 0

    .line 72
    iget-object p1, p1, Lorg/apache/cordova/file/LocalFilesystemURL;->path:Ljava/lang/String;

    invoke-virtual {p0, p1}, Lorg/apache/cordova/file/LocalFilesystem;->nativeUriForFullPath(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    return-object p1
.end method

.method public truncateFileAtURL(Lorg/apache/cordova/file/LocalFilesystemURL;J)J
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 446
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0, p1}, Lorg/apache/cordova/file/LocalFilesystem;->filesystemPathForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 448
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 452
    new-instance v0, Ljava/io/RandomAccessFile;

    invoke-virtual {p0, p1}, Lorg/apache/cordova/file/LocalFilesystem;->filesystemPathForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Ljava/lang/String;

    move-result-object p1

    const-string v1, "rw"

    invoke-direct {v0, p1, v1}, Ljava/io/RandomAccessFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 454
    :try_start_0
    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->length()J

    move-result-wide v1

    cmp-long p1, v1, p2

    if-ltz p1, :cond_0

    .line 455
    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object p1

    .line 456
    invoke-virtual {p1, p2, p3}, Ljava/nio/channels/FileChannel;->truncate(J)Ljava/nio/channels/FileChannel;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 462
    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->close()V

    return-wide p2

    .line 460
    :cond_0
    :try_start_1
    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->length()J

    move-result-wide p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 462
    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->close()V

    return-wide p1

    :catchall_0
    move-exception p1

    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->close()V

    .line 463
    throw p1

    .line 449
    :cond_1
    new-instance p2, Ljava/io/FileNotFoundException;

    new-instance p3, Ljava/lang/StringBuilder;

    const-string v0, "File at "

    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p1, p1, Lorg/apache/cordova/file/LocalFilesystemURL;->uri:Landroid/net/Uri;

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p3, " does not exist."

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public writeToFileAtURL(Lorg/apache/cordova/file/LocalFilesystemURL;Ljava/lang/String;IZ)J
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/cordova/file/NoModificationAllowedException;
        }
    .end annotation

    const/4 v0, 0x0

    if-lez p3, :cond_0

    int-to-long v1, p3

    .line 382
    invoke-virtual {p0, p1, v1, v2}, Lorg/apache/cordova/file/LocalFilesystem;->truncateFileAtURL(Lorg/apache/cordova/file/LocalFilesystemURL;J)J

    const/4 p3, 0x1

    goto :goto_0

    :cond_0
    move p3, v0

    :goto_0
    if-eqz p4, :cond_1

    .line 388
    invoke-static {p2, v0}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object p2

    goto :goto_1

    .line 390
    :cond_1
    invoke-static {}, Ljava/nio/charset/Charset;->defaultCharset()Ljava/nio/charset/Charset;

    move-result-object p4

    invoke-virtual {p2, p4}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p2

    .line 392
    :goto_1
    new-instance p4, Ljava/io/ByteArrayInputStream;

    invoke-direct {p4, p2}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 395
    :try_start_0
    array-length v1, p2

    new-array v2, v1, [B

    .line 396
    invoke-virtual {p0, p1}, Lorg/apache/cordova/file/LocalFilesystem;->filesystemPathForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Ljava/lang/String;

    move-result-object v3

    .line 397
    new-instance v4, Ljava/io/FileOutputStream;

    invoke-direct {v4, v3, p3}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;Z)V
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    .line 399
    :try_start_1
    invoke-virtual {p4, v2, v0, v1}, Ljava/io/ByteArrayInputStream;->read([BII)I

    .line 400
    array-length p3, p2

    invoke-virtual {v4, v2, v0, p3}, Ljava/io/FileOutputStream;->write([BII)V

    .line 401
    invoke-virtual {v4}, Ljava/io/FileOutputStream;->flush()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 404
    :try_start_2
    invoke-virtual {v4}, Ljava/io/FileOutputStream;->close()V

    .line 406
    invoke-direct {p0, v3}, Lorg/apache/cordova/file/LocalFilesystem;->isPublicDirectory(Ljava/lang/String;)Z

    move-result p3

    if-eqz p3, :cond_2

    .line 407
    new-instance p3, Ljava/io/File;

    invoke-direct {p3, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {p3}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object p3

    invoke-direct {p0, p3}, Lorg/apache/cordova/file/LocalFilesystem;->broadcastNewFile(Landroid/net/Uri;)V
    :try_end_2
    .catch Ljava/lang/NullPointerException; {:try_start_2 .. :try_end_2} :catch_0

    .line 418
    :cond_2
    array-length p1, p2

    int-to-long p1, p1

    return-wide p1

    :catchall_0
    move-exception p2

    .line 404
    :try_start_3
    invoke-virtual {v4}, Ljava/io/FileOutputStream;->close()V

    .line 405
    throw p2
    :try_end_3
    .catch Ljava/lang/NullPointerException; {:try_start_3 .. :try_end_3} :catch_0

    :catch_0
    move-exception p2

    .line 413
    new-instance p3, Lorg/apache/cordova/file/NoModificationAllowedException;

    invoke-virtual {p1}, Lorg/apache/cordova/file/LocalFilesystemURL;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p3, p1}, Lorg/apache/cordova/file/NoModificationAllowedException;-><init>(Ljava/lang/String;)V

    .line 414
    invoke-virtual {p3, p2}, Lorg/apache/cordova/file/NoModificationAllowedException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 415
    throw p3
.end method
