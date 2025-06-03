.class public final Lcom/google/android/gms/cloudmessaging/zzu;
.super Ljava/lang/Object;
.source "com.google.android.gms:play-services-cloud-messaging@@17.1.0"


# static fields
.field private static zza:Lcom/google/android/gms/cloudmessaging/zzu;


# instance fields
.field private final zzb:Landroid/content/Context;

.field private final zzc:Ljava/util/concurrent/ScheduledExecutorService;

.field private zzd:Lcom/google/android/gms/cloudmessaging/zzn;

.field private zze:I


# direct methods
.method constructor <init>(Landroid/content/Context;Ljava/util/concurrent/ScheduledExecutorService;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/google/android/gms/cloudmessaging/zzn;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/google/android/gms/cloudmessaging/zzn;-><init>(Lcom/google/android/gms/cloudmessaging/zzu;Lcom/google/android/gms/cloudmessaging/zzm;)V

    iput-object v0, p0, Lcom/google/android/gms/cloudmessaging/zzu;->zzd:Lcom/google/android/gms/cloudmessaging/zzn;

    const/4 v0, 0x1

    iput v0, p0, Lcom/google/android/gms/cloudmessaging/zzu;->zze:I

    iput-object p2, p0, Lcom/google/android/gms/cloudmessaging/zzu;->zzc:Ljava/util/concurrent/ScheduledExecutorService;

    .line 2
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/gms/cloudmessaging/zzu;->zzb:Landroid/content/Context;

    return-void
.end method

.method static bridge synthetic zza(Lcom/google/android/gms/cloudmessaging/zzu;)Landroid/content/Context;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/cloudmessaging/zzu;->zzb:Landroid/content/Context;

    return-object p0
.end method

.method public static declared-synchronized zzb(Landroid/content/Context;)Lcom/google/android/gms/cloudmessaging/zzu;
    .locals 4

    const-class v0, Lcom/google/android/gms/cloudmessaging/zzu;

    monitor-enter v0

    .line 1
    :try_start_0
    sget-object v1, Lcom/google/android/gms/cloudmessaging/zzu;->zza:Lcom/google/android/gms/cloudmessaging/zzu;

    if-nez v1, :cond_0

    new-instance v1, Lcom/google/android/gms/cloudmessaging/zzu;

    invoke-static {}, Lcom/google/android/gms/internal/cloudmessaging/zze;->zza()Lcom/google/android/gms/internal/cloudmessaging/zzb;

    new-instance v2, Lcom/google/android/gms/common/util/concurrent/NamedThreadFactory;

    const-string v3, "MessengerIpcClient"

    invoke-direct {v2, v3}, Lcom/google/android/gms/common/util/concurrent/NamedThreadFactory;-><init>(Ljava/lang/String;)V

    const/4 v3, 0x1

    .line 2
    invoke-static {v3, v2}, Ljava/util/concurrent/Executors;->newScheduledThreadPool(ILjava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v2

    .line 3
    invoke-static {v2}, Ljava/util/concurrent/Executors;->unconfigurableScheduledExecutorService(Ljava/util/concurrent/ScheduledExecutorService;)Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v2

    .line 4
    invoke-direct {v1, p0, v2}, Lcom/google/android/gms/cloudmessaging/zzu;-><init>(Landroid/content/Context;Ljava/util/concurrent/ScheduledExecutorService;)V

    sput-object v1, Lcom/google/android/gms/cloudmessaging/zzu;->zza:Lcom/google/android/gms/cloudmessaging/zzu;

    :cond_0
    sget-object p0, Lcom/google/android/gms/cloudmessaging/zzu;->zza:Lcom/google/android/gms/cloudmessaging/zzu;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object p0

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method static bridge synthetic zze(Lcom/google/android/gms/cloudmessaging/zzu;)Ljava/util/concurrent/ScheduledExecutorService;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/cloudmessaging/zzu;->zzc:Ljava/util/concurrent/ScheduledExecutorService;

    return-object p0
.end method

.method private final declared-synchronized zzf()I
    .locals 2

    monitor-enter p0

    :try_start_0
    iget v0, p0, Lcom/google/android/gms/cloudmessaging/zzu;->zze:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/google/android/gms/cloudmessaging/zzu;->zze:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private final declared-synchronized zzg(Lcom/google/android/gms/cloudmessaging/zzr;)Lcom/google/android/gms/tasks/Task;
    .locals 2

    monitor-enter p0

    .line 1
    :try_start_0
    const-string v0, "MessengerIpcClient"

    const/4 v1, 0x3

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Queueing "

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "MessengerIpcClient"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/cloudmessaging/zzu;->zzd:Lcom/google/android/gms/cloudmessaging/zzn;

    .line 3
    invoke-virtual {v0, p1}, Lcom/google/android/gms/cloudmessaging/zzn;->zzg(Lcom/google/android/gms/cloudmessaging/zzr;)Z

    move-result v0

    if-nez v0, :cond_1

    new-instance v0, Lcom/google/android/gms/cloudmessaging/zzn;

    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, v1}, Lcom/google/android/gms/cloudmessaging/zzn;-><init>(Lcom/google/android/gms/cloudmessaging/zzu;Lcom/google/android/gms/cloudmessaging/zzm;)V

    iput-object v0, p0, Lcom/google/android/gms/cloudmessaging/zzu;->zzd:Lcom/google/android/gms/cloudmessaging/zzn;

    .line 5
    invoke-virtual {v0, p1}, Lcom/google/android/gms/cloudmessaging/zzn;->zzg(Lcom/google/android/gms/cloudmessaging/zzr;)Z

    :cond_1
    iget-object p1, p1, Lcom/google/android/gms/cloudmessaging/zzr;->zzb:Lcom/google/android/gms/tasks/TaskCompletionSource;

    .line 6
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/TaskCompletionSource;->getTask()Lcom/google/android/gms/tasks/Task;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method


# virtual methods
.method public final zzc(ILandroid/os/Bundle;)Lcom/google/android/gms/tasks/Task;
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/gms/cloudmessaging/zzq;

    invoke-direct {p0}, Lcom/google/android/gms/cloudmessaging/zzu;->zzf()I

    move-result v1

    invoke-direct {v0, v1, p1, p2}, Lcom/google/android/gms/cloudmessaging/zzq;-><init>(IILandroid/os/Bundle;)V

    invoke-direct {p0, v0}, Lcom/google/android/gms/cloudmessaging/zzu;->zzg(Lcom/google/android/gms/cloudmessaging/zzr;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method

.method public final zzd(ILandroid/os/Bundle;)Lcom/google/android/gms/tasks/Task;
    .locals 2

    .line 1
    new-instance p1, Lcom/google/android/gms/cloudmessaging/zzt;

    invoke-direct {p0}, Lcom/google/android/gms/cloudmessaging/zzu;->zzf()I

    move-result v0

    const/4 v1, 0x1

    invoke-direct {p1, v0, v1, p2}, Lcom/google/android/gms/cloudmessaging/zzt;-><init>(IILandroid/os/Bundle;)V

    invoke-direct {p0, p1}, Lcom/google/android/gms/cloudmessaging/zzu;->zzg(Lcom/google/android/gms/cloudmessaging/zzr;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method
