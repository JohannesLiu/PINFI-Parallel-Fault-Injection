; ModuleID = 'temp2.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.timeval = type { i64, i64 }
%struct.timezone = type { i32, i32 }

@.str = private unnamed_addr constant [27 x i8] c"\0A\0A %s Benchmark Completed\0A\00", align 1
@.str1 = private unnamed_addr constant [46 x i8] c" Class           =                        %c\0A\00", align 1
@.str2 = private unnamed_addr constant [38 x i8] c" Size            =             %12ld\0A\00", align 1
@.str3 = private unnamed_addr constant [44 x i8] c" Size            =             %4dx%4dx%4d\0A\00", align 1
@.str4 = private unnamed_addr constant [37 x i8] c" Iterations      =             %12d\0A\00", align 1
@.str5 = private unnamed_addr constant [39 x i8] c" Time in seconds =             %12.2f\0A\00", align 1
@.str6 = private unnamed_addr constant [39 x i8] c" Mop/s total     =             %12.2f\0A\00", align 1
@.str7 = private unnamed_addr constant [25 x i8] c" Operation type  = %24s\0A\00", align 1
@.str8 = private unnamed_addr constant [45 x i8] c" Verification    =            NOT PERFORMED\0A\00", align 1
@.str9 = private unnamed_addr constant [45 x i8] c" Verification    =               SUCCESSFUL\0A\00", align 1
@.str10 = private unnamed_addr constant [45 x i8] c" Verification    =             UNSUCCESSFUL\0A\00", align 1
@.str11 = private unnamed_addr constant [37 x i8] c" Version         =             %12s\0A\00", align 1
@.str12 = private unnamed_addr constant [37 x i8] c" Compile date    =             %12s\0A\00", align 1
@.str13 = private unnamed_addr constant [20 x i8] c"\0A Compile options:\0A\00", align 1
@.str14 = private unnamed_addr constant [23 x i8] c"    CC           = %s\0A\00", align 1
@.str15 = private unnamed_addr constant [23 x i8] c"    CLINK        = %s\0A\00", align 1
@.str16 = private unnamed_addr constant [23 x i8] c"    C_LIB        = %s\0A\00", align 1
@.str17 = private unnamed_addr constant [23 x i8] c"    C_INC        = %s\0A\00", align 1
@.str18 = private unnamed_addr constant [23 x i8] c"    CFLAGS       = %s\0A\00", align 1
@.str19 = private unnamed_addr constant [23 x i8] c"    CLINKFLAGS   = %s\0A\00", align 1
@.str20 = private unnamed_addr constant [41 x i8] c"\0A--------------------------------------\0A\00", align 1
@.str21 = private unnamed_addr constant [39 x i8] c" Please send all errors/feedbacks to:\0A\00", align 1
@.str22 = private unnamed_addr constant [34 x i8] c" Center for Manycore Programming\0A\00", align 1
@.str23 = private unnamed_addr constant [21 x i8] c" cmp@aces.snu.ac.kr\0A\00", align 1
@.str24 = private unnamed_addr constant [24 x i8] c" http://aces.snu.ac.kr\0A\00", align 1
@.str25 = private unnamed_addr constant [40 x i8] c"--------------------------------------\0A\00", align 1
@elapsed = internal global [64 x double] zeroinitializer, align 16
@start = internal global [64 x double] zeroinitializer, align 16
@main.dum = private unnamed_addr constant [3 x double] [double 1.000000e+00, double 1.000000e+00, double 1.000000e+00], align 16
@.str26 = private unnamed_addr constant [11 x i8] c"timer.flag\00", align 1
@.str127 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str228 = private unnamed_addr constant [8 x i8] c"%15.0lf\00", align 1
@.str329 = private unnamed_addr constant [58 x i8] c"\0A\0A NAS Parallel Benchmarks (NPB3.3-SER-C) - EP Benchmark\0A\00", align 1
@.str430 = private unnamed_addr constant [44 x i8] c"\0A Number of random numbers generated: %15s\0A\00", align 1
@x = internal global [131072 x double] zeroinitializer, align 16
@q = internal global [10 x double] zeroinitializer, align 16
@.str531 = private unnamed_addr constant [25 x i8] c"\0AEP Benchmark Results:\0A\0A\00", align 1
@.str632 = private unnamed_addr constant [11 x i8] c"N = 2^%5d\0A\00", align 1
@.str733 = private unnamed_addr constant [30 x i8] c"No. Gaussian Pairs = %15.0lf\0A\00", align 1
@.str834 = private unnamed_addr constant [26 x i8] c"Sums = %25.15lE %25.15lE\0A\00", align 1
@.str935 = private unnamed_addr constant [10 x i8] c"Counts: \0A\00", align 1
@.str1036 = private unnamed_addr constant [12 x i8] c"%3d%15.0lf\0A\00", align 1
@.str1137 = private unnamed_addr constant [3 x i8] c"EP\00", align 1
@.str1238 = private unnamed_addr constant [25 x i8] c"Random numbers generated\00", align 1
@.str1339 = private unnamed_addr constant [6 x i8] c"3.3.1\00", align 1
@.str1440 = private unnamed_addr constant [12 x i8] c"14 Feb 2018\00", align 1
@.str1541 = private unnamed_addr constant [34 x i8] c"$(LLFI_BUILD_ROOT)/llvm/bin/clang\00", align 1
@.str1642 = private unnamed_addr constant [6 x i8] c"$(CC)\00", align 1
@.str1743 = private unnamed_addr constant [4 x i8] c"-lm\00", align 1
@.str1844 = private unnamed_addr constant [12 x i8] c"-I../common\00", align 1
@.str1945 = private unnamed_addr constant [14 x i8] c"-g -Wall -O3 \00", align 1
@.str2046 = private unnamed_addr constant [7 x i8] c"-O3 -v\00", align 1
@.str2147 = private unnamed_addr constant [7 x i8] c"randdp\00", align 1
@.str2248 = private unnamed_addr constant [34 x i8] c"\0ATotal time:     %9.3lf (%6.2lf)\0A\00", align 1
@.str2349 = private unnamed_addr constant [33 x i8] c"Gaussian pairs: %9.3lf (%6.2lf)\0A\00", align 1
@.str2450 = private unnamed_addr constant [33 x i8] c"Random numbers: %9.3lf (%6.2lf)\0A\00", align 1
@.str51 = private unnamed_addr constant [28 x i8] c"\0A\0A %s Benchmark Completed.\0A\00", align 1
@.str152 = private unnamed_addr constant [37 x i8] c" Class           =             %12c\0A\00", align 1
@.str253 = private unnamed_addr constant [8 x i8] c"%15.0lf\00", align 1
@.str354 = private unnamed_addr constant [34 x i8] c" Size            =          %15s\0A\00", align 1
@.str455 = private unnamed_addr constant [37 x i8] c" Size            =             %12d\0A\00", align 1
@.str556 = private unnamed_addr constant [42 x i8] c" Size            =           %4dx%4dx%4d\0A\00", align 1
@.str657 = private unnamed_addr constant [37 x i8] c" Iterations      =             %12d\0A\00", align 1
@.str758 = private unnamed_addr constant [25 x i8] c" Operation type  = %24s\0A\00", align 1
@.str859 = private unnamed_addr constant [37 x i8] c" Verification    =             %12s\0A\00", align 1
@.str960 = private unnamed_addr constant [11 x i8] c"SUCCESSFUL\00", align 1
@.str1061 = private unnamed_addr constant [13 x i8] c"UNSUCCESSFUL\00", align 1
@.str1162 = private unnamed_addr constant [37 x i8] c" Version         =             %12s\0A\00", align 1
@.str1263 = private unnamed_addr constant [195 x i8] c"\0A--------------------------------------\0A Please send all errors/feedbacks to:\0A Center for Manycore Programming\0A cmp@aces.snu.ac.kr\0A http://aces.snu.ac.kr\0A--------------------------------------\0A\0A\00", align 1
@wtime_.sec = internal global i32 -1, align 4
@global_var1 = global i64 0, align 8
@global_var2 = global i64 0, align 8

; Function Attrs: nounwind uwtable
define void @c_print_results(i8* %name, i8 signext %class, i32 %n1, i32 %n2, i32 %n3, i32 %niter, double %t, double %mops, i8* %optype, i32 %passed_verification, i8* %npbversion, i8* %compiletime, i8* %cc, i8* %clink, i8* %c_lib, i8* %c_inc, i8* %cflags, i8* %clinkflags) #0 {
  %1 = alloca i8*, align 8, !llfi_index !1
  %2 = alloca i8, align 1, !llfi_index !2
  %3 = alloca i32, align 4, !llfi_index !3
  %4 = alloca i32, align 4, !llfi_index !4
  %5 = alloca i32, align 4, !llfi_index !5
  %6 = alloca i32, align 4, !llfi_index !6
  %7 = alloca double, align 8, !llfi_index !7
  %8 = alloca double, align 8, !llfi_index !8
  %9 = alloca i8*, align 8, !llfi_index !9
  %10 = alloca i32, align 4, !llfi_index !10
  %11 = alloca i8*, align 8, !llfi_index !11
  %12 = alloca i8*, align 8, !llfi_index !12
  %13 = alloca i8*, align 8, !llfi_index !13
  %14 = alloca i8*, align 8, !llfi_index !14
  %15 = alloca i8*, align 8, !llfi_index !15
  %16 = alloca i8*, align 8, !llfi_index !16
  %17 = alloca i8*, align 8, !llfi_index !17
  %18 = alloca i8*, align 8, !llfi_index !18
  %nn = alloca i64, align 8, !llfi_index !19
  store i8* %name, i8** %1, align 8, !llfi_index !20
  store i8 %class, i8* %2, align 1, !llfi_index !21
  store i32 %n1, i32* %3, align 4, !llfi_index !22
  store i32 %n2, i32* %4, align 4, !llfi_index !23
  store i32 %n3, i32* %5, align 4, !llfi_index !24
  store i32 %niter, i32* %6, align 4, !llfi_index !25
  store double %t, double* %7, align 8, !llfi_index !26
  store double %mops, double* %8, align 8, !llfi_index !27
  store i8* %optype, i8** %9, align 8, !llfi_index !28
  store i32 %passed_verification, i32* %10, align 4, !llfi_index !29
  store i8* %npbversion, i8** %11, align 8, !llfi_index !30
  store i8* %compiletime, i8** %12, align 8, !llfi_index !31
  store i8* %cc, i8** %13, align 8, !llfi_index !32
  store i8* %clink, i8** %14, align 8, !llfi_index !33
  store i8* %c_lib, i8** %15, align 8, !llfi_index !34
  store i8* %c_inc, i8** %16, align 8, !llfi_index !35
  store i8* %cflags, i8** %17, align 8, !llfi_index !36
  store i8* %clinkflags, i8** %18, align 8, !llfi_index !37
  %19 = load i8** %1, align 8, !llfi_index !38
  %20 = load i8** %1, align 8, !llfi_index !38
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %19, i8* %20)
  %21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([27 x i8]* @.str, i32 0, i32 0), i8* %19), !llfi_index !39
  %22 = load i8* %2, align 1, !llfi_index !40
  %23 = load i8* %2, align 1, !llfi_index !40
  %24 = sext i8 %22 to i32, !llfi_index !41
  %25 = sext i8 %23 to i32, !llfi_index !41
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %24, i32 %25)
  %26 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([46 x i8]* @.str1, i32 0, i32 0), i32 %24), !llfi_index !42
  %27 = load i32* %5, align 4, !llfi_index !43
  %28 = load i32* %5, align 4, !llfi_index !43
  %29 = icmp eq i32 %27, 0, !llfi_index !44
  %30 = icmp eq i32 %28, 0, !llfi_index !44
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %29, i1 %30)
  br i1 %29, label %31, label %53, !llfi_index !45

; <label>:31                                      ; preds = %0
  %32 = load i32* %3, align 4, !llfi_index !46
  %33 = load i32* %3, align 4, !llfi_index !46
  %34 = sext i32 %32 to i64, !llfi_index !47
  %35 = sext i32 %33 to i64, !llfi_index !47
  call void @global_add(i64 %34, i64 %35)
  store i64 %34, i64* %nn, align 8, !llfi_index !48
  %36 = load i32* %4, align 4, !llfi_index !49
  %37 = load i32* %4, align 4, !llfi_index !49
  %38 = icmp ne i32 %36, 0, !llfi_index !50
  %39 = icmp ne i32 %37, 0, !llfi_index !50
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %38, i1 %39)
  br i1 %38, label %40, label %49, !llfi_index !51

; <label>:40                                      ; preds = %31
  %41 = load i32* %4, align 4, !llfi_index !52
  %42 = load i32* %4, align 4, !llfi_index !52
  %43 = sext i32 %41 to i64, !llfi_index !53
  %44 = sext i32 %42 to i64, !llfi_index !53
  %45 = load i64* %nn, align 8, !llfi_index !54
  %46 = load i64* %nn, align 8, !llfi_index !54
  %47 = mul nsw i64 %45, %43, !llfi_index !55
  %48 = mul nsw i64 %46, %44, !llfi_index !55
  call void @global_add(i64 %47, i64 %48)
  store i64 %47, i64* %nn, align 8, !llfi_index !56
  br label %49, !llfi_index !57

; <label>:49                                      ; preds = %40, %31
  %50 = load i64* %nn, align 8, !llfi_index !58
  %51 = load i64* %nn, align 8, !llfi_index !58
  call void @global_add(i64 %50, i64 %51)
  %52 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str2, i32 0, i32 0), i64 %50), !llfi_index !59
  br label %61, !llfi_index !60

; <label>:53                                      ; preds = %0
  %54 = load i32* %3, align 4, !llfi_index !61
  %55 = load i32* %3, align 4, !llfi_index !61
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %54, i32 %55)
  %56 = load i32* %4, align 4, !llfi_index !62
  %57 = load i32* %4, align 4, !llfi_index !62
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %56, i32 %57)
  %58 = load i32* %5, align 4, !llfi_index !63
  %59 = load i32* %5, align 4, !llfi_index !63
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %58, i32 %59)
  %60 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str3, i32 0, i32 0), i32 %54, i32 %56, i32 %58), !llfi_index !64
  br label %61, !llfi_index !65

; <label>:61                                      ; preds = %53, %49
  %62 = load i32* %6, align 4, !llfi_index !66
  %63 = load i32* %6, align 4, !llfi_index !66
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %62, i32 %63)
  %64 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str4, i32 0, i32 0), i32 %62), !llfi_index !67
  %65 = load double* %7, align 8, !llfi_index !68
  %66 = load double* %7, align 8, !llfi_index !68
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %65, double %66)
  %67 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([39 x i8]* @.str5, i32 0, i32 0), double %65), !llfi_index !69
  %68 = load double* %8, align 8, !llfi_index !70
  %69 = load double* %8, align 8, !llfi_index !70
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %68, double %69)
  %70 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([39 x i8]* @.str6, i32 0, i32 0), double %68), !llfi_index !71
  %71 = load i8** %9, align 8, !llfi_index !72
  %72 = load i8** %9, align 8, !llfi_index !72
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %71, i8* %72)
  %73 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str7, i32 0, i32 0), i8* %71), !llfi_index !73
  %74 = load i32* %10, align 4, !llfi_index !74
  %75 = load i32* %10, align 4, !llfi_index !74
  %76 = icmp slt i32 %74, 0, !llfi_index !75
  %77 = icmp slt i32 %75, 0, !llfi_index !75
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %76, i1 %77)
  br i1 %76, label %78, label %80, !llfi_index !76

; <label>:78                                      ; preds = %61
  %79 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([45 x i8]* @.str8, i32 0, i32 0)), !llfi_index !77
  br label %90, !llfi_index !78

; <label>:80                                      ; preds = %61
  %81 = load i32* %10, align 4, !llfi_index !79
  %82 = load i32* %10, align 4, !llfi_index !79
  %83 = icmp ne i32 %81, 0, !llfi_index !80
  %84 = icmp ne i32 %82, 0, !llfi_index !80
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %83, i1 %84)
  br i1 %83, label %85, label %87, !llfi_index !81

; <label>:85                                      ; preds = %80
  %86 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([45 x i8]* @.str9, i32 0, i32 0)), !llfi_index !82
  br label %89, !llfi_index !83

; <label>:87                                      ; preds = %80
  %88 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([45 x i8]* @.str10, i32 0, i32 0)), !llfi_index !84
  br label %89, !llfi_index !85

; <label>:89                                      ; preds = %87, %85
  br label %90, !llfi_index !86

