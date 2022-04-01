; ModuleID = 'main.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.image_i16 = type { i32, i32, i16* }
%struct.pb_TimerSet = type { i32, %struct.pb_async_time_marker_list*, i64, i64, [8 x %struct.pb_Timer], [8 x %struct.pb_SubTimerList*] }
%struct.pb_async_time_marker_list = type { i8*, i32, i8*, %struct.pb_async_time_marker_list* }
%struct.pb_Timer = type { i32, i64, i64 }
%struct.pb_SubTimerList = type { %struct.pb_SubTimer*, %struct.pb_SubTimer* }
%struct.pb_SubTimer = type { i8*, %struct.pb_Timer, %struct.pb_SubTimer* }
%struct.pb_Parameters = type { i8*, i8** }
%struct.argparse = type { i32, i8**, i32, i8**, i8** }
%struct.timeval = type { i64, i64 }
%struct.timezone = type { i32, i32 }

@.str = private unnamed_addr constant [10 x i8] c"Success.\0A\00", align 1
@.str1 = private unnamed_addr constant [45 x i8] c"Computed SADs do not match expected values.\0A\00", align 1
@stderr = external global %struct._IO_FILE*
@.str2 = private unnamed_addr constant [31 x i8] c"Expecting two input filenames\0A\00", align 1
@.str3 = private unnamed_addr constant [36 x i8] c"Input images must be the same size\0A\00", align 1
@.str4 = private unnamed_addr constant [53 x i8] c"Input image size must be an integral multiple of 16\0A\00", align 1
@.str5 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str6 = private unnamed_addr constant [25 x i8] c"Cannot open output file\0A\00", align 1
@.str7 = private unnamed_addr constant [32 x i8] c"Expecting file name after '-o'\0A\00", align 1
@.str18 = private unnamed_addr constant [32 x i8] c"Expecting file name after '-i'\0A\00", align 1
@.str29 = private unnamed_addr constant [35 x i8] c"Unexpected command-line parameter\0A\00", align 1
@.str310 = private unnamed_addr constant [43 x i8] c"Ignoring attempt to start a running timer\0A\00", align 1
@.str411 = private unnamed_addr constant [32 x i8] c"Warning: Timer was not stopped\0A\00", align 1
@.str512 = private unnamed_addr constant [35 x i8] c"Warning: Subtimer was not stopped\0A\00", align 1
@.str613 = private unnamed_addr constant [54 x i8] c"Ignoring attempt to start running timer and subtimer\0A\00", align 1
@.str714 = private unnamed_addr constant [42 x i8] c"Ignoring attempt to stop a stopped timer\0A\00", align 1
@.str8 = private unnamed_addr constant [32 x i8] c"Warning: Timer was not running\0A\00", align 1
@.str9 = private unnamed_addr constant [35 x i8] c"Warning: Subtimer was not running\0A\00", align 1
@.str10 = private unnamed_addr constant [53 x i8] c"Ignoring attempt to stop stopped timer and subtimer\0A\00", align 1
@.str11 = private unnamed_addr constant [49 x i8] c"Elapsed time from a running timer is inaccurate\0A\00", align 1
@.str12 = private unnamed_addr constant [4 x i8] c"%s\00\00", align 1
@.str13 = private unnamed_addr constant [3 x i8] c"IO\00", align 1
@.str14 = private unnamed_addr constant [7 x i8] c"Kernel\00", align 1
@.str15 = private unnamed_addr constant [5 x i8] c"Copy\00", align 1
@.str16 = private unnamed_addr constant [7 x i8] c"Driver\00", align 1
@.str17 = private unnamed_addr constant [11 x i8] c"Copy Async\00", align 1
@.str1815 = private unnamed_addr constant [8 x i8] c"Compute\00", align 1
@.str19 = private unnamed_addr constant [10 x i8] c"%-*s: %f\0A\00", align 1
@.str20 = private unnamed_addr constant [12 x i8] c" -%-*s: %f\0A\00", align 1
@.str21 = private unnamed_addr constant [24 x i8] c"CPU/Kernel Overlap: %f\0A\00", align 1
@.str22 = private unnamed_addr constant [21 x i8] c"Timer Wall Time: %f\0A\00", align 1
@.str23 = private unnamed_addr constant [15 x i8] c"next_argument\0A\00", align 1
@.str24 = private unnamed_addr constant [17 x i8] c"delete_argument\0A\00", align 1
@.str32 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str133 = private unnamed_addr constant [23 x i8] c"Cannot find file '%s'\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @check_sads(i16* %sads_reference, i16* %sads_computed, i32 %image_size_macroblocks) #0 {
  %1 = alloca i16*, align 8
  %2 = alloca i16*, align 8
  %3 = alloca i32, align 4
  %block = alloca i32, align 4
  %subblock = alloca i32, align 4
  %sad_index = alloca i32, align 4
  %index = alloca i32, align 4
  store i16* %sads_reference, i16** %1, align 8
  store i16* %sads_computed, i16** %2, align 8
  store i32 %image_size_macroblocks, i32* %3, align 4
  %4 = load i32* %3, align 4
  %5 = mul nsw i32 27300, %4
  %6 = load i16** %2, align 8
  %7 = sext i32 %5 to i64
  %8 = getelementptr inbounds i16* %6, i64 %7
  store i16* %8, i16** %2, align 8
  store i32 0, i32* %block, align 4
  br label %9

; <label>:9                                       ; preds = %52, %0
  %10 = load i32* %block, align 4
  %11 = load i32* %3, align 4
  %12 = icmp slt i32 %10, %11
  br i1 %12, label %13, label %55

; <label>:13                                      ; preds = %9
  store i32 0, i32* %subblock, align 4
  br label %14

; <label>:14                                      ; preds = %48, %13
  %15 = load i32* %subblock, align 4
  %16 = icmp slt i32 %15, 16
  br i1 %16, label %17, label %51

; <label>:17                                      ; preds = %14
  store i32 0, i32* %sad_index, align 4
  br label %18

; <label>:18                                      ; preds = %44, %17
  %19 = load i32* %sad_index, align 4
  %20 = icmp slt i32 %19, 1089
  br i1 %20, label %21, label %47

; <label>:21                                      ; preds = %18
  %22 = load i32* %block, align 4
  %23 = mul nsw i32 %22, 16
  %24 = load i32* %subblock, align 4
  %25 = add nsw i32 %23, %24
  %26 = mul nsw i32 %25, 1092
  %27 = load i32* %sad_index, align 4
  %28 = add nsw i32 %26, %27
  store i32 %28, i32* %index, align 4
  %29 = load i32* %index, align 4
  %30 = sext i32 %29 to i64
  %31 = load i16** %1, align 8
  %32 = getelementptr inbounds i16* %31, i64 %30
  %33 = load i16* %32, align 2
  %34 = zext i16 %33 to i32
  %35 = load i32* %index, align 4
  %36 = sext i32 %35 to i64
  %37 = load i16** %2, align 8
  %38 = getelementptr inbounds i16* %37, i64 %36
  %39 = load i16* %38, align 2
  %40 = zext i16 %39 to i32
  %41 = icmp ne i32 %34, %40
  br i1 %41, label %42, label %43

; <label>:42                                      ; preds = %21
  br label %57

; <label>:43                                      ; preds = %21
  br label %44

; <label>:44                                      ; preds = %43
  %45 = load i32* %sad_index, align 4
  %46 = add nsw i32 %45, 1
  store i32 %46, i32* %sad_index, align 4
  br label %18

; <label>:47                                      ; preds = %18
  br label %48

; <label>:48                                      ; preds = %47
  %49 = load i32* %subblock, align 4
  %50 = add nsw i32 %49, 1
  store i32 %50, i32* %subblock, align 4
  br label %14

; <label>:51                                      ; preds = %14
  br label %52

; <label>:52                                      ; preds = %51
  %53 = load i32* %block, align 4
  %54 = add nsw i32 %53, 1
  store i32 %54, i32* %block, align 4
  br label %9

; <label>:55                                      ; preds = %9
  %56 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str, i32 0, i32 0))
  br label %59

; <label>:57                                      ; preds = %42
  %58 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([45 x i8]* @.str1, i32 0, i32 0))
  br label %59

; <label>:59                                      ; preds = %57, %55
  ret void
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %ref_image = alloca %struct.image_i16*, align 8
  %cur_image = alloca %struct.image_i16*, align 8
  %sads_computed = alloca i16*, align 8
  %image_size_bytes = alloca i32, align 4
  %image_size_macroblocks = alloca i32, align 4
  %image_width_macroblocks = alloca i32, align 4
  %image_height_macroblocks = alloca i32, align 4
  %timers = alloca %struct.pb_TimerSet, align 8
  %params = alloca %struct.pb_Parameters*, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  call void @pb_InitializeTimerSet(%struct.pb_TimerSet* %timers)
  %4 = load i8*** %3, align 8
  %5 = call %struct.pb_Parameters* @pb_ReadParameters(i32* %2, i8** %4)
  store %struct.pb_Parameters* %5, %struct.pb_Parameters** %params, align 8
  %6 = load %struct.pb_Parameters** %params, align 8
  %7 = call i32 @pb_Parameters_CountInputs(%struct.pb_Parameters* %6)
  %8 = icmp ne i32 %7, 2
  br i1 %8, label %9, label %12

; <label>:9                                       ; preds = %0
  %10 = load %struct._IO_FILE** @stderr, align 8
  %11 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([31 x i8]* @.str2, i32 0, i32 0))
  call void @exit(i32 -1) #8
  unreachable

; <label>:12                                      ; preds = %0
  call void @pb_SwitchToTimer(%struct.pb_TimerSet* %timers, i32 1)
  %13 = load %struct.pb_Parameters** %params, align 8
  %14 = getelementptr inbounds %struct.pb_Parameters* %13, i32 0, i32 1
  %15 = load i8*** %14, align 8
  %16 = getelementptr inbounds i8** %15, i64 0
  %17 = load i8** %16, align 8
  %18 = call %struct.image_i16* @load_image(i8* %17)
  store %struct.image_i16* %18, %struct.image_i16** %ref_image, align 8
  %19 = load %struct.pb_Parameters** %params, align 8
  %20 = getelementptr inbounds %struct.pb_Parameters* %19, i32 0, i32 1
  %21 = load i8*** %20, align 8
  %22 = getelementptr inbounds i8** %21, i64 1
  %23 = load i8** %22, align 8
  %24 = call %struct.image_i16* @load_image(i8* %23)
  store %struct.image_i16* %24, %struct.image_i16** %cur_image, align 8
  call void @pb_SwitchToTimer(%struct.pb_TimerSet* %timers, i32 6)
  %25 = load %struct.image_i16** %ref_image, align 8
  %26 = getelementptr inbounds %struct.image_i16* %25, i32 0, i32 0
  %27 = load i32* %26, align 4
  %28 = load %struct.image_i16** %cur_image, align 8
  %29 = getelementptr inbounds %struct.image_i16* %28, i32 0, i32 0
  %30 = load i32* %29, align 4
  %31 = icmp ne i32 %27, %30
  br i1 %31, label %40, label %32

