.class public abstract Lorg/apache/cordova/file/Filesystem;
.super Ljava/lang/Object;
.source "Filesystem.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/cordova/file/Filesystem$LimitedInputStream;,
        Lorg/apache/cordova/file/Filesystem$ReadFileCallback;
    }
.end annotation


# static fields
.field static DEFAULT_HOSTNAME:Ljava/lang/String; = "localhost"

.field static SCHEME_HTTPS:Ljava/lang/String; = "https"


# instance fields
.field public final name:Ljava/lang/String;

.field protected final preferences:Lorg/apache/cordova/CordovaPreferences;

.field protected final resourceApi:Lorg/apache/cordova/CordovaResourceApi;

.field private rootEntry:Lorg/json/JSONObject;

.field protected final rootUri:Landroid/net/Uri;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/net/Uri;Ljava/lang/String;Lorg/apache/cordova/CordovaResourceApi;Lorg/apache/cordova/CordovaPreferences;)V
    .locals 0

    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    iput-object p1, p0, Lorg/apache/cordova/file/Filesystem;->rootUri:Landroid/net/Uri;

    .line 51
    iput-object p2, p0, Lorg/apache/cordova/file/Filesystem;->name:Ljava/lang/String;

    .line 52
    iput-object p3, p0, Lorg/apache/cordova/file/Filesystem;->resourceApi:Lorg/apache/cordova/CordovaResourceApi;

    .line 53
    iput-object p4, p0, Lorg/apache/cordova/file/Filesystem;->preferences:Lorg/apache/cordova/CordovaPreferences;

    return-void
.end method