; <label>:90                                      ; preds = %89, %78
  %91 = load i8** %11, align 8, !llfi_index !87
  %92 = load i8** %11, align 8, !llfi_index !87
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %91, i8* %92)
  %93 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str11, i32 0, i32 0), i8* %91), !llfi_index !88
  %94 = load i8** %12, align 8, !llfi_index !89
  %95 = load i8** %12, align 8, !llfi_index !89
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %94, i8* %95)
  %96 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str12, i32 0, i32 0), i8* %94), !llfi_index !90
  %97 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str13, i32 0, i32 0)), !llfi_index !91
  %98 = load i8** %13, align 8, !llfi_index !92
  %99 = load i8** %13, align 8, !llfi_index !92
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %98, i8* %99)
  %100 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str14, i32 0, i32 0), i8* %98), !llfi_index !93
  %101 = load i8** %14, align 8, !llfi_index !94
  %102 = load i8** %14, align 8, !llfi_index !94
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %101, i8* %102)
  %103 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str15, i32 0, i32 0), i8* %101), !llfi_index !95
  %104 = load i8** %15, align 8, !llfi_index !96
  %105 = load i8** %15, align 8, !llfi_index !96
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %104, i8* %105)
  %106 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str16, i32 0, i32 0), i8* %104), !llfi_index !97
  %107 = load i8** %16, align 8, !llfi_index !98
  %108 = load i8** %16, align 8, !llfi_index !98
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %107, i8* %108)
  %109 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str17, i32 0, i32 0), i8* %107), !llfi_index !99
  %110 = load i8** %17, align 8, !llfi_index !100
  %111 = load i8** %17, align 8, !llfi_index !100
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %110, i8* %111)
  %112 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str18, i32 0, i32 0), i8* %110), !llfi_index !101
  %113 = load i8** %18, align 8, !llfi_index !102
  %114 = load i8** %18, align 8, !llfi_index !102
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %113, i8* %114)
  %115 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str19, i32 0, i32 0), i8* %113), !llfi_index !103
  %116 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([41 x i8]* @.str20, i32 0, i32 0)), !llfi_index !104
  %117 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([39 x i8]* @.str21, i32 0, i32 0)), !llfi_index !105
  %118 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([34 x i8]* @.str22, i32 0, i32 0)), !llfi_index !106
  %119 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str23, i32 0, i32 0)), !llfi_index !107
  %120 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([24 x i8]* @.str24, i32 0, i32 0)), !llfi_index !108
  %121 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([40 x i8]* @.str25, i32 0, i32 0)), !llfi_index !109
  ret void, !llfi_index !110
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define void @timer_clear(i32 %n) #0 {
  %1 = alloca i32, align 4, !llfi_index !111
  store i32 %n, i32* %1, align 4, !llfi_index !112
  %2 = load i32* %1, align 4, !llfi_index !113
  %3 = load i32* %1, align 4, !llfi_index !113
  %4 = sext i32 %2 to i64, !llfi_index !114
  %5 = sext i32 %3 to i64, !llfi_index !114
  %6 = getelementptr inbounds [64 x double]* @elapsed, i32 0, i64 %4, !llfi_index !115
  %7 = getelementptr inbounds [64 x double]* @elapsed, i32 0, i64 %5, !llfi_index !115
  call void bitcast (void (i64, i64)* @global_add to void (double*, double*)*)(double* %6, double* %7)
  store double 0.000000e+00, double* %6, align 8, !llfi_index !116
  ret void, !llfi_index !117
}

; Function Attrs: nounwind uwtable
define void @timer_start(i32 %n) #0 {
  %1 = alloca i32, align 4, !llfi_index !118
  store i32 %n, i32* %1, align 4, !llfi_index !119
  %2 = call double @elapsed_time(), !llfi_index !120
  %3 = load i32* %1, align 4, !llfi_index !121
  %4 = load i32* %1, align 4, !llfi_index !121
  %5 = sext i32 %3 to i64, !llfi_index !122
  %6 = sext i32 %4 to i64, !llfi_index !122
  %7 = getelementptr inbounds [64 x double]* @start, i32 0, i64 %5, !llfi_index !123
  %8 = getelementptr inbounds [64 x double]* @start, i32 0, i64 %6, !llfi_index !123
  call void bitcast (void (i64, i64)* @global_add to void (double*, double*)*)(double* %7, double* %8)
  store double %2, double* %7, align 8, !llfi_index !124
  ret void, !llfi_index !125
}

; Function Attrs: nounwind uwtable
define void @timer_stop(i32 %n) #0 {
  %1 = alloca i32, align 4, !llfi_index !126
  %t = alloca double, align 8, !llfi_index !127
  %now = alloca double, align 8, !llfi_index !128
  store i32 %n, i32* %1, align 4, !llfi_index !129
  %2 = call double @elapsed_time(), !llfi_index !130
  store double %2, double* %now, align 8, !llfi_index !131
  %3 = load double* %now, align 8, !llfi_index !132
  %4 = load double* %now, align 8, !llfi_index !132
  %5 = load i32* %1, align 4, !llfi_index !133
  %6 = load i32* %1, align 4, !llfi_index !133
  %7 = sext i32 %5 to i64, !llfi_index !134
  %8 = sext i32 %6 to i64, !llfi_index !134
  %9 = getelementptr inbounds [64 x double]* @start, i32 0, i64 %7, !llfi_index !135
  %10 = getelementptr inbounds [64 x double]* @start, i32 0, i64 %8, !llfi_index !135
  %11 = load double* %9, align 8, !llfi_index !136
  %12 = load double* %10, align 8, !llfi_index !136
  %13 = fsub double %3, %11, !llfi_index !137
  %14 = fsub double %4, %12, !llfi_index !137
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %13, double %14)
  store double %13, double* %t, align 8, !llfi_index !138
  %15 = load double* %t, align 8, !llfi_index !139
  %16 = load double* %t, align 8, !llfi_index !139
  %17 = load i32* %1, align 4, !llfi_index !140
  %18 = load i32* %1, align 4, !llfi_index !140
  %19 = sext i32 %17 to i64, !llfi_index !141
  %20 = sext i32 %18 to i64, !llfi_index !141
  %21 = getelementptr inbounds [64 x double]* @elapsed, i32 0, i64 %19, !llfi_index !142
  %22 = getelementptr inbounds [64 x double]* @elapsed, i32 0, i64 %20, !llfi_index !142
  %23 = load double* %21, align 8, !llfi_index !143
  %24 = load double* %22, align 8, !llfi_index !143
  %25 = fadd double %23, %15, !llfi_index !144
  %26 = fadd double %24, %16, !llfi_index !144
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %25, double %26)
  store double %25, double* %21, align 8, !llfi_index !145
  ret void, !llfi_index !146
}

; Function Attrs: nounwind uwtable
define double @timer_read(i32 %n) #0 {
  %1 = alloca i32, align 4, !llfi_index !147
  store i32 %n, i32* %1, align 4, !llfi_index !148
  %2 = load i32* %1, align 4, !llfi_index !149
  %3 = load i32* %1, align 4, !llfi_index !149
  %4 = sext i32 %2 to i64, !llfi_index !150
  %5 = sext i32 %3 to i64, !llfi_index !150
  %6 = getelementptr inbounds [64 x double]* @elapsed, i32 0, i64 %4, !llfi_index !151
  %7 = getelementptr inbounds [64 x double]* @elapsed, i32 0, i64 %5, !llfi_index !151
  %8 = load double* %6, align 8, !llfi_index !152
  %9 = load double* %7, align 8, !llfi_index !152
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %8, double %9)
  ret double %8, !llfi_index !153
}

; Function Attrs: nounwind uwtable
define internal double @elapsed_time() #0 {
  %t = alloca double, align 8, !llfi_index !154
  call void @wtime_(double* %t), !llfi_index !155
  %1 = load double* %t, align 8, !llfi_index !156
  %2 = load double* %t, align 8, !llfi_index !156
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %1, double %2)
  ret double %1, !llfi_index !157
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4, !llfi_index !158
  %Mops = alloca double, align 8, !llfi_index !159
  %t1 = alloca double, align 8, !llfi_index !160
  %t2 = alloca double, align 8, !llfi_index !161
  %t3 = alloca double, align 8, !llfi_index !162
  %t4 = alloca double, align 8, !llfi_index !163
  %x1 = alloca double, align 8, !llfi_index !164
  %x2 = alloca double, align 8, !llfi_index !165
  %sx = alloca double, align 8, !llfi_index !166
  %sy = alloca double, align 8, !llfi_index !167
  %tm = alloca double, align 8, !llfi_index !168
  %an = alloca double, align 8, !llfi_index !169
  %tt = alloca double, align 8, !llfi_index !170
  %gc = alloca double, align 8, !llfi_index !171
  %sx_verify_value = alloca double, align 8, !llfi_index !172
  %sy_verify_value = alloca double, align 8, !llfi_index !173
  %sx_err = alloca double, align 8, !llfi_index !174
  %sy_err = alloca double, align 8, !llfi_index !175
  %np = alloca i32, align 4, !llfi_index !176
  %i = alloca i32, align 4, !llfi_index !177
  %ik = alloca i32, align 4, !llfi_index !178
  %kk = alloca i32, align 4, !llfi_index !179
  %l = alloca i32, align 4, !llfi_index !180
  %k = alloca i32, align 4, !llfi_index !181
  %nit = alloca i32, align 4, !llfi_index !182
  %k_offset = alloca i32, align 4, !llfi_index !183
  %j = alloca i32, align 4, !llfi_index !184
  %verified = alloca i32, align 4, !llfi_index !185
  %timers_enabled = alloca i32, align 4, !llfi_index !186
  %dum = alloca [3 x double], align 16, !llfi_index !187
  %size = alloca [16 x i8], align 16, !llfi_index !188
  %fp = alloca %struct._IO_FILE*, align 8, !llfi_index !189
  store i32 0, i32* %1, !llfi_index !190
  %2 = bitcast [3 x double]* %dum to i8*, !llfi_index !191
  %3 = bitcast [3 x double]* %dum to i8*, !llfi_index !191
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %2, i8* %3)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* bitcast ([3 x double]* @main.dum to i8*), i64 24, i32 16, i1 false), !llfi_index !192
  %4 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([11 x i8]* @.str26, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str127, i32 0, i32 0)), !llfi_index !193
  store %struct._IO_FILE* %4, %struct._IO_FILE** %fp, align 8, !llfi_index !194
  %5 = icmp eq %struct._IO_FILE* %4, null, !llfi_index !195
  %6 = icmp eq %struct._IO_FILE* %4, null, !llfi_index !195
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %5, i1 %6)
  br i1 %5, label %7, label %8, !llfi_index !196

; <label>:7                                       ; preds = %0
  store i32 0, i32* %timers_enabled, align 4, !llfi_index !197
  br label %12, !llfi_index !198

; <label>:8                                       ; preds = %0
  store i32 1, i32* %timers_enabled, align 4, !llfi_index !199
  %9 = load %struct._IO_FILE** %fp, align 8, !llfi_index !200
  %10 = load %struct._IO_FILE** %fp, align 8, !llfi_index !200
  call void bitcast (void (i64, i64)* @global_add to void (%struct._IO_FILE*, %struct._IO_FILE*)*)(%struct._IO_FILE* %9, %struct._IO_FILE* %10)
  %11 = call i32 @fclose(%struct._IO_FILE* %9), !llfi_index !201
  br label %12, !llfi_index !202

; <label>:12                                      ; preds = %8, %7
  %13 = getelementptr inbounds [16 x i8]* %size, i32 0, i32 0, !llfi_index !203
  %14 = getelementptr inbounds [16 x i8]* %size, i32 0, i32 0, !llfi_index !203
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %13, i8* %14)
  %15 = call double @pow(double 2.000000e+00, double 2.600000e+01) #2, !llfi_index !204
  %16 = call i32 (i8*, i8*, ...)* @sprintf(i8* %13, i8* getelementptr inbounds ([8 x i8]* @.str228, i32 0, i32 0), double %15) #2, !llfi_index !205
  store i32 14, i32* %j, align 4, !llfi_index !206
  %17 = load i32* %j, align 4, !llfi_index !207
  %18 = load i32* %j, align 4, !llfi_index !207
  %19 = sext i32 %17 to i64, !llfi_index !208
  %20 = sext i32 %18 to i64, !llfi_index !208
  %21 = getelementptr inbounds [16 x i8]* %size, i32 0, i64 %19, !llfi_index !209
  %22 = getelementptr inbounds [16 x i8]* %size, i32 0, i64 %20, !llfi_index !209
  %23 = load i8* %21, align 1, !llfi_index !210
  %24 = load i8* %22, align 1, !llfi_index !210
  %25 = sext i8 %23 to i32, !llfi_index !211
  %26 = sext i8 %24 to i32, !llfi_index !211
  %27 = icmp eq i32 %25, 46, !llfi_index !212
  %28 = icmp eq i32 %26, 46, !llfi_index !212
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %27, i1 %28)
  br i1 %27, label %29, label %34, !llfi_index !213

; <label>:29                                      ; preds = %12
  %30 = load i32* %j, align 4, !llfi_index !214
  %31 = load i32* %j, align 4, !llfi_index !214
  %32 = add nsw i32 %30, -1, !llfi_index !215
  %33 = add nsw i32 %31, -1, !llfi_index !215
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %32, i32 %33)
  store i32 %32, i32* %j, align 4, !llfi_index !216
  br label %34, !llfi_index !217

; <label>:34                                      ; preds = %29, %12
  %35 = load i32* %j, align 4, !llfi_index !218
  %36 = load i32* %j, align 4, !llfi_index !218
  %37 = add nsw i32 %35, 1, !llfi_index !219
  %38 = add nsw i32 %36, 1, !llfi_index !219
  %39 = sext i32 %37 to i64, !llfi_index !220
  %40 = sext i32 %38 to i64, !llfi_index !220
  %41 = getelementptr inbounds [16 x i8]* %size, i32 0, i64 %39, !llfi_index !221
  %42 = getelementptr inbounds [16 x i8]* %size, i32 0, i64 %40, !llfi_index !221
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %41, i8* %42)
  store i8 0, i8* %41, align 1, !llfi_index !222
  %43 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([58 x i8]* @.str329, i32 0, i32 0)), !llfi_index !223
  %44 = getelementptr inbounds [16 x i8]* %size, i32 0, i32 0, !llfi_index !224
  %45 = getelementptr inbounds [16 x i8]* %size, i32 0, i32 0, !llfi_index !224
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %44, i8* %45)
  %46 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str430, i32 0, i32 0), i8* %44), !llfi_index !225
  store i32 0, i32* %verified, align 4, !llfi_index !226
  store i32 512, i32* %np, align 4, !llfi_index !227
  %47 = getelementptr inbounds [3 x double]* %dum, i32 0, i64 0, !llfi_index !228
  %48 = getelementptr inbounds [3 x double]* %dum, i32 0, i64 0, !llfi_index !228
  call void bitcast (void (i64, i64)* @global_add to void (double*, double*)*)(double* %47, double* %48)
  %49 = getelementptr inbounds [3 x double]* %dum, i32 0, i64 1, !llfi_index !229
  %50 = getelementptr inbounds [3 x double]* %dum, i32 0, i64 1, !llfi_index !229
  %51 = load double* %49, align 8, !llfi_index !230
  %52 = load double* %50, align 8, !llfi_index !230
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %51, double %52)
  %53 = getelementptr inbounds [3 x double]* %dum, i32 0, i64 2, !llfi_index !231
  %54 = getelementptr inbounds [3 x double]* %dum, i32 0, i64 2, !llfi_index !231
  call void bitcast (void (i64, i64)* @global_add to void (double*, double*)*)(double* %53, double* %54)
  call void @vranlc(i32 0, double* %47, double %51, double* %53), !llfi_index !232
  %55 = getelementptr inbounds [3 x double]* %dum, i32 0, i64 1, !llfi_index !233
  %56 = getelementptr inbounds [3 x double]* %dum, i32 0, i64 1, !llfi_index !233
  call void bitcast (void (i64, i64)* @global_add to void (double*, double*)*)(double* %55, double* %56)
  %57 = getelementptr inbounds [3 x double]* %dum, i32 0, i64 2, !llfi_index !234
  %58 = getelementptr inbounds [3 x double]* %dum, i32 0, i64 2, !llfi_index !234
  %59 = load double* %57, align 8, !llfi_index !235
  %60 = load double* %58, align 8, !llfi_index !235
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %59, double %60)
  %61 = call double @randlc(double* %55, double %59), !llfi_index !236
  %62 = getelementptr inbounds [3 x double]* %dum, i32 0, i64 0, !llfi_index !237
  %63 = getelementptr inbounds [3 x double]* %dum, i32 0, i64 0, !llfi_index !237
  call void bitcast (void (i64, i64)* @global_add to void (double*, double*)*)(double* %62, double* %63)
  store double %61, double* %62, align 8, !llfi_index !238
  store i32 0, i32* %i, align 4, !llfi_index !239
  br label %64, !llfi_index !240

; <label>:64                                      ; preds = %76, %34
  %65 = load i32* %i, align 4, !llfi_index !241
  %66 = load i32* %i, align 4, !llfi_index !241
  %67 = icmp slt i32 %65, 131072, !llfi_index !242
  %68 = icmp slt i32 %66, 131072, !llfi_index !242
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %67, i1 %68)
  br i1 %67, label %69, label %81, !llfi_index !243

; <label>:69                                      ; preds = %64
  %70 = load i32* %i, align 4, !llfi_index !244
  %71 = load i32* %i, align 4, !llfi_index !244
  %72 = sext i32 %70 to i64, !llfi_index !245
  %73 = sext i32 %71 to i64, !llfi_index !245
  %74 = getelementptr inbounds [131072 x double]* @x, i32 0, i64 %72, !llfi_index !246
  %75 = getelementptr inbounds [131072 x double]* @x, i32 0, i64 %73, !llfi_index !246
  call void bitcast (void (i64, i64)* @global_add to void (double*, double*)*)(double* %74, double* %75)
  store double -1.000000e+99, double* %74, align 8, !llfi_index !247
  br label %76, !llfi_index !248

; <label>:76                                      ; preds = %69
  %77 = load i32* %i, align 4, !llfi_index !249
  %78 = load i32* %i, align 4, !llfi_index !249
  %79 = add nsw i32 %77, 1, !llfi_index !250
  %80 = add nsw i32 %78, 1, !llfi_index !250
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %79, i32 %80)
  store i32 %79, i32* %i, align 4, !llfi_index !251
  br label %64, !llfi_index !252

; <label>:81                                      ; preds = %64
  %82 = call double @fabs(double 1.000000e+00) #6, !llfi_index !253
  %83 = call double @sqrt(double %82) #2, !llfi_index !254
  %84 = call double @log(double %83) #2, !llfi_index !255
  store double %84, double* %Mops, align 8, !llfi_index !256
  call void @timer_clear(i32 0), !llfi_index !257
  call void @timer_clear(i32 1), !llfi_index !258
  call void @timer_clear(i32 2), !llfi_index !259
  call void @timer_start(i32 0), !llfi_index !260
  store double 0x41D2309CE5400000, double* %t1, align 8, !llfi_index !261
  call void @vranlc(i32 0, double* %t1, double 0x41D2309CE5400000, double* getelementptr inbounds ([131072 x double]* @x, i32 0, i32 0)), !llfi_index !262
  store double 0x41D2309CE5400000, double* %t1, align 8, !llfi_index !263
  store i32 0, i32* %i, align 4, !llfi_index !264
  br label %85, !llfi_index !265