; <label>:32                                      ; preds = %12
  %33 = load %struct.image_i16** %ref_image, align 8
  %34 = getelementptr inbounds %struct.image_i16* %33, i32 0, i32 1
  %35 = load i32* %34, align 4
  %36 = load %struct.image_i16** %cur_image, align 8
  %37 = getelementptr inbounds %struct.image_i16* %36, i32 0, i32 1
  %38 = load i32* %37, align 4
  %39 = icmp ne i32 %35, %38
  br i1 %39, label %40, label %43

; <label>:40                                      ; preds = %32, %12
  %41 = load %struct._IO_FILE** @stderr, align 8
  %42 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %41, i8* getelementptr inbounds ([36 x i8]* @.str3, i32 0, i32 0))
  call void @exit(i32 -1) #8
  unreachable

; <label>:43                                      ; preds = %32
  %44 = load %struct.image_i16** %ref_image, align 8
  %45 = getelementptr inbounds %struct.image_i16* %44, i32 0, i32 0
  %46 = load i32* %45, align 4
  %47 = srem i32 %46, 16
  %48 = icmp ne i32 %47, 0
  br i1 %48, label %55, label %49

; <label>:49                                      ; preds = %43
  %50 = load %struct.image_i16** %ref_image, align 8
  %51 = getelementptr inbounds %struct.image_i16* %50, i32 0, i32 1
  %52 = load i32* %51, align 4
  %53 = srem i32 %52, 16
  %54 = icmp ne i32 %53, 0
  br i1 %54, label %55, label %58

; <label>:55                                      ; preds = %49, %43
  %56 = load %struct._IO_FILE** @stderr, align 8
  %57 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %56, i8* getelementptr inbounds ([53 x i8]* @.str4, i32 0, i32 0))
  call void @exit(i32 -1) #8
  unreachable

; <label>:58                                      ; preds = %49
  %59 = load %struct.image_i16** %ref_image, align 8
  %60 = getelementptr inbounds %struct.image_i16* %59, i32 0, i32 0
  %61 = load i32* %60, align 4
  %62 = load %struct.image_i16** %ref_image, align 8
  %63 = getelementptr inbounds %struct.image_i16* %62, i32 0, i32 1
  %64 = load i32* %63, align 4
  %65 = mul nsw i32 %61, %64
  %66 = sext i32 %65 to i64
  %67 = mul i64 %66, 2
  %68 = trunc i64 %67 to i32
  store i32 %68, i32* %image_size_bytes, align 4
  %69 = load %struct.image_i16** %ref_image, align 8
  %70 = getelementptr inbounds %struct.image_i16* %69, i32 0, i32 0
  %71 = load i32* %70, align 4
  %72 = sdiv i32 %71, 16
  store i32 %72, i32* %image_width_macroblocks, align 4
  %73 = load %struct.image_i16** %ref_image, align 8
  %74 = getelementptr inbounds %struct.image_i16* %73, i32 0, i32 1
  %75 = load i32* %74, align 4
  %76 = sdiv i32 %75, 16
  store i32 %76, i32* %image_height_macroblocks, align 4
  %77 = load i32* %image_width_macroblocks, align 4
  %78 = load i32* %image_height_macroblocks, align 4
  %79 = mul nsw i32 %77, %78
  store i32 %79, i32* %image_size_macroblocks, align 4
  %80 = load i32* %image_size_macroblocks, align 4
  %81 = mul nsw i32 44772, %80
  %82 = sext i32 %81 to i64
  %83 = mul i64 %82, 2
  %84 = call noalias i8* @malloc(i64 %83) #6
  %85 = bitcast i8* %84 to i16*
  store i16* %85, i16** %sads_computed, align 8
  %86 = load i16** %sads_computed, align 8
  %87 = load %struct.image_i16** %cur_image, align 8
  %88 = getelementptr inbounds %struct.image_i16* %87, i32 0, i32 2
  %89 = load i16** %88, align 8
  %90 = load %struct.image_i16** %ref_image, align 8
  %91 = getelementptr inbounds %struct.image_i16* %90, i32 0, i32 2
  %92 = load i16** %91, align 8
  %93 = load %struct.image_i16** %ref_image, align 8
  %94 = getelementptr inbounds %struct.image_i16* %93, i32 0, i32 0
  %95 = load i32* %94, align 4
  %96 = sdiv i32 %95, 16
  %97 = load %struct.image_i16** %ref_image, align 8
  %98 = getelementptr inbounds %struct.image_i16* %97, i32 0, i32 1
  %99 = load i32* %98, align 4
  %100 = sdiv i32 %99, 16
  call void @sad4_cpu(i16* %86, i16* %89, i16* %92, i32 %96, i32 %100)
  %101 = load i16** %sads_computed, align 8
  %102 = load i32* %image_size_macroblocks, align 4
  call void @larger_sads(i16* %101, i32 %102)
  %103 = load %struct.pb_Parameters** %params, align 8
  %104 = getelementptr inbounds %struct.pb_Parameters* %103, i32 0, i32 0
  %105 = load i8** %104, align 8
  %106 = icmp ne i8* %105, null
  br i1 %106, label %107, label %114

; <label>:107                                     ; preds = %58
  call void @pb_SwitchToTimer(%struct.pb_TimerSet* %timers, i32 1)
  %108 = load %struct.pb_Parameters** %params, align 8
  %109 = getelementptr inbounds %struct.pb_Parameters* %108, i32 0, i32 0
  %110 = load i8** %109, align 8
  %111 = load i32* %image_width_macroblocks, align 4
  %112 = load i32* %image_height_macroblocks, align 4
  %113 = load i16** %sads_computed, align 8
  call void @write_sads(i8* %110, i32 %111, i32 %112, i16* %113)
  call void @pb_SwitchToTimer(%struct.pb_TimerSet* %timers, i32 6)
  br label %114

; <label>:114                                     ; preds = %107, %58
  %115 = load i16** %sads_computed, align 8
  %116 = bitcast i16* %115 to i8*
  call void @free(i8* %116) #6
  %117 = load %struct.image_i16** %ref_image, align 8
  call void @free_image(%struct.image_i16* %117)
  %118 = load %struct.image_i16** %cur_image, align 8
  call void @free_image(%struct.image_i16* %118)
  call void @pb_SwitchToTimer(%struct.pb_TimerSet* %timers, i32 0)
  call void @pb_PrintTimerSet(%struct.pb_TimerSet* %timers)
  %119 = load %struct.pb_Parameters** %params, align 8
  call void @pb_FreeParameters(%struct.pb_Parameters* %119)
  ret i32 0
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #3

; Function Attrs: nounwind uwtable
define internal void @write_sads(i8* %filename, i32 %mb_width, i32 %mb_height, i16* %sads) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i16*, align 8
  %outfile = alloca %struct._IO_FILE*, align 8
  %mbs = alloca i32, align 4
  %row_indir = alloca i32, align 4
  %row_indices = alloca [6 x i32], align 16
  %row = alloca i32, align 4
  %block = alloca i32, align 4
  %blocktype = alloca i32, align 4
  store i8* %filename, i8** %1, align 8
  store i32 %mb_width, i32* %2, align 4
  store i32 %mb_height, i32* %3, align 4
  store i16* %sads, i16** %4, align 8
  %5 = load i8** %1, align 8
  %6 = call %struct._IO_FILE* @fopen(i8* %5, i8* getelementptr inbounds ([2 x i8]* @.str5, i32 0, i32 0))
  store %struct._IO_FILE* %6, %struct._IO_FILE** %outfile, align 8
  %7 = load i32* %2, align 4
  %8 = load i32* %3, align 4
  %9 = mul nsw i32 %7, %8
  store i32 %9, i32* %mbs, align 4
  %10 = getelementptr inbounds [6 x i32]* %row_indices, i64 0, i64 0
  store i32 0, i32* %10
  %11 = getelementptr inbounds i32* %10, i64 1
  store i32 1, i32* %11
  %12 = getelementptr inbounds i32* %11, i64 1
  %13 = load i32* %3, align 4
  %14 = sdiv i32 %13, 2
  %15 = sub nsw i32 %14, 1
  store i32 %15, i32* %12
  %16 = getelementptr inbounds i32* %12, i64 1
  %17 = load i32* %3, align 4
  %18 = sdiv i32 %17, 2
  store i32 %18, i32* %16
  %19 = getelementptr inbounds i32* %16, i64 1
  %20 = load i32* %3, align 4
  %21 = sub nsw i32 %20, 2
  store i32 %21, i32* %19
  %22 = getelementptr inbounds i32* %19, i64 1
  %23 = load i32* %3, align 4
  %24 = sub nsw i32 %23, 1
  store i32 %24, i32* %22
  %25 = load %struct._IO_FILE** %outfile, align 8
  %26 = icmp eq %struct._IO_FILE* %25, null
  br i1 %26, label %27, label %30

; <label>:27                                      ; preds = %0
  %28 = load %struct._IO_FILE** @stderr, align 8
  %29 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %28, i8* getelementptr inbounds ([25 x i8]* @.str6, i32 0, i32 0))
  call void @exit(i32 -1) #8
  unreachable

; <label>:30                                      ; preds = %0
  %31 = load %struct._IO_FILE** %outfile, align 8
  %32 = load i32* %2, align 4
  %33 = mul nsw i32 %32, 6
  call void @write32u(%struct._IO_FILE* %31, i32 %33)
  %34 = load %struct._IO_FILE** %outfile, align 8
  call void @write32u(%struct._IO_FILE* %34, i32 0)
  store i32 0, i32* %row_indir, align 4
  br label %35

; <label>:35                                      ; preds = %152, %30
  %36 = load i32* %row_indir, align 4
  %37 = icmp slt i32 %36, 6
  br i1 %37, label %38, label %155

; <label>:38                                      ; preds = %35
  %39 = load i32* %row_indir, align 4
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds [6 x i32]* %row_indices, i32 0, i64 %40
  %42 = load i32* %41, align 4
  store i32 %42, i32* %row, align 4
  %43 = load i32* %2, align 4
  %44 = load i32* %row, align 4
  %45 = mul nsw i32 %43, %44
  store i32 %45, i32* %block, align 4
  br label %46

; <label>:46                                      ; preds = %148, %38
  %47 = load i32* %block, align 4
  %48 = load i32* %2, align 4
  %49 = load i32* %row, align 4
  %50 = add nsw i32 %49, 1
  %51 = mul nsw i32 %48, %50
  %52 = icmp slt i32 %47, %51
  br i1 %52, label %53, label %151

; <label>:53                                      ; preds = %46
  store i32 1, i32* %blocktype, align 4
  br label %54

; <label>:54                                      ; preds = %144, %53
  %55 = load i32* %blocktype, align 4
  %56 = icmp sle i32 %55, 7
  br i1 %56, label %57, label %147

