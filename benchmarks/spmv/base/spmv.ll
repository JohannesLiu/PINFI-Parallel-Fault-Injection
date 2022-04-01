; ModuleID = 'main.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.pb_TimerSet = type { i32, %struct.pb_async_time_marker_list*, i64, i64, [8 x %struct.pb_Timer], [8 x %struct.pb_SubTimerList*] }
%struct.pb_async_time_marker_list = type { i8*, i32, i8*, %struct.pb_async_time_marker_list* }
%struct.pb_Timer = type { i32, i64, i64 }
%struct.pb_SubTimerList = type { %struct.pb_SubTimer*, %struct.pb_SubTimer* }
%struct.pb_SubTimer = type { i8*, %struct.pb_Timer, %struct.pb_SubTimer* }
%struct.pb_Parameters = type { i8*, i8** }
%struct.argparse = type { i32, i8**, i32, i8**, i8** }
%struct.timeval = type { i64, i64 }
%struct.timezone = type { i32, i32 }
%struct._mat_entry = type { i32, i32, float }
%struct._row_stats = type { i32, i32, i32, i32 }

@.str = private unnamed_addr constant [51 x i8] c"CPU-based sparse matrix vector multiplication****\0A\00", align 1
@.str1 = private unnamed_addr constant [94 x i8] c"Original version by Li-Wen Chang <lchang20@illinois.edu> and Shengzhao Wu<wu14@illinois.edu>\0A\00", align 1
@.str2 = private unnamed_addr constant [57 x i8] c"This version maintained by Chris Rodrigues  ***********\0A\00", align 1
@stderr = external global %struct._IO_FILE*
@.str3 = private unnamed_addr constant [31 x i8] c"Expecting two input filenames\0A\00", align 1
@.str4 = private unnamed_addr constant [32 x i8] c"Expecting file name after '-o'\0A\00", align 1
@.str15 = private unnamed_addr constant [32 x i8] c"Expecting file name after '-i'\0A\00", align 1
@.str26 = private unnamed_addr constant [35 x i8] c"Unexpected command-line parameter\0A\00", align 1
@.str37 = private unnamed_addr constant [43 x i8] c"Ignoring attempt to start a running timer\0A\00", align 1
@.str48 = private unnamed_addr constant [32 x i8] c"Warning: Timer was not stopped\0A\00", align 1
@.str5 = private unnamed_addr constant [35 x i8] c"Warning: Subtimer was not stopped\0A\00", align 1
@.str6 = private unnamed_addr constant [54 x i8] c"Ignoring attempt to start running timer and subtimer\0A\00", align 1
@.str7 = private unnamed_addr constant [42 x i8] c"Ignoring attempt to stop a stopped timer\0A\00", align 1
@.str8 = private unnamed_addr constant [32 x i8] c"Warning: Timer was not running\0A\00", align 1
@.str9 = private unnamed_addr constant [35 x i8] c"Warning: Subtimer was not running\0A\00", align 1
@.str10 = private unnamed_addr constant [53 x i8] c"Ignoring attempt to stop stopped timer and subtimer\0A\00", align 1
@.str11 = private unnamed_addr constant [49 x i8] c"Elapsed time from a running timer is inaccurate\0A\00", align 1
@.str12 = private unnamed_addr constant [4 x i8] c"%s\00\00", align 1
@.str13 = private unnamed_addr constant [3 x i8] c"IO\00", align 1
@.str14 = private unnamed_addr constant [7 x i8] c"Kernel\00", align 1
@.str159 = private unnamed_addr constant [5 x i8] c"Copy\00", align 1
@.str16 = private unnamed_addr constant [7 x i8] c"Driver\00", align 1
@.str17 = private unnamed_addr constant [11 x i8] c"Copy Async\00", align 1
@.str18 = private unnamed_addr constant [8 x i8] c"Compute\00", align 1
@.str19 = private unnamed_addr constant [10 x i8] c"%-*s: %f\0A\00", align 1
@.str20 = private unnamed_addr constant [12 x i8] c" -%-*s: %f\0A\00", align 1
@.str21 = private unnamed_addr constant [24 x i8] c"CPU/Kernel Overlap: %f\0A\00", align 1
@.str22 = private unnamed_addr constant [21 x i8] c"Timer Wall Time: %f\0A\00", align 1
@.str23 = private unnamed_addr constant [15 x i8] c"next_argument\0A\00", align 1
@.str24 = private unnamed_addr constant [17 x i8] c"delete_argument\0A\00", align 1
@.str25 = private unnamed_addr constant [3 x i8] c"rb\00", align 1
@.str126 = private unnamed_addr constant [24 x i8] c"Cannot open input file\0A\00", align 1
@.str227 = private unnamed_addr constant [16 x i8] c"%d %d %d %d %d\0A\00", align 1
@.str328 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str429 = private unnamed_addr constant [25 x i8] c"Cannot open output file\0A\00", align 1
@.str34 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str135 = private unnamed_addr constant [60 x i8] c"mm_read_unsymetric: Could not process Matrix Market banner \00", align 1
@.str236 = private unnamed_addr constant [15 x i8] c" in file [%s]\0A\00", align 1
@.str337 = private unnamed_addr constant [42 x i8] c"Sorry, this application does not support \00", align 1
@.str438 = private unnamed_addr constant [26 x i8] c"Market Market type: [%s]\0A\00", align 1
@.str539 = private unnamed_addr constant [57 x i8] c"read_unsymmetric_sparse(): could not parse matrix size.\0A\00", align 1
@.str640 = private unnamed_addr constant [11 x i8] c"%d %d %lg\0A\00", align 1
@.str741 = private unnamed_addr constant [15 x i8] c"%s %s %s %s %s\00", align 1
@.str842 = private unnamed_addr constant [15 x i8] c"%%MatrixMarket\00", align 1
@.str943 = private unnamed_addr constant [7 x i8] c"matrix\00", align 1
@.str1044 = private unnamed_addr constant [11 x i8] c"coordinate\00", align 1
@.str1145 = private unnamed_addr constant [6 x i8] c"array\00", align 1
@.str1246 = private unnamed_addr constant [5 x i8] c"real\00", align 1
@.str1347 = private unnamed_addr constant [8 x i8] c"complex\00", align 1
@.str1448 = private unnamed_addr constant [8 x i8] c"pattern\00", align 1
@.str1549 = private unnamed_addr constant [8 x i8] c"integer\00", align 1
@.str1650 = private unnamed_addr constant [8 x i8] c"general\00", align 1
@.str1751 = private unnamed_addr constant [10 x i8] c"symmetric\00", align 1
@.str1852 = private unnamed_addr constant [10 x i8] c"hermitian\00", align 1
@.str1953 = private unnamed_addr constant [15 x i8] c"skew-symmetric\00", align 1
@.str2054 = private unnamed_addr constant [10 x i8] c"%d %d %d\0A\00", align 1
@.str2155 = private unnamed_addr constant [9 x i8] c"%d %d %d\00", align 1
@.str2256 = private unnamed_addr constant [6 x i8] c"%d %d\00", align 1
@.str2357 = private unnamed_addr constant [7 x i8] c"%d %d\0A\00", align 1
@.str2458 = private unnamed_addr constant [14 x i8] c"%d %d %lg %lg\00", align 1
@.str2559 = private unnamed_addr constant [6 x i8] c"stdin\00", align 1
@stdin = external global %struct._IO_FILE*
@.str2660 = private unnamed_addr constant [7 x i8] c"%s %s\0A\00", align 1
@.str27 = private unnamed_addr constant [7 x i8] c"stdout\00", align 1
@stdout = external global %struct._IO_FILE*
@.str28 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str29 = private unnamed_addr constant [4 x i8] c"%s \00", align 1
@.str30 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str31 = private unnamed_addr constant [15 x i8] c"%d %d %20.16g\0A\00", align 1
@.str32 = private unnamed_addr constant [23 x i8] c"%d %d %20.16g %20.16g\0A\00", align 1
@.str33 = private unnamed_addr constant [12 x i8] c"%s %s %s %s\00", align 1
@.str61 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str162 = private unnamed_addr constant [41 x i8] c"Could not process Matrix Market banner.\0A\00", align 1
@.str263 = private unnamed_addr constant [42 x i8] c"Sorry, this application does not support \00", align 1
@.str364 = private unnamed_addr constant [26 x i8] c"Market Market type: [%s]\0A\00", align 1
@.str465 = private unnamed_addr constant [10 x i8] c"%d %d %f\0A\00", align 1
@.str566 = private unnamed_addr constant [7 x i8] c"%d %d\0A\00", align 1
@.str667 = private unnamed_addr constant [113 x i8] c"Converting COO to JDS format (%dx%d)\0A%d matrix entries, warp size = %d, row padding align = %d, pack size = %d\0A\0A\00", align 1
@.str768 = private unnamed_addr constant [36 x i8] c"Padding data....%d rows, %d groups\0A\00", align 1
@.str869 = private unnamed_addr constant [44 x i8] c"Padding warp group %d to %d items, zn = %d\0A\00", align 1
@.str970 = private unnamed_addr constant [50 x i8] c"Allocating data space: %d entries (%f%% padding)\0A\00", align 1
@.str1071 = private unnamed_addr constant [16 x i8] c"[%d row%d=%.3f]\00", align 1
@.str1172 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str1273 = private unnamed_addr constant [2 x i8] c"0\00", align 1
@.str1374 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str1475 = private unnamed_addr constant [58 x i8] c"Finished converting.\0AJDS format has %d columns, %d rows.\0A\00", align 1
@.str1576 = private unnamed_addr constant [19 x i8] c"nz_count_len = %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %timers = alloca %struct.pb_TimerSet, align 8
  %parameters = alloca %struct.pb_Parameters*, align 8
  %len = alloca i32, align 4
  %depth = alloca i32, align 4
  %dim = alloca i32, align 4
  %pad = alloca i32, align 4
  %nzcnt_len = alloca i32, align 4
  %h_data = alloca float*, align 8
  %h_indices = alloca i32*, align 8
  %h_ptr = alloca i32*, align 8
  %h_perm = alloca i32*, align 8
  %h_nzcnt = alloca i32*, align 8
  %h_Ax_vector = alloca float*, align 8
  %h_x_vector = alloca float*, align 8
  %col_count = alloca i32, align 4
  %p = alloca i32, align 4
  %i = alloca i32, align 4
  %k = alloca i32, align 4
  %sum = alloca float, align 4
  %bound = alloca i32, align 4
  %j = alloca i32, align 4
  %in = alloca i32, align 4
  %d = alloca float, align 4
  %t = alloca float, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([51 x i8]* @.str, i32 0, i32 0))
  %5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([94 x i8]* @.str1, i32 0, i32 0))
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([57 x i8]* @.str2, i32 0, i32 0))
  %7 = load i8*** %3, align 8
  %8 = call %struct.pb_Parameters* @pb_ReadParameters(i32* %2, i8** %7)
  store %struct.pb_Parameters* %8, %struct.pb_Parameters** %parameters, align 8
  %9 = load %struct.pb_Parameters** %parameters, align 8
  %10 = getelementptr inbounds %struct.pb_Parameters* %9, i32 0, i32 1
  %11 = load i8*** %10, align 8
  %12 = getelementptr inbounds i8** %11, i64 0
  %13 = load i8** %12, align 8
  %14 = icmp eq i8* %13, null
  br i1 %14, label %22, label %15

; <label>:15                                      ; preds = %0
  %16 = load %struct.pb_Parameters** %parameters, align 8
  %17 = getelementptr inbounds %struct.pb_Parameters* %16, i32 0, i32 1
  %18 = load i8*** %17, align 8
  %19 = getelementptr inbounds i8** %18, i64 1
  %20 = load i8** %19, align 8
  %21 = icmp eq i8* %20, null
  br i1 %21, label %22, label %25

; <label>:22                                      ; preds = %15, %0
  %23 = load %struct._IO_FILE** @stderr, align 8
  %24 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([31 x i8]* @.str3, i32 0, i32 0))
  call void @exit(i32 -1) #7
  unreachable

; <label>:25                                      ; preds = %15
  call void @pb_InitializeTimerSet(%struct.pb_TimerSet* %timers)
  call void @pb_SwitchToTimer(%struct.pb_TimerSet* %timers, i32 6)
  store i32 1, i32* %pad, align 4
  call void @pb_SwitchToTimer(%struct.pb_TimerSet* %timers, i32 1)
  %26 = load %struct.pb_Parameters** %parameters, align 8
  %27 = getelementptr inbounds %struct.pb_Parameters* %26, i32 0, i32 1
  %28 = load i8*** %27, align 8
  %29 = getelementptr inbounds i8** %28, i64 0
  %30 = load i8** %29, align 8
  %31 = load i32* %pad, align 4
  %32 = call i32 @coo_to_jds(i8* %30, i32 1, i32 %31, i32 1, i32 1, i32 0, i32 1, float** %h_data, i32** %h_ptr, i32** %h_nzcnt, i32** %h_indices, i32** %h_perm, i32* %col_count, i32* %dim, i32* %len, i32* %nzcnt_len, i32* %depth)
  %33 = load i32* %dim, align 4
  %34 = sext i32 %33 to i64
  %35 = mul i64 4, %34
  %36 = call noalias i8* @malloc(i64 %35) #5
  %37 = bitcast i8* %36 to float*
  store float* %37, float** %h_Ax_vector, align 8
  %38 = load i32* %dim, align 4
  %39 = sext i32 %38 to i64
  %40 = mul i64 4, %39
  %41 = call noalias i8* @malloc(i64 %40) #5
  %42 = bitcast i8* %41 to float*
  store float* %42, float** %h_x_vector, align 8
  %43 = load %struct.pb_Parameters** %parameters, align 8
  %44 = getelementptr inbounds %struct.pb_Parameters* %43, i32 0, i32 1
  %45 = load i8*** %44, align 8
  %46 = getelementptr inbounds i8** %45, i64 1
  %47 = load i8** %46, align 8
  %48 = load float** %h_x_vector, align 8
  %49 = load i32* %dim, align 4
  call void @input_vec(i8* %47, float* %48, i32 %49)
  call void @pb_SwitchToTimer(%struct.pb_TimerSet* %timers, i32 6)
  store i32 0, i32* %p, align 4
  br label %50

; <label>:50                                      ; preds = %113, %25
  %51 = load i32* %p, align 4
  %52 = icmp slt i32 %51, 50
  br i1 %52, label %53, label %116

; <label>:53                                      ; preds = %50
  store i32 0, i32* %i, align 4
  br label %54

; <label>:54                                      ; preds = %109, %53
  %55 = load i32* %i, align 4
  %56 = load i32* %dim, align 4
  %57 = icmp slt i32 %55, %56
  br i1 %57, label %58, label %112

; <label>:58                                      ; preds = %54
  store float 0.000000e+00, float* %sum, align 4
  %59 = load i32* %i, align 4
  %60 = sext i32 %59 to i64
  %61 = load i32** %h_nzcnt, align 8
  %62 = getelementptr inbounds i32* %61, i64 %60
  %63 = load i32* %62, align 4
  store i32 %63, i32* %bound, align 4
  store i32 0, i32* %k, align 4
  br label %64

; <label>:64                                      ; preds = %96, %58
  %65 = load i32* %k, align 4
  %66 = load i32* %bound, align 4
  %67 = icmp slt i32 %65, %66
  br i1 %67, label %68, label %99

; <label>:68                                      ; preds = %64
  %69 = load i32* %k, align 4
  %70 = sext i32 %69 to i64
  %71 = load i32** %h_ptr, align 8
  %72 = getelementptr inbounds i32* %71, i64 %70
  %73 = load i32* %72, align 4
  %74 = load i32* %i, align 4
  %75 = add nsw i32 %73, %74
  store i32 %75, i32* %j, align 4
  %76 = load i32* %j, align 4
  %77 = sext i32 %76 to i64
  %78 = load i32** %h_indices, align 8
  %79 = getelementptr inbounds i32* %78, i64 %77
  %80 = load i32* %79, align 4
  store i32 %80, i32* %in, align 4
  %81 = load i32* %j, align 4
  %82 = sext i32 %81 to i64
  %83 = load float** %h_data, align 8
  %84 = getelementptr inbounds float* %83, i64 %82
  %85 = load float* %84, align 4
  store float %85, float* %d, align 4
  %86 = load i32* %in, align 4
  %87 = sext i32 %86 to i64
  %88 = load float** %h_x_vector, align 8
  %89 = getelementptr inbounds float* %88, i64 %87
  %90 = load float* %89, align 4
  store float %90, float* %t, align 4
  %91 = load float* %d, align 4
  %92 = load float* %t, align 4
  %93 = fmul float %91, %92
  %94 = load float* %sum, align 4
  %95 = fadd float %94, %93
  store float %95, float* %sum, align 4
  br label %96

; <label>:96                                      ; preds = %68
  %97 = load i32* %k, align 4
  %98 = add nsw i32 %97, 1
  store i32 %98, i32* %k, align 4
  br label %64

; <label>:99                                      ; preds = %64
  %100 = load float* %sum, align 4
  %101 = load i32* %i, align 4
  %102 = sext i32 %101 to i64
  %103 = load i32** %h_perm, align 8
  %104 = getelementptr inbounds i32* %103, i64 %102
  %105 = load i32* %104, align 4
  %106 = sext i32 %105 to i64
  %107 = load float** %h_Ax_vector, align 8
  %108 = getelementptr inbounds float* %107, i64 %106
  store float %100, float* %108, align 4
  br label %109

; <label>:109                                     ; preds = %99
  %110 = load i32* %i, align 4
  %111 = add nsw i32 %110, 1
  store i32 %111, i32* %i, align 4
  br label %54

; <label>:112                                     ; preds = %54
  br label %113

; <label>:113                                     ; preds = %112
  %114 = load i32* %p, align 4
  %115 = add nsw i32 %114, 1
  store i32 %115, i32* %p, align 4
  br label %50

; <label>:116                                     ; preds = %50
  %117 = load %struct.pb_Parameters** %parameters, align 8
  %118 = getelementptr inbounds %struct.pb_Parameters* %117, i32 0, i32 0
  %119 = load i8** %118, align 8
  %120 = icmp ne i8* %119, null
  br i1 %120, label %121, label %127

; <label>:121                                     ; preds = %116
  call void @pb_SwitchToTimer(%struct.pb_TimerSet* %timers, i32 1)
  %122 = load %struct.pb_Parameters** %parameters, align 8
  %123 = getelementptr inbounds %struct.pb_Parameters* %122, i32 0, i32 0
  %124 = load i8** %123, align 8
  %125 = load float** %h_Ax_vector, align 8
  %126 = load i32* %dim, align 4
  call void @outputData(i8* %124, float* %125, i32 %126)
  br label %127

; <label>:127                                     ; preds = %121, %116
  call void @pb_SwitchToTimer(%struct.pb_TimerSet* %timers, i32 6)
  %128 = load float** %h_data, align 8
  %129 = bitcast float* %128 to i8*
  call void @free(i8* %129) #5
  %130 = load i32** %h_indices, align 8
  %131 = bitcast i32* %130 to i8*
  call void @free(i8* %131) #5
  %132 = load i32** %h_ptr, align 8
  %133 = bitcast i32* %132 to i8*
  call void @free(i8* %133) #5
  %134 = load i32** %h_perm, align 8
  %135 = bitcast i32* %134 to i8*
  call void @free(i8* %135) #5
  %136 = load i32** %h_nzcnt, align 8
  %137 = bitcast i32* %136 to i8*
  call void @free(i8* %137) #5
  %138 = load float** %h_Ax_vector, align 8
  %139 = bitcast float* %138 to i8*
  call void @free(i8* %139) #5
  %140 = load float** %h_x_vector, align 8
  %141 = bitcast float* %140 to i8*
  call void @free(i8* %141) #5
  call void @pb_SwitchToTimer(%struct.pb_TimerSet* %timers, i32 0)
  call void @pb_PrintTimerSet(%struct.pb_TimerSet* %timers)
  %142 = load %struct.pb_Parameters** %parameters, align 8
  call void @pb_FreeParameters(%struct.pb_Parameters* %142)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #3

; Function Attrs: nounwind
declare void @free(i8*) #3

; Function Attrs: nounwind uwtable
define %struct.pb_Parameters* @pb_ReadParameters(i32* %_argc, i8** %argv) #0 {
  %1 = alloca %struct.pb_Parameters*, align 8
  %2 = alloca i32*, align 8
  %3 = alloca i8**, align 8
  %err_message = alloca i8*, align 8
  %ap = alloca %struct.argparse, align 8
  %ret = alloca %struct.pb_Parameters*, align 8
  %arg = alloca i8*, align 8
  store i32* %_argc, i32** %2, align 8
  store i8** %argv, i8*** %3, align 8
  %4 = call noalias i8* @malloc(i64 16) #5
  %5 = bitcast i8* %4 to %struct.pb_Parameters*
  store %struct.pb_Parameters* %5, %struct.pb_Parameters** %ret, align 8
  %6 = load %struct.pb_Parameters** %ret, align 8
  %7 = getelementptr inbounds %struct.pb_Parameters* %6, i32 0, i32 0
  store i8* null, i8** %7, align 8
  %8 = call noalias i8* @malloc(i64 8) #5
  %9 = bitcast i8* %8 to i8**
  %10 = load %struct.pb_Parameters** %ret, align 8
  %11 = getelementptr inbounds %struct.pb_Parameters* %10, i32 0, i32 1
  store i8** %9, i8*** %11, align 8
  %12 = load %struct.pb_Parameters** %ret, align 8
  %13 = getelementptr inbounds %struct.pb_Parameters* %12, i32 0, i32 1
  %14 = load i8*** %13, align 8
  %15 = getelementptr inbounds i8** %14, i64 0
  store i8* null, i8** %15, align 8
  %16 = load i32** %2, align 8
  %17 = load i32* %16, align 4
  %18 = load i8*** %3, align 8
  call void @initialize_argparse(%struct.argparse* %ap, i32 %17, i8** %18)
  br label %19

; <label>:19                                      ; preds = %72, %0
  %20 = call i32 @is_end_of_arguments(%struct.argparse* %ap)
  %21 = icmp ne i32 %20, 0
  %22 = xor i1 %21, true
  br i1 %22, label %23, label %73

; <label>:23                                      ; preds = %19
  %24 = call i8* @get_argument(%struct.argparse* %ap)
  store i8* %24, i8** %arg, align 8
  %25 = load i8** %arg, align 8
  %26 = getelementptr inbounds i8* %25, i64 0
  %27 = load i8* %26, align 1
  %28 = sext i8 %27 to i32
  %29 = icmp eq i32 %28, 45
  br i1 %29, label %30, label %71

; <label>:30                                      ; preds = %23
  %31 = load i8** %arg, align 8
  %32 = getelementptr inbounds i8* %31, i64 1
  %33 = load i8* %32, align 1
  %34 = sext i8 %33 to i32
  %35 = icmp ne i32 %34, 0
  br i1 %35, label %36, label %71

; <label>:36                                      ; preds = %30
  %37 = load i8** %arg, align 8
  %38 = getelementptr inbounds i8* %37, i64 2
  %39 = load i8* %38, align 1
  %40 = sext i8 %39 to i32
  %41 = icmp eq i32 %40, 0
  br i1 %41, label %42, label %71

; <label>:42                                      ; preds = %36
  call void @delete_argument(%struct.argparse* %ap)
  %43 = load i8** %arg, align 8
  %44 = getelementptr inbounds i8* %43, i64 1
  %45 = load i8* %44, align 1
  %46 = sext i8 %45 to i32
  switch i32 %46, label %69 [
    i32 111, label %47
    i32 105, label %59
    i32 45, label %68
  ]

; <label>:47                                      ; preds = %42
  %48 = call i32 @is_end_of_arguments(%struct.argparse* %ap)
  %49 = icmp ne i32 %48, 0
  br i1 %49, label %50, label %51

; <label>:50                                      ; preds = %47
  store i8* getelementptr inbounds ([32 x i8]* @.str4, i32 0, i32 0), i8** %err_message, align 8
  br label %79

; <label>:51                                      ; preds = %47
  %52 = load %struct.pb_Parameters** %ret, align 8
  %53 = getelementptr inbounds %struct.pb_Parameters* %52, i32 0, i32 0
  %54 = load i8** %53, align 8
  call void @free(i8* %54) #5
  %55 = call i8* @consume_argument(%struct.argparse* %ap)
  %56 = call noalias i8* @strdup(i8* %55) #5
  %57 = load %struct.pb_Parameters** %ret, align 8
  %58 = getelementptr inbounds %struct.pb_Parameters* %57, i32 0, i32 0
  store i8* %56, i8** %58, align 8
  br label %70

; <label>:59                                      ; preds = %42
  %60 = call i32 @is_end_of_arguments(%struct.argparse* %ap)
  %61 = icmp ne i32 %60, 0
  br i1 %61, label %62, label %63

; <label>:62                                      ; preds = %59
  store i8* getelementptr inbounds ([32 x i8]* @.str15, i32 0, i32 0), i8** %err_message, align 8
  br label %79

; <label>:63                                      ; preds = %59
  %64 = call i8* @consume_argument(%struct.argparse* %ap)
  %65 = call i8** @read_string_array(i8* %64)
  %66 = load %struct.pb_Parameters** %ret, align 8
  %67 = getelementptr inbounds %struct.pb_Parameters* %66, i32 0, i32 1
  store i8** %65, i8*** %67, align 8
  br label %70

; <label>:68                                      ; preds = %42
  br label %74

; <label>:69                                      ; preds = %42
  store i8* getelementptr inbounds ([35 x i8]* @.str26, i32 0, i32 0), i8** %err_message, align 8
  br label %79

; <label>:70                                      ; preds = %63, %51
  br label %72

; <label>:71                                      ; preds = %36, %30, %23
  call void @next_argument(%struct.argparse* %ap)
  br label %72

; <label>:72                                      ; preds = %71, %70
  br label %19

; <label>:73                                      ; preds = %19
  br label %74

; <label>:74                                      ; preds = %73, %68
  %75 = getelementptr inbounds %struct.argparse* %ap, i32 0, i32 0
  %76 = load i32* %75, align 4
  %77 = load i32** %2, align 8
  store i32 %76, i32* %77, align 4
  call void @finalize_argparse(%struct.argparse* %ap)
  %78 = load %struct.pb_Parameters** %ret, align 8
  store %struct.pb_Parameters* %78, %struct.pb_Parameters** %1
  br label %84

; <label>:79                                      ; preds = %69, %62, %50
  %80 = load i8** %err_message, align 8
  %81 = load %struct._IO_FILE** @stderr, align 8
  %82 = call i32 @fputs(i8* %80, %struct._IO_FILE* %81)
  %83 = load %struct.pb_Parameters** %ret, align 8
  call void @pb_FreeParameters(%struct.pb_Parameters* %83)
  store %struct.pb_Parameters* null, %struct.pb_Parameters** %1
  br label %84

; <label>:84                                      ; preds = %79, %74
  %85 = load %struct.pb_Parameters** %1
  ret %struct.pb_Parameters* %85
}

; Function Attrs: nounwind
declare noalias i8* @strdup(i8*) #3

declare i32 @fputs(i8*, %struct._IO_FILE*) #1

; Function Attrs: nounwind uwtable
define void @pb_FreeParameters(%struct.pb_Parameters* %p) #0 {
  %1 = alloca %struct.pb_Parameters*, align 8
  %cpp = alloca i8**, align 8
  store %struct.pb_Parameters* %p, %struct.pb_Parameters** %1, align 8
  %2 = load %struct.pb_Parameters** %1, align 8
  %3 = getelementptr inbounds %struct.pb_Parameters* %2, i32 0, i32 0
  %4 = load i8** %3, align 8
  call void @free(i8* %4) #5
  %5 = load %struct.pb_Parameters** %1, align 8
  %6 = getelementptr inbounds %struct.pb_Parameters* %5, i32 0, i32 1
  %7 = load i8*** %6, align 8
  call void @free_string_array(i8** %7)
  %8 = load %struct.pb_Parameters** %1, align 8
  %9 = bitcast %struct.pb_Parameters* %8 to i8*
  call void @free(i8* %9) #5
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @pb_Parameters_CountInputs(%struct.pb_Parameters* %p) #0 {
  %1 = alloca %struct.pb_Parameters*, align 8
  %n = alloca i32, align 4
  store %struct.pb_Parameters* %p, %struct.pb_Parameters** %1, align 8
  store i32 0, i32* %n, align 4
  br label %2

; <label>:2                                       ; preds = %12, %0
  %3 = load i32* %n, align 4
  %4 = sext i32 %3 to i64
  %5 = load %struct.pb_Parameters** %1, align 8
  %6 = getelementptr inbounds %struct.pb_Parameters* %5, i32 0, i32 1
  %7 = load i8*** %6, align 8
  %8 = getelementptr inbounds i8** %7, i64 %4
  %9 = load i8** %8, align 8
  %10 = icmp ne i8* %9, null
  br i1 %10, label %11, label %15

; <label>:11                                      ; preds = %2
  br label %12

; <label>:12                                      ; preds = %11
  %13 = load i32* %n, align 4
  %14 = add nsw i32 %13, 1
  store i32 %14, i32* %n, align 4
  br label %2

; <label>:15                                      ; preds = %2
  %16 = load i32* %n, align 4
  ret i32 %16
}

; Function Attrs: nounwind uwtable
define void @pb_ResetTimer(%struct.pb_Timer* %timer) #0 {
  %1 = alloca %struct.pb_Timer*, align 8
  store %struct.pb_Timer* %timer, %struct.pb_Timer** %1, align 8
  %2 = load %struct.pb_Timer** %1, align 8
  %3 = getelementptr inbounds %struct.pb_Timer* %2, i32 0, i32 0
  store i32 0, i32* %3, align 4
  %4 = load %struct.pb_Timer** %1, align 8
  %5 = getelementptr inbounds %struct.pb_Timer* %4, i32 0, i32 1
  store i64 0, i64* %5, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define void @pb_StartTimer(%struct.pb_Timer* %timer) #0 {
  %1 = alloca %struct.pb_Timer*, align 8
  %tv = alloca %struct.timeval, align 8
  store %struct.pb_Timer* %timer, %struct.pb_Timer** %1, align 8
  %2 = load %struct.pb_Timer** %1, align 8
  %3 = getelementptr inbounds %struct.pb_Timer* %2, i32 0, i32 0
  %4 = load i32* %3, align 4
  %5 = icmp ne i32 %4, 0
  br i1 %5, label %6, label %9