; <label>:85                                      ; preds = %94, %81
  %86 = load i32* %i, align 4, !llfi_index !266
  %87 = load i32* %i, align 4, !llfi_index !266
  %88 = icmp slt i32 %86, 17, !llfi_index !267
  %89 = icmp slt i32 %87, 17, !llfi_index !267
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %88, i1 %89)
  br i1 %88, label %90, label %99, !llfi_index !268

; <label>:90                                      ; preds = %85
  %91 = load double* %t1, align 8, !llfi_index !269
  %92 = load double* %t1, align 8, !llfi_index !269
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %91, double %92)
  %93 = call double @randlc(double* %t1, double %91), !llfi_index !270
  store double %93, double* %t2, align 8, !llfi_index !271
  br label %94, !llfi_index !272

; <label>:94                                      ; preds = %90
  %95 = load i32* %i, align 4, !llfi_index !273
  %96 = load i32* %i, align 4, !llfi_index !273
  %97 = add nsw i32 %95, 1, !llfi_index !274
  %98 = add nsw i32 %96, 1, !llfi_index !274
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %97, i32 %98)
  store i32 %97, i32* %i, align 4, !llfi_index !275
  br label %85, !llfi_index !276

; <label>:99                                      ; preds = %85
  %100 = load double* %t1, align 8, !llfi_index !277
  %101 = load double* %t1, align 8, !llfi_index !277
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %100, double %101)
  store double %100, double* %an, align 8, !llfi_index !278
  store double 0x41B033C4D7000000, double* %tt, align 8, !llfi_index !279
  store double 0.000000e+00, double* %gc, align 8, !llfi_index !280
  store double 0.000000e+00, double* %sx, align 8, !llfi_index !281
  store double 0.000000e+00, double* %sy, align 8, !llfi_index !282
  store i32 0, i32* %i, align 4, !llfi_index !283
  br label %102, !llfi_index !284

; <label>:102                                     ; preds = %114, %99
  %103 = load i32* %i, align 4, !llfi_index !285
  %104 = load i32* %i, align 4, !llfi_index !285
  %105 = icmp slt i32 %103, 10, !llfi_index !286
  %106 = icmp slt i32 %104, 10, !llfi_index !286
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %105, i1 %106)
  br i1 %105, label %107, label %119, !llfi_index !287

; <label>:107                                     ; preds = %102
  %108 = load i32* %i, align 4, !llfi_index !288
  %109 = load i32* %i, align 4, !llfi_index !288
  %110 = sext i32 %108 to i64, !llfi_index !289
  %111 = sext i32 %109 to i64, !llfi_index !289
  %112 = getelementptr inbounds [10 x double]* @q, i32 0, i64 %110, !llfi_index !290
  %113 = getelementptr inbounds [10 x double]* @q, i32 0, i64 %111, !llfi_index !290
  call void bitcast (void (i64, i64)* @global_add to void (double*, double*)*)(double* %112, double* %113)
  store double 0.000000e+00, double* %112, align 8, !llfi_index !291
  br label %114, !llfi_index !292

; <label>:114                                     ; preds = %107
  %115 = load i32* %i, align 4, !llfi_index !293
  %116 = load i32* %i, align 4, !llfi_index !293
  %117 = add nsw i32 %115, 1, !llfi_index !294
  %118 = add nsw i32 %116, 1, !llfi_index !294
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %117, i32 %118)
  store i32 %117, i32* %i, align 4, !llfi_index !295
  br label %102, !llfi_index !296

; <label>:119                                     ; preds = %102
  store i32 -1, i32* %k_offset, align 4, !llfi_index !297
  store i32 1, i32* %k, align 4, !llfi_index !298
  br label %120, !llfi_index !299

; <label>:120                                     ; preds = %332, %119
  %121 = load i32* %k, align 4, !llfi_index !300
  %122 = load i32* %k, align 4, !llfi_index !300
  %123 = load i32* %np, align 4, !llfi_index !301
  %124 = load i32* %np, align 4, !llfi_index !301
  %125 = icmp sle i32 %121, %123, !llfi_index !302
  %126 = icmp sle i32 %122, %124, !llfi_index !302
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %125, i1 %126)
  br i1 %125, label %127, label %337, !llfi_index !303

; <label>:127                                     ; preds = %120
  %128 = load i32* %k_offset, align 4, !llfi_index !304
  %129 = load i32* %k_offset, align 4, !llfi_index !304
  %130 = load i32* %k, align 4, !llfi_index !305
  %131 = load i32* %k, align 4, !llfi_index !305
  %132 = add nsw i32 %128, %130, !llfi_index !306
  %133 = add nsw i32 %129, %131, !llfi_index !306
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %132, i32 %133)
  store i32 %132, i32* %kk, align 4, !llfi_index !307
  store double 0x41B033C4D7000000, double* %t1, align 8, !llfi_index !308
  %134 = load double* %an, align 8, !llfi_index !309
  %135 = load double* %an, align 8, !llfi_index !309
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %134, double %135)
  store double %134, double* %t2, align 8, !llfi_index !310
  store i32 1, i32* %i, align 4, !llfi_index !311
  br label %136, !llfi_index !312

; <label>:136                                     ; preds = %170, %127
  %137 = load i32* %i, align 4, !llfi_index !313
  %138 = load i32* %i, align 4, !llfi_index !313
  %139 = icmp sle i32 %137, 100, !llfi_index !314
  %140 = icmp sle i32 %138, 100, !llfi_index !314
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %139, i1 %140)
  br i1 %139, label %141, label %175, !llfi_index !315

; <label>:141                                     ; preds = %136
  %142 = load i32* %kk, align 4, !llfi_index !316
  %143 = load i32* %kk, align 4, !llfi_index !316
  %144 = sdiv i32 %142, 2, !llfi_index !317
  %145 = sdiv i32 %143, 2, !llfi_index !317
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %144, i32 %145)
  store i32 %144, i32* %ik, align 4, !llfi_index !318
  %146 = load i32* %ik, align 4, !llfi_index !319
  %147 = load i32* %ik, align 4, !llfi_index !319
  %148 = mul nsw i32 2, %146, !llfi_index !320
  %149 = mul nsw i32 2, %147, !llfi_index !320
  %150 = load i32* %kk, align 4, !llfi_index !321
  %151 = load i32* %kk, align 4, !llfi_index !321
  %152 = icmp ne i32 %148, %150, !llfi_index !322
  %153 = icmp ne i32 %149, %151, !llfi_index !322
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %152, i1 %153)
  br i1 %152, label %154, label %158, !llfi_index !323

; <label>:154                                     ; preds = %141
  %155 = load double* %t2, align 8, !llfi_index !324
  %156 = load double* %t2, align 8, !llfi_index !324
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %155, double %156)
  %157 = call double @randlc(double* %t1, double %155), !llfi_index !325
  store double %157, double* %t3, align 8, !llfi_index !326
  br label %158, !llfi_index !327

; <label>:158                                     ; preds = %154, %141
  %159 = load i32* %ik, align 4, !llfi_index !328
  %160 = load i32* %ik, align 4, !llfi_index !328
  %161 = icmp eq i32 %159, 0, !llfi_index !329
  %162 = icmp eq i32 %160, 0, !llfi_index !329
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %161, i1 %162)
  br i1 %161, label %163, label %164, !llfi_index !330

; <label>:163                                     ; preds = %158
  br label %175, !llfi_index !331

; <label>:164                                     ; preds = %158
  %165 = load double* %t2, align 8, !llfi_index !332
  %166 = load double* %t2, align 8, !llfi_index !332
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %165, double %166)
  %167 = call double @randlc(double* %t2, double %165), !llfi_index !333
  store double %167, double* %t3, align 8, !llfi_index !334
  %168 = load i32* %ik, align 4, !llfi_index !335
  %169 = load i32* %ik, align 4, !llfi_index !335
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %168, i32 %169)
  store i32 %168, i32* %kk, align 4, !llfi_index !336
  br label %170, !llfi_index !337

; <label>:170                                     ; preds = %164
  %171 = load i32* %i, align 4, !llfi_index !338
  %172 = load i32* %i, align 4, !llfi_index !338
  %173 = add nsw i32 %171, 1, !llfi_index !339
  %174 = add nsw i32 %172, 1, !llfi_index !339
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %173, i32 %174)
  store i32 %173, i32* %i, align 4, !llfi_index !340
  br label %136, !llfi_index !341

; <label>:175                                     ; preds = %163, %136
  %176 = load i32* %timers_enabled, align 4, !llfi_index !342
  %177 = load i32* %timers_enabled, align 4, !llfi_index !342
  %178 = icmp ne i32 %176, 0, !llfi_index !343
  %179 = icmp ne i32 %177, 0, !llfi_index !343
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %178, i1 %179)
  br i1 %178, label %180, label %181, !llfi_index !344

; <label>:180                                     ; preds = %175
  call void @timer_start(i32 2), !llfi_index !345
  br label %181, !llfi_index !346

; <label>:181                                     ; preds = %180, %175
  call void @vranlc(i32 131072, double* %t1, double 0x41D2309CE5400000, double* getelementptr inbounds ([131072 x double]* @x, i32 0, i32 0)), !llfi_index !347
  %182 = load i32* %timers_enabled, align 4, !llfi_index !348
  %183 = load i32* %timers_enabled, align 4, !llfi_index !348
  %184 = icmp ne i32 %182, 0, !llfi_index !349
  %185 = icmp ne i32 %183, 0, !llfi_index !349
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %184, i1 %185)
  br i1 %184, label %186, label %187, !llfi_index !350

; <label>:186                                     ; preds = %181
  call void @timer_stop(i32 2), !llfi_index !351
  br label %187, !llfi_index !352

; <label>:187                                     ; preds = %186, %181
  %188 = load i32* %timers_enabled, align 4, !llfi_index !353
  %189 = load i32* %timers_enabled, align 4, !llfi_index !353
  %190 = icmp ne i32 %188, 0, !llfi_index !354
  %191 = icmp ne i32 %189, 0, !llfi_index !354
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %190, i1 %191)
  br i1 %190, label %192, label %193, !llfi_index !355

; <label>:192                                     ; preds = %187
  call void @timer_start(i32 1), !llfi_index !356
  br label %193, !llfi_index !357

; <label>:193                                     ; preds = %192, %187
  store i32 0, i32* %i, align 4, !llfi_index !358
  br label %194, !llfi_index !359

; <label>:194                                     ; preds = %320, %193
  %195 = load i32* %i, align 4, !llfi_index !360
  %196 = load i32* %i, align 4, !llfi_index !360
  %197 = icmp slt i32 %195, 65536, !llfi_index !361
  %198 = icmp slt i32 %196, 65536, !llfi_index !361
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %197, i1 %198)
  br i1 %197, label %199, label %325, !llfi_index !362

; <label>:199                                     ; preds = %194
  %200 = load i32* %i, align 4, !llfi_index !363
  %201 = load i32* %i, align 4, !llfi_index !363
  %202 = mul nsw i32 2, %200, !llfi_index !364
  %203 = mul nsw i32 2, %201, !llfi_index !364
  %204 = sext i32 %202 to i64, !llfi_index !365
  %205 = sext i32 %203 to i64, !llfi_index !365
  %206 = getelementptr inbounds [131072 x double]* @x, i32 0, i64 %204, !llfi_index !366
  %207 = getelementptr inbounds [131072 x double]* @x, i32 0, i64 %205, !llfi_index !366
  %208 = load double* %206, align 8, !llfi_index !367
  %209 = load double* %207, align 8, !llfi_index !367
  %210 = fmul double 2.000000e+00, %208, !llfi_index !368
  %211 = fmul double 2.000000e+00, %209, !llfi_index !368
  %212 = fsub double %210, 1.000000e+00, !llfi_index !369
  %213 = fsub double %211, 1.000000e+00, !llfi_index !369
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %212, double %213)
  store double %212, double* %x1, align 8, !llfi_index !370
  %214 = load i32* %i, align 4, !llfi_index !371
  %215 = load i32* %i, align 4, !llfi_index !371
  %216 = mul nsw i32 2, %214, !llfi_index !372
  %217 = mul nsw i32 2, %215, !llfi_index !372
  %218 = add nsw i32 %216, 1, !llfi_index !373
  %219 = add nsw i32 %217, 1, !llfi_index !373
  %220 = sext i32 %218 to i64, !llfi_index !374
  %221 = sext i32 %219 to i64, !llfi_index !374
  %222 = getelementptr inbounds [131072 x double]* @x, i32 0, i64 %220, !llfi_index !375
  %223 = getelementptr inbounds [131072 x double]* @x, i32 0, i64 %221, !llfi_index !375
  %224 = load double* %222, align 8, !llfi_index !376
  %225 = load double* %223, align 8, !llfi_index !376
  %226 = fmul double 2.000000e+00, %224, !llfi_index !377
  %227 = fmul double 2.000000e+00, %225, !llfi_index !377
  %228 = fsub double %226, 1.000000e+00, !llfi_index !378
  %229 = fsub double %227, 1.000000e+00, !llfi_index !378
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %228, double %229)
  store double %228, double* %x2, align 8, !llfi_index !379
  %230 = load double* %x1, align 8, !llfi_index !380
  %231 = load double* %x1, align 8, !llfi_index !380
  %232 = load double* %x1, align 8, !llfi_index !381
  %233 = load double* %x1, align 8, !llfi_index !381
  %234 = fmul double %230, %232, !llfi_index !382
  %235 = fmul double %231, %233, !llfi_index !382
  %236 = load double* %x2, align 8, !llfi_index !383
  %237 = load double* %x2, align 8, !llfi_index !383
  %238 = load double* %x2, align 8, !llfi_index !384
  %239 = load double* %x2, align 8, !llfi_index !384
  %240 = fmul double %236, %238, !llfi_index !385
  %241 = fmul double %237, %239, !llfi_index !385
  %242 = fadd double %234, %240, !llfi_index !386
  %243 = fadd double %235, %241, !llfi_index !386
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %242, double %243)
  store double %242, double* %t1, align 8, !llfi_index !387
  %244 = load double* %t1, align 8, !llfi_index !388
  %245 = load double* %t1, align 8, !llfi_index !388
  %246 = fcmp ole double %244, 1.000000e+00, !llfi_index !389
  %247 = fcmp ole double %245, 1.000000e+00, !llfi_index !389
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %246, i1 %247)
  br i1 %246, label %248, label %319, !llfi_index !390

; <label>:248                                     ; preds = %199
  %249 = load double* %t1, align 8, !llfi_index !391
  %250 = load double* %t1, align 8, !llfi_index !391
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %249, double %250)
  %251 = call double @log(double %249) #2, !llfi_index !392
  %252 = fmul double -2.000000e+00, %251, !llfi_index !393
  %253 = fmul double -2.000000e+00, %251, !llfi_index !393
  %254 = load double* %t1, align 8, !llfi_index !394
  %255 = load double* %t1, align 8, !llfi_index !394
  %256 = fdiv double %252, %254, !llfi_index !395
  %257 = fdiv double %253, %255, !llfi_index !395
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %256, double %257)
  %258 = call double @sqrt(double %256) #2, !llfi_index !396
  store double %258, double* %t2, align 8, !llfi_index !397
  %259 = load double* %x1, align 8, !llfi_index !398
  %260 = load double* %x1, align 8, !llfi_index !398
  %261 = load double* %t2, align 8, !llfi_index !399
  %262 = load double* %t2, align 8, !llfi_index !399
  %263 = fmul double %259, %261, !llfi_index !400
  %264 = fmul double %260, %262, !llfi_index !400
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %263, double %264)
  store double %263, double* %t3, align 8, !llfi_index !401
  %265 = load double* %x2, align 8, !llfi_index !402
  %266 = load double* %x2, align 8, !llfi_index !402
  %267 = load double* %t2, align 8, !llfi_index !403
  %268 = load double* %t2, align 8, !llfi_index !403
  %269 = fmul double %265, %267, !llfi_index !404
  %270 = fmul double %266, %268, !llfi_index !404
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %269, double %270)
  store double %269, double* %t4, align 8, !llfi_index !405
  %271 = load double* %t3, align 8, !llfi_index !406
  %272 = load double* %t3, align 8, !llfi_index !406
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %271, double %272)
  %273 = call double @fabs(double %271) #6, !llfi_index !407
  %274 = load double* %t4, align 8, !llfi_index !408
  %275 = load double* %t4, align 8, !llfi_index !408
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %274, double %275)
  %276 = call double @fabs(double %274) #6, !llfi_index !409
  %277 = fcmp ogt double %273, %276, !llfi_index !410
  %278 = fcmp ogt double %273, %276, !llfi_index !410
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %277, i1 %278)
  br i1 %277, label %279, label %283, !llfi_index !411

; <label>:279                                     ; preds = %248
  %280 = load double* %t3, align 8, !llfi_index !412
  %281 = load double* %t3, align 8, !llfi_index !412
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %280, double %281)
  %282 = call double @fabs(double %280) #6, !llfi_index !413
  br label %287, !llfi_index !414

; <label>:283                                     ; preds = %248
  %284 = load double* %t4, align 8, !llfi_index !415
  %285 = load double* %t4, align 8, !llfi_index !415
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %284, double %285)
  %286 = call double @fabs(double %284) #6, !llfi_index !416
  br label %287, !llfi_index !417