; <label>:57                                      ; preds = %54
  %58 = load %struct._IO_FILE** %outfile, align 8
  %59 = load i16** %4, align 8
  %60 = load i32* %blocktype, align 4
  %61 = icmp eq i32 %60, 1
  br i1 %61, label %62, label %63

; <label>:62                                      ; preds = %57
  br label %106

; <label>:63                                      ; preds = %57
  %64 = load i32* %blocktype, align 4
  %65 = icmp eq i32 %64, 2
  br i1 %65, label %66, label %69

; <label>:66                                      ; preds = %63
  %67 = load i32* %mbs, align 4
  %68 = mul nsw i32 %67, 1092
  br label %104

; <label>:69                                      ; preds = %63
  %70 = load i32* %blocktype, align 4
  %71 = icmp eq i32 %70, 3
  br i1 %71, label %72, label %75

; <label>:72                                      ; preds = %69
  %73 = load i32* %mbs, align 4
  %74 = mul nsw i32 %73, 3276
  br label %102

; <label>:75                                      ; preds = %69
  %76 = load i32* %blocktype, align 4
  %77 = icmp eq i32 %76, 4
  br i1 %77, label %78, label %81

; <label>:78                                      ; preds = %75
  %79 = load i32* %mbs, align 4
  %80 = mul nsw i32 %79, 5460
  br label %100

; <label>:81                                      ; preds = %75
  %82 = load i32* %blocktype, align 4
  %83 = icmp eq i32 %82, 5
  br i1 %83, label %84, label %87

; <label>:84                                      ; preds = %81
  %85 = load i32* %mbs, align 4
  %86 = mul nsw i32 %85, 9828
  br label %98

; <label>:87                                      ; preds = %81
  %88 = load i32* %blocktype, align 4
  %89 = icmp eq i32 %88, 6
  br i1 %89, label %90, label %93

; <label>:90                                      ; preds = %87
  %91 = load i32* %mbs, align 4
  %92 = mul nsw i32 %91, 18564
  br label %96

; <label>:93                                      ; preds = %87
  %94 = load i32* %mbs, align 4
  %95 = mul nsw i32 %94, 27300
  br label %96

; <label>:96                                      ; preds = %93, %90
  %97 = phi i32 [ %92, %90 ], [ %95, %93 ]
  br label %98

; <label>:98                                      ; preds = %96, %84
  %99 = phi i32 [ %86, %84 ], [ %97, %96 ]
  br label %100

; <label>:100                                     ; preds = %98, %78
  %101 = phi i32 [ %80, %78 ], [ %99, %98 ]
  br label %102

; <label>:102                                     ; preds = %100, %72
  %103 = phi i32 [ %74, %72 ], [ %101, %100 ]
  br label %104

; <label>:104                                     ; preds = %102, %66
  %105 = phi i32 [ %68, %66 ], [ %103, %102 ]
  br label %106

; <label>:106                                     ; preds = %104, %62
  %107 = phi i32 [ 0, %62 ], [ %105, %104 ]
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds i16* %59, i64 %108
  %110 = load i32* %block, align 4
  %111 = load i32* %blocktype, align 4
  %112 = icmp eq i32 %111, 1
  br i1 %112, label %113, label %114

; <label>:113                                     ; preds = %106
  br label %142

; <label>:114                                     ; preds = %106
  %115 = load i32* %blocktype, align 4
  %116 = icmp eq i32 %115, 2
  br i1 %116, label %117, label %118

; <label>:117                                     ; preds = %114
  br label %140

; <label>:118                                     ; preds = %114
  %119 = load i32* %blocktype, align 4
  %120 = icmp eq i32 %119, 3
  br i1 %120, label %121, label %122

; <label>:121                                     ; preds = %118
  br label %138

; <label>:122                                     ; preds = %118
  %123 = load i32* %blocktype, align 4
  %124 = icmp eq i32 %123, 4
  br i1 %124, label %125, label %126

; <label>:125                                     ; preds = %122
  br label %136

; <label>:126                                     ; preds = %122
  %127 = load i32* %blocktype, align 4
  %128 = icmp eq i32 %127, 5
  br i1 %128, label %129, label %130

; <label>:129                                     ; preds = %126
  br label %134

; <label>:130                                     ; preds = %126
  %131 = load i32* %blocktype, align 4
  %132 = icmp eq i32 %131, 6
  %133 = select i1 %132, i32 8, i32 16
  br label %134

; <label>:134                                     ; preds = %130, %129
  %135 = phi i32 [ 8, %129 ], [ %133, %130 ]
  br label %136

; <label>:136                                     ; preds = %134, %125
  %137 = phi i32 [ 4, %125 ], [ %135, %134 ]
  br label %138

; <label>:138                                     ; preds = %136, %121
  %139 = phi i32 [ 2, %121 ], [ %137, %136 ]
  br label %140

; <label>:140                                     ; preds = %138, %117
  %141 = phi i32 [ 2, %117 ], [ %139, %138 ]
  br label %142

; <label>:142                                     ; preds = %140, %113
  %143 = phi i32 [ 1, %113 ], [ %141, %140 ]
  call void @write_subblocks(%struct._IO_FILE* %58, i16* %109, i32 %110, i32 %143)
  br label %144

; <label>:144                                     ; preds = %142
  %145 = load i32* %blocktype, align 4
  %146 = add nsw i32 %145, 1
  store i32 %146, i32* %blocktype, align 4
  br label %54

; <label>:147                                     ; preds = %54
  br label %148

; <label>:148                                     ; preds = %147
  %149 = load i32* %block, align 4
  %150 = add nsw i32 %149, 1
  store i32 %150, i32* %block, align 4
  br label %46

; <label>:151                                     ; preds = %46
  br label %152

; <label>:152                                     ; preds = %151
  %153 = load i32* %row_indir, align 4
  %154 = add nsw i32 %153, 1
  store i32 %154, i32* %row_indir, align 4
  br label %35

; <label>:155                                     ; preds = %35
  %156 = load %struct._IO_FILE** %outfile, align 8
  %157 = call i32 @fclose(%struct._IO_FILE* %156)
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare %struct._IO_FILE* @fopen(i8*, i8*) #1

; Function Attrs: inlinehint nounwind uwtable
define internal void @write_subblocks(%struct._IO_FILE* %outfile, i16* %subblock_array, i32 %macroblock, i32 %count) #4 {
  %1 = alloca %struct._IO_FILE*, align 8
  %2 = alloca i16*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %block = alloca i32, align 4
  %pos = alloca i32, align 4
  %vec = alloca i16*, align 8
  store %struct._IO_FILE* %outfile, %struct._IO_FILE** %1, align 8
  store i16* %subblock_array, i16** %2, align 8
  store i32 %macroblock, i32* %3, align 4
  store i32 %count, i32* %4, align 4
  store i32 0, i32* %block, align 4
  br label %5

; <label>:5                                       ; preds = %31, %0
  %6 = load i32* %block, align 4
  %7 = load i32* %4, align 4
  %8 = icmp slt i32 %6, %7
  br i1 %8, label %9, label %34

; <label>:9                                       ; preds = %5
  %10 = load i16** %2, align 8
  %11 = load i32* %block, align 4
  %12 = load i32* %3, align 4
  %13 = load i32* %4, align 4
  %14 = mul nsw i32 %12, %13
  %15 = add nsw i32 %11, %14
  %16 = mul nsw i32 %15, 1092
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds i16* %10, i64 %17
  store i16* %18, i16** %vec, align 8
  store i32 0, i32* %pos, align 4
  br label %19

; <label>:19                                      ; preds = %27, %9
  %20 = load i32* %pos, align 4
  %21 = icmp slt i32 %20, 1089
  br i1 %21, label %22, label %30

; <label>:22                                      ; preds = %19
  %23 = load %struct._IO_FILE** %1, align 8
  %24 = load i16** %vec, align 8
  %25 = getelementptr inbounds i16* %24, i32 1
  store i16* %25, i16** %vec, align 8
  %26 = load i16* %24, align 2
  call void @write16u(%struct._IO_FILE* %23, i16 zeroext %26)
  br label %27

; <label>:27                                      ; preds = %22
  %28 = load i32* %pos, align 4
  %29 = add nsw i32 %28, 1
  store i32 %29, i32* %pos, align 4
  br label %19

; <label>:30                                      ; preds = %19
  br label %31

; <label>:31                                      ; preds = %30
  %32 = load i32* %block, align 4
  %33 = add nsw i32 %32, 1
  store i32 %33, i32* %block, align 4
  br label %5

; <label>:34                                      ; preds = %5
  ret void
}

declare i32 @fclose(%struct._IO_FILE*) #1

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
  %4 = call noalias i8* @malloc(i64 16) #6
  %5 = bitcast i8* %4 to %struct.pb_Parameters*
  store %struct.pb_Parameters* %5, %struct.pb_Parameters** %ret, align 8
  %6 = load %struct.pb_Parameters** %ret, align 8
  %7 = getelementptr inbounds %struct.pb_Parameters* %6, i32 0, i32 0
  store i8* null, i8** %7, align 8
  %8 = call noalias i8* @malloc(i64 8) #6
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
  store i8* getelementptr inbounds ([32 x i8]* @.str7, i32 0, i32 0), i8** %err_message, align 8
  br label %79

; <label>:51                                      ; preds = %47
  %52 = load %struct.pb_Parameters** %ret, align 8
  %53 = getelementptr inbounds %struct.pb_Parameters* %52, i32 0, i32 0
  %54 = load i8** %53, align 8
  call void @free(i8* %54) #6
  %55 = call i8* @consume_argument(%struct.argparse* %ap)
  %56 = call noalias i8* @strdup(i8* %55) #6
  %57 = load %struct.pb_Parameters** %ret, align 8
  %58 = getelementptr inbounds %struct.pb_Parameters* %57, i32 0, i32 0
  store i8* %56, i8** %58, align 8
  br label %70

; <label>:59                                      ; preds = %42
  %60 = call i32 @is_end_of_arguments(%struct.argparse* %ap)
  %61 = icmp ne i32 %60, 0
  br i1 %61, label %62, label %63

; <label>:62                                      ; preds = %59
  store i8* getelementptr inbounds ([32 x i8]* @.str18, i32 0, i32 0), i8** %err_message, align 8
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
  store i8* getelementptr inbounds ([35 x i8]* @.str29, i32 0, i32 0), i8** %err_message, align 8
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
  call void @free(i8* %4) #6
  %5 = load %struct.pb_Parameters** %1, align 8
  %6 = getelementptr inbounds %struct.pb_Parameters* %5, i32 0, i32 1
  %7 = load i8*** %6, align 8
  call void @free_string_array(i8** %7)
  %8 = load %struct.pb_Parameters** %1, align 8
  %9 = bitcast %struct.pb_Parameters* %8 to i8*
  call void @free(i8* %9) #6
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
  %8 = call i32 @fputs(i8* getelementptr inbounds ([43 x i8]* @.str310, i32 0, i32 0), %struct._IO_FILE* %7)
  br label %21