; <label>:6                                       ; preds = %0
  %7 = load %struct._IO_FILE** @stderr, align 8
  %8 = call i32 @fputs(i8* getelementptr inbounds ([43 x i8]* @.str37, i32 0, i32 0), %struct._IO_FILE* %7)
  br label %21

; <label>:9                                       ; preds = %0
  %10 = load %struct.pb_Timer** %1, align 8
  %11 = getelementptr inbounds %struct.pb_Timer* %10, i32 0, i32 0
  store i32 1, i32* %11, align 4
  %12 = call i32 @gettimeofday(%struct.timeval* %tv, %struct.timezone* null) #5
  %13 = getelementptr inbounds %struct.timeval* %tv, i32 0, i32 0
  %14 = load i64* %13, align 8
  %15 = mul nsw i64 %14, 1000000
  %16 = getelementptr inbounds %struct.timeval* %tv, i32 0, i32 1
  %17 = load i64* %16, align 8
  %18 = add nsw i64 %15, %17
  %19 = load %struct.pb_Timer** %1, align 8
  %20 = getelementptr inbounds %struct.pb_Timer* %19, i32 0, i32 2
  store i64 %18, i64* %20, align 8
  br label %21

; <label>:21                                      ; preds = %9, %6
  ret void
}

; Function Attrs: nounwind
declare i32 @gettimeofday(%struct.timeval*, %struct.timezone*) #3

; Function Attrs: nounwind uwtable
define void @pb_StartTimerAndSubTimer(%struct.pb_Timer* %timer, %struct.pb_Timer* %subtimer) #0 {
  %1 = alloca %struct.pb_Timer*, align 8
  %2 = alloca %struct.pb_Timer*, align 8
  %numNotStopped = alloca i32, align 4
  %tv = alloca %struct.timeval, align 8
  store %struct.pb_Timer* %timer, %struct.pb_Timer** %1, align 8
  store %struct.pb_Timer* %subtimer, %struct.pb_Timer** %2, align 8
  store i32 3, i32* %numNotStopped, align 4
  %3 = load %struct.pb_Timer** %1, align 8
  %4 = getelementptr inbounds %struct.pb_Timer* %3, i32 0, i32 0
  %5 = load i32* %4, align 4
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %7, label %12

; <label>:7                                       ; preds = %0
  %8 = load %struct._IO_FILE** @stderr, align 8
  %9 = call i32 @fputs(i8* getelementptr inbounds ([32 x i8]* @.str48, i32 0, i32 0), %struct._IO_FILE* %8)
  %10 = load i32* %numNotStopped, align 4
  %11 = and i32 %10, 1
  store i32 %11, i32* %numNotStopped, align 4
  br label %12

; <label>:12                                      ; preds = %7, %0
  %13 = load %struct.pb_Timer** %2, align 8
  %14 = getelementptr inbounds %struct.pb_Timer* %13, i32 0, i32 0
  %15 = load i32* %14, align 4
  %16 = icmp ne i32 %15, 0
  br i1 %16, label %17, label %22

; <label>:17                                      ; preds = %12
  %18 = load %struct._IO_FILE** @stderr, align 8
  %19 = call i32 @fputs(i8* getelementptr inbounds ([35 x i8]* @.str5, i32 0, i32 0), %struct._IO_FILE* %18)
  %20 = load i32* %numNotStopped, align 4
  %21 = and i32 %20, 2
  store i32 %21, i32* %numNotStopped, align 4
  br label %22

; <label>:22                                      ; preds = %17, %12
  %23 = load i32* %numNotStopped, align 4
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %25, label %28

; <label>:25                                      ; preds = %22
  %26 = load %struct._IO_FILE** @stderr, align 8
  %27 = call i32 @fputs(i8* getelementptr inbounds ([54 x i8]* @.str6, i32 0, i32 0), %struct._IO_FILE* %26)
  br label %59

; <label>:28                                      ; preds = %22
  %29 = load %struct.pb_Timer** %1, align 8
  %30 = getelementptr inbounds %struct.pb_Timer* %29, i32 0, i32 0
  store i32 1, i32* %30, align 4
  %31 = load %struct.pb_Timer** %2, align 8
  %32 = getelementptr inbounds %struct.pb_Timer* %31, i32 0, i32 0
  store i32 1, i32* %32, align 4
  %33 = call i32 @gettimeofday(%struct.timeval* %tv, %struct.timezone* null) #5
  %34 = load i32* %numNotStopped, align 4
  %35 = and i32 %34, 2
  %36 = icmp ne i32 %35, 0
  br i1 %36, label %37, label %46

; <label>:37                                      ; preds = %28
  %38 = getelementptr inbounds %struct.timeval* %tv, i32 0, i32 0
  %39 = load i64* %38, align 8
  %40 = mul nsw i64 %39, 1000000
  %41 = getelementptr inbounds %struct.timeval* %tv, i32 0, i32 1
  %42 = load i64* %41, align 8
  %43 = add nsw i64 %40, %42
  %44 = load %struct.pb_Timer** %1, align 8
  %45 = getelementptr inbounds %struct.pb_Timer* %44, i32 0, i32 2
  store i64 %43, i64* %45, align 8
  br label %46

; <label>:46                                      ; preds = %37, %28
  %47 = load i32* %numNotStopped, align 4
  %48 = and i32 %47, 1
  %49 = icmp ne i32 %48, 0
  br i1 %49, label %50, label %59

; <label>:50                                      ; preds = %46
  %51 = getelementptr inbounds %struct.timeval* %tv, i32 0, i32 0
  %52 = load i64* %51, align 8
  %53 = mul nsw i64 %52, 1000000
  %54 = getelementptr inbounds %struct.timeval* %tv, i32 0, i32 1
  %55 = load i64* %54, align 8
  %56 = add nsw i64 %53, %55
  %57 = load %struct.pb_Timer** %2, align 8
  %58 = getelementptr inbounds %struct.pb_Timer* %57, i32 0, i32 2
  store i64 %56, i64* %58, align 8
  br label %59

; <label>:59                                      ; preds = %50, %46, %25
  ret void
}

; Function Attrs: nounwind uwtable
define void @pb_StopTimer(%struct.pb_Timer* %timer) #0 {
  %1 = alloca %struct.pb_Timer*, align 8
  %fini = alloca i64, align 8
  %tv = alloca %struct.timeval, align 8
  store %struct.pb_Timer* %timer, %struct.pb_Timer** %1, align 8
  %2 = load %struct.pb_Timer** %1, align 8
  %3 = getelementptr inbounds %struct.pb_Timer* %2, i32 0, i32 0
  %4 = load i32* %3, align 4
  %5 = icmp ne i32 %4, 1
  br i1 %5, label %6, label %9

; <label>:6                                       ; preds = %0
  %7 = load %struct._IO_FILE** @stderr, align 8
  %8 = call i32 @fputs(i8* getelementptr inbounds ([42 x i8]* @.str7, i32 0, i32 0), %struct._IO_FILE* %7)
  br label %28

; <label>:9                                       ; preds = %0
  %10 = load %struct.pb_Timer** %1, align 8
  %11 = getelementptr inbounds %struct.pb_Timer* %10, i32 0, i32 0
  store i32 0, i32* %11, align 4
  %12 = call i32 @gettimeofday(%struct.timeval* %tv, %struct.timezone* null) #5
  %13 = getelementptr inbounds %struct.timeval* %tv, i32 0, i32 0
  %14 = load i64* %13, align 8
  %15 = mul nsw i64 %14, 1000000
  %16 = getelementptr inbounds %struct.timeval* %tv, i32 0, i32 1
  %17 = load i64* %16, align 8
  %18 = add nsw i64 %15, %17
  store i64 %18, i64* %fini, align 8
  %19 = load %struct.pb_Timer** %1, align 8
  %20 = getelementptr inbounds %struct.pb_Timer* %19, i32 0, i32 1
  %21 = load %struct.pb_Timer** %1, align 8
  %22 = getelementptr inbounds %struct.pb_Timer* %21, i32 0, i32 2
  %23 = load i64* %22, align 8
  %24 = load i64* %fini, align 8
  call void @accumulate_time(i64* %20, i64 %23, i64 %24)
  %25 = load i64* %fini, align 8
  %26 = load %struct.pb_Timer** %1, align 8
  %27 = getelementptr inbounds %struct.pb_Timer* %26, i32 0, i32 2
  store i64 %25, i64* %27, align 8
  br label %28

; <label>:28                                      ; preds = %9, %6
  ret void
}

; Function Attrs: nounwind uwtable
define void @pb_StopTimerAndSubTimer(%struct.pb_Timer* %timer, %struct.pb_Timer* %subtimer) #0 {
  %1 = alloca %struct.pb_Timer*, align 8
  %2 = alloca %struct.pb_Timer*, align 8
  %fini = alloca i64, align 8
  %numNotRunning = alloca i32, align 4
  %tv = alloca %struct.timeval, align 8
  store %struct.pb_Timer* %timer, %struct.pb_Timer** %1, align 8
  store %struct.pb_Timer* %subtimer, %struct.pb_Timer** %2, align 8
  store i32 3, i32* %numNotRunning, align 4
  %3 = load %struct.pb_Timer** %1, align 8
  %4 = getelementptr inbounds %struct.pb_Timer* %3, i32 0, i32 0
  %5 = load i32* %4, align 4
  %6 = icmp ne i32 %5, 1
  br i1 %6, label %7, label %12

; <label>:7                                       ; preds = %0
  %8 = load %struct._IO_FILE** @stderr, align 8
  %9 = call i32 @fputs(i8* getelementptr inbounds ([32 x i8]* @.str8, i32 0, i32 0), %struct._IO_FILE* %8)
  %10 = load i32* %numNotRunning, align 4
  %11 = and i32 %10, 1
  store i32 %11, i32* %numNotRunning, align 4
  br label %12

; <label>:12                                      ; preds = %7, %0
  %13 = load %struct.pb_Timer** %2, align 8
  %14 = getelementptr inbounds %struct.pb_Timer* %13, i32 0, i32 0
  %15 = load i32* %14, align 4
  %16 = icmp ne i32 %15, 1
  br i1 %16, label %17, label %22

; <label>:17                                      ; preds = %12
  %18 = load %struct._IO_FILE** @stderr, align 8
  %19 = call i32 @fputs(i8* getelementptr inbounds ([35 x i8]* @.str9, i32 0, i32 0), %struct._IO_FILE* %18)
  %20 = load i32* %numNotRunning, align 4
  %21 = and i32 %20, 2
  store i32 %21, i32* %numNotRunning, align 4
  br label %22

; <label>:22                                      ; preds = %17, %12
  %23 = load i32* %numNotRunning, align 4
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %25, label %28

; <label>:25                                      ; preds = %22
  %26 = load %struct._IO_FILE** @stderr, align 8
  %27 = call i32 @fputs(i8* getelementptr inbounds ([53 x i8]* @.str10, i32 0, i32 0), %struct._IO_FILE* %26)
  br label %67

; <label>:28                                      ; preds = %22
  %29 = load %struct.pb_Timer** %1, align 8
  %30 = getelementptr inbounds %struct.pb_Timer* %29, i32 0, i32 0
  store i32 0, i32* %30, align 4
  %31 = load %struct.pb_Timer** %2, align 8
  %32 = getelementptr inbounds %struct.pb_Timer* %31, i32 0, i32 0
  store i32 0, i32* %32, align 4
  %33 = call i32 @gettimeofday(%struct.timeval* %tv, %struct.timezone* null) #5
  %34 = getelementptr inbounds %struct.timeval* %tv, i32 0, i32 0
  %35 = load i64* %34, align 8
  %36 = mul nsw i64 %35, 1000000
  %37 = getelementptr inbounds %struct.timeval* %tv, i32 0, i32 1
  %38 = load i64* %37, align 8
  %39 = add nsw i64 %36, %38
  store i64 %39, i64* %fini, align 8
  %40 = load i32* %numNotRunning, align 4
  %41 = and i32 %40, 2
  %42 = icmp ne i32 %41, 0
  br i1 %42, label %43, label %53

; <label>:43                                      ; preds = %28
  %44 = load %struct.pb_Timer** %1, align 8
  %45 = getelementptr inbounds %struct.pb_Timer* %44, i32 0, i32 1
  %46 = load %struct.pb_Timer** %1, align 8
  %47 = getelementptr inbounds %struct.pb_Timer* %46, i32 0, i32 2
  %48 = load i64* %47, align 8
  %49 = load i64* %fini, align 8
  call void @accumulate_time(i64* %45, i64 %48, i64 %49)
  %50 = load i64* %fini, align 8
  %51 = load %struct.pb_Timer** %1, align 8
  %52 = getelementptr inbounds %struct.pb_Timer* %51, i32 0, i32 2
  store i64 %50, i64* %52, align 8
  br label %53

; <label>:53                                      ; preds = %43, %28
  %54 = load i32* %numNotRunning, align 4
  %55 = and i32 %54, 1
  %56 = icmp ne i32 %55, 0
  br i1 %56, label %57, label %67

; <label>:57                                      ; preds = %53
  %58 = load %struct.pb_Timer** %2, align 8
  %59 = getelementptr inbounds %struct.pb_Timer* %58, i32 0, i32 1
  %60 = load %struct.pb_Timer** %2, align 8
  %61 = getelementptr inbounds %struct.pb_Timer* %60, i32 0, i32 2
  %62 = load i64* %61, align 8
  %63 = load i64* %fini, align 8
  call void @accumulate_time(i64* %59, i64 %62, i64 %63)
  %64 = load i64* %fini, align 8
  %65 = load %struct.pb_Timer** %2, align 8
  %66 = getelementptr inbounds %struct.pb_Timer* %65, i32 0, i32 2
  store i64 %64, i64* %66, align 8
  br label %67

; <label>:67                                      ; preds = %57, %53, %25
  ret void
}

; Function Attrs: nounwind uwtable
define double @pb_GetElapsedTime(%struct.pb_Timer* %timer) #0 {
  %1 = alloca %struct.pb_Timer*, align 8
  %ret = alloca double, align 8
  store %struct.pb_Timer* %timer, %struct.pb_Timer** %1, align 8
  %2 = load %struct.pb_Timer** %1, align 8
  %3 = getelementptr inbounds %struct.pb_Timer* %2, i32 0, i32 0
  %4 = load i32* %3, align 4
  %5 = icmp ne i32 %4, 0
  br i1 %5, label %6, label %9

; <label>:6                                       ; preds = %0
  %7 = load %struct._IO_FILE** @stderr, align 8
  %8 = call i32 @fputs(i8* getelementptr inbounds ([49 x i8]* @.str11, i32 0, i32 0), %struct._IO_FILE* %7)
  br label %9

; <label>:9                                       ; preds = %6, %0
  %10 = load %struct.pb_Timer** %1, align 8
  %11 = getelementptr inbounds %struct.pb_Timer* %10, i32 0, i32 1
  %12 = load i64* %11, align 8
  %13 = uitofp i64 %12 to double
  %14 = fdiv double %13, 1.000000e+06
  store double %14, double* %ret, align 8
  %15 = load double* %ret, align 8
  ret double %15
}

; Function Attrs: nounwind uwtable
define void @pb_InitializeTimerSet(%struct.pb_TimerSet* %timers) #0 {
  %1 = alloca %struct.pb_TimerSet*, align 8
  %n = alloca i32, align 4
  store %struct.pb_TimerSet* %timers, %struct.pb_TimerSet** %1, align 8
  %2 = call i64 @get_time()
  %3 = load %struct.pb_TimerSet** %1, align 8
  %4 = getelementptr inbounds %struct.pb_TimerSet* %3, i32 0, i32 3
  store i64 %2, i64* %4, align 8
  %5 = load %struct.pb_TimerSet** %1, align 8
  %6 = getelementptr inbounds %struct.pb_TimerSet* %5, i32 0, i32 0
  store i32 0, i32* %6, align 4
  %7 = load %struct.pb_TimerSet** %1, align 8
  %8 = getelementptr inbounds %struct.pb_TimerSet* %7, i32 0, i32 1
  store %struct.pb_async_time_marker_list* null, %struct.pb_async_time_marker_list** %8, align 8
  store i32 0, i32* %n, align 4
  br label %9

; <label>:9                                       ; preds = %23, %0
  %10 = load i32* %n, align 4
  %11 = icmp slt i32 %10, 8
  br i1 %11, label %12, label %26

; <label>:12                                      ; preds = %9
  %13 = load i32* %n, align 4
  %14 = sext i32 %13 to i64
  %15 = load %struct.pb_TimerSet** %1, align 8
  %16 = getelementptr inbounds %struct.pb_TimerSet* %15, i32 0, i32 4
  %17 = getelementptr inbounds [8 x %struct.pb_Timer]* %16, i32 0, i64 %14
  call void @pb_ResetTimer(%struct.pb_Timer* %17)
  %18 = load i32* %n, align 4
  %19 = sext i32 %18 to i64
  %20 = load %struct.pb_TimerSet** %1, align 8
  %21 = getelementptr inbounds %struct.pb_TimerSet* %20, i32 0, i32 5
  %22 = getelementptr inbounds [8 x %struct.pb_SubTimerList*]* %21, i32 0, i64 %19
  store %struct.pb_SubTimerList* null, %struct.pb_SubTimerList** %22, align 8
  br label %23

; <label>:23                                      ; preds = %12
  %24 = load i32* %n, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, i32* %n, align 4
  br label %9

; <label>:26                                      ; preds = %9
  ret void
}

; Function Attrs: nounwind uwtable
define void @pb_AddSubTimer(%struct.pb_TimerSet* %timers, i8* %label, i32 %pb_Category) #0 {
  %1 = alloca %struct.pb_TimerSet*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  %subtimer = alloca %struct.pb_SubTimer*, align 8
  %len = alloca i32, align 4
  %subtimerlist = alloca %struct.pb_SubTimerList*, align 8
  %element = alloca %struct.pb_SubTimer*, align 8
  store %struct.pb_TimerSet* %timers, %struct.pb_TimerSet** %1, align 8
  store i8* %label, i8** %2, align 8
  store i32 %pb_Category, i32* %3, align 4
  %4 = call noalias i8* @malloc(i64 40) #5
  %5 = bitcast i8* %4 to %struct.pb_SubTimer*
  store %struct.pb_SubTimer* %5, %struct.pb_SubTimer** %subtimer, align 8
  %6 = load i8** %2, align 8
  %7 = call i64 @strlen(i8* %6) #8
  %8 = trunc i64 %7 to i32
  store i32 %8, i32* %len, align 4
  %9 = load i32* %len, align 4
  %10 = add nsw i32 %9, 1
  %11 = sext i32 %10 to i64
  %12 = mul i64 1, %11
  %13 = call noalias i8* @malloc(i64 %12) #5
  %14 = load %struct.pb_SubTimer** %subtimer, align 8
  %15 = getelementptr inbounds %struct.pb_SubTimer* %14, i32 0, i32 0
  store i8* %13, i8** %15, align 8
  %16 = load %struct.pb_SubTimer** %subtimer, align 8
  %17 = getelementptr inbounds %struct.pb_SubTimer* %16, i32 0, i32 0
  %18 = load i8** %17, align 8
  %19 = load i8** %2, align 8
  %20 = call i32 (i8*, i8*, ...)* @sprintf(i8* %18, i8* getelementptr inbounds ([4 x i8]* @.str12, i32 0, i32 0), i8* %19) #5
  %21 = load %struct.pb_SubTimer** %subtimer, align 8
  %22 = getelementptr inbounds %struct.pb_SubTimer* %21, i32 0, i32 1
  call void @pb_ResetTimer(%struct.pb_Timer* %22)
  %23 = load %struct.pb_SubTimer** %subtimer, align 8
  %24 = getelementptr inbounds %struct.pb_SubTimer* %23, i32 0, i32 2
  store %struct.pb_SubTimer* null, %struct.pb_SubTimer** %24, align 8
  %25 = load i32* %3, align 4
  %26 = zext i32 %25 to i64
  %27 = load %struct.pb_TimerSet** %1, align 8
  %28 = getelementptr inbounds %struct.pb_TimerSet* %27, i32 0, i32 5
  %29 = getelementptr inbounds [8 x %struct.pb_SubTimerList*]* %28, i32 0, i64 %26
  %30 = load %struct.pb_SubTimerList** %29, align 8
  store %struct.pb_SubTimerList* %30, %struct.pb_SubTimerList** %subtimerlist, align 8
  %31 = load %struct.pb_SubTimerList** %subtimerlist, align 8
  %32 = icmp eq %struct.pb_SubTimerList* %31, null
  br i1 %32, label %33, label %45

; <label>:33                                      ; preds = %0
  %34 = call noalias i8* @malloc(i64 16) #5
  %35 = bitcast i8* %34 to %struct.pb_SubTimerList*
  store %struct.pb_SubTimerList* %35, %struct.pb_SubTimerList** %subtimerlist, align 8
  %36 = load %struct.pb_SubTimer** %subtimer, align 8
  %37 = load %struct.pb_SubTimerList** %subtimerlist, align 8
  %38 = getelementptr inbounds %struct.pb_SubTimerList* %37, i32 0, i32 1
  store %struct.pb_SubTimer* %36, %struct.pb_SubTimer** %38, align 8
  %39 = load %struct.pb_SubTimerList** %subtimerlist, align 8
  %40 = load i32* %3, align 4
  %41 = zext i32 %40 to i64
  %42 = load %struct.pb_TimerSet** %1, align 8
  %43 = getelementptr inbounds %struct.pb_TimerSet* %42, i32 0, i32 5
  %44 = getelementptr inbounds [8 x %struct.pb_SubTimerList*]* %43, i32 0, i64 %41
  store %struct.pb_SubTimerList* %39, %struct.pb_SubTimerList** %44, align 8
  br label %62

; <label>:45                                      ; preds = %0
  %46 = load %struct.pb_SubTimerList** %subtimerlist, align 8
  %47 = getelementptr inbounds %struct.pb_SubTimerList* %46, i32 0, i32 1
  %48 = load %struct.pb_SubTimer** %47, align 8
  store %struct.pb_SubTimer* %48, %struct.pb_SubTimer** %element, align 8
  br label %49

; <label>:49                                      ; preds = %54, %45
  %50 = load %struct.pb_SubTimer** %element, align 8
  %51 = getelementptr inbounds %struct.pb_SubTimer* %50, i32 0, i32 2
  %52 = load %struct.pb_SubTimer** %51, align 8
  %53 = icmp ne %struct.pb_SubTimer* %52, null
  br i1 %53, label %54, label %58

; <label>:54                                      ; preds = %49
  %55 = load %struct.pb_SubTimer** %element, align 8
  %56 = getelementptr inbounds %struct.pb_SubTimer* %55, i32 0, i32 2
  %57 = load %struct.pb_SubTimer** %56, align 8
  store %struct.pb_SubTimer* %57, %struct.pb_SubTimer** %element, align 8
  br label %49

; <label>:58                                      ; preds = %49
  %59 = load %struct.pb_SubTimer** %subtimer, align 8
  %60 = load %struct.pb_SubTimer** %element, align 8
  %61 = getelementptr inbounds %struct.pb_SubTimer* %60, i32 0, i32 2
  store %struct.pb_SubTimer* %59, %struct.pb_SubTimer** %61, align 8
  br label %62

; <label>:62                                      ; preds = %58, %33
  ret void
}

; Function Attrs: nounwind readonly
declare i64 @strlen(i8*) #4

; Function Attrs: nounwind
declare i32 @sprintf(i8*, i8*, ...) #3

; Function Attrs: nounwind uwtable
define void @pb_SwitchToSubTimer(%struct.pb_TimerSet* %timers, i8* %label, i32 %category) #0 {
  %1 = alloca %struct.pb_TimerSet*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  %topLevelToStop = alloca %struct.pb_Timer*, align 8
  %subtimerlist = alloca %struct.pb_SubTimerList*, align 8
  %curr = alloca %struct.pb_SubTimer*, align 8
  %subtimer = alloca %struct.pb_SubTimer*, align 8
  store %struct.pb_TimerSet* %timers, %struct.pb_TimerSet** %1, align 8
  store i8* %label, i8** %2, align 8
  store i32 %category, i32* %3, align 4
  store %struct.pb_Timer* null, %struct.pb_Timer** %topLevelToStop, align 8
  %4 = load %struct.pb_TimerSet** %1, align 8
  %5 = getelementptr inbounds %struct.pb_TimerSet* %4, i32 0, i32 0
  %6 = load i32* %5, align 4
  %7 = load i32* %3, align 4
  %8 = icmp ne i32 %6, %7
  br i1 %8, label %9, label %22

; <label>:9                                       ; preds = %0
  %10 = load %struct.pb_TimerSet** %1, align 8
  %11 = getelementptr inbounds %struct.pb_TimerSet* %10, i32 0, i32 0
  %12 = load i32* %11, align 4
  %13 = icmp ne i32 %12, 0
  br i1 %13, label %14, label %22

; <label>:14                                      ; preds = %9
  %15 = load %struct.pb_TimerSet** %1, align 8
  %16 = getelementptr inbounds %struct.pb_TimerSet* %15, i32 0, i32 0
  %17 = load i32* %16, align 4
  %18 = zext i32 %17 to i64
  %19 = load %struct.pb_TimerSet** %1, align 8
  %20 = getelementptr inbounds %struct.pb_TimerSet* %19, i32 0, i32 4
  %21 = getelementptr inbounds [8 x %struct.pb_Timer]* %20, i32 0, i64 %18
  store %struct.pb_Timer* %21, %struct.pb_Timer** %topLevelToStop, align 8
  br label %22

; <label>:22                                      ; preds = %14, %9, %0
  %23 = load %struct.pb_TimerSet** %1, align 8
  %24 = getelementptr inbounds %struct.pb_TimerSet* %23, i32 0, i32 0
  %25 = load i32* %24, align 4
  %26 = zext i32 %25 to i64
  %27 = load %struct.pb_TimerSet** %1, align 8
  %28 = getelementptr inbounds %struct.pb_TimerSet* %27, i32 0, i32 5
  %29 = getelementptr inbounds [8 x %struct.pb_SubTimerList*]* %28, i32 0, i64 %26
  %30 = load %struct.pb_SubTimerList** %29, align 8
  store %struct.pb_SubTimerList* %30, %struct.pb_SubTimerList** %subtimerlist, align 8
  %31 = load %struct.pb_SubTimerList** %subtimerlist, align 8
  %32 = icmp eq %struct.pb_SubTimerList* %31, null
  br i1 %32, label %33, label %34

; <label>:33                                      ; preds = %22
  br label %38

; <label>:34                                      ; preds = %22
  %35 = load %struct.pb_SubTimerList** %subtimerlist, align 8
  %36 = getelementptr inbounds %struct.pb_SubTimerList* %35, i32 0, i32 0
  %37 = load %struct.pb_SubTimer** %36, align 8
  br label %38

; <label>:38                                      ; preds = %34, %33
  %39 = phi %struct.pb_SubTimer* [ null, %33 ], [ %37, %34 ]
  store %struct.pb_SubTimer* %39, %struct.pb_SubTimer** %curr, align 8
  %40 = load %struct.pb_TimerSet** %1, align 8
  %41 = getelementptr inbounds %struct.pb_TimerSet* %40, i32 0, i32 0
  %42 = load i32* %41, align 4
  %43 = icmp ne i32 %42, 0
  br i1 %43, label %44, label %64

; <label>:44                                      ; preds = %38
  %45 = load %struct.pb_SubTimer** %curr, align 8
  %46 = icmp ne %struct.pb_SubTimer* %45, null
  br i1 %46, label %47, label %54

; <label>:47                                      ; preds = %44
  %48 = load %struct.pb_Timer** %topLevelToStop, align 8
  %49 = icmp ne %struct.pb_Timer* %48, null
  br i1 %49, label %50, label %54

; <label>:50                                      ; preds = %47
  %51 = load %struct.pb_Timer** %topLevelToStop, align 8
  %52 = load %struct.pb_SubTimer** %curr, align 8
  %53 = getelementptr inbounds %struct.pb_SubTimer* %52, i32 0, i32 1
  call void @pb_StopTimerAndSubTimer(%struct.pb_Timer* %51, %struct.pb_Timer* %53)
  br label %63

; <label>:54                                      ; preds = %47, %44
  %55 = load %struct.pb_SubTimer** %curr, align 8
  %56 = icmp ne %struct.pb_SubTimer* %55, null
  br i1 %56, label %57, label %60

; <label>:57                                      ; preds = %54
  %58 = load %struct.pb_SubTimer** %curr, align 8
  %59 = getelementptr inbounds %struct.pb_SubTimer* %58, i32 0, i32 1
  call void @pb_StopTimer(%struct.pb_Timer* %59)
  br label %62

; <label>:60                                      ; preds = %54
  %61 = load %struct.pb_Timer** %topLevelToStop, align 8
  call void @pb_StopTimer(%struct.pb_Timer* %61)
  br label %62

; <label>:62                                      ; preds = %60, %57
  br label %63

; <label>:63                                      ; preds = %62, %50
  br label %64

