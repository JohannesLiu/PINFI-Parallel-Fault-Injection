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
%struct.RGB = type { i8, i8, i8 }
%struct.bmp_image = type { [2 x i8], %struct.bmpfile_header_t, %struct.bmp_dib_header_t, i32*, i8* }
%struct.bmpfile_header_t = type { i32, i16, i16, i32 }
%struct.bmp_dib_header_t = type { i32, i32, i32, i16, i16, i32, i32, i32, i32, i32, i32 }

@.str = private unnamed_addr constant [39 x i8] c"Base implementation of histogramming.\0A\00", align 1
@.str1 = private unnamed_addr constant [48 x i8] c"Maintained by Nady Obeid <obeid1@ece.uiuc.edu>\0A\00", align 1
@.str2 = private unnamed_addr constant [21 x i8] c"Input file expected\0A\00", align 1
@stderr = external global %struct._IO_FILE*
@.str3 = private unnamed_addr constant [45 x i8] c"Expected at least one command line argument\0A\00", align 1
@.str4 = private unnamed_addr constant [6 x i8] c"Input\00", align 1
@.str5 = private unnamed_addr constant [7 x i8] c"Output\00", align 1
@.str6 = private unnamed_addr constant [3 x i8] c"rb\00", align 1
@.str7 = private unnamed_addr constant [53 x i8] c"Error reading input and output dimensions from file\0A\00", align 1
@.str8 = private unnamed_addr constant [37 x i8] c"Error reading input array from file\0A\00", align 1
@.str9 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str10 = private unnamed_addr constant [32 x i8] c"Expecting file name after '-o'\0A\00", align 1
@.str111 = private unnamed_addr constant [32 x i8] c"Expecting file name after '-i'\0A\00", align 1
@.str212 = private unnamed_addr constant [35 x i8] c"Unexpected command-line parameter\0A\00", align 1
@.str313 = private unnamed_addr constant [43 x i8] c"Ignoring attempt to start a running timer\0A\00", align 1
@.str414 = private unnamed_addr constant [32 x i8] c"Warning: Timer was not stopped\0A\00", align 1
@.str515 = private unnamed_addr constant [35 x i8] c"Warning: Subtimer was not stopped\0A\00", align 1
@.str616 = private unnamed_addr constant [54 x i8] c"Ignoring attempt to start running timer and subtimer\0A\00", align 1
@.str717 = private unnamed_addr constant [42 x i8] c"Ignoring attempt to stop a stopped timer\0A\00", align 1
@.str818 = private unnamed_addr constant [32 x i8] c"Warning: Timer was not running\0A\00", align 1
@.str919 = private unnamed_addr constant [35 x i8] c"Warning: Subtimer was not running\0A\00", align 1
@.str1020 = private unnamed_addr constant [53 x i8] c"Ignoring attempt to stop stopped timer and subtimer\0A\00", align 1
@.str11 = private unnamed_addr constant [49 x i8] c"Elapsed time from a running timer is inaccurate\0A\00", align 1
@.str12 = private unnamed_addr constant [4 x i8] c"%s\00\00", align 1
@.str13 = private unnamed_addr constant [3 x i8] c"IO\00", align 1
@.str14 = private unnamed_addr constant [7 x i8] c"Kernel\00", align 1
@.str15 = private unnamed_addr constant [5 x i8] c"Copy\00", align 1
@.str16 = private unnamed_addr constant [7 x i8] c"Driver\00", align 1
@.str17 = private unnamed_addr constant [11 x i8] c"Copy Async\00", align 1
@.str18 = private unnamed_addr constant [8 x i8] c"Compute\00", align 1
@.str19 = private unnamed_addr constant [10 x i8] c"%-*s: %f\0A\00", align 1
@.str20 = private unnamed_addr constant [12 x i8] c" -%-*s: %f\0A\00", align 1
@.str21 = private unnamed_addr constant [24 x i8] c"CPU/Kernel Overlap: %f\0A\00", align 1
@.str22 = private unnamed_addr constant [21 x i8] c"Timer Wall Time: %f\0A\00", align 1
@.str23 = private unnamed_addr constant [15 x i8] c"next_argument\0A\00", align 1
@.str24 = private unnamed_addr constant [17 x i8] c"delete_argument\0A\00", align 1
@.str35 = private unnamed_addr constant [3 x i8] c"wb\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %timers = alloca %struct.pb_TimerSet, align 8
  %parameters = alloca %struct.pb_Parameters*, align 8
  %numIterations = alloca i32, align 4
  %inputStr = alloca i8*, align 8
  %outputStr = alloca i8*, align 8
  %img_width = alloca i32, align 4
  %img_height = alloca i32, align 4
  %histo_width = alloca i32, align 4
  %histo_height = alloca i32, align 4
  %f = alloca %struct._IO_FILE*, align 8
  %result = alloca i32, align 4
  %img = alloca i32*, align 8
  %histo = alloca i8*, align 8
  %iter = alloca i32, align 4
  %i = alloca i32, align 4
  %value = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([39 x i8]* @.str, i32 0, i32 0))
  %5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([48 x i8]* @.str1, i32 0, i32 0))
  %6 = load i8*** %3, align 8
  %7 = call %struct.pb_Parameters* @pb_ReadParameters(i32* %2, i8** %6)
  store %struct.pb_Parameters* %7, %struct.pb_Parameters** %parameters, align 8
  %8 = load %struct.pb_Parameters** %parameters, align 8
  %9 = icmp ne %struct.pb_Parameters* %8, null
  br i1 %9, label %11, label %10

; <label>:10                                      ; preds = %0
  store i32 -1, i32* %1
  br label %172

; <label>:11                                      ; preds = %0
  %12 = load %struct.pb_Parameters** %parameters, align 8
  %13 = getelementptr inbounds %struct.pb_Parameters* %12, i32 0, i32 1
  %14 = load i8*** %13, align 8
  %15 = getelementptr inbounds i8** %14, i64 0
  %16 = load i8** %15, align 8
  %17 = icmp ne i8* %16, null
  br i1 %17, label %21, label %18

; <label>:18                                      ; preds = %11
  %19 = load %struct._IO_FILE** @stderr, align 8
  %20 = call i32 @fputs(i8* getelementptr inbounds ([21 x i8]* @.str2, i32 0, i32 0), %struct._IO_FILE* %19)
  store i32 -1, i32* %1
  br label %172