; <label>:9                                       ; preds = %0
  %10 = load %struct.pb_Timer** %1, align 8
  %11 = getelementptr inbounds %struct.pb_Timer* %10, i32 0, i32 0
  store i32 1, i32* %11, align 4
  %12 = call i32 @gettimeofday(%struct.timeval* %tv, %struct.timezone* null) #6
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
  %9 = call i32 @fputs(i8* getelementptr inbounds ([32 x i8]* @.str411, i32 0, i32 0), %struct._IO_FILE* %8)
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
  %19 = call i32 @fputs(i8* getelementptr inbounds ([35 x i8]* @.str512, i32 0, i32 0), %struct._IO_FILE* %18)
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
  %27 = call i32 @fputs(i8* getelementptr inbounds ([54 x i8]* @.str613, i32 0, i32 0), %struct._IO_FILE* %26)
  br label %59

; <label>:28                                      ; preds = %22
  %29 = load %struct.pb_Timer** %1, align 8
  %30 = getelementptr inbounds %struct.pb_Timer* %29, i32 0, i32 0
  store i32 1, i32* %30, align 4
  %31 = load %struct.pb_Timer** %2, align 8
  %32 = getelementptr inbounds %struct.pb_Timer* %31, i32 0, i32 0
  store i32 1, i32* %32, align 4
  %33 = call i32 @gettimeofday(%struct.timeval* %tv, %struct.timezone* null) #6
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
  %8 = call i32 @fputs(i8* getelementptr inbounds ([42 x i8]* @.str714, i32 0, i32 0), %struct._IO_FILE* %7)
  br label %28

; <label>:9                                       ; preds = %0
  %10 = load %struct.pb_Timer** %1, align 8
  %11 = getelementptr inbounds %struct.pb_Timer* %10, i32 0, i32 0
  store i32 0, i32* %11, align 4
  %12 = call i32 @gettimeofday(%struct.timeval* %tv, %struct.timezone* null) #6
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
  %33 = call i32 @gettimeofday(%struct.timeval* %tv, %struct.timezone* null) #6
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
  %4 = call noalias i8* @malloc(i64 40) #6
  %5 = bitcast i8* %4 to %struct.pb_SubTimer*
  store %struct.pb_SubTimer* %5, %struct.pb_SubTimer** %subtimer, align 8
  %6 = load i8** %2, align 8
  %7 = call i64 @strlen(i8* %6) #9
  %8 = trunc i64 %7 to i32
  store i32 %8, i32* %len, align 4
  %9 = load i32* %len, align 4
  %10 = add nsw i32 %9, 1
  %11 = sext i32 %10 to i64
  %12 = mul i64 1, %11
  %13 = call noalias i8* @malloc(i64 %12) #6
  %14 = load %struct.pb_SubTimer** %subtimer, align 8
  %15 = getelementptr inbounds %struct.pb_SubTimer* %14, i32 0, i32 0
  store i8* %13, i8** %15, align 8
  %16 = load %struct.pb_SubTimer** %subtimer, align 8
  %17 = getelementptr inbounds %struct.pb_SubTimer* %16, i32 0, i32 0
  %18 = load i8** %17, align 8
  %19 = load i8** %2, align 8
  %20 = call i32 (i8*, i8*, ...)* @sprintf(i8* %18, i8* getelementptr inbounds ([4 x i8]* @.str12, i32 0, i32 0), i8* %19) #6
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
  %34 = call noalias i8* @malloc(i64 16) #6
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
declare i64 @strlen(i8*) #5

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
  %85 = call i32 @strcmp(i8* %83, i8* %84) #9
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
declare i32 @strcmp(i8*, i8*) #5

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
  store i8* getelementptr inbounds ([5 x i8]* @.str15, i32 0, i32 0), i8** %10
  %11 = getelementptr [6 x i8*]* %7, i32 0, i32 3
  store i8* getelementptr inbounds ([7 x i8]* @.str16, i32 0, i32 0), i8** %11
  %12 = getelementptr [6 x i8*]* %7, i32 0, i32 4
  store i8* getelementptr inbounds ([11 x i8]* @.str17, i32 0, i32 0), i8** %12
  %13 = getelementptr [6 x i8*]* %7, i32 0, i32 5
  store i8* getelementptr inbounds ([8 x i8]* @.str1815, i32 0, i32 0), i8** %13
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
  %59 = call i64 @strlen(i8* %58) #9
  %60 = load i32* %maxSubLength, align 4
  %61 = sext i32 %60 to i64
  %62 = icmp ugt i64 %59, %61
  br i1 %62, label %63, label %69

; <label>:63                                      ; preds = %55
  %64 = load %struct.pb_SubTimer** %sub, align 8
  %65 = getelementptr inbounds %struct.pb_SubTimer* %64, i32 0, i32 0
  %66 = load i8** %65, align 8
  %67 = call i64 @strlen(i8* %66) #9
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
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #6

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
  call void @free(i8* %14) #6
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
  call void @free(i8* %44) #6
  %45 = load %struct.pb_SubTimer** %subtimer, align 8
  store %struct.pb_SubTimer* %45, %struct.pb_SubTimer** %prev, align 8
  %46 = load %struct.pb_SubTimer** %subtimer, align 8
  %47 = getelementptr inbounds %struct.pb_SubTimer* %46, i32 0, i32 2
  %48 = load %struct.pb_SubTimer** %47, align 8
  store %struct.pb_SubTimer* %48, %struct.pb_SubTimer** %subtimer, align 8
  %49 = load %struct.pb_SubTimer** %prev, align 8
  %50 = bitcast %struct.pb_SubTimer* %49 to i8*
  call void @free(i8* %50) #6
  br label %38

; <label>:51                                      ; preds = %38
  %52 = load i32* %i, align 4
  %53 = sext i32 %52 to i64
  %54 = load %struct.pb_TimerSet** %1, align 8
  %55 = getelementptr inbounds %struct.pb_TimerSet* %54, i32 0, i32 5
  %56 = getelementptr inbounds [8 x %struct.pb_SubTimerList*]* %55, i32 0, i64 %53
  %57 = load %struct.pb_SubTimerList** %56, align 8
  %58 = bitcast %struct.pb_SubTimerList* %57 to i8*
  call void @free(i8* %58) #6
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
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #6

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
  %29 = call noalias i8* @malloc(i64 %28) #6
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
  %62 = call noalias i8* @malloc(i64 %61) #6
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
  call void @free(i8* %13) #6
  br label %14

; <label>:14                                      ; preds = %11
  %15 = load i8*** %p, align 8
  %16 = getelementptr inbounds i8** %15, i32 1
  store i8** %16, i8*** %p, align 8
  br label %7

; <label>:17                                      ; preds = %7
  %18 = load i8*** %1, align 8
  %19 = bitcast i8** %18 to i8*
  call void @free(i8* %19) #6
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
  %1 = call i32 @gettimeofday(%struct.timeval* %tv, %struct.timezone* null) #6
  %2 = getelementptr inbounds %struct.timeval* %tv, i32 0, i32 0
  %3 = load i64* %2, align 8
  %4 = mul nsw i64 %3, 1000000
  %5 = getelementptr inbounds %struct.timeval* %tv, i32 0, i32 1
  %6 = load i64* %5, align 8
  %7 = add nsw i64 %4, %6
  ret i64 %7
}

; Function Attrs: nounwind uwtable
define zeroext i16 @read16u(%struct._IO_FILE* %f) #0 {
  %1 = alloca %struct._IO_FILE*, align 8
  %n = alloca i32, align 4
  store %struct._IO_FILE* %f, %struct._IO_FILE** %1, align 8
  %2 = load %struct._IO_FILE** %1, align 8
  %3 = call i32 @fgetc(%struct._IO_FILE* %2)
  store i32 %3, i32* %n, align 4
  %4 = load %struct._IO_FILE** %1, align 8
  %5 = call i32 @fgetc(%struct._IO_FILE* %4)
  %6 = shl i32 %5, 8
  %7 = load i32* %n, align 4
  %8 = add nsw i32 %7, %6
  store i32 %8, i32* %n, align 4
  %9 = load i32* %n, align 4
  %10 = trunc i32 %9 to i16
  ret i16 %10
}

declare i32 @fgetc(%struct._IO_FILE*) #1

; Function Attrs: nounwind uwtable
define signext i16 @read16i(%struct._IO_FILE* %f) #0 {
  %1 = alloca %struct._IO_FILE*, align 8
  %n = alloca i32, align 4
  store %struct._IO_FILE* %f, %struct._IO_FILE** %1, align 8
  %2 = load %struct._IO_FILE** %1, align 8
  %3 = call i32 @fgetc(%struct._IO_FILE* %2)
  store i32 %3, i32* %n, align 4
  %4 = load %struct._IO_FILE** %1, align 8
  %5 = call i32 @fgetc(%struct._IO_FILE* %4)
  %6 = shl i32 %5, 8
  %7 = load i32* %n, align 4
  %8 = add nsw i32 %7, %6
  store i32 %8, i32* %n, align 4
  %9 = load i32* %n, align 4
  %10 = trunc i32 %9 to i16
  ret i16 %10
}

; Function Attrs: nounwind uwtable
define void @write32u(%struct._IO_FILE* %f, i32 %i) #0 {
  %1 = alloca %struct._IO_FILE*, align 8
  %2 = alloca i32, align 4
  store %struct._IO_FILE* %f, %struct._IO_FILE** %1, align 8
  store i32 %i, i32* %2, align 4
  %3 = load i32* %2, align 4
  %4 = load %struct._IO_FILE** %1, align 8
  %5 = call i32 @_IO_putc(i32 %3, %struct._IO_FILE* %4)
  %6 = load i32* %2, align 4
  %7 = lshr i32 %6, 8
  %8 = load %struct._IO_FILE** %1, align 8
  %9 = call i32 @_IO_putc(i32 %7, %struct._IO_FILE* %8)
  %10 = load i32* %2, align 4
  %11 = lshr i32 %10, 16
  %12 = load %struct._IO_FILE** %1, align 8
  %13 = call i32 @_IO_putc(i32 %11, %struct._IO_FILE* %12)
  %14 = load i32* %2, align 4
  %15 = lshr i32 %14, 24
  %16 = load %struct._IO_FILE** %1, align 8
  %17 = call i32 @_IO_putc(i32 %15, %struct._IO_FILE* %16)
  ret void
}

declare i32 @_IO_putc(i32, %struct._IO_FILE*) #1

; Function Attrs: nounwind uwtable
define void @write16u(%struct._IO_FILE* %f, i16 zeroext %h) #0 {
  %1 = alloca %struct._IO_FILE*, align 8
  %2 = alloca i16, align 2
  store %struct._IO_FILE* %f, %struct._IO_FILE** %1, align 8
  store i16 %h, i16* %2, align 2
  %3 = load i16* %2, align 2
  %4 = zext i16 %3 to i32
  %5 = load %struct._IO_FILE** %1, align 8
  %6 = call i32 @_IO_putc(i32 %4, %struct._IO_FILE* %5)
  %7 = load i16* %2, align 2
  %8 = zext i16 %7 to i32
  %9 = ashr i32 %8, 8
  %10 = load %struct._IO_FILE** %1, align 8
  %11 = call i32 @_IO_putc(i32 %9, %struct._IO_FILE* %10)
  ret void
}