; <label>:64                                      ; preds = %63, %38
  %65 = load i32* %3, align 4
  %66 = zext i32 %65 to i64
  %67 = load %struct.pb_TimerSet** %1, align 8
  %68 = getelementptr inbounds %struct.pb_TimerSet* %67, i32 0, i32 5
  %69 = getelementptr inbounds [8 x %struct.pb_SubTimerList*]* %68, i32 0, i64 %66
  %70 = load %struct.pb_SubTimerList** %69, align 8
  store %struct.pb_SubTimerList* %70, %struct.pb_SubTimerList** %subtimerlist, align 8
  store %struct.pb_SubTimer* null, %struct.pb_SubTimer** %subtimer, align 8
  %71 = load i8** %2, align 8
  %72 = icmp ne i8* %71, null
  br i1 %72, label %73, label %94

; <label>:73                                      ; preds = %64
  %74 = load %struct.pb_SubTimerList** %subtimerlist, align 8
  %75 = getelementptr inbounds %struct.pb_SubTimerList* %74, i32 0, i32 1
  %76 = load %struct.pb_SubTimer** %75, align 8
  store %struct.pb_SubTimer* %76, %struct.pb_SubTimer** %subtimer, align 8
  br label %77

; <label>:77                                      ; preds = %92, %73
  %78 = load %struct.pb_SubTimer** %subtimer, align 8
  %79 = icmp ne %struct.pb_SubTimer* %78, null
  br i1 %79, label %80, label %93

; <label>:80                                      ; preds = %77
  %81 = load %struct.pb_SubTimer** %subtimer, align 8
  %82 = getelementptr inbounds %struct.pb_SubTimer* %81, i32 0, i32 0
  %83 = load i8** %82, align 8
  %84 = load i8** %2, align 8
  %85 = call i32 @strcmp(i8* %83, i8* %84) #8
  %86 = icmp eq i32 %85, 0
  br i1 %86, label %87, label %88

; <label>:87                                      ; preds = %80
  br label %93

; <label>:88                                      ; preds = %80
  %89 = load %struct.pb_SubTimer** %subtimer, align 8
  %90 = getelementptr inbounds %struct.pb_SubTimer* %89, i32 0, i32 2
  %91 = load %struct.pb_SubTimer** %90, align 8
  store %struct.pb_SubTimer* %91, %struct.pb_SubTimer** %subtimer, align 8
  br label %92

; <label>:92                                      ; preds = %88
  br label %77

; <label>:93                                      ; preds = %87, %77
  br label %94

; <label>:94                                      ; preds = %93, %64
  %95 = load i32* %3, align 4
  %96 = icmp ne i32 %95, 0
  br i1 %96, label %97, label %135

; <label>:97                                      ; preds = %94
  %98 = load %struct.pb_SubTimerList** %subtimerlist, align 8
  %99 = icmp ne %struct.pb_SubTimerList* %98, null
  br i1 %99, label %100, label %104

; <label>:100                                     ; preds = %97
  %101 = load %struct.pb_SubTimer** %subtimer, align 8
  %102 = load %struct.pb_SubTimerList** %subtimerlist, align 8
  %103 = getelementptr inbounds %struct.pb_SubTimerList* %102, i32 0, i32 0
  store %struct.pb_SubTimer* %101, %struct.pb_SubTimer** %103, align 8
  br label %104

; <label>:104                                     ; preds = %100, %97
  %105 = load i32* %3, align 4
  %106 = load %struct.pb_TimerSet** %1, align 8
  %107 = getelementptr inbounds %struct.pb_TimerSet* %106, i32 0, i32 0
  %108 = load i32* %107, align 4
  %109 = icmp ne i32 %105, %108
  br i1 %109, label %110, label %121

; <label>:110                                     ; preds = %104
  %111 = load %struct.pb_SubTimer** %subtimer, align 8
  %112 = icmp ne %struct.pb_SubTimer* %111, null
  br i1 %112, label %113, label %121

; <label>:113                                     ; preds = %110
  %114 = load i32* %3, align 4
  %115 = zext i32 %114 to i64
  %116 = load %struct.pb_TimerSet** %1, align 8
  %117 = getelementptr inbounds %struct.pb_TimerSet* %116, i32 0, i32 4
  %118 = getelementptr inbounds [8 x %struct.pb_Timer]* %117, i32 0, i64 %115
  %119 = load %struct.pb_SubTimer** %subtimer, align 8
  %120 = getelementptr inbounds %struct.pb_SubTimer* %119, i32 0, i32 1
  call void @pb_StartTimerAndSubTimer(%struct.pb_Timer* %118, %struct.pb_Timer* %120)
  br label %134

; <label>:121                                     ; preds = %110, %104
  %122 = load %struct.pb_SubTimer** %subtimer, align 8
  %123 = icmp ne %struct.pb_SubTimer* %122, null
  br i1 %123, label %124, label %127

; <label>:124                                     ; preds = %121
  %125 = load %struct.pb_SubTimer** %subtimer, align 8
  %126 = getelementptr inbounds %struct.pb_SubTimer* %125, i32 0, i32 1
  call void @pb_StartTimer(%struct.pb_Timer* %126)
  br label %133

; <label>:127                                     ; preds = %121
  %128 = load i32* %3, align 4
  %129 = zext i32 %128 to i64
  %130 = load %struct.pb_TimerSet** %1, align 8
  %131 = getelementptr inbounds %struct.pb_TimerSet* %130, i32 0, i32 4
  %132 = getelementptr inbounds [8 x %struct.pb_Timer]* %131, i32 0, i64 %129
  call void @pb_StartTimer(%struct.pb_Timer* %132)
  br label %133

; <label>:133                                     ; preds = %127, %124
  br label %134

; <label>:134                                     ; preds = %133, %113
  br label %135

; <label>:135                                     ; preds = %134, %94
  %136 = load i32* %3, align 4
  %137 = load %struct.pb_TimerSet** %1, align 8
  %138 = getelementptr inbounds %struct.pb_TimerSet* %137, i32 0, i32 0
  store i32 %136, i32* %138, align 4
  ret void
}

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #4

; Function Attrs: nounwind uwtable
define void @pb_SwitchToTimer(%struct.pb_TimerSet* %timers, i32 %timer) #0 {
  %1 = alloca %struct.pb_TimerSet*, align 8
  %2 = alloca i32, align 4
  %currSubTimer = alloca %struct.pb_SubTimer*, align 8
  %subtimerlist = alloca %struct.pb_SubTimerList*, align 8
  store %struct.pb_TimerSet* %timers, %struct.pb_TimerSet** %1, align 8
  store i32 %timer, i32* %2, align 4
  %3 = load %struct.pb_TimerSet** %1, align 8
  %4 = getelementptr inbounds %struct.pb_TimerSet* %3, i32 0, i32 0
  %5 = load i32* %4, align 4
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %7, label %51

; <label>:7                                       ; preds = %0
  store %struct.pb_SubTimer* null, %struct.pb_SubTimer** %currSubTimer, align 8
  %8 = load %struct.pb_TimerSet** %1, align 8
  %9 = getelementptr inbounds %struct.pb_TimerSet* %8, i32 0, i32 0
  %10 = load i32* %9, align 4
  %11 = zext i32 %10 to i64
  %12 = load %struct.pb_TimerSet** %1, align 8
  %13 = getelementptr inbounds %struct.pb_TimerSet* %12, i32 0, i32 5
  %14 = getelementptr inbounds [8 x %struct.pb_SubTimerList*]* %13, i32 0, i64 %11
  %15 = load %struct.pb_SubTimerList** %14, align 8
  store %struct.pb_SubTimerList* %15, %struct.pb_SubTimerList** %subtimerlist, align 8
  %16 = load %struct.pb_SubTimerList** %subtimerlist, align 8
  %17 = icmp ne %struct.pb_SubTimerList* %16, null
  br i1 %17, label %18, label %29

; <label>:18                                      ; preds = %7
  %19 = load %struct.pb_TimerSet** %1, align 8
  %20 = getelementptr inbounds %struct.pb_TimerSet* %19, i32 0, i32 0
  %21 = load i32* %20, align 4
  %22 = zext i32 %21 to i64
  %23 = load %struct.pb_TimerSet** %1, align 8
  %24 = getelementptr inbounds %struct.pb_TimerSet* %23, i32 0, i32 5
  %25 = getelementptr inbounds [8 x %struct.pb_SubTimerList*]* %24, i32 0, i64 %22
  %26 = load %struct.pb_SubTimerList** %25, align 8
  %27 = getelementptr inbounds %struct.pb_SubTimerList* %26, i32 0, i32 0
  %28 = load %struct.pb_SubTimer** %27, align 8
  store %struct.pb_SubTimer* %28, %struct.pb_SubTimer** %currSubTimer, align 8
  br label %29

; <label>:29                                      ; preds = %18, %7
  %30 = load %struct.pb_SubTimer** %currSubTimer, align 8
  %31 = icmp ne %struct.pb_SubTimer* %30, null
  br i1 %31, label %32, label %42

; <label>:32                                      ; preds = %29
  %33 = load %struct.pb_TimerSet** %1, align 8
  %34 = getelementptr inbounds %struct.pb_TimerSet* %33, i32 0, i32 0
  %35 = load i32* %34, align 4
  %36 = zext i32 %35 to i64
  %37 = load %struct.pb_TimerSet** %1, align 8
  %38 = getelementptr inbounds %struct.pb_TimerSet* %37, i32 0, i32 4
  %39 = getelementptr inbounds [8 x %struct.pb_Timer]* %38, i32 0, i64 %36
  %40 = load %struct.pb_SubTimer** %currSubTimer, align 8
  %41 = getelementptr inbounds %struct.pb_SubTimer* %40, i32 0, i32 1
  call void @pb_StopTimerAndSubTimer(%struct.pb_Timer* %39, %struct.pb_Timer* %41)
  br label %50

; <label>:42                                      ; preds = %29
  %43 = load %struct.pb_TimerSet** %1, align 8
  %44 = getelementptr inbounds %struct.pb_TimerSet* %43, i32 0, i32 0
  %45 = load i32* %44, align 4
  %46 = zext i32 %45 to i64
  %47 = load %struct.pb_TimerSet** %1, align 8
  %48 = getelementptr inbounds %struct.pb_TimerSet* %47, i32 0, i32 4
  %49 = getelementptr inbounds [8 x %struct.pb_Timer]* %48, i32 0, i64 %46
  call void @pb_StopTimer(%struct.pb_Timer* %49)
  br label %50

; <label>:50                                      ; preds = %42, %32
  br label %51

; <label>:51                                      ; preds = %50, %0
  %52 = load i32* %2, align 4
  %53 = load %struct.pb_TimerSet** %1, align 8
  %54 = getelementptr inbounds %struct.pb_TimerSet* %53, i32 0, i32 0
  store i32 %52, i32* %54, align 4
  %55 = load i32* %2, align 4
  %56 = icmp ne i32 %55, 0
  br i1 %56, label %57, label %63

; <label>:57                                      ; preds = %51
  %58 = load i32* %2, align 4
  %59 = zext i32 %58 to i64
  %60 = load %struct.pb_TimerSet** %1, align 8
  %61 = getelementptr inbounds %struct.pb_TimerSet* %60, i32 0, i32 4
  %62 = getelementptr inbounds [8 x %struct.pb_Timer]* %61, i32 0, i64 %59
  call void @pb_StartTimer(%struct.pb_Timer* %62)
  br label %63

; <label>:63                                      ; preds = %57, %51
  ret void
}

; Function Attrs: nounwind uwtable
define void @pb_PrintTimerSet(%struct.pb_TimerSet* %timers) #0 {
  %1 = alloca %struct.pb_TimerSet*, align 8
  %wall_end = alloca i64, align 8
  %t = alloca %struct.pb_Timer*, align 8
  %sub = alloca %struct.pb_SubTimer*, align 8
  %maxSubLength = alloca i32, align 4
  %categories = alloca [6 x i8*], align 16
  %maxCategoryLength = alloca i32, align 4
  %i = alloca i32, align 4
  %walltime = alloca float, align 4
  store %struct.pb_TimerSet* %timers, %struct.pb_TimerSet** %1, align 8
  %2 = call i64 @get_time()
  store i64 %2, i64* %wall_end, align 8
  %3 = load %struct.pb_TimerSet** %1, align 8
  %4 = getelementptr inbounds %struct.pb_TimerSet* %3, i32 0, i32 4
  %5 = getelementptr inbounds [8 x %struct.pb_Timer]* %4, i32 0, i32 0
  store %struct.pb_Timer* %5, %struct.pb_Timer** %t, align 8
  store %struct.pb_SubTimer* null, %struct.pb_SubTimer** %sub, align 8
  %6 = bitcast [6 x i8*]* %categories to i8*
  call void @llvm.memset.p0i8.i64(i8* %6, i8 0, i64 48, i32 16, i1 false)
  %7 = bitcast i8* %6 to [6 x i8*]*
  %8 = getelementptr [6 x i8*]* %7, i32 0, i32 0
  store i8* getelementptr inbounds ([3 x i8]* @.str13, i32 0, i32 0), i8** %8
  %9 = getelementptr [6 x i8*]* %7, i32 0, i32 1
  store i8* getelementptr inbounds ([7 x i8]* @.str14, i32 0, i32 0), i8** %9
  %10 = getelementptr [6 x i8*]* %7, i32 0, i32 2
  store i8* getelementptr inbounds ([5 x i8]* @.str159, i32 0, i32 0), i8** %10
  %11 = getelementptr [6 x i8*]* %7, i32 0, i32 3
  store i8* getelementptr inbounds ([7 x i8]* @.str16, i32 0, i32 0), i8** %11
  %12 = getelementptr [6 x i8*]* %7, i32 0, i32 4
  store i8* getelementptr inbounds ([11 x i8]* @.str17, i32 0, i32 0), i8** %12
  %13 = getelementptr [6 x i8*]* %7, i32 0, i32 5
  store i8* getelementptr inbounds ([8 x i8]* @.str18, i32 0, i32 0), i8** %13
  store i32 10, i32* %maxCategoryLength, align 4
  store i32 1, i32* %i, align 4
  br label %14

; <label>:14                                      ; preds = %104, %0
  %15 = load i32* %i, align 4
  %16 = icmp slt i32 %15, 7
  br i1 %16, label %17, label %107

; <label>:17                                      ; preds = %14
  %18 = load i32* %i, align 4
  %19 = sext i32 %18 to i64
  %20 = load %struct.pb_Timer** %t, align 8
  %21 = getelementptr inbounds %struct.pb_Timer* %20, i64 %19
  %22 = call double @pb_GetElapsedTime(%struct.pb_Timer* %21)
  %23 = fcmp une double %22, 0.000000e+00
  br i1 %23, label %24, label %103

; <label>:24                                      ; preds = %17
  %25 = load i32* %i, align 4
  %26 = sub nsw i32 %25, 1
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds [6 x i8*]* %categories, i32 0, i64 %27
  %29 = load i8** %28, align 8
  %30 = load i32* %i, align 4
  %31 = sext i32 %30 to i64
  %32 = load %struct.pb_Timer** %t, align 8
  %33 = getelementptr inbounds %struct.pb_Timer* %32, i64 %31
  %34 = call double @pb_GetElapsedTime(%struct.pb_Timer* %33)
  %35 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str19, i32 0, i32 0), i32 10, i8* %29, double %34)
  %36 = load i32* %i, align 4
  %37 = sext i32 %36 to i64
  %38 = load %struct.pb_TimerSet** %1, align 8
  %39 = getelementptr inbounds %struct.pb_TimerSet* %38, i32 0, i32 5
  %40 = getelementptr inbounds [8 x %struct.pb_SubTimerList*]* %39, i32 0, i64 %37
  %41 = load %struct.pb_SubTimerList** %40, align 8
  %42 = icmp ne %struct.pb_SubTimerList* %41, null
  br i1 %42, label %43, label %102

; <label>:43                                      ; preds = %24
  %44 = load i32* %i, align 4
  %45 = sext i32 %44 to i64
  %46 = load %struct.pb_TimerSet** %1, align 8
  %47 = getelementptr inbounds %struct.pb_TimerSet* %46, i32 0, i32 5
  %48 = getelementptr inbounds [8 x %struct.pb_SubTimerList*]* %47, i32 0, i64 %45
  %49 = load %struct.pb_SubTimerList** %48, align 8
  %50 = getelementptr inbounds %struct.pb_SubTimerList* %49, i32 0, i32 1
  %51 = load %struct.pb_SubTimer** %50, align 8
  store %struct.pb_SubTimer* %51, %struct.pb_SubTimer** %sub, align 8
  store i32 0, i32* %maxSubLength, align 4
  br label %52

; <label>:52                                      ; preds = %69, %43
  %53 = load %struct.pb_SubTimer** %sub, align 8
  %54 = icmp ne %struct.pb_SubTimer* %53, null
  br i1 %54, label %55, label %73

; <label>:55                                      ; preds = %52
  %56 = load %struct.pb_SubTimer** %sub, align 8
  %57 = getelementptr inbounds %struct.pb_SubTimer* %56, i32 0, i32 0
  %58 = load i8** %57, align 8
  %59 = call i64 @strlen(i8* %58) #8
  %60 = load i32* %maxSubLength, align 4
  %61 = sext i32 %60 to i64
  %62 = icmp ugt i64 %59, %61
  br i1 %62, label %63, label %69

; <label>:63                                      ; preds = %55
  %64 = load %struct.pb_SubTimer** %sub, align 8
  %65 = getelementptr inbounds %struct.pb_SubTimer* %64, i32 0, i32 0
  %66 = load i8** %65, align 8
  %67 = call i64 @strlen(i8* %66) #8
  %68 = trunc i64 %67 to i32
  store i32 %68, i32* %maxSubLength, align 4
  br label %69

; <label>:69                                      ; preds = %63, %55
  %70 = load %struct.pb_SubTimer** %sub, align 8
  %71 = getelementptr inbounds %struct.pb_SubTimer* %70, i32 0, i32 2
  %72 = load %struct.pb_SubTimer** %71, align 8
  store %struct.pb_SubTimer* %72, %struct.pb_SubTimer** %sub, align 8
  br label %52

; <label>:73                                      ; preds = %52
  %74 = load i32* %maxSubLength, align 4
  %75 = icmp sle i32 %74, 10
  br i1 %75, label %76, label %77

; <label>:76                                      ; preds = %73
  store i32 10, i32* %maxSubLength, align 4
  br label %77

; <label>:77                                      ; preds = %76, %73
  %78 = load i32* %i, align 4
  %79 = sext i32 %78 to i64
  %80 = load %struct.pb_TimerSet** %1, align 8
  %81 = getelementptr inbounds %struct.pb_TimerSet* %80, i32 0, i32 5
  %82 = getelementptr inbounds [8 x %struct.pb_SubTimerList*]* %81, i32 0, i64 %79
  %83 = load %struct.pb_SubTimerList** %82, align 8
  %84 = getelementptr inbounds %struct.pb_SubTimerList* %83, i32 0, i32 1
  %85 = load %struct.pb_SubTimer** %84, align 8
  store %struct.pb_SubTimer* %85, %struct.pb_SubTimer** %sub, align 8
  br label %86

; <label>:86                                      ; preds = %89, %77
  %87 = load %struct.pb_SubTimer** %sub, align 8
  %88 = icmp ne %struct.pb_SubTimer* %87, null
  br i1 %88, label %89, label %101

; <label>:89                                      ; preds = %86
  %90 = load i32* %maxSubLength, align 4
  %91 = load %struct.pb_SubTimer** %sub, align 8
  %92 = getelementptr inbounds %struct.pb_SubTimer* %91, i32 0, i32 0
  %93 = load i8** %92, align 8
  %94 = load %struct.pb_SubTimer** %sub, align 8
  %95 = getelementptr inbounds %struct.pb_SubTimer* %94, i32 0, i32 1
  %96 = call double @pb_GetElapsedTime(%struct.pb_Timer* %95)
  %97 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str20, i32 0, i32 0), i32 %90, i8* %93, double %96)
  %98 = load %struct.pb_SubTimer** %sub, align 8
  %99 = getelementptr inbounds %struct.pb_SubTimer* %98, i32 0, i32 2
  %100 = load %struct.pb_SubTimer** %99, align 8
  store %struct.pb_SubTimer* %100, %struct.pb_SubTimer** %sub, align 8
  br label %86

; <label>:101                                     ; preds = %86
  br label %102

; <label>:102                                     ; preds = %101, %24
  br label %103

; <label>:103                                     ; preds = %102, %17
  br label %104

; <label>:104                                     ; preds = %103
  %105 = load i32* %i, align 4
  %106 = add nsw i32 %105, 1
  store i32 %106, i32* %i, align 4
  br label %14

; <label>:107                                     ; preds = %14
  %108 = load %struct.pb_Timer** %t, align 8
  %109 = getelementptr inbounds %struct.pb_Timer* %108, i64 7
  %110 = call double @pb_GetElapsedTime(%struct.pb_Timer* %109)
  %111 = fcmp une double %110, 0.000000e+00
  br i1 %111, label %112, label %117

; <label>:112                                     ; preds = %107
  %113 = load %struct.pb_Timer** %t, align 8
  %114 = getelementptr inbounds %struct.pb_Timer* %113, i64 7
  %115 = call double @pb_GetElapsedTime(%struct.pb_Timer* %114)
  %116 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([24 x i8]* @.str21, i32 0, i32 0), double %115)
  br label %117

; <label>:117                                     ; preds = %112, %107
  %118 = load i64* %wall_end, align 8
  %119 = load %struct.pb_TimerSet** %1, align 8
  %120 = getelementptr inbounds %struct.pb_TimerSet* %119, i32 0, i32 3
  %121 = load i64* %120, align 8
  %122 = sub i64 %118, %121
  %123 = uitofp i64 %122 to double
  %124 = fdiv double %123, 1.000000e+06
  %125 = fptrunc double %124 to float
  store float %125, float* %walltime, align 4
  %126 = load float* %walltime, align 4
  %127 = fpext float %126 to double
  %128 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str22, i32 0, i32 0), double %127)
  ret void
}

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #5

; Function Attrs: nounwind uwtable
define void @pb_DestroyTimerSet(%struct.pb_TimerSet* %timers) #0 {
  %1 = alloca %struct.pb_TimerSet*, align 8
  %event = alloca %struct.pb_async_time_marker_list**, align 8
  %next = alloca %struct.pb_async_time_marker_list**, align 8
  %i = alloca i32, align 4
  %subtimer = alloca %struct.pb_SubTimer*, align 8
  %prev = alloca %struct.pb_SubTimer*, align 8
  store %struct.pb_TimerSet* %timers, %struct.pb_TimerSet** %1, align 8
  %2 = load %struct.pb_TimerSet** %1, align 8
  %3 = getelementptr inbounds %struct.pb_TimerSet* %2, i32 0, i32 1
  store %struct.pb_async_time_marker_list** %3, %struct.pb_async_time_marker_list*** %event, align 8
  br label %4

; <label>:4                                       ; preds = %8, %0
  %5 = load %struct.pb_async_time_marker_list*** %event, align 8
  %6 = load %struct.pb_async_time_marker_list** %5, align 8
  %7 = icmp ne %struct.pb_async_time_marker_list* %6, null
  br i1 %7, label %8, label %17

; <label>:8                                       ; preds = %4
  %9 = load %struct.pb_async_time_marker_list*** %event, align 8
  %10 = load %struct.pb_async_time_marker_list** %9, align 8
  %11 = getelementptr inbounds %struct.pb_async_time_marker_list* %10, i32 0, i32 3
  store %struct.pb_async_time_marker_list** %11, %struct.pb_async_time_marker_list*** %next, align 8
  %12 = load %struct.pb_async_time_marker_list*** %event, align 8
  %13 = load %struct.pb_async_time_marker_list** %12, align 8
  %14 = bitcast %struct.pb_async_time_marker_list* %13 to i8*
  call void @free(i8* %14) #5
  %15 = load %struct.pb_async_time_marker_list*** %event, align 8
  store %struct.pb_async_time_marker_list* null, %struct.pb_async_time_marker_list** %15, align 8
  %16 = load %struct.pb_async_time_marker_list*** %next, align 8
  store %struct.pb_async_time_marker_list** %16, %struct.pb_async_time_marker_list*** %event, align 8
  br label %4

; <label>:17                                      ; preds = %4
  store i32 0, i32* %i, align 4
  store i32 0, i32* %i, align 4
  br label %18

; <label>:18                                      ; preds = %60, %17
  %19 = load i32* %i, align 4
  %20 = icmp slt i32 %19, 8
  br i1 %20, label %21, label %63

; <label>:21                                      ; preds = %18
  %22 = load i32* %i, align 4
  %23 = sext i32 %22 to i64
  %24 = load %struct.pb_TimerSet** %1, align 8
  %25 = getelementptr inbounds %struct.pb_TimerSet* %24, i32 0, i32 5
  %26 = getelementptr inbounds [8 x %struct.pb_SubTimerList*]* %25, i32 0, i64 %23
  %27 = load %struct.pb_SubTimerList** %26, align 8
  %28 = icmp ne %struct.pb_SubTimerList* %27, null
  br i1 %28, label %29, label %59

; <label>:29                                      ; preds = %21
  %30 = load i32* %i, align 4
  %31 = sext i32 %30 to i64
  %32 = load %struct.pb_TimerSet** %1, align 8
  %33 = getelementptr inbounds %struct.pb_TimerSet* %32, i32 0, i32 5
  %34 = getelementptr inbounds [8 x %struct.pb_SubTimerList*]* %33, i32 0, i64 %31
  %35 = load %struct.pb_SubTimerList** %34, align 8
  %36 = getelementptr inbounds %struct.pb_SubTimerList* %35, i32 0, i32 1
  %37 = load %struct.pb_SubTimer** %36, align 8
  store %struct.pb_SubTimer* %37, %struct.pb_SubTimer** %subtimer, align 8
  store %struct.pb_SubTimer* null, %struct.pb_SubTimer** %prev, align 8
  br label %38

; <label>:38                                      ; preds = %41, %29
  %39 = load %struct.pb_SubTimer** %subtimer, align 8
  %40 = icmp ne %struct.pb_SubTimer* %39, null
  br i1 %40, label %41, label %51

; <label>:41                                      ; preds = %38
  %42 = load %struct.pb_SubTimer** %subtimer, align 8
  %43 = getelementptr inbounds %struct.pb_SubTimer* %42, i32 0, i32 0
  %44 = load i8** %43, align 8
  call void @free(i8* %44) #5
  %45 = load %struct.pb_SubTimer** %subtimer, align 8
  store %struct.pb_SubTimer* %45, %struct.pb_SubTimer** %prev, align 8
  %46 = load %struct.pb_SubTimer** %subtimer, align 8
  %47 = getelementptr inbounds %struct.pb_SubTimer* %46, i32 0, i32 2
  %48 = load %struct.pb_SubTimer** %47, align 8
  store %struct.pb_SubTimer* %48, %struct.pb_SubTimer** %subtimer, align 8
  %49 = load %struct.pb_SubTimer** %prev, align 8
  %50 = bitcast %struct.pb_SubTimer* %49 to i8*
  call void @free(i8* %50) #5
  br label %38

; <label>:51                                      ; preds = %38
  %52 = load i32* %i, align 4
  %53 = sext i32 %52 to i64
  %54 = load %struct.pb_TimerSet** %1, align 8
  %55 = getelementptr inbounds %struct.pb_TimerSet* %54, i32 0, i32 5
  %56 = getelementptr inbounds [8 x %struct.pb_SubTimerList*]* %55, i32 0, i64 %53
  %57 = load %struct.pb_SubTimerList** %56, align 8
  %58 = bitcast %struct.pb_SubTimerList* %57 to i8*
  call void @free(i8* %58) #5
  br label %59

; <label>:59                                      ; preds = %51, %21
  br label %60

; <label>:60                                      ; preds = %59
  %61 = load i32* %i, align 4
  %62 = add nsw i32 %61, 1
  store i32 %62, i32* %i, align 4
  br label %18

; <label>:63                                      ; preds = %18
  ret void
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #5

; Function Attrs: nounwind uwtable
define internal void @initialize_argparse(%struct.argparse* %ap, i32 %argc, i8** %argv) #0 {
  %1 = alloca %struct.argparse*, align 8
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store %struct.argparse* %ap, %struct.argparse** %1, align 8
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = load i32* %2, align 4
  %5 = load %struct.argparse** %1, align 8
  %6 = getelementptr inbounds %struct.argparse* %5, i32 0, i32 0
  store i32 %4, i32* %6, align 4
  %7 = load %struct.argparse** %1, align 8
  %8 = getelementptr inbounds %struct.argparse* %7, i32 0, i32 2
  store i32 0, i32* %8, align 4
  %9 = load i8*** %3, align 8
  %10 = load %struct.argparse** %1, align 8
  %11 = getelementptr inbounds %struct.argparse* %10, i32 0, i32 1
  store i8** %9, i8*** %11, align 8
  %12 = load %struct.argparse** %1, align 8
  %13 = getelementptr inbounds %struct.argparse* %12, i32 0, i32 4
  store i8** %9, i8*** %13, align 8
  %14 = load %struct.argparse** %1, align 8
  %15 = getelementptr inbounds %struct.argparse* %14, i32 0, i32 3
  store i8** %9, i8*** %15, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define internal i32 @is_end_of_arguments(%struct.argparse* %ap) #0 {
  %1 = alloca %struct.argparse*, align 8
  store %struct.argparse* %ap, %struct.argparse** %1, align 8
  %2 = load %struct.argparse** %1, align 8
  %3 = getelementptr inbounds %struct.argparse* %2, i32 0, i32 2
  %4 = load i32* %3, align 4
  %5 = load %struct.argparse** %1, align 8
  %6 = getelementptr inbounds %struct.argparse* %5, i32 0, i32 0
  %7 = load i32* %6, align 4
  %8 = icmp eq i32 %4, %7
  %9 = zext i1 %8 to i32
  ret i32 %9
}

; Function Attrs: nounwind uwtable
define internal i8* @get_argument(%struct.argparse* %ap) #0 {
  %1 = alloca %struct.argparse*, align 8
  store %struct.argparse* %ap, %struct.argparse** %1, align 8
  %2 = load %struct.argparse** %1, align 8
  %3 = getelementptr inbounds %struct.argparse* %2, i32 0, i32 3
  %4 = load i8*** %3, align 8
  %5 = load i8** %4, align 8
  ret i8* %5
}