; <label>:287                                     ; preds = %283, %279
  %288 = phi double [ %282, %279 ], [ %286, %283 ], !llfi_index !418
  %289 = fptosi double %288 to i32, !llfi_index !419
  %290 = fptosi double %288 to i32, !llfi_index !419
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %289, i32 %290)
  store i32 %289, i32* %l, align 4, !llfi_index !420
  %291 = load i32* %l, align 4, !llfi_index !421
  %292 = load i32* %l, align 4, !llfi_index !421
  %293 = sext i32 %291 to i64, !llfi_index !422
  %294 = sext i32 %292 to i64, !llfi_index !422
  %295 = getelementptr inbounds [10 x double]* @q, i32 0, i64 %293, !llfi_index !423
  %296 = getelementptr inbounds [10 x double]* @q, i32 0, i64 %294, !llfi_index !423
  %297 = load double* %295, align 8, !llfi_index !424
  %298 = load double* %296, align 8, !llfi_index !424
  %299 = fadd double %297, 1.000000e+00, !llfi_index !425
  %300 = fadd double %298, 1.000000e+00, !llfi_index !425
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %299, double %300)
  %301 = load i32* %l, align 4, !llfi_index !426
  %302 = load i32* %l, align 4, !llfi_index !426
  %303 = sext i32 %301 to i64, !llfi_index !427
  %304 = sext i32 %302 to i64, !llfi_index !427
  %305 = getelementptr inbounds [10 x double]* @q, i32 0, i64 %303, !llfi_index !428
  %306 = getelementptr inbounds [10 x double]* @q, i32 0, i64 %304, !llfi_index !428
  call void bitcast (void (i64, i64)* @global_add to void (double*, double*)*)(double* %305, double* %306)
  store double %299, double* %305, align 8, !llfi_index !429
  %307 = load double* %sx, align 8, !llfi_index !430
  %308 = load double* %sx, align 8, !llfi_index !430
  %309 = load double* %t3, align 8, !llfi_index !431
  %310 = load double* %t3, align 8, !llfi_index !431
  %311 = fadd double %307, %309, !llfi_index !432
  %312 = fadd double %308, %310, !llfi_index !432
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %311, double %312)
  store double %311, double* %sx, align 8, !llfi_index !433
  %313 = load double* %sy, align 8, !llfi_index !434
  %314 = load double* %sy, align 8, !llfi_index !434
  %315 = load double* %t4, align 8, !llfi_index !435
  %316 = load double* %t4, align 8, !llfi_index !435
  %317 = fadd double %313, %315, !llfi_index !436
  %318 = fadd double %314, %316, !llfi_index !436
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %317, double %318)
  store double %317, double* %sy, align 8, !llfi_index !437
  br label %319, !llfi_index !438

; <label>:319                                     ; preds = %287, %199
  br label %320, !llfi_index !439

; <label>:320                                     ; preds = %319
  %321 = load i32* %i, align 4, !llfi_index !440
  %322 = load i32* %i, align 4, !llfi_index !440
  %323 = add nsw i32 %321, 1, !llfi_index !441
  %324 = add nsw i32 %322, 1, !llfi_index !441
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %323, i32 %324)
  store i32 %323, i32* %i, align 4, !llfi_index !442
  br label %194, !llfi_index !443

; <label>:325                                     ; preds = %194
  %326 = load i32* %timers_enabled, align 4, !llfi_index !444
  %327 = load i32* %timers_enabled, align 4, !llfi_index !444
  %328 = icmp ne i32 %326, 0, !llfi_index !445
  %329 = icmp ne i32 %327, 0, !llfi_index !445
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %328, i1 %329)
  br i1 %328, label %330, label %331, !llfi_index !446

; <label>:330                                     ; preds = %325
  call void @timer_stop(i32 1), !llfi_index !447
  br label %331, !llfi_index !448

; <label>:331                                     ; preds = %330, %325
  br label %332, !llfi_index !449

; <label>:332                                     ; preds = %331
  %333 = load i32* %k, align 4, !llfi_index !450
  %334 = load i32* %k, align 4, !llfi_index !450
  %335 = add nsw i32 %333, 1, !llfi_index !451
  %336 = add nsw i32 %334, 1, !llfi_index !451
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %335, i32 %336)
  store i32 %335, i32* %k, align 4, !llfi_index !452
  br label %120, !llfi_index !453

; <label>:337                                     ; preds = %120
  store i32 0, i32* %i, align 4, !llfi_index !454
  br label %338, !llfi_index !455

; <label>:338                                     ; preds = %356, %337
  %339 = load i32* %i, align 4, !llfi_index !456
  %340 = load i32* %i, align 4, !llfi_index !456
  %341 = icmp slt i32 %339, 10, !llfi_index !457
  %342 = icmp slt i32 %340, 10, !llfi_index !457
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %341, i1 %342)
  br i1 %341, label %343, label %361, !llfi_index !458

; <label>:343                                     ; preds = %338
  %344 = load double* %gc, align 8, !llfi_index !459
  %345 = load double* %gc, align 8, !llfi_index !459
  %346 = load i32* %i, align 4, !llfi_index !460
  %347 = load i32* %i, align 4, !llfi_index !460
  %348 = sext i32 %346 to i64, !llfi_index !461
  %349 = sext i32 %347 to i64, !llfi_index !461
  %350 = getelementptr inbounds [10 x double]* @q, i32 0, i64 %348, !llfi_index !462
  %351 = getelementptr inbounds [10 x double]* @q, i32 0, i64 %349, !llfi_index !462
  %352 = load double* %350, align 8, !llfi_index !463
  %353 = load double* %351, align 8, !llfi_index !463
  %354 = fadd double %344, %352, !llfi_index !464
  %355 = fadd double %345, %353, !llfi_index !464
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %354, double %355)
  store double %354, double* %gc, align 8, !llfi_index !465
  br label %356, !llfi_index !466

; <label>:356                                     ; preds = %343
  %357 = load i32* %i, align 4, !llfi_index !467
  %358 = load i32* %i, align 4, !llfi_index !467
  %359 = add nsw i32 %357, 1, !llfi_index !468
  %360 = add nsw i32 %358, 1, !llfi_index !468
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %359, i32 %360)
  store i32 %359, i32* %i, align 4, !llfi_index !469
  br label %338, !llfi_index !470

; <label>:361                                     ; preds = %338
  call void @timer_stop(i32 0), !llfi_index !471
  %362 = call double @timer_read(i32 0), !llfi_index !472
  store double %362, double* %tm, align 8, !llfi_index !473
  store i32 0, i32* %nit, align 4, !llfi_index !474
  store i32 1, i32* %verified, align 4, !llfi_index !475
  store double 0xC0A65EA3B3DDC403, double* %sx_verify_value, align 8, !llfi_index !476
  store double 0xC0B8B00DBDEA03C7, double* %sy_verify_value, align 8, !llfi_index !477
  %363 = load i32* %verified, align 4, !llfi_index !478
  %364 = load i32* %verified, align 4, !llfi_index !478
  %365 = icmp ne i32 %363, 0, !llfi_index !479
  %366 = icmp ne i32 %364, 0, !llfi_index !479
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %365, i1 %366)
  br i1 %365, label %367, label %403, !llfi_index !480

; <label>:367                                     ; preds = %361
  %368 = load double* %sx, align 8, !llfi_index !481
  %369 = load double* %sx, align 8, !llfi_index !481
  %370 = load double* %sx_verify_value, align 8, !llfi_index !482
  %371 = load double* %sx_verify_value, align 8, !llfi_index !482
  %372 = fsub double %368, %370, !llfi_index !483
  %373 = fsub double %369, %371, !llfi_index !483
  %374 = load double* %sx_verify_value, align 8, !llfi_index !484
  %375 = load double* %sx_verify_value, align 8, !llfi_index !484
  %376 = fdiv double %372, %374, !llfi_index !485
  %377 = fdiv double %373, %375, !llfi_index !485
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %376, double %377)
  %378 = call double @fabs(double %376) #6, !llfi_index !486
  store double %378, double* %sx_err, align 8, !llfi_index !487
  %379 = load double* %sy, align 8, !llfi_index !488
  %380 = load double* %sy, align 8, !llfi_index !488
  %381 = load double* %sy_verify_value, align 8, !llfi_index !489
  %382 = load double* %sy_verify_value, align 8, !llfi_index !489
  %383 = fsub double %379, %381, !llfi_index !490
  %384 = fsub double %380, %382, !llfi_index !490
  %385 = load double* %sy_verify_value, align 8, !llfi_index !491
  %386 = load double* %sy_verify_value, align 8, !llfi_index !491
  %387 = fdiv double %383, %385, !llfi_index !492
  %388 = fdiv double %384, %386, !llfi_index !492
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %387, double %388)
  %389 = call double @fabs(double %387) #6, !llfi_index !493
  store double %389, double* %sy_err, align 8, !llfi_index !494
  %390 = load double* %sx_err, align 8, !llfi_index !495
  %391 = load double* %sx_err, align 8, !llfi_index !495
  %392 = fcmp ole double %390, 1.000000e-08, !llfi_index !496
  %393 = fcmp ole double %391, 1.000000e-08, !llfi_index !496
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %392, i1 %393)
  br i1 %392, label %394, label %399, !llfi_index !497

; <label>:394                                     ; preds = %367
  %395 = load double* %sy_err, align 8, !llfi_index !498
  %396 = load double* %sy_err, align 8, !llfi_index !498
  %397 = fcmp ole double %395, 1.000000e-08, !llfi_index !499
  %398 = fcmp ole double %396, 1.000000e-08, !llfi_index !499
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %397, i1 %398)
  br label %399, !llfi_index !500

; <label>:399                                     ; preds = %394, %367
  %400 = phi i1 [ false, %367 ], [ %397, %394 ], !llfi_index !501
  %401 = zext i1 %400 to i32, !llfi_index !502
  %402 = zext i1 %400 to i32, !llfi_index !502
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %401, i32 %402)
  store i32 %401, i32* %verified, align 4, !llfi_index !503
  br label %403, !llfi_index !504

; <label>:403                                     ; preds = %399, %361
  %404 = call double @pow(double 2.000000e+00, double 2.600000e+01) #2, !llfi_index !505
  %405 = load double* %tm, align 8, !llfi_index !506
  %406 = load double* %tm, align 8, !llfi_index !506
  %407 = fdiv double %404, %405, !llfi_index !507
  %408 = fdiv double %404, %406, !llfi_index !507
  %409 = fdiv double %407, 1.000000e+06, !llfi_index !508
  %410 = fdiv double %408, 1.000000e+06, !llfi_index !508
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %409, double %410)
  store double %409, double* %Mops, align 8, !llfi_index !509
  %411 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str531, i32 0, i32 0)), !llfi_index !510
  %412 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str632, i32 0, i32 0), i32 25), !llfi_index !511
  %413 = load double* %gc, align 8, !llfi_index !512
  %414 = load double* %gc, align 8, !llfi_index !512
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %413, double %414)
  %415 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([30 x i8]* @.str733, i32 0, i32 0), double %413), !llfi_index !513
  %416 = load double* %sx, align 8, !llfi_index !514
  %417 = load double* %sx, align 8, !llfi_index !514
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %416, double %417)
  %418 = load double* %sy, align 8, !llfi_index !515
  %419 = load double* %sy, align 8, !llfi_index !515
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %418, double %419)
  %420 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str834, i32 0, i32 0), double %416, double %418), !llfi_index !516
  %421 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str935, i32 0, i32 0)), !llfi_index !517
  store i32 0, i32* %i, align 4, !llfi_index !518
  br label %422, !llfi_index !519

; <label>:422                                     ; preds = %439, %403
  %423 = load i32* %i, align 4, !llfi_index !520
  %424 = load i32* %i, align 4, !llfi_index !520
  %425 = icmp slt i32 %423, 10, !llfi_index !521
  %426 = icmp slt i32 %424, 10, !llfi_index !521
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %425, i1 %426)
  br i1 %425, label %427, label %444, !llfi_index !522

; <label>:427                                     ; preds = %422
  %428 = load i32* %i, align 4, !llfi_index !523
  %429 = load i32* %i, align 4, !llfi_index !523
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %428, i32 %429)
  %430 = load i32* %i, align 4, !llfi_index !524
  %431 = load i32* %i, align 4, !llfi_index !524
  %432 = sext i32 %430 to i64, !llfi_index !525
  %433 = sext i32 %431 to i64, !llfi_index !525
  %434 = getelementptr inbounds [10 x double]* @q, i32 0, i64 %432, !llfi_index !526
  %435 = getelementptr inbounds [10 x double]* @q, i32 0, i64 %433, !llfi_index !526
  %436 = load double* %434, align 8, !llfi_index !527
  %437 = load double* %435, align 8, !llfi_index !527
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %436, double %437)
  %438 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str1036, i32 0, i32 0), i32 %428, double %436), !llfi_index !528
  br label %439, !llfi_index !529

; <label>:439                                     ; preds = %427
  %440 = load i32* %i, align 4, !llfi_index !530
  %441 = load i32* %i, align 4, !llfi_index !530
  %442 = add nsw i32 %440, 1, !llfi_index !531
  %443 = add nsw i32 %441, 1, !llfi_index !531
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %442, i32 %443)
  store i32 %442, i32* %i, align 4, !llfi_index !532
  br label %422, !llfi_index !533

; <label>:444                                     ; preds = %422
  %445 = load i32* %nit, align 4, !llfi_index !534
  %446 = load i32* %nit, align 4, !llfi_index !534
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %445, i32 %446)
  %447 = load double* %tm, align 8, !llfi_index !535
  %448 = load double* %tm, align 8, !llfi_index !535
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %447, double %448)
  %449 = load double* %Mops, align 8, !llfi_index !536
  %450 = load double* %Mops, align 8, !llfi_index !536
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %449, double %450)
  %451 = load i32* %verified, align 4, !llfi_index !537
  %452 = load i32* %verified, align 4, !llfi_index !537
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %451, i32 %452)
  call void @print_results(i8* getelementptr inbounds ([3 x i8]* @.str1137, i32 0, i32 0), i8 signext 87, i32 26, i32 0, i32 0, i32 %445, double %447, double %449, i8* getelementptr inbounds ([25 x i8]* @.str1238, i32 0, i32 0), i32 %451, i8* getelementptr inbounds ([6 x i8]* @.str1339, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8]* @.str1440, i32 0, i32 0), i8* getelementptr inbounds ([34 x i8]* @.str1541, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8]* @.str1642, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8]* @.str1743, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8]* @.str1844, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8]* @.str1945, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8]* @.str2046, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8]* @.str2147, i32 0, i32 0)), !llfi_index !538
  %453 = load i32* %timers_enabled, align 4, !llfi_index !539
  %454 = load i32* %timers_enabled, align 4, !llfi_index !539
  %455 = icmp ne i32 %453, 0, !llfi_index !540
  %456 = icmp ne i32 %454, 0, !llfi_index !540
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %455, i1 %456)
  br i1 %455, label %457, label %500, !llfi_index !541

; <label>:457                                     ; preds = %444
  %458 = load double* %tm, align 8, !llfi_index !542
  %459 = load double* %tm, align 8, !llfi_index !542
  %460 = fcmp ole double %458, 0.000000e+00, !llfi_index !543
  %461 = fcmp ole double %459, 0.000000e+00, !llfi_index !543
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %460, i1 %461)
  br i1 %460, label %462, label %463, !llfi_index !544

; <label>:462                                     ; preds = %457
  store double 1.000000e+00, double* %tm, align 8, !llfi_index !545
  br label %463, !llfi_index !546

; <label>:463                                     ; preds = %462, %457
  %464 = call double @timer_read(i32 0), !llfi_index !547
  store double %464, double* %tt, align 8, !llfi_index !548
  %465 = load double* %tt, align 8, !llfi_index !549
  %466 = load double* %tt, align 8, !llfi_index !549
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %465, double %466)
  %467 = load double* %tt, align 8, !llfi_index !550
  %468 = load double* %tt, align 8, !llfi_index !550
  %469 = fmul double %467, 1.000000e+02, !llfi_index !551
  %470 = fmul double %468, 1.000000e+02, !llfi_index !551
  %471 = load double* %tm, align 8, !llfi_index !552
  %472 = load double* %tm, align 8, !llfi_index !552
  %473 = fdiv double %469, %471, !llfi_index !553
  %474 = fdiv double %470, %472, !llfi_index !553
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %473, double %474)
  %475 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([34 x i8]* @.str2248, i32 0, i32 0), double %465, double %473), !llfi_index !554
  %476 = call double @timer_read(i32 1), !llfi_index !555
  store double %476, double* %tt, align 8, !llfi_index !556
  %477 = load double* %tt, align 8, !llfi_index !557
  %478 = load double* %tt, align 8, !llfi_index !557
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %477, double %478)
  %479 = load double* %tt, align 8, !llfi_index !558
  %480 = load double* %tt, align 8, !llfi_index !558
  %481 = fmul double %479, 1.000000e+02, !llfi_index !559
  %482 = fmul double %480, 1.000000e+02, !llfi_index !559
  %483 = load double* %tm, align 8, !llfi_index !560
  %484 = load double* %tm, align 8, !llfi_index !560
  %485 = fdiv double %481, %483, !llfi_index !561
  %486 = fdiv double %482, %484, !llfi_index !561
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %485, double %486)
  %487 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([33 x i8]* @.str2349, i32 0, i32 0), double %477, double %485), !llfi_index !562
  %488 = call double @timer_read(i32 2), !llfi_index !563
  store double %488, double* %tt, align 8, !llfi_index !564
  %489 = load double* %tt, align 8, !llfi_index !565
  %490 = load double* %tt, align 8, !llfi_index !565
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %489, double %490)
  %491 = load double* %tt, align 8, !llfi_index !566
  %492 = load double* %tt, align 8, !llfi_index !566
  %493 = fmul double %491, 1.000000e+02, !llfi_index !567
  %494 = fmul double %492, 1.000000e+02, !llfi_index !567
  %495 = load double* %tm, align 8, !llfi_index !568
  %496 = load double* %tm, align 8, !llfi_index !568
  %497 = fdiv double %493, %495, !llfi_index !569
  %498 = fdiv double %494, %496, !llfi_index !569
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %497, double %498)
  %499 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([33 x i8]* @.str2450, i32 0, i32 0), double %489, double %497), !llfi_index !570
  br label %500, !llfi_index !571

; <label>:500                                     ; preds = %463, %444
  call void @global_check()
  ret i32 0, !llfi_index !572
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #2

declare %struct._IO_FILE* @fopen(i8*, i8*) #1

declare i32 @fclose(%struct._IO_FILE*) #1

; Function Attrs: nounwind
declare i32 @sprintf(i8*, i8*, ...) #3