; <label>:21                                      ; preds = %11
  %22 = load i32* %2, align 4
  %23 = icmp sge i32 %22, 2
  br i1 %23, label %24, label %29

; <label>:24                                      ; preds = %21
  %25 = load i8*** %3, align 8
  %26 = getelementptr inbounds i8** %25, i64 1
  %27 = load i8** %26, align 8
  %28 = call i32 @atoi(i8* %27) #6
  store i32 %28, i32* %numIterations, align 4
  br label %32

; <label>:29                                      ; preds = %21
  %30 = load %struct._IO_FILE** @stderr, align 8
  %31 = call i32 @fputs(i8* getelementptr inbounds ([45 x i8]* @.str3, i32 0, i32 0), %struct._IO_FILE* %30)
  store i32 -1, i32* %1
  br label %172

; <label>:32                                      ; preds = %24
  call void @pb_InitializeTimerSet(%struct.pb_TimerSet* %timers)
  store i8* getelementptr inbounds ([6 x i8]* @.str4, i32 0, i32 0), i8** %inputStr, align 8
  store i8* getelementptr inbounds ([7 x i8]* @.str5, i32 0, i32 0), i8** %outputStr, align 8
  %33 = load i8** %inputStr, align 8
  call void @pb_AddSubTimer(%struct.pb_TimerSet* %timers, i8* %33, i32 1)
  %34 = load i8** %outputStr, align 8
  call void @pb_AddSubTimer(%struct.pb_TimerSet* %timers, i8* %34, i32 1)
  %35 = load i8** %inputStr, align 8
  call void @pb_SwitchToSubTimer(%struct.pb_TimerSet* %timers, i8* %35, i32 1)
  %36 = load %struct.pb_Parameters** %parameters, align 8
  %37 = getelementptr inbounds %struct.pb_Parameters* %36, i32 0, i32 1
  %38 = load i8*** %37, align 8
  %39 = getelementptr inbounds i8** %38, i64 0
  %40 = load i8** %39, align 8
  %41 = call %struct._IO_FILE* @fopen(i8* %40, i8* getelementptr inbounds ([3 x i8]* @.str6, i32 0, i32 0))
  store %struct._IO_FILE* %41, %struct._IO_FILE** %f, align 8
  store i32 0, i32* %result, align 4
  %42 = bitcast i32* %img_width to i8*
  %43 = load %struct._IO_FILE** %f, align 8
  %44 = call i64 @fread(i8* %42, i64 4, i64 1, %struct._IO_FILE* %43)
  %45 = load i32* %result, align 4
  %46 = sext i32 %45 to i64
  %47 = add i64 %46, %44
  %48 = trunc i64 %47 to i32
  store i32 %48, i32* %result, align 4
  %49 = bitcast i32* %img_height to i8*
  %50 = load %struct._IO_FILE** %f, align 8
  %51 = call i64 @fread(i8* %49, i64 4, i64 1, %struct._IO_FILE* %50)
  %52 = load i32* %result, align 4
  %53 = sext i32 %52 to i64
  %54 = add i64 %53, %51
  %55 = trunc i64 %54 to i32
  store i32 %55, i32* %result, align 4
  %56 = bitcast i32* %histo_width to i8*
  %57 = load %struct._IO_FILE** %f, align 8
  %58 = call i64 @fread(i8* %56, i64 4, i64 1, %struct._IO_FILE* %57)
  %59 = load i32* %result, align 4
  %60 = sext i32 %59 to i64
  %61 = add i64 %60, %58
  %62 = trunc i64 %61 to i32
  store i32 %62, i32* %result, align 4
  %63 = bitcast i32* %histo_height to i8*
  %64 = load %struct._IO_FILE** %f, align 8
  %65 = call i64 @fread(i8* %63, i64 4, i64 1, %struct._IO_FILE* %64)
  %66 = load i32* %result, align 4
  %67 = sext i32 %66 to i64
  %68 = add i64 %67, %65
  %69 = trunc i64 %68 to i32
  store i32 %69, i32* %result, align 4
  %70 = load i32* %result, align 4
  %71 = icmp ne i32 %70, 4
  br i1 %71, label %72, label %75

; <label>:72                                      ; preds = %32
  %73 = load %struct._IO_FILE** @stderr, align 8
  %74 = call i32 @fputs(i8* getelementptr inbounds ([53 x i8]* @.str7, i32 0, i32 0), %struct._IO_FILE* %73)
  store i32 -1, i32* %1
  br label %172

; <label>:75                                      ; preds = %32
  %76 = load i32* %img_width, align 4
  %77 = load i32* %img_height, align 4
  %78 = mul i32 %76, %77
  %79 = zext i32 %78 to i64
  %80 = mul i64 %79, 4
  %81 = call noalias i8* @malloc(i64 %80) #4
  %82 = bitcast i8* %81 to i32*
  store i32* %82, i32** %img, align 8
  %83 = load i32* %histo_width, align 4
  %84 = load i32* %histo_height, align 4
  %85 = mul i32 %83, %84
  %86 = zext i32 %85 to i64
  %87 = call noalias i8* @calloc(i64 %86, i64 1) #4
  store i8* %87, i8** %histo, align 8
  call void @pb_SwitchToSubTimer(%struct.pb_TimerSet* %timers, i8* getelementptr inbounds ([6 x i8]* @.str4, i32 0, i32 0), i32 1)
  %88 = load i32** %img, align 8
  %89 = bitcast i32* %88 to i8*
  %90 = load i32* %img_width, align 4
  %91 = load i32* %img_height, align 4
  %92 = mul i32 %90, %91
  %93 = zext i32 %92 to i64
  %94 = load %struct._IO_FILE** %f, align 8
  %95 = call i64 @fread(i8* %89, i64 4, i64 %93, %struct._IO_FILE* %94)
  %96 = trunc i64 %95 to i32
  store i32 %96, i32* %result, align 4
  %97 = load %struct._IO_FILE** %f, align 8
  %98 = call i32 @fclose(%struct._IO_FILE* %97)
  %99 = load i32* %result, align 4
  %100 = load i32* %img_width, align 4
  %101 = load i32* %img_height, align 4
  %102 = mul i32 %100, %101
  %103 = icmp ne i32 %99, %102
  br i1 %103, label %104, label %107