; Function Attrs: nounwind uwtable
define internal void @delete_argument(%struct.argparse* %ap) #0 {
  %1 = alloca %struct.argparse*, align 8
  store %struct.argparse* %ap, %struct.argparse** %1, align 8
  %2 = load %struct.argparse** %1, align 8
  %3 = getelementptr inbounds %struct.argparse* %2, i32 0, i32 2
  %4 = load i32* %3, align 4
  %5 = load %struct.argparse** %1, align 8
  %6 = getelementptr inbounds %struct.argparse* %5, i32 0, i32 0
  %7 = load i32* %6, align 4
  %8 = icmp sge i32 %4, %7
  br i1 %8, label %9, label %12

; <label>:9                                       ; preds = %0
  %10 = load %struct._IO_FILE** @stderr, align 8
  %11 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([17 x i8]* @.str24, i32 0, i32 0))
  br label %12

; <label>:12                                      ; preds = %9, %0
  %13 = load %struct.argparse** %1, align 8
  %14 = getelementptr inbounds %struct.argparse* %13, i32 0, i32 0
  %15 = load i32* %14, align 4
  %16 = add nsw i32 %15, -1
  store i32 %16, i32* %14, align 4
  %17 = load %struct.argparse** %1, align 8
  %18 = getelementptr inbounds %struct.argparse* %17, i32 0, i32 3
  %19 = load i8*** %18, align 8
  %20 = getelementptr inbounds i8** %19, i32 1
  store i8** %20, i8*** %18, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define internal i8* @consume_argument(%struct.argparse* %ap) #0 {
  %1 = alloca %struct.argparse*, align 8
  %ret = alloca i8*, align 8
  store %struct.argparse* %ap, %struct.argparse** %1, align 8
  %2 = load %struct.argparse** %1, align 8
  %3 = call i8* @get_argument(%struct.argparse* %2)
  store i8* %3, i8** %ret, align 8
  %4 = load %struct.argparse** %1, align 8
  call void @delete_argument(%struct.argparse* %4)
  %5 = load i8** %ret, align 8
  ret i8* %5
}

; Function Attrs: nounwind uwtable
define internal i8** @read_string_array(i8* %in) #0 {
  %1 = alloca i8*, align 8
  %ret = alloca i8**, align 8
  %i = alloca i32, align 4
  %count = alloca i32, align 4
  %substring = alloca i8*, align 8
  %substring_end = alloca i8*, align 8
  %substring_length = alloca i32, align 4
  store i8* %in, i8** %1, align 8
  store i32 1, i32* %count, align 4
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %21, %0
  %3 = load i32* %i, align 4
  %4 = sext i32 %3 to i64
  %5 = load i8** %1, align 8
  %6 = getelementptr inbounds i8* %5, i64 %4
  %7 = load i8* %6, align 1
  %8 = icmp ne i8 %7, 0
  br i1 %8, label %9, label %24

; <label>:9                                       ; preds = %2
  %10 = load i32* %i, align 4
  %11 = sext i32 %10 to i64
  %12 = load i8** %1, align 8
  %13 = getelementptr inbounds i8* %12, i64 %11
  %14 = load i8* %13, align 1
  %15 = sext i8 %14 to i32
  %16 = icmp eq i32 %15, 44
  br i1 %16, label %17, label %20

; <label>:17                                      ; preds = %9
  %18 = load i32* %count, align 4
  %19 = add nsw i32 %18, 1
  store i32 %19, i32* %count, align 4
  br label %20

; <label>:20                                      ; preds = %17, %9
  br label %21

; <label>:21                                      ; preds = %20
  %22 = load i32* %i, align 4
  %23 = add nsw i32 %22, 1
  store i32 %23, i32* %i, align 4
  br label %2

; <label>:24                                      ; preds = %2
  %25 = load i32* %count, align 4
  %26 = add nsw i32 %25, 1
  %27 = sext i32 %26 to i64
  %28 = mul i64 %27, 8
  %29 = call noalias i8* @malloc(i64 %28) #5
  %30 = bitcast i8* %29 to i8**
  store i8** %30, i8*** %ret, align 8
  %31 = load i8** %1, align 8
  store i8* %31, i8** %substring, align 8
  store i32 0, i32* %i, align 4
  br label %32

; <label>:32                                      ; preds = %85, %24
  %33 = load i32* %i, align 4
  %34 = load i32* %count, align 4
  %35 = icmp slt i32 %33, %34
  br i1 %35, label %36, label %88

; <label>:36                                      ; preds = %32
  %37 = load i8** %substring, align 8
  store i8* %37, i8** %substring_end, align 8
  br label %38

; <label>:38                                      ; preds = %49, %36
  %39 = load i8** %substring_end, align 8
  %40 = load i8* %39, align 1
  %41 = sext i8 %40 to i32
  %42 = icmp ne i32 %41, 44
  br i1 %42, label %43, label %52

; <label>:43                                      ; preds = %38
  %44 = load i8** %substring_end, align 8
  %45 = load i8* %44, align 1
  %46 = sext i8 %45 to i32
  %47 = icmp ne i32 %46, 0
  br i1 %47, label %48, label %52

; <label>:48                                      ; preds = %43
  br label %49

; <label>:49                                      ; preds = %48
  %50 = load i8** %substring_end, align 8
  %51 = getelementptr inbounds i8* %50, i32 1
  store i8* %51, i8** %substring_end, align 8
  br label %38

; <label>:52                                      ; preds = %43, %38
  %53 = load i8** %substring_end, align 8
  %54 = load i8** %substring, align 8
  %55 = ptrtoint i8* %53 to i64
  %56 = ptrtoint i8* %54 to i64
  %57 = sub i64 %55, %56
  %58 = trunc i64 %57 to i32
  store i32 %58, i32* %substring_length, align 4
  %59 = load i32* %substring_length, align 4
  %60 = add nsw i32 %59, 1
  %61 = sext i32 %60 to i64
  %62 = call noalias i8* @malloc(i64 %61) #5
  %63 = load i32* %i, align 4
  %64 = sext i32 %63 to i64
  %65 = load i8*** %ret, align 8
  %66 = getelementptr inbounds i8** %65, i64 %64
  store i8* %62, i8** %66, align 8
  %67 = load i32* %i, align 4
  %68 = sext i32 %67 to i64
  %69 = load i8*** %ret, align 8
  %70 = getelementptr inbounds i8** %69, i64 %68
  %71 = load i8** %70, align 8
  %72 = load i8** %substring, align 8
  %73 = load i32* %substring_length, align 4
  %74 = sext i32 %73 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %71, i8* %72, i64 %74, i32 1, i1 false)
  %75 = load i32* %substring_length, align 4
  %76 = sext i32 %75 to i64
  %77 = load i32* %i, align 4
  %78 = sext i32 %77 to i64
  %79 = load i8*** %ret, align 8
  %80 = getelementptr inbounds i8** %79, i64 %78
  %81 = load i8** %80, align 8
  %82 = getelementptr inbounds i8* %81, i64 %76
  store i8 0, i8* %82, align 1
  %83 = load i8** %substring_end, align 8
  %84 = getelementptr inbounds i8* %83, i64 1
  store i8* %84, i8** %substring, align 8
  br label %85

; <label>:85                                      ; preds = %52
  %86 = load i32* %i, align 4
  %87 = add nsw i32 %86, 1
  store i32 %87, i32* %i, align 4
  br label %32

; <label>:88                                      ; preds = %32
  %89 = load i32* %i, align 4
  %90 = sext i32 %89 to i64
  %91 = load i8*** %ret, align 8
  %92 = getelementptr inbounds i8** %91, i64 %90
  store i8* null, i8** %92, align 8
  %93 = load i8*** %ret, align 8
  ret i8** %93
}

; Function Attrs: nounwind uwtable
define internal void @next_argument(%struct.argparse* %ap) #0 {
  %1 = alloca %struct.argparse*, align 8
  store %struct.argparse* %ap, %struct.argparse** %1, align 8
  %2 = load %struct.argparse** %1, align 8
  %3 = getelementptr inbounds %struct.argparse* %2, i32 0, i32 2
  %4 = load i32* %3, align 4
  %5 = load %struct.argparse** %1, align 8
  %6 = getelementptr inbounds %struct.argparse* %5, i32 0, i32 0
  %7 = load i32* %6, align 4
  %8 = icmp sge i32 %4, %7
  br i1 %8, label %9, label %12

; <label>:9                                       ; preds = %0
  %10 = load %struct._IO_FILE** @stderr, align 8
  %11 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([15 x i8]* @.str23, i32 0, i32 0))
  br label %12

; <label>:12                                      ; preds = %9, %0
  %13 = load %struct.argparse** %1, align 8
  %14 = getelementptr inbounds %struct.argparse* %13, i32 0, i32 3
  %15 = load i8*** %14, align 8
  %16 = getelementptr inbounds i8** %15, i32 1
  store i8** %16, i8*** %14, align 8
  %17 = load i8** %15, align 8
  %18 = load %struct.argparse** %1, align 8
  %19 = getelementptr inbounds %struct.argparse* %18, i32 0, i32 4
  %20 = load i8*** %19, align 8
  %21 = getelementptr inbounds i8** %20, i32 1
  store i8** %21, i8*** %19, align 8
  store i8* %17, i8** %20, align 8
  %22 = load %struct.argparse** %1, align 8
  %23 = getelementptr inbounds %struct.argparse* %22, i32 0, i32 2
  %24 = load i32* %23, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, i32* %23, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @finalize_argparse(%struct.argparse* %ap) #0 {
  %1 = alloca %struct.argparse*, align 8
  store %struct.argparse* %ap, %struct.argparse** %1, align 8
  br label %2

; <label>:2                                       ; preds = %20, %0
  %3 = load %struct.argparse** %1, align 8
  %4 = getelementptr inbounds %struct.argparse* %3, i32 0, i32 2
  %5 = load i32* %4, align 4
  %6 = load %struct.argparse** %1, align 8
  %7 = getelementptr inbounds %struct.argparse* %6, i32 0, i32 0
  %8 = load i32* %7, align 4
  %9 = icmp slt i32 %5, %8
  br i1 %9, label %10, label %25

; <label>:10                                      ; preds = %2
  %11 = load %struct.argparse** %1, align 8
  %12 = getelementptr inbounds %struct.argparse* %11, i32 0, i32 3
  %13 = load i8*** %12, align 8
  %14 = getelementptr inbounds i8** %13, i32 1
  store i8** %14, i8*** %12, align 8
  %15 = load i8** %13, align 8
  %16 = load %struct.argparse** %1, align 8
  %17 = getelementptr inbounds %struct.argparse* %16, i32 0, i32 4
  %18 = load i8*** %17, align 8
  %19 = getelementptr inbounds i8** %18, i32 1
  store i8** %19, i8*** %17, align 8
  store i8* %15, i8** %18, align 8
  br label %20

; <label>:20                                      ; preds = %10
  %21 = load %struct.argparse** %1, align 8
  %22 = getelementptr inbounds %struct.argparse* %21, i32 0, i32 2
  %23 = load i32* %22, align 4
  %24 = add nsw i32 %23, 1
  store i32 %24, i32* %22, align 4
  br label %2

; <label>:25                                      ; preds = %2
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @free_string_array(i8** %string_array) #0 {
  %1 = alloca i8**, align 8
  %p = alloca i8**, align 8
  store i8** %string_array, i8*** %1, align 8
  %2 = load i8*** %1, align 8
  %3 = icmp ne i8** %2, null
  br i1 %3, label %5, label %4

; <label>:4                                       ; preds = %0
  br label %20

; <label>:5                                       ; preds = %0
  %6 = load i8*** %1, align 8
  store i8** %6, i8*** %p, align 8
  br label %7

; <label>:7                                       ; preds = %14, %5
  %8 = load i8*** %p, align 8
  %9 = load i8** %8, align 8
  %10 = icmp ne i8* %9, null
  br i1 %10, label %11, label %17

; <label>:11                                      ; preds = %7
  %12 = load i8*** %p, align 8
  %13 = load i8** %12, align 8
  call void @free(i8* %13) #5
  br label %14

; <label>:14                                      ; preds = %11
  %15 = load i8*** %p, align 8
  %16 = getelementptr inbounds i8** %15, i32 1
  store i8** %16, i8*** %p, align 8
  br label %7

; <label>:17                                      ; preds = %7
  %18 = load i8*** %1, align 8
  %19 = bitcast i8** %18 to i8*
  call void @free(i8* %19) #5
  br label %20

; <label>:20                                      ; preds = %17, %4
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @accumulate_time(i64* %accum, i64 %start, i64 %end) #0 {
  %1 = alloca i64*, align 8
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  store i64* %accum, i64** %1, align 8
  store i64 %start, i64* %2, align 8
  store i64 %end, i64* %3, align 8
  %4 = load i64* %3, align 8
  %5 = load i64* %2, align 8
  %6 = sub i64 %4, %5
  %7 = load i64** %1, align 8
  %8 = load i64* %7, align 8
  %9 = add i64 %8, %6
  store i64 %9, i64* %7, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define internal i64 @get_time() #0 {
  %tv = alloca %struct.timeval, align 8
  %1 = call i32 @gettimeofday(%struct.timeval* %tv, %struct.timezone* null) #5
  %2 = getelementptr inbounds %struct.timeval* %tv, i32 0, i32 0
  %3 = load i64* %2, align 8
  %4 = mul nsw i64 %3, 1000000
  %5 = getelementptr inbounds %struct.timeval* %tv, i32 0, i32 1
  %6 = load i64* %5, align 8
  %7 = add nsw i64 %4, %6
  ret i64 %7
}

; Function Attrs: nounwind uwtable
define void @inputData(i8* %fName, i32* %len, i32* %depth, i32* %dim, i32* %nzcnt_len, i32* %pad, float** %h_data, i32** %h_indices, i32** %h_ptr, i32** %h_perm, i32** %h_nzcnt) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i32*, align 8
  %3 = alloca i32*, align 8
  %4 = alloca i32*, align 8
  %5 = alloca i32*, align 8
  %6 = alloca i32*, align 8
  %7 = alloca float**, align 8
  %8 = alloca i32**, align 8
  %9 = alloca i32**, align 8
  %10 = alloca i32**, align 8
  %11 = alloca i32**, align 8
  %fid = alloca %struct._IO_FILE*, align 8
  %_len = alloca i32, align 4
  %_depth = alloca i32, align 4
  %_dim = alloca i32, align 4
  %_pad = alloca i32, align 4
  %_nzcnt_len = alloca i32, align 4
  store i8* %fName, i8** %1, align 8
  store i32* %len, i32** %2, align 8
  store i32* %depth, i32** %3, align 8
  store i32* %dim, i32** %4, align 8
  store i32* %nzcnt_len, i32** %5, align 8
  store i32* %pad, i32** %6, align 8
  store float** %h_data, float*** %7, align 8
  store i32** %h_indices, i32*** %8, align 8
  store i32** %h_ptr, i32*** %9, align 8
  store i32** %h_perm, i32*** %10, align 8
  store i32** %h_nzcnt, i32*** %11, align 8
  %12 = load i8** %1, align 8
  %13 = call %struct._IO_FILE* @fopen(i8* %12, i8* getelementptr inbounds ([3 x i8]* @.str25, i32 0, i32 0))
  store %struct._IO_FILE* %13, %struct._IO_FILE** %fid, align 8
  %14 = load %struct._IO_FILE** %fid, align 8
  %15 = icmp eq %struct._IO_FILE* %14, null
  br i1 %15, label %16, label %19

; <label>:16                                      ; preds = %0
  %17 = load %struct._IO_FILE** @stderr, align 8
  %18 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([24 x i8]* @.str126, i32 0, i32 0))
  call void @exit(i32 -1) #7
  unreachable

; <label>:19                                      ; preds = %0
  %20 = load %struct._IO_FILE** %fid, align 8
  %21 = load i32** %2, align 8
  %22 = load i32** %3, align 8
  %23 = load i32** %5, align 8
  %24 = load i32** %4, align 8
  %25 = load i32** %6, align 8
  %26 = call i32 (%struct._IO_FILE*, i8*, ...)* @__isoc99_fscanf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([16 x i8]* @.str227, i32 0, i32 0), i32* %21, i32* %22, i32* %23, i32* %24, i32* %25)
  %27 = load i32** %2, align 8
  %28 = getelementptr inbounds i32* %27, i64 0
  %29 = load i32* %28, align 4
  store i32 %29, i32* %_len, align 4
  %30 = load i32** %3, align 8
  %31 = getelementptr inbounds i32* %30, i64 0
  %32 = load i32* %31, align 4
  store i32 %32, i32* %_depth, align 4
  %33 = load i32** %4, align 8
  %34 = getelementptr inbounds i32* %33, i64 0
  %35 = load i32* %34, align 4
  store i32 %35, i32* %_dim, align 4
  %36 = load i32** %6, align 8
  %37 = getelementptr inbounds i32* %36, i64 0
  %38 = load i32* %37, align 4
  store i32 %38, i32* %_pad, align 4
  %39 = load i32** %5, align 8
  %40 = getelementptr inbounds i32* %39, i64 0
  %41 = load i32* %40, align 4
  store i32 %41, i32* %_nzcnt_len, align 4
  %42 = load i32* %_len, align 4
  %43 = sext i32 %42 to i64
  %44 = mul i64 %43, 4
  %45 = call noalias i8* @malloc(i64 %44) #5
  %46 = bitcast i8* %45 to float*
  %47 = load float*** %7, align 8
  store float* %46, float** %47, align 8
  %48 = load float*** %7, align 8
  %49 = load float** %48, align 8
  %50 = bitcast float* %49 to i8*
  %51 = load i32* %_len, align 4
  %52 = sext i32 %51 to i64
  %53 = load %struct._IO_FILE** %fid, align 8
  %54 = call i64 @fread(i8* %50, i64 4, i64 %52, %struct._IO_FILE* %53)
  %55 = load i32* %_len, align 4
  %56 = sext i32 %55 to i64
  %57 = mul i64 %56, 4
  %58 = call noalias i8* @malloc(i64 %57) #5
  %59 = bitcast i8* %58 to i32*
  %60 = load i32*** %8, align 8
  store i32* %59, i32** %60, align 8
  %61 = load i32*** %8, align 8
  %62 = load i32** %61, align 8
  %63 = bitcast i32* %62 to i8*
  %64 = load i32* %_len, align 4
  %65 = sext i32 %64 to i64
  %66 = load %struct._IO_FILE** %fid, align 8
  %67 = call i64 @fread(i8* %63, i64 4, i64 %65, %struct._IO_FILE* %66)
  %68 = load i32* %_depth, align 4
  %69 = sext i32 %68 to i64
  %70 = mul i64 %69, 4
  %71 = call noalias i8* @malloc(i64 %70) #5
  %72 = bitcast i8* %71 to i32*
  %73 = load i32*** %9, align 8
  store i32* %72, i32** %73, align 8
  %74 = load i32*** %9, align 8
  %75 = load i32** %74, align 8
  %76 = bitcast i32* %75 to i8*
  %77 = load i32* %_depth, align 4
  %78 = sext i32 %77 to i64
  %79 = load %struct._IO_FILE** %fid, align 8
  %80 = call i64 @fread(i8* %76, i64 4, i64 %78, %struct._IO_FILE* %79)
  %81 = load i32* %_dim, align 4
  %82 = sext i32 %81 to i64
  %83 = mul i64 %82, 4
  %84 = call noalias i8* @malloc(i64 %83) #5
  %85 = bitcast i8* %84 to i32*
  %86 = load i32*** %10, align 8
  store i32* %85, i32** %86, align 8
  %87 = load i32*** %10, align 8
  %88 = load i32** %87, align 8
  %89 = bitcast i32* %88 to i8*
  %90 = load i32* %_dim, align 4
  %91 = sext i32 %90 to i64
  %92 = load %struct._IO_FILE** %fid, align 8
  %93 = call i64 @fread(i8* %89, i64 4, i64 %91, %struct._IO_FILE* %92)
  %94 = load i32* %_nzcnt_len, align 4
  %95 = sext i32 %94 to i64
  %96 = mul i64 %95, 4
  %97 = call noalias i8* @malloc(i64 %96) #5
  %98 = bitcast i8* %97 to i32*
  %99 = load i32*** %11, align 8
  store i32* %98, i32** %99, align 8
  %100 = load i32*** %11, align 8
  %101 = load i32** %100, align 8
  %102 = bitcast i32* %101 to i8*
  %103 = load i32* %_nzcnt_len, align 4
  %104 = sext i32 %103 to i64
  %105 = load %struct._IO_FILE** %fid, align 8
  %106 = call i64 @fread(i8* %102, i64 4, i64 %104, %struct._IO_FILE* %105)
  %107 = load %struct._IO_FILE** %fid, align 8
  %108 = call i32 @fclose(%struct._IO_FILE* %107)
  ret void
}

declare %struct._IO_FILE* @fopen(i8*, i8*) #1

declare i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #1

declare i64 @fread(i8*, i64, i64, %struct._IO_FILE*) #1

declare i32 @fclose(%struct._IO_FILE*) #1

; Function Attrs: nounwind uwtable
define void @input_vec(i8* %fName, float* %h_vec, i32 %dim) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca float*, align 8
  %3 = alloca i32, align 4
  %fid = alloca %struct._IO_FILE*, align 8
  store i8* %fName, i8** %1, align 8
  store float* %h_vec, float** %2, align 8
  store i32 %dim, i32* %3, align 4
  %4 = load i8** %1, align 8
  %5 = call %struct._IO_FILE* @fopen(i8* %4, i8* getelementptr inbounds ([3 x i8]* @.str25, i32 0, i32 0))
  store %struct._IO_FILE* %5, %struct._IO_FILE** %fid, align 8
  %6 = load float** %2, align 8
  %7 = bitcast float* %6 to i8*
  %8 = load i32* %3, align 4
  %9 = sext i32 %8 to i64
  %10 = load %struct._IO_FILE** %fid, align 8
  %11 = call i64 @fread(i8* %7, i64 4, i64 %9, %struct._IO_FILE* %10)
  %12 = load %struct._IO_FILE** %fid, align 8
  %13 = call i32 @fclose(%struct._IO_FILE* %12)
  ret void
}

; Function Attrs: nounwind uwtable
define void @outputData(i8* %fName, float* %h_Ax_vector, i32 %dim) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca float*, align 8
  %3 = alloca i32, align 4
  %fid = alloca %struct._IO_FILE*, align 8
  %tmp32 = alloca i32, align 4
  store i8* %fName, i8** %1, align 8
  store float* %h_Ax_vector, float** %2, align 8
  store i32 %dim, i32* %3, align 4
  %4 = load i8** %1, align 8
  %5 = call %struct._IO_FILE* @fopen(i8* %4, i8* getelementptr inbounds ([2 x i8]* @.str328, i32 0, i32 0))
  store %struct._IO_FILE* %5, %struct._IO_FILE** %fid, align 8
  %6 = load %struct._IO_FILE** %fid, align 8
  %7 = icmp eq %struct._IO_FILE* %6, null
  br i1 %7, label %8, label %11

; <label>:8                                       ; preds = %0
  %9 = load %struct._IO_FILE** @stderr, align 8
  %10 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([25 x i8]* @.str429, i32 0, i32 0))
  call void @exit(i32 -1) #7
  unreachable

; <label>:11                                      ; preds = %0
  %12 = load i32* %3, align 4
  store i32 %12, i32* %tmp32, align 4
  %13 = bitcast i32* %tmp32 to i8*
  %14 = load %struct._IO_FILE** %fid, align 8
  %15 = call i64 @fwrite(i8* %13, i64 4, i64 1, %struct._IO_FILE* %14)
  %16 = load float** %2, align 8
  %17 = bitcast float* %16 to i8*
  %18 = load i32* %3, align 4
  %19 = sext i32 %18 to i64
  %20 = load %struct._IO_FILE** %fid, align 8
  %21 = call i64 @fwrite(i8* %17, i64 4, i64 %19, %struct._IO_FILE* %20)
  %22 = load %struct._IO_FILE** %fid, align 8
  %23 = call i32 @fclose(%struct._IO_FILE* %22)
  ret void
}

declare i64 @fwrite(i8*, i64, i64, %struct._IO_FILE*) #1

; Function Attrs: nounwind uwtable
define i32 @mm_read_unsymmetric_sparse(i8* %fname, i32* %M_, i32* %N_, i32* %nz_, double** %val_, i32** %I_, i32** %J_) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i8*, align 8
  %3 = alloca i32*, align 8
  %4 = alloca i32*, align 8
  %5 = alloca i32*, align 8
  %6 = alloca double**, align 8
  %7 = alloca i32**, align 8
  %8 = alloca i32**, align 8
  %f = alloca %struct._IO_FILE*, align 8
  %matcode = alloca [4 x i8], align 1
  %M = alloca i32, align 4
  %N = alloca i32, align 4
  %nz = alloca i32, align 4
  %i = alloca i32, align 4
  %val = alloca double*, align 8
  %I = alloca i32*, align 8
  %J = alloca i32*, align 8
  store i8* %fname, i8** %2, align 8
  store i32* %M_, i32** %3, align 8
  store i32* %N_, i32** %4, align 8
  store i32* %nz_, i32** %5, align 8
  store double** %val_, double*** %6, align 8
  store i32** %I_, i32*** %7, align 8
  store i32** %J_, i32*** %8, align 8
  %9 = load i8** %2, align 8
  %10 = call %struct._IO_FILE* @fopen(i8* %9, i8* getelementptr inbounds ([2 x i8]* @.str34, i32 0, i32 0))
  store %struct._IO_FILE* %10, %struct._IO_FILE** %f, align 8
  %11 = icmp eq %struct._IO_FILE* %10, null
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %0
  store i32 -1, i32* %1
  br label %115

; <label>:13                                      ; preds = %0
  %14 = load %struct._IO_FILE** %f, align 8
  %15 = call i32 @mm_read_banner(%struct._IO_FILE* %14, [4 x i8]* %matcode)
  %16 = icmp ne i32 %15, 0
  br i1 %16, label %17, label %21

; <label>:17                                      ; preds = %13
  %18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([60 x i8]* @.str135, i32 0, i32 0))
  %19 = load i8** %2, align 8
  %20 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str236, i32 0, i32 0), i8* %19)
  store i32 -1, i32* %1
  br label %115

; <label>:21                                      ; preds = %13
  %22 = getelementptr inbounds [4 x i8]* %matcode, i32 0, i64 2
  %23 = load i8* %22, align 1
  %24 = sext i8 %23 to i32
  %25 = icmp eq i32 %24, 82
  br i1 %25, label %26, label %36

; <label>:26                                      ; preds = %21
  %27 = getelementptr inbounds [4 x i8]* %matcode, i32 0, i64 0
  %28 = load i8* %27, align 1
  %29 = sext i8 %28 to i32
  %30 = icmp eq i32 %29, 77
  br i1 %30, label %31, label %36

; <label>:31                                      ; preds = %26
  %32 = getelementptr inbounds [4 x i8]* %matcode, i32 0, i64 1
  %33 = load i8* %32, align 1
  %34 = sext i8 %33 to i32
  %35 = icmp eq i32 %34, 67
  br i1 %35, label %43, label %36

; <label>:36                                      ; preds = %31, %26, %21
  %37 = load %struct._IO_FILE** @stderr, align 8
  %38 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %37, i8* getelementptr inbounds ([42 x i8]* @.str337, i32 0, i32 0))
  %39 = load %struct._IO_FILE** @stderr, align 8
  %40 = getelementptr inbounds [4 x i8]* %matcode, i32 0, i32 0
  %41 = call i8* @mm_typecode_to_str(i8* %40)
  %42 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %39, i8* getelementptr inbounds ([26 x i8]* @.str438, i32 0, i32 0), i8* %41)
  store i32 -1, i32* %1
  br label %115

; <label>:43                                      ; preds = %31
  %44 = load %struct._IO_FILE** %f, align 8
  %45 = call i32 @mm_read_mtx_crd_size(%struct._IO_FILE* %44, i32* %M, i32* %N, i32* %nz)
  %46 = icmp ne i32 %45, 0
  br i1 %46, label %47, label %50

; <label>:47                                      ; preds = %43
  %48 = load %struct._IO_FILE** @stderr, align 8
  %49 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %48, i8* getelementptr inbounds ([57 x i8]* @.str539, i32 0, i32 0))
  store i32 -1, i32* %1
  br label %115

; <label>:50                                      ; preds = %43
  %51 = load i32* %M, align 4
  %52 = load i32** %3, align 8
  store i32 %51, i32* %52, align 4
  %53 = load i32* %N, align 4
  %54 = load i32** %4, align 8
  store i32 %53, i32* %54, align 4
  %55 = load i32* %nz, align 4
  %56 = load i32** %5, align 8
  store i32 %55, i32* %56, align 4
  %57 = load i32* %nz, align 4
  %58 = sext i32 %57 to i64
  %59 = mul i64 %58, 4
  %60 = call noalias i8* @malloc(i64 %59) #5
  %61 = bitcast i8* %60 to i32*
  store i32* %61, i32** %I, align 8
  %62 = load i32* %nz, align 4
  %63 = sext i32 %62 to i64
  %64 = mul i64 %63, 4
  %65 = call noalias i8* @malloc(i64 %64) #5
  %66 = bitcast i8* %65 to i32*
  store i32* %66, i32** %J, align 8
  %67 = load i32* %nz, align 4
  %68 = sext i32 %67 to i64
  %69 = mul i64 %68, 8
  %70 = call noalias i8* @malloc(i64 %69) #5
  %71 = bitcast i8* %70 to double*
  store double* %71, double** %val, align 8
  %72 = load double** %val, align 8
  %73 = load double*** %6, align 8
  store double* %72, double** %73, align 8
  %74 = load i32** %I, align 8
  %75 = load i32*** %7, align 8
  store i32* %74, i32** %75, align 8
  %76 = load i32** %J, align 8
  %77 = load i32*** %8, align 8
  store i32* %76, i32** %77, align 8
  store i32 0, i32* %i, align 4
  br label %78