.method public static makeEntryForURL(Lorg/apache/cordova/file/LocalFilesystemURL;Landroid/net/Uri;)Lorg/json/JSONObject;
    .locals 6

    .line 62
    const-string v0, "/"

    :try_start_0
    iget-object v1, p0, Lorg/apache/cordova/file/LocalFilesystemURL;->path:Ljava/lang/String;

    .line 63
    invoke-virtual {v1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    const/4 v3, 0x0

    .line 64
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    sub-int/2addr v4, v2

    invoke-virtual {v1, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    const-string v3, "/+"

    invoke-virtual {v2, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 65
    array-length v3, v2

    add-int/lit8 v3, v3, -0x1

    aget-object v2, v2, v3

    .line 67
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 68
    const-string v4, "isFile"

    iget-boolean v5, p0, Lorg/apache/cordova/file/LocalFilesystemURL;->isDirectory:Z

    xor-int/lit8 v5, v5, 0x1

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 69
    const-string v4, "isDirectory"

    iget-boolean v5, p0, Lorg/apache/cordova/file/LocalFilesystemURL;->isDirectory:Z

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 70
    const-string v4, "name"

    invoke-virtual {v3, v4, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 71
    const-string v2, "fullPath"

    invoke-virtual {v3, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 74
    const-string v1, "filesystemName"

    iget-object v2, p0, Lorg/apache/cordova/file/LocalFilesystemURL;->fsName:Ljava/lang/String;

    invoke-virtual {v3, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 76
    const-string v1, "filesystem"

    const-string v2, "temporary"

    iget-object v4, p0, Lorg/apache/cordova/file/LocalFilesystemURL;->fsName:Ljava/lang/String;

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    xor-int/lit8 v2, v2, 0x1

    invoke-virtual {v3, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 78
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p1

    .line 79
    iget-boolean p0, p0, Lorg/apache/cordova/file/LocalFilesystemURL;->isDirectory:Z

    if-eqz p0, :cond_0

    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_0

    .line 80
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 82
    :cond_0
    const-string p0, "nativeURL"

    invoke-virtual {v3, p0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v3

    :catch_0
    move-exception p0

    .line 85
    invoke-virtual {p0}, Lorg/json/JSONException;->printStackTrace()V

    .line 86
    new-instance p1, Ljava/lang/RuntimeException;

    invoke-direct {p1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw p1
.end method

.method protected static normalizePath(Ljava/lang/String;)Ljava/lang/String;
    .locals 6

    .line 168
    const-string v0, "/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    .line 169
    const-string v2, "/+"

    if-eqz v1, :cond_0

    .line 170
    const-string v3, ""

    invoke-virtual {p0, v2, v3}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 172
    :cond_0
    new-instance v3, Ljava/util/ArrayList;

    invoke-virtual {p0, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    invoke-direct {v3, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    const/4 p0, 0x0

    .line 173
    :goto_0
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v4, 0x1

    if-ge p0, v2, :cond_2

    .line 174
    invoke-virtual {v3, p0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    const-string v5, ".."

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 175
    invoke-virtual {v3, p0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    if-lez p0, :cond_1

    add-int/lit8 v2, p0, -0x1

    .line 177
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    add-int/lit8 p0, p0, -0x1

    :cond_1
    add-int/2addr p0, v4

    goto :goto_0

    .line 182
    :cond_2
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 183
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 184
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 185
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    :cond_3
    if-eqz v1, :cond_4

    .line 188
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 190
    :cond_4
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method abstract URLforFilesystemPath(Ljava/lang/String;)Lorg/apache/cordova/file/LocalFilesystemURL;
.end method

.method abstract canRemoveFileAtLocalURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Z
.end method

.method public copyFileToURL(Lorg/apache/cordova/file/LocalFilesystemURL;Ljava/lang/String;Lorg/apache/cordova/file/Filesystem;Lorg/apache/cordova/file/LocalFilesystemURL;Z)Lorg/json/JSONObject;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/cordova/file/InvalidModificationException;,
            Lorg/json/JSONException;,
            Lorg/apache/cordova/file/NoModificationAllowedException;,
            Lorg/apache/cordova/file/FileExistsException;
        }
    .end annotation

    if-eqz p5, :cond_1

    .line 247
    invoke-virtual {p3, p4}, Lorg/apache/cordova/file/Filesystem;->canRemoveFileAtLocalURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 248
    :cond_0
    new-instance p1, Lorg/apache/cordova/file/NoModificationAllowedException;

    const-string p2, "Cannot move file at source URL"

    invoke-direct {p1, p2}, Lorg/apache/cordova/file/NoModificationAllowedException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 250
    :cond_1
    :goto_0
    iget-boolean v0, p4, Lorg/apache/cordova/file/LocalFilesystemURL;->isDirectory:Z

    invoke-virtual {p0, p2, p4, p1, v0}, Lorg/apache/cordova/file/Filesystem;->makeDestinationURL(Ljava/lang/String;Lorg/apache/cordova/file/LocalFilesystemURL;Lorg/apache/cordova/file/LocalFilesystemURL;Z)Lorg/apache/cordova/file/LocalFilesystemURL;

    move-result-object p1

    .line 252
    invoke-virtual {p3, p4}, Lorg/apache/cordova/file/Filesystem;->toNativeUri(Lorg/apache/cordova/file/LocalFilesystemURL;)Landroid/net/Uri;

    move-result-object p2

    .line 254
    iget-object v0, p0, Lorg/apache/cordova/file/Filesystem;->resourceApi:Lorg/apache/cordova/CordovaResourceApi;

    invoke-virtual {v0, p2}, Lorg/apache/cordova/CordovaResourceApi;->openForRead(Landroid/net/Uri;)Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;

    move-result-object p2

    .line 257
    :try_start_0
    invoke-virtual {p0, p1}, Lorg/apache/cordova/file/Filesystem;->getOutputStreamForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Ljava/io/OutputStream;

    move-result-object v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 263
    iget-object v1, p0, Lorg/apache/cordova/file/Filesystem;->resourceApi:Lorg/apache/cordova/CordovaResourceApi;

    invoke-virtual {v1, p2, v0}, Lorg/apache/cordova/CordovaResourceApi;->copyResource(Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;Ljava/io/OutputStream;)V

    if-eqz p5, :cond_2

    .line 266
    invoke-virtual {p3, p4}, Lorg/apache/cordova/file/Filesystem;->removeFileAtLocalURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Z

    .line 268
    :cond_2
    invoke-virtual {p0, p1}, Lorg/apache/cordova/file/Filesystem;->getEntryForLocalURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Lorg/json/JSONObject;

    move-result-object p1

    return-object p1

    :catch_0
    move-exception p1

    .line 259
    iget-object p2, p2, Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;->inputStream:Ljava/io/InputStream;

    invoke-virtual {p2}, Ljava/io/InputStream;->close()V

    .line 260
    throw p1
.end method

.method protected createLocalUriBuilder()Landroid/net/Uri$Builder;
    .locals 4

    .line 339
    iget-object v0, p0, Lorg/apache/cordova/file/Filesystem;->preferences:Lorg/apache/cordova/CordovaPreferences;

    const-string v1, "scheme"

    sget-object v2, Lorg/apache/cordova/file/Filesystem;->SCHEME_HTTPS:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/CordovaPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    .line 340
    iget-object v1, p0, Lorg/apache/cordova/file/Filesystem;->preferences:Lorg/apache/cordova/CordovaPreferences;

    const-string v2, "hostname"

    sget-object v3, Lorg/apache/cordova/file/Filesystem;->DEFAULT_HOSTNAME:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Lorg/apache/cordova/CordovaPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    .line 341
    iget-object v2, p0, Lorg/apache/cordova/file/Filesystem;->name:Ljava/lang/String;

    invoke-static {v2}, Lorg/apache/cordova/file/LocalFilesystemURL;->fsNameToCdvKeyword(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 343
    new-instance v3, Landroid/net/Uri$Builder;

    invoke-direct {v3}, Landroid/net/Uri$Builder;-><init>()V

    .line 344
    invoke-virtual {v3, v0}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    .line 345
    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->authority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    .line 346
    invoke-virtual {v0, v2}, Landroid/net/Uri$Builder;->path(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    return-object v0
.end method

.method public exists(Lorg/apache/cordova/file/LocalFilesystemURL;)Z
    .locals 0

    .line 136
    :try_start_0
    invoke-virtual {p0, p1}, Lorg/apache/cordova/file/Filesystem;->getFileMetadataForLocalURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    const/4 p1, 0x1

    return p1

    :catch_0
    const/4 p1, 0x0

    return p1
.end method

.method abstract filesystemPathForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Ljava/lang/String;
.end method

.method public getEntryForLocalURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Lorg/json/JSONObject;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 101
    invoke-virtual {p0, p1}, Lorg/apache/cordova/file/Filesystem;->makeEntryForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Lorg/json/JSONObject;

    move-result-object p1

    return-object p1
.end method

.method abstract getFileForLocalURL(Lorg/apache/cordova/file/LocalFilesystemURL;Ljava/lang/String;Lorg/json/JSONObject;Z)Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/cordova/file/FileExistsException;,
            Ljava/io/IOException;,
            Lorg/apache/cordova/file/TypeMismatchException;,
            Lorg/apache/cordova/file/EncodingException;,
            Lorg/json/JSONException;
        }
    .end annotation
.end method

.method abstract getFileMetadataForLocalURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation
.end method

.method public getFreeSpaceInBytes()J
    .locals 2

    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public getOutputStreamForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Ljava/io/OutputStream;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 272
    iget-object v0, p0, Lorg/apache/cordova/file/Filesystem;->resourceApi:Lorg/apache/cordova/CordovaResourceApi;

    invoke-virtual {p0, p1}, Lorg/apache/cordova/file/Filesystem;->toNativeUri(Lorg/apache/cordova/file/LocalFilesystemURL;)Landroid/net/Uri;

    move-result-object p1

    invoke-virtual {v0, p1}, Lorg/apache/cordova/CordovaResourceApi;->openOutputStream(Landroid/net/Uri;)Ljava/io/OutputStream;

    move-result-object p1

    return-object p1
.end method

.method public getParentForLocalURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Lorg/json/JSONObject;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 213
    iget-object v0, p1, Lorg/apache/cordova/file/LocalFilesystemURL;->uri:Landroid/net/Uri;

    .line 214
    new-instance v1, Ljava/io/File;

    iget-object v2, p1, Lorg/apache/cordova/file/LocalFilesystemURL;->uri:Landroid/net/Uri;

    invoke-virtual {v2}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v1

    .line 215
    const-string v2, "/"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 216
    iget-object p1, p1, Lorg/apache/cordova/file/LocalFilesystemURL;->uri:Landroid/net/Uri;

    invoke-virtual {p1}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object p1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x2f

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/net/Uri$Builder;->path(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v0

    .line 218
    :cond_0
    invoke-static {v0}, Lorg/apache/cordova/file/LocalFilesystemURL;->parse(Landroid/net/Uri;)Lorg/apache/cordova/file/LocalFilesystemURL;

    move-result-object p1

    invoke-virtual {p0, p1}, Lorg/apache/cordova/file/Filesystem;->getEntryForLocalURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Lorg/json/JSONObject;

    move-result-object p1

    return-object p1
.end method

.method public getRootEntry()Lorg/json/JSONObject;
    .locals 1

    .line 206
    iget-object v0, p0, Lorg/apache/cordova/file/Filesystem;->rootEntry:Lorg/json/JSONObject;

    if-nez v0, :cond_0

    .line 207
    iget-object v0, p0, Lorg/apache/cordova/file/Filesystem;->rootUri:Landroid/net/Uri;

    invoke-virtual {p0, v0}, Lorg/apache/cordova/file/Filesystem;->makeEntryForNativeUri(Landroid/net/Uri;)Lorg/json/JSONObject;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/cordova/file/Filesystem;->rootEntry:Lorg/json/JSONObject;

    .line 209
    :cond_0
    iget-object v0, p0, Lorg/apache/cordova/file/Filesystem;->rootEntry:Lorg/json/JSONObject;

    return-object v0
.end method

.method public getRootUri()Landroid/net/Uri;
    .locals 1

    .line 131
    iget-object v0, p0, Lorg/apache/cordova/file/Filesystem;->rootUri:Landroid/net/Uri;

    return-object v0
.end method

.method abstract listChildren(Lorg/apache/cordova/file/LocalFilesystemURL;)[Lorg/apache/cordova/file/LocalFilesystemURL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation
.end method

.method public localUrlforFullPath(Ljava/lang/String;)Lorg/apache/cordova/file/LocalFilesystemURL;
    .locals 0

    .line 156
    invoke-virtual {p0, p1}, Lorg/apache/cordova/file/Filesystem;->nativeUriForFullPath(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 158
    invoke-virtual {p0, p1}, Lorg/apache/cordova/file/Filesystem;->toLocalUri(Landroid/net/Uri;)Lorg/apache/cordova/file/LocalFilesystemURL;

    move-result-object p1

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method protected makeDestinationURL(Ljava/lang/String;Lorg/apache/cordova/file/LocalFilesystemURL;Lorg/apache/cordova/file/LocalFilesystemURL;Z)Lorg/apache/cordova/file/LocalFilesystemURL;
    .locals 1

    .line 223
    const-string v0, "null"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, ""

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 224
    :cond_0
    iget-object p1, p2, Lorg/apache/cordova/file/LocalFilesystemURL;->uri:Landroid/net/Uri;

    invoke-virtual {p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object p1

    .line 227
    :cond_1
    iget-object p2, p3, Lorg/apache/cordova/file/LocalFilesystemURL;->uri:Landroid/net/Uri;

    invoke-virtual {p2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p2

    .line 228
    const-string p3, "/"

    invoke-virtual {p2, p3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 229
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    .line 231
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    :goto_0
    if-eqz p4, :cond_3

    .line 234
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const/16 p2, 0x2f

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 236
    :cond_3
    invoke-static {p1}, Lorg/apache/cordova/file/LocalFilesystemURL;->parse(Ljava/lang/String;)Lorg/apache/cordova/file/LocalFilesystemURL;

    move-result-object p1

    return-object p1
.end method

.method public makeEntryForFile(Ljava/io/File;)Lorg/json/JSONObject;
    .locals 0

    .line 105
    invoke-static {p1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object p1

    invoke-virtual {p0, p1}, Lorg/apache/cordova/file/Filesystem;->makeEntryForNativeUri(Landroid/net/Uri;)Lorg/json/JSONObject;

    move-result-object p1

    return-object p1
.end method

.method public makeEntryForNativeUri(Landroid/net/Uri;)Lorg/json/JSONObject;
    .locals 1

    .line 96
    invoke-virtual {p0, p1}, Lorg/apache/cordova/file/Filesystem;->toLocalUri(Landroid/net/Uri;)Lorg/apache/cordova/file/LocalFilesystemURL;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    .line 97
    :cond_0
    invoke-static {v0, p1}, Lorg/apache/cordova/file/Filesystem;->makeEntryForURL(Lorg/apache/cordova/file/LocalFilesystemURL;Landroid/net/Uri;)Lorg/json/JSONObject;

    move-result-object p1

    :goto_0
    return-object p1
.end method

.method public makeEntryForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Lorg/json/JSONObject;
    .locals 1

    .line 91
    invoke-virtual {p0, p1}, Lorg/apache/cordova/file/Filesystem;->toNativeUri(Lorg/apache/cordova/file/LocalFilesystemURL;)Landroid/net/Uri;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    .line 92
    :cond_0
    invoke-static {p1, v0}, Lorg/apache/cordova/file/Filesystem;->makeEntryForURL(Lorg/apache/cordova/file/LocalFilesystemURL;Landroid/net/Uri;)Lorg/json/JSONObject;

    move-result-object p1

    :goto_0
    return-object p1
.end method

.method public nativeUriForFullPath(Ljava/lang/String;)Landroid/net/Uri;
    .locals 1

    if-eqz p1, :cond_1

    .line 146
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object p1

    invoke-virtual {p1}, Landroid/net/Uri;->getEncodedPath()Ljava/lang/String;

    move-result-object p1

    .line 147
    const-string v0, "/"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    .line 148
    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    .line 150
    :cond_0
    iget-object v0, p0, Lorg/apache/cordova/file/Filesystem;->rootUri:Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/net/Uri$Builder;->appendEncodedPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    :goto_0
    return-object p1
.end method

.method public final readEntriesAtLocalURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Lorg/json/JSONArray;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .line 118
    invoke-virtual {p0, p1}, Lorg/apache/cordova/file/Filesystem;->listChildren(Lorg/apache/cordova/file/LocalFilesystemURL;)[Lorg/apache/cordova/file/LocalFilesystemURL;

    move-result-object p1

    .line 119
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    if-eqz p1, :cond_0

    .line 121
    array-length v1, p1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, p1, v2

    .line 122
    invoke-virtual {p0, v3}, Lorg/apache/cordova/file/Filesystem;->makeEntryForURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method public readFileAtURL(Lorg/apache/cordova/file/LocalFilesystemURL;JJLorg/apache/cordova/file/Filesystem$ReadFileCallback;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 277
    iget-object v0, p0, Lorg/apache/cordova/file/Filesystem;->resourceApi:Lorg/apache/cordova/CordovaResourceApi;

    invoke-virtual {p0, p1}, Lorg/apache/cordova/file/Filesystem;->toNativeUri(Lorg/apache/cordova/file/LocalFilesystemURL;)Landroid/net/Uri;

    move-result-object p1

    invoke-virtual {v0, p1}, Lorg/apache/cordova/CordovaResourceApi;->openForRead(Landroid/net/Uri;)Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;

    move-result-object p1

    const-wide/16 v0, 0x0

    cmp-long v2, p4, v0

    if-gez v2, :cond_0

    .line 279
    iget-wide p4, p1, Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;->length:J

    :cond_0
    sub-long v2, p4, p2

    cmp-long v0, p2, v0

    if-lez v0, :cond_1

    .line 284
    :try_start_0
    iget-object v0, p1, Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;->inputStream:Ljava/io/InputStream;

    invoke-virtual {v0, p2, p3}, Ljava/io/InputStream;->skip(J)J

    .line 286
    :cond_1
    iget-object p2, p1, Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;->inputStream:Ljava/io/InputStream;

    .line 287
    iget-wide v0, p1, Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;->length:J

    cmp-long p3, p4, v0

    if-gez p3, :cond_2

    .line 288
    new-instance p3, Lorg/apache/cordova/file/Filesystem$LimitedInputStream;

    invoke-direct {p3, p0, p2, v2, v3}, Lorg/apache/cordova/file/Filesystem$LimitedInputStream;-><init>(Lorg/apache/cordova/file/Filesystem;Ljava/io/InputStream;J)V

    move-object p2, p3

    .line 290
    :cond_2
    iget-object p3, p1, Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;->mimeType:Ljava/lang/String;

    invoke-interface {p6, p2, p3}, Lorg/apache/cordova/file/Filesystem$ReadFileCallback;->handleData(Ljava/io/InputStream;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 292
    iget-object p1, p1, Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;->inputStream:Ljava/io/InputStream;

    invoke-virtual {p1}, Ljava/io/InputStream;->close()V

    return-void

    :catchall_0
    move-exception p2

    iget-object p1, p1, Lorg/apache/cordova/CordovaResourceApi$OpenForReadResult;->inputStream:Ljava/io/InputStream;

    invoke-virtual {p1}, Ljava/io/InputStream;->close()V

    .line 293
    throw p2
.end method

.method abstract recursiveRemoveFileAtLocalURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/cordova/file/FileExistsException;,
            Lorg/apache/cordova/file/NoModificationAllowedException;
        }
    .end annotation
.end method

.method abstract removeFileAtLocalURL(Lorg/apache/cordova/file/LocalFilesystemURL;)Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/cordova/file/InvalidModificationException;,
            Lorg/apache/cordova/file/NoModificationAllowedException;
        }
    .end annotation
.end method

.method public abstract toLocalUri(Landroid/net/Uri;)Lorg/apache/cordova/file/LocalFilesystemURL;
.end method

.method public abstract toNativeUri(Lorg/apache/cordova/file/LocalFilesystemURL;)Landroid/net/Uri;
.end method

.method abstract truncateFileAtURL(Lorg/apache/cordova/file/LocalFilesystemURL;J)J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/cordova/file/NoModificationAllowedException;
        }
    .end annotation
.end method

.method abstract writeToFileAtURL(Lorg/apache/cordova/file/LocalFilesystemURL;Ljava/lang/String;IZ)J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/cordova/file/NoModificationAllowedException;,
            Ljava/io/IOException;
        }
    .end annotation
.end method