; Function Attrs: nounwind
declare double @pow(double, double) #3

; Function Attrs: nounwind
declare double @log(double) #3

; Function Attrs: nounwind
declare double @sqrt(double) #3

; Function Attrs: nounwind readnone
declare double @fabs(double) #4

; Function Attrs: nounwind uwtable
define void @print_results(i8* %name, i8 signext %class, i32 %n1, i32 %n2, i32 %n3, i32 %niter, double %t, double %mops, i8* %optype, i32 %verified, i8* %npbversion, i8* %compiletime, i8* %cs1, i8* %cs2, i8* %cs3, i8* %cs4, i8* %cs5, i8* %cs6, i8* %cs7) #0 {
  %1 = alloca i8*, align 8, !llfi_index !573
  %2 = alloca i8, align 1, !llfi_index !574
  %3 = alloca i32, align 4, !llfi_index !575
  %4 = alloca i32, align 4, !llfi_index !576
  %5 = alloca i32, align 4, !llfi_index !577
  %6 = alloca i32, align 4, !llfi_index !578
  %7 = alloca double, align 8, !llfi_index !579
  %8 = alloca double, align 8, !llfi_index !580
  %9 = alloca i8*, align 8, !llfi_index !581
  %10 = alloca i32, align 4, !llfi_index !582
  %11 = alloca i8*, align 8, !llfi_index !583
  %12 = alloca i8*, align 8, !llfi_index !584
  %13 = alloca i8*, align 8, !llfi_index !585
  %14 = alloca i8*, align 8, !llfi_index !586
  %15 = alloca i8*, align 8, !llfi_index !587
  %16 = alloca i8*, align 8, !llfi_index !588
  %17 = alloca i8*, align 8, !llfi_index !589
  %18 = alloca i8*, align 8, !llfi_index !590
  %19 = alloca i8*, align 8, !llfi_index !591
  %size = alloca [16 x i8], align 16, !llfi_index !592
  %j = alloca i32, align 4, !llfi_index !593
  store i8* %name, i8** %1, align 8, !llfi_index !594
  store i8 %class, i8* %2, align 1, !llfi_index !595
  store i32 %n1, i32* %3, align 4, !llfi_index !596
  store i32 %n2, i32* %4, align 4, !llfi_index !597
  store i32 %n3, i32* %5, align 4, !llfi_index !598
  store i32 %niter, i32* %6, align 4, !llfi_index !599
  store double %t, double* %7, align 8, !llfi_index !600
  store double %mops, double* %8, align 8, !llfi_index !601
  store i8* %optype, i8** %9, align 8, !llfi_index !602
  store i32 %verified, i32* %10, align 4, !llfi_index !603
  store i8* %npbversion, i8** %11, align 8, !llfi_index !604
  store i8* %compiletime, i8** %12, align 8, !llfi_index !605
  store i8* %cs1, i8** %13, align 8, !llfi_index !606
  store i8* %cs2, i8** %14, align 8, !llfi_index !607
  store i8* %cs3, i8** %15, align 8, !llfi_index !608
  store i8* %cs4, i8** %16, align 8, !llfi_index !609
  store i8* %cs5, i8** %17, align 8, !llfi_index !610
  store i8* %cs6, i8** %18, align 8, !llfi_index !611
  store i8* %cs7, i8** %19, align 8, !llfi_index !612
  %20 = load i8** %1, align 8, !llfi_index !613
  %21 = load i8** %1, align 8, !llfi_index !613
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %20, i8* %21)
  %22 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str51, i32 0, i32 0), i8* %20), !llfi_index !614
  %23 = load i8* %2, align 1, !llfi_index !615
  %24 = load i8* %2, align 1, !llfi_index !615
  %25 = sext i8 %23 to i32, !llfi_index !616
  %26 = sext i8 %24 to i32, !llfi_index !616
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %25, i32 %26)
  %27 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str152, i32 0, i32 0), i32 %25), !llfi_index !617
  %28 = load i32* %4, align 4, !llfi_index !618
  %29 = load i32* %4, align 4, !llfi_index !618
  %30 = icmp eq i32 %28, 0, !llfi_index !619
  %31 = icmp eq i32 %29, 0, !llfi_index !619
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %30, i1 %31)
  br i1 %30, label %32, label %108, !llfi_index !620

; <label>:32                                      ; preds = %0
  %33 = load i32* %5, align 4, !llfi_index !621
  %34 = load i32* %5, align 4, !llfi_index !621
  %35 = icmp eq i32 %33, 0, !llfi_index !622
  %36 = icmp eq i32 %34, 0, !llfi_index !622
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %35, i1 %36)
  br i1 %35, label %37, label %108, !llfi_index !623

; <label>:37                                      ; preds = %32
  %38 = load i8** %1, align 8, !llfi_index !624
  %39 = load i8** %1, align 8, !llfi_index !624
  %40 = getelementptr inbounds i8* %38, i64 0, !llfi_index !625
  %41 = getelementptr inbounds i8* %39, i64 0, !llfi_index !625
  %42 = load i8* %40, align 1, !llfi_index !626
  %43 = load i8* %41, align 1, !llfi_index !626
  %44 = sext i8 %42 to i32, !llfi_index !627
  %45 = sext i8 %43 to i32, !llfi_index !627
  %46 = icmp eq i32 %44, 69, !llfi_index !628
  %47 = icmp eq i32 %45, 69, !llfi_index !628
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %46, i1 %47)
  br i1 %46, label %48, label %103, !llfi_index !629

; <label>:48                                      ; preds = %37
  %49 = load i8** %1, align 8, !llfi_index !630
  %50 = load i8** %1, align 8, !llfi_index !630
  %51 = getelementptr inbounds i8* %49, i64 1, !llfi_index !631
  %52 = getelementptr inbounds i8* %50, i64 1, !llfi_index !631
  %53 = load i8* %51, align 1, !llfi_index !632
  %54 = load i8* %52, align 1, !llfi_index !632
  %55 = sext i8 %53 to i32, !llfi_index !633
  %56 = sext i8 %54 to i32, !llfi_index !633
  %57 = icmp eq i32 %55, 80, !llfi_index !634
  %58 = icmp eq i32 %56, 80, !llfi_index !634
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %57, i1 %58)
  br i1 %57, label %59, label %103, !llfi_index !635

; <label>:59                                      ; preds = %48
  %60 = getelementptr inbounds [16 x i8]* %size, i32 0, i32 0, !llfi_index !636
  %61 = getelementptr inbounds [16 x i8]* %size, i32 0, i32 0, !llfi_index !636
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %60, i8* %61)
  %62 = load i32* %3, align 4, !llfi_index !637
  %63 = load i32* %3, align 4, !llfi_index !637
  %64 = sitofp i32 %62 to double, !llfi_index !638
  %65 = sitofp i32 %63 to double, !llfi_index !638
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %64, double %65)
  %66 = call double @pow(double 2.000000e+00, double %64) #2, !llfi_index !639
  %67 = call i32 (i8*, i8*, ...)* @sprintf(i8* %60, i8* getelementptr inbounds ([8 x i8]* @.str253, i32 0, i32 0), double %66) #2, !llfi_index !640
  store i32 14, i32* %j, align 4, !llfi_index !641
  %68 = load i32* %j, align 4, !llfi_index !642
  %69 = load i32* %j, align 4, !llfi_index !642
  %70 = sext i32 %68 to i64, !llfi_index !643
  %71 = sext i32 %69 to i64, !llfi_index !643
  %72 = getelementptr inbounds [16 x i8]* %size, i32 0, i64 %70, !llfi_index !644
  %73 = getelementptr inbounds [16 x i8]* %size, i32 0, i64 %71, !llfi_index !644
  %74 = load i8* %72, align 1, !llfi_index !645
  %75 = load i8* %73, align 1, !llfi_index !645
  %76 = sext i8 %74 to i32, !llfi_index !646
  %77 = sext i8 %75 to i32, !llfi_index !646
  %78 = icmp eq i32 %76, 46, !llfi_index !647
  %79 = icmp eq i32 %77, 46, !llfi_index !647
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %78, i1 %79)
  br i1 %78, label %80, label %91, !llfi_index !648

; <label>:80                                      ; preds = %59
  %81 = load i32* %j, align 4, !llfi_index !649
  %82 = load i32* %j, align 4, !llfi_index !649
  %83 = sext i32 %81 to i64, !llfi_index !650
  %84 = sext i32 %82 to i64, !llfi_index !650
  %85 = getelementptr inbounds [16 x i8]* %size, i32 0, i64 %83, !llfi_index !651
  %86 = getelementptr inbounds [16 x i8]* %size, i32 0, i64 %84, !llfi_index !651
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %85, i8* %86)
  store i8 32, i8* %85, align 1, !llfi_index !652
  %87 = load i32* %j, align 4, !llfi_index !653
  %88 = load i32* %j, align 4, !llfi_index !653
  %89 = add nsw i32 %87, -1, !llfi_index !654
  %90 = add nsw i32 %88, -1, !llfi_index !654
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %89, i32 %90)
  store i32 %89, i32* %j, align 4, !llfi_index !655
  br label %91, !llfi_index !656

; <label>:91                                      ; preds = %80, %59
  %92 = load i32* %j, align 4, !llfi_index !657
  %93 = load i32* %j, align 4, !llfi_index !657
  %94 = add nsw i32 %92, 1, !llfi_index !658
  %95 = add nsw i32 %93, 1, !llfi_index !658
  %96 = sext i32 %94 to i64, !llfi_index !659
  %97 = sext i32 %95 to i64, !llfi_index !659
  %98 = getelementptr inbounds [16 x i8]* %size, i32 0, i64 %96, !llfi_index !660
  %99 = getelementptr inbounds [16 x i8]* %size, i32 0, i64 %97, !llfi_index !660
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %98, i8* %99)
  store i8 0, i8* %98, align 1, !llfi_index !661
  %100 = getelementptr inbounds [16 x i8]* %size, i32 0, i32 0, !llfi_index !662
  %101 = getelementptr inbounds [16 x i8]* %size, i32 0, i32 0, !llfi_index !662
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %100, i8* %101)
  %102 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([34 x i8]* @.str354, i32 0, i32 0), i8* %100), !llfi_index !663
  br label %107, !llfi_index !664

; <label>:103                                     ; preds = %48, %37
  %104 = load i32* %3, align 4, !llfi_index !665
  %105 = load i32* %3, align 4, !llfi_index !665
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %104, i32 %105)
  %106 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str455, i32 0, i32 0), i32 %104), !llfi_index !666
  br label %107, !llfi_index !667

; <label>:107                                     ; preds = %103, %91
  br label %116, !llfi_index !668

; <label>:108                                     ; preds = %32, %0
  %109 = load i32* %3, align 4, !llfi_index !669
  %110 = load i32* %3, align 4, !llfi_index !669
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %109, i32 %110)
  %111 = load i32* %4, align 4, !llfi_index !670
  %112 = load i32* %4, align 4, !llfi_index !670
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %111, i32 %112)
  %113 = load i32* %5, align 4, !llfi_index !671
  %114 = load i32* %5, align 4, !llfi_index !671
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %113, i32 %114)
  %115 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([42 x i8]* @.str556, i32 0, i32 0), i32 %109, i32 %111, i32 %113), !llfi_index !672
  br label %116, !llfi_index !673

; <label>:116                                     ; preds = %108, %107
  %117 = load i32* %6, align 4, !llfi_index !674
  %118 = load i32* %6, align 4, !llfi_index !674
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %117, i32 %118)
  %119 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str657, i32 0, i32 0), i32 %117), !llfi_index !675
  %120 = load i8** %9, align 8, !llfi_index !676
  %121 = load i8** %9, align 8, !llfi_index !676
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %120, i8* %121)
  %122 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str758, i32 0, i32 0), i8* %120), !llfi_index !677
  %123 = load i32* %10, align 4, !llfi_index !678
  %124 = load i32* %10, align 4, !llfi_index !678
  %125 = icmp ne i32 %123, 0, !llfi_index !679
  %126 = icmp ne i32 %124, 0, !llfi_index !679
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %125, i1 %126)
  br i1 %125, label %127, label %129, !llfi_index !680

; <label>:127                                     ; preds = %116
  %128 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str859, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8]* @.str960, i32 0, i32 0)), !llfi_index !681
  br label %131, !llfi_index !682

; <label>:129                                     ; preds = %116
  %130 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str859, i32 0, i32 0), i8* getelementptr inbounds ([13 x i8]* @.str1061, i32 0, i32 0)), !llfi_index !683
  br label %131, !llfi_index !684

; <label>:131                                     ; preds = %129, %127
  %132 = load i8** %11, align 8, !llfi_index !685
  %133 = load i8** %11, align 8, !llfi_index !685
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %132, i8* %133)
  %134 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str1162, i32 0, i32 0), i8* %132), !llfi_index !686
  %135 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([195 x i8]* @.str1263, i32 0, i32 0)), !llfi_index !687
  ret void, !llfi_index !688
}

; Function Attrs: nounwind uwtable
define double @randlc(double* %x, double %a) #0 {
  %1 = alloca double*, align 8, !llfi_index !689
  %2 = alloca double, align 8, !llfi_index !690
  %r23 = alloca double, align 8, !llfi_index !691
  %r46 = alloca double, align 8, !llfi_index !692
  %t23 = alloca double, align 8, !llfi_index !693
  %t46 = alloca double, align 8, !llfi_index !694
  %t1 = alloca double, align 8, !llfi_index !695
  %t2 = alloca double, align 8, !llfi_index !696
  %t3 = alloca double, align 8, !llfi_index !697
  %t4 = alloca double, align 8, !llfi_index !698
  %a1 = alloca double, align 8, !llfi_index !699
  %a2 = alloca double, align 8, !llfi_index !700
  %x1 = alloca double, align 8, !llfi_index !701
  %x2 = alloca double, align 8, !llfi_index !702
  %z = alloca double, align 8, !llfi_index !703
  %r = alloca double, align 8, !llfi_index !704
  store double* %x, double** %1, align 8, !llfi_index !705
  store double %a, double* %2, align 8, !llfi_index !706
  store double 0x3E80000000000000, double* %r23, align 8, !llfi_index !707
  store double 0x3D10000000000000, double* %r46, align 8, !llfi_index !708
  store double 8.388608e+06, double* %t23, align 8, !llfi_index !709
  store double 0x42D0000000000000, double* %t46, align 8, !llfi_index !710
  %3 = load double* %2, align 8, !llfi_index !711
  %4 = load double* %2, align 8, !llfi_index !711
  %5 = fmul double 0x3E80000000000000, %3, !llfi_index !712
  %6 = fmul double 0x3E80000000000000, %4, !llfi_index !712
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %5, double %6)
  store double %5, double* %t1, align 8, !llfi_index !713
  %7 = load double* %t1, align 8, !llfi_index !714
  %8 = load double* %t1, align 8, !llfi_index !714
  %9 = fptosi double %7 to i32, !llfi_index !715
  %10 = fptosi double %8 to i32, !llfi_index !715
  %11 = sitofp i32 %9 to double, !llfi_index !716
  %12 = sitofp i32 %10 to double, !llfi_index !716
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %11, double %12)
  store double %11, double* %a1, align 8, !llfi_index !717
  %13 = load double* %2, align 8, !llfi_index !718
  %14 = load double* %2, align 8, !llfi_index !718
  %15 = load double* %a1, align 8, !llfi_index !719
  %16 = load double* %a1, align 8, !llfi_index !719
  %17 = fmul double 8.388608e+06, %15, !llfi_index !720
  %18 = fmul double 8.388608e+06, %16, !llfi_index !720
  %19 = fsub double %13, %17, !llfi_index !721
  %20 = fsub double %14, %18, !llfi_index !721
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %19, double %20)
  store double %19, double* %a2, align 8, !llfi_index !722
  %21 = load double** %1, align 8, !llfi_index !723
  %22 = load double** %1, align 8, !llfi_index !723
  %23 = load double* %21, align 8, !llfi_index !724
  %24 = load double* %22, align 8, !llfi_index !724
  %25 = fmul double 0x3E80000000000000, %23, !llfi_index !725
  %26 = fmul double 0x3E80000000000000, %24, !llfi_index !725
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %25, double %26)
  store double %25, double* %t1, align 8, !llfi_index !726
  %27 = load double* %t1, align 8, !llfi_index !727
  %28 = load double* %t1, align 8, !llfi_index !727
  %29 = fptosi double %27 to i32, !llfi_index !728
  %30 = fptosi double %28 to i32, !llfi_index !728
  %31 = sitofp i32 %29 to double, !llfi_index !729
  %32 = sitofp i32 %30 to double, !llfi_index !729
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %31, double %32)
  store double %31, double* %x1, align 8, !llfi_index !730
  %33 = load double** %1, align 8, !llfi_index !731
  %34 = load double** %1, align 8, !llfi_index !731
  %35 = load double* %33, align 8, !llfi_index !732
  %36 = load double* %34, align 8, !llfi_index !732
  %37 = load double* %x1, align 8, !llfi_index !733
  %38 = load double* %x1, align 8, !llfi_index !733
  %39 = fmul double 8.388608e+06, %37, !llfi_index !734
  %40 = fmul double 8.388608e+06, %38, !llfi_index !734
  %41 = fsub double %35, %39, !llfi_index !735
  %42 = fsub double %36, %40, !llfi_index !735
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %41, double %42)
  store double %41, double* %x2, align 8, !llfi_index !736
  %43 = load double* %a1, align 8, !llfi_index !737
  %44 = load double* %a1, align 8, !llfi_index !737
  %45 = load double* %x2, align 8, !llfi_index !738
  %46 = load double* %x2, align 8, !llfi_index !738
  %47 = fmul double %43, %45, !llfi_index !739
  %48 = fmul double %44, %46, !llfi_index !739
  %49 = load double* %a2, align 8, !llfi_index !740
  %50 = load double* %a2, align 8, !llfi_index !740
  %51 = load double* %x1, align 8, !llfi_index !741
  %52 = load double* %x1, align 8, !llfi_index !741
  %53 = fmul double %49, %51, !llfi_index !742
  %54 = fmul double %50, %52, !llfi_index !742
  %55 = fadd double %47, %53, !llfi_index !743
  %56 = fadd double %48, %54, !llfi_index !743
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %55, double %56)
  store double %55, double* %t1, align 8, !llfi_index !744
  %57 = load double* %t1, align 8, !llfi_index !745
  %58 = load double* %t1, align 8, !llfi_index !745
  %59 = fmul double 0x3E80000000000000, %57, !llfi_index !746
  %60 = fmul double 0x3E80000000000000, %58, !llfi_index !746
  %61 = fptosi double %59 to i32, !llfi_index !747
  %62 = fptosi double %60 to i32, !llfi_index !747
  %63 = sitofp i32 %61 to double, !llfi_index !748
  %64 = sitofp i32 %62 to double, !llfi_index !748
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %63, double %64)
  store double %63, double* %t2, align 8, !llfi_index !749
  %65 = load double* %t1, align 8, !llfi_index !750
  %66 = load double* %t1, align 8, !llfi_index !750
  %67 = load double* %t2, align 8, !llfi_index !751
  %68 = load double* %t2, align 8, !llfi_index !751
  %69 = fmul double 8.388608e+06, %67, !llfi_index !752
  %70 = fmul double 8.388608e+06, %68, !llfi_index !752
  %71 = fsub double %65, %69, !llfi_index !753
  %72 = fsub double %66, %70, !llfi_index !753
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %71, double %72)
  store double %71, double* %z, align 8, !llfi_index !754
  %73 = load double* %z, align 8, !llfi_index !755
  %74 = load double* %z, align 8, !llfi_index !755
  %75 = fmul double 8.388608e+06, %73, !llfi_index !756
  %76 = fmul double 8.388608e+06, %74, !llfi_index !756
  %77 = load double* %a2, align 8, !llfi_index !757
  %78 = load double* %a2, align 8, !llfi_index !757
  %79 = load double* %x2, align 8, !llfi_index !758
  %80 = load double* %x2, align 8, !llfi_index !758
  %81 = fmul double %77, %79, !llfi_index !759
  %82 = fmul double %78, %80, !llfi_index !759
  %83 = fadd double %75, %81, !llfi_index !760
  %84 = fadd double %76, %82, !llfi_index !760
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %83, double %84)
  store double %83, double* %t3, align 8, !llfi_index !761
  %85 = load double* %t3, align 8, !llfi_index !762
  %86 = load double* %t3, align 8, !llfi_index !762
  %87 = fmul double 0x3D10000000000000, %85, !llfi_index !763
  %88 = fmul double 0x3D10000000000000, %86, !llfi_index !763
  %89 = fptosi double %87 to i32, !llfi_index !764
  %90 = fptosi double %88 to i32, !llfi_index !764
  %91 = sitofp i32 %89 to double, !llfi_index !765
  %92 = sitofp i32 %90 to double, !llfi_index !765
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %91, double %92)
  store double %91, double* %t4, align 8, !llfi_index !766
  %93 = load double* %t3, align 8, !llfi_index !767
  %94 = load double* %t3, align 8, !llfi_index !767
  %95 = load double* %t4, align 8, !llfi_index !768
  %96 = load double* %t4, align 8, !llfi_index !768
  %97 = fmul double 0x42D0000000000000, %95, !llfi_index !769
  %98 = fmul double 0x42D0000000000000, %96, !llfi_index !769
  %99 = fsub double %93, %97, !llfi_index !770
  %100 = fsub double %94, %98, !llfi_index !770
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %99, double %100)
  %101 = load double** %1, align 8, !llfi_index !771
  %102 = load double** %1, align 8, !llfi_index !771
  call void bitcast (void (i64, i64)* @global_add to void (double*, double*)*)(double* %101, double* %102)
  store double %99, double* %101, align 8, !llfi_index !772
  %103 = load double** %1, align 8, !llfi_index !773
  %104 = load double** %1, align 8, !llfi_index !773
  %105 = load double* %103, align 8, !llfi_index !774
  %106 = load double* %104, align 8, !llfi_index !774
  %107 = fmul double 0x3D10000000000000, %105, !llfi_index !775
  %108 = fmul double 0x3D10000000000000, %106, !llfi_index !775
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %107, double %108)
  store double %107, double* %r, align 8, !llfi_index !776
  %109 = load double* %r, align 8, !llfi_index !777
  %110 = load double* %r, align 8, !llfi_index !777
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %109, double %110)
  ret double %109, !llfi_index !778
}