; <label>:78                                      ; preds = %109, %50
  %79 = load i32* %i, align 4
  %80 = load i32* %nz, align 4
  %81 = icmp slt i32 %79, %80
  br i1 %81, label %82, label %112

; <label>:82                                      ; preds = %78
  %83 = load %struct._IO_FILE** %f, align 8
  %84 = load i32* %i, align 4
  %85 = sext i32 %84 to i64
  %86 = load i32** %I, align 8
  %87 = getelementptr inbounds i32* %86, i64 %85
  %88 = load i32* %i, align 4
  %89 = sext i32 %88 to i64
  %90 = load i32** %J, align 8
  %91 = getelementptr inbounds i32* %90, i64 %89
  %92 = load i32* %i, align 4
  %93 = sext i32 %92 to i64
  %94 = load double** %val, align 8
  %95 = getelementptr inbounds double* %94, i64 %93
  %96 = call i32 (%struct._IO_FILE*, i8*, ...)* @__isoc99_fscanf(%struct._IO_FILE* %83, i8* getelementptr inbounds ([11 x i8]* @.str640, i32 0, i32 0), i32* %87, i32* %91, double* %95)
  %97 = load i32* %i, align 4
  %98 = sext i32 %97 to i64
  %99 = load i32** %I, align 8
  %100 = getelementptr inbounds i32* %99, i64 %98
  %101 = load i32* %100, align 4
  %102 = add nsw i32 %101, -1
  store i32 %102, i32* %100, align 4
  %103 = load i32* %i, align 4
  %104 = sext i32 %103 to i64
  %105 = load i32** %J, align 8
  %106 = getelementptr inbounds i32* %105, i64 %104
  %107 = load i32* %106, align 4
  %108 = add nsw i32 %107, -1
  store i32 %108, i32* %106, align 4
  br label %109

; <label>:109                                     ; preds = %82
  %110 = load i32* %i, align 4
  %111 = add nsw i32 %110, 1
  store i32 %111, i32* %i, align 4
  br label %78

; <label>:112                                     ; preds = %78
  %113 = load %struct._IO_FILE** %f, align 8
  %114 = call i32 @fclose(%struct._IO_FILE* %113)
  store i32 0, i32* %1
  br label %115

; <label>:115                                     ; preds = %112, %47, %36, %17, %12
  %116 = load i32* %1
  ret i32 %116
}

; Function Attrs: nounwind uwtable
define i32 @mm_read_banner(%struct._IO_FILE* %f, [4 x i8]* %matcode) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct._IO_FILE*, align 8
  %3 = alloca [4 x i8]*, align 8
  %line = alloca [1025 x i8], align 16
  %banner = alloca [64 x i8], align 16
  %mtx = alloca [64 x i8], align 16
  %crd = alloca [64 x i8], align 16
  %data_type = alloca [64 x i8], align 16
  %storage_scheme = alloca [64 x i8], align 16
  %p = alloca i8*, align 8
  store %struct._IO_FILE* %f, %struct._IO_FILE** %2, align 8
  store [4 x i8]* %matcode, [4 x i8]** %3, align 8
  %4 = load [4 x i8]** %3, align 8
  %5 = getelementptr inbounds [4 x i8]* %4, i32 0, i64 2
  store i8 32, i8* %5, align 1
  %6 = load [4 x i8]** %3, align 8
  %7 = getelementptr inbounds [4 x i8]* %6, i32 0, i64 1
  store i8 32, i8* %7, align 1
  %8 = load [4 x i8]** %3, align 8
  %9 = getelementptr inbounds [4 x i8]* %8, i32 0, i64 0
  store i8 32, i8* %9, align 1
  %10 = load [4 x i8]** %3, align 8
  %11 = getelementptr inbounds [4 x i8]* %10, i32 0, i64 3
  store i8 71, i8* %11, align 1
  %12 = getelementptr inbounds [1025 x i8]* %line, i32 0, i32 0
  %13 = load %struct._IO_FILE** %2, align 8
  %14 = call i8* @fgets(i8* %12, i32 1025, %struct._IO_FILE* %13)
  %15 = icmp eq i8* %14, null
  br i1 %15, label %16, label %17

; <label>:16                                      ; preds = %0
  store i32 12, i32* %1
  br label %188

; <label>:17                                      ; preds = %0
  %18 = getelementptr inbounds [1025 x i8]* %line, i32 0, i32 0
  %19 = getelementptr inbounds [64 x i8]* %banner, i32 0, i32 0
  %20 = getelementptr inbounds [64 x i8]* %mtx, i32 0, i32 0
  %21 = getelementptr inbounds [64 x i8]* %crd, i32 0, i32 0
  %22 = getelementptr inbounds [64 x i8]* %data_type, i32 0, i32 0
  %23 = getelementptr inbounds [64 x i8]* %storage_scheme, i32 0, i32 0
  %24 = call i32 (i8*, i8*, ...)* @__isoc99_sscanf(i8* %18, i8* getelementptr inbounds ([15 x i8]* @.str741, i32 0, i32 0), i8* %19, i8* %20, i8* %21, i8* %22, i8* %23) #5
  %25 = icmp ne i32 %24, 5
  br i1 %25, label %26, label %27

; <label>:26                                      ; preds = %17
  store i32 12, i32* %1
  br label %188

; <label>:27                                      ; preds = %17
  %28 = getelementptr inbounds [64 x i8]* %mtx, i32 0, i32 0
  store i8* %28, i8** %p, align 8
  br label %29

; <label>:29                                      ; preds = %35, %27
  %30 = load i8** %p, align 8
  %31 = load i8* %30, align 1
  %32 = sext i8 %31 to i32
  %33 = icmp ne i32 %32, 0
  br i1 %33, label %34, label %44

; <label>:34                                      ; preds = %29
  br label %35

; <label>:35                                      ; preds = %34
  %36 = load i8** %p, align 8
  %37 = load i8* %36, align 1
  %38 = sext i8 %37 to i32
  %39 = call i32 @tolower(i32 %38) #5
  %40 = trunc i32 %39 to i8
  %41 = load i8** %p, align 8
  store i8 %40, i8* %41, align 1
  %42 = load i8** %p, align 8
  %43 = getelementptr inbounds i8* %42, i32 1
  store i8* %43, i8** %p, align 8
  br label %29

; <label>:44                                      ; preds = %29
  %45 = getelementptr inbounds [64 x i8]* %crd, i32 0, i32 0
  store i8* %45, i8** %p, align 8
  br label %46

; <label>:46                                      ; preds = %52, %44
  %47 = load i8** %p, align 8
  %48 = load i8* %47, align 1
  %49 = sext i8 %48 to i32
  %50 = icmp ne i32 %49, 0
  br i1 %50, label %51, label %61

; <label>:51                                      ; preds = %46
  br label %52

; <label>:52                                      ; preds = %51
  %53 = load i8** %p, align 8
  %54 = load i8* %53, align 1
  %55 = sext i8 %54 to i32
  %56 = call i32 @tolower(i32 %55) #5
  %57 = trunc i32 %56 to i8
  %58 = load i8** %p, align 8
  store i8 %57, i8* %58, align 1
  %59 = load i8** %p, align 8
  %60 = getelementptr inbounds i8* %59, i32 1
  store i8* %60, i8** %p, align 8
  br label %46

; <label>:61                                      ; preds = %46
  %62 = getelementptr inbounds [64 x i8]* %data_type, i32 0, i32 0
  store i8* %62, i8** %p, align 8
  br label %63

; <label>:63                                      ; preds = %69, %61
  %64 = load i8** %p, align 8
  %65 = load i8* %64, align 1
  %66 = sext i8 %65 to i32
  %67 = icmp ne i32 %66, 0
  br i1 %67, label %68, label %78

; <label>:68                                      ; preds = %63
  br label %69

; <label>:69                                      ; preds = %68
  %70 = load i8** %p, align 8
  %71 = load i8* %70, align 1
  %72 = sext i8 %71 to i32
  %73 = call i32 @tolower(i32 %72) #5
  %74 = trunc i32 %73 to i8
  %75 = load i8** %p, align 8
  store i8 %74, i8* %75, align 1
  %76 = load i8** %p, align 8
  %77 = getelementptr inbounds i8* %76, i32 1
  store i8* %77, i8** %p, align 8
  br label %63

; <label>:78                                      ; preds = %63
  %79 = getelementptr inbounds [64 x i8]* %storage_scheme, i32 0, i32 0
  store i8* %79, i8** %p, align 8
  br label %80

; <label>:80                                      ; preds = %86, %78
  %81 = load i8** %p, align 8
  %82 = load i8* %81, align 1
  %83 = sext i8 %82 to i32
  %84 = icmp ne i32 %83, 0
  br i1 %84, label %85, label %95

; <label>:85                                      ; preds = %80
  br label %86

; <label>:86                                      ; preds = %85
  %87 = load i8** %p, align 8
  %88 = load i8* %87, align 1
  %89 = sext i8 %88 to i32
  %90 = call i32 @tolower(i32 %89) #5
  %91 = trunc i32 %90 to i8
  %92 = load i8** %p, align 8
  store i8 %91, i8* %92, align 1
  %93 = load i8** %p, align 8
  %94 = getelementptr inbounds i8* %93, i32 1
  store i8* %94, i8** %p, align 8
  br label %80

; <label>:95                                      ; preds = %80
  %96 = getelementptr inbounds [64 x i8]* %banner, i32 0, i32 0
  %97 = call i32 @strncmp(i8* %96, i8* getelementptr inbounds ([15 x i8]* @.str842, i32 0, i32 0), i64 14) #8
  %98 = icmp ne i32 %97, 0
  br i1 %98, label %99, label %100

; <label>:99                                      ; preds = %95
  store i32 14, i32* %1
  br label %188

; <label>:100                                     ; preds = %95
  %101 = getelementptr inbounds [64 x i8]* %mtx, i32 0, i32 0
  %102 = call i32 @strcmp(i8* %101, i8* getelementptr inbounds ([7 x i8]* @.str943, i32 0, i32 0)) #8
  %103 = icmp ne i32 %102, 0
  br i1 %103, label %104, label %105

; <label>:104                                     ; preds = %100
  store i32 15, i32* %1
  br label %188

; <label>:105                                     ; preds = %100
  %106 = load [4 x i8]** %3, align 8
  %107 = getelementptr inbounds [4 x i8]* %106, i32 0, i64 0
  store i8 77, i8* %107, align 1
  %108 = getelementptr inbounds [64 x i8]* %crd, i32 0, i32 0
  %109 = call i32 @strcmp(i8* %108, i8* getelementptr inbounds ([11 x i8]* @.str1044, i32 0, i32 0)) #8
  %110 = icmp eq i32 %109, 0
  br i1 %110, label %111, label %114

; <label>:111                                     ; preds = %105
  %112 = load [4 x i8]** %3, align 8
  %113 = getelementptr inbounds [4 x i8]* %112, i32 0, i64 1
  store i8 67, i8* %113, align 1
  br label %123

; <label>:114                                     ; preds = %105
  %115 = getelementptr inbounds [64 x i8]* %crd, i32 0, i32 0
  %116 = call i32 @strcmp(i8* %115, i8* getelementptr inbounds ([6 x i8]* @.str1145, i32 0, i32 0)) #8
  %117 = icmp eq i32 %116, 0
  br i1 %117, label %118, label %121

; <label>:118                                     ; preds = %114
  %119 = load [4 x i8]** %3, align 8
  %120 = getelementptr inbounds [4 x i8]* %119, i32 0, i64 1
  store i8 65, i8* %120, align 1
  br label %122

; <label>:121                                     ; preds = %114
  store i32 15, i32* %1
  br label %188

; <label>:122                                     ; preds = %118
  br label %123

; <label>:123                                     ; preds = %122, %111
  %124 = getelementptr inbounds [64 x i8]* %data_type, i32 0, i32 0
  %125 = call i32 @strcmp(i8* %124, i8* getelementptr inbounds ([5 x i8]* @.str1246, i32 0, i32 0)) #8
  %126 = icmp eq i32 %125, 0
  br i1 %126, label %127, label %130

; <label>:127                                     ; preds = %123
  %128 = load [4 x i8]** %3, align 8
  %129 = getelementptr inbounds [4 x i8]* %128, i32 0, i64 2
  store i8 82, i8* %129, align 1
  br label %155

; <label>:130                                     ; preds = %123
  %131 = getelementptr inbounds [64 x i8]* %data_type, i32 0, i32 0
  %132 = call i32 @strcmp(i8* %131, i8* getelementptr inbounds ([8 x i8]* @.str1347, i32 0, i32 0)) #8
  %133 = icmp eq i32 %132, 0
  br i1 %133, label %134, label %137

; <label>:134                                     ; preds = %130
  %135 = load [4 x i8]** %3, align 8
  %136 = getelementptr inbounds [4 x i8]* %135, i32 0, i64 2
  store i8 67, i8* %136, align 1
  br label %154

; <label>:137                                     ; preds = %130
  %138 = getelementptr inbounds [64 x i8]* %data_type, i32 0, i32 0
  %139 = call i32 @strcmp(i8* %138, i8* getelementptr inbounds ([8 x i8]* @.str1448, i32 0, i32 0)) #8
  %140 = icmp eq i32 %139, 0
  br i1 %140, label %141, label %144

; <label>:141                                     ; preds = %137
  %142 = load [4 x i8]** %3, align 8
  %143 = getelementptr inbounds [4 x i8]* %142, i32 0, i64 2
  store i8 80, i8* %143, align 1
  br label %153

; <label>:144                                     ; preds = %137
  %145 = getelementptr inbounds [64 x i8]* %data_type, i32 0, i32 0
  %146 = call i32 @strcmp(i8* %145, i8* getelementptr inbounds ([8 x i8]* @.str1549, i32 0, i32 0)) #8
  %147 = icmp eq i32 %146, 0
  br i1 %147, label %148, label %151

; <label>:148                                     ; preds = %144
  %149 = load [4 x i8]** %3, align 8
  %150 = getelementptr inbounds [4 x i8]* %149, i32 0, i64 2
  store i8 73, i8* %150, align 1
  br label %152

; <label>:151                                     ; preds = %144
  store i32 15, i32* %1
  br label %188

; <label>:152                                     ; preds = %148
  br label %153

; <label>:153                                     ; preds = %152, %141
  br label %154

; <label>:154                                     ; preds = %153, %134
  br label %155

; <label>:155                                     ; preds = %154, %127
  %156 = getelementptr inbounds [64 x i8]* %storage_scheme, i32 0, i32 0
  %157 = call i32 @strcmp(i8* %156, i8* getelementptr inbounds ([8 x i8]* @.str1650, i32 0, i32 0)) #8
  %158 = icmp eq i32 %157, 0
  br i1 %158, label %159, label %162

; <label>:159                                     ; preds = %155
  %160 = load [4 x i8]** %3, align 8
  %161 = getelementptr inbounds [4 x i8]* %160, i32 0, i64 3
  store i8 71, i8* %161, align 1
  br label %187

; <label>:162                                     ; preds = %155
  %163 = getelementptr inbounds [64 x i8]* %storage_scheme, i32 0, i32 0
  %164 = call i32 @strcmp(i8* %163, i8* getelementptr inbounds ([10 x i8]* @.str1751, i32 0, i32 0)) #8
  %165 = icmp eq i32 %164, 0
  br i1 %165, label %166, label %169

; <label>:166                                     ; preds = %162
  %167 = load [4 x i8]** %3, align 8
  %168 = getelementptr inbounds [4 x i8]* %167, i32 0, i64 3
  store i8 83, i8* %168, align 1
  br label %186

; <label>:169                                     ; preds = %162
  %170 = getelementptr inbounds [64 x i8]* %storage_scheme, i32 0, i32 0
  %171 = call i32 @strcmp(i8* %170, i8* getelementptr inbounds ([10 x i8]* @.str1852, i32 0, i32 0)) #8
  %172 = icmp eq i32 %171, 0
  br i1 %172, label %173, label %176

; <label>:173                                     ; preds = %169
  %174 = load [4 x i8]** %3, align 8
  %175 = getelementptr inbounds [4 x i8]* %174, i32 0, i64 3
  store i8 72, i8* %175, align 1
  br label %185

; <label>:176                                     ; preds = %169
  %177 = getelementptr inbounds [64 x i8]* %storage_scheme, i32 0, i32 0
  %178 = call i32 @strcmp(i8* %177, i8* getelementptr inbounds ([15 x i8]* @.str1953, i32 0, i32 0)) #8
  %179 = icmp eq i32 %178, 0
  br i1 %179, label %180, label %183

; <label>:180                                     ; preds = %176
  %181 = load [4 x i8]** %3, align 8
  %182 = getelementptr inbounds [4 x i8]* %181, i32 0, i64 3
  store i8 75, i8* %182, align 1
  br label %184

; <label>:183                                     ; preds = %176
  store i32 15, i32* %1
  br label %188

; <label>:184                                     ; preds = %180
  br label %185

; <label>:185                                     ; preds = %184, %173
  br label %186

; <label>:186                                     ; preds = %185, %166
  br label %187

; <label>:187                                     ; preds = %186, %159
  store i32 0, i32* %1
  br label %188

; <label>:188                                     ; preds = %187, %183, %151, %121, %104, %99, %26, %16
  %189 = load i32* %1
  ret i32 %189
}

; Function Attrs: nounwind uwtable
define i8* @mm_typecode_to_str(i8* %matcode) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %buffer = alloca [1025 x i8], align 16
  %types = alloca [4 x i8*], align 16
  %error = alloca i32, align 4
  store i8* %matcode, i8** %2, align 8
  store i32 0, i32* %error, align 4
  %3 = load i8** %2, align 8
  %4 = getelementptr inbounds i8* %3, i64 0
  %5 = load i8* %4, align 1
  %6 = sext i8 %5 to i32
  %7 = icmp eq i32 %6, 77
  br i1 %7, label %8, label %10

; <label>:8                                       ; preds = %0
  %9 = getelementptr inbounds [4 x i8*]* %types, i32 0, i64 0
  store i8* getelementptr inbounds ([7 x i8]* @.str943, i32 0, i32 0), i8** %9, align 8
  br label %11

; <label>:10                                      ; preds = %0
  store i32 1, i32* %error, align 4
  br label %11

; <label>:11                                      ; preds = %10, %8
  %12 = load i8** %2, align 8
  %13 = getelementptr inbounds i8* %12, i64 1
  %14 = load i8* %13, align 1
  %15 = sext i8 %14 to i32
  %16 = icmp eq i32 %15, 67
  br i1 %16, label %17, label %19

; <label>:17                                      ; preds = %11
  %18 = getelementptr inbounds [4 x i8*]* %types, i32 0, i64 1
  store i8* getelementptr inbounds ([11 x i8]* @.str1044, i32 0, i32 0), i8** %18, align 8
  br label %29

; <label>:19                                      ; preds = %11
  %20 = load i8** %2, align 8
  %21 = getelementptr inbounds i8* %20, i64 1
  %22 = load i8* %21, align 1
  %23 = sext i8 %22 to i32
  %24 = icmp eq i32 %23, 65
  br i1 %24, label %25, label %27

; <label>:25                                      ; preds = %19
  %26 = getelementptr inbounds [4 x i8*]* %types, i32 0, i64 1
  store i8* getelementptr inbounds ([6 x i8]* @.str1145, i32 0, i32 0), i8** %26, align 8
  br label %28

; <label>:27                                      ; preds = %19
  store i8* null, i8** %1
  br label %114

; <label>:28                                      ; preds = %25
  br label %29

; <label>:29                                      ; preds = %28, %17
  %30 = load i8** %2, align 8
  %31 = getelementptr inbounds i8* %30, i64 2
  %32 = load i8* %31, align 1
  %33 = sext i8 %32 to i32
  %34 = icmp eq i32 %33, 82
  br i1 %34, label %35, label %37

; <label>:35                                      ; preds = %29
  %36 = getelementptr inbounds [4 x i8*]* %types, i32 0, i64 2
  store i8* getelementptr inbounds ([5 x i8]* @.str1246, i32 0, i32 0), i8** %36, align 8
  br label %65

; <label>:37                                      ; preds = %29
  %38 = load i8** %2, align 8
  %39 = getelementptr inbounds i8* %38, i64 2
  %40 = load i8* %39, align 1
  %41 = sext i8 %40 to i32
  %42 = icmp eq i32 %41, 67
  br i1 %42, label %43, label %45

; <label>:43                                      ; preds = %37
  %44 = getelementptr inbounds [4 x i8*]* %types, i32 0, i64 2
  store i8* getelementptr inbounds ([8 x i8]* @.str1347, i32 0, i32 0), i8** %44, align 8
  br label %64

; <label>:45                                      ; preds = %37
  %46 = load i8** %2, align 8
  %47 = getelementptr inbounds i8* %46, i64 2
  %48 = load i8* %47, align 1
  %49 = sext i8 %48 to i32
  %50 = icmp eq i32 %49, 80
  br i1 %50, label %51, label %53

; <label>:51                                      ; preds = %45
  %52 = getelementptr inbounds [4 x i8*]* %types, i32 0, i64 2
  store i8* getelementptr inbounds ([8 x i8]* @.str1448, i32 0, i32 0), i8** %52, align 8
  br label %63

; <label>:53                                      ; preds = %45
  %54 = load i8** %2, align 8
  %55 = getelementptr inbounds i8* %54, i64 2
  %56 = load i8* %55, align 1
  %57 = sext i8 %56 to i32
  %58 = icmp eq i32 %57, 73
  br i1 %58, label %59, label %61

; <label>:59                                      ; preds = %53
  %60 = getelementptr inbounds [4 x i8*]* %types, i32 0, i64 2
  store i8* getelementptr inbounds ([8 x i8]* @.str1549, i32 0, i32 0), i8** %60, align 8
  br label %62

; <label>:61                                      ; preds = %53
  store i8* null, i8** %1
  br label %114

; <label>:62                                      ; preds = %59
  br label %63

; <label>:63                                      ; preds = %62, %51
  br label %64

; <label>:64                                      ; preds = %63, %43
  br label %65

; <label>:65                                      ; preds = %64, %35
  %66 = load i8** %2, align 8
  %67 = getelementptr inbounds i8* %66, i64 3
  %68 = load i8* %67, align 1
  %69 = sext i8 %68 to i32
  %70 = icmp eq i32 %69, 71
  br i1 %70, label %71, label %73

; <label>:71                                      ; preds = %65
  %72 = getelementptr inbounds [4 x i8*]* %types, i32 0, i64 3
  store i8* getelementptr inbounds ([8 x i8]* @.str1650, i32 0, i32 0), i8** %72, align 8
  br label %101

; <label>:73                                      ; preds = %65
  %74 = load i8** %2, align 8
  %75 = getelementptr inbounds i8* %74, i64 3
  %76 = load i8* %75, align 1
  %77 = sext i8 %76 to i32
  %78 = icmp eq i32 %77, 83
  br i1 %78, label %79, label %81

; <label>:79                                      ; preds = %73
  %80 = getelementptr inbounds [4 x i8*]* %types, i32 0, i64 3
  store i8* getelementptr inbounds ([10 x i8]* @.str1751, i32 0, i32 0), i8** %80, align 8
  br label %100

; <label>:81                                      ; preds = %73
  %82 = load i8** %2, align 8
  %83 = getelementptr inbounds i8* %82, i64 3
  %84 = load i8* %83, align 1
  %85 = sext i8 %84 to i32
  %86 = icmp eq i32 %85, 72
  br i1 %86, label %87, label %89

; <label>:87                                      ; preds = %81
  %88 = getelementptr inbounds [4 x i8*]* %types, i32 0, i64 3
  store i8* getelementptr inbounds ([10 x i8]* @.str1852, i32 0, i32 0), i8** %88, align 8
  br label %99

; <label>:89                                      ; preds = %81
  %90 = load i8** %2, align 8
  %91 = getelementptr inbounds i8* %90, i64 3
  %92 = load i8* %91, align 1
  %93 = sext i8 %92 to i32
  %94 = icmp eq i32 %93, 75
  br i1 %94, label %95, label %97

; <label>:95                                      ; preds = %89
  %96 = getelementptr inbounds [4 x i8*]* %types, i32 0, i64 3
  store i8* getelementptr inbounds ([15 x i8]* @.str1953, i32 0, i32 0), i8** %96, align 8
  br label %98

; <label>:97                                      ; preds = %89
  store i8* null, i8** %1
  br label %114

; <label>:98                                      ; preds = %95
  br label %99

; <label>:99                                      ; preds = %98, %87
  br label %100

; <label>:100                                     ; preds = %99, %79
  br label %101

; <label>:101                                     ; preds = %100, %71
  %102 = getelementptr inbounds [1025 x i8]* %buffer, i32 0, i32 0
  %103 = getelementptr inbounds [4 x i8*]* %types, i32 0, i64 0
  %104 = load i8** %103, align 8
  %105 = getelementptr inbounds [4 x i8*]* %types, i32 0, i64 1
  %106 = load i8** %105, align 8
  %107 = getelementptr inbounds [4 x i8*]* %types, i32 0, i64 2
  %108 = load i8** %107, align 8
  %109 = getelementptr inbounds [4 x i8*]* %types, i32 0, i64 3
  %110 = load i8** %109, align 8
  %111 = call i32 (i8*, i8*, ...)* @sprintf(i8* %102, i8* getelementptr inbounds ([12 x i8]* @.str33, i32 0, i32 0), i8* %104, i8* %106, i8* %108, i8* %110) #5
  %112 = getelementptr inbounds [1025 x i8]* %buffer, i32 0, i32 0
  %113 = call i8* @mm_strdup(i8* %112)
  store i8* %113, i8** %1
  br label %114

; <label>:114                                     ; preds = %101, %97, %61, %27
  %115 = load i8** %1
  ret i8* %115
}

; Function Attrs: nounwind uwtable
define i32 @mm_read_mtx_crd_size(%struct._IO_FILE* %f, i32* %M, i32* %N, i32* %nz) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct._IO_FILE*, align 8
  %3 = alloca i32*, align 8
  %4 = alloca i32*, align 8
  %5 = alloca i32*, align 8
  %line = alloca [1025 x i8], align 16
  %num_items_read = alloca i32, align 4
  store %struct._IO_FILE* %f, %struct._IO_FILE** %2, align 8
  store i32* %M, i32** %3, align 8
  store i32* %N, i32** %4, align 8
  store i32* %nz, i32** %5, align 8
  %6 = load i32** %5, align 8
  store i32 0, i32* %6, align 4
  %7 = load i32** %4, align 8
  store i32 0, i32* %7, align 4
  %8 = load i32** %3, align 8
  store i32 0, i32* %8, align 4
  br label %9

; <label>:9                                       ; preds = %16, %0
  %10 = getelementptr inbounds [1025 x i8]* %line, i32 0, i32 0
  %11 = load %struct._IO_FILE** %2, align 8
  %12 = call i8* @fgets(i8* %10, i32 1025, %struct._IO_FILE* %11)
  %13 = icmp eq i8* %12, null
  br i1 %13, label %14, label %15

; <label>:14                                      ; preds = %9
  store i32 12, i32* %1
  br label %45

; <label>:15                                      ; preds = %9
  br label %16

; <label>:16                                      ; preds = %15
  %17 = getelementptr inbounds [1025 x i8]* %line, i32 0, i64 0
  %18 = load i8* %17, align 1
  %19 = sext i8 %18 to i32
  %20 = icmp eq i32 %19, 37
  br i1 %20, label %9, label %21

; <label>:21                                      ; preds = %16
  %22 = getelementptr inbounds [1025 x i8]* %line, i32 0, i32 0
  %23 = load i32** %3, align 8
  %24 = load i32** %4, align 8
  %25 = load i32** %5, align 8
  %26 = call i32 (i8*, i8*, ...)* @__isoc99_sscanf(i8* %22, i8* getelementptr inbounds ([9 x i8]* @.str2155, i32 0, i32 0), i32* %23, i32* %24, i32* %25) #5
  %27 = icmp eq i32 %26, 3
  br i1 %27, label %28, label %29

; <label>:28                                      ; preds = %21
  store i32 0, i32* %1
  br label %45

; <label>:29                                      ; preds = %21
  br label %30

; <label>:30                                      ; preds = %40, %29
  %31 = load %struct._IO_FILE** %2, align 8
  %32 = load i32** %3, align 8
  %33 = load i32** %4, align 8
  %34 = load i32** %5, align 8
  %35 = call i32 (%struct._IO_FILE*, i8*, ...)* @__isoc99_fscanf(%struct._IO_FILE* %31, i8* getelementptr inbounds ([9 x i8]* @.str2155, i32 0, i32 0), i32* %32, i32* %33, i32* %34)
  store i32 %35, i32* %num_items_read, align 4
  %36 = load i32* %num_items_read, align 4
  %37 = icmp eq i32 %36, -1
  br i1 %37, label %38, label %39

; <label>:38                                      ; preds = %30
  store i32 12, i32* %1
  br label %45

; <label>:39                                      ; preds = %30
  br label %40

; <label>:40                                      ; preds = %39
  %41 = load i32* %num_items_read, align 4
  %42 = icmp ne i32 %41, 3
  br i1 %42, label %30, label %43

; <label>:43                                      ; preds = %40
  br label %44

; <label>:44                                      ; preds = %43
  store i32 0, i32* %1
  br label %45

; <label>:45                                      ; preds = %44, %38, %28, %14
  %46 = load i32* %1
  ret i32 %46
}