; <label>:104                                     ; preds = %75
  %105 = load %struct._IO_FILE** @stderr, align 8
  %106 = call i32 @fputs(i8* getelementptr inbounds ([37 x i8]* @.str8, i32 0, i32 0), %struct._IO_FILE* %105)
  store i32 -1, i32* %1
  br label %172

; <label>:107                                     ; preds = %75
  call void @pb_SwitchToTimer(%struct.pb_TimerSet* %timers, i32 6)
  store i32 0, i32* %iter, align 4
  br label %108

; <label>:108                                     ; preds = %150, %107
  %109 = load i32* %iter, align 4
  %110 = load i32* %numIterations, align 4
  %111 = icmp slt i32 %109, %110
  br i1 %111, label %112, label %153

; <label>:112                                     ; preds = %108
  %113 = load i8** %histo, align 8
  %114 = load i32* %histo_height, align 4
  %115 = load i32* %histo_width, align 4
  %116 = mul i32 %114, %115
  %117 = zext i32 %116 to i64
  %118 = mul i64 %117, 1
  call void @llvm.memset.p0i8.i64(i8* %113, i8 0, i64 %118, i32 1, i1 false)
  store i32 0, i32* %i, align 4
  br label %119

; <label>:119                                     ; preds = %146, %112
  %120 = load i32* %i, align 4
  %121 = load i32* %img_width, align 4
  %122 = load i32* %img_height, align 4
  %123 = mul i32 %121, %122
  %124 = icmp ult i32 %120, %123
  br i1 %124, label %125, label %149

; <label>:125                                     ; preds = %119
  %126 = load i32* %i, align 4
  %127 = zext i32 %126 to i64
  %128 = load i32** %img, align 8
  %129 = getelementptr inbounds i32* %128, i64 %127
  %130 = load i32* %129, align 4
  store i32 %130, i32* %value, align 4
  %131 = load i32* %value, align 4
  %132 = zext i32 %131 to i64
  %133 = load i8** %histo, align 8
  %134 = getelementptr inbounds i8* %133, i64 %132
  %135 = load i8* %134, align 1
  %136 = zext i8 %135 to i32
  %137 = icmp slt i32 %136, 255
  br i1 %137, label %138, label %145

; <label>:138                                     ; preds = %125
  %139 = load i32* %value, align 4
  %140 = zext i32 %139 to i64
  %141 = load i8** %histo, align 8
  %142 = getelementptr inbounds i8* %141, i64 %140
  %143 = load i8* %142, align 1
  %144 = add i8 %143, 1
  store i8 %144, i8* %142, align 1
  br label %145

; <label>:145                                     ; preds = %138, %125
  br label %146

; <label>:146                                     ; preds = %145
  %147 = load i32* %i, align 4
  %148 = add i32 %147, 1
  store i32 %148, i32* %i, align 4
  br label %119

; <label>:149                                     ; preds = %119
  br label %150

; <label>:150                                     ; preds = %149
  %151 = load i32* %iter, align 4
  %152 = add nsw i32 %151, 1
  store i32 %152, i32* %iter, align 4
  br label %108

; <label>:153                                     ; preds = %108
  %154 = load i8** %outputStr, align 8
  call void @pb_SwitchToSubTimer(%struct.pb_TimerSet* %timers, i8* %154, i32 1)
  %155 = load %struct.pb_Parameters** %parameters, align 8
  %156 = getelementptr inbounds %struct.pb_Parameters* %155, i32 0, i32 0
  %157 = load i8** %156, align 8
  %158 = icmp ne i8* %157, null
  br i1 %158, label %159, label %166

; <label>:159                                     ; preds = %153
  %160 = load i8** %histo, align 8
  %161 = load i32* %histo_height, align 4
  %162 = load i32* %histo_width, align 4
  %163 = load %struct.pb_Parameters** %parameters, align 8
  %164 = getelementptr inbounds %struct.pb_Parameters* %163, i32 0, i32 0
  %165 = load i8** %164, align 8
  call void @dump_histo_img(i8* %160, i32 %161, i32 %162, i8* %165)
  br label %166

; <label>:166                                     ; preds = %159, %153
  call void @pb_SwitchToTimer(%struct.pb_TimerSet* %timers, i32 6)
  %167 = load i32** %img, align 8
  %168 = bitcast i32* %167 to i8*
  call void @free(i8* %168) #4
  %169 = load i8** %histo, align 8
  call void @free(i8* %169) #4
  call void @pb_SwitchToTimer(%struct.pb_TimerSet* %timers, i32 0)
  %170 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str9, i32 0, i32 0))
  call void @pb_PrintTimerSet(%struct.pb_TimerSet* %timers)
  %171 = load %struct.pb_Parameters** %parameters, align 8
  call void @pb_FreeParameters(%struct.pb_Parameters* %171)
  store i32 0, i32* %1
  br label %172

; <label>:172                                     ; preds = %166, %104, %72, %29, %18, %10
  %173 = load i32* %1
  ret i32 %173
}

declare i32 @printf(i8*, ...) #1

declare i32 @fputs(i8*, %struct._IO_FILE*) #1

; Function Attrs: nounwind readonly
declare i32 @atoi(i8*) #2

declare %struct._IO_FILE* @fopen(i8*, i8*) #1

declare i64 @fread(i8*, i64, i64, %struct._IO_FILE*) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #3

; Function Attrs: nounwind
declare noalias i8* @calloc(i64, i64) #3

declare i32 @fclose(%struct._IO_FILE*) #1

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #4

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
  %4 = call noalias i8* @malloc(i64 16) #4
  %5 = bitcast i8* %4 to %struct.pb_Parameters*
  store %struct.pb_Parameters* %5, %struct.pb_Parameters** %ret, align 8
  %6 = load %struct.pb_Parameters** %ret, align 8
  %7 = getelementptr inbounds %struct.pb_Parameters* %6, i32 0, i32 0
  store i8* null, i8** %7, align 8
  %8 = call noalias i8* @malloc(i64 8) #4
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
  store i8* getelementptr inbounds ([32 x i8]* @.str10, i32 0, i32 0), i8** %err_message, align 8
  br label %79

; <label>:51                                      ; preds = %47
  %52 = load %struct.pb_Parameters** %ret, align 8
  %53 = getelementptr inbounds %struct.pb_Parameters* %52, i32 0, i32 0
  %54 = load i8** %53, align 8
  call void @free(i8* %54) #4
  %55 = call i8* @consume_argument(%struct.argparse* %ap)
  %56 = call noalias i8* @strdup(i8* %55) #4
  %57 = load %struct.pb_Parameters** %ret, align 8
  %58 = getelementptr inbounds %struct.pb_Parameters* %57, i32 0, i32 0
  store i8* %56, i8** %58, align 8
  br label %70