; Function Attrs: nounwind uwtable
define void @vranlc(i32 %n, double* %x, double %a, double* %y) #0 {
  %1 = alloca i32, align 4, !llfi_index !779
  %2 = alloca double*, align 8, !llfi_index !780
  %3 = alloca double, align 8, !llfi_index !781
  %4 = alloca double*, align 8, !llfi_index !782
  %r23 = alloca double, align 8, !llfi_index !783
  %r46 = alloca double, align 8, !llfi_index !784
  %t23 = alloca double, align 8, !llfi_index !785
  %t46 = alloca double, align 8, !llfi_index !786
  %t1 = alloca double, align 8, !llfi_index !787
  %t2 = alloca double, align 8, !llfi_index !788
  %t3 = alloca double, align 8, !llfi_index !789
  %t4 = alloca double, align 8, !llfi_index !790
  %a1 = alloca double, align 8, !llfi_index !791
  %a2 = alloca double, align 8, !llfi_index !792
  %x1 = alloca double, align 8, !llfi_index !793
  %x2 = alloca double, align 8, !llfi_index !794
  %z = alloca double, align 8, !llfi_index !795
  %i = alloca i32, align 4, !llfi_index !796
  store i32 %n, i32* %1, align 4, !llfi_index !797
  store double* %x, double** %2, align 8, !llfi_index !798
  store double %a, double* %3, align 8, !llfi_index !799
  store double* %y, double** %4, align 8, !llfi_index !800
  store double 0x3E80000000000000, double* %r23, align 8, !llfi_index !801
  store double 0x3D10000000000000, double* %r46, align 8, !llfi_index !802
  store double 8.388608e+06, double* %t23, align 8, !llfi_index !803
  store double 0x42D0000000000000, double* %t46, align 8, !llfi_index !804
  %5 = load double* %3, align 8, !llfi_index !805
  %6 = load double* %3, align 8, !llfi_index !805
  %7 = fmul double 0x3E80000000000000, %5, !llfi_index !806
  %8 = fmul double 0x3E80000000000000, %6, !llfi_index !806
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %7, double %8)
  store double %7, double* %t1, align 8, !llfi_index !807
  %9 = load double* %t1, align 8, !llfi_index !808
  %10 = load double* %t1, align 8, !llfi_index !808
  %11 = fptosi double %9 to i32, !llfi_index !809
  %12 = fptosi double %10 to i32, !llfi_index !809
  %13 = sitofp i32 %11 to double, !llfi_index !810
  %14 = sitofp i32 %12 to double, !llfi_index !810
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %13, double %14)
  store double %13, double* %a1, align 8, !llfi_index !811
  %15 = load double* %3, align 8, !llfi_index !812
  %16 = load double* %3, align 8, !llfi_index !812
  %17 = load double* %a1, align 8, !llfi_index !813
  %18 = load double* %a1, align 8, !llfi_index !813
  %19 = fmul double 8.388608e+06, %17, !llfi_index !814
  %20 = fmul double 8.388608e+06, %18, !llfi_index !814
  %21 = fsub double %15, %19, !llfi_index !815
  %22 = fsub double %16, %20, !llfi_index !815
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %21, double %22)
  store double %21, double* %a2, align 8, !llfi_index !816
  store i32 0, i32* %i, align 4, !llfi_index !817
  br label %23, !llfi_index !818

; <label>:23                                      ; preds = %127, %0
  %24 = load i32* %i, align 4, !llfi_index !819
  %25 = load i32* %i, align 4, !llfi_index !819
  %26 = load i32* %1, align 4, !llfi_index !820
  %27 = load i32* %1, align 4, !llfi_index !820
  %28 = icmp slt i32 %24, %26, !llfi_index !821
  %29 = icmp slt i32 %25, %27, !llfi_index !821
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %28, i1 %29)
  br i1 %28, label %30, label %132, !llfi_index !822

; <label>:30                                      ; preds = %23
  %31 = load double** %2, align 8, !llfi_index !823
  %32 = load double** %2, align 8, !llfi_index !823
  %33 = load double* %31, align 8, !llfi_index !824
  %34 = load double* %32, align 8, !llfi_index !824
  %35 = fmul double 0x3E80000000000000, %33, !llfi_index !825
  %36 = fmul double 0x3E80000000000000, %34, !llfi_index !825
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %35, double %36)
  store double %35, double* %t1, align 8, !llfi_index !826
  %37 = load double* %t1, align 8, !llfi_index !827
  %38 = load double* %t1, align 8, !llfi_index !827
  %39 = fptosi double %37 to i32, !llfi_index !828
  %40 = fptosi double %38 to i32, !llfi_index !828
  %41 = sitofp i32 %39 to double, !llfi_index !829
  %42 = sitofp i32 %40 to double, !llfi_index !829
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %41, double %42)
  store double %41, double* %x1, align 8, !llfi_index !830
  %43 = load double** %2, align 8, !llfi_index !831
  %44 = load double** %2, align 8, !llfi_index !831
  %45 = load double* %43, align 8, !llfi_index !832
  %46 = load double* %44, align 8, !llfi_index !832
  %47 = load double* %x1, align 8, !llfi_index !833
  %48 = load double* %x1, align 8, !llfi_index !833
  %49 = fmul double 8.388608e+06, %47, !llfi_index !834
  %50 = fmul double 8.388608e+06, %48, !llfi_index !834
  %51 = fsub double %45, %49, !llfi_index !835
  %52 = fsub double %46, %50, !llfi_index !835
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %51, double %52)
  store double %51, double* %x2, align 8, !llfi_index !836
  %53 = load double* %a1, align 8, !llfi_index !837
  %54 = load double* %a1, align 8, !llfi_index !837
  %55 = load double* %x2, align 8, !llfi_index !838
  %56 = load double* %x2, align 8, !llfi_index !838
  %57 = fmul double %53, %55, !llfi_index !839
  %58 = fmul double %54, %56, !llfi_index !839
  %59 = load double* %a2, align 8, !llfi_index !840
  %60 = load double* %a2, align 8, !llfi_index !840
  %61 = load double* %x1, align 8, !llfi_index !841
  %62 = load double* %x1, align 8, !llfi_index !841
  %63 = fmul double %59, %61, !llfi_index !842
  %64 = fmul double %60, %62, !llfi_index !842
  %65 = fadd double %57, %63, !llfi_index !843
  %66 = fadd double %58, %64, !llfi_index !843
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %65, double %66)
  store double %65, double* %t1, align 8, !llfi_index !844
  %67 = load double* %t1, align 8, !llfi_index !845
  %68 = load double* %t1, align 8, !llfi_index !845
  %69 = fmul double 0x3E80000000000000, %67, !llfi_index !846
  %70 = fmul double 0x3E80000000000000, %68, !llfi_index !846
  %71 = fptosi double %69 to i32, !llfi_index !847
  %72 = fptosi double %70 to i32, !llfi_index !847
  %73 = sitofp i32 %71 to double, !llfi_index !848
  %74 = sitofp i32 %72 to double, !llfi_index !848
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %73, double %74)
  store double %73, double* %t2, align 8, !llfi_index !849
  %75 = load double* %t1, align 8, !llfi_index !850
  %76 = load double* %t1, align 8, !llfi_index !850
  %77 = load double* %t2, align 8, !llfi_index !851
  %78 = load double* %t2, align 8, !llfi_index !851
  %79 = fmul double 8.388608e+06, %77, !llfi_index !852
  %80 = fmul double 8.388608e+06, %78, !llfi_index !852
  %81 = fsub double %75, %79, !llfi_index !853
  %82 = fsub double %76, %80, !llfi_index !853
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %81, double %82)
  store double %81, double* %z, align 8, !llfi_index !854
  %83 = load double* %z, align 8, !llfi_index !855
  %84 = load double* %z, align 8, !llfi_index !855
  %85 = fmul double 8.388608e+06, %83, !llfi_index !856
  %86 = fmul double 8.388608e+06, %84, !llfi_index !856
  %87 = load double* %a2, align 8, !llfi_index !857
  %88 = load double* %a2, align 8, !llfi_index !857
  %89 = load double* %x2, align 8, !llfi_index !858
  %90 = load double* %x2, align 8, !llfi_index !858
  %91 = fmul double %87, %89, !llfi_index !859
  %92 = fmul double %88, %90, !llfi_index !859
  %93 = fadd double %85, %91, !llfi_index !860
  %94 = fadd double %86, %92, !llfi_index !860
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %93, double %94)
  store double %93, double* %t3, align 8, !llfi_index !861
  %95 = load double* %t3, align 8, !llfi_index !862
  %96 = load double* %t3, align 8, !llfi_index !862
  %97 = fmul double 0x3D10000000000000, %95, !llfi_index !863
  %98 = fmul double 0x3D10000000000000, %96, !llfi_index !863
  %99 = fptosi double %97 to i32, !llfi_index !864
  %100 = fptosi double %98 to i32, !llfi_index !864
  %101 = sitofp i32 %99 to double, !llfi_index !865
  %102 = sitofp i32 %100 to double, !llfi_index !865
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %101, double %102)
  store double %101, double* %t4, align 8, !llfi_index !866
  %103 = load double* %t3, align 8, !llfi_index !867
  %104 = load double* %t3, align 8, !llfi_index !867
  %105 = load double* %t4, align 8, !llfi_index !868
  %106 = load double* %t4, align 8, !llfi_index !868
  %107 = fmul double 0x42D0000000000000, %105, !llfi_index !869
  %108 = fmul double 0x42D0000000000000, %106, !llfi_index !869
  %109 = fsub double %103, %107, !llfi_index !870
  %110 = fsub double %104, %108, !llfi_index !870
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %109, double %110)
  %111 = load double** %2, align 8, !llfi_index !871
  %112 = load double** %2, align 8, !llfi_index !871
  call void bitcast (void (i64, i64)* @global_add to void (double*, double*)*)(double* %111, double* %112)
  store double %109, double* %111, align 8, !llfi_index !872
  %113 = load double** %2, align 8, !llfi_index !873
  %114 = load double** %2, align 8, !llfi_index !873
  %115 = load double* %113, align 8, !llfi_index !874
  %116 = load double* %114, align 8, !llfi_index !874
  %117 = fmul double 0x3D10000000000000, %115, !llfi_index !875
  %118 = fmul double 0x3D10000000000000, %116, !llfi_index !875
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %117, double %118)
  %119 = load i32* %i, align 4, !llfi_index !876
  %120 = load i32* %i, align 4, !llfi_index !876
  %121 = sext i32 %119 to i64, !llfi_index !877
  %122 = sext i32 %120 to i64, !llfi_index !877
  %123 = load double** %4, align 8, !llfi_index !878
  %124 = load double** %4, align 8, !llfi_index !878
  %125 = getelementptr inbounds double* %123, i64 %121, !llfi_index !879
  %126 = getelementptr inbounds double* %124, i64 %122, !llfi_index !879
  call void bitcast (void (i64, i64)* @global_add to void (double*, double*)*)(double* %125, double* %126)
  store double %117, double* %125, align 8, !llfi_index !880
  br label %127, !llfi_index !881

; <label>:127                                     ; preds = %30
  %128 = load i32* %i, align 4, !llfi_index !882
  %129 = load i32* %i, align 4, !llfi_index !882
  %130 = add nsw i32 %128, 1, !llfi_index !883
  %131 = add nsw i32 %129, 1, !llfi_index !883
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %130, i32 %131)
  store i32 %130, i32* %i, align 4, !llfi_index !884
  br label %23, !llfi_index !885

; <label>:132                                     ; preds = %23
  ret void, !llfi_index !886
}

; Function Attrs: nounwind uwtable
define void @wtime_(double* %t) #0 {
  %1 = alloca double*, align 8, !llfi_index !887
  %tv = alloca %struct.timeval, align 8, !llfi_index !888
  store double* %t, double** %1, align 8, !llfi_index !889
  %2 = call i32 @gettimeofday(%struct.timeval* %tv, %struct.timezone* null) #2, !llfi_index !890
  %3 = load i32* @wtime_.sec, align 4, !llfi_index !891
  %4 = load i32* @wtime_.sec, align 4, !llfi_index !891
  %5 = icmp slt i32 %3, 0, !llfi_index !892
  %6 = icmp slt i32 %4, 0, !llfi_index !892
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %5, i1 %6)
  br i1 %5, label %7, label %14, !llfi_index !893

; <label>:7                                       ; preds = %0
  %8 = getelementptr inbounds %struct.timeval* %tv, i32 0, i32 0, !llfi_index !894
  %9 = getelementptr inbounds %struct.timeval* %tv, i32 0, i32 0, !llfi_index !894
  %10 = load i64* %8, align 8, !llfi_index !895
  %11 = load i64* %9, align 8, !llfi_index !895
  %12 = trunc i64 %10 to i32, !llfi_index !896
  %13 = trunc i64 %11 to i32, !llfi_index !896
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %12, i32 %13)
  store i32 %12, i32* @wtime_.sec, align 4, !llfi_index !897
  br label %14, !llfi_index !898