; Function Attrs: nounwind uwtable
define i32 @mm_is_valid(i8* %matcode) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i8*, align 8
  store i8* %matcode, i8** %2, align 8
  %3 = load i8** %2, align 8
  %4 = getelementptr inbounds i8* %3, i64 0
  %5 = load i8* %4, align 1
  %6 = sext i8 %5 to i32
  %7 = icmp eq i32 %6, 77
  br i1 %7, label %9, label %8

; <label>:8                                       ; preds = %0
  store i32 0, i32* %1
  br label %55

; <label>:9                                       ; preds = %0
  %10 = load i8** %2, align 8
  %11 = getelementptr inbounds i8* %10, i64 1
  %12 = load i8* %11, align 1
  %13 = sext i8 %12 to i32
  %14 = icmp eq i32 %13, 65
  br i1 %14, label %15, label %22

; <label>:15                                      ; preds = %9
  %16 = load i8** %2, align 8
  %17 = getelementptr inbounds i8* %16, i64 2
  %18 = load i8* %17, align 1
  %19 = sext i8 %18 to i32
  %20 = icmp eq i32 %19, 80
  br i1 %20, label %21, label %22

; <label>:21                                      ; preds = %15
  store i32 0, i32* %1
  br label %55

; <label>:22                                      ; preds = %15, %9
  %23 = load i8** %2, align 8
  %24 = getelementptr inbounds i8* %23, i64 2
  %25 = load i8* %24, align 1
  %26 = sext i8 %25 to i32
  %27 = icmp eq i32 %26, 82
  br i1 %27, label %28, label %35

; <label>:28                                      ; preds = %22
  %29 = load i8** %2, align 8
  %30 = getelementptr inbounds i8* %29, i64 3
  %31 = load i8* %30, align 1
  %32 = sext i8 %31 to i32
  %33 = icmp eq i32 %32, 72
  br i1 %33, label %34, label %35

; <label>:34                                      ; preds = %28
  store i32 0, i32* %1
  br label %55

; <label>:35                                      ; preds = %28, %22
  %36 = load i8** %2, align 8
  %37 = getelementptr inbounds i8* %36, i64 2
  %38 = load i8* %37, align 1
  %39 = sext i8 %38 to i32
  %40 = icmp eq i32 %39, 80
  br i1 %40, label %41, label %54

; <label>:41                                      ; preds = %35
  %42 = load i8** %2, align 8
  %43 = getelementptr inbounds i8* %42, i64 3
  %44 = load i8* %43, align 1
  %45 = sext i8 %44 to i32
  %46 = icmp eq i32 %45, 72
  br i1 %46, label %53, label %47

; <label>:47                                      ; preds = %41
  %48 = load i8** %2, align 8
  %49 = getelementptr inbounds i8* %48, i64 3
  %50 = load i8* %49, align 1
  %51 = sext i8 %50 to i32
  %52 = icmp eq i32 %51, 75
  br i1 %52, label %53, label %54

; <label>:53                                      ; preds = %47, %41
  store i32 0, i32* %1
  br label %55

; <label>:54                                      ; preds = %47, %35
  store i32 1, i32* %1
  br label %55

; <label>:55                                      ; preds = %54, %53, %34, %21, %8
  %56 = load i32* %1
  ret i32 %56
}

declare i8* @fgets(i8*, i32, %struct._IO_FILE*) #1

; Function Attrs: nounwind
declare i32 @__isoc99_sscanf(i8*, i8*, ...) #3

; Function Attrs: nounwind
declare i32 @tolower(i32) #3

; Function Attrs: nounwind readonly
declare i32 @strncmp(i8*, i8*, i64) #4

; Function Attrs: nounwind uwtable
define i32 @mm_write_mtx_crd_size(%struct._IO_FILE* %f, i32 %M, i32 %N, i32 %nz) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct._IO_FILE*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store %struct._IO_FILE* %f, %struct._IO_FILE** %2, align 8
  store i32 %M, i32* %3, align 4
  store i32 %N, i32* %4, align 4
  store i32 %nz, i32* %5, align 4
  %6 = load %struct._IO_FILE** %2, align 8
  %7 = load i32* %3, align 4
  %8 = load i32* %4, align 4
  %9 = load i32* %5, align 4
  %10 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([10 x i8]* @.str2054, i32 0, i32 0), i32 %7, i32 %8, i32 %9)
  %11 = icmp ne i32 %10, 3
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %0
  store i32 17, i32* %1
  br label %14

; <label>:13                                      ; preds = %0
  store i32 0, i32* %1
  br label %14

; <label>:14                                      ; preds = %13, %12
  %15 = load i32* %1
  ret i32 %15
}

; Function Attrs: nounwind uwtable
define i32 @mm_read_mtx_array_size(%struct._IO_FILE* %f, i32* %M, i32* %N) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct._IO_FILE*, align 8
  %3 = alloca i32*, align 8
  %4 = alloca i32*, align 8
  %line = alloca [1025 x i8], align 16
  %num_items_read = alloca i32, align 4
  store %struct._IO_FILE* %f, %struct._IO_FILE** %2, align 8
  store i32* %M, i32** %3, align 8
  store i32* %N, i32** %4, align 8
  %5 = load i32** %4, align 8
  store i32 0, i32* %5, align 4
  %6 = load i32** %3, align 8
  store i32 0, i32* %6, align 4
  br label %7

; <label>:7                                       ; preds = %14, %0
  %8 = getelementptr inbounds [1025 x i8]* %line, i32 0, i32 0
  %9 = load %struct._IO_FILE** %2, align 8
  %10 = call i8* @fgets(i8* %8, i32 1025, %struct._IO_FILE* %9)
  %11 = icmp eq i8* %10, null
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %7
  store i32 12, i32* %1
  br label %41

; <label>:13                                      ; preds = %7
  br label %14

; <label>:14                                      ; preds = %13
  %15 = getelementptr inbounds [1025 x i8]* %line, i32 0, i64 0
  %16 = load i8* %15, align 1
  %17 = sext i8 %16 to i32
  %18 = icmp eq i32 %17, 37
  br i1 %18, label %7, label %19

; <label>:19                                      ; preds = %14
  %20 = getelementptr inbounds [1025 x i8]* %line, i32 0, i32 0
  %21 = load i32** %3, align 8
  %22 = load i32** %4, align 8
  %23 = call i32 (i8*, i8*, ...)* @__isoc99_sscanf(i8* %20, i8* getelementptr inbounds ([6 x i8]* @.str2256, i32 0, i32 0), i32* %21, i32* %22) #5
  %24 = icmp eq i32 %23, 2
  br i1 %24, label %25, label %26

; <label>:25                                      ; preds = %19
  store i32 0, i32* %1
  br label %41

; <label>:26                                      ; preds = %19
  br label %27

; <label>:27                                      ; preds = %36, %26
  %28 = load %struct._IO_FILE** %2, align 8
  %29 = load i32** %3, align 8
  %30 = load i32** %4, align 8
  %31 = call i32 (%struct._IO_FILE*, i8*, ...)* @__isoc99_fscanf(%struct._IO_FILE* %28, i8* getelementptr inbounds ([6 x i8]* @.str2256, i32 0, i32 0), i32* %29, i32* %30)
  store i32 %31, i32* %num_items_read, align 4
  %32 = load i32* %num_items_read, align 4
  %33 = icmp eq i32 %32, -1
  br i1 %33, label %34, label %35

; <label>:34                                      ; preds = %27
  store i32 12, i32* %1
  br label %41

; <label>:35                                      ; preds = %27
  br label %36

; <label>:36                                      ; preds = %35
  %37 = load i32* %num_items_read, align 4
  %38 = icmp ne i32 %37, 2
  br i1 %38, label %27, label %39

; <label>:39                                      ; preds = %36
  br label %40

; <label>:40                                      ; preds = %39
  store i32 0, i32* %1
  br label %41

; <label>:41                                      ; preds = %40, %34, %25, %12
  %42 = load i32* %1
  ret i32 %42
}

; Function Attrs: nounwind uwtable
define i32 @mm_write_mtx_array_size(%struct._IO_FILE* %f, i32 %M, i32 %N) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct._IO_FILE*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store %struct._IO_FILE* %f, %struct._IO_FILE** %2, align 8
  store i32 %M, i32* %3, align 4
  store i32 %N, i32* %4, align 4
  %5 = load %struct._IO_FILE** %2, align 8
  %6 = load i32* %3, align 4
  %7 = load i32* %4, align 4
  %8 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([7 x i8]* @.str2357, i32 0, i32 0), i32 %6, i32 %7)
  %9 = icmp ne i32 %8, 2
  br i1 %9, label %10, label %11

; <label>:10                                      ; preds = %0
  store i32 17, i32* %1
  br label %12

; <label>:11                                      ; preds = %0
  store i32 0, i32* %1
  br label %12

; <label>:12                                      ; preds = %11, %10
  %13 = load i32* %1
  ret i32 %13
}

; Function Attrs: nounwind uwtable
define i32 @mm_read_mtx_crd_data(%struct._IO_FILE* %f, i32 %M, i32 %N, i32 %nz, i32* %I, i32* %J, double* %val, i8* %matcode) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct._IO_FILE*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32*, align 8
  %7 = alloca i32*, align 8
  %8 = alloca double*, align 8
  %9 = alloca i8*, align 8
  %i = alloca i32, align 4
  store %struct._IO_FILE* %f, %struct._IO_FILE** %2, align 8
  store i32 %M, i32* %3, align 4
  store i32 %N, i32* %4, align 4
  store i32 %nz, i32* %5, align 4
  store i32* %I, i32** %6, align 8
  store i32* %J, i32** %7, align 8
  store double* %val, double** %8, align 8
  store i8* %matcode, i8** %9, align 8
  %10 = load i8** %9, align 8
  %11 = getelementptr inbounds i8* %10, i64 2
  %12 = load i8* %11, align 1
  %13 = sext i8 %12 to i32
  %14 = icmp eq i32 %13, 67
  br i1 %14, label %15, label %49

; <label>:15                                      ; preds = %0
  store i32 0, i32* %i, align 4
  br label %16

; <label>:16                                      ; preds = %45, %15
  %17 = load i32* %i, align 4
  %18 = load i32* %5, align 4
  %19 = icmp slt i32 %17, %18
  br i1 %19, label %20, label %48

; <label>:20                                      ; preds = %16
  %21 = load %struct._IO_FILE** %2, align 8
  %22 = load i32* %i, align 4
  %23 = sext i32 %22 to i64
  %24 = load i32** %6, align 8
  %25 = getelementptr inbounds i32* %24, i64 %23
  %26 = load i32* %i, align 4
  %27 = sext i32 %26 to i64
  %28 = load i32** %7, align 8
  %29 = getelementptr inbounds i32* %28, i64 %27
  %30 = load i32* %i, align 4
  %31 = mul nsw i32 2, %30
  %32 = sext i32 %31 to i64
  %33 = load double** %8, align 8
  %34 = getelementptr inbounds double* %33, i64 %32
  %35 = load i32* %i, align 4
  %36 = mul nsw i32 2, %35
  %37 = add nsw i32 %36, 1
  %38 = sext i32 %37 to i64
  %39 = load double** %8, align 8
  %40 = getelementptr inbounds double* %39, i64 %38
  %41 = call i32 (%struct._IO_FILE*, i8*, ...)* @__isoc99_fscanf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([14 x i8]* @.str2458, i32 0, i32 0), i32* %25, i32* %29, double* %34, double* %40)
  %42 = icmp ne i32 %41, 4
  br i1 %42, label %43, label %44

; <label>:43                                      ; preds = %20
  store i32 12, i32* %1
  br label %115

; <label>:44                                      ; preds = %20
  br label %45

; <label>:45                                      ; preds = %44
  %46 = load i32* %i, align 4
  %47 = add nsw i32 %46, 1
  store i32 %47, i32* %i, align 4
  br label %16

; <label>:48                                      ; preds = %16
  br label %114

; <label>:49                                      ; preds = %0
  %50 = load i8** %9, align 8
  %51 = getelementptr inbounds i8* %50, i64 2
  %52 = load i8* %51, align 1
  %53 = sext i8 %52 to i32
  %54 = icmp eq i32 %53, 82
  br i1 %54, label %55, label %82

; <label>:55                                      ; preds = %49
  store i32 0, i32* %i, align 4
  br label %56

; <label>:56                                      ; preds = %78, %55
  %57 = load i32* %i, align 4
  %58 = load i32* %5, align 4
  %59 = icmp slt i32 %57, %58
  br i1 %59, label %60, label %81

; <label>:60                                      ; preds = %56
  %61 = load %struct._IO_FILE** %2, align 8
  %62 = load i32* %i, align 4
  %63 = sext i32 %62 to i64
  %64 = load i32** %6, align 8
  %65 = getelementptr inbounds i32* %64, i64 %63
  %66 = load i32* %i, align 4
  %67 = sext i32 %66 to i64
  %68 = load i32** %7, align 8
  %69 = getelementptr inbounds i32* %68, i64 %67
  %70 = load i32* %i, align 4
  %71 = sext i32 %70 to i64
  %72 = load double** %8, align 8
  %73 = getelementptr inbounds double* %72, i64 %71
  %74 = call i32 (%struct._IO_FILE*, i8*, ...)* @__isoc99_fscanf(%struct._IO_FILE* %61, i8* getelementptr inbounds ([11 x i8]* @.str640, i32 0, i32 0), i32* %65, i32* %69, double* %73)
  %75 = icmp ne i32 %74, 3
  br i1 %75, label %76, label %77

; <label>:76                                      ; preds = %60
  store i32 12, i32* %1
  br label %115

; <label>:77                                      ; preds = %60
  br label %78

; <label>:78                                      ; preds = %77
  %79 = load i32* %i, align 4
  %80 = add nsw i32 %79, 1
  store i32 %80, i32* %i, align 4
  br label %56

; <label>:81                                      ; preds = %56
  br label %113

; <label>:82                                      ; preds = %49
  %83 = load i8** %9, align 8
  %84 = getelementptr inbounds i8* %83, i64 2
  %85 = load i8* %84, align 1
  %86 = sext i8 %85 to i32
  %87 = icmp eq i32 %86, 80
  br i1 %87, label %88, label %111

; <label>:88                                      ; preds = %82
  store i32 0, i32* %i, align 4
  br label %89

; <label>:89                                      ; preds = %107, %88
  %90 = load i32* %i, align 4
  %91 = load i32* %5, align 4
  %92 = icmp slt i32 %90, %91
  br i1 %92, label %93, label %110

; <label>:93                                      ; preds = %89
  %94 = load %struct._IO_FILE** %2, align 8
  %95 = load i32* %i, align 4
  %96 = sext i32 %95 to i64
  %97 = load i32** %6, align 8
  %98 = getelementptr inbounds i32* %97, i64 %96
  %99 = load i32* %i, align 4
  %100 = sext i32 %99 to i64
  %101 = load i32** %7, align 8
  %102 = getelementptr inbounds i32* %101, i64 %100
  %103 = call i32 (%struct._IO_FILE*, i8*, ...)* @__isoc99_fscanf(%struct._IO_FILE* %94, i8* getelementptr inbounds ([6 x i8]* @.str2256, i32 0, i32 0), i32* %98, i32* %102)
  %104 = icmp ne i32 %103, 2
  br i1 %104, label %105, label %106

; <label>:105                                     ; preds = %93
  store i32 12, i32* %1
  br label %115

; <label>:106                                     ; preds = %93
  br label %107

; <label>:107                                     ; preds = %106
  %108 = load i32* %i, align 4
  %109 = add nsw i32 %108, 1
  store i32 %109, i32* %i, align 4
  br label %89

; <label>:110                                     ; preds = %89
  br label %112

; <label>:111                                     ; preds = %82
  store i32 15, i32* %1
  br label %115

; <label>:112                                     ; preds = %110
  br label %113

; <label>:113                                     ; preds = %112, %81
  br label %114

; <label>:114                                     ; preds = %113, %48
  store i32 0, i32* %1
  br label %115

; <label>:115                                     ; preds = %114, %111, %105, %76, %43
  %116 = load i32* %1
  ret i32 %116
}

; Function Attrs: nounwind uwtable
define i32 @mm_read_mtx_crd_entry(%struct._IO_FILE* %f, i32* %I, i32* %J, double* %real, double* %imag, i8* %matcode) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct._IO_FILE*, align 8
  %3 = alloca i32*, align 8
  %4 = alloca i32*, align 8
  %5 = alloca double*, align 8
  %6 = alloca double*, align 8
  %7 = alloca i8*, align 8
  store %struct._IO_FILE* %f, %struct._IO_FILE** %2, align 8
  store i32* %I, i32** %3, align 8
  store i32* %J, i32** %4, align 8
  store double* %real, double** %5, align 8
  store double* %imag, double** %6, align 8
  store i8* %matcode, i8** %7, align 8
  %8 = load i8** %7, align 8
  %9 = getelementptr inbounds i8* %8, i64 2
  %10 = load i8* %9, align 1
  %11 = sext i8 %10 to i32
  %12 = icmp eq i32 %11, 67
  br i1 %12, label %13, label %23

; <label>:13                                      ; preds = %0
  %14 = load %struct._IO_FILE** %2, align 8
  %15 = load i32** %3, align 8
  %16 = load i32** %4, align 8
  %17 = load double** %5, align 8
  %18 = load double** %6, align 8
  %19 = call i32 (%struct._IO_FILE*, i8*, ...)* @__isoc99_fscanf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([14 x i8]* @.str2458, i32 0, i32 0), i32* %15, i32* %16, double* %17, double* %18)
  %20 = icmp ne i32 %19, 4
  br i1 %20, label %21, label %22

; <label>:21                                      ; preds = %13
  store i32 12, i32* %1
  br label %56

; <label>:22                                      ; preds = %13
  br label %55

; <label>:23                                      ; preds = %0
  %24 = load i8** %7, align 8
  %25 = getelementptr inbounds i8* %24, i64 2
  %26 = load i8* %25, align 1
  %27 = sext i8 %26 to i32
  %28 = icmp eq i32 %27, 82
  br i1 %28, label %29, label %38

; <label>:29                                      ; preds = %23
  %30 = load %struct._IO_FILE** %2, align 8
  %31 = load i32** %3, align 8
  %32 = load i32** %4, align 8
  %33 = load double** %5, align 8
  %34 = call i32 (%struct._IO_FILE*, i8*, ...)* @__isoc99_fscanf(%struct._IO_FILE* %30, i8* getelementptr inbounds ([11 x i8]* @.str640, i32 0, i32 0), i32* %31, i32* %32, double* %33)
  %35 = icmp ne i32 %34, 3
  br i1 %35, label %36, label %37

; <label>:36                                      ; preds = %29
  store i32 12, i32* %1
  br label %56

; <label>:37                                      ; preds = %29
  br label %54

; <label>:38                                      ; preds = %23
  %39 = load i8** %7, align 8
  %40 = getelementptr inbounds i8* %39, i64 2
  %41 = load i8* %40, align 1
  %42 = sext i8 %41 to i32
  %43 = icmp eq i32 %42, 80
  br i1 %43, label %44, label %52

; <label>:44                                      ; preds = %38
  %45 = load %struct._IO_FILE** %2, align 8
  %46 = load i32** %3, align 8
  %47 = load i32** %4, align 8
  %48 = call i32 (%struct._IO_FILE*, i8*, ...)* @__isoc99_fscanf(%struct._IO_FILE* %45, i8* getelementptr inbounds ([6 x i8]* @.str2256, i32 0, i32 0), i32* %46, i32* %47)
  %49 = icmp ne i32 %48, 2
  br i1 %49, label %50, label %51

; <label>:50                                      ; preds = %44
  store i32 12, i32* %1
  br label %56

; <label>:51                                      ; preds = %44
  br label %53

; <label>:52                                      ; preds = %38
  store i32 15, i32* %1
  br label %56

; <label>:53                                      ; preds = %51
  br label %54

; <label>:54                                      ; preds = %53, %37
  br label %55

; <label>:55                                      ; preds = %54, %22
  store i32 0, i32* %1
  br label %56

; <label>:56                                      ; preds = %55, %52, %50, %36, %21
  %57 = load i32* %1
  ret i32 %57
}

; Function Attrs: nounwind uwtable
define i32 @mm_read_mtx_crd(i8* %fname, i32* %M, i32* %N, i32* %nz, i32** %I, i32** %J, double** %val, [4 x i8]* %matcode) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i8*, align 8
  %3 = alloca i32*, align 8
  %4 = alloca i32*, align 8
  %5 = alloca i32*, align 8
  %6 = alloca i32**, align 8
  %7 = alloca i32**, align 8
  %8 = alloca double**, align 8
  %9 = alloca [4 x i8]*, align 8
  %ret_code = alloca i32, align 4
  %f = alloca %struct._IO_FILE*, align 8
  store i8* %fname, i8** %2, align 8
  store i32* %M, i32** %3, align 8
  store i32* %N, i32** %4, align 8
  store i32* %nz, i32** %5, align 8
  store i32** %I, i32*** %6, align 8
  store i32** %J, i32*** %7, align 8
  store double** %val, double*** %8, align 8
  store [4 x i8]* %matcode, [4 x i8]** %9, align 8
  %10 = load i8** %2, align 8
  %11 = call i32 @strcmp(i8* %10, i8* getelementptr inbounds ([6 x i8]* @.str2559, i32 0, i32 0)) #8
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %15

; <label>:13                                      ; preds = %0
  %14 = load %struct._IO_FILE** @stdin, align 8
  store %struct._IO_FILE* %14, %struct._IO_FILE** %f, align 8
  br label %21

; <label>:15                                      ; preds = %0
  %16 = load i8** %2, align 8
  %17 = call %struct._IO_FILE* @fopen(i8* %16, i8* getelementptr inbounds ([2 x i8]* @.str34, i32 0, i32 0))
  store %struct._IO_FILE* %17, %struct._IO_FILE** %f, align 8
  %18 = icmp eq %struct._IO_FILE* %17, null
  br i1 %18, label %19, label %20

; <label>:19                                      ; preds = %15
  store i32 11, i32* %1
  br label %179

; <label>:20                                      ; preds = %15
  br label %21

; <label>:21                                      ; preds = %20, %13
  %22 = load %struct._IO_FILE** %f, align 8
  %23 = load [4 x i8]** %9, align 8
  %24 = call i32 @mm_read_banner(%struct._IO_FILE* %22, [4 x i8]* %23)
  store i32 %24, i32* %ret_code, align 4
  %25 = icmp ne i32 %24, 0
  br i1 %25, label %26, label %28

; <label>:26                                      ; preds = %21
  %27 = load i32* %ret_code, align 4
  store i32 %27, i32* %1
  br label %179

; <label>:28                                      ; preds = %21
  %29 = load [4 x i8]** %9, align 8
  %30 = getelementptr inbounds [4 x i8]* %29, i32 0, i32 0
  %31 = call i32 @mm_is_valid(i8* %30)
  %32 = icmp ne i32 %31, 0
  br i1 %32, label %33, label %45

; <label>:33                                      ; preds = %28
  %34 = load [4 x i8]** %9, align 8
  %35 = getelementptr inbounds [4 x i8]* %34, i32 0, i64 1
  %36 = load i8* %35, align 1
  %37 = sext i8 %36 to i32
  %38 = icmp eq i32 %37, 67
  br i1 %38, label %39, label %45

; <label>:39                                      ; preds = %33
  %40 = load [4 x i8]** %9, align 8
  %41 = getelementptr inbounds [4 x i8]* %40, i32 0, i64 0
  %42 = load i8* %41, align 1
  %43 = sext i8 %42 to i32
  %44 = icmp eq i32 %43, 77
  br i1 %44, label %46, label %45

; <label>:45                                      ; preds = %39, %33, %28
  store i32 15, i32* %1
  br label %179

; <label>:46                                      ; preds = %39
  %47 = load %struct._IO_FILE** %f, align 8
  %48 = load i32** %3, align 8
  %49 = load i32** %4, align 8
  %50 = load i32** %5, align 8
  %51 = call i32 @mm_read_mtx_crd_size(%struct._IO_FILE* %47, i32* %48, i32* %49, i32* %50)
  store i32 %51, i32* %ret_code, align 4
  %52 = icmp ne i32 %51, 0
  br i1 %52, label %53, label %55

; <label>:53                                      ; preds = %46
  %54 = load i32* %ret_code, align 4
  store i32 %54, i32* %1
  br label %179

; <label>:55                                      ; preds = %46
  %56 = load i32** %5, align 8
  %57 = load i32* %56, align 4
  %58 = sext i32 %57 to i64
  %59 = mul i64 %58, 4
  %60 = call noalias i8* @malloc(i64 %59) #5
  %61 = bitcast i8* %60 to i32*
  %62 = load i32*** %6, align 8
  store i32* %61, i32** %62, align 8
  %63 = load i32** %5, align 8
  %64 = load i32* %63, align 4
  %65 = sext i32 %64 to i64
  %66 = mul i64 %65, 4
  %67 = call noalias i8* @malloc(i64 %66) #5
  %68 = bitcast i8* %67 to i32*
  %69 = load i32*** %7, align 8
  store i32* %68, i32** %69, align 8
  %70 = load double*** %8, align 8
  store double* null, double** %70, align 8
  %71 = load [4 x i8]** %9, align 8
  %72 = getelementptr inbounds [4 x i8]* %71, i32 0, i64 2
  %73 = load i8* %72, align 1
  %74 = sext i8 %73 to i32
  %75 = icmp eq i32 %74, 67
  br i1 %75, label %76, label %106

; <label>:76                                      ; preds = %55
  %77 = load i32** %5, align 8
  %78 = load i32* %77, align 4
  %79 = mul nsw i32 %78, 2
  %80 = sext i32 %79 to i64
  %81 = mul i64 %80, 8
  %82 = call noalias i8* @malloc(i64 %81) #5
  %83 = bitcast i8* %82 to double*
  %84 = load double*** %8, align 8
  store double* %83, double** %84, align 8
  %85 = load %struct._IO_FILE** %f, align 8
  %86 = load i32** %3, align 8
  %87 = load i32* %86, align 4
  %88 = load i32** %4, align 8
  %89 = load i32* %88, align 4
  %90 = load i32** %5, align 8
  %91 = load i32* %90, align 4
  %92 = load i32*** %6, align 8
  %93 = load i32** %92, align 8
  %94 = load i32*** %7, align 8
  %95 = load i32** %94, align 8
  %96 = load double*** %8, align 8
  %97 = load double** %96, align 8
  %98 = load [4 x i8]** %9, align 8
  %99 = getelementptr inbounds [4 x i8]* %98, i32 0, i32 0
  %100 = call i32 @mm_read_mtx_crd_data(%struct._IO_FILE* %85, i32 %87, i32 %89, i32 %91, i32* %93, i32* %95, double* %97, i8* %99)
  store i32 %100, i32* %ret_code, align 4
  %101 = load i32* %ret_code, align 4
  %102 = icmp ne i32 %101, 0
  br i1 %102, label %103, label %105

; <label>:103                                     ; preds = %76
  %104 = load i32* %ret_code, align 4
  store i32 %104, i32* %1
  br label %179

; <label>:105                                     ; preds = %76
  br label %171

; <label>:106                                     ; preds = %55
  %107 = load [4 x i8]** %9, align 8
  %108 = getelementptr inbounds [4 x i8]* %107, i32 0, i64 2
  %109 = load i8* %108, align 1
  %110 = sext i8 %109 to i32
  %111 = icmp eq i32 %110, 82
  br i1 %111, label %112, label %141

; <label>:112                                     ; preds = %106
  %113 = load i32** %5, align 8
  %114 = load i32* %113, align 4
  %115 = sext i32 %114 to i64
  %116 = mul i64 %115, 8
  %117 = call noalias i8* @malloc(i64 %116) #5
  %118 = bitcast i8* %117 to double*
  %119 = load double*** %8, align 8
  store double* %118, double** %119, align 8
  %120 = load %struct._IO_FILE** %f, align 8
  %121 = load i32** %3, align 8
  %122 = load i32* %121, align 4
  %123 = load i32** %4, align 8
  %124 = load i32* %123, align 4
  %125 = load i32** %5, align 8
  %126 = load i32* %125, align 4
  %127 = load i32*** %6, align 8
  %128 = load i32** %127, align 8
  %129 = load i32*** %7, align 8
  %130 = load i32** %129, align 8
  %131 = load double*** %8, align 8
  %132 = load double** %131, align 8
  %133 = load [4 x i8]** %9, align 8
  %134 = getelementptr inbounds [4 x i8]* %133, i32 0, i32 0
  %135 = call i32 @mm_read_mtx_crd_data(%struct._IO_FILE* %120, i32 %122, i32 %124, i32 %126, i32* %128, i32* %130, double* %132, i8* %134)
  store i32 %135, i32* %ret_code, align 4
  %136 = load i32* %ret_code, align 4
  %137 = icmp ne i32 %136, 0
  br i1 %137, label %138, label %140

; <label>:138                                     ; preds = %112
  %139 = load i32* %ret_code, align 4
  store i32 %139, i32* %1
  br label %179

; <label>:140                                     ; preds = %112
  br label %170

; <label>:141                                     ; preds = %106
  %142 = load [4 x i8]** %9, align 8
  %143 = getelementptr inbounds [4 x i8]* %142, i32 0, i64 2
  %144 = load i8* %143, align 1
  %145 = sext i8 %144 to i32
  %146 = icmp eq i32 %145, 80
  br i1 %146, label %147, label %169

; <label>:147                                     ; preds = %141
  %148 = load %struct._IO_FILE** %f, align 8
  %149 = load i32** %3, align 8
  %150 = load i32* %149, align 4
  %151 = load i32** %4, align 8
  %152 = load i32* %151, align 4
  %153 = load i32** %5, align 8
  %154 = load i32* %153, align 4
  %155 = load i32*** %6, align 8
  %156 = load i32** %155, align 8
  %157 = load i32*** %7, align 8
  %158 = load i32** %157, align 8
  %159 = load double*** %8, align 8
  %160 = load double** %159, align 8
  %161 = load [4 x i8]** %9, align 8
  %162 = getelementptr inbounds [4 x i8]* %161, i32 0, i32 0
  %163 = call i32 @mm_read_mtx_crd_data(%struct._IO_FILE* %148, i32 %150, i32 %152, i32 %154, i32* %156, i32* %158, double* %160, i8* %162)
  store i32 %163, i32* %ret_code, align 4
  %164 = load i32* %ret_code, align 4
  %165 = icmp ne i32 %164, 0
  br i1 %165, label %166, label %168