; Function Attrs: nounwind uwtable
define void @write16i(%struct._IO_FILE* %f, i16 signext %h) #0 {
  %1 = alloca %struct._IO_FILE*, align 8
  %2 = alloca i16, align 2
  store %struct._IO_FILE* %f, %struct._IO_FILE** %1, align 8
  store i16 %h, i16* %2, align 2
  %3 = load i16* %2, align 2
  %4 = sext i16 %3 to i32
  %5 = load %struct._IO_FILE** %1, align 8
  %6 = call i32 @_IO_putc(i32 %4, %struct._IO_FILE* %5)
  %7 = load i16* %2, align 2
  %8 = sext i16 %7 to i32
  %9 = ashr i32 %8, 8
  %10 = load %struct._IO_FILE** %1, align 8
  %11 = call i32 @_IO_putc(i32 %9, %struct._IO_FILE* %10)
  ret void
}

; Function Attrs: nounwind uwtable
define %struct.image_i16* @load_image(i8* %filename) #0 {
  %1 = alloca i8*, align 8
  %infile = alloca %struct._IO_FILE*, align 8
  %data = alloca i16*, align 8
  %w = alloca i32, align 4
  %h = alloca i32, align 4
  %ret = alloca %struct.image_i16*, align 8
  store i8* %filename, i8** %1, align 8
  %2 = load i8** %1, align 8
  %3 = call %struct._IO_FILE* @fopen(i8* %2, i8* getelementptr inbounds ([2 x i8]* @.str32, i32 0, i32 0))
  store %struct._IO_FILE* %3, %struct._IO_FILE** %infile, align 8
  %4 = load %struct._IO_FILE** %infile, align 8
  %5 = icmp ne %struct._IO_FILE* %4, null
  br i1 %5, label %10, label %6

; <label>:6                                       ; preds = %0
  %7 = load %struct._IO_FILE** @stderr, align 8
  %8 = load i8** %1, align 8
  %9 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([23 x i8]* @.str133, i32 0, i32 0), i8* %8)
  call void @exit(i32 -1) #8
  unreachable

; <label>:10                                      ; preds = %0
  %11 = load %struct._IO_FILE** %infile, align 8
  %12 = call zeroext i16 @read16u(%struct._IO_FILE* %11)
  %13 = zext i16 %12 to i32
  store i32 %13, i32* %w, align 4
  %14 = load %struct._IO_FILE** %infile, align 8
  %15 = call zeroext i16 @read16u(%struct._IO_FILE* %14)
  %16 = zext i16 %15 to i32
  store i32 %16, i32* %h, align 4
  %17 = load i32* %w, align 4
  %18 = load i32* %h, align 4
  %19 = mul nsw i32 %17, %18
  %20 = sext i32 %19 to i64
  %21 = mul i64 %20, 2
  %22 = call noalias i8* @malloc(i64 %21) #6
  %23 = bitcast i8* %22 to i16*
  store i16* %23, i16** %data, align 8
  %24 = load i16** %data, align 8
  %25 = bitcast i16* %24 to i8*
  %26 = load i32* %w, align 4
  %27 = load i32* %h, align 4
  %28 = mul nsw i32 %26, %27
  %29 = sext i32 %28 to i64
  %30 = load %struct._IO_FILE** %infile, align 8
  %31 = call i64 @fread(i8* %25, i64 2, i64 %29, %struct._IO_FILE* %30)
  %32 = load %struct._IO_FILE** %infile, align 8
  %33 = call i32 @fclose(%struct._IO_FILE* %32)
  %34 = call noalias i8* @malloc(i64 16) #6
  %35 = bitcast i8* %34 to %struct.image_i16*
  store %struct.image_i16* %35, %struct.image_i16** %ret, align 8
  %36 = load i32* %w, align 4
  %37 = load %struct.image_i16** %ret, align 8
  %38 = getelementptr inbounds %struct.image_i16* %37, i32 0, i32 0
  store i32 %36, i32* %38, align 4
  %39 = load i32* %h, align 4
  %40 = load %struct.image_i16** %ret, align 8
  %41 = getelementptr inbounds %struct.image_i16* %40, i32 0, i32 1
  store i32 %39, i32* %41, align 4
  %42 = load i16** %data, align 8
  %43 = load %struct.image_i16** %ret, align 8
  %44 = getelementptr inbounds %struct.image_i16* %43, i32 0, i32 2
  store i16* %42, i16** %44, align 8
  %45 = load %struct.image_i16** %ret, align 8
  ret %struct.image_i16* %45
}

declare i64 @fread(i8*, i64, i64, %struct._IO_FILE*) #1

; Function Attrs: nounwind uwtable
define void @free_image(%struct.image_i16* %img) #0 {
  %1 = alloca %struct.image_i16*, align 8
  store %struct.image_i16* %img, %struct.image_i16** %1, align 8
  %2 = load %struct.image_i16** %1, align 8
  %3 = getelementptr inbounds %struct.image_i16* %2, i32 0, i32 2
  %4 = load i16** %3, align 8
  %5 = bitcast i16* %4 to i8*
  call void @free(i8* %5) #6
  %6 = load %struct.image_i16** %1, align 8
  %7 = bitcast %struct.image_i16* %6 to i8*
  call void @free(i8* %7) #6
  ret void
}

; Function Attrs: nounwind uwtable
define void @sad4_cpu(i16* %blk_sad, i16* %frame, i16* %ref, i32 %mb_width, i32 %mb_height) #0 {
  %1 = alloca i16*, align 8
  %2 = alloca i16*, align 8
  %3 = alloca i16*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %mb_x = alloca i32, align 4
  %mb_y = alloca i32, align 4
  %bk_x = alloca i32, align 4
  %bk_y = alloca i32, align 4
  %frame_yoff = alloca i32, align 4
  store i16* %blk_sad, i16** %1, align 8
  store i16* %frame, i16** %2, align 8
  store i16* %ref, i16** %3, align 8
  store i32 %mb_width, i32* %4, align 4
  store i32 %mb_height, i32* %5, align 4
  %6 = load i32* %4, align 4
  %7 = load i32* %5, align 4
  %8 = mul nsw i32 %6, %7
  %9 = mul nsw i32 %8, 27300
  %10 = load i16** %1, align 8
  %11 = sext i32 %9 to i64
  %12 = getelementptr inbounds i16* %10, i64 %11
  store i16* %12, i16** %1, align 8
  store i32 0, i32* %mb_y, align 4
  store i32 0, i32* %frame_yoff, align 4
  br label %13

; <label>:13                                      ; preds = %51, %0
  %14 = load i32* %mb_y, align 4
  %15 = load i32* %5, align 4
  %16 = icmp slt i32 %14, %15
  br i1 %16, label %17, label %58

; <label>:17                                      ; preds = %13
  store i32 0, i32* %mb_x, align 4
  br label %18

; <label>:18                                      ; preds = %47, %17
  %19 = load i32* %mb_x, align 4
  %20 = load i32* %4, align 4
  %21 = icmp slt i32 %19, %20
  br i1 %21, label %22, label %50

; <label>:22                                      ; preds = %18
  %23 = load i16** %1, align 8
  %24 = load i32* %mb_y, align 4
  %25 = load i32* %4, align 4
  %26 = mul nsw i32 %24, %25
  %27 = load i32* %mb_x, align 4
  %28 = add nsw i32 %26, %27
  %29 = mul nsw i32 %28, 17472
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds i16* %23, i64 %30
  %32 = load i16** %2, align 8
  %33 = load i32* %frame_yoff, align 4
  %34 = zext i32 %33 to i64
  %35 = getelementptr inbounds i16* %32, i64 %34
  %36 = load i32* %mb_x, align 4
  %37 = mul nsw i32 %36, 16
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds i16* %35, i64 %38
  %40 = load i16** %3, align 8
  %41 = load i32* %mb_y, align 4
  %42 = mul nsw i32 %41, 16
  %43 = load i32* %mb_x, align 4
  %44 = mul nsw i32 %43, 16
  %45 = load i32* %4, align 4
  %46 = load i32* %5, align 4
  call void @sad4_one_macroblock(i16* %31, i16* %39, i16* %40, i32 %42, i32 %44, i32 %45, i32 %46)
  br label %47

; <label>:47                                      ; preds = %22
  %48 = load i32* %mb_x, align 4
  %49 = add nsw i32 %48, 1
  store i32 %49, i32* %mb_x, align 4
  br label %18

; <label>:50                                      ; preds = %18
  br label %51

; <label>:51                                      ; preds = %50
  %52 = load i32* %mb_y, align 4
  %53 = add nsw i32 %52, 1
  store i32 %53, i32* %mb_y, align 4
  %54 = load i32* %4, align 4
  %55 = mul nsw i32 256, %54
  %56 = load i32* %frame_yoff, align 4
  %57 = add i32 %56, %55
  store i32 %57, i32* %frame_yoff, align 4
  br label %13

; <label>:58                                      ; preds = %13
  ret void
}

; Function Attrs: nounwind uwtable
define void @larger_sads(i16* %sads, i32 %mbs) #0 {
  %1 = alloca i16*, align 8
  %2 = alloca i32, align 4
  %macroblock = alloca i32, align 4
  %block_x = alloca i32, align 4
  %block_y = alloca i32, align 4
  %x = alloca i16*, align 8
  %y = alloca i16*, align 8
  %z = alloca i16*, align 8
  %count = alloca i32, align 4
  store i16* %sads, i16** %1, align 8
  store i32 %mbs, i32* %2, align 4
  store i32 0, i32* %macroblock, align 4
  br label %3

; <label>:3                                       ; preds = %436, %0
  %4 = load i32* %macroblock, align 4
  %5 = load i32* %2, align 4
  %6 = icmp slt i32 %4, %5
  br i1 %6, label %7, label %439

; <label>:7                                       ; preds = %3
  store i32 0, i32* %block_y, align 4
  br label %8

; <label>:8                                       ; preds = %76, %7
  %9 = load i32* %block_y, align 4
  %10 = icmp slt i32 %9, 2
  br i1 %10, label %11, label %79

; <label>:11                                      ; preds = %8
  store i32 0, i32* %block_x, align 4
  br label %12

; <label>:12                                      ; preds = %72, %11
  %13 = load i32* %block_x, align 4
  %14 = icmp slt i32 %13, 4
  br i1 %14, label %15, label %75