; <label>:59                                      ; preds = %42
  %60 = call i32 @is_end_of_arguments(%struct.argparse* %ap)
  %61 = icmp ne i32 %60, 0
  br i1 %61, label %62, label %63

; <label>:62                                      ; preds = %59
  store i8* getelementptr inbounds ([32 x i8]* @.str111, i32 0, i32 0), i8** %err_message, align 8
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
  store i8* getelementptr inbounds ([35 x i8]* @.str212, i32 0, i32 0), i8** %err_message, align 8
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

; Function Attrs: nounwind uwtable
define void @pb_FreeParameters(%struct.pb_Parameters* %p) #0 {
  %1 = alloca %struct.pb_Parameters*, align 8
  %cpp = alloca i8**, align 8
  store %struct.pb_Parameters* %p, %struct.pb_Parameters** %1, align 8
  %2 = load %struct.pb_Parameters** %1, align 8
  %3 = getelementptr inbounds %struct.pb_Parameters* %2, i32 0, i32 0
  %4 = load i8** %3, align 8
  call void @free(i8* %4) #4
  %5 = load %struct.pb_Parameters** %1, align 8
  %6 = getelementptr inbounds %struct.pb_Parameters* %5, i32 0, i32 1
  %7 = load i8*** %6, align 8
  call void @free_string_array(i8** %7)
  %8 = load %struct.pb_Parameters** %1, align 8
  %9 = bitcast %struct.pb_Parameters* %8 to i8*
  call void @free(i8* %9) #4
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
  %8 = call i32 @fputs(i8* getelementptr inbounds ([43 x i8]* @.str313, i32 0, i32 0), %struct._IO_FILE* %7)
  br label %21

; <label>:9                                       ; preds = %0
  %10 = load %struct.pb_Timer** %1, align 8
  %11 = getelementptr inbounds %struct.pb_Timer* %10, i32 0, i32 0
  store i32 1, i32* %11, align 4
  %12 = call i32 @gettimeofday(%struct.timeval* %tv, %struct.timezone* null) #4
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
  %9 = call i32 @fputs(i8* getelementptr inbounds ([32 x i8]* @.str414, i32 0, i32 0), %struct._IO_FILE* %8)
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
  %19 = call i32 @fputs(i8* getelementptr inbounds ([35 x i8]* @.str515, i32 0, i32 0), %struct._IO_FILE* %18)
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
  %27 = call i32 @fputs(i8* getelementptr inbounds ([54 x i8]* @.str616, i32 0, i32 0), %struct._IO_FILE* %26)
  br label %59

; <label>:28                                      ; preds = %22
  %29 = load %struct.pb_Timer** %1, align 8
  %30 = getelementptr inbounds %struct.pb_Timer* %29, i32 0, i32 0
  store i32 1, i32* %30, align 4
  %31 = load %struct.pb_Timer** %2, align 8
  %32 = getelementptr inbounds %struct.pb_Timer* %31, i32 0, i32 0
  store i32 1, i32* %32, align 4
  %33 = call i32 @gettimeofday(%struct.timeval* %tv, %struct.timezone* null) #4
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
  %8 = call i32 @fputs(i8* getelementptr inbounds ([42 x i8]* @.str717, i32 0, i32 0), %struct._IO_FILE* %7)
  br label %28

; <label>:9                                       ; preds = %0
  %10 = load %struct.pb_Timer** %1, align 8
  %11 = getelementptr inbounds %struct.pb_Timer* %10, i32 0, i32 0
  store i32 0, i32* %11, align 4
  %12 = call i32 @gettimeofday(%struct.timeval* %tv, %struct.timezone* null) #4
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
  %9 = call i32 @fputs(i8* getelementptr inbounds ([32 x i8]* @.str818, i32 0, i32 0), %struct._IO_FILE* %8)
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
  %19 = call i32 @fputs(i8* getelementptr inbounds ([35 x i8]* @.str919, i32 0, i32 0), %struct._IO_FILE* %18)
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
  %27 = call i32 @fputs(i8* getelementptr inbounds ([53 x i8]* @.str1020, i32 0, i32 0), %struct._IO_FILE* %26)
  br label %67

; <label>:28                                      ; preds = %22
  %29 = load %struct.pb_Timer** %1, align 8
  %30 = getelementptr inbounds %struct.pb_Timer* %29, i32 0, i32 0
  store i32 0, i32* %30, align 4
  %31 = load %struct.pb_Timer** %2, align 8
  %32 = getelementptr inbounds %struct.pb_Timer* %31, i32 0, i32 0
  store i32 0, i32* %32, align 4
  %33 = call i32 @gettimeofday(%struct.timeval* %tv, %struct.timezone* null) #4
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
  %4 = call noalias i8* @malloc(i64 40) #4
  %5 = bitcast i8* %4 to %struct.pb_SubTimer*
  store %struct.pb_SubTimer* %5, %struct.pb_SubTimer** %subtimer, align 8
  %6 = load i8** %2, align 8
  %7 = call i64 @strlen(i8* %6) #6
  %8 = trunc i64 %7 to i32
  store i32 %8, i32* %len, align 4
  %9 = load i32* %len, align 4
  %10 = add nsw i32 %9, 1
  %11 = sext i32 %10 to i64
  %12 = mul i64 1, %11
  %13 = call noalias i8* @malloc(i64 %12) #4
  %14 = load %struct.pb_SubTimer** %subtimer, align 8
  %15 = getelementptr inbounds %struct.pb_SubTimer* %14, i32 0, i32 0
  store i8* %13, i8** %15, align 8
  %16 = load %struct.pb_SubTimer** %subtimer, align 8
  %17 = getelementptr inbounds %struct.pb_SubTimer* %16, i32 0, i32 0
  %18 = load i8** %17, align 8
  %19 = load i8** %2, align 8
  %20 = call i32 (i8*, i8*, ...)* @sprintf(i8* %18, i8* getelementptr inbounds ([4 x i8]* @.str12, i32 0, i32 0), i8* %19) #4
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
  %34 = call noalias i8* @malloc(i64 16) #4
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
declare i64 @strlen(i8*) #2

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
  %85 = call i32 @strcmp(i8* %83, i8* %84) #6
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
declare i32 @strcmp(i8*, i8*) #2

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
  %59 = call i64 @strlen(i8* %58) #6
  %60 = load i32* %maxSubLength, align 4
  %61 = sext i32 %60 to i64
  %62 = icmp ugt i64 %59, %61
  br i1 %62, label %63, label %69