; <label>:166                                     ; preds = %147
  %167 = load i32* %ret_code, align 4
  store i32 %167, i32* %1
  br label %179

; <label>:168                                     ; preds = %147
  br label %169

; <label>:169                                     ; preds = %168, %141
  br label %170

; <label>:170                                     ; preds = %169, %140
  br label %171

; <label>:171                                     ; preds = %170, %105
  %172 = load %struct._IO_FILE** %f, align 8
  %173 = load %struct._IO_FILE** @stdin, align 8
  %174 = icmp ne %struct._IO_FILE* %172, %173
  br i1 %174, label %175, label %178

; <label>:175                                     ; preds = %171
  %176 = load %struct._IO_FILE** %f, align 8
  %177 = call i32 @fclose(%struct._IO_FILE* %176)
  br label %178

; <label>:178                                     ; preds = %175, %171
  store i32 0, i32* %1
  br label %179

; <label>:179                                     ; preds = %178, %166, %138, %103, %53, %45, %26, %19
  %180 = load i32* %1
  ret i32 %180
}

; Function Attrs: nounwind uwtable
define i32 @mm_write_banner(%struct._IO_FILE* %f, i8* %matcode) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct._IO_FILE*, align 8
  %3 = alloca i8*, align 8
  %str = alloca i8*, align 8
  %ret_code = alloca i32, align 4
  store %struct._IO_FILE* %f, %struct._IO_FILE** %2, align 8
  store i8* %matcode, i8** %3, align 8
  %4 = load i8** %3, align 8
  %5 = call i8* @mm_typecode_to_str(i8* %4)
  store i8* %5, i8** %str, align 8
  %6 = load %struct._IO_FILE** %2, align 8
  %7 = load i8** %str, align 8
  %8 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([7 x i8]* @.str2660, i32 0, i32 0), i8* getelementptr inbounds ([15 x i8]* @.str842, i32 0, i32 0), i8* %7)
  store i32 %8, i32* %ret_code, align 4
  %9 = load i8** %str, align 8
  call void @free(i8* %9) #5
  %10 = load i32* %ret_code, align 4
  %11 = icmp ne i32 %10, 2
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %0
  store i32 17, i32* %1
  br label %14

; <label>:13                                      ; preds = %0
  store i32 0, i32* %1
  br label %14

; <label>:14                                      ; preds = %13, %12
  %15 = load i32* %1
  ret i32 %15
}

; Function Attrs: nounwind uwtable
define i32 @mm_write_mtx_crd(i8* %fname, i32 %M, i32 %N, i32 %nz, i32* %I, i32* %J, double* %val, i8* %matcode) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32*, align 8
  %7 = alloca i32*, align 8
  %8 = alloca double*, align 8
  %9 = alloca i8*, align 8
  %f = alloca %struct._IO_FILE*, align 8
  %i = alloca i32, align 4
  store i8* %fname, i8** %2, align 8
  store i32 %M, i32* %3, align 4
  store i32 %N, i32* %4, align 4
  store i32 %nz, i32* %5, align 4
  store i32* %I, i32** %6, align 8
  store i32* %J, i32** %7, align 8
  store double* %val, double** %8, align 8
  store i8* %matcode, i8** %9, align 8
  %10 = load i8** %2, align 8
  %11 = call i32 @strcmp(i8* %10, i8* getelementptr inbounds ([7 x i8]* @.str27, i32 0, i32 0)) #8
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %15

; <label>:13                                      ; preds = %0
  %14 = load %struct._IO_FILE** @stdout, align 8
  store %struct._IO_FILE* %14, %struct._IO_FILE** %f, align 8
  br label %21

; <label>:15                                      ; preds = %0
  %16 = load i8** %2, align 8
  %17 = call %struct._IO_FILE* @fopen(i8* %16, i8* getelementptr inbounds ([2 x i8]* @.str28, i32 0, i32 0))
  store %struct._IO_FILE* %17, %struct._IO_FILE** %f, align 8
  %18 = icmp eq %struct._IO_FILE* %17, null
  br i1 %18, label %19, label %20

; <label>:19                                      ; preds = %15
  store i32 17, i32* %1
  br label %152

; <label>:20                                      ; preds = %15
  br label %21

; <label>:21                                      ; preds = %20, %13
  %22 = load %struct._IO_FILE** %f, align 8
  %23 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([4 x i8]* @.str29, i32 0, i32 0), i8* getelementptr inbounds ([15 x i8]* @.str842, i32 0, i32 0))
  %24 = load %struct._IO_FILE** %f, align 8
  %25 = load i8** %9, align 8
  %26 = call i8* @mm_typecode_to_str(i8* %25)
  %27 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([4 x i8]* @.str30, i32 0, i32 0), i8* %26)
  %28 = load %struct._IO_FILE** %f, align 8
  %29 = load i32* %3, align 4
  %30 = load i32* %4, align 4
  %31 = load i32* %5, align 4
  %32 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %28, i8* getelementptr inbounds ([10 x i8]* @.str2054, i32 0, i32 0), i32 %29, i32 %30, i32 %31)
  %33 = load i8** %9, align 8
  %34 = getelementptr inbounds i8* %33, i64 2
  %35 = load i8* %34, align 1
  %36 = sext i8 %35 to i32
  %37 = icmp eq i32 %36, 80
  br i1 %37, label %38, label %60

; <label>:38                                      ; preds = %21
  store i32 0, i32* %i, align 4
  br label %39

; <label>:39                                      ; preds = %56, %38
  %40 = load i32* %i, align 4
  %41 = load i32* %5, align 4
  %42 = icmp slt i32 %40, %41
  br i1 %42, label %43, label %59

; <label>:43                                      ; preds = %39
  %44 = load %struct._IO_FILE** %f, align 8
  %45 = load i32* %i, align 4
  %46 = sext i32 %45 to i64
  %47 = load i32** %6, align 8
  %48 = getelementptr inbounds i32* %47, i64 %46
  %49 = load i32* %48, align 4
  %50 = load i32* %i, align 4
  %51 = sext i32 %50 to i64
  %52 = load i32** %7, align 8
  %53 = getelementptr inbounds i32* %52, i64 %51
  %54 = load i32* %53, align 4
  %55 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %44, i8* getelementptr inbounds ([7 x i8]* @.str2357, i32 0, i32 0), i32 %49, i32 %54)
  br label %56

; <label>:56                                      ; preds = %43
  %57 = load i32* %i, align 4
  %58 = add nsw i32 %57, 1
  store i32 %58, i32* %i, align 4
  br label %39

; <label>:59                                      ; preds = %39
  br label %144

; <label>:60                                      ; preds = %21
  %61 = load i8** %9, align 8
  %62 = getelementptr inbounds i8* %61, i64 2
  %63 = load i8* %62, align 1
  %64 = sext i8 %63 to i32
  %65 = icmp eq i32 %64, 82
  br i1 %65, label %66, label %93

; <label>:66                                      ; preds = %60
  store i32 0, i32* %i, align 4
  br label %67

; <label>:67                                      ; preds = %89, %66
  %68 = load i32* %i, align 4
  %69 = load i32* %5, align 4
  %70 = icmp slt i32 %68, %69
  br i1 %70, label %71, label %92

; <label>:71                                      ; preds = %67
  %72 = load %struct._IO_FILE** %f, align 8
  %73 = load i32* %i, align 4
  %74 = sext i32 %73 to i64
  %75 = load i32** %6, align 8
  %76 = getelementptr inbounds i32* %75, i64 %74
  %77 = load i32* %76, align 4
  %78 = load i32* %i, align 4
  %79 = sext i32 %78 to i64
  %80 = load i32** %7, align 8
  %81 = getelementptr inbounds i32* %80, i64 %79
  %82 = load i32* %81, align 4
  %83 = load i32* %i, align 4
  %84 = sext i32 %83 to i64
  %85 = load double** %8, align 8
  %86 = getelementptr inbounds double* %85, i64 %84
  %87 = load double* %86, align 8
  %88 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %72, i8* getelementptr inbounds ([15 x i8]* @.str31, i32 0, i32 0), i32 %77, i32 %82, double %87)
  br label %89

; <label>:89                                      ; preds = %71
  %90 = load i32* %i, align 4
  %91 = add nsw i32 %90, 1
  store i32 %91, i32* %i, align 4
  br label %67

; <label>:92                                      ; preds = %67
  br label %143

; <label>:93                                      ; preds = %60
  %94 = load i8** %9, align 8
  %95 = getelementptr inbounds i8* %94, i64 2
  %96 = load i8* %95, align 1
  %97 = sext i8 %96 to i32
  %98 = icmp eq i32 %97, 67
  br i1 %98, label %99, label %134

; <label>:99                                      ; preds = %93
  store i32 0, i32* %i, align 4
  br label %100

; <label>:100                                     ; preds = %130, %99
  %101 = load i32* %i, align 4
  %102 = load i32* %5, align 4
  %103 = icmp slt i32 %101, %102
  br i1 %103, label %104, label %133

; <label>:104                                     ; preds = %100
  %105 = load %struct._IO_FILE** %f, align 8
  %106 = load i32* %i, align 4
  %107 = sext i32 %106 to i64
  %108 = load i32** %6, align 8
  %109 = getelementptr inbounds i32* %108, i64 %107
  %110 = load i32* %109, align 4
  %111 = load i32* %i, align 4
  %112 = sext i32 %111 to i64
  %113 = load i32** %7, align 8
  %114 = getelementptr inbounds i32* %113, i64 %112
  %115 = load i32* %114, align 4
  %116 = load i32* %i, align 4
  %117 = mul nsw i32 2, %116
  %118 = sext i32 %117 to i64
  %119 = load double** %8, align 8
  %120 = getelementptr inbounds double* %119, i64 %118
  %121 = load double* %120, align 8
  %122 = load i32* %i, align 4
  %123 = mul nsw i32 2, %122
  %124 = add nsw i32 %123, 1
  %125 = sext i32 %124 to i64
  %126 = load double** %8, align 8
  %127 = getelementptr inbounds double* %126, i64 %125
  %128 = load double* %127, align 8
  %129 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %105, i8* getelementptr inbounds ([23 x i8]* @.str32, i32 0, i32 0), i32 %110, i32 %115, double %121, double %128)
  br label %130

; <label>:130                                     ; preds = %104
  %131 = load i32* %i, align 4
  %132 = add nsw i32 %131, 1
  store i32 %132, i32* %i, align 4
  br label %100

; <label>:133                                     ; preds = %100
  br label %142

; <label>:134                                     ; preds = %93
  %135 = load %struct._IO_FILE** %f, align 8
  %136 = load %struct._IO_FILE** @stdout, align 8
  %137 = icmp ne %struct._IO_FILE* %135, %136
  br i1 %137, label %138, label %141

; <label>:138                                     ; preds = %134
  %139 = load %struct._IO_FILE** %f, align 8
  %140 = call i32 @fclose(%struct._IO_FILE* %139)
  br label %141

; <label>:141                                     ; preds = %138, %134
  store i32 15, i32* %1
  br label %152

; <label>:142                                     ; preds = %133
  br label %143

; <label>:143                                     ; preds = %142, %92
  br label %144

; <label>:144                                     ; preds = %143, %59
  %145 = load %struct._IO_FILE** %f, align 8
  %146 = load %struct._IO_FILE** @stdout, align 8
  %147 = icmp ne %struct._IO_FILE* %145, %146
  br i1 %147, label %148, label %151

; <label>:148                                     ; preds = %144
  %149 = load %struct._IO_FILE** %f, align 8
  %150 = call i32 @fclose(%struct._IO_FILE* %149)
  br label %151

; <label>:151                                     ; preds = %148, %144
  store i32 0, i32* %1
  br label %152

; <label>:152                                     ; preds = %151, %141, %19
  %153 = load i32* %1
  ret i32 %153
}

; Function Attrs: nounwind uwtable
define i8* @mm_strdup(i8* %s) #0 {
  %1 = alloca i8*, align 8
  %len = alloca i32, align 4
  %s2 = alloca i8*, align 8
  store i8* %s, i8** %1, align 8
  %2 = load i8** %1, align 8
  %3 = call i64 @strlen(i8* %2) #8
  %4 = trunc i64 %3 to i32
  store i32 %4, i32* %len, align 4
  %5 = load i32* %len, align 4
  %6 = add nsw i32 %5, 1
  %7 = sext i32 %6 to i64
  %8 = mul i64 %7, 1
  %9 = call noalias i8* @malloc(i64 %8) #5
  store i8* %9, i8** %s2, align 8
  %10 = load i8** %s2, align 8
  %11 = load i8** %1, align 8
  %12 = call i8* @strcpy(i8* %10, i8* %11) #5
  ret i8* %12
}

; Function Attrs: nounwind
declare i8* @strcpy(i8*, i8*) #3

; Function Attrs: nounwind uwtable
define i32 @sort_rows(i8* %a, i8* %b) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  store i8* %a, i8** %1, align 8
  store i8* %b, i8** %2, align 8
  %3 = load i8** %1, align 8
  %4 = bitcast i8* %3 to %struct._mat_entry*
  %5 = getelementptr inbounds %struct._mat_entry* %4, i32 0, i32 0
  %6 = load i32* %5, align 4
  %7 = load i8** %2, align 8
  %8 = bitcast i8* %7 to %struct._mat_entry*
  %9 = getelementptr inbounds %struct._mat_entry* %8, i32 0, i32 0
  %10 = load i32* %9, align 4
  %11 = sub nsw i32 %6, %10
  ret i32 %11
}

; Function Attrs: nounwind uwtable
define i32 @sort_cols(i8* %a, i8* %b) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  store i8* %a, i8** %1, align 8
  store i8* %b, i8** %2, align 8
  %3 = load i8** %1, align 8
  %4 = bitcast i8* %3 to %struct._mat_entry*
  %5 = getelementptr inbounds %struct._mat_entry* %4, i32 0, i32 1
  %6 = load i32* %5, align 4
  %7 = load i8** %2, align 8
  %8 = bitcast i8* %7 to %struct._mat_entry*
  %9 = getelementptr inbounds %struct._mat_entry* %8, i32 0, i32 1
  %10 = load i32* %9, align 4
  %11 = sub nsw i32 %6, %10
  ret i32 %11
}

; Function Attrs: nounwind uwtable
define i32 @sort_stats(i8* %a, i8* %b) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  store i8* %a, i8** %1, align 8
  store i8* %b, i8** %2, align 8
  %3 = load i8** %2, align 8
  %4 = bitcast i8* %3 to %struct._row_stats*
  %5 = getelementptr inbounds %struct._row_stats* %4, i32 0, i32 1
  %6 = load i32* %5, align 4
  %7 = load i8** %1, align 8
  %8 = bitcast i8* %7 to %struct._row_stats*
  %9 = getelementptr inbounds %struct._row_stats* %8, i32 0, i32 1
  %10 = load i32* %9, align 4
  %11 = sub nsw i32 %6, %10
  ret i32 %11
}

; Function Attrs: nounwind uwtable
define i32 @coo_to_jds(i8* %mtx_filename, i32 %pad_rows, i32 %warp_size, i32 %pack_size, i32 %mirrored, i32 %binary, i32 %debug_level, float** %data, i32** %data_row_ptr, i32** %nz_count, i32** %data_col_index, i32** %data_row_map, i32* %data_cols, i32* %dim, i32* %len, i32* %nz_count_len, i32* %data_ptr_len) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca float**, align 8
  %9 = alloca i32**, align 8
  %10 = alloca i32**, align 8
  %11 = alloca i32**, align 8
  %12 = alloca i32**, align 8
  %13 = alloca i32*, align 8
  %14 = alloca i32*, align 8
  %15 = alloca i32*, align 8
  %16 = alloca i32*, align 8
  %17 = alloca i32*, align 8
  %ret_code = alloca i32, align 4
  %matcode = alloca [4 x i8], align 1
  %f = alloca %struct._IO_FILE*, align 8
  %nz = alloca i32, align 4
  %i = alloca i32, align 4
  %val = alloca float*, align 8
  %entries = alloca %struct._mat_entry*, align 8
  %stats = alloca %struct._row_stats*, align 8
  %rows = alloca i32, align 4
  %cols = alloca i32, align 4
  %cur_i = alloca i32, align 4
  %irow = alloca i32, align 4
  %icol = alloca i32, align 4
  %istart = alloca i32, align 4
  %total_size = alloca i32, align 4
  %pad_to = alloca i32, align 4
  %total_padding = alloca i32, align 4
  %pack_to = alloca i32, align 4
  %idata = alloca i32, align 4
  %entry_index = alloca i32, align 4
  %j = alloca i32, align 4
  %ipack = alloca i32, align 4
  %entry = alloca %struct._mat_entry, align 4
  store i8* %mtx_filename, i8** %1, align 8
  store i32 %pad_rows, i32* %2, align 4
  store i32 %warp_size, i32* %3, align 4
  store i32 %pack_size, i32* %4, align 4
  store i32 %mirrored, i32* %5, align 4
  store i32 %binary, i32* %6, align 4
  store i32 %debug_level, i32* %7, align 4
  store float** %data, float*** %8, align 8
  store i32** %data_row_ptr, i32*** %9, align 8
  store i32** %nz_count, i32*** %10, align 8
  store i32** %data_col_index, i32*** %11, align 8
  store i32** %data_row_map, i32*** %12, align 8
  store i32* %data_cols, i32** %13, align 8
  store i32* %dim, i32** %14, align 8
  store i32* %len, i32** %15, align 8
  store i32* %nz_count_len, i32** %16, align 8
  store i32* %data_ptr_len, i32** %17, align 8
  %18 = load i8** %1, align 8
  %19 = call %struct._IO_FILE* @fopen(i8* %18, i8* getelementptr inbounds ([2 x i8]* @.str61, i32 0, i32 0))
  store %struct._IO_FILE* %19, %struct._IO_FILE** %f, align 8
  %20 = icmp eq %struct._IO_FILE* %19, null
  br i1 %20, label %21, label %22

; <label>:21                                      ; preds = %0
  call void @exit(i32 1) #7
  unreachable

; <label>:22                                      ; preds = %0
  %23 = load %struct._IO_FILE** %f, align 8
  %24 = call i32 @mm_read_banner(%struct._IO_FILE* %23, [4 x i8]* %matcode)
  %25 = icmp ne i32 %24, 0
  br i1 %25, label %26, label %28

; <label>:26                                      ; preds = %22
  %27 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([41 x i8]* @.str162, i32 0, i32 0))
  call void @exit(i32 1) #7
  unreachable

; <label>:28                                      ; preds = %22
  %29 = getelementptr inbounds [4 x i8]* %matcode, i32 0, i64 2
  %30 = load i8* %29, align 1
  %31 = sext i8 %30 to i32
  %32 = icmp eq i32 %31, 67
  br i1 %32, label %33, label %48

; <label>:33                                      ; preds = %28
  %34 = getelementptr inbounds [4 x i8]* %matcode, i32 0, i64 0
  %35 = load i8* %34, align 1
  %36 = sext i8 %35 to i32
  %37 = icmp eq i32 %36, 77
  br i1 %37, label %38, label %48

; <label>:38                                      ; preds = %33
  %39 = getelementptr inbounds [4 x i8]* %matcode, i32 0, i64 1
  %40 = load i8* %39, align 1
  %41 = sext i8 %40 to i32
  %42 = icmp eq i32 %41, 67
  br i1 %42, label %43, label %48

; <label>:43                                      ; preds = %38
  %44 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([42 x i8]* @.str263, i32 0, i32 0))
  %45 = getelementptr inbounds [4 x i8]* %matcode, i32 0, i32 0
  %46 = call i8* @mm_typecode_to_str(i8* %45)
  %47 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str364, i32 0, i32 0), i8* %46)
  call void @exit(i32 1) #7
  unreachable

; <label>:48                                      ; preds = %38, %33, %28
  %49 = load %struct._IO_FILE** %f, align 8
  %50 = call i32 @mm_read_mtx_crd_size(%struct._IO_FILE* %49, i32* %rows, i32* %cols, i32* %nz)
  store i32 %50, i32* %ret_code, align 4
  %51 = icmp ne i32 %50, 0
  br i1 %51, label %52, label %53

; <label>:52                                      ; preds = %48
  call void @exit(i32 1) #7
  unreachable

; <label>:53                                      ; preds = %48
  %54 = load i32* %rows, align 4
  %55 = load i32** %14, align 8
  store i32 %54, i32* %55, align 4
  %56 = load i32* %5, align 4
  %57 = icmp ne i32 %56, 0
  br i1 %57, label %58, label %65

; <label>:58                                      ; preds = %53
  %59 = load i32* %nz, align 4
  %60 = mul nsw i32 2, %59
  %61 = sext i32 %60 to i64
  %62 = mul i64 %61, 12
  %63 = call noalias i8* @malloc(i64 %62) #5
  %64 = bitcast i8* %63 to %struct._mat_entry*
  store %struct._mat_entry* %64, %struct._mat_entry** %entries, align 8
  br label %71

; <label>:65                                      ; preds = %53
  %66 = load i32* %nz, align 4
  %67 = sext i32 %66 to i64
  %68 = mul i64 %67, 12
  %69 = call noalias i8* @malloc(i64 %68) #5
  %70 = bitcast i8* %69 to %struct._mat_entry*
  store %struct._mat_entry* %70, %struct._mat_entry** %entries, align 8
  br label %71

; <label>:71                                      ; preds = %65, %58
  store i32 0, i32* %cur_i, align 4
  store i32 0, i32* %i, align 4
  br label %72

; <label>:72                                      ; preds = %187, %71
  %73 = load i32* %i, align 4
  %74 = load i32* %nz, align 4
  %75 = icmp slt i32 %73, %74
  br i1 %75, label %76, label %192

; <label>:76                                      ; preds = %72
  %77 = load i32* %6, align 4
  %78 = icmp ne i32 %77, 0
  br i1 %78, label %97, label %79

; <label>:79                                      ; preds = %76
  %80 = load %struct._IO_FILE** %f, align 8
  %81 = load i32* %cur_i, align 4
  %82 = sext i32 %81 to i64
  %83 = load %struct._mat_entry** %entries, align 8
  %84 = getelementptr inbounds %struct._mat_entry* %83, i64 %82
  %85 = getelementptr inbounds %struct._mat_entry* %84, i32 0, i32 0
  %86 = load i32* %cur_i, align 4
  %87 = sext i32 %86 to i64
  %88 = load %struct._mat_entry** %entries, align 8
  %89 = getelementptr inbounds %struct._mat_entry* %88, i64 %87
  %90 = getelementptr inbounds %struct._mat_entry* %89, i32 0, i32 1
  %91 = load i32* %cur_i, align 4
  %92 = sext i32 %91 to i64
  %93 = load %struct._mat_entry** %entries, align 8
  %94 = getelementptr inbounds %struct._mat_entry* %93, i64 %92
  %95 = getelementptr inbounds %struct._mat_entry* %94, i32 0, i32 2
  %96 = call i32 (%struct._IO_FILE*, i8*, ...)* @__isoc99_fscanf(%struct._IO_FILE* %80, i8* getelementptr inbounds ([10 x i8]* @.str465, i32 0, i32 0), i32* %85, i32* %90, float* %95)
  br label %115

; <label>:97                                      ; preds = %76
  %98 = load %struct._IO_FILE** %f, align 8
  %99 = load i32* %cur_i, align 4
  %100 = sext i32 %99 to i64
  %101 = load %struct._mat_entry** %entries, align 8
  %102 = getelementptr inbounds %struct._mat_entry* %101, i64 %100
  %103 = getelementptr inbounds %struct._mat_entry* %102, i32 0, i32 0
  %104 = load i32* %cur_i, align 4
  %105 = sext i32 %104 to i64
  %106 = load %struct._mat_entry** %entries, align 8
  %107 = getelementptr inbounds %struct._mat_entry* %106, i64 %105
  %108 = getelementptr inbounds %struct._mat_entry* %107, i32 0, i32 1
  %109 = call i32 (%struct._IO_FILE*, i8*, ...)* @__isoc99_fscanf(%struct._IO_FILE* %98, i8* getelementptr inbounds ([7 x i8]* @.str566, i32 0, i32 0), i32* %103, i32* %108)
  %110 = load i32* %cur_i, align 4
  %111 = sext i32 %110 to i64
  %112 = load %struct._mat_entry** %entries, align 8
  %113 = getelementptr inbounds %struct._mat_entry* %112, i64 %111
  %114 = getelementptr inbounds %struct._mat_entry* %113, i32 0, i32 2
  store float 1.000000e+00, float* %114, align 4
  br label %115

; <label>:115                                     ; preds = %97, %79
  %116 = load i32* %cur_i, align 4
  %117 = sext i32 %116 to i64
  %118 = load %struct._mat_entry** %entries, align 8
  %119 = getelementptr inbounds %struct._mat_entry* %118, i64 %117
  %120 = getelementptr inbounds %struct._mat_entry* %119, i32 0, i32 0
  %121 = load i32* %120, align 4
  %122 = add nsw i32 %121, -1
  store i32 %122, i32* %120, align 4
  %123 = load i32* %cur_i, align 4
  %124 = sext i32 %123 to i64
  %125 = load %struct._mat_entry** %entries, align 8
  %126 = getelementptr inbounds %struct._mat_entry* %125, i64 %124
  %127 = getelementptr inbounds %struct._mat_entry* %126, i32 0, i32 1
  %128 = load i32* %127, align 4
  %129 = add nsw i32 %128, -1
  store i32 %129, i32* %127, align 4
  %130 = load i32* %5, align 4
  %131 = icmp ne i32 %130, 0
  br i1 %131, label %132, label %186

; <label>:132                                     ; preds = %115
  %133 = load i32* %cur_i, align 4
  %134 = sext i32 %133 to i64
  %135 = load %struct._mat_entry** %entries, align 8
  %136 = getelementptr inbounds %struct._mat_entry* %135, i64 %134
  %137 = getelementptr inbounds %struct._mat_entry* %136, i32 0, i32 0
  %138 = load i32* %137, align 4
  %139 = load i32* %cur_i, align 4
  %140 = sext i32 %139 to i64
  %141 = load %struct._mat_entry** %entries, align 8
  %142 = getelementptr inbounds %struct._mat_entry* %141, i64 %140
  %143 = getelementptr inbounds %struct._mat_entry* %142, i32 0, i32 1
  %144 = load i32* %143, align 4
  %145 = icmp ne i32 %138, %144
  br i1 %145, label %146, label %185

; <label>:146                                     ; preds = %132
  %147 = load i32* %cur_i, align 4
  %148 = add nsw i32 %147, 1
  store i32 %148, i32* %cur_i, align 4
  %149 = load i32* %cur_i, align 4
  %150 = sub nsw i32 %149, 1
  %151 = sext i32 %150 to i64
  %152 = load %struct._mat_entry** %entries, align 8
  %153 = getelementptr inbounds %struct._mat_entry* %152, i64 %151
  %154 = getelementptr inbounds %struct._mat_entry* %153, i32 0, i32 2
  %155 = load float* %154, align 4
  %156 = load i32* %cur_i, align 4
  %157 = sext i32 %156 to i64
  %158 = load %struct._mat_entry** %entries, align 8
  %159 = getelementptr inbounds %struct._mat_entry* %158, i64 %157
  %160 = getelementptr inbounds %struct._mat_entry* %159, i32 0, i32 2
  store float %155, float* %160, align 4
  %161 = load i32* %cur_i, align 4
  %162 = sub nsw i32 %161, 1
  %163 = sext i32 %162 to i64
  %164 = load %struct._mat_entry** %entries, align 8
  %165 = getelementptr inbounds %struct._mat_entry* %164, i64 %163
  %166 = getelementptr inbounds %struct._mat_entry* %165, i32 0, i32 0
  %167 = load i32* %166, align 4
  %168 = load i32* %cur_i, align 4
  %169 = sext i32 %168 to i64
  %170 = load %struct._mat_entry** %entries, align 8
  %171 = getelementptr inbounds %struct._mat_entry* %170, i64 %169
  %172 = getelementptr inbounds %struct._mat_entry* %171, i32 0, i32 1
  store i32 %167, i32* %172, align 4
  %173 = load i32* %cur_i, align 4
  %174 = sub nsw i32 %173, 1
  %175 = sext i32 %174 to i64
  %176 = load %struct._mat_entry** %entries, align 8
  %177 = getelementptr inbounds %struct._mat_entry* %176, i64 %175
  %178 = getelementptr inbounds %struct._mat_entry* %177, i32 0, i32 1
  %179 = load i32* %178, align 4
  %180 = load i32* %cur_i, align 4
  %181 = sext i32 %180 to i64
  %182 = load %struct._mat_entry** %entries, align 8
  %183 = getelementptr inbounds %struct._mat_entry* %182, i64 %181
  %184 = getelementptr inbounds %struct._mat_entry* %183, i32 0, i32 0
  store i32 %179, i32* %184, align 4
  br label %185

; <label>:185                                     ; preds = %146, %132
  br label %186

; <label>:186                                     ; preds = %185, %115
  br label %187

; <label>:187                                     ; preds = %186
  %188 = load i32* %i, align 4
  %189 = add nsw i32 %188, 1
  store i32 %189, i32* %i, align 4
  %190 = load i32* %cur_i, align 4
  %191 = add nsw i32 %190, 1
  store i32 %191, i32* %cur_i, align 4
  br label %72

; <label>:192                                     ; preds = %72
  %193 = load i32* %cur_i, align 4
  store i32 %193, i32* %nz, align 4
  %194 = load i32* %7, align 4
  %195 = icmp sge i32 %194, 1
  br i1 %195, label %196, label %204