; <label>:15                                      ; preds = %12
  %16 = load i16** %1, align 8
  %17 = load i32* %2, align 4
  %18 = mul nsw i32 %17, 27300
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds i16* %16, i64 %19
  %21 = load i32* %macroblock, align 4
  %22 = mul nsw i32 %21, 16
  %23 = mul nsw i32 %22, 1092
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds i16* %20, i64 %24
  %26 = load i32* %block_y, align 4
  %27 = mul nsw i32 8, %26
  %28 = load i32* %block_x, align 4
  %29 = add nsw i32 %27, %28
  %30 = mul nsw i32 %29, 1092
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds i16* %25, i64 %31
  store i16* %32, i16** %x, align 8
  %33 = load i16** %x, align 8
  %34 = getelementptr inbounds i16* %33, i64 4368
  store i16* %34, i16** %y, align 8
  %35 = load i16** %1, align 8
  %36 = load i32* %2, align 4
  %37 = mul nsw i32 %36, 18564
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds i16* %35, i64 %38
  %40 = load i32* %macroblock, align 4
  %41 = mul nsw i32 %40, 8
  %42 = mul nsw i32 %41, 1092
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds i16* %39, i64 %43
  %45 = load i32* %block_y, align 4
  %46 = mul nsw i32 4, %45
  %47 = load i32* %block_x, align 4
  %48 = add nsw i32 %46, %47
  %49 = mul nsw i32 %48, 1092
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds i16* %44, i64 %50
  store i16* %51, i16** %z, align 8
  store i32 0, i32* %count, align 4
  br label %52

; <label>:52                                      ; preds = %68, %15
  %53 = load i32* %count, align 4
  %54 = icmp slt i32 %53, 1089
  br i1 %54, label %55, label %71

; <label>:55                                      ; preds = %52
  %56 = load i16** %x, align 8
  %57 = getelementptr inbounds i16* %56, i32 1
  store i16* %57, i16** %x, align 8
  %58 = load i16* %56, align 2
  %59 = zext i16 %58 to i32
  %60 = load i16** %y, align 8
  %61 = getelementptr inbounds i16* %60, i32 1
  store i16* %61, i16** %y, align 8
  %62 = load i16* %60, align 2
  %63 = zext i16 %62 to i32
  %64 = add nsw i32 %59, %63
  %65 = trunc i32 %64 to i16
  %66 = load i16** %z, align 8
  %67 = getelementptr inbounds i16* %66, i32 1
  store i16* %67, i16** %z, align 8
  store i16 %65, i16* %66, align 2
  br label %68

; <label>:68                                      ; preds = %55
  %69 = load i32* %count, align 4
  %70 = add nsw i32 %69, 1
  store i32 %70, i32* %count, align 4
  br label %52

; <label>:71                                      ; preds = %52
  br label %72

; <label>:72                                      ; preds = %71
  %73 = load i32* %block_x, align 4
  %74 = add nsw i32 %73, 1
  store i32 %74, i32* %block_x, align 4
  br label %12

; <label>:75                                      ; preds = %12
  br label %76

; <label>:76                                      ; preds = %75
  %77 = load i32* %block_y, align 4
  %78 = add nsw i32 %77, 1
  store i32 %78, i32* %block_y, align 4
  br label %8

; <label>:79                                      ; preds = %8
  store i32 0, i32* %block_y, align 4
  br label %80

; <label>:80                                      ; preds = %149, %79
  %81 = load i32* %block_y, align 4
  %82 = icmp slt i32 %81, 4
  br i1 %82, label %83, label %152

; <label>:83                                      ; preds = %80
  store i32 0, i32* %block_x, align 4
  br label %84

; <label>:84                                      ; preds = %145, %83
  %85 = load i32* %block_x, align 4
  %86 = icmp slt i32 %85, 2
  br i1 %86, label %87, label %148

; <label>:87                                      ; preds = %84
  %88 = load i16** %1, align 8
  %89 = load i32* %2, align 4
  %90 = mul nsw i32 %89, 27300
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds i16* %88, i64 %91
  %93 = load i32* %macroblock, align 4
  %94 = mul nsw i32 %93, 16
  %95 = mul nsw i32 %94, 1092
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds i16* %92, i64 %96
  %98 = load i32* %block_y, align 4
  %99 = mul nsw i32 4, %98
  %100 = load i32* %block_x, align 4
  %101 = mul nsw i32 2, %100
  %102 = add nsw i32 %99, %101
  %103 = mul nsw i32 %102, 1092
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds i16* %97, i64 %104
  store i16* %105, i16** %x, align 8
  %106 = load i16** %x, align 8
  %107 = getelementptr inbounds i16* %106, i64 1092
  store i16* %107, i16** %y, align 8
  %108 = load i16** %1, align 8
  %109 = load i32* %2, align 4
  %110 = mul nsw i32 %109, 9828
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds i16* %108, i64 %111
  %113 = load i32* %macroblock, align 4
  %114 = mul nsw i32 %113, 8
  %115 = mul nsw i32 %114, 1092
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds i16* %112, i64 %116
  %118 = load i32* %block_y, align 4
  %119 = mul nsw i32 2, %118
  %120 = load i32* %block_x, align 4
  %121 = add nsw i32 %119, %120
  %122 = mul nsw i32 %121, 1092
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds i16* %117, i64 %123
  store i16* %124, i16** %z, align 8
  store i32 0, i32* %count, align 4
  br label %125

; <label>:125                                     ; preds = %141, %87
  %126 = load i32* %count, align 4
  %127 = icmp slt i32 %126, 1089
  br i1 %127, label %128, label %144

; <label>:128                                     ; preds = %125
  %129 = load i16** %x, align 8
  %130 = getelementptr inbounds i16* %129, i32 1
  store i16* %130, i16** %x, align 8
  %131 = load i16* %129, align 2
  %132 = zext i16 %131 to i32
  %133 = load i16** %y, align 8
  %134 = getelementptr inbounds i16* %133, i32 1
  store i16* %134, i16** %y, align 8
  %135 = load i16* %133, align 2
  %136 = zext i16 %135 to i32
  %137 = add nsw i32 %132, %136
  %138 = trunc i32 %137 to i16
  %139 = load i16** %z, align 8
  %140 = getelementptr inbounds i16* %139, i32 1
  store i16* %140, i16** %z, align 8
  store i16 %138, i16* %139, align 2
  br label %141

; <label>:141                                     ; preds = %128
  %142 = load i32* %count, align 4
  %143 = add nsw i32 %142, 1
  store i32 %143, i32* %count, align 4
  br label %125

; <label>:144                                     ; preds = %125
  br label %145

; <label>:145                                     ; preds = %144
  %146 = load i32* %block_x, align 4
  %147 = add nsw i32 %146, 1
  store i32 %147, i32* %block_x, align 4
  br label %84

; <label>:148                                     ; preds = %84
  br label %149

; <label>:149                                     ; preds = %148
  %150 = load i32* %block_y, align 4
  %151 = add nsw i32 %150, 1
  store i32 %151, i32* %block_y, align 4
  br label %80

; <label>:152                                     ; preds = %80
  store i32 0, i32* %block_y, align 4
  br label %153

; <label>:153                                     ; preds = %221, %152
  %154 = load i32* %block_y, align 4
  %155 = icmp slt i32 %154, 2
  br i1 %155, label %156, label %224

; <label>:156                                     ; preds = %153
  store i32 0, i32* %block_x, align 4
  br label %157

; <label>:157                                     ; preds = %217, %156
  %158 = load i32* %block_x, align 4
  %159 = icmp slt i32 %158, 2
  br i1 %159, label %160, label %220

; <label>:160                                     ; preds = %157
  %161 = load i16** %1, align 8
  %162 = load i32* %2, align 4
  %163 = mul nsw i32 %162, 9828
  %164 = sext i32 %163 to i64
  %165 = getelementptr inbounds i16* %161, i64 %164
  %166 = load i32* %macroblock, align 4
  %167 = mul nsw i32 %166, 8
  %168 = mul nsw i32 %167, 1092
  %169 = sext i32 %168 to i64
  %170 = getelementptr inbounds i16* %165, i64 %169
  %171 = load i32* %block_y, align 4
  %172 = mul nsw i32 4, %171
  %173 = load i32* %block_x, align 4
  %174 = add nsw i32 %172, %173
  %175 = mul nsw i32 %174, 1092
  %176 = sext i32 %175 to i64
  %177 = getelementptr inbounds i16* %170, i64 %176
  store i16* %177, i16** %x, align 8
  %178 = load i16** %x, align 8
  %179 = getelementptr inbounds i16* %178, i64 2184
  store i16* %179, i16** %y, align 8
  %180 = load i16** %1, align 8
  %181 = load i32* %2, align 4
  %182 = mul nsw i32 %181, 5460
  %183 = sext i32 %182 to i64
  %184 = getelementptr inbounds i16* %180, i64 %183
  %185 = load i32* %macroblock, align 4
  %186 = mul nsw i32 %185, 4
  %187 = mul nsw i32 %186, 1092
  %188 = sext i32 %187 to i64
  %189 = getelementptr inbounds i16* %184, i64 %188
  %190 = load i32* %block_y, align 4
  %191 = mul nsw i32 2, %190
  %192 = load i32* %block_x, align 4
  %193 = add nsw i32 %191, %192
  %194 = mul nsw i32 %193, 1092
  %195 = sext i32 %194 to i64
  %196 = getelementptr inbounds i16* %189, i64 %195
  store i16* %196, i16** %z, align 8
  store i32 0, i32* %count, align 4
  br label %197

; <label>:197                                     ; preds = %213, %160
  %198 = load i32* %count, align 4
  %199 = icmp slt i32 %198, 1089
  br i1 %199, label %200, label %216

; <label>:200                                     ; preds = %197
  %201 = load i16** %x, align 8
  %202 = getelementptr inbounds i16* %201, i32 1
  store i16* %202, i16** %x, align 8
  %203 = load i16* %201, align 2
  %204 = zext i16 %203 to i32
  %205 = load i16** %y, align 8
  %206 = getelementptr inbounds i16* %205, i32 1
  store i16* %206, i16** %y, align 8
  %207 = load i16* %205, align 2
  %208 = zext i16 %207 to i32
  %209 = add nsw i32 %204, %208
  %210 = trunc i32 %209 to i16
  %211 = load i16** %z, align 8
  %212 = getelementptr inbounds i16* %211, i32 1
  store i16* %212, i16** %z, align 8
  store i16 %210, i16* %211, align 2
  br label %213

; <label>:213                                     ; preds = %200
  %214 = load i32* %count, align 4
  %215 = add nsw i32 %214, 1
  store i32 %215, i32* %count, align 4
  br label %197

; <label>:216                                     ; preds = %197
  br label %217

; <label>:217                                     ; preds = %216
  %218 = load i32* %block_x, align 4
  %219 = add nsw i32 %218, 1
  store i32 %219, i32* %block_x, align 4
  br label %157

; <label>:220                                     ; preds = %157
  br label %221

; <label>:221                                     ; preds = %220
  %222 = load i32* %block_y, align 4
  %223 = add nsw i32 %222, 1
  store i32 %223, i32* %block_y, align 4
  br label %153