; <label>:63                                      ; preds = %55
  %64 = load %struct.pb_SubTimer** %sub, align 8
  %65 = getelementptr inbounds %struct.pb_SubTimer* %64, i32 0, i32 0
  %66 = load i8** %65, align 8
  %67 = call i64 @strlen(i8* %66) #6
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
  call void @free(i8* %14) #4
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
  call void @free(i8* %44) #4
  %45 = load %struct.pb_SubTimer** %subtimer, align 8
  store %struct.pb_SubTimer* %45, %struct.pb_SubTimer** %prev, align 8
  %46 = load %struct.pb_SubTimer** %subtimer, align 8
  %47 = getelementptr inbounds %struct.pb_SubTimer* %46, i32 0, i32 2
  %48 = load %struct.pb_SubTimer** %47, align 8
  store %struct.pb_SubTimer* %48, %struct.pb_SubTimer** %subtimer, align 8
  %49 = load %struct.pb_SubTimer** %prev, align 8
  %50 = bitcast %struct.pb_SubTimer* %49 to i8*
  call void @free(i8* %50) #4
  br label %38

; <label>:51                                      ; preds = %38
  %52 = load i32* %i, align 4
  %53 = sext i32 %52 to i64
  %54 = load %struct.pb_TimerSet** %1, align 8
  %55 = getelementptr inbounds %struct.pb_TimerSet* %54, i32 0, i32 5
  %56 = getelementptr inbounds [8 x %struct.pb_SubTimerList*]* %55, i32 0, i64 %53
  %57 = load %struct.pb_SubTimerList** %56, align 8
  %58 = bitcast %struct.pb_SubTimerList* %57 to i8*
  call void @free(i8* %58) #4
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

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #4

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
  %29 = call noalias i8* @malloc(i64 %28) #4
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
  %62 = call noalias i8* @malloc(i64 %61) #4
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
  call void @free(i8* %13) #4
  br label %14

; <label>:14                                      ; preds = %11
  %15 = load i8*** %p, align 8
  %16 = getelementptr inbounds i8** %15, i32 1
  store i8** %16, i8*** %p, align 8
  br label %7

; <label>:17                                      ; preds = %7
  %18 = load i8*** %1, align 8
  %19 = bitcast i8** %18 to i8*
  call void @free(i8* %19) #4
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
  %1 = call i32 @gettimeofday(%struct.timeval* %tv, %struct.timezone* null) #4
  %2 = getelementptr inbounds %struct.timeval* %tv, i32 0, i32 0
  %3 = load i64* %2, align 8
  %4 = mul nsw i64 %3, 1000000
  %5 = getelementptr inbounds %struct.timeval* %tv, i32 0, i32 1
  %6 = load i64* %5, align 8
  %7 = add nsw i64 %4, %6
  ret i64 %7
}

