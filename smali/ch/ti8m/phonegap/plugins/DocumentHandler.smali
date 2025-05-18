.class public Lch/ti8m/phonegap/plugins/DocumentHandler;
.super Lorg/apache/cordova/CordovaPlugin;
.source "DocumentHandler.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lch/ti8m/phonegap/plugins/DocumentHandler$FileDownloaderAsyncTask;
    }
.end annotation


# static fields
.field public static final ERROR_FILE_NOT_FOUND:I = 0x2

.field public static final ERROR_GENERIC_THROWABLE:I = 0x3

.field public static final ERROR_NO_HANDLER_FOR_DATA_TYPE:I = 0x35

.field public static final ERROR_UNKNOWN_ERROR:I = 0x1

.field private static final FILE_PREFIX:Ljava/lang/String; = "DH_"

.field private static FILE_PROVIDER_PACKAGE_ID:Ljava/lang/String; = null

.field public static final HANDLE_DOCUMENT_ACTION:Ljava/lang/String; = "HandleDocumentWithURL"

.field private static final HUAWEI_MANUFACTURER:Ljava/lang/String; = "Huawei"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 30
    invoke-direct {p0}, Lorg/apache/cordova/CordovaPlugin;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lch/ti8m/phonegap/plugins/DocumentHandler;Ljava/lang/String;Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)Ljava/io/File;
    .locals 0

    .line 30
    invoke-direct {p0, p1, p2, p3}, Lch/ti8m/phonegap/plugins/DocumentHandler;->downloadFile(Ljava/lang/String;Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)Ljava/io/File;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$100(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 30
    invoke-static {p0}, Lch/ti8m/phonegap/plugins/DocumentHandler;->getMimeType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$200()Ljava/lang/String;
    .locals 1

    .line 30
    sget-object v0, Lch/ti8m/phonegap/plugins/DocumentHandler;->FILE_PROVIDER_PACKAGE_ID:Ljava/lang/String;

    return-object v0
.end method

.method private buildErrorObject(ILjava/lang/Throwable;Ljava/io/File;Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 4

    .line 176
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const/4 v1, 0x0

    .line 178
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    if-eqz p4, :cond_0

    .line 181
    const-string v2, "/api/download/"

    invoke-virtual {p4, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_0

    .line 183
    invoke-virtual {p4, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p4

    const-string v2, "/api/download/trace"

    invoke-virtual {p4, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p4

    if-eqz p4, :cond_0

    const/4 p4, 0x1

    .line 184
    invoke-static {p4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    .line 189
    :cond_0
    :try_start_0
    const-string p4, "code"

    invoke-virtual {v0, p4, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 190
    const-string p1, "error"

    invoke-virtual {p2}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object p4

    invoke-virtual {v0, p1, p4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    if-eqz p3, :cond_1

    .line 193
    const-string p1, "file"

    invoke-virtual {p3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {v0, p1, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 196
    :cond_1
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_2

    .line 197
    new-instance p1, Ljava/io/StringWriter;

    invoke-direct {p1}, Ljava/io/StringWriter;-><init>()V

    .line 198
    new-instance p3, Ljava/io/PrintWriter;

    invoke-direct {p3, p1}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    .line 199
    invoke-virtual {p2, p3}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintWriter;)V

    .line 200
    const-string p2, "trace"

    invoke-virtual {p1}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 203
    sget-object p2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance p3, Ljava/lang/StringBuilder;

    const-string p4, "Unexpected JSONException: "

    invoke-direct {p3, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lorg/json/JSONException;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    :cond_2
    :goto_0
    return-object v0
.end method

.method private downloadFile(Ljava/lang/String;Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)Ljava/io/File;
    .locals 10

    const-string v0, "."

    const-string v1, "creating file with extension: "

    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 79
    :try_start_0
    invoke-static {}, Landroid/webkit/CookieManager;->getInstance()Landroid/webkit/CookieManager;

    move-result-object v4

    .line 83
    invoke-virtual {v4, p2}, Landroid/webkit/CookieManager;->getCookie(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_0

    .line 84
    invoke-virtual {v4, p2}, Landroid/webkit/CookieManager;->getCookie(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_0

    :cond_0
    move-object v4, v3

    .line 87
    :goto_0
    new-instance v5, Ljava/net/URL;

    invoke-direct {v5, p2}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 88
    invoke-virtual {v5}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v5

    check-cast v5, Ljava/net/HttpURLConnection;

    if-eqz v4, :cond_1

    .line 90
    const-string v6, "Cookie"

    invoke-virtual {v5, v6, v4}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    const/16 v4, 0x2710

    .line 94
    invoke-virtual {v5, v4}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 96
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v4

    .line 98
    iget-object v5, p0, Lch/ti8m/phonegap/plugins/DocumentHandler;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v5}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroidx/appcompat/app/AppCompatActivity;

    move-result-object v5

    invoke-virtual {v5}, Landroidx/appcompat/app/AppCompatActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    .line 111
    sget-object v6, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    const-string v7, "Huawei"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    const/4 v7, 0x0

    if-eqz v6, :cond_3

    .line 113
    invoke-virtual {v5, v3}, Landroid/content/Context;->getExternalFilesDirs(Ljava/lang/String;)[Ljava/io/File;

    move-result-object v5

    .line 115
    array-length v6, v5

    if-lt v6, v2, :cond_2

    .line 118
    aget-object v5, v5, v7

    goto :goto_1

    .line 116
    :cond_2
    new-instance p1, Ljava/lang/RuntimeException;

    const-string v0, "No external storage directories found"

    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 120
    :cond_3
    invoke-virtual {v5, v3}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v5

    :goto_1
    if-eqz v5, :cond_7

    .line 129
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_5

    .line 131
    invoke-static {p2}, Lch/ti8m/phonegap/plugins/DocumentHandler;->getExtensionFromUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_4

    .line 133
    sget-object p1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v6, "no extension: default to pdf"

    invoke-virtual {p1, v6}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 134
    const-string p1, "pdf"

    .line 136
    :cond_4
    sget-object v6, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v6, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 138
    const-string v1, "DH_"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1, v5}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Ljava/io/File;

    move-result-object p1

    goto :goto_2

    .line 140
    :cond_5
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v5, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_5
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_4
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 141
    :try_start_1
    invoke-virtual {v0}, Ljava/io/File;->createNewFile()Z
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-object p1, v0

    .line 146
    :goto_2
    :try_start_2
    invoke-virtual {p1, v2, v7}, Ljava/io/File;->setReadable(ZZ)Z

    .line 147
    new-instance v0, Ljava/io/FileOutputStream;

    invoke-direct {v0, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    const/16 v1, 0x400

    .line 149
    new-array v1, v1, [B

    .line 150
    invoke-virtual {v4, v1}, Ljava/io/InputStream;->read([B)I

    move-result v5

    :goto_3
    if-lez v5, :cond_6

    .line 152
    invoke-virtual {v0, v1, v7, v5}, Ljava/io/FileOutputStream;->write([BII)V

    .line 153
    invoke-virtual {v4, v1}, Ljava/io/InputStream;->read([B)I

    move-result v5

    goto :goto_3

    .line 155
    :cond_6
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V

    .line 156
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V
    :try_end_2
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    return-object p1

    :catchall_0
    move-exception v0

    move-object v9, v0

    move-object v0, p1

    move-object p1, v9

    goto :goto_4

    :catch_0
    move-exception v0

    move-object v9, v0

    move-object v0, p1

    move-object p1, v9

    goto :goto_5

    :catch_1
    move-exception v0

    move-object v9, v0

    move-object v0, p1

    move-object p1, v9

    goto :goto_6

    :catchall_1
    move-exception p1

    goto :goto_4

    :catch_2
    move-exception p1

    goto :goto_5

    :catch_3
    move-exception p1

    goto :goto_6

    .line 124
    :cond_7
    :try_start_3
    new-instance p1, Ljava/lang/Exception;

    const-string v0, "Storage is unavailable"

    invoke-direct {p1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_3
    .catch Ljava/io/FileNotFoundException; {:try_start_3 .. :try_end_3} :catch_5
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_4
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    :catchall_2
    move-exception p1

    move-object v0, v3

    .line 168
    :goto_4
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    const/4 v1, 0x3

    .line 169
    invoke-direct {p0, v1, p1, v0, p2}, Lch/ti8m/phonegap/plugins/DocumentHandler;->buildErrorObject(ILjava/lang/Throwable;Ljava/io/File;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    invoke-virtual {p3, p1}, Lorg/apache/cordova/CallbackContext;->error(Lorg/json/JSONObject;)V

    return-object v3

    :catch_4
    move-exception p1

    move-object v0, v3

    .line 164
    :goto_5
    invoke-virtual {p1}, Ljava/io/IOException;->printStackTrace()V

    .line 165
    invoke-direct {p0, v2, p1, v0, p2}, Lch/ti8m/phonegap/plugins/DocumentHandler;->buildErrorObject(ILjava/lang/Throwable;Ljava/io/File;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    invoke-virtual {p3, p1}, Lorg/apache/cordova/CallbackContext;->error(Lorg/json/JSONObject;)V

    return-object v3

    :catch_5
    move-exception p1

    move-object v0, v3

    .line 160
    :goto_6
    invoke-virtual {p1}, Ljava/io/FileNotFoundException;->printStackTrace()V

    const/4 v1, 0x2

    .line 161
    invoke-direct {p0, v1, p1, v0, p2}, Lch/ti8m/phonegap/plugins/DocumentHandler;->buildErrorObject(ILjava/lang/Throwable;Ljava/io/File;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    invoke-virtual {p3, p1}, Lorg/apache/cordova/CallbackContext;->error(Lorg/json/JSONObject;)V

    return-object v3
.end method

.method private static getExtensionFromUrl(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    const/16 v0, 0x2e

    .line 220
    invoke-virtual {p0, v0}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    add-int/lit8 v0, v0, 0x1

    .line 223
    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return-object p0
.end method

.method private static getMimeType(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 240
    invoke-static {p0}, Lch/ti8m/phonegap/plugins/DocumentHandler;->getExtensionFromUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_0

    .line 243
    invoke-static {}, Landroid/webkit/MimeTypeMap;->getSingleton()Landroid/webkit/MimeTypeMap;

    move-result-object v0

    .line 244
    invoke-virtual {v0, p0}, Landroid/webkit/MimeTypeMap;->getMimeTypeFromExtension(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    if-nez p0, :cond_1

    .line 249
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v0, "Mime Type (default): application/pdf"

    invoke-virtual {p0, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    const-string p0, "application/pdf"

    goto :goto_1

    .line 251
    :cond_1
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Mime Type: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    :goto_1
    return-object p0
.end method


# virtual methods
.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 44
    const-string v0, "HandleDocumentWithURL"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    .line 47
    invoke-virtual {p2, v0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object p1

    .line 48
    const-string p2, "url"

    invoke-virtual {p1, p2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 49
    const-string p2, "fileName"

    invoke-virtual {p1, p2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 50
    const-string p2, "type"

    invoke-virtual {p1, p2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 51
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object p2, p0, Lch/ti8m/phonegap/plugins/DocumentHandler;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {p2}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroidx/appcompat/app/AppCompatActivity;

    move-result-object p2

    invoke-virtual {p2}, Landroidx/appcompat/app/AppCompatActivity;->getPackageName()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, ".fileprovider"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    sput-object p1, Lch/ti8m/phonegap/plugins/DocumentHandler;->FILE_PROVIDER_PACKAGE_ID:Ljava/lang/String;

    .line 52
    sget-object p1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v1, "Found: "

    invoke-direct {p2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 55
    new-instance p1, Lch/ti8m/phonegap/plugins/DocumentHandler$FileDownloaderAsyncTask;

    move-object v1, p1

    move-object v2, p0

    move-object v3, p3

    invoke-direct/range {v1 .. v6}, Lch/ti8m/phonegap/plugins/DocumentHandler$FileDownloaderAsyncTask;-><init>(Lch/ti8m/phonegap/plugins/DocumentHandler;Lorg/apache/cordova/CallbackContext;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    new-array p2, v0, [Ljava/lang/Void;

    invoke-virtual {p1, p2}, Lch/ti8m/phonegap/plugins/DocumentHandler$FileDownloaderAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    const/4 p1, 0x1

    return p1

    :cond_0
    return v0
.end method