; <label>:224                                     ; preds = %153
  %225 = load i16** %1, align 8
  %226 = load i32* %2, align 4
  %227 = mul nsw i32 %226, 5460
  %228 = sext i32 %227 to i64
  %229 = getelementptr inbounds i16* %225, i64 %228
  %230 = load i32* %macroblock, align 4
  %231 = mul nsw i32 %230, 4
  %232 = mul nsw i32 %231, 1092
  %233 = sext i32 %232 to i64
  %234 = getelementptr inbounds i16* %229, i64 %233
  store i16* %234, i16** %x, align 8
  %235 = load i16** %x, align 8
  %236 = getelementptr inbounds i16* %235, i64 2184
  store i16* %236, i16** %y, align 8
  %237 = load i16** %1, align 8
  %238 = load i32* %2, align 4
  %239 = mul nsw i32 %238, 3276
  %240 = sext i32 %239 to i64
  %241 = getelementptr inbounds i16* %237, i64 %240
  %242 = load i32* %macroblock, align 4
  %243 = mul nsw i32 %242, 2
  %244 = mul nsw i32 %243, 1092
  %245 = sext i32 %244 to i64
  %246 = getelementptr inbounds i16* %241, i64 %245
  store i16* %246, i16** %z, align 8
  store i32 0, i32* %count, align 4
  br label %247

; <label>:247                                     ; preds = %263, %224
  %248 = load i32* %count, align 4
  %249 = icmp slt i32 %248, 1089
  br i1 %249, label %250, label %266

; <label>:250                                     ; preds = %247
  %251 = load i16** %x, align 8
  %252 = getelementptr inbounds i16* %251, i32 1
  store i16* %252, i16** %x, align 8
  %253 = load i16* %251, align 2
  %254 = zext i16 %253 to i32
  %255 = load i16** %y, align 8
  %256 = getelementptr inbounds i16* %255, i32 1
  store i16* %256, i16** %y, align 8
  %257 = load i16* %255, align 2
  %258 = zext i16 %257 to i32
  %259 = add nsw i32 %254, %258
  %260 = trunc i32 %259 to i16
  %261 = load i16** %z, align 8
  %262 = getelementptr inbounds i16* %261, i32 1
  store i16* %262, i16** %z, align 8
  store i16 %260, i16* %261, align 2
  br label %263

; <label>:263                                     ; preds = %250
  %264 = load i32* %count, align 4
  %265 = add nsw i32 %264, 1
  store i32 %265, i32* %count, align 4
  br label %247

; <label>:266                                     ; preds = %247
  %267 = load i16** %1, align 8
  %268 = load i32* %2, align 4
  %269 = mul nsw i32 %268, 5460
  %270 = sext i32 %269 to i64
  %271 = getelementptr inbounds i16* %267, i64 %270
  %272 = load i32* %macroblock, align 4
  %273 = mul nsw i32 %272, 4
  %274 = mul nsw i32 %273, 1092
  %275 = sext i32 %274 to i64
  %276 = getelementptr inbounds i16* %271, i64 %275
  %277 = getelementptr inbounds i16* %276, i64 1092
  store i16* %277, i16** %x, align 8
  %278 = load i16** %x, align 8
  %279 = getelementptr inbounds i16* %278, i64 2184
  store i16* %279, i16** %y, align 8
  %280 = load i16** %1, align 8
  %281 = load i32* %2, align 4
  %282 = mul nsw i32 %281, 3276
  %283 = sext i32 %282 to i64
  %284 = getelementptr inbounds i16* %280, i64 %283
  %285 = load i32* %macroblock, align 4
  %286 = mul nsw i32 %285, 2
  %287 = mul nsw i32 %286, 1092
  %288 = sext i32 %287 to i64
  %289 = getelementptr inbounds i16* %284, i64 %288
  %290 = getelementptr inbounds i16* %289, i64 1092
  store i16* %290, i16** %z, align 8
  store i32 0, i32* %count, align 4
  br label %291

; <label>:291                                     ; preds = %307, %266
  %292 = load i32* %count, align 4
  %293 = icmp slt i32 %292, 1089
  br i1 %293, label %294, label %310

; <label>:294                                     ; preds = %291
  %295 = load i16** %x, align 8
  %296 = getelementptr inbounds i16* %295, i32 1
  store i16* %296, i16** %x, align 8
  %297 = load i16* %295, align 2
  %298 = zext i16 %297 to i32
  %299 = load i16** %y, align 8
  %300 = getelementptr inbounds i16* %299, i32 1
  store i16* %300, i16** %y, align 8
  %301 = load i16* %299, align 2
  %302 = zext i16 %301 to i32
  %303 = add nsw i32 %298, %302
  %304 = trunc i32 %303 to i16
  %305 = load i16** %z, align 8
  %306 = getelementptr inbounds i16* %305, i32 1
  store i16* %306, i16** %z, align 8
  store i16 %304, i16* %305, align 2
  br label %307

; <label>:307                                     ; preds = %294
  %308 = load i32* %count, align 4
  %309 = add nsw i32 %308, 1
  store i32 %309, i32* %count, align 4
  br label %291

; <label>:310                                     ; preds = %291
  %311 = load i16** %1, align 8
  %312 = load i32* %2, align 4
  %313 = mul nsw i32 %312, 5460
  %314 = sext i32 %313 to i64
  %315 = getelementptr inbounds i16* %311, i64 %314
  %316 = load i32* %macroblock, align 4
  %317 = mul nsw i32 %316, 4
  %318 = mul nsw i32 %317, 1092
  %319 = sext i32 %318 to i64
  %320 = getelementptr inbounds i16* %315, i64 %319
  store i16* %320, i16** %x, align 8
  %321 = load i16** %x, align 8
  %322 = getelementptr inbounds i16* %321, i64 1092
  store i16* %322, i16** %y, align 8
  %323 = load i16** %1, align 8
  %324 = load i32* %2, align 4
  %325 = mul nsw i32 %324, 1092
  %326 = sext i32 %325 to i64
  %327 = getelementptr inbounds i16* %323, i64 %326
  %328 = load i32* %macroblock, align 4
  %329 = mul nsw i32 %328, 2
  %330 = mul nsw i32 %329, 1092
  %331 = sext i32 %330 to i64
  %332 = getelementptr inbounds i16* %327, i64 %331
  store i16* %332, i16** %z, align 8
  store i32 0, i32* %count, align 4
  br label %333

; <label>:333                                     ; preds = %349, %310
  %334 = load i32* %count, align 4
  %335 = icmp slt i32 %334, 1089
  br i1 %335, label %336, label %352

; <label>:336                                     ; preds = %333
  %337 = load i16** %x, align 8
  %338 = getelementptr inbounds i16* %337, i32 1
  store i16* %338, i16** %x, align 8
  %339 = load i16* %337, align 2
  %340 = zext i16 %339 to i32
  %341 = load i16** %y, align 8
  %342 = getelementptr inbounds i16* %341, i32 1
  store i16* %342, i16** %y, align 8
  %343 = load i16* %341, align 2
  %344 = zext i16 %343 to i32
  %345 = add nsw i32 %340, %344
  %346 = trunc i32 %345 to i16
  %347 = load i16** %z, align 8
  %348 = getelementptr inbounds i16* %347, i32 1
  store i16* %348, i16** %z, align 8
  store i16 %346, i16* %347, align 2
  br label %349

; <label>:349                                     ; preds = %336
  %350 = load i32* %count, align 4
  %351 = add nsw i32 %350, 1
  store i32 %351, i32* %count, align 4
  br label %333

; <label>:352                                     ; preds = %333
  %353 = load i16** %1, align 8
  %354 = load i32* %2, align 4
  %355 = mul nsw i32 %354, 5460
  %356 = sext i32 %355 to i64
  %357 = getelementptr inbounds i16* %353, i64 %356
  %358 = load i32* %macroblock, align 4
  %359 = mul nsw i32 %358, 4
  %360 = mul nsw i32 %359, 1092
  %361 = sext i32 %360 to i64
  %362 = getelementptr inbounds i16* %357, i64 %361
  %363 = getelementptr inbounds i16* %362, i64 2184
  store i16* %363, i16** %x, align 8
  %364 = load i16** %x, align 8
  %365 = getelementptr inbounds i16* %364, i64 1092
  store i16* %365, i16** %y, align 8
  %366 = load i16** %1, align 8
  %367 = load i32* %2, align 4
  %368 = mul nsw i32 %367, 1092
  %369 = sext i32 %368 to i64
  %370 = getelementptr inbounds i16* %366, i64 %369
  %371 = load i32* %macroblock, align 4
  %372 = mul nsw i32 %371, 2
  %373 = mul nsw i32 %372, 1092
  %374 = sext i32 %373 to i64
  %375 = getelementptr inbounds i16* %370, i64 %374
  %376 = getelementptr inbounds i16* %375, i64 1092
  store i16* %376, i16** %z, align 8
  store i32 0, i32* %count, align 4
  br label %377

; <label>:377                                     ; preds = %393, %352
  %378 = load i32* %count, align 4
  %379 = icmp slt i32 %378, 1089
  br i1 %379, label %380, label %396

; <label>:380                                     ; preds = %377
  %381 = load i16** %x, align 8
  %382 = getelementptr inbounds i16* %381, i32 1
  store i16* %382, i16** %x, align 8
  %383 = load i16* %381, align 2
  %384 = zext i16 %383 to i32
  %385 = load i16** %y, align 8
  %386 = getelementptr inbounds i16* %385, i32 1
  store i16* %386, i16** %y, align 8
  %387 = load i16* %385, align 2
  %388 = zext i16 %387 to i32
  %389 = add nsw i32 %384, %388
  %390 = trunc i32 %389 to i16
  %391 = load i16** %z, align 8
  %392 = getelementptr inbounds i16* %391, i32 1
  store i16* %392, i16** %z, align 8
  store i16 %390, i16* %391, align 2
  br label %393

; <label>:393                                     ; preds = %380
  %394 = load i32* %count, align 4
  %395 = add nsw i32 %394, 1
  store i32 %395, i32* %count, align 4
  br label %377

; <label>:396                                     ; preds = %377
  %397 = load i16** %1, align 8
  %398 = load i32* %2, align 4
  %399 = mul nsw i32 %398, 1092
  %400 = sext i32 %399 to i64
  %401 = getelementptr inbounds i16* %397, i64 %400
  %402 = load i32* %macroblock, align 4
  %403 = mul nsw i32 %402, 2
  %404 = mul nsw i32 %403, 1092
  %405 = sext i32 %404 to i64
  %406 = getelementptr inbounds i16* %401, i64 %405
  store i16* %406, i16** %x, align 8
  %407 = load i16** %x, align 8
  %408 = getelementptr inbounds i16* %407, i64 1092
  store i16* %408, i16** %y, align 8
  %409 = load i16** %1, align 8
  %410 = getelementptr inbounds i16* %409, i64 0
  %411 = load i32* %macroblock, align 4
  %412 = mul nsw i32 %411, 1
  %413 = mul nsw i32 %412, 1092
  %414 = sext i32 %413 to i64
  %415 = getelementptr inbounds i16* %410, i64 %414
  store i16* %415, i16** %z, align 8
  store i32 0, i32* %count, align 4
  br label %416