; <label>:14                                      ; preds = %7, %0
  %15 = getelementptr inbounds %struct.timeval* %tv, i32 0, i32 0, !llfi_index !899
  %16 = getelementptr inbounds %struct.timeval* %tv, i32 0, i32 0, !llfi_index !899
  %17 = load i64* %15, align 8, !llfi_index !900
  %18 = load i64* %16, align 8, !llfi_index !900
  %19 = load i32* @wtime_.sec, align 4, !llfi_index !901
  %20 = load i32* @wtime_.sec, align 4, !llfi_index !901
  %21 = sext i32 %19 to i64, !llfi_index !902
  %22 = sext i32 %20 to i64, !llfi_index !902
  %23 = sub nsw i64 %17, %21, !llfi_index !903
  %24 = sub nsw i64 %18, %22, !llfi_index !903
  %25 = sitofp i64 %23 to double, !llfi_index !904
  %26 = sitofp i64 %24 to double, !llfi_index !904
  %27 = getelementptr inbounds %struct.timeval* %tv, i32 0, i32 1, !llfi_index !905
  %28 = getelementptr inbounds %struct.timeval* %tv, i32 0, i32 1, !llfi_index !905
  %29 = load i64* %27, align 8, !llfi_index !906
  %30 = load i64* %28, align 8, !llfi_index !906
  %31 = sitofp i64 %29 to double, !llfi_index !907
  %32 = sitofp i64 %30 to double, !llfi_index !907
  %33 = fmul double 1.000000e-06, %31, !llfi_index !908
  %34 = fmul double 1.000000e-06, %32, !llfi_index !908
  %35 = fadd double %25, %33, !llfi_index !909
  %36 = fadd double %26, %34, !llfi_index !909
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %35, double %36)
  %37 = load double** %1, align 8, !llfi_index !910
  %38 = load double** %1, align 8, !llfi_index !910
  call void bitcast (void (i64, i64)* @global_add to void (double*, double*)*)(double* %37, double* %38)
  store double %35, double* %37, align 8, !llfi_index !911
  ret void, !llfi_index !912
}

; Function Attrs: nounwind
declare i32 @gettimeofday(%struct.timeval*, %struct.timezone*) #3

; Function Attrs: nounwind uwtable
define void @global_add(i64 %instruction1, i64 %instruction2) #0 {
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  store i64 %instruction1, i64* %1, align 8
  store i64 %instruction2, i64* %2, align 8
  %3 = load i64* @global_var1, align 8
  %4 = load i64* %1, align 8
  %5 = add nsw i64 %3, %4
  store i64 %5, i64* @global_var1, align 8
  %6 = load i64* @global_var2, align 8
  %7 = load i64* %2, align 8
  %8 = add nsw i64 %6, %7
  store i64 %8, i64* @global_var2, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define void @global_check() #0 {
  %1 = load i64* @global_var1, align 8
  %2 = load i64* @global_var2, align 8
  %3 = icmp ne i64 %1, %2
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @exit(i32 99) #7
  unreachable

; <label>:5                                       ; preds = %0
  ret void
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #5

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }
attributes #3 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind readnone }
attributes #7 = { noreturn nounwind }

!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0}

