.class public Lcom/android/camera/sensitive/SensitiveFilter;
.super Ljava/lang/Object;
.source "SensitiveFilter.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field public static final CLOUD_FILE_PATH:Ljava/lang/String; = "/data/data/com.android.camera/sensi_words"

.field static final DEFAULT_INITIAL_CAPACITY:I = 0x800000

.field public static final LOCAL_FILE_PATH:Ljava/lang/String; = "/data/data/com.android.camera/"

.field private static sensitiveFilter:Lcom/android/camera/sensitive/SensitiveFilter; = null

.field private static final serialVersionUID:J = 0x1L


# instance fields
.field protected nodes:[Lcom/android/camera/sensitive/SensitiveNode;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    sput-object v0, Lcom/android/camera/sensitive/SensitiveFilter;->sensitiveFilter:Lcom/android/camera/sensitive/SensitiveFilter;

    return-void
.end method

.method private constructor <init>()V
    .locals 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/high16 v0, 0x800000

    new-array v0, v0, [Lcom/android/camera/sensitive/SensitiveNode;

    iput-object v0, p0, Lcom/android/camera/sensitive/SensitiveFilter;->nodes:[Lcom/android/camera/sensitive/SensitiveNode;

    nop

    nop

    nop

    nop

    const/4 v0, 0x0

    :try_start_0
    new-instance v1, Ljava/io/File;

    const-string v2, "/data/data/com.android.camera/sensi_words"

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_0

    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    move-object v1, v2

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v2, "/assets/sensi/sensi_words.txt"

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_4
    .catchall {:try_start_0 .. :try_end_0} :catchall_4

    :goto_0
    :try_start_1
    invoke-static {v1}, Lmiui/util/IOUtils;->toString(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/String;

    const/4 v4, 0x0

    invoke-static {v2, v4}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v2

    invoke-direct {v3, v2}, Ljava/lang/String;-><init>([B)V

    new-instance v2, Ljava/io/ByteArrayInputStream;

    invoke-virtual {v3}, Ljava/lang/String;->getBytes()[B

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/ByteArrayInputStream;-><init>([B)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_3
    .catchall {:try_start_1 .. :try_end_1} :catchall_3

    :try_start_2
    new-instance v3, Ljava/io/InputStreamReader;

    sget-object v4, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v3, v2, v4}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    :try_start_3
    new-instance v4, Ljava/io/BufferedReader;

    invoke-direct {v4, v3}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :try_start_4
    invoke-virtual {v4}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v0

    :goto_1
    if-eqz v0, :cond_1

    invoke-virtual {v4}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/camera/sensitive/SensitiveFilter;->put(Ljava/lang/String;)Z

    goto :goto_1

    :cond_1
    invoke-virtual {v4}, Ljava/io/BufferedReader;->close()V

    invoke-virtual {v3}, Ljava/io/InputStreamReader;->close()V

    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    nop

    :try_start_5
    invoke-virtual {v4}, Ljava/io/BufferedReader;->close()V

    nop

    invoke-virtual {v3}, Ljava/io/InputStreamReader;->close()V

    nop

    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    if-eqz v1, :cond_5

    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_5

    goto/16 :goto_5

    :catchall_0
    move-exception v0

    move-object v7, v1

    move-object v1, v0

    move-object v0, v4

    move-object v4, v7

    goto/16 :goto_7

    :catch_0
    move-exception v0

    move-object v7, v1

    move-object v1, v0

    move-object v0, v4

    move-object v4, v7

    goto :goto_2

    :catchall_1
    move-exception v4

    move-object v7, v4

    move-object v4, v1

    move-object v1, v7

    goto/16 :goto_7

    :catch_1
    move-exception v4

    move-object v7, v4

    move-object v4, v1

    move-object v1, v7

    goto :goto_2

    :catchall_2
    move-exception v3

    move-object v4, v1

    move-object v1, v3

    move-object v3, v0

    goto :goto_7

    :catch_2
    move-exception v3

    move-object v4, v1

    move-object v1, v3

    move-object v3, v0

    goto :goto_2

    :catchall_3
    move-exception v2

    move-object v3, v0

    move-object v4, v1

    move-object v1, v2

    move-object v2, v3

    goto :goto_7

    :catch_3
    move-exception v2

    move-object v3, v0

    move-object v4, v1

    move-object v1, v2

    move-object v2, v3

    goto :goto_2

    :catchall_4
    move-exception v1

    move-object v2, v0

    move-object v3, v2

    move-object v4, v3

    goto :goto_7

    :catch_4
    move-exception v1

    move-object v2, v0

    move-object v3, v2

    move-object v4, v3

    :goto_2
    :try_start_6
    const-string v5, "SensitiveFilter"

    const-string v6, "IOException in SensitiveFilter constructor"

    invoke-static {v5, v6, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_5

    if-eqz v0, :cond_2

    :try_start_7
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V

    goto :goto_3

    :catch_5
    move-exception v0

    goto :goto_4

    :cond_2
    :goto_3
    if-eqz v3, :cond_3

    invoke-virtual {v3}, Ljava/io/InputStreamReader;->close()V

    :cond_3
    if-eqz v2, :cond_4

    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    :cond_4
    if-eqz v4, :cond_5

    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_5

    goto :goto_5

    :goto_4
    nop

    const-string v1, "SensitiveFilter"

    const-string v2, "IOException in SensitiveFilter constructor finally"

    invoke-static {v1, v2, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_6

    :cond_5
    :goto_5
    nop

    :goto_6
    return-void

    :catchall_5
    move-exception v1

    :goto_7
    if-eqz v0, :cond_6

    :try_start_8
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V

    goto :goto_8

    :catch_6
    move-exception v0

    goto :goto_9

    :cond_6
    :goto_8
    if-eqz v3, :cond_7

    invoke-virtual {v3}, Ljava/io/InputStreamReader;->close()V

    :cond_7
    if-eqz v2, :cond_8

    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    :cond_8
    if-eqz v4, :cond_9

    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_6

    goto :goto_a

    :goto_9
    nop

    const-string v2, "SensitiveFilter"

    const-string v3, "IOException in SensitiveFilter constructor finally"

    invoke-static {v2, v3, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    nop

    :cond_9
    :goto_a
    throw v1
.end method

.method public static declared-synchronized getInstance()Lcom/android/camera/sensitive/SensitiveFilter;
    .locals 2

    const-class v0, Lcom/android/camera/sensitive/SensitiveFilter;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/android/camera/sensitive/SensitiveFilter;->sensitiveFilter:Lcom/android/camera/sensitive/SensitiveFilter;

    if-nez v1, :cond_0

    new-instance v1, Lcom/android/camera/sensitive/SensitiveFilter;

    invoke-direct {v1}, Lcom/android/camera/sensitive/SensitiveFilter;-><init>()V

    sput-object v1, Lcom/android/camera/sensitive/SensitiveFilter;->sensitiveFilter:Lcom/android/camera/sensitive/SensitiveFilter;

    :cond_0
    sget-object v1, Lcom/android/camera/sensitive/SensitiveFilter;->sensitiveFilter:Lcom/android/camera/sensitive/SensitiveFilter;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public static loadSensitiveWords(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 6

    nop

    nop

    nop

    nop

    const/4 v0, 0x0

    const/4 v1, 0x0

    :try_start_0
    new-instance v2, Ljava/net/URL;

    invoke-direct {v2, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object p0

    check-cast p0, Ljava/net/HttpURLConnection;
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_11
    .catch Ljava/util/zip/ZipException; {:try_start_0 .. :try_end_0} :catch_f
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_d
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    const/16 v2, 0x4e20

    :try_start_1
    invoke-virtual {p0, v2}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    invoke-virtual {p0, v2}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    const-string v2, "GET"

    invoke-virtual {p0, v2}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->connect()V

    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v2

    const/16 v3, 0xc8

    if-ne v2, v3, :cond_2

    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v2
    :try_end_1
    .catch Ljava/net/MalformedURLException; {:try_start_1 .. :try_end_1} :catch_a
    .catch Ljava/util/zip/ZipException; {:try_start_1 .. :try_end_1} :catch_9
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_8
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    :try_start_2
    new-instance v3, Ljava/io/File;

    const-string v4, "sensi_words"

    invoke-direct {v3, p1, v4}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result p1

    if-nez p1, :cond_0

    invoke-virtual {v3}, Ljava/io/File;->createNewFile()Z

    :cond_0
    new-instance p1, Ljava/io/FileOutputStream;

    invoke-direct {p1, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_2
    .catch Ljava/net/MalformedURLException; {:try_start_2 .. :try_end_2} :catch_5
    .catch Ljava/util/zip/ZipException; {:try_start_2 .. :try_end_2} :catch_4
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_3
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    nop

    :goto_0
    :try_start_3
    invoke-virtual {v2}, Ljava/io/InputStream;->read()I

    move-result v1

    const/4 v3, -0x1

    if-eq v1, v3, :cond_1

    invoke-virtual {p1, v1}, Ljava/io/FileOutputStream;->write(I)V

    goto :goto_0

    :cond_1
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    invoke-virtual {p1}, Ljava/io/FileOutputStream;->close()V
    :try_end_3
    .catch Ljava/net/MalformedURLException; {:try_start_3 .. :try_end_3} :catch_2
    .catch Ljava/util/zip/ZipException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    const/4 v0, 0x1

    move-object v1, v2

    goto :goto_4

    :catchall_0
    move-exception v0

    move-object v1, v2

    move-object v5, v0

    move-object v0, p1

    move-object p1, v5

    goto/16 :goto_8

    :catch_0
    move-exception v1

    goto :goto_1

    :catch_1
    move-exception v1

    goto :goto_2

    :catch_2
    move-exception v1

    goto :goto_3

    :catchall_1
    move-exception p1

    move-object v0, v1

    move-object v1, v2

    goto :goto_8

    :catch_3
    move-exception p1

    move-object p1, v1

    :goto_1
    move-object v1, v2

    goto/16 :goto_c

    :catch_4
    move-exception p1

    move-object p1, v1

    :goto_2
    move-object v1, v2

    goto/16 :goto_f

    :catch_5
    move-exception p1

    move-object p1, v1

    :goto_3
    move-object v1, v2

    goto/16 :goto_12

    :cond_2
    move-object p1, v1

    :goto_4
    if-eqz p0, :cond_3

    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_3
    if-eqz v1, :cond_4

    :try_start_4
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_6

    goto :goto_5

    :catch_6
    move-exception p0

    goto :goto_6

    :cond_4
    :goto_5
    nop

    :goto_6
    if-eqz p1, :cond_5

    :try_start_5
    invoke-virtual {p1}, Ljava/io/FileOutputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_7

    goto :goto_7

    :catch_7
    move-exception p0

    goto/16 :goto_15

    :cond_5
    :goto_7
    goto/16 :goto_15

    :catchall_2
    move-exception p1

    move-object v0, v1

    goto :goto_8

    :catch_8
    move-exception p1

    move-object p1, v1

    goto :goto_c

    :catch_9
    move-exception p1

    move-object p1, v1

    goto :goto_f

    :catch_a
    move-exception p1

    move-object p1, v1

    goto :goto_12

    :catchall_3
    move-exception p1

    move-object p0, v1

    move-object v0, p0

    :goto_8
    if-eqz p0, :cond_6

    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_6
    if-eqz v1, :cond_7

    :try_start_6
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_b

    goto :goto_9

    :catch_b
    move-exception p0

    goto :goto_a

    :cond_7
    :goto_9
    nop

    :goto_a
    if-eqz v0, :cond_8

    :try_start_7
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_c

    goto :goto_b

    :catch_c
    move-exception p0

    nop

    :cond_8
    :goto_b
    throw p1

    :catch_d
    move-exception p0

    move-object p0, v1

    move-object p1, p0

    :goto_c
    if-eqz p0, :cond_9

    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_9
    if-eqz v1, :cond_a

    :try_start_8
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_e

    goto :goto_d

    :catch_e
    move-exception p0

    goto :goto_e

    :cond_a
    :goto_d
    nop

    :goto_e
    if-eqz p1, :cond_5

    :try_start_9
    invoke-virtual {p1}, Ljava/io/FileOutputStream;->close()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_7

    goto :goto_7

    :catch_f
    move-exception p0

    move-object p0, v1

    move-object p1, p0

    :goto_f
    if-eqz p0, :cond_b

    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_b
    if-eqz v1, :cond_c

    :try_start_a
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_10

    goto :goto_10

    :catch_10
    move-exception p0

    goto :goto_11

    :cond_c
    :goto_10
    nop

    :goto_11
    if-eqz p1, :cond_5

    :try_start_b
    invoke-virtual {p1}, Ljava/io/FileOutputStream;->close()V
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_7

    goto :goto_7

    :catch_11
    move-exception p0

    move-object p0, v1

    move-object p1, p0

    :goto_12
    if-eqz p0, :cond_d

    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_d
    if-eqz v1, :cond_e

    :try_start_c
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_c} :catch_12

    goto :goto_13

    :catch_12
    move-exception p0

    goto :goto_14

    :cond_e
    :goto_13
    nop

    :goto_14
    if-eqz p1, :cond_5

    :try_start_d
    invoke-virtual {p1}, Ljava/io/FileOutputStream;->close()V
    :try_end_d
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_d} :catch_7

    goto :goto_7

    :goto_15
    return v0
.end method


# virtual methods
.method public getSensitiveWord(Ljava/lang/String;)Ljava/lang/String;
    .locals 8

    const-string v0, ""

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string p1, ""

    return-object p1

    :cond_0
    new-instance v1, Lcom/android/camera/sensitive/StringPointer;

    invoke-direct {v1, p1}, Lcom/android/camera/sensitive/StringPointer;-><init>(Ljava/lang/String;)V

    const/4 p1, 0x0

    :goto_0
    iget v2, v1, Lcom/android/camera/sensitive/StringPointer;->length:I

    const/4 v3, 0x1

    sub-int/2addr v2, v3

    if-ge p1, v2, :cond_4

    nop

    invoke-virtual {v1, p1}, Lcom/android/camera/sensitive/StringPointer;->nextTwoCharHash(I)I

    move-result v2

    iget-object v4, p0, Lcom/android/camera/sensitive/SensitiveFilter;->nodes:[Lcom/android/camera/sensitive/SensitiveNode;

    iget-object v5, p0, Lcom/android/camera/sensitive/SensitiveFilter;->nodes:[Lcom/android/camera/sensitive/SensitiveNode;

    array-length v5, v5

    sub-int/2addr v5, v3

    and-int/2addr v2, v5

    aget-object v2, v4, v2

    if-eqz v2, :cond_3

    invoke-virtual {v1, p1}, Lcom/android/camera/sensitive/StringPointer;->nextTwoCharMix(I)I

    move-result v4

    :goto_1
    if-eqz v2, :cond_3

    iget v5, v2, Lcom/android/camera/sensitive/SensitiveNode;->headTwoCharMix:I

    if-ne v5, v4, :cond_2

    iget-object v5, v2, Lcom/android/camera/sensitive/SensitiveNode;->words:Ljava/util/TreeSet;

    invoke-virtual {v1, p1}, Lcom/android/camera/sensitive/StringPointer;->substring(I)Lcom/android/camera/sensitive/StringPointer;

    move-result-object v6

    invoke-virtual {v5, v6, v3}, Ljava/util/TreeSet;->headSet(Ljava/lang/Object;Z)Ljava/util/NavigableSet;

    move-result-object v5

    if-eqz v5, :cond_2

    invoke-interface {v5}, Ljava/util/NavigableSet;->descendingSet()Ljava/util/NavigableSet;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/NavigableSet;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_2
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/android/camera/sensitive/StringPointer;

    invoke-virtual {v1, p1, v6}, Lcom/android/camera/sensitive/StringPointer;->nextStartsWith(ILcom/android/camera/sensitive/StringPointer;)Z

    move-result v7

    if-eqz v7, :cond_1

    new-instance v0, Ljava/lang/String;

    iget-object v2, v6, Lcom/android/camera/sensitive/StringPointer;->value:[C

    invoke-direct {v0, v2}, Ljava/lang/String;-><init>([C)V

    iget v3, v6, Lcom/android/camera/sensitive/StringPointer;->length:I

    goto :goto_3

    :cond_1
    goto :goto_2

    :cond_2
    iget-object v2, v2, Lcom/android/camera/sensitive/SensitiveNode;->next:Lcom/android/camera/sensitive/SensitiveNode;

    goto :goto_1

    :cond_3
    :goto_3
    add-int/2addr p1, v3

    goto :goto_0

    :cond_4
    return-object v0
.end method

.method public put(Ljava/lang/String;)Z
    .locals 4

    iget-object v0, p0, Lcom/android/camera/sensitive/SensitiveFilter;->nodes:[Lcom/android/camera/sensitive/SensitiveNode;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    if-eqz p1, :cond_6

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v2, 0x2

    if-ge v0, v2, :cond_1

    goto :goto_2

    :cond_1
    new-instance v0, Lcom/android/camera/sensitive/StringPointer;

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Lcom/android/camera/sensitive/StringPointer;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/android/camera/sensitive/StringPointer;->nextTwoCharHash(I)I

    move-result p1

    invoke-virtual {v0, v1}, Lcom/android/camera/sensitive/StringPointer;->nextTwoCharMix(I)I

    move-result v1

    iget-object v2, p0, Lcom/android/camera/sensitive/SensitiveFilter;->nodes:[Lcom/android/camera/sensitive/SensitiveNode;

    array-length v2, v2

    const/4 v3, 0x1

    sub-int/2addr v2, v3

    and-int/2addr p1, v2

    iget-object v2, p0, Lcom/android/camera/sensitive/SensitiveFilter;->nodes:[Lcom/android/camera/sensitive/SensitiveNode;

    aget-object v2, v2, p1

    if-nez v2, :cond_2

    new-instance v2, Lcom/android/camera/sensitive/SensitiveNode;

    invoke-direct {v2, v1}, Lcom/android/camera/sensitive/SensitiveNode;-><init>(I)V

    iget-object v1, v2, Lcom/android/camera/sensitive/SensitiveNode;->words:Ljava/util/TreeSet;

    invoke-virtual {v1, v0}, Ljava/util/TreeSet;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/android/camera/sensitive/SensitiveFilter;->nodes:[Lcom/android/camera/sensitive/SensitiveNode;

    aput-object v2, v0, p1

    goto :goto_1

    :cond_2
    :goto_0
    if-eqz v2, :cond_5

    iget p1, v2, Lcom/android/camera/sensitive/SensitiveNode;->headTwoCharMix:I

    if-ne p1, v1, :cond_3

    iget-object p1, v2, Lcom/android/camera/sensitive/SensitiveNode;->words:Ljava/util/TreeSet;

    invoke-virtual {p1, v0}, Ljava/util/TreeSet;->add(Ljava/lang/Object;)Z

    return v3

    :cond_3
    iget-object p1, v2, Lcom/android/camera/sensitive/SensitiveNode;->next:Lcom/android/camera/sensitive/SensitiveNode;

    if-nez p1, :cond_4

    new-instance p1, Lcom/android/camera/sensitive/SensitiveNode;

    invoke-direct {p1, v1, v2}, Lcom/android/camera/sensitive/SensitiveNode;-><init>(ILcom/android/camera/sensitive/SensitiveNode;)V

    iget-object p1, p1, Lcom/android/camera/sensitive/SensitiveNode;->words:Ljava/util/TreeSet;

    invoke-virtual {p1, v0}, Ljava/util/TreeSet;->add(Ljava/lang/Object;)Z

    return v3

    :cond_4
    iget-object v2, v2, Lcom/android/camera/sensitive/SensitiveNode;->next:Lcom/android/camera/sensitive/SensitiveNode;

    goto :goto_0

    :cond_5
    :goto_1
    return v3

    :cond_6
    :goto_2
    return v1
.end method

.method public replaceSensitiveWord(Ljava/lang/String;C)Ljava/lang/String;
    .locals 10

    new-instance v0, Lcom/android/camera/sensitive/StringPointer;

    invoke-direct {v0, p1}, Lcom/android/camera/sensitive/StringPointer;-><init>(Ljava/lang/String;)V

    nop

    nop

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    iget v3, v0, Lcom/android/camera/sensitive/StringPointer;->length:I

    const/4 v4, 0x1

    sub-int/2addr v3, v4

    if-ge v1, v3, :cond_3

    nop

    invoke-virtual {v0, v1}, Lcom/android/camera/sensitive/StringPointer;->nextTwoCharHash(I)I

    move-result v3

    iget-object v5, p0, Lcom/android/camera/sensitive/SensitiveFilter;->nodes:[Lcom/android/camera/sensitive/SensitiveNode;

    iget-object v6, p0, Lcom/android/camera/sensitive/SensitiveFilter;->nodes:[Lcom/android/camera/sensitive/SensitiveNode;

    array-length v6, v6

    sub-int/2addr v6, v4

    and-int/2addr v3, v6

    aget-object v3, v5, v3

    if-eqz v3, :cond_2

    invoke-virtual {v0, v1}, Lcom/android/camera/sensitive/StringPointer;->nextTwoCharMix(I)I

    move-result v5

    :goto_1
    if-eqz v3, :cond_2

    iget v6, v3, Lcom/android/camera/sensitive/SensitiveNode;->headTwoCharMix:I

    if-ne v6, v5, :cond_1

    iget-object v6, v3, Lcom/android/camera/sensitive/SensitiveNode;->words:Ljava/util/TreeSet;

    invoke-virtual {v0, v1}, Lcom/android/camera/sensitive/StringPointer;->substring(I)Lcom/android/camera/sensitive/StringPointer;

    move-result-object v7

    invoke-virtual {v6, v7, v4}, Ljava/util/TreeSet;->headSet(Ljava/lang/Object;Z)Ljava/util/NavigableSet;

    move-result-object v6

    if-eqz v6, :cond_1

    invoke-interface {v6}, Ljava/util/NavigableSet;->descendingSet()Ljava/util/NavigableSet;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/NavigableSet;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_2
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/android/camera/sensitive/StringPointer;

    invoke-virtual {v0, v1, v7}, Lcom/android/camera/sensitive/StringPointer;->nextStartsWith(ILcom/android/camera/sensitive/StringPointer;)Z

    move-result v8

    if-eqz v8, :cond_0

    iget v2, v7, Lcom/android/camera/sensitive/StringPointer;->length:I

    add-int/2addr v2, v1

    invoke-virtual {v0, v1, v2, p2}, Lcom/android/camera/sensitive/StringPointer;->fill(IIC)V

    iget v2, v7, Lcom/android/camera/sensitive/StringPointer;->length:I

    nop

    goto :goto_3

    :cond_0
    goto :goto_2

    :cond_1
    iget-object v3, v3, Lcom/android/camera/sensitive/SensitiveNode;->next:Lcom/android/camera/sensitive/SensitiveNode;

    goto :goto_1

    :cond_2
    move v9, v4

    move v4, v2

    move v2, v9

    :goto_3
    add-int/2addr v1, v2

    nop

    move v2, v4

    goto :goto_0

    :cond_3
    if-eqz v2, :cond_4

    invoke-virtual {v0}, Lcom/android/camera/sensitive/StringPointer;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_4
    return-object p1
.end method