; <label>:416                                     ; preds = %432, %396
  %417 = load i32* %count, align 4
  %418 = icmp slt i32 %417, 1089
  br i1 %418, label %419, label %435

; <label>:419                                     ; preds = %416
  %420 = load i16** %x, align 8
  %421 = getelementptr inbounds i16* %420, i32 1
  store i16* %421, i16** %x, align 8
  %422 = load i16* %420, align 2
  %423 = zext i16 %422 to i32
  %424 = load i16** %y, align 8
  %425 = getelementptr inbounds i16* %424, i32 1
  store i16* %425, i16** %y, align 8
  %426 = load i16* %424, align 2
  %427 = zext i16 %426 to i32
  %428 = add nsw i32 %423, %427
  %429 = trunc i32 %428 to i16
  %430 = load i16** %z, align 8
  %431 = getelementptr inbounds i16* %430, i32 1
  store i16* %431, i16** %z, align 8
  store i16 %429, i16* %430, align 2
  br label %432

; <label>:432                                     ; preds = %419
  %433 = load i32* %count, align 4
  %434 = add nsw i32 %433, 1
  store i32 %434, i32* %count, align 4
  br label %416

; <label>:435                                     ; preds = %416
  br label %436

; <label>:436                                     ; preds = %435
  %437 = load i32* %macroblock, align 4
  %438 = add nsw i32 %437, 1
  store i32 %438, i32* %macroblock, align 4
  br label %3

; <label>:439                                     ; preds = %3
  ret void
}

; Function Attrs: nounwind readnone
declare i32 @abs(i32) #7

; Function Attrs: nounwind uwtable
define internal void @sad4_one_macroblock(i16* %macroblock_sad, i16* %frame, i16* %ref, i32 %frame_y, i32 %frame_x, i32 %mb_width, i32 %mb_height) #0 {
  %1 = alloca i16*, align 8
  %2 = alloca i16*, align 8
  %3 = alloca i16*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %pos_x = alloca i32, align 4
  %pos_y = alloca i32, align 4
  %width = alloca i32, align 4
  %height = alloca i32, align 4
  %pos = alloca i32, align 4
  %blky = alloca i32, align 4
  %blkx = alloca i32, align 4
  %y = alloca i32, align 4
  %x = alloca i32, align 4
  %sad = alloca i16, align 2
  %ref_x = alloca i32, align 4
  %ref_y = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  store i16* %macroblock_sad, i16** %1, align 8
  store i16* %frame, i16** %2, align 8
  store i16* %ref, i16** %3, align 8
  store i32 %frame_y, i32* %4, align 4
  store i32 %frame_x, i32* %5, align 4
  store i32 %mb_width, i32* %6, align 4
  store i32 %mb_height, i32* %7, align 4
  %8 = load i32* %6, align 4
  %9 = mul nsw i32 %8, 16
  store i32 %9, i32* %width, align 4
  %10 = load i32* %7, align 4
  %11 = mul nsw i32 %10, 16
  store i32 %11, i32* %height, align 4
  store i32 0, i32* %pos, align 4
  store i32 -16, i32* %pos_y, align 4
  br label %12

; <label>:12                                      ; preds = %141, %0
  %13 = load i32* %pos_y, align 4
  %14 = icmp sle i32 %13, 16
  br i1 %14, label %15, label %144

; <label>:15                                      ; preds = %12
  store i32 -16, i32* %pos_x, align 4
  br label %16

; <label>:16                                      ; preds = %135, %15
  %17 = load i32* %pos_x, align 4
  %18 = icmp sle i32 %17, 16
  br i1 %18, label %19, label %140

; <label>:19                                      ; preds = %16
  store i32 0, i32* %blky, align 4
  br label %20

; <label>:20                                      ; preds = %131, %19
  %21 = load i32* %blky, align 4
  %22 = icmp slt i32 %21, 4
  br i1 %22, label %23, label %134

; <label>:23                                      ; preds = %20
  store i32 0, i32* %blkx, align 4
  br label %24

; <label>:24                                      ; preds = %127, %23
  %25 = load i32* %blkx, align 4
  %26 = icmp slt i32 %25, 4
  br i1 %26, label %27, label %130

; <label>:27                                      ; preds = %24
  store i16 0, i16* %sad, align 2
  store i32 0, i32* %y, align 4
  br label %28

; <label>:28                                      ; preds = %112, %27
  %29 = load i32* %y, align 4
  %30 = icmp slt i32 %29, 4
  br i1 %30, label %31, label %115

; <label>:31                                      ; preds = %28
  store i32 0, i32* %x, align 4
  br label %32

; <label>:32                                      ; preds = %108, %31
  %33 = load i32* %x, align 4
  %34 = icmp slt i32 %33, 4
  br i1 %34, label %35, label %111

; <label>:35                                      ; preds = %32
  %36 = load i32* %5, align 4
  %37 = load i32* %pos_x, align 4
  %38 = add nsw i32 %36, %37
  %39 = load i32* %blkx, align 4
  %40 = mul nsw i32 %39, 4
  %41 = add nsw i32 %38, %40
  %42 = load i32* %x, align 4
  %43 = add nsw i32 %41, %42
  store i32 %43, i32* %ref_x, align 4
  %44 = load i32* %ref_x, align 4
  %45 = icmp slt i32 %44, 0
  br i1 %45, label %46, label %47

; <label>:46                                      ; preds = %35
  store i32 0, i32* %ref_x, align 4
  br label %47

; <label>:47                                      ; preds = %46, %35
  %48 = load i32* %ref_x, align 4
  %49 = load i32* %width, align 4
  %50 = icmp sge i32 %48, %49
  br i1 %50, label %51, label %54

; <label>:51                                      ; preds = %47
  %52 = load i32* %width, align 4
  %53 = sub nsw i32 %52, 1
  store i32 %53, i32* %ref_x, align 4
  br label %54

; <label>:54                                      ; preds = %51, %47
  %55 = load i32* %4, align 4
  %56 = load i32* %pos_y, align 4
  %57 = add nsw i32 %55, %56
  %58 = load i32* %blky, align 4
  %59 = mul nsw i32 %58, 4
  %60 = add nsw i32 %57, %59
  %61 = load i32* %y, align 4
  %62 = add nsw i32 %60, %61
  store i32 %62, i32* %ref_y, align 4
  %63 = load i32* %ref_y, align 4
  %64 = icmp slt i32 %63, 0
  br i1 %64, label %65, label %66

; <label>:65                                      ; preds = %54
  store i32 0, i32* %ref_y, align 4
  br label %66

; <label>:66                                      ; preds = %65, %54
  %67 = load i32* %ref_y, align 4
  %68 = load i32* %height, align 4
  %69 = icmp sge i32 %67, %68
  br i1 %69, label %70, label %73

; <label>:70                                      ; preds = %66
  %71 = load i32* %height, align 4
  %72 = sub nsw i32 %71, 1
  store i32 %72, i32* %ref_y, align 4
  br label %73

; <label>:73                                      ; preds = %70, %66
  %74 = load i32* %ref_y, align 4
  %75 = load i32* %width, align 4
  %76 = mul nsw i32 %74, %75
  %77 = load i32* %ref_x, align 4
  %78 = add nsw i32 %76, %77
  %79 = sext i32 %78 to i64
  %80 = load i16** %3, align 8
  %81 = getelementptr inbounds i16* %80, i64 %79
  %82 = load i16* %81, align 2
  %83 = zext i16 %82 to i32
  store i32 %83, i32* %b, align 4
  %84 = load i32* %blky, align 4
  %85 = mul nsw i32 %84, 4
  %86 = load i32* %y, align 4
  %87 = add nsw i32 %85, %86
  %88 = load i32* %width, align 4
  %89 = mul nsw i32 %87, %88
  %90 = load i32* %blkx, align 4
  %91 = mul nsw i32 %90, 4
  %92 = load i32* %x, align 4
  %93 = add nsw i32 %91, %92
  %94 = add nsw i32 %89, %93
  %95 = sext i32 %94 to i64
  %96 = load i16** %2, align 8
  %97 = getelementptr inbounds i16* %96, i64 %95
  %98 = load i16* %97, align 2
  %99 = zext i16 %98 to i32
  store i32 %99, i32* %a, align 4
  %100 = load i32* %a, align 4
  %101 = load i32* %b, align 4
  %102 = sub i32 %100, %101
  %103 = call i32 @abs(i32 %102) #10
  %104 = load i16* %sad, align 2
  %105 = zext i16 %104 to i32
  %106 = add nsw i32 %105, %103
  %107 = trunc i32 %106 to i16
  store i16 %107, i16* %sad, align 2
  br label %108

; <label>:108                                     ; preds = %73
  %109 = load i32* %x, align 4
  %110 = add nsw i32 %109, 1
  store i32 %110, i32* %x, align 4
  br label %32

; <label>:111                                     ; preds = %32
  br label %112

; <label>:112                                     ; preds = %111
  %113 = load i32* %y, align 4
  %114 = add nsw i32 %113, 1
  store i32 %114, i32* %y, align 4
  br label %28

; <label>:115                                     ; preds = %28
  %116 = load i16* %sad, align 2
  %117 = load i32* %blky, align 4
  %118 = mul nsw i32 4, %117
  %119 = load i32* %blkx, align 4
  %120 = add nsw i32 %118, %119
  %121 = mul nsw i32 1092, %120
  %122 = load i32* %pos, align 4
  %123 = add nsw i32 %121, %122
  %124 = sext i32 %123 to i64
  %125 = load i16** %1, align 8
  %126 = getelementptr inbounds i16* %125, i64 %124
  store i16 %116, i16* %126, align 2
  br label %127

; <label>:127                                     ; preds = %115
  %128 = load i32* %blkx, align 4
  %129 = add nsw i32 %128, 1
  store i32 %129, i32* %blkx, align 4
  br label %24

; <label>:130                                     ; preds = %24
  br label %131

; <label>:131                                     ; preds = %130
  %132 = load i32* %blky, align 4
  %133 = add nsw i32 %132, 1
  store i32 %133, i32* %blky, align 4
  br label %20

; <label>:134                                     ; preds = %20
  br label %135

; <label>:135                                     ; preds = %134
  %136 = load i32* %pos_x, align 4
  %137 = add nsw i32 %136, 1
  store i32 %137, i32* %pos_x, align 4
  %138 = load i32* %pos, align 4
  %139 = add nsw i32 %138, 1
  store i32 %139, i32* %pos, align 4
  br label %16

; <label>:140                                     ; preds = %16
  br label %141

; <label>:141                                     ; preds = %140
  %142 = load i32* %pos_y, align 4
  %143 = add nsw i32 %142, 1
  store i32 %143, i32* %pos_y, align 4
  br label %12

; <label>:144                                     ; preds = %12
  ret void
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { inlinehint nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly }
attributes #10 = { nounwind readnone }

!llvm.ident = !{!0, !0, !0, !0, !0}

!0 = metadata !{metadata !"clang version 3.4 (tags/RELEASE_34/final)"}