!0 = metadata !{metadata !"clang version 3.4 (tags/RELEASE_34/final)"}
!1 = metadata !{i64 1}
!2 = metadata !{i64 2}
!3 = metadata !{i64 3}
!4 = metadata !{i64 4}
!5 = metadata !{i64 5}
!6 = metadata !{i64 6}
!7 = metadata !{i64 7}
!8 = metadata !{i64 8}
!9 = metadata !{i64 9}
!10 = metadata !{i64 10}
!11 = metadata !{i64 11}
!12 = metadata !{i64 12}
!13 = metadata !{i64 13}
!14 = metadata !{i64 14}
!15 = metadata !{i64 15}
!16 = metadata !{i64 16}
!17 = metadata !{i64 17}
!18 = metadata !{i64 18}
!19 = metadata !{i64 19}
!20 = metadata !{i64 20}
!21 = metadata !{i64 21}
!22 = metadata !{i64 22}
!23 = metadata !{i64 23}
!24 = metadata !{i64 24}
!25 = metadata !{i64 25}
!26 = metadata !{i64 26}
!27 = metadata !{i64 27}
!28 = metadata !{i64 28}
!29 = metadata !{i64 29}
!30 = metadata !{i64 30}
!31 = metadata !{i64 31}
!32 = metadata !{i64 32}
!33 = metadata !{i64 33}
!34 = metadata !{i64 34}
!35 = metadata !{i64 35}
!36 = metadata !{i64 36}
!37 = metadata !{i64 37}
!38 = metadata !{i64 38}
!39 = metadata !{i64 39}
!40 = metadata !{i64 40}
!41 = metadata !{i64 41}
!42 = metadata !{i64 42}
!43 = metadata !{i64 43}
!44 = metadata !{i64 44}
!45 = metadata !{i64 45}
!46 = metadata !{i64 46}
!47 = metadata !{i64 47}
!48 = metadata !{i64 48}
!49 = metadata !{i64 49}
!50 = metadata !{i64 50}
!51 = metadata !{i64 51}
!52 = metadata !{i64 52}
!53 = metadata !{i64 53}
!54 = metadata !{i64 54}
!55 = metadata !{i64 55}
!56 = metadata !{i64 56}
!57 = metadata !{i64 57}
!58 = metadata !{i64 58}
!59 = metadata !{i64 59}
!60 = metadata !{i64 60}
!61 = metadata !{i64 61}
!62 = metadata !{i64 62}
!63 = metadata !{i64 63}
!64 = metadata !{i64 64}
!65 = metadata !{i64 65}
!66 = metadata !{i64 66}
!67 = metadata !{i64 67}
!68 = metadata !{i64 68}
!69 = metadata !{i64 69}
!70 = metadata !{i64 70}
!71 = metadata !{i64 71}
!72 = metadata !{i64 72}
!73 = metadata !{i64 73}
!74 = metadata !{i64 74}
!75 = metadata !{i64 75}
!76 = metadata !{i64 76}
!77 = metadata !{i64 77}
!78 = metadata !{i64 78}
!79 = metadata !{i64 79}
!80 = metadata !{i64 80}
!81 = metadata !{i64 81}
!82 = metadata !{i64 82}
!83 = metadata !{i64 83}
!84 = metadata !{i64 84}
!85 = metadata !{i64 85}
!86 = metadata !{i64 86}
!87 = metadata !{i64 87}
!88 = metadata !{i64 88}
!89 = metadata !{i64 89}
!90 = metadata !{i64 90}
!91 = metadata !{i64 91}
!92 = metadata !{i64 92}
!93 = metadata !{i64 93}
!94 = metadata !{i64 94}
!95 = metadata !{i64 95}
!96 = metadata !{i64 96}
!97 = metadata !{i64 97}
!98 = metadata !{i64 98}
!99 = metadata !{i64 99}
!100 = metadata !{i64 100}
!101 = metadata !{i64 101}
!102 = metadata !{i64 102}
!103 = metadata !{i64 103}
!104 = metadata !{i64 104}
!105 = metadata !{i64 105}
!106 = metadata !{i64 106}
!107 = metadata !{i64 107}
!108 = metadata !{i64 108}
!109 = metadata !{i64 109}
!110 = metadata !{i64 110}
!111 = metadata !{i64 111}
!112 = metadata !{i64 112}
!113 = metadata !{i64 113}
!114 = metadata !{i64 114}
!115 = metadata !{i64 115}
!116 = metadata !{i64 116}
!117 = metadata !{i64 117}
!118 = metadata !{i64 118}
!119 = metadata !{i64 119}
!120 = metadata !{i64 120}
!121 = metadata !{i64 121}
!122 = metadata !{i64 122}
!123 = metadata !{i64 123}
!124 = metadata !{i64 124}
!125 = metadata !{i64 125}
!126 = metadata !{i64 126}
!127 = metadata !{i64 127}
!128 = metadata !{i64 128}
!129 = metadata !{i64 129}
!130 = metadata !{i64 130}
!131 = metadata !{i64 131}
!132 = metadata !{i64 132}
!133 = metadata !{i64 133}
!134 = metadata !{i64 134}
!135 = metadata !{i64 135}
!136 = metadata !{i64 136}
!137 = metadata !{i64 137}
!138 = metadata !{i64 138}
!139 = metadata !{i64 139}
!140 = metadata !{i64 140}
!141 = metadata !{i64 141}
!142 = metadata !{i64 142}
!143 = metadata !{i64 143}
!144 = metadata !{i64 144}
!145 = metadata !{i64 145}
!146 = metadata !{i64 146}
!147 = metadata !{i64 147}
!148 = metadata !{i64 148}
!149 = metadata !{i64 149}
!150 = metadata !{i64 150}
!151 = metadata !{i64 151}
!152 = metadata !{i64 152}
!153 = metadata !{i64 153}
!154 = metadata !{i64 154}
!155 = metadata !{i64 155}
!156 = metadata !{i64 156}
!157 = metadata !{i64 157}
!158 = metadata !{i64 158}
!159 = metadata !{i64 159}
!160 = metadata !{i64 160}
!161 = metadata !{i64 161}
!162 = metadata !{i64 162}
!163 = metadata !{i64 163}
!164 = metadata !{i64 164}
!165 = metadata !{i64 165}
!166 = metadata !{i64 166}
!167 = metadata !{i64 167}
!168 = metadata !{i64 168}
!169 = metadata !{i64 169}
!170 = metadata !{i64 170}
!171 = metadata !{i64 171}
!172 = metadata !{i64 172}
!173 = metadata !{i64 173}
!174 = metadata !{i64 174}
!175 = metadata !{i64 175}
!176 = metadata !{i64 176}
!177 = metadata !{i64 177}
!178 = metadata !{i64 178}
!179 = metadata !{i64 179}
!180 = metadata !{i64 180}
!181 = metadata !{i64 181}
!182 = metadata !{i64 182}
!183 = metadata !{i64 183}
!184 = metadata !{i64 184}
!185 = metadata !{i64 185}
!186 = metadata !{i64 186}
!187 = metadata !{i64 187}
!188 = metadata !{i64 188}
!189 = metadata !{i64 189}
!190 = metadata !{i64 190}
!191 = metadata !{i64 191}
!192 = metadata !{i64 192}
!193 = metadata !{i64 193}
!194 = metadata !{i64 194}
!195 = metadata !{i64 195}
!196 = metadata !{i64 196}
!197 = metadata !{i64 197}
!198 = metadata !{i64 198}
!199 = metadata !{i64 199}
!200 = metadata !{i64 200}
!201 = metadata !{i64 201}
!202 = metadata !{i64 202}
!203 = metadata !{i64 203}
!204 = metadata !{i64 204}
!205 = metadata !{i64 205}
!206 = metadata !{i64 206}
!207 = metadata !{i64 207}
!208 = metadata !{i64 208}
!209 = metadata !{i64 209}
!210 = metadata !{i64 210}
!211 = metadata !{i64 211}
!212 = metadata !{i64 212}
!213 = metadata !{i64 213}
!214 = metadata !{i64 214}
!215 = metadata !{i64 215}
!216 = metadata !{i64 216}
!217 = metadata !{i64 217}
!218 = metadata !{i64 218}
!219 = metadata !{i64 219}
!220 = metadata !{i64 220}
!221 = metadata !{i64 221}
!222 = metadata !{i64 222}
!223 = metadata !{i64 223}
!224 = metadata !{i64 224}
!225 = metadata !{i64 225}
!226 = metadata !{i64 226}
!227 = metadata !{i64 227}
!228 = metadata !{i64 228}
!229 = metadata !{i64 229}
!230 = metadata !{i64 230}
!231 = metadata !{i64 231}
!232 = metadata !{i64 232}
!233 = metadata !{i64 233}
!234 = metadata !{i64 234}
!235 = metadata !{i64 235}
!236 = metadata !{i64 236}
!237 = metadata !{i64 237}
!238 = metadata !{i64 238}
!239 = metadata !{i64 239}
!240 = metadata !{i64 240}
!241 = metadata !{i64 241}
!242 = metadata !{i64 242}
!243 = metadata !{i64 243}
!244 = metadata !{i64 244}
!245 = metadata !{i64 245}
!246 = metadata !{i64 246}
!247 = metadata !{i64 247}
!248 = metadata !{i64 248}
!249 = metadata !{i64 249}
!250 = metadata !{i64 250}
!251 = metadata !{i64 251}
!252 = metadata !{i64 252}
!253 = metadata !{i64 253}
!254 = metadata !{i64 254}
!255 = metadata !{i64 255}
!256 = metadata !{i64 256}
!257 = metadata !{i64 257}
!258 = metadata !{i64 258}
!259 = metadata !{i64 259}
!260 = metadata !{i64 260}
!261 = metadata !{i64 261}
!262 = metadata !{i64 262}
!263 = metadata !{i64 263}
!264 = metadata !{i64 264}
!265 = metadata !{i64 265}
!266 = metadata !{i64 266}
!267 = metadata !{i64 267}
!268 = metadata !{i64 268}
!269 = metadata !{i64 269}
!270 = metadata !{i64 270}
!271 = metadata !{i64 271}
!272 = metadata !{i64 272}
!273 = metadata !{i64 273}
!274 = metadata !{i64 274}
!275 = metadata !{i64 275}
!276 = metadata !{i64 276}
!277 = metadata !{i64 277}
!278 = metadata !{i64 278}
!279 = metadata !{i64 279}
!280 = metadata !{i64 280}
!281 = metadata !{i64 281}
!282 = metadata !{i64 282}
!283 = metadata !{i64 283}
!284 = metadata !{i64 284}
!285 = metadata !{i64 285}
!286 = metadata !{i64 286}
!287 = metadata !{i64 287}
!288 = metadata !{i64 288}
!289 = metadata !{i64 289}
!290 = metadata !{i64 290}
!291 = metadata !{i64 291}
!292 = metadata !{i64 292}
!293 = metadata !{i64 293}
!294 = metadata !{i64 294}
!295 = metadata !{i64 295}
!296 = metadata !{i64 296}
!297 = metadata !{i64 297}
!298 = metadata !{i64 298}
!299 = metadata !{i64 299}
!300 = metadata !{i64 300}
!301 = metadata !{i64 301}
!302 = metadata !{i64 302}
!303 = metadata !{i64 303}
!304 = metadata !{i64 304}
!305 = metadata !{i64 305}
!306 = metadata !{i64 306}
!307 = metadata !{i64 307}
!308 = metadata !{i64 308}
!309 = metadata !{i64 309}
!310 = metadata !{i64 310}
!311 = metadata !{i64 311}
!312 = metadata !{i64 312}
!313 = metadata !{i64 313}
!314 = metadata !{i64 314}
!315 = metadata !{i64 315}
!316 = metadata !{i64 316}
!317 = metadata !{i64 317}
!318 = metadata !{i64 318}
!319 = metadata !{i64 319}
!320 = metadata !{i64 320}
!321 = metadata !{i64 321}
!322 = metadata !{i64 322}
!323 = metadata !{i64 323}
!324 = metadata !{i64 324}
!325 = metadata !{i64 325}
!326 = metadata !{i64 326}
!327 = metadata !{i64 327}
!328 = metadata !{i64 328}
!329 = metadata !{i64 329}
!330 = metadata !{i64 330}
!331 = metadata !{i64 331}
!332 = metadata !{i64 332}
!333 = metadata !{i64 333}
!334 = metadata !{i64 334}
!335 = metadata !{i64 335}
!336 = metadata !{i64 336}
!337 = metadata !{i64 337}
!338 = metadata !{i64 338}
!339 = metadata !{i64 339}
!340 = metadata !{i64 340}
!341 = metadata !{i64 341}
!342 = metadata !{i64 342}
!343 = metadata !{i64 343}
!344 = metadata !{i64 344}
!345 = metadata !{i64 345}
!346 = metadata !{i64 346}
!347 = metadata !{i64 347}
!348 = metadata !{i64 348}
!349 = metadata !{i64 349}
!350 = metadata !{i64 350}
!351 = metadata !{i64 351}
!352 = metadata !{i64 352}
!353 = metadata !{i64 353}
!354 = metadata !{i64 354}
!355 = metadata !{i64 355}
!356 = metadata !{i64 356}
!357 = metadata !{i64 357}
!358 = metadata !{i64 358}
!359 = metadata !{i64 359}
!360 = metadata !{i64 360}
!361 = metadata !{i64 361}
!362 = metadata !{i64 362}
!363 = metadata !{i64 363}
!364 = metadata !{i64 364}
!365 = metadata !{i64 365}
!366 = metadata !{i64 366}
!367 = metadata !{i64 367}
!368 = metadata !{i64 368}
!369 = metadata !{i64 369}
!370 = metadata !{i64 370}
!371 = metadata !{i64 371}
!372 = metadata !{i64 372}
!373 = metadata !{i64 373}
!374 = metadata !{i64 374}
!375 = metadata !{i64 375}
!376 = metadata !{i64 376}
!377 = metadata !{i64 377}
!378 = metadata !{i64 378}
!379 = metadata !{i64 379}
!380 = metadata !{i64 380}
!381 = metadata !{i64 381}
!382 = metadata !{i64 382}
!383 = metadata !{i64 383}
!384 = metadata !{i64 384}
!385 = metadata !{i64 385}
!386 = metadata !{i64 386}
!387 = metadata !{i64 387}
!388 = metadata !{i64 388}
!389 = metadata !{i64 389}
!390 = metadata !{i64 390}
!391 = metadata !{i64 391}
!392 = metadata !{i64 392}
!393 = metadata !{i64 393}
!394 = metadata !{i64 394}
!395 = metadata !{i64 395}
!396 = metadata !{i64 396}
!397 = metadata !{i64 397}
!398 = metadata !{i64 398}
!399 = metadata !{i64 399}
!400 = metadata !{i64 400}
!401 = metadata !{i64 401}
!402 = metadata !{i64 402}
!403 = metadata !{i64 403}
!404 = metadata !{i64 404}
!405 = metadata !{i64 405}
!406 = metadata !{i64 406}
!407 = metadata !{i64 407}
!408 = metadata !{i64 408}
!409 = metadata !{i64 409}
!410 = metadata !{i64 410}
!411 = metadata !{i64 411}
!412 = metadata !{i64 412}
!413 = metadata !{i64 413}
!414 = metadata !{i64 414}
!415 = metadata !{i64 415}
!416 = metadata !{i64 416}
!417 = metadata !{i64 417}
!418 = metadata !{i64 418}
!419 = metadata !{i64 419}
!420 = metadata !{i64 420}
!421 = metadata !{i64 421}
!422 = metadata !{i64 422}
!423 = metadata !{i64 423}
!424 = metadata !{i64 424}
!425 = metadata !{i64 425}
!426 = metadata !{i64 426}
!427 = metadata !{i64 427}
!428 = metadata !{i64 428}
!429 = metadata !{i64 429}
!430 = metadata !{i64 430}
!431 = metadata !{i64 431}
!432 = metadata !{i64 432}
!433 = metadata !{i64 433}
!434 = metadata !{i64 434}
!435 = metadata !{i64 435}
!436 = metadata !{i64 436}
!437 = metadata !{i64 437}
!438 = metadata !{i64 438}
!439 = metadata !{i64 439}
!440 = metadata !{i64 440}
!441 = metadata !{i64 441}
!442 = metadata !{i64 442}
!443 = metadata !{i64 443}
!444 = metadata !{i64 444}
!445 = metadata !{i64 445}
!446 = metadata !{i64 446}
!447 = metadata !{i64 447}
!448 = metadata !{i64 448}
!449 = metadata !{i64 449}
!450 = metadata !{i64 450}
!451 = metadata !{i64 451}
!452 = metadata !{i64 452}
!453 = metadata !{i64 453}
!454 = metadata !{i64 454}
!455 = metadata !{i64 455}
!456 = metadata !{i64 456}
!457 = metadata !{i64 457}
!458 = metadata !{i64 458}
!459 = metadata !{i64 459}
!460 = metadata !{i64 460}
!461 = metadata !{i64 461}
!462 = metadata !{i64 462}
!463 = metadata !{i64 463}
!464 = metadata !{i64 464}
!465 = metadata !{i64 465}
!466 = metadata !{i64 466}
!467 = metadata !{i64 467}
!468 = metadata !{i64 468}
!469 = metadata !{i64 469}
!470 = metadata !{i64 470}
!471 = metadata !{i64 471}
!472 = metadata !{i64 472}
!473 = metadata !{i64 473}
!474 = metadata !{i64 474}
!475 = metadata !{i64 475}
!476 = metadata !{i64 476}
!477 = metadata !{i64 477}
!478 = metadata !{i64 478}
!479 = metadata !{i64 479}
!480 = metadata !{i64 480}
!481 = metadata !{i64 481}
!482 = metadata !{i64 482}
!483 = metadata !{i64 483}
!484 = metadata !{i64 484}
!485 = metadata !{i64 485}
!486 = metadata !{i64 486}
!487 = metadata !{i64 487}
!488 = metadata !{i64 488}
!489 = metadata !{i64 489}
!490 = metadata !{i64 490}
!491 = metadata !{i64 491}
!492 = metadata !{i64 492}
!493 = metadata !{i64 493}
!494 = metadata !{i64 494}
!495 = metadata !{i64 495}
!496 = metadata !{i64 496}
!497 = metadata !{i64 497}
!498 = metadata !{i64 498}
!499 = metadata !{i64 499}
!500 = metadata !{i64 500}
!501 = metadata !{i64 501}
!502 = metadata !{i64 502}
!503 = metadata !{i64 503}
!504 = metadata !{i64 504}
!505 = metadata !{i64 505}
!506 = metadata !{i64 506}
!507 = metadata !{i64 507}
!508 = metadata !{i64 508}
!509 = metadata !{i64 509}
!510 = metadata !{i64 510}
!511 = metadata !{i64 511}
!512 = metadata !{i64 512}
!513 = metadata !{i64 513}
!514 = metadata !{i64 514}
!515 = metadata !{i64 515}
!516 = metadata !{i64 516}
!517 = metadata !{i64 517}
!518 = metadata !{i64 518}
!519 = metadata !{i64 519}
!520 = metadata !{i64 520}
!521 = metadata !{i64 521}
!522 = metadata !{i64 522}
!523 = metadata !{i64 523}
!524 = metadata !{i64 524}
!525 = metadata !{i64 525}
!526 = metadata !{i64 526}
!527 = metadata !{i64 527}
!528 = metadata !{i64 528}
!529 = metadata !{i64 529}
!530 = metadata !{i64 530}
!531 = metadata !{i64 531}
!532 = metadata !{i64 532}
!533 = metadata !{i64 533}
!534 = metadata !{i64 534}
!535 = metadata !{i64 535}
!536 = metadata !{i64 536}
!537 = metadata !{i64 537}
!538 = metadata !{i64 538}
!539 = metadata !{i64 539}
!540 = metadata !{i64 540}
!541 = metadata !{i64 541}
!542 = metadata !{i64 542}
!543 = metadata !{i64 543}
!544 = metadata !{i64 544}
!545 = metadata !{i64 545}
!546 = metadata !{i64 546}
!547 = metadata !{i64 547}
!548 = metadata !{i64 548}
!549 = metadata !{i64 549}
!550 = metadata !{i64 550}
!551 = metadata !{i64 551}
!552 = metadata !{i64 552}
!553 = metadata !{i64 553}
!554 = metadata !{i64 554}
!555 = metadata !{i64 555}
!556 = metadata !{i64 556}
!557 = metadata !{i64 557}
!558 = metadata !{i64 558}
!559 = metadata !{i64 559}
!560 = metadata !{i64 560}
!561 = metadata !{i64 561}
!562 = metadata !{i64 562}
!563 = metadata !{i64 563}
!564 = metadata !{i64 564}
!565 = metadata !{i64 565}
!566 = metadata !{i64 566}
!567 = metadata !{i64 567}
!568 = metadata !{i64 568}
!569 = metadata !{i64 569}
!570 = metadata !{i64 570}
!571 = metadata !{i64 571}
!572 = metadata !{i64 572}
!573 = metadata !{i64 573}
!574 = metadata !{i64 574}
!575 = metadata !{i64 575}
!576 = metadata !{i64 576}
!577 = metadata !{i64 577}
!578 = metadata !{i64 578}
!579 = metadata !{i64 579}
!580 = metadata !{i64 580}
!581 = metadata !{i64 581}
!582 = metadata !{i64 582}
!583 = metadata !{i64 583}
!584 = metadata !{i64 584}
!585 = metadata !{i64 585}
!586 = metadata !{i64 586}
!587 = metadata !{i64 587}
!588 = metadata !{i64 588}
!589 = metadata !{i64 589}
!590 = metadata !{i64 590}
!591 = metadata !{i64 591}
!592 = metadata !{i64 592}
!593 = metadata !{i64 593}
!594 = metadata !{i64 594}
!595 = metadata !{i64 595}
!596 = metadata !{i64 596}
!597 = metadata !{i64 597}
!598 = metadata !{i64 598}
!599 = metadata !{i64 599}
!600 = metadata !{i64 600}
!601 = metadata !{i64 601}
!602 = metadata !{i64 602}
!603 = metadata !{i64 603}
!604 = metadata !{i64 604}
!605 = metadata !{i64 605}
!606 = metadata !{i64 606}
!607 = metadata !{i64 607}
!608 = metadata !{i64 608}
!609 = metadata !{i64 609}
!610 = metadata !{i64 610}
!611 = metadata !{i64 611}
!612 = metadata !{i64 612}
!613 = metadata !{i64 613}
!614 = metadata !{i64 614}
!615 = metadata !{i64 615}
!616 = metadata !{i64 616}
!617 = metadata !{i64 617}
!618 = metadata !{i64 618}
!619 = metadata !{i64 619}
!620 = metadata !{i64 620}
!621 = metadata !{i64 621}
!622 = metadata !{i64 622}
!623 = metadata !{i64 623}
!624 = metadata !{i64 624}
!625 = metadata !{i64 625}
!626 = metadata !{i64 626}
!627 = metadata !{i64 627}
!628 = metadata !{i64 628}
!629 = metadata !{i64 629}
!630 = metadata !{i64 630}
!631 = metadata !{i64 631}
!632 = metadata !{i64 632}
!633 = metadata !{i64 633}
!634 = metadata !{i64 634}
!635 = metadata !{i64 635}
!636 = metadata !{i64 636}
!637 = metadata !{i64 637}
!638 = metadata !{i64 638}
!639 = metadata !{i64 639}
!640 = metadata !{i64 640}
!641 = metadata !{i64 641}
!642 = metadata !{i64 642}
!643 = metadata !{i64 643}
!644 = metadata !{i64 644}
!645 = metadata !{i64 645}
!646 = metadata !{i64 646}
!647 = metadata !{i64 647}
!648 = metadata !{i64 648}
!649 = metadata !{i64 649}
!650 = metadata !{i64 650}
!651 = metadata !{i64 651}
!652 = metadata !{i64 652}
!653 = metadata !{i64 653}
!654 = metadata !{i64 654}
!655 = metadata !{i64 655}
!656 = metadata !{i64 656}
!657 = metadata !{i64 657}
!658 = metadata !{i64 658}
!659 = metadata !{i64 659}
!660 = metadata !{i64 660}
!661 = metadata !{i64 661}
!662 = metadata !{i64 662}
!663 = metadata !{i64 663}
!664 = metadata !{i64 664}
!665 = metadata !{i64 665}
!666 = metadata !{i64 666}
!667 = metadata !{i64 667}
!668 = metadata !{i64 668}
!669 = metadata !{i64 669}
!670 = metadata !{i64 670}
!671 = metadata !{i64 671}
!672 = metadata !{i64 672}
!673 = metadata !{i64 673}
!674 = metadata !{i64 674}
!675 = metadata !{i64 675}
!676 = metadata !{i64 676}
!677 = metadata !{i64 677}
!678 = metadata !{i64 678}
!679 = metadata !{i64 679}
!680 = metadata !{i64 680}
!681 = metadata !{i64 681}
!682 = metadata !{i64 682}
!683 = metadata !{i64 683}
!684 = metadata !{i64 684}
!685 = metadata !{i64 685}
!686 = metadata !{i64 686}
!687 = metadata !{i64 687}
!688 = metadata !{i64 688}
!689 = metadata !{i64 689}
!690 = metadata !{i64 690}
!691 = metadata !{i64 691}
!692 = metadata !{i64 692}
!693 = metadata !{i64 693}
!694 = metadata !{i64 694}
!695 = metadata !{i64 695}
!696 = metadata !{i64 696}
!697 = metadata !{i64 697}
!698 = metadata !{i64 698}
!699 = metadata !{i64 699}
!700 = metadata !{i64 700}
!701 = metadata !{i64 701}
!702 = metadata !{i64 702}
!703 = metadata !{i64 703}
!704 = metadata !{i64 704}
!705 = metadata !{i64 705}
!706 = metadata !{i64 706}
!707 = metadata !{i64 707}
!708 = metadata !{i64 708}
!709 = metadata !{i64 709}
!710 = metadata !{i64 710}
!711 = metadata !{i64 711}
!712 = metadata !{i64 712}
!713 = metadata !{i64 713}
!714 = metadata !{i64 714}
!715 = metadata !{i64 715}
!716 = metadata !{i64 716}
!717 = metadata !{i64 717}
!718 = metadata !{i64 718}
!719 = metadata !{i64 719}
!720 = metadata !{i64 720}
!721 = metadata !{i64 721}
!722 = metadata !{i64 722}
!723 = metadata !{i64 723}
!724 = metadata !{i64 724}
!725 = metadata !{i64 725}
!726 = metadata !{i64 726}
!727 = metadata !{i64 727}
!728 = metadata !{i64 728}
!729 = metadata !{i64 729}
!730 = metadata !{i64 730}
!731 = metadata !{i64 731}
!732 = metadata !{i64 732}
!733 = metadata !{i64 733}
!734 = metadata !{i64 734}
!735 = metadata !{i64 735}
!736 = metadata !{i64 736}
!737 = metadata !{i64 737}
!738 = metadata !{i64 738}
!739 = metadata !{i64 739}
!740 = metadata !{i64 740}
!741 = metadata !{i64 741}
!742 = metadata !{i64 742}
!743 = metadata !{i64 743}
!744 = metadata !{i64 744}
!745 = metadata !{i64 745}
!746 = metadata !{i64 746}
!747 = metadata !{i64 747}
!748 = metadata !{i64 748}
!749 = metadata !{i64 749}
!750 = metadata !{i64 750}
!751 = metadata !{i64 751}
!752 = metadata !{i64 752}
!753 = metadata !{i64 753}
!754 = metadata !{i64 754}
!755 = metadata !{i64 755}
!756 = metadata !{i64 756}
!757 = metadata !{i64 757}
!758 = metadata !{i64 758}
!759 = metadata !{i64 759}
!760 = metadata !{i64 760}
!761 = metadata !{i64 761}
!762 = metadata !{i64 762}
!763 = metadata !{i64 763}
!764 = metadata !{i64 764}
!765 = metadata !{i64 765}
!766 = metadata !{i64 766}
!767 = metadata !{i64 767}
!768 = metadata !{i64 768}
!769 = metadata !{i64 769}
!770 = metadata !{i64 770}
!771 = metadata !{i64 771}
!772 = metadata !{i64 772}
!773 = metadata !{i64 773}
!774 = metadata !{i64 774}
!775 = metadata !{i64 775}
!776 = metadata !{i64 776}
!777 = metadata !{i64 777}
!778 = metadata !{i64 778}
!779 = metadata !{i64 779}
!780 = metadata !{i64 780}
!781 = metadata !{i64 781}
!782 = metadata !{i64 782}
!783 = metadata !{i64 783}
!784 = metadata !{i64 784}
!785 = metadata !{i64 785}
!786 = metadata !{i64 786}
!787 = metadata !{i64 787}
!788 = metadata !{i64 788}
!789 = metadata !{i64 789}
!790 = metadata !{i64 790}
!791 = metadata !{i64 791}
!792 = metadata !{i64 792}
!793 = metadata !{i64 793}
!794 = metadata !{i64 794}
!795 = metadata !{i64 795}
!796 = metadata !{i64 796}
!797 = metadata !{i64 797}
!798 = metadata !{i64 798}
!799 = metadata !{i64 799}
!800 = metadata !{i64 800}
!801 = metadata !{i64 801}
!802 = metadata !{i64 802}
!803 = metadata !{i64 803}
!804 = metadata !{i64 804}
!805 = metadata !{i64 805}
!806 = metadata !{i64 806}
!807 = metadata !{i64 807}
!808 = metadata !{i64 808}
!809 = metadata !{i64 809}
!810 = metadata !{i64 810}
!811 = metadata !{i64 811}
!812 = metadata !{i64 812}
!813 = metadata !{i64 813}
!814 = metadata !{i64 814}
!815 = metadata !{i64 815}
!816 = metadata !{i64 816}
!817 = metadata !{i64 817}
!818 = metadata !{i64 818}
!819 = metadata !{i64 819}
!820 = metadata !{i64 820}
!821 = metadata !{i64 821}
!822 = metadata !{i64 822}
!823 = metadata !{i64 823}
!824 = metadata !{i64 824}
!825 = metadata !{i64 825}
!826 = metadata !{i64 826}
!827 = metadata !{i64 827}
!828 = metadata !{i64 828}
!829 = metadata !{i64 829}
!830 = metadata !{i64 830}
!831 = metadata !{i64 831}
!832 = metadata !{i64 832}
!833 = metadata !{i64 833}
!834 = metadata !{i64 834}
!835 = metadata !{i64 835}
!836 = metadata !{i64 836}
!837 = metadata !{i64 837}
!838 = metadata !{i64 838}
!839 = metadata !{i64 839}
!840 = metadata !{i64 840}
!841 = metadata !{i64 841}
!842 = metadata !{i64 842}
!843 = metadata !{i64 843}
!844 = metadata !{i64 844}
!845 = metadata !{i64 845}
!846 = metadata !{i64 846}
!847 = metadata !{i64 847}
!848 = metadata !{i64 848}
!849 = metadata !{i64 849}
!850 = metadata !{i64 850}
!851 = metadata !{i64 851}
!852 = metadata !{i64 852}
!853 = metadata !{i64 853}
!854 = metadata !{i64 854}
!855 = metadata !{i64 855}
!856 = metadata !{i64 856}
!857 = metadata !{i64 857}
!858 = metadata !{i64 858}
!859 = metadata !{i64 859}
!860 = metadata !{i64 860}
!861 = metadata !{i64 861}
!862 = metadata !{i64 862}
!863 = metadata !{i64 863}
!864 = metadata !{i64 864}
!865 = metadata !{i64 865}
!866 = metadata !{i64 866}
!867 = metadata !{i64 867}
!868 = metadata !{i64 868}
!869 = metadata !{i64 869}
!870 = metadata !{i64 870}
!871 = metadata !{i64 871}
!872 = metadata !{i64 872}
!873 = metadata !{i64 873}
!874 = metadata !{i64 874}
!875 = metadata !{i64 875}
!876 = metadata !{i64 876}
!877 = metadata !{i64 877}
!878 = metadata !{i64 878}
!879 = metadata !{i64 879}
!880 = metadata !{i64 880}
!881 = metadata !{i64 881}
!882 = metadata !{i64 882}
!883 = metadata !{i64 883}
!884 = metadata !{i64 884}
!885 = metadata !{i64 885}
!886 = metadata !{i64 886}
!887 = metadata !{i64 887}
!888 = metadata !{i64 888}
!889 = metadata !{i64 889}
!890 = metadata !{i64 890}
!891 = metadata !{i64 891}
!892 = metadata !{i64 892}
!893 = metadata !{i64 893}
!894 = metadata !{i64 894}
!895 = metadata !{i64 895}
!896 = metadata !{i64 896}
!897 = metadata !{i64 897}
!898 = metadata !{i64 898}
!899 = metadata !{i64 899}
!900 = metadata !{i64 900}
!901 = metadata !{i64 901}
!902 = metadata !{i64 902}
!903 = metadata !{i64 903}
!904 = metadata !{i64 904}
!905 = metadata !{i64 905}
!906 = metadata !{i64 906}
!907 = metadata !{i64 907}
!908 = metadata !{i64 908}
!909 = metadata !{i64 909}
!910 = metadata !{i64 910}
!911 = metadata !{i64 911}
!912 = metadata !{i64 912}