; Function Attrs: nounwind uwtable
define void @create_bmp(%struct.RGB* %bitmap, i32 %height, i32 %width, i8* %filename) #0 {
  %1 = alloca %struct.RGB*, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 8
  %image = alloca %struct.bmp_image, align 8
  %padded_width = alloca i32, align 4
  %pad = alloca i8*, align 8
  %out_file = alloca %struct._IO_FILE*, align 8
  %h = alloca i32, align 4
  store %struct.RGB* %bitmap, %struct.RGB** %1, align 8
  store i32 %height, i32* %2, align 4
  store i32 %width, i32* %3, align 4
  store i8* %filename, i8** %4, align 8
  %5 = load i32* %3, align 4
  %6 = mul nsw i32 %5, 24
  %7 = add nsw i32 %6, 31
  %8 = sdiv i32 %7, 32
  %9 = mul nsw i32 4, %8
  store i32 %9, i32* %padded_width, align 4
  %10 = load i32* %3, align 4
  %11 = sext i32 %10 to i64
  %12 = mul i64 %11, 3
  %13 = load i32* %padded_width, align 4
  %14 = sext i32 %13 to i64
  %15 = sub i64 %14, %12
  %16 = trunc i64 %15 to i32
  store i32 %16, i32* %padded_width, align 4
  %17 = load i32* %padded_width, align 4
  %18 = sext i32 %17 to i64
  %19 = call noalias i8* @calloc(i64 %18, i64 1) #4
  store i8* %19, i8** %pad, align 8
  %20 = getelementptr inbounds %struct.bmp_image* %image, i32 0, i32 0
  %21 = getelementptr inbounds [2 x i8]* %20, i32 0, i64 0
  store i8 66, i8* %21, align 1
  %22 = getelementptr inbounds %struct.bmp_image* %image, i32 0, i32 0
  %23 = getelementptr inbounds [2 x i8]* %22, i32 0, i64 1
  store i8 77, i8* %23, align 1
  %24 = load i32* %2, align 4
  %25 = load i32* %3, align 4
  %26 = mul nsw i32 %24, %25
  %27 = sext i32 %26 to i64
  %28 = mul i64 %27, 3
  %29 = add i64 54, %28
  %30 = trunc i64 %29 to i32
  %31 = getelementptr inbounds %struct.bmp_image* %image, i32 0, i32 1
  %32 = getelementptr inbounds %struct.bmpfile_header_t* %31, i32 0, i32 0
  store i32 %30, i32* %32, align 4
  %33 = getelementptr inbounds %struct.bmp_image* %image, i32 0, i32 1
  %34 = getelementptr inbounds %struct.bmpfile_header_t* %33, i32 0, i32 2
  store i16 0, i16* %34, align 2
  %35 = getelementptr inbounds %struct.bmp_image* %image, i32 0, i32 1
  %36 = getelementptr inbounds %struct.bmpfile_header_t* %35, i32 0, i32 1
  store i16 0, i16* %36, align 2
  %37 = getelementptr inbounds %struct.bmp_image* %image, i32 0, i32 1
  %38 = getelementptr inbounds %struct.bmpfile_header_t* %37, i32 0, i32 3
  store i32 54, i32* %38, align 4
  %39 = getelementptr inbounds %struct.bmp_image* %image, i32 0, i32 2
  %40 = getelementptr inbounds %struct.bmp_dib_header_t* %39, i32 0, i32 0
  store i32 40, i32* %40, align 4
  %41 = load i32* %3, align 4
  %42 = getelementptr inbounds %struct.bmp_image* %image, i32 0, i32 2
  %43 = getelementptr inbounds %struct.bmp_dib_header_t* %42, i32 0, i32 1
  store i32 %41, i32* %43, align 4
  %44 = load i32* %2, align 4
  %45 = getelementptr inbounds %struct.bmp_image* %image, i32 0, i32 2
  %46 = getelementptr inbounds %struct.bmp_dib_header_t* %45, i32 0, i32 2
  store i32 %44, i32* %46, align 4
  %47 = getelementptr inbounds %struct.bmp_image* %image, i32 0, i32 2
  %48 = getelementptr inbounds %struct.bmp_dib_header_t* %47, i32 0, i32 3
  store i16 1, i16* %48, align 2
  %49 = getelementptr inbounds %struct.bmp_image* %image, i32 0, i32 2
  %50 = getelementptr inbounds %struct.bmp_dib_header_t* %49, i32 0, i32 4
  store i16 24, i16* %50, align 2
  %51 = getelementptr inbounds %struct.bmp_image* %image, i32 0, i32 2
  %52 = getelementptr inbounds %struct.bmp_dib_header_t* %51, i32 0, i32 5
  store i32 0, i32* %52, align 4
  %53 = load i32* %3, align 4
  %54 = load i32* %2, align 4
  %55 = mul nsw i32 %53, %54
  %56 = sext i32 %55 to i64
  %57 = mul i64 %56, 3
  %58 = trunc i64 %57 to i32
  %59 = getelementptr inbounds %struct.bmp_image* %image, i32 0, i32 2
  %60 = getelementptr inbounds %struct.bmp_dib_header_t* %59, i32 0, i32 6
  store i32 %58, i32* %60, align 4
  %61 = getelementptr inbounds %struct.bmp_image* %image, i32 0, i32 2
  %62 = getelementptr inbounds %struct.bmp_dib_header_t* %61, i32 0, i32 7
  store i32 0, i32* %62, align 4
  %63 = getelementptr inbounds %struct.bmp_image* %image, i32 0, i32 2
  %64 = getelementptr inbounds %struct.bmp_dib_header_t* %63, i32 0, i32 8
  store i32 0, i32* %64, align 4
  %65 = getelementptr inbounds %struct.bmp_image* %image, i32 0, i32 2
  %66 = getelementptr inbounds %struct.bmp_dib_header_t* %65, i32 0, i32 9
  store i32 0, i32* %66, align 4
  %67 = getelementptr inbounds %struct.bmp_image* %image, i32 0, i32 2
  %68 = getelementptr inbounds %struct.bmp_dib_header_t* %67, i32 0, i32 10
  store i32 0, i32* %68, align 4
  %69 = load i8** %4, align 8
  %70 = call %struct._IO_FILE* @fopen(i8* %69, i8* getelementptr inbounds ([3 x i8]* @.str35, i32 0, i32 0))
  store %struct._IO_FILE* %70, %struct._IO_FILE** %out_file, align 8
  %71 = getelementptr inbounds %struct.bmp_image* %image, i32 0, i32 0
  %72 = getelementptr inbounds [2 x i8]* %71, i32 0, i32 0
  %73 = load %struct._IO_FILE** %out_file, align 8
  %74 = call i64 @fwrite(i8* %72, i64 1, i64 2, %struct._IO_FILE* %73)
  %75 = getelementptr inbounds %struct.bmp_image* %image, i32 0, i32 1
  %76 = bitcast %struct.bmpfile_header_t* %75 to i8*
  %77 = load %struct._IO_FILE** %out_file, align 8
  %78 = call i64 @fwrite(i8* %76, i64 1, i64 12, %struct._IO_FILE* %77)
  %79 = getelementptr inbounds %struct.bmp_image* %image, i32 0, i32 2
  %80 = bitcast %struct.bmp_dib_header_t* %79 to i8*
  %81 = load %struct._IO_FILE** %out_file, align 8
  %82 = call i64 @fwrite(i8* %80, i64 1, i64 40, %struct._IO_FILE* %81)
  %83 = load i32* %2, align 4
  %84 = sub nsw i32 %83, 1
  store i32 %84, i32* %h, align 4
  br label %85

; <label>:85                                      ; preds = %105, %0
  %86 = load i32* %h, align 4
  %87 = icmp sge i32 %86, 0
  br i1 %87, label %88, label %108

; <label>:88                                      ; preds = %85
  %89 = load i32* %h, align 4
  %90 = load i32* %3, align 4
  %91 = mul nsw i32 %89, %90
  %92 = sext i32 %91 to i64
  %93 = load %struct.RGB** %1, align 8
  %94 = getelementptr inbounds %struct.RGB* %93, i64 %92
  %95 = bitcast %struct.RGB* %94 to i8*
  %96 = load i32* %3, align 4
  %97 = sext i32 %96 to i64
  %98 = load %struct._IO_FILE** %out_file, align 8
  %99 = call i64 @fwrite(i8* %95, i64 3, i64 %97, %struct._IO_FILE* %98)
  %100 = load i8** %pad, align 8
  %101 = load i32* %padded_width, align 4
  %102 = sext i32 %101 to i64
  %103 = load %struct._IO_FILE** %out_file, align 8
  %104 = call i64 @fwrite(i8* %100, i64 1, i64 %102, %struct._IO_FILE* %103)
  br label %105

; <label>:105                                     ; preds = %88
  %106 = load i32* %h, align 4
  %107 = add nsw i32 %106, -1
  store i32 %107, i32* %h, align 4
  br label %85

; <label>:108                                     ; preds = %85
  %109 = load %struct._IO_FILE** %out_file, align 8
  %110 = call i32 @fclose(%struct._IO_FILE* %109)
  ret void
}

declare i64 @fwrite(i8*, i64, i64, %struct._IO_FILE*) #1