; <label>:196                                     ; preds = %192
  %197 = load i32* %rows, align 4
  %198 = load i32* %cols, align 4
  %199 = load i32* %nz, align 4
  %200 = load i32* %3, align 4
  %201 = load i32* %2, align 4
  %202 = load i32* %4, align 4
  %203 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([113 x i8]* @.str667, i32 0, i32 0), i32 %197, i32 %198, i32 %199, i32 %200, i32 %201, i32 %202)
  br label %204

; <label>:204                                     ; preds = %196, %192
  %205 = load %struct._IO_FILE** %f, align 8
  %206 = load %struct._IO_FILE** @stdin, align 8
  %207 = icmp ne %struct._IO_FILE* %205, %206
  br i1 %207, label %208, label %211

; <label>:208                                     ; preds = %204
  %209 = load %struct._IO_FILE** %f, align 8
  %210 = call i32 @fclose(%struct._IO_FILE* %209)
  br label %211

; <label>:211                                     ; preds = %208, %204
  store i32 0, i32* %icol, align 4
  store i32 0, i32* %istart, align 4
  store i32 0, i32* %total_size, align 4
  %212 = load %struct._mat_entry** %entries, align 8
  %213 = bitcast %struct._mat_entry* %212 to i8*
  %214 = load i32* %nz, align 4
  %215 = sext i32 %214 to i64
  call void @qsort(i8* %213, i64 %215, i64 12, i32 (i8*, i8*)* @sort_rows)
  %216 = load i32* %nz, align 4
  %217 = sub nsw i32 %216, 1
  %218 = sext i32 %217 to i64
  %219 = load %struct._mat_entry** %entries, align 8
  %220 = getelementptr inbounds %struct._mat_entry* %219, i64 %218
  %221 = getelementptr inbounds %struct._mat_entry* %220, i32 0, i32 0
  %222 = load i32* %221, align 4
  %223 = add nsw i32 %222, 1
  store i32 %223, i32* %rows, align 4
  %224 = load i32* %rows, align 4
  %225 = load i32* %3, align 4
  %226 = srem i32 %224, %225
  %227 = icmp ne i32 %226, 0
  br i1 %227, label %228, label %236

; <label>:228                                     ; preds = %211
  %229 = load i32* %3, align 4
  %230 = load i32* %rows, align 4
  %231 = load i32* %3, align 4
  %232 = srem i32 %230, %231
  %233 = sub nsw i32 %229, %232
  %234 = load i32* %rows, align 4
  %235 = add nsw i32 %234, %233
  store i32 %235, i32* %rows, align 4
  br label %236

; <label>:236                                     ; preds = %228, %211
  %237 = load i32* %rows, align 4
  %238 = sext i32 %237 to i64
  %239 = call noalias i8* @calloc(i64 %238, i64 16) #5
  %240 = bitcast i8* %239 to %struct._row_stats*
  store %struct._row_stats* %240, %struct._row_stats** %stats, align 8
  %241 = load i32* %rows, align 4
  %242 = sext i32 %241 to i64
  %243 = call noalias i8* @calloc(i64 %242, i64 4) #5
  %244 = bitcast i8* %243 to i32*
  %245 = load i32*** %12, align 8
  store i32* %244, i32** %245, align 8
  %246 = load %struct._mat_entry** %entries, align 8
  %247 = getelementptr inbounds %struct._mat_entry* %246, i64 0
  %248 = getelementptr inbounds %struct._mat_entry* %247, i32 0, i32 0
  %249 = load i32* %248, align 4
  store i32 %249, i32* %irow, align 4
  store i32 0, i32* %i, align 4
  br label %250

; <label>:250                                     ; preds = %311, %236
  %251 = load i32* %i, align 4
  %252 = load i32* %nz, align 4
  %253 = icmp slt i32 %251, %252
  br i1 %253, label %254, label %314

; <label>:254                                     ; preds = %250
  %255 = load i32* %i, align 4
  %256 = sext i32 %255 to i64
  %257 = load %struct._mat_entry** %entries, align 8
  %258 = getelementptr inbounds %struct._mat_entry* %257, i64 %256
  %259 = getelementptr inbounds %struct._mat_entry* %258, i32 0, i32 0
  %260 = load i32* %259, align 4
  %261 = load i32* %irow, align 4
  %262 = icmp ne i32 %260, %261
  br i1 %262, label %268, label %263

; <label>:263                                     ; preds = %254
  %264 = load i32* %i, align 4
  %265 = load i32* %nz, align 4
  %266 = sub nsw i32 %265, 1
  %267 = icmp eq i32 %264, %266
  br i1 %267, label %268, label %308

; <label>:268                                     ; preds = %263, %254
  %269 = load i32* %i, align 4
  %270 = load i32* %nz, align 4
  %271 = sub nsw i32 %270, 1
  %272 = icmp eq i32 %269, %271
  br i1 %272, label %273, label %276

; <label>:273                                     ; preds = %268
  %274 = load i32* %icol, align 4
  %275 = add nsw i32 %274, 1
  store i32 %275, i32* %icol, align 4
  br label %276

; <label>:276                                     ; preds = %273, %268
  %277 = load i32* %icol, align 4
  %278 = load i32* %irow, align 4
  %279 = sext i32 %278 to i64
  %280 = load %struct._row_stats** %stats, align 8
  %281 = getelementptr inbounds %struct._row_stats* %280, i64 %279
  %282 = getelementptr inbounds %struct._row_stats* %281, i32 0, i32 1
  store i32 %277, i32* %282, align 4
  %283 = load i32* %i, align 4
  %284 = sub nsw i32 %283, 1
  %285 = sext i32 %284 to i64
  %286 = load %struct._mat_entry** %entries, align 8
  %287 = getelementptr inbounds %struct._mat_entry* %286, i64 %285
  %288 = getelementptr inbounds %struct._mat_entry* %287, i32 0, i32 0
  %289 = load i32* %288, align 4
  %290 = load i32* %irow, align 4
  %291 = sext i32 %290 to i64
  %292 = load %struct._row_stats** %stats, align 8
  %293 = getelementptr inbounds %struct._row_stats* %292, i64 %291
  %294 = getelementptr inbounds %struct._row_stats* %293, i32 0, i32 0
  store i32 %289, i32* %294, align 4
  %295 = load i32* %istart, align 4
  %296 = load i32* %irow, align 4
  %297 = sext i32 %296 to i64
  %298 = load %struct._row_stats** %stats, align 8
  %299 = getelementptr inbounds %struct._row_stats* %298, i64 %297
  %300 = getelementptr inbounds %struct._row_stats* %299, i32 0, i32 2
  store i32 %295, i32* %300, align 4
  store i32 0, i32* %icol, align 4
  %301 = load i32* %i, align 4
  %302 = sext i32 %301 to i64
  %303 = load %struct._mat_entry** %entries, align 8
  %304 = getelementptr inbounds %struct._mat_entry* %303, i64 %302
  %305 = getelementptr inbounds %struct._mat_entry* %304, i32 0, i32 0
  %306 = load i32* %305, align 4
  store i32 %306, i32* %irow, align 4
  %307 = load i32* %i, align 4
  store i32 %307, i32* %istart, align 4
  br label %308

; <label>:308                                     ; preds = %276, %263
  %309 = load i32* %icol, align 4
  %310 = add nsw i32 %309, 1
  store i32 %310, i32* %icol, align 4
  br label %311

; <label>:311                                     ; preds = %308
  %312 = load i32* %i, align 4
  %313 = add nsw i32 %312, 1
  store i32 %313, i32* %i, align 4
  br label %250

; <label>:314                                     ; preds = %250
  %315 = load i32* %rows, align 4
  %316 = load i32* %3, align 4
  %317 = sdiv i32 %315, %316
  %318 = load i32* %rows, align 4
  %319 = load i32* %3, align 4
  %320 = srem i32 %318, %319
  %321 = add nsw i32 %317, %320
  %322 = load i32** %16, align 8
  store i32 %321, i32* %322, align 4
  %323 = load i32** %16, align 8
  %324 = load i32* %323, align 4
  %325 = sext i32 %324 to i64
  %326 = mul i64 %325, 4
  %327 = call noalias i8* @malloc(i64 %326) #5
  %328 = bitcast i8* %327 to i32*
  %329 = load i32*** %10, align 8
  store i32* %328, i32** %329, align 8
  %330 = load %struct._row_stats** %stats, align 8
  %331 = bitcast %struct._row_stats* %330 to i8*
  %332 = load i32* %rows, align 4
  %333 = sext i32 %332 to i64
  call void @qsort(i8* %331, i64 %333, i64 16, i32 (i8*, i8*)* @sort_stats)
  %334 = load i32* %7, align 4
  %335 = icmp sge i32 %334, 1
  br i1 %335, label %336, label %341

; <label>:336                                     ; preds = %314
  %337 = load i32* %rows, align 4
  %338 = load i32** %16, align 8
  %339 = load i32* %338, align 4
  %340 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str768, i32 0, i32 0), i32 %337, i32 %339)
  br label %341

; <label>:341                                     ; preds = %336, %314
  store i32 0, i32* %total_padding, align 4
  %342 = load i32* %4, align 4
  %343 = load i32* %2, align 4
  %344 = mul nsw i32 %343, %342
  store i32 %344, i32* %2, align 4
  store i32 0, i32* %i, align 4
  br label %345

; <label>:345                                     ; preds = %496, %341
  %346 = load i32* %i, align 4
  %347 = load i32* %rows, align 4
  %348 = icmp slt i32 %346, %347
  br i1 %348, label %349, label %499

; <label>:349                                     ; preds = %345
  %350 = load i32* %i, align 4
  %351 = sext i32 %350 to i64
  %352 = load %struct._row_stats** %stats, align 8
  %353 = getelementptr inbounds %struct._row_stats* %352, i64 %351
  %354 = getelementptr inbounds %struct._row_stats* %353, i32 0, i32 0
  %355 = load i32* %354, align 4
  %356 = load i32* %i, align 4
  %357 = sext i32 %356 to i64
  %358 = load i32*** %12, align 8
  %359 = load i32** %358, align 8
  %360 = getelementptr inbounds i32* %359, i64 %357
  store i32 %355, i32* %360, align 4
  %361 = load i32* %i, align 4
  %362 = load i32* %rows, align 4
  %363 = sub nsw i32 %362, 1
  %364 = icmp slt i32 %361, %363
  br i1 %364, label %365, label %366

; <label>:365                                     ; preds = %349
  br label %366

; <label>:366                                     ; preds = %365, %349
  %367 = load i32* %i, align 4
  %368 = load i32* %3, align 4
  %369 = srem i32 %367, %368
  %370 = icmp eq i32 %369, 0
  br i1 %370, label %371, label %473

; <label>:371                                     ; preds = %366
  %372 = load i32* %i, align 4
  %373 = sext i32 %372 to i64
  %374 = load %struct._row_stats** %stats, align 8
  %375 = getelementptr inbounds %struct._row_stats* %374, i64 %373
  %376 = getelementptr inbounds %struct._row_stats* %375, i32 0, i32 1
  %377 = load i32* %376, align 4
  %378 = load i32* %2, align 4
  %379 = srem i32 %377, %378
  %380 = icmp ne i32 %379, 0
  br i1 %380, label %381, label %397

; <label>:381                                     ; preds = %371
  %382 = load i32* %2, align 4
  %383 = load i32* %i, align 4
  %384 = sext i32 %383 to i64
  %385 = load %struct._row_stats** %stats, align 8
  %386 = getelementptr inbounds %struct._row_stats* %385, i64 %384
  %387 = getelementptr inbounds %struct._row_stats* %386, i32 0, i32 1
  %388 = load i32* %387, align 4
  %389 = load i32* %2, align 4
  %390 = srem i32 %388, %389
  %391 = sub nsw i32 %382, %390
  %392 = load i32* %i, align 4
  %393 = sext i32 %392 to i64
  %394 = load %struct._row_stats** %stats, align 8
  %395 = getelementptr inbounds %struct._row_stats* %394, i64 %393
  %396 = getelementptr inbounds %struct._row_stats* %395, i32 0, i32 3
  store i32 %391, i32* %396, align 4
  br label %403

; <label>:397                                     ; preds = %371
  %398 = load i32* %i, align 4
  %399 = sext i32 %398 to i64
  %400 = load %struct._row_stats** %stats, align 8
  %401 = getelementptr inbounds %struct._row_stats* %400, i64 %399
  %402 = getelementptr inbounds %struct._row_stats* %401, i32 0, i32 3
  store i32 0, i32* %402, align 4
  br label %403

; <label>:403                                     ; preds = %397, %381
  %404 = load i32* %i, align 4
  %405 = sext i32 %404 to i64
  %406 = load %struct._row_stats** %stats, align 8
  %407 = getelementptr inbounds %struct._row_stats* %406, i64 %405
  %408 = getelementptr inbounds %struct._row_stats* %407, i32 0, i32 1
  %409 = load i32* %408, align 4
  %410 = load i32* %4, align 4
  %411 = srem i32 %409, %410
  %412 = icmp ne i32 %411, 0
  br i1 %412, label %413, label %427

; <label>:413                                     ; preds = %403
  %414 = load i32* %i, align 4
  %415 = sext i32 %414 to i64
  %416 = load %struct._row_stats** %stats, align 8
  %417 = getelementptr inbounds %struct._row_stats* %416, i64 %415
  %418 = getelementptr inbounds %struct._row_stats* %417, i32 0, i32 1
  %419 = load i32* %418, align 4
  %420 = sitofp i32 %419 to float
  %421 = load i32* %4, align 4
  %422 = sitofp i32 %421 to float
  %423 = fdiv float %420, %422
  %424 = fpext float %423 to double
  %425 = call double @ceil(double %424) #9
  %426 = fptosi double %425 to i32
  store i32 %426, i32* %pack_to, align 4
  br label %436

; <label>:427                                     ; preds = %403
  %428 = load i32* %i, align 4
  %429 = sext i32 %428 to i64
  %430 = load %struct._row_stats** %stats, align 8
  %431 = getelementptr inbounds %struct._row_stats* %430, i64 %429
  %432 = getelementptr inbounds %struct._row_stats* %431, i32 0, i32 1
  %433 = load i32* %432, align 4
  %434 = load i32* %4, align 4
  %435 = sdiv i32 %433, %434
  store i32 %435, i32* %pack_to, align 4
  br label %436

; <label>:436                                     ; preds = %427, %413
  %437 = load i32* %i, align 4
  %438 = sext i32 %437 to i64
  %439 = load %struct._row_stats** %stats, align 8
  %440 = getelementptr inbounds %struct._row_stats* %439, i64 %438
  %441 = getelementptr inbounds %struct._row_stats* %440, i32 0, i32 1
  %442 = load i32* %441, align 4
  %443 = load i32* %i, align 4
  %444 = sext i32 %443 to i64
  %445 = load %struct._row_stats** %stats, align 8
  %446 = getelementptr inbounds %struct._row_stats* %445, i64 %444
  %447 = getelementptr inbounds %struct._row_stats* %446, i32 0, i32 3
  %448 = load i32* %447, align 4
  %449 = add nsw i32 %442, %448
  store i32 %449, i32* %pad_to, align 4
  %450 = load i32* %pack_to, align 4
  %451 = load i32* %i, align 4
  %452 = load i32* %3, align 4
  %453 = sdiv i32 %451, %452
  %454 = sext i32 %453 to i64
  %455 = load i32*** %10, align 8
  %456 = load i32** %455, align 8
  %457 = getelementptr inbounds i32* %456, i64 %454
  store i32 %450, i32* %457, align 4
  %458 = load i32* %pad_to, align 4
  %459 = load i32* %3, align 4
  %460 = mul nsw i32 %458, %459
  %461 = load i32* %total_size, align 4
  %462 = add nsw i32 %461, %460
  store i32 %462, i32* %total_size, align 4
  %463 = load i32* %7, align 4
  %464 = icmp sge i32 %463, 2
  br i1 %464, label %465, label %472

; <label>:465                                     ; preds = %436
  %466 = load i32* %i, align 4
  %467 = load i32* %3, align 4
  %468 = sdiv i32 %466, %467
  %469 = load i32* %pad_to, align 4
  %470 = load i32* %pack_to, align 4
  %471 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str869, i32 0, i32 0), i32 %468, i32 %469, i32 %470)
  br label %472

; <label>:472                                     ; preds = %465, %436
  br label %487

; <label>:473                                     ; preds = %366
  %474 = load i32* %pad_to, align 4
  %475 = load i32* %i, align 4
  %476 = sext i32 %475 to i64
  %477 = load %struct._row_stats** %stats, align 8
  %478 = getelementptr inbounds %struct._row_stats* %477, i64 %476
  %479 = getelementptr inbounds %struct._row_stats* %478, i32 0, i32 1
  %480 = load i32* %479, align 4
  %481 = sub nsw i32 %474, %480
  %482 = load i32* %i, align 4
  %483 = sext i32 %482 to i64
  %484 = load %struct._row_stats** %stats, align 8
  %485 = getelementptr inbounds %struct._row_stats* %484, i64 %483
  %486 = getelementptr inbounds %struct._row_stats* %485, i32 0, i32 3
  store i32 %481, i32* %486, align 4
  br label %487

; <label>:487                                     ; preds = %473, %472
  %488 = load i32* %i, align 4
  %489 = sext i32 %488 to i64
  %490 = load %struct._row_stats** %stats, align 8
  %491 = getelementptr inbounds %struct._row_stats* %490, i64 %489
  %492 = getelementptr inbounds %struct._row_stats* %491, i32 0, i32 3
  %493 = load i32* %492, align 4
  %494 = load i32* %total_padding, align 4
  %495 = add nsw i32 %494, %493
  store i32 %495, i32* %total_padding, align 4
  br label %496

; <label>:496                                     ; preds = %487
  %497 = load i32* %i, align 4
  %498 = add nsw i32 %497, 1
  store i32 %498, i32* %i, align 4
  br label %345

; <label>:499                                     ; preds = %345
  %500 = load i32* %7, align 4
  %501 = icmp sge i32 %500, 1
  br i1 %501, label %502, label %512

; <label>:502                                     ; preds = %499
  %503 = load i32* %total_size, align 4
  %504 = load i32* %total_padding, align 4
  %505 = sitofp i32 %504 to float
  %506 = fmul float 1.000000e+02, %505
  %507 = load i32* %total_size, align 4
  %508 = sitofp i32 %507 to float
  %509 = fdiv float %506, %508
  %510 = fpext float %509 to double
  %511 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([50 x i8]* @.str970, i32 0, i32 0), i32 %503, double %510)
  br label %512

; <label>:512                                     ; preds = %502, %499
  %513 = load i32* %total_size, align 4
  %514 = sext i32 %513 to i64
  %515 = call noalias i8* @calloc(i64 %514, i64 4) #5
  %516 = bitcast i8* %515 to float*
  %517 = load float*** %8, align 8
  store float* %516, float** %517, align 8
  %518 = load i32* %total_size, align 4
  %519 = sext i32 %518 to i64
  %520 = call noalias i8* @calloc(i64 %519, i64 4) #5
  %521 = bitcast i8* %520 to i32*
  %522 = load i32*** %11, align 8
  store i32* %521, i32** %522, align 8
  %523 = load i32* %rows, align 4
  %524 = sext i32 %523 to i64
  %525 = call noalias i8* @calloc(i64 %524, i64 4) #5
  %526 = bitcast i8* %525 to i32*
  %527 = load i32*** %9, align 8
  store i32* %526, i32** %527, align 8
  %528 = load i32* %total_size, align 4
  %529 = load i32** %15, align 8
  store i32 %528, i32* %529, align 4
  store i32 0, i32* %i, align 4
  store i32 0, i32* %irow, align 4
  store i32 0, i32* %idata, align 4
  br label %530

; <label>:530                                     ; preds = %675, %512
  %531 = load i32* %idata, align 4
  %532 = load i32* %irow, align 4
  %533 = sext i32 %532 to i64
  %534 = load i32*** %9, align 8
  %535 = load i32** %534, align 8
  %536 = getelementptr inbounds i32* %535, i64 %533
  store i32 %531, i32* %536, align 4
  %537 = load %struct._row_stats** %stats, align 8
  %538 = getelementptr inbounds %struct._row_stats* %537, i64 0
  %539 = getelementptr inbounds %struct._row_stats* %538, i32 0, i32 1
  %540 = load i32* %539, align 4
  %541 = load %struct._row_stats** %stats, align 8
  %542 = getelementptr inbounds %struct._row_stats* %541, i64 0
  %543 = getelementptr inbounds %struct._row_stats* %542, i32 0, i32 3
  %544 = load i32* %543, align 4
  %545 = add nsw i32 %540, %544
  %546 = load i32* %irow, align 4
  %547 = load i32* %4, align 4
  %548 = mul nsw i32 %546, %547
  %549 = icmp sle i32 %545, %548
  br i1 %549, label %550, label %551

; <label>:550                                     ; preds = %530
  br label %678

; <label>:551                                     ; preds = %530
  store i32 0, i32* %i, align 4
  br label %552

; <label>:552                                     ; preds = %666, %551
  %553 = load i32* %i, align 4
  %554 = load i32* %rows, align 4
  %555 = icmp slt i32 %553, %554
  br i1 %555, label %556, label %669

; <label>:556                                     ; preds = %552
  store i32 0, i32* %ipack, align 4
  br label %557

; <label>:557                                     ; preds = %662, %556
  %558 = load i32* %ipack, align 4
  %559 = load i32* %4, align 4
  %560 = icmp slt i32 %558, %559
  br i1 %560, label %561, label %665

; <label>:561                                     ; preds = %557
  %562 = load i32* %i, align 4
  %563 = sext i32 %562 to i64
  %564 = load %struct._row_stats** %stats, align 8
  %565 = getelementptr inbounds %struct._row_stats* %564, i64 %563
  %566 = getelementptr inbounds %struct._row_stats* %565, i32 0, i32 1
  %567 = load i32* %566, align 4
  %568 = load i32* %irow, align 4
  %569 = load i32* %4, align 4
  %570 = mul nsw i32 %568, %569
  %571 = load i32* %ipack, align 4
  %572 = add nsw i32 %570, %571
  %573 = icmp sgt i32 %567, %572
  br i1 %573, label %574, label %626

; <label>:574                                     ; preds = %561
  %575 = load i32* %i, align 4
  %576 = sext i32 %575 to i64
  %577 = load %struct._row_stats** %stats, align 8
  %578 = getelementptr inbounds %struct._row_stats* %577, i64 %576
  %579 = getelementptr inbounds %struct._row_stats* %578, i32 0, i32 2
  %580 = load i32* %579, align 4
  %581 = load i32* %irow, align 4
  %582 = load i32* %4, align 4
  %583 = mul nsw i32 %581, %582
  %584 = add nsw i32 %580, %583
  %585 = load i32* %ipack, align 4
  %586 = add nsw i32 %584, %585
  store i32 %586, i32* %entry_index, align 4
  %587 = load i32* %entry_index, align 4
  %588 = sext i32 %587 to i64
  %589 = load %struct._mat_entry** %entries, align 8
  %590 = getelementptr inbounds %struct._mat_entry* %589, i64 %588
  %591 = bitcast %struct._mat_entry* %entry to i8*
  %592 = bitcast %struct._mat_entry* %590 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %591, i8* %592, i64 12, i32 4, i1 false)
  %593 = getelementptr inbounds %struct._mat_entry* %entry, i32 0, i32 2
  %594 = load float* %593, align 4
  %595 = load i32* %idata, align 4
  %596 = sext i32 %595 to i64
  %597 = load float*** %8, align 8
  %598 = load float** %597, align 8
  %599 = getelementptr inbounds float* %598, i64 %596
  store float %594, float* %599, align 4
  %600 = getelementptr inbounds %struct._mat_entry* %entry, i32 0, i32 1
  %601 = load i32* %600, align 4
  %602 = load i32* %idata, align 4
  %603 = sext i32 %602 to i64
  %604 = load i32*** %11, align 8
  %605 = load i32** %604, align 8
  %606 = getelementptr inbounds i32* %605, i64 %603
  store i32 %601, i32* %606, align 4
  %607 = load i32* %7, align 4
  %608 = icmp sge i32 %607, 2
  br i1 %608, label %609, label %625

; <label>:609                                     ; preds = %574
  %610 = load i32* %i, align 4
  %611 = icmp slt i32 %610, 3
  br i1 %611, label %612, label %620

; <label>:612                                     ; preds = %609
  %613 = load i32* %ipack, align 4
  %614 = add nsw i32 %613, 1
  %615 = load i32* %i, align 4
  %616 = getelementptr inbounds %struct._mat_entry* %entry, i32 0, i32 2
  %617 = load float* %616, align 4
  %618 = fpext float %617 to double
  %619 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([16 x i8]* @.str1071, i32 0, i32 0), i32 %614, i32 %615, double %618)
  br label %624

; <label>:620                                     ; preds = %609
  %621 = load i32* %ipack, align 4
  %622 = add nsw i32 %621, 1
  %623 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str1172, i32 0, i32 0), i32 %622)
  br label %624

; <label>:624                                     ; preds = %620, %612
  br label %625

; <label>:625                                     ; preds = %624, %574
  br label %659

; <label>:626                                     ; preds = %561
  %627 = load i32* %i, align 4
  %628 = sext i32 %627 to i64
  %629 = load %struct._row_stats** %stats, align 8
  %630 = getelementptr inbounds %struct._row_stats* %629, i64 %628
  %631 = getelementptr inbounds %struct._row_stats* %630, i32 0, i32 1
  %632 = load i32* %631, align 4
  %633 = load i32* %i, align 4
  %634 = sext i32 %633 to i64
  %635 = load %struct._row_stats** %stats, align 8
  %636 = getelementptr inbounds %struct._row_stats* %635, i64 %634
  %637 = getelementptr inbounds %struct._row_stats* %636, i32 0, i32 3
  %638 = load i32* %637, align 4
  %639 = add nsw i32 %632, %638
  %640 = load i32* %irow, align 4
  %641 = load i32* %4, align 4
  %642 = mul nsw i32 %640, %641
  %643 = load i32* %ipack, align 4
  %644 = add nsw i32 %642, %643
  %645 = icmp sgt i32 %639, %644
  br i1 %645, label %646, label %657

; <label>:646                                     ; preds = %626
  %647 = load i32* %7, align 4
  %648 = icmp sge i32 %647, 2
  br i1 %648, label %649, label %651

; <label>:649                                     ; preds = %646
  %650 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str1273, i32 0, i32 0))
  br label %651

; <label>:651                                     ; preds = %649, %646
  %652 = load i32* %idata, align 4
  %653 = sext i32 %652 to i64
  %654 = load i32*** %11, align 8
  %655 = load i32** %654, align 8
  %656 = getelementptr inbounds i32* %655, i64 %653
  store i32 -1, i32* %656, align 4
  br label %658

; <label>:657                                     ; preds = %626
  br label %670

; <label>:658                                     ; preds = %651
  br label %659

; <label>:659                                     ; preds = %658, %625
  %660 = load i32* %idata, align 4
  %661 = add nsw i32 %660, 1
  store i32 %661, i32* %idata, align 4
  br label %662

; <label>:662                                     ; preds = %659
  %663 = load i32* %ipack, align 4
  %664 = add nsw i32 %663, 1
  store i32 %664, i32* %ipack, align 4
  br label %557

; <label>:665                                     ; preds = %557
  br label %666

; <label>:666                                     ; preds = %665
  %667 = load i32* %i, align 4
  %668 = add nsw i32 %667, 1
  store i32 %668, i32* %i, align 4
  br label %552

; <label>:669                                     ; preds = %552
  br label %670

; <label>:670                                     ; preds = %669, %657
  %671 = load i32* %7, align 4
  %672 = icmp sge i32 %671, 2
  br i1 %672, label %673, label %675

; <label>:673                                     ; preds = %670
  %674 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str1374, i32 0, i32 0))
  br label %675

; <label>:675                                     ; preds = %673, %670
  %676 = load i32* %irow, align 4
  %677 = add nsw i32 %676, 1
  store i32 %677, i32* %irow, align 4
  br label %530

; <label>:678                                     ; preds = %550
  %679 = load i32* %7, align 4
  %680 = icmp sge i32 %679, 1
  br i1 %680, label %681, label %685

; <label>:681                                     ; preds = %678
  %682 = load i32* %rows, align 4
  %683 = load i32* %irow, align 4
  %684 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([58 x i8]* @.str1475, i32 0, i32 0), i32 %682, i32 %683)
  br label %685

; <label>:685                                     ; preds = %681, %678
  %686 = load %struct._mat_entry** %entries, align 8
  %687 = bitcast %struct._mat_entry* %686 to i8*
  call void @free(i8* %687) #5
  %688 = load %struct._row_stats** %stats, align 8
  %689 = bitcast %struct._row_stats* %688 to i8*
  call void @free(i8* %689) #5
  %690 = load i32** %16, align 8
  %691 = load i32* %690, align 4
  %692 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1576, i32 0, i32 0), i32 %691)
  %693 = load i32* %rows, align 4
  %694 = load i32** %13, align 8
  store i32 %693, i32* %694, align 4
  %695 = load i32* %irow, align 4
  %696 = add nsw i32 %695, 1
  %697 = load i32** %17, align 8
  store i32 %696, i32* %697, align 4
  ret i32 0
}

declare void @qsort(i8*, i64, i64, i32 (i8*, i8*)*) #1

; Function Attrs: nounwind
declare noalias i8* @calloc(i64, i64) #3

; Function Attrs: nounwind readnone
declare double @ceil(double) #6

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { noreturn nounwind }
attributes #8 = { nounwind readonly }
attributes #9 = { nounwind readnone }

!llvm.ident = !{!0, !0, !0, !0, !0}

!0 = metadata !{metadata !"clang version 3.4 (tags/RELEASE_34/final)"}
