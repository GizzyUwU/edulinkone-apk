.class final Lcom/google/android/gms/cloudmessaging/zzq;
.super Lcom/google/android/gms/cloudmessaging/zzr;
.source "com.google.android.gms:play-services-cloud-messaging@@17.1.0"


# direct methods
.method constructor <init>(IILandroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/google/android/gms/cloudmessaging/zzr;-><init>(IILandroid/os/Bundle;)V

    return-void
.end method


# virtual methods
.method final zza(Landroid/os/Bundle;)V
    .locals 3

    .line 1
    const-string v0, "ack"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    .line 2
    invoke-virtual {p0, v0}, Lcom/google/android/gms/cloudmessaging/zzr;->zzd(Ljava/lang/Object;)V

    return-void

    :cond_0
    new-instance p1, Lcom/google/android/gms/cloudmessaging/zzs;

    const/4 v1, 0x4

    .line 3
    const-string v2, "Invalid response to one way request"

    invoke-direct {p1, v1, v2, v0}, Lcom/google/android/gms/cloudmessaging/zzs;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    .line 4
    invoke-virtual {p0, p1}, Lcom/google/android/gms/cloudmessaging/zzr;->zzc(Lcom/google/android/gms/cloudmessaging/zzs;)V

    return-void
.end method

.method final zzb()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method