; Function Attrs: nounwind uwtable
define i24 @HSVtoRGB(float %h, float %s, float %v) #0 {
  %1 = alloca %struct.RGB, align 1
  %2 = alloca float, align 4
  %3 = alloca float, align 4
  %4 = alloca float, align 4
  %i = alloca i32, align 4
  %f = alloca float, align 4
  %p = alloca float, align 4
  %q = alloca float, align 4
  %t = alloca float, align 4
  %r = alloca float, align 4
  %g = alloca float, align 4
  %b = alloca float, align 4
  %value = alloca %struct.RGB, align 1
  %temp = alloca i32, align 4
  %5 = alloca i24
  store float %h, float* %2, align 4
  store float %s, float* %3, align 4
  store float %v, float* %4, align 4
  %6 = bitcast %struct.RGB* %value to i8*
  call void @llvm.memset.p0i8.i64(i8* %6, i8 0, i64 3, i32 1, i1 false)
  %7 = load float* %3, align 4
  %8 = fcmp oeq float %7, 0.000000e+00
  br i1 %8, label %9, label %13

; <label>:9                                       ; preds = %0
  %10 = load float* %4, align 4
  store float %10, float* %b, align 4
  store float %10, float* %g, align 4
  store float %10, float* %r, align 4
  %11 = bitcast %struct.RGB* %1 to i8*
  %12 = bitcast %struct.RGB* %value to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %11, i8* %12, i64 3, i32 1, i1 false)
  br label %87

; <label>:13                                      ; preds = %0
  %14 = load float* %2, align 4
  %15 = fdiv float %14, 6.000000e+01
  store float %15, float* %2, align 4
  %16 = load float* %2, align 4
  %17 = fpext float %16 to double
  %18 = call double @floor(double %17) #7
  %19 = fptosi double %18 to i32
  store i32 %19, i32* %i, align 4
  %20 = load float* %2, align 4
  %21 = load i32* %i, align 4
  %22 = sitofp i32 %21 to float
  %23 = fsub float %20, %22
  store float %23, float* %f, align 4
  %24 = load float* %4, align 4
  %25 = load float* %3, align 4
  %26 = fsub float 1.000000e+00, %25
  %27 = fmul float %24, %26
  store float %27, float* %p, align 4
  %28 = load float* %4, align 4
  %29 = load float* %3, align 4
  %30 = load float* %f, align 4
  %31 = fmul float %29, %30
  %32 = fsub float 1.000000e+00, %31
  %33 = fmul float %28, %32
  store float %33, float* %q, align 4
  %34 = load float* %4, align 4
  %35 = load float* %3, align 4
  %36 = load float* %f, align 4
  %37 = fsub float 1.000000e+00, %36
  %38 = fmul float %35, %37
  %39 = fsub float 1.000000e+00, %38
  %40 = fmul float %34, %39
  store float %40, float* %t, align 4
  %41 = load i32* %i, align 4
  switch i32 %41, label %62 [
    i32 0, label %42
    i32 1, label %46
    i32 2, label %50
    i32 3, label %54
    i32 4, label %58
  ]

; <label>:42                                      ; preds = %13
  %43 = load float* %4, align 4
  store float %43, float* %r, align 4
  %44 = load float* %t, align 4
  store float %44, float* %g, align 4
  %45 = load float* %p, align 4
  store float %45, float* %b, align 4
  br label %66

; <label>:46                                      ; preds = %13
  %47 = load float* %q, align 4
  store float %47, float* %r, align 4
  %48 = load float* %4, align 4
  store float %48, float* %g, align 4
  %49 = load float* %p, align 4
  store float %49, float* %b, align 4
  br label %66

; <label>:50                                      ; preds = %13
  %51 = load float* %p, align 4
  store float %51, float* %r, align 4
  %52 = load float* %4, align 4
  store float %52, float* %g, align 4
  %53 = load float* %t, align 4
  store float %53, float* %b, align 4
  br label %66

; <label>:54                                      ; preds = %13
  %55 = load float* %p, align 4
  store float %55, float* %r, align 4
  %56 = load float* %q, align 4
  store float %56, float* %g, align 4
  %57 = load float* %4, align 4
  store float %57, float* %b, align 4
  br label %66

; <label>:58                                      ; preds = %13
  %59 = load float* %t, align 4
  store float %59, float* %r, align 4
  %60 = load float* %p, align 4
  store float %60, float* %g, align 4
  %61 = load float* %4, align 4
  store float %61, float* %b, align 4
  br label %66

; <label>:62                                      ; preds = %13
  %63 = load float* %4, align 4
  store float %63, float* %r, align 4
  %64 = load float* %p, align 4
  store float %64, float* %g, align 4
  %65 = load float* %q, align 4
  store float %65, float* %b, align 4
  br label %66

; <label>:66                                      ; preds = %62, %58, %54, %50, %46, %42
  %67 = load float* %r, align 4
  %68 = fmul float %67, 2.550000e+02
  %69 = fptoui float %68 to i32
  store i32 %69, i32* %temp, align 4
  %70 = load i32* %temp, align 4
  %71 = trunc i32 %70 to i8
  %72 = getelementptr inbounds %struct.RGB* %value, i32 0, i32 2
  store i8 %71, i8* %72, align 1
  %73 = load float* %g, align 4
  %74 = fmul float %73, 2.550000e+02
  %75 = fptoui float %74 to i32
  store i32 %75, i32* %temp, align 4
  %76 = load i32* %temp, align 4
  %77 = trunc i32 %76 to i8
  %78 = getelementptr inbounds %struct.RGB* %value, i32 0, i32 1
  store i8 %77, i8* %78, align 1
  %79 = load float* %b, align 4
  %80 = fmul float %79, 2.550000e+02
  %81 = fptoui float %80 to i32
  store i32 %81, i32* %temp, align 4
  %82 = load i32* %temp, align 4
  %83 = trunc i32 %82 to i8
  %84 = getelementptr inbounds %struct.RGB* %value, i32 0, i32 0
  store i8 %83, i8* %84, align 1
  %85 = bitcast %struct.RGB* %1 to i8*
  %86 = bitcast %struct.RGB* %value to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %85, i8* %86, i64 3, i32 1, i1 false)
  br label %87

; <label>:87                                      ; preds = %66, %9
  %88 = bitcast i24* %5 to i8*
  %89 = bitcast %struct.RGB* %1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %88, i8* %89, i64 3, i32 1, i1 false)
  %90 = load i24* %5
  ret i24 %90
}

; Function Attrs: nounwind readnone
declare double @floor(double) #5

; Function Attrs: nounwind uwtable
define void @dump_histo_img(i8* %histo, i32 %height, i32 %width, i8* %filename) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 8
  %pixel_map = alloca %struct.RGB*, align 8
  %y = alloca i64, align 8
  %x = alloca i64, align 8
  %value = alloca i8, align 1
  %5 = alloca %struct.RGB, align 1
  %6 = alloca i24
  store i8* %histo, i8** %1, align 8
  store i32 %height, i32* %2, align 4
  store i32 %width, i32* %3, align 4
  store i8* %filename, i8** %4, align 8
  %7 = load i32* %2, align 4
  %8 = load i32* %3, align 4
  %9 = mul i32 %7, %8
  %10 = zext i32 %9 to i64
  %11 = mul i64 %10, 3
  %12 = call noalias i8* @malloc(i64 %11) #4
  %13 = bitcast i8* %12 to %struct.RGB*
  store %struct.RGB* %13, %struct.RGB** %pixel_map, align 8
  store i64 0, i64* %y, align 8
  br label %14

; <label>:14                                      ; preds = %94, %0
  %15 = load i64* %y, align 8
  %16 = load i32* %2, align 4
  %17 = zext i32 %16 to i64
  %18 = icmp ult i64 %15, %17
  br i1 %18, label %19, label %97

; <label>:19                                      ; preds = %14
  store i64 0, i64* %x, align 8
  br label %20

; <label>:20                                      ; preds = %90, %19
  %21 = load i64* %x, align 8
  %22 = load i32* %3, align 4
  %23 = zext i32 %22 to i64
  %24 = icmp ult i64 %21, %23
  br i1 %24, label %25, label %93

; <label>:25                                      ; preds = %20
  %26 = load i64* %y, align 8
  %27 = load i32* %3, align 4
  %28 = zext i32 %27 to i64
  %29 = mul i64 %26, %28
  %30 = load i64* %x, align 8
  %31 = add i64 %29, %30
  %32 = load i8** %1, align 8
  %33 = getelementptr inbounds i8* %32, i64 %31
  %34 = load i8* %33, align 1
  store i8 %34, i8* %value, align 1
  %35 = load i8* %value, align 1
  %36 = zext i8 %35 to i32
  %37 = icmp eq i32 %36, 0
  br i1 %37, label %38, label %66

; <label>:38                                      ; preds = %25
  %39 = load i64* %y, align 8
  %40 = load i32* %3, align 4
  %41 = zext i32 %40 to i64
  %42 = mul i64 %39, %41
  %43 = load i64* %x, align 8
  %44 = add i64 %42, %43
  %45 = load %struct.RGB** %pixel_map, align 8
  %46 = getelementptr inbounds %struct.RGB* %45, i64 %44
  %47 = getelementptr inbounds %struct.RGB* %46, i32 0, i32 2
  store i8 0, i8* %47, align 1
  %48 = load i64* %y, align 8
  %49 = load i32* %3, align 4
  %50 = zext i32 %49 to i64
  %51 = mul i64 %48, %50
  %52 = load i64* %x, align 8
  %53 = add i64 %51, %52
  %54 = load %struct.RGB** %pixel_map, align 8
  %55 = getelementptr inbounds %struct.RGB* %54, i64 %53
  %56 = getelementptr inbounds %struct.RGB* %55, i32 0, i32 1
  store i8 0, i8* %56, align 1
  %57 = load i64* %y, align 8
  %58 = load i32* %3, align 4
  %59 = zext i32 %58 to i64
  %60 = mul i64 %57, %59
  %61 = load i64* %x, align 8
  %62 = add i64 %60, %61
  %63 = load %struct.RGB** %pixel_map, align 8
  %64 = getelementptr inbounds %struct.RGB* %63, i64 %62
  %65 = getelementptr inbounds %struct.RGB* %64, i32 0, i32 0
  store i8 0, i8* %65, align 1
  br label %89

; <label>:66                                      ; preds = %25
  %67 = load i64* %y, align 8
  %68 = load i32* %3, align 4
  %69 = zext i32 %68 to i64
  %70 = mul i64 %67, %69
  %71 = load i64* %x, align 8
  %72 = add i64 %70, %71
  %73 = load %struct.RGB** %pixel_map, align 8
  %74 = getelementptr inbounds %struct.RGB* %73, i64 %72
  %75 = load i8* %value, align 1
  %76 = uitofp i8 %75 to float
  %77 = fpext float %76 to double
  %78 = fmul double 6.300000e+01, %77
  %79 = fdiv double %78, 2.550000e+02
  %80 = fadd double 1.000000e+00, %79
  %81 = call double @cbrt(double %80) #4
  %82 = fdiv double %81, 4.000000e+00
  %83 = fptrunc double %82 to float
  %84 = call i24 @HSVtoRGB(float 0.000000e+00, float 1.000000e+00, float %83)
  store i24 %84, i24* %6
  %85 = bitcast i24* %6 to i8*
  %86 = bitcast %struct.RGB* %5 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %86, i8* %85, i64 3, i32 1, i1 false)
  %87 = bitcast %struct.RGB* %74 to i8*
  %88 = bitcast %struct.RGB* %5 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %87, i8* %88, i64 3, i32 1, i1 false)
  br label %89

; <label>:89                                      ; preds = %66, %38
  br label %90

; <label>:90                                      ; preds = %89
  %91 = load i64* %x, align 8
  %92 = add i64 %91, 1
  store i64 %92, i64* %x, align 8
  br label %20

; <label>:93                                      ; preds = %20
  br label %94

; <label>:94                                      ; preds = %93
  %95 = load i64* %y, align 8
  %96 = add i64 %95, 1
  store i64 %96, i64* %y, align 8
  br label %14

; <label>:97                                      ; preds = %14
  %98 = load %struct.RGB** %pixel_map, align 8
  %99 = load i32* %2, align 4
  %100 = load i32* %3, align 4
  %101 = load i8** %4, align 8
  call void @create_bmp(%struct.RGB* %98, i32 %99, i32 %100, i8* %101)
  %102 = load %struct.RGB** %pixel_map, align 8
  %103 = bitcast %struct.RGB* %102 to i8*
  call void @free(i8* %103) #4
  ret void
}

; Function Attrs: nounwind
declare double @cbrt(double) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind readonly }
attributes #7 = { nounwind readnone }

!llvm.ident = !{!0, !0, !0}

!0 = metadata !{metadata !"clang version 3.4 (tags/RELEASE_34/final)"}
