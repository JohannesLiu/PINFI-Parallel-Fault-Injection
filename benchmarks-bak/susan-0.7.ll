; ModuleID = 'temp2.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.anon = type { i32, i32, i32, i32, i32, i32 }

@.str = private unnamed_addr constant [44 x i8] c"Usage: susan <in.pgm> <out.pgm> [options]\0A\0A\00", align 1
@.str1 = private unnamed_addr constant [31 x i8] c"-s : Smoothing mode (default)\0A\00", align 1
@.str2 = private unnamed_addr constant [17 x i8] c"-e : Edges mode\0A\00", align 1
@.str3 = private unnamed_addr constant [20 x i8] c"-c : Corners mode\0A\0A\00", align 1
@.str4 = private unnamed_addr constant [67 x i8] c"See source code for more information about setting the thresholds\0A\00", align 1
@.str5 = private unnamed_addr constant [60 x i8] c"-t <thresh> : Brightness threshold, all modes (default=20)\0A\00", align 1
@.str6 = private unnamed_addr constant [107 x i8] c"-d <thresh> : Distance threshold, smoothing mode, (default=4) (use next option instead for flat 3x3 mask)\0A\00", align 1
@.str7 = private unnamed_addr constant [49 x i8] c"-3 : Use flat 3x3 mask, edges or smoothing mode\0A\00", align 1
@.str8 = private unnamed_addr constant [79 x i8] c"-n : No post-processing on the binary edge map (runs much faster); edges mode\0A\00", align 1
@.str9 = private unnamed_addr constant [111 x i8] c"-q : Use faster (and usually stabler) corner mode; edge-like corner suppression not carried out; corners mode\0A\00", align 1
@.str10 = private unnamed_addr constant [108 x i8] c"-b : Mark corners/edges with single black points instead of black with white border; corners or edges mode\0A\00", align 1
@.str11 = private unnamed_addr constant [91 x i8] c"-p : Output initial enhancement image only; corners or edges mode (default is edges mode)\0A\00", align 1
@.str12 = private unnamed_addr constant [77 x i8] c"\0ASUSAN Version 2l (C) 1995-1997 Stephen Smith, DRA UK. steve@fmrib.ox.ac.uk\0A\00", align 1
@stderr = external global %struct._IO_FILE*
@.str13 = private unnamed_addr constant [26 x i8] c"Image %s not binary PGM.\0A\00", align 1
@.str14 = private unnamed_addr constant [3 x i8] c"is\00", align 1
@.str15 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str16 = private unnamed_addr constant [23 x i8] c"Can't input image %s.\0A\00", align 1
@.str17 = private unnamed_addr constant [43 x i8] c"Image %s does not have binary PGM header.\0A\00", align 1
@.str18 = private unnamed_addr constant [25 x i8] c"Image %s is wrong size.\0A\00", align 1
@.str19 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str20 = private unnamed_addr constant [23 x i8] c"Can't output image%s.\0A\00", align 1
@.str21 = private unnamed_addr constant [4 x i8] c"P5\0A\00", align 1
@.str22 = private unnamed_addr constant [7 x i8] c"%d %d\0A\00", align 1
@.str23 = private unnamed_addr constant [5 x i8] c"255\0A\00", align 1
@.str24 = private unnamed_addr constant [23 x i8] c"Can't write image %s.\0A\00", align 1
@.str25 = private unnamed_addr constant [54 x i8] c"Distance_thresh (%f) too big for integer arithmetic.\0A\00", align 1
@.str26 = private unnamed_addr constant [61 x i8] c"Either reduce it to <=15 or recompile with variable \22total\22\0A\00", align 1
@.str27 = private unnamed_addr constant [40 x i8] c"as a float: see top \22defines\22 section.\0A\00", align 1
@.str28 = private unnamed_addr constant [65 x i8] c"Mask size (1.5*distance_thresh+1=%d) too big for image (%dx%d).\0A\00", align 1
@.str29 = private unnamed_addr constant [26 x i8] c"No argument following -d\0A\00", align 1
@.str30 = private unnamed_addr constant [26 x i8] c"No argument following -t\0A\00", align 1
@.str31 = private unnamed_addr constant [19 x i8] c"Omit susan edges.\0A\00", align 1
@.str32 = private unnamed_addr constant [21 x i8] c"Omit susan corners.\0A\00", align 1
@global_var1 = global i64 0, align 8
@global_var2 = global i64 0, align 8

; Function Attrs: nounwind uwtable
define i32 @usage() #0 {
  %1 = alloca i32, align 4, !llfi_index !1
  %2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str, i32 0, i32 0)), !llfi_index !2
  %3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str1, i32 0, i32 0)), !llfi_index !3
  %4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str2, i32 0, i32 0)), !llfi_index !4
  %5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str3, i32 0, i32 0)), !llfi_index !5
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([67 x i8]* @.str4, i32 0, i32 0)), !llfi_index !6
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([60 x i8]* @.str5, i32 0, i32 0)), !llfi_index !7
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([107 x i8]* @.str6, i32 0, i32 0)), !llfi_index !8
  %9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([49 x i8]* @.str7, i32 0, i32 0)), !llfi_index !9
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([79 x i8]* @.str8, i32 0, i32 0)), !llfi_index !10
  %11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([111 x i8]* @.str9, i32 0, i32 0)), !llfi_index !11
  %12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([108 x i8]* @.str10, i32 0, i32 0)), !llfi_index !12
  %13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([91 x i8]* @.str11, i32 0, i32 0)), !llfi_index !13
  %14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([77 x i8]* @.str12, i32 0, i32 0)), !llfi_index !14
  call void @global_check()
  call void @exit(i32 0) #6, !llfi_index !15
  unreachable, !llfi_index !16
                                                  ; No predecessors!
  %16 = load i32* %1, !llfi_index !17
  %17 = load i32* %1, !llfi_index !17
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %16, i32 %17)
  ret i32 %16, !llfi_index !18
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

; Function Attrs: nounwind uwtable
define i32 @getint(%struct._IO_FILE* %fd) #0 {
  %1 = alloca i32, align 4, !llfi_index !19
  %2 = alloca %struct._IO_FILE*, align 8, !llfi_index !20
  %c = alloca i32, align 4, !llfi_index !21
  %i = alloca i32, align 4, !llfi_index !22
  %dummy = alloca [10000 x i8], align 16, !llfi_index !23
  store %struct._IO_FILE* %fd, %struct._IO_FILE** %2, align 8, !llfi_index !24
  %3 = load %struct._IO_FILE** %2, align 8, !llfi_index !25
  %4 = load %struct._IO_FILE** %2, align 8, !llfi_index !25
  call void bitcast (void (i64, i64)* @global_add to void (%struct._IO_FILE*, %struct._IO_FILE*)*)(%struct._IO_FILE* %3, %struct._IO_FILE* %4)
  %5 = call i32 @_IO_getc(%struct._IO_FILE* %3), !llfi_index !26
  store i32 %5, i32* %c, align 4, !llfi_index !27
  br label %6, !llfi_index !28

; <label>:6                                       ; preds = %37, %0
  %7 = load i32* %c, align 4, !llfi_index !29
  %8 = load i32* %c, align 4, !llfi_index !29
  %9 = icmp eq i32 %7, 35, !llfi_index !30
  %10 = icmp eq i32 %8, 35, !llfi_index !30
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %9, i1 %10)
  br i1 %9, label %11, label %17, !llfi_index !31

; <label>:11                                      ; preds = %6
  %12 = getelementptr inbounds [10000 x i8]* %dummy, i32 0, i32 0, !llfi_index !32
  %13 = getelementptr inbounds [10000 x i8]* %dummy, i32 0, i32 0, !llfi_index !32
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %12, i8* %13)
  %14 = load %struct._IO_FILE** %2, align 8, !llfi_index !33
  %15 = load %struct._IO_FILE** %2, align 8, !llfi_index !33
  call void bitcast (void (i64, i64)* @global_add to void (%struct._IO_FILE*, %struct._IO_FILE*)*)(%struct._IO_FILE* %14, %struct._IO_FILE* %15)
  %16 = call i8* @fgets(i8* %12, i32 9000, %struct._IO_FILE* %14), !llfi_index !34
  br label %17, !llfi_index !35

; <label>:17                                      ; preds = %11, %6
  %18 = load i32* %c, align 4, !llfi_index !36
  %19 = load i32* %c, align 4, !llfi_index !36
  %20 = icmp eq i32 %18, -1, !llfi_index !37
  %21 = icmp eq i32 %19, -1, !llfi_index !37
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %20, i1 %21)
  br i1 %20, label %22, label %26, !llfi_index !38

; <label>:22                                      ; preds = %17
  %23 = load %struct._IO_FILE** @stderr, align 8, !llfi_index !39
  %24 = load %struct._IO_FILE** @stderr, align 8, !llfi_index !39
  call void bitcast (void (i64, i64)* @global_add to void (%struct._IO_FILE*, %struct._IO_FILE*)*)(%struct._IO_FILE* %23, %struct._IO_FILE* %24)
  %25 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([26 x i8]* @.str13, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str14, i32 0, i32 0)), !llfi_index !40
  call void @global_check()
  call void @exit(i32 0) #6, !llfi_index !41
  unreachable, !llfi_index !42

; <label>:26                                      ; preds = %17
  %27 = load i32* %c, align 4, !llfi_index !43
  %28 = load i32* %c, align 4, !llfi_index !43
  %29 = icmp sge i32 %27, 48, !llfi_index !44
  %30 = icmp sge i32 %28, 48, !llfi_index !44
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %29, i1 %30)
  br i1 %29, label %31, label %37, !llfi_index !45

; <label>:31                                      ; preds = %26
  %32 = load i32* %c, align 4, !llfi_index !46
  %33 = load i32* %c, align 4, !llfi_index !46
  %34 = icmp sle i32 %32, 57, !llfi_index !47
  %35 = icmp sle i32 %33, 57, !llfi_index !47
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %34, i1 %35)
  br i1 %34, label %36, label %37, !llfi_index !48

; <label>:36                                      ; preds = %31
  br label %41, !llfi_index !49

; <label>:37                                      ; preds = %31, %26
  %38 = load %struct._IO_FILE** %2, align 8, !llfi_index !50
  %39 = load %struct._IO_FILE** %2, align 8, !llfi_index !50
  call void bitcast (void (i64, i64)* @global_add to void (%struct._IO_FILE*, %struct._IO_FILE*)*)(%struct._IO_FILE* %38, %struct._IO_FILE* %39)
  %40 = call i32 @_IO_getc(%struct._IO_FILE* %38), !llfi_index !51
  store i32 %40, i32* %c, align 4, !llfi_index !52
  br label %6, !llfi_index !53

; <label>:41                                      ; preds = %36
  store i32 0, i32* %i, align 4, !llfi_index !54
  br label %42, !llfi_index !55

; <label>:42                                      ; preds = %74, %41
  %43 = load i32* %i, align 4, !llfi_index !56
  %44 = load i32* %i, align 4, !llfi_index !56
  %45 = mul nsw i32 %43, 10, !llfi_index !57
  %46 = mul nsw i32 %44, 10, !llfi_index !57
  %47 = load i32* %c, align 4, !llfi_index !58
  %48 = load i32* %c, align 4, !llfi_index !58
  %49 = sub nsw i32 %47, 48, !llfi_index !59
  %50 = sub nsw i32 %48, 48, !llfi_index !59
  %51 = add nsw i32 %45, %49, !llfi_index !60
  %52 = add nsw i32 %46, %50, !llfi_index !60
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %51, i32 %52)
  store i32 %51, i32* %i, align 4, !llfi_index !61
  %53 = load %struct._IO_FILE** %2, align 8, !llfi_index !62
  %54 = load %struct._IO_FILE** %2, align 8, !llfi_index !62
  call void bitcast (void (i64, i64)* @global_add to void (%struct._IO_FILE*, %struct._IO_FILE*)*)(%struct._IO_FILE* %53, %struct._IO_FILE* %54)
  %55 = call i32 @_IO_getc(%struct._IO_FILE* %53), !llfi_index !63
  store i32 %55, i32* %c, align 4, !llfi_index !64
  %56 = load i32* %c, align 4, !llfi_index !65
  %57 = load i32* %c, align 4, !llfi_index !65
  %58 = icmp eq i32 %56, -1, !llfi_index !66
  %59 = icmp eq i32 %57, -1, !llfi_index !66
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %58, i1 %59)
  br i1 %58, label %60, label %63, !llfi_index !67

; <label>:60                                      ; preds = %42
  %61 = load i32* %i, align 4, !llfi_index !68
  %62 = load i32* %i, align 4, !llfi_index !68
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %61, i32 %62)
  store i32 %61, i32* %1, !llfi_index !69
  br label %78, !llfi_index !70

; <label>:63                                      ; preds = %42
  %64 = load i32* %c, align 4, !llfi_index !71
  %65 = load i32* %c, align 4, !llfi_index !71
  %66 = icmp slt i32 %64, 48, !llfi_index !72
  %67 = icmp slt i32 %65, 48, !llfi_index !72
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %66, i1 %67)
  br i1 %66, label %73, label %68, !llfi_index !73

; <label>:68                                      ; preds = %63
  %69 = load i32* %c, align 4, !llfi_index !74
  %70 = load i32* %c, align 4, !llfi_index !74
  %71 = icmp sgt i32 %69, 57, !llfi_index !75
  %72 = icmp sgt i32 %70, 57, !llfi_index !75
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %71, i1 %72)
  br i1 %71, label %73, label %74, !llfi_index !76

; <label>:73                                      ; preds = %68, %63
  br label %75, !llfi_index !77

; <label>:74                                      ; preds = %68
  br label %42, !llfi_index !78

; <label>:75                                      ; preds = %73
  %76 = load i32* %i, align 4, !llfi_index !79
  %77 = load i32* %i, align 4, !llfi_index !79
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %76, i32 %77)
  store i32 %76, i32* %1, !llfi_index !80
  br label %78, !llfi_index !81

; <label>:78                                      ; preds = %75, %60
  %79 = load i32* %1, !llfi_index !82
  %80 = load i32* %1, !llfi_index !82
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %79, i32 %80)
  ret i32 %79, !llfi_index !83
}

declare i32 @_IO_getc(%struct._IO_FILE*) #1

declare i8* @fgets(i8*, i32, %struct._IO_FILE*) #1

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind uwtable
define void @get_image(i8* %filename, i8** %in, i32* %x_size, i32* %y_size) #0 {
  %1 = alloca i8*, align 8, !llfi_index !84
  %2 = alloca i8**, align 8, !llfi_index !85
  %3 = alloca i32*, align 8, !llfi_index !86
  %4 = alloca i32*, align 8, !llfi_index !87
  %fd = alloca %struct._IO_FILE*, align 8, !llfi_index !88
  %header = alloca [100 x i8], align 16, !llfi_index !89
  %tmp = alloca i32, align 4, !llfi_index !90
  store i8* %filename, i8** %1, align 8, !llfi_index !91
  store i8** %in, i8*** %2, align 8, !llfi_index !92
  store i32* %x_size, i32** %3, align 8, !llfi_index !93
  store i32* %y_size, i32** %4, align 8, !llfi_index !94
  %5 = load i8** %1, align 8, !llfi_index !95
  %6 = load i8** %1, align 8, !llfi_index !95
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %5, i8* %6)
  %7 = call %struct._IO_FILE* @fopen(i8* %5, i8* getelementptr inbounds ([2 x i8]* @.str15, i32 0, i32 0)), !llfi_index !96
  store %struct._IO_FILE* %7, %struct._IO_FILE** %fd, align 8, !llfi_index !97
  %8 = icmp eq %struct._IO_FILE* %7, null, !llfi_index !98
  %9 = icmp eq %struct._IO_FILE* %7, null, !llfi_index !98
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %8, i1 %9)
  br i1 %8, label %10, label %16, !llfi_index !99

; <label>:10                                      ; preds = %0
  %11 = load %struct._IO_FILE** @stderr, align 8, !llfi_index !100
  %12 = load %struct._IO_FILE** @stderr, align 8, !llfi_index !100
  call void bitcast (void (i64, i64)* @global_add to void (%struct._IO_FILE*, %struct._IO_FILE*)*)(%struct._IO_FILE* %11, %struct._IO_FILE* %12)
  %13 = load i8** %1, align 8, !llfi_index !101
  %14 = load i8** %1, align 8, !llfi_index !101
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %13, i8* %14)
  %15 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([23 x i8]* @.str16, i32 0, i32 0), i8* %13), !llfi_index !102
  call void @global_check()
  call void @exit(i32 0) #6, !llfi_index !103
  unreachable, !llfi_index !104

; <label>:16                                      ; preds = %0
  %17 = load %struct._IO_FILE** %fd, align 8, !llfi_index !105
  %18 = load %struct._IO_FILE** %fd, align 8, !llfi_index !105
  call void bitcast (void (i64, i64)* @global_add to void (%struct._IO_FILE*, %struct._IO_FILE*)*)(%struct._IO_FILE* %17, %struct._IO_FILE* %18)
  %19 = call i32 @fgetc(%struct._IO_FILE* %17), !llfi_index !106
  %20 = trunc i32 %19 to i8, !llfi_index !107
  %21 = trunc i32 %19 to i8, !llfi_index !107
  call void bitcast (void (i64, i64)* @global_add to void (i8, i8)*)(i8 %20, i8 %21)
  %22 = getelementptr inbounds [100 x i8]* %header, i32 0, i64 0, !llfi_index !108
  %23 = getelementptr inbounds [100 x i8]* %header, i32 0, i64 0, !llfi_index !108
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %22, i8* %23)
  store i8 %20, i8* %22, align 1, !llfi_index !109
  %24 = load %struct._IO_FILE** %fd, align 8, !llfi_index !110
  %25 = load %struct._IO_FILE** %fd, align 8, !llfi_index !110
  call void bitcast (void (i64, i64)* @global_add to void (%struct._IO_FILE*, %struct._IO_FILE*)*)(%struct._IO_FILE* %24, %struct._IO_FILE* %25)
  %26 = call i32 @fgetc(%struct._IO_FILE* %24), !llfi_index !111
  %27 = trunc i32 %26 to i8, !llfi_index !112
  %28 = trunc i32 %26 to i8, !llfi_index !112
  call void bitcast (void (i64, i64)* @global_add to void (i8, i8)*)(i8 %27, i8 %28)
  %29 = getelementptr inbounds [100 x i8]* %header, i32 0, i64 1, !llfi_index !113
  %30 = getelementptr inbounds [100 x i8]* %header, i32 0, i64 1, !llfi_index !113
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %29, i8* %30)
  store i8 %27, i8* %29, align 1, !llfi_index !114
  %31 = getelementptr inbounds [100 x i8]* %header, i32 0, i64 0, !llfi_index !115
  %32 = getelementptr inbounds [100 x i8]* %header, i32 0, i64 0, !llfi_index !115
  %33 = load i8* %31, align 1, !llfi_index !116
  %34 = load i8* %32, align 1, !llfi_index !116
  %35 = sext i8 %33 to i32, !llfi_index !117
  %36 = sext i8 %34 to i32, !llfi_index !117
  %37 = icmp eq i32 %35, 80, !llfi_index !118
  %38 = icmp eq i32 %36, 80, !llfi_index !118
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %37, i1 %38)
  br i1 %37, label %39, label %48, !llfi_index !119

; <label>:39                                      ; preds = %16
  %40 = getelementptr inbounds [100 x i8]* %header, i32 0, i64 1, !llfi_index !120
  %41 = getelementptr inbounds [100 x i8]* %header, i32 0, i64 1, !llfi_index !120
  %42 = load i8* %40, align 1, !llfi_index !121
  %43 = load i8* %41, align 1, !llfi_index !121
  %44 = sext i8 %42 to i32, !llfi_index !122
  %45 = sext i8 %43 to i32, !llfi_index !122
  %46 = icmp eq i32 %44, 53, !llfi_index !123
  %47 = icmp eq i32 %45, 53, !llfi_index !123
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %46, i1 %47)
  br i1 %46, label %54, label %48, !llfi_index !124

; <label>:48                                      ; preds = %39, %16
  %49 = load %struct._IO_FILE** @stderr, align 8, !llfi_index !125
  %50 = load %struct._IO_FILE** @stderr, align 8, !llfi_index !125
  call void bitcast (void (i64, i64)* @global_add to void (%struct._IO_FILE*, %struct._IO_FILE*)*)(%struct._IO_FILE* %49, %struct._IO_FILE* %50)
  %51 = load i8** %1, align 8, !llfi_index !126
  %52 = load i8** %1, align 8, !llfi_index !126
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %51, i8* %52)
  %53 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %49, i8* getelementptr inbounds ([43 x i8]* @.str17, i32 0, i32 0), i8* %51), !llfi_index !127
  call void @global_check()
  call void @exit(i32 0) #6, !llfi_index !128
  unreachable, !llfi_index !129

; <label>:54                                      ; preds = %39
  %55 = load %struct._IO_FILE** %fd, align 8, !llfi_index !130
  %56 = load %struct._IO_FILE** %fd, align 8, !llfi_index !130
  call void bitcast (void (i64, i64)* @global_add to void (%struct._IO_FILE*, %struct._IO_FILE*)*)(%struct._IO_FILE* %55, %struct._IO_FILE* %56)
  %57 = call i32 @getint(%struct._IO_FILE* %55), !llfi_index !131
  %58 = load i32** %3, align 8, !llfi_index !132
  %59 = load i32** %3, align 8, !llfi_index !132
  call void bitcast (void (i64, i64)* @global_add to void (i32*, i32*)*)(i32* %58, i32* %59)
  store i32 %57, i32* %58, align 4, !llfi_index !133
  %60 = load %struct._IO_FILE** %fd, align 8, !llfi_index !134
  %61 = load %struct._IO_FILE** %fd, align 8, !llfi_index !134
  call void bitcast (void (i64, i64)* @global_add to void (%struct._IO_FILE*, %struct._IO_FILE*)*)(%struct._IO_FILE* %60, %struct._IO_FILE* %61)
  %62 = call i32 @getint(%struct._IO_FILE* %60), !llfi_index !135
  %63 = load i32** %4, align 8, !llfi_index !136
  %64 = load i32** %4, align 8, !llfi_index !136
  call void bitcast (void (i64, i64)* @global_add to void (i32*, i32*)*)(i32* %63, i32* %64)
  store i32 %62, i32* %63, align 4, !llfi_index !137
  %65 = load %struct._IO_FILE** %fd, align 8, !llfi_index !138
  %66 = load %struct._IO_FILE** %fd, align 8, !llfi_index !138
  call void bitcast (void (i64, i64)* @global_add to void (%struct._IO_FILE*, %struct._IO_FILE*)*)(%struct._IO_FILE* %65, %struct._IO_FILE* %66)
  %67 = call i32 @getint(%struct._IO_FILE* %65), !llfi_index !139
  store i32 %67, i32* %tmp, align 4, !llfi_index !140
  %68 = load i32** %3, align 8, !llfi_index !141
  %69 = load i32** %3, align 8, !llfi_index !141
  %70 = load i32* %68, align 4, !llfi_index !142
  %71 = load i32* %69, align 4, !llfi_index !142
  %72 = load i32** %4, align 8, !llfi_index !143
  %73 = load i32** %4, align 8, !llfi_index !143
  %74 = load i32* %72, align 4, !llfi_index !144
  %75 = load i32* %73, align 4, !llfi_index !144
  %76 = mul nsw i32 %70, %74, !llfi_index !145
  %77 = mul nsw i32 %71, %75, !llfi_index !145
  %78 = sext i32 %76 to i64, !llfi_index !146
  %79 = sext i32 %77 to i64, !llfi_index !146
  call void @global_add(i64 %78, i64 %79)
  %80 = call noalias i8* @malloc(i64 %78) #4, !llfi_index !147
  %81 = load i8*** %2, align 8, !llfi_index !148
  %82 = load i8*** %2, align 8, !llfi_index !148
  call void bitcast (void (i64, i64)* @global_add to void (i8**, i8**)*)(i8** %81, i8** %82)
  store i8* %80, i8** %81, align 8, !llfi_index !149
  %83 = load i8*** %2, align 8, !llfi_index !150
  %84 = load i8*** %2, align 8, !llfi_index !150
  %85 = load i8** %83, align 8, !llfi_index !151
  %86 = load i8** %84, align 8, !llfi_index !151
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %85, i8* %86)
  %87 = load i32** %3, align 8, !llfi_index !152
  %88 = load i32** %3, align 8, !llfi_index !152
  %89 = load i32* %87, align 4, !llfi_index !153
  %90 = load i32* %88, align 4, !llfi_index !153
  %91 = load i32** %4, align 8, !llfi_index !154
  %92 = load i32** %4, align 8, !llfi_index !154
  %93 = load i32* %91, align 4, !llfi_index !155
  %94 = load i32* %92, align 4, !llfi_index !155
  %95 = mul nsw i32 %89, %93, !llfi_index !156
  %96 = mul nsw i32 %90, %94, !llfi_index !156
  %97 = sext i32 %95 to i64, !llfi_index !157
  %98 = sext i32 %96 to i64, !llfi_index !157
  call void @global_add(i64 %97, i64 %98)
  %99 = load %struct._IO_FILE** %fd, align 8, !llfi_index !158
  %100 = load %struct._IO_FILE** %fd, align 8, !llfi_index !158
  call void bitcast (void (i64, i64)* @global_add to void (%struct._IO_FILE*, %struct._IO_FILE*)*)(%struct._IO_FILE* %99, %struct._IO_FILE* %100)
  %101 = call i64 @fread(i8* %85, i64 1, i64 %97, %struct._IO_FILE* %99), !llfi_index !159
  %102 = icmp eq i64 %101, 0, !llfi_index !160
  %103 = icmp eq i64 %101, 0, !llfi_index !160
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %102, i1 %103)
  br i1 %102, label %104, label %110, !llfi_index !161

; <label>:104                                     ; preds = %54
  %105 = load %struct._IO_FILE** @stderr, align 8, !llfi_index !162
  %106 = load %struct._IO_FILE** @stderr, align 8, !llfi_index !162
  call void bitcast (void (i64, i64)* @global_add to void (%struct._IO_FILE*, %struct._IO_FILE*)*)(%struct._IO_FILE* %105, %struct._IO_FILE* %106)
  %107 = load i8** %1, align 8, !llfi_index !163
  %108 = load i8** %1, align 8, !llfi_index !163
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %107, i8* %108)
  %109 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %105, i8* getelementptr inbounds ([25 x i8]* @.str18, i32 0, i32 0), i8* %107), !llfi_index !164
  call void @global_check()
  call void @exit(i32 0) #6, !llfi_index !165
  unreachable, !llfi_index !166

; <label>:110                                     ; preds = %54
  %111 = load %struct._IO_FILE** %fd, align 8, !llfi_index !167
  %112 = load %struct._IO_FILE** %fd, align 8, !llfi_index !167
  call void bitcast (void (i64, i64)* @global_add to void (%struct._IO_FILE*, %struct._IO_FILE*)*)(%struct._IO_FILE* %111, %struct._IO_FILE* %112)
  %113 = call i32 @fclose(%struct._IO_FILE* %111), !llfi_index !168
  ret void, !llfi_index !169
}

declare %struct._IO_FILE* @fopen(i8*, i8*) #1

declare i32 @fgetc(%struct._IO_FILE*) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #3

declare i64 @fread(i8*, i64, i64, %struct._IO_FILE*) #1

declare i32 @fclose(%struct._IO_FILE*) #1

; Function Attrs: nounwind uwtable
define i32 @put_image(i8* %filename, i8* %in, i32 %x_size, i32 %y_size) #0 {
  %1 = alloca i32, align 4, !llfi_index !170
  %2 = alloca i8*, align 8, !llfi_index !171
  %3 = alloca i8*, align 8, !llfi_index !172
  %4 = alloca i32, align 4, !llfi_index !173
  %5 = alloca i32, align 4, !llfi_index !174
  %fd = alloca %struct._IO_FILE*, align 8, !llfi_index !175
  store i8* %filename, i8** %2, align 8, !llfi_index !176
  store i8* %in, i8** %3, align 8, !llfi_index !177
  store i32 %x_size, i32* %4, align 4, !llfi_index !178
  store i32 %y_size, i32* %5, align 4, !llfi_index !179
  %6 = load i8** %2, align 8, !llfi_index !180
  %7 = load i8** %2, align 8, !llfi_index !180
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %6, i8* %7)
  %8 = call %struct._IO_FILE* @fopen(i8* %6, i8* getelementptr inbounds ([2 x i8]* @.str19, i32 0, i32 0)), !llfi_index !181
  store %struct._IO_FILE* %8, %struct._IO_FILE** %fd, align 8, !llfi_index !182
  %9 = icmp eq %struct._IO_FILE* %8, null, !llfi_index !183
  %10 = icmp eq %struct._IO_FILE* %8, null, !llfi_index !183
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %9, i1 %10)
  br i1 %9, label %11, label %17, !llfi_index !184

; <label>:11                                      ; preds = %0
  %12 = load %struct._IO_FILE** @stderr, align 8, !llfi_index !185
  %13 = load %struct._IO_FILE** @stderr, align 8, !llfi_index !185
  call void bitcast (void (i64, i64)* @global_add to void (%struct._IO_FILE*, %struct._IO_FILE*)*)(%struct._IO_FILE* %12, %struct._IO_FILE* %13)
  %14 = load i8** %2, align 8, !llfi_index !186
  %15 = load i8** %2, align 8, !llfi_index !186
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %14, i8* %15)
  %16 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([23 x i8]* @.str20, i32 0, i32 0), i8* %14), !llfi_index !187
  call void @global_check()
  call void @exit(i32 0) #6, !llfi_index !188
  unreachable, !llfi_index !189

; <label>:17                                      ; preds = %0
  %18 = load %struct._IO_FILE** %fd, align 8, !llfi_index !190
  %19 = load %struct._IO_FILE** %fd, align 8, !llfi_index !190
  call void bitcast (void (i64, i64)* @global_add to void (%struct._IO_FILE*, %struct._IO_FILE*)*)(%struct._IO_FILE* %18, %struct._IO_FILE* %19)
  %20 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([4 x i8]* @.str21, i32 0, i32 0)), !llfi_index !191
  %21 = load %struct._IO_FILE** %fd, align 8, !llfi_index !192
  %22 = load %struct._IO_FILE** %fd, align 8, !llfi_index !192
  call void bitcast (void (i64, i64)* @global_add to void (%struct._IO_FILE*, %struct._IO_FILE*)*)(%struct._IO_FILE* %21, %struct._IO_FILE* %22)
  %23 = load i32* %4, align 4, !llfi_index !193
  %24 = load i32* %4, align 4, !llfi_index !193
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %23, i32 %24)
  %25 = load i32* %5, align 4, !llfi_index !194
  %26 = load i32* %5, align 4, !llfi_index !194
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %25, i32 %26)
  %27 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([7 x i8]* @.str22, i32 0, i32 0), i32 %23, i32 %25), !llfi_index !195
  %28 = load %struct._IO_FILE** %fd, align 8, !llfi_index !196
  %29 = load %struct._IO_FILE** %fd, align 8, !llfi_index !196
  call void bitcast (void (i64, i64)* @global_add to void (%struct._IO_FILE*, %struct._IO_FILE*)*)(%struct._IO_FILE* %28, %struct._IO_FILE* %29)
  %30 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %28, i8* getelementptr inbounds ([5 x i8]* @.str23, i32 0, i32 0)), !llfi_index !197
  %31 = load i8** %3, align 8, !llfi_index !198
  %32 = load i8** %3, align 8, !llfi_index !198
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %31, i8* %32)
  %33 = load i32* %4, align 4, !llfi_index !199
  %34 = load i32* %4, align 4, !llfi_index !199
  %35 = load i32* %5, align 4, !llfi_index !200
  %36 = load i32* %5, align 4, !llfi_index !200
  %37 = mul nsw i32 %33, %35, !llfi_index !201
  %38 = mul nsw i32 %34, %36, !llfi_index !201
  %39 = sext i32 %37 to i64, !llfi_index !202
  %40 = sext i32 %38 to i64, !llfi_index !202
  call void @global_add(i64 %39, i64 %40)
  %41 = load %struct._IO_FILE** %fd, align 8, !llfi_index !203
  %42 = load %struct._IO_FILE** %fd, align 8, !llfi_index !203
  call void bitcast (void (i64, i64)* @global_add to void (%struct._IO_FILE*, %struct._IO_FILE*)*)(%struct._IO_FILE* %41, %struct._IO_FILE* %42)
  %43 = call i64 @fwrite(i8* %31, i64 %39, i64 1, %struct._IO_FILE* %41), !llfi_index !204
  %44 = icmp ne i64 %43, 1, !llfi_index !205
  %45 = icmp ne i64 %43, 1, !llfi_index !205
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %44, i1 %45)
  br i1 %44, label %46, label %52, !llfi_index !206

; <label>:46                                      ; preds = %17
  %47 = load %struct._IO_FILE** @stderr, align 8, !llfi_index !207
  %48 = load %struct._IO_FILE** @stderr, align 8, !llfi_index !207
  call void bitcast (void (i64, i64)* @global_add to void (%struct._IO_FILE*, %struct._IO_FILE*)*)(%struct._IO_FILE* %47, %struct._IO_FILE* %48)
  %49 = load i8** %2, align 8, !llfi_index !208
  %50 = load i8** %2, align 8, !llfi_index !208
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %49, i8* %50)
  %51 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %47, i8* getelementptr inbounds ([23 x i8]* @.str24, i32 0, i32 0), i8* %49), !llfi_index !209
  call void @global_check()
  call void @exit(i32 0) #6, !llfi_index !210
  unreachable, !llfi_index !211

; <label>:52                                      ; preds = %17
  %53 = load %struct._IO_FILE** %fd, align 8, !llfi_index !212
  %54 = load %struct._IO_FILE** %fd, align 8, !llfi_index !212
  call void bitcast (void (i64, i64)* @global_add to void (%struct._IO_FILE*, %struct._IO_FILE*)*)(%struct._IO_FILE* %53, %struct._IO_FILE* %54)
  %55 = call i32 @fclose(%struct._IO_FILE* %53), !llfi_index !213
  %56 = load i32* %1, !llfi_index !214
  %57 = load i32* %1, !llfi_index !214
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %56, i32 %57)
  ret i32 %56, !llfi_index !215
}

declare i64 @fwrite(i8*, i64, i64, %struct._IO_FILE*) #1

; Function Attrs: nounwind uwtable
define i32 @int_to_uchar(i32* %r, i8* %in, i32 %size) #0 {
  %1 = alloca i32, align 4, !llfi_index !216
  %2 = alloca i32*, align 8, !llfi_index !217
  %3 = alloca i8*, align 8, !llfi_index !218
  %4 = alloca i32, align 4, !llfi_index !219
  %i = alloca i32, align 4, !llfi_index !220
  %max_r = alloca i32, align 4, !llfi_index !221
  %min_r = alloca i32, align 4, !llfi_index !222
  store i32* %r, i32** %2, align 8, !llfi_index !223
  store i8* %in, i8** %3, align 8, !llfi_index !224
  store i32 %size, i32* %4, align 4, !llfi_index !225
  %5 = load i32** %2, align 8, !llfi_index !226
  %6 = load i32** %2, align 8, !llfi_index !226
  %7 = getelementptr inbounds i32* %5, i64 0, !llfi_index !227
  %8 = getelementptr inbounds i32* %6, i64 0, !llfi_index !227
  %9 = load i32* %7, align 4, !llfi_index !228
  %10 = load i32* %8, align 4, !llfi_index !228
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %9, i32 %10)
  store i32 %9, i32* %max_r, align 4, !llfi_index !229
  %11 = load i32** %2, align 8, !llfi_index !230
  %12 = load i32** %2, align 8, !llfi_index !230
  %13 = getelementptr inbounds i32* %11, i64 0, !llfi_index !231
  %14 = getelementptr inbounds i32* %12, i64 0, !llfi_index !231
  %15 = load i32* %13, align 4, !llfi_index !232
  %16 = load i32* %14, align 4, !llfi_index !232
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %15, i32 %16)
  store i32 %15, i32* %min_r, align 4, !llfi_index !233
  store i32 0, i32* %i, align 4, !llfi_index !234
  br label %17, !llfi_index !235

; <label>:17                                      ; preds = %77, %0
  %18 = load i32* %i, align 4, !llfi_index !236
  %19 = load i32* %i, align 4, !llfi_index !236
  %20 = load i32* %4, align 4, !llfi_index !237
  %21 = load i32* %4, align 4, !llfi_index !237
  %22 = icmp slt i32 %18, %20, !llfi_index !238
  %23 = icmp slt i32 %19, %21, !llfi_index !238
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %22, i1 %23)
  br i1 %22, label %24, label %82, !llfi_index !239

; <label>:24                                      ; preds = %17
  %25 = load i32* %i, align 4, !llfi_index !240
  %26 = load i32* %i, align 4, !llfi_index !240
  %27 = sext i32 %25 to i64, !llfi_index !241
  %28 = sext i32 %26 to i64, !llfi_index !241
  %29 = load i32** %2, align 8, !llfi_index !242
  %30 = load i32** %2, align 8, !llfi_index !242
  %31 = getelementptr inbounds i32* %29, i64 %27, !llfi_index !243
  %32 = getelementptr inbounds i32* %30, i64 %28, !llfi_index !243
  %33 = load i32* %31, align 4, !llfi_index !244
  %34 = load i32* %32, align 4, !llfi_index !244
  %35 = load i32* %max_r, align 4, !llfi_index !245
  %36 = load i32* %max_r, align 4, !llfi_index !245
  %37 = icmp sgt i32 %33, %35, !llfi_index !246
  %38 = icmp sgt i32 %34, %36, !llfi_index !246
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %37, i1 %38)
  br i1 %37, label %39, label %50, !llfi_index !247

; <label>:39                                      ; preds = %24
  %40 = load i32* %i, align 4, !llfi_index !248
  %41 = load i32* %i, align 4, !llfi_index !248
  %42 = sext i32 %40 to i64, !llfi_index !249
  %43 = sext i32 %41 to i64, !llfi_index !249
  %44 = load i32** %2, align 8, !llfi_index !250
  %45 = load i32** %2, align 8, !llfi_index !250
  %46 = getelementptr inbounds i32* %44, i64 %42, !llfi_index !251
  %47 = getelementptr inbounds i32* %45, i64 %43, !llfi_index !251
  %48 = load i32* %46, align 4, !llfi_index !252
  %49 = load i32* %47, align 4, !llfi_index !252
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %48, i32 %49)
  store i32 %48, i32* %max_r, align 4, !llfi_index !253
  br label %50, !llfi_index !254

; <label>:50                                      ; preds = %39, %24
  %51 = load i32* %i, align 4, !llfi_index !255
  %52 = load i32* %i, align 4, !llfi_index !255
  %53 = sext i32 %51 to i64, !llfi_index !256
  %54 = sext i32 %52 to i64, !llfi_index !256
  %55 = load i32** %2, align 8, !llfi_index !257
  %56 = load i32** %2, align 8, !llfi_index !257
  %57 = getelementptr inbounds i32* %55, i64 %53, !llfi_index !258
  %58 = getelementptr inbounds i32* %56, i64 %54, !llfi_index !258
  %59 = load i32* %57, align 4, !llfi_index !259
  %60 = load i32* %58, align 4, !llfi_index !259
  %61 = load i32* %min_r, align 4, !llfi_index !260
  %62 = load i32* %min_r, align 4, !llfi_index !260
  %63 = icmp slt i32 %59, %61, !llfi_index !261
  %64 = icmp slt i32 %60, %62, !llfi_index !261
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %63, i1 %64)
  br i1 %63, label %65, label %76, !llfi_index !262

; <label>:65                                      ; preds = %50
  %66 = load i32* %i, align 4, !llfi_index !263
  %67 = load i32* %i, align 4, !llfi_index !263
  %68 = sext i32 %66 to i64, !llfi_index !264
  %69 = sext i32 %67 to i64, !llfi_index !264
  %70 = load i32** %2, align 8, !llfi_index !265
  %71 = load i32** %2, align 8, !llfi_index !265
  %72 = getelementptr inbounds i32* %70, i64 %68, !llfi_index !266
  %73 = getelementptr inbounds i32* %71, i64 %69, !llfi_index !266
  %74 = load i32* %72, align 4, !llfi_index !267
  %75 = load i32* %73, align 4, !llfi_index !267
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %74, i32 %75)
  store i32 %74, i32* %min_r, align 4, !llfi_index !268
  br label %76, !llfi_index !269

; <label>:76                                      ; preds = %65, %50
  br label %77, !llfi_index !270

; <label>:77                                      ; preds = %76
  %78 = load i32* %i, align 4, !llfi_index !271
  %79 = load i32* %i, align 4, !llfi_index !271
  %80 = add nsw i32 %78, 1, !llfi_index !272
  %81 = add nsw i32 %79, 1, !llfi_index !272
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %80, i32 %81)
  store i32 %80, i32* %i, align 4, !llfi_index !273
  br label %17, !llfi_index !274

; <label>:82                                      ; preds = %17
  %83 = load i32* %min_r, align 4, !llfi_index !275
  %84 = load i32* %min_r, align 4, !llfi_index !275
  %85 = load i32* %max_r, align 4, !llfi_index !276
  %86 = load i32* %max_r, align 4, !llfi_index !276
  %87 = sub nsw i32 %85, %83, !llfi_index !277
  %88 = sub nsw i32 %86, %84, !llfi_index !277
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %87, i32 %88)
  store i32 %87, i32* %max_r, align 4, !llfi_index !278
  store i32 0, i32* %i, align 4, !llfi_index !279
  br label %89, !llfi_index !280

; <label>:89                                      ; preds = %127, %82
  %90 = load i32* %i, align 4, !llfi_index !281
  %91 = load i32* %i, align 4, !llfi_index !281
  %92 = load i32* %4, align 4, !llfi_index !282
  %93 = load i32* %4, align 4, !llfi_index !282
  %94 = icmp slt i32 %90, %92, !llfi_index !283
  %95 = icmp slt i32 %91, %93, !llfi_index !283
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %94, i1 %95)
  br i1 %94, label %96, label %132, !llfi_index !284

; <label>:96                                      ; preds = %89
  %97 = load i32* %i, align 4, !llfi_index !285
  %98 = load i32* %i, align 4, !llfi_index !285
  %99 = sext i32 %97 to i64, !llfi_index !286
  %100 = sext i32 %98 to i64, !llfi_index !286
  %101 = load i32** %2, align 8, !llfi_index !287
  %102 = load i32** %2, align 8, !llfi_index !287
  %103 = getelementptr inbounds i32* %101, i64 %99, !llfi_index !288
  %104 = getelementptr inbounds i32* %102, i64 %100, !llfi_index !288
  %105 = load i32* %103, align 4, !llfi_index !289
  %106 = load i32* %104, align 4, !llfi_index !289
  %107 = load i32* %min_r, align 4, !llfi_index !290
  %108 = load i32* %min_r, align 4, !llfi_index !290
  %109 = sub nsw i32 %105, %107, !llfi_index !291
  %110 = sub nsw i32 %106, %108, !llfi_index !291
  %111 = mul nsw i32 %109, 255, !llfi_index !292
  %112 = mul nsw i32 %110, 255, !llfi_index !292
  %113 = load i32* %max_r, align 4, !llfi_index !293
  %114 = load i32* %max_r, align 4, !llfi_index !293
  %115 = sdiv i32 %111, %113, !llfi_index !294
  %116 = sdiv i32 %112, %114, !llfi_index !294
  %117 = trunc i32 %115 to i8, !llfi_index !295
  %118 = trunc i32 %116 to i8, !llfi_index !295
  call void bitcast (void (i64, i64)* @global_add to void (i8, i8)*)(i8 %117, i8 %118)
  %119 = load i32* %i, align 4, !llfi_index !296
  %120 = load i32* %i, align 4, !llfi_index !296
  %121 = sext i32 %119 to i64, !llfi_index !297
  %122 = sext i32 %120 to i64, !llfi_index !297
  %123 = load i8** %3, align 8, !llfi_index !298
  %124 = load i8** %3, align 8, !llfi_index !298
  %125 = getelementptr inbounds i8* %123, i64 %121, !llfi_index !299
  %126 = getelementptr inbounds i8* %124, i64 %122, !llfi_index !299
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %125, i8* %126)
  store i8 %117, i8* %125, align 1, !llfi_index !300
  br label %127, !llfi_index !301

; <label>:127                                     ; preds = %96
  %128 = load i32* %i, align 4, !llfi_index !302
  %129 = load i32* %i, align 4, !llfi_index !302
  %130 = add nsw i32 %128, 1, !llfi_index !303
  %131 = add nsw i32 %129, 1, !llfi_index !303
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %130, i32 %131)
  store i32 %130, i32* %i, align 4, !llfi_index !304
  br label %89, !llfi_index !305

; <label>:132                                     ; preds = %89
  %133 = load i32* %1, !llfi_index !306
  %134 = load i32* %1, !llfi_index !306
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %133, i32 %134)
  ret i32 %133, !llfi_index !307
}

; Function Attrs: nounwind uwtable
define void @setup_brightness_lut(i8** %bp, i32 %thresh, i32 %form) #0 {
  %1 = alloca i8**, align 8, !llfi_index !308
  %2 = alloca i32, align 4, !llfi_index !309
  %3 = alloca i32, align 4, !llfi_index !310
  %k = alloca i32, align 4, !llfi_index !311
  %temp = alloca float, align 4, !llfi_index !312
  store i8** %bp, i8*** %1, align 8, !llfi_index !313
  store i32 %thresh, i32* %2, align 4, !llfi_index !314
  store i32 %form, i32* %3, align 4, !llfi_index !315
  %4 = call noalias i8* @malloc(i64 516) #4, !llfi_index !316
  %5 = load i8*** %1, align 8, !llfi_index !317
  %6 = load i8*** %1, align 8, !llfi_index !317
  call void bitcast (void (i64, i64)* @global_add to void (i8**, i8**)*)(i8** %5, i8** %6)
  store i8* %4, i8** %5, align 8, !llfi_index !318
  %7 = load i8*** %1, align 8, !llfi_index !319
  %8 = load i8*** %1, align 8, !llfi_index !319
  %9 = load i8** %7, align 8, !llfi_index !320
  %10 = load i8** %8, align 8, !llfi_index !320
  %11 = getelementptr inbounds i8* %9, i64 258, !llfi_index !321
  %12 = getelementptr inbounds i8* %10, i64 258, !llfi_index !321
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %11, i8* %12)
  %13 = load i8*** %1, align 8, !llfi_index !322
  %14 = load i8*** %1, align 8, !llfi_index !322
  call void bitcast (void (i64, i64)* @global_add to void (i8**, i8**)*)(i8** %13, i8** %14)
  store i8* %11, i8** %13, align 8, !llfi_index !323
  store i32 -256, i32* %k, align 4, !llfi_index !324
  br label %15, !llfi_index !325

; <label>:15                                      ; preds = %78, %0
  %16 = load i32* %k, align 4, !llfi_index !326
  %17 = load i32* %k, align 4, !llfi_index !326
  %18 = icmp slt i32 %16, 257, !llfi_index !327
  %19 = icmp slt i32 %17, 257, !llfi_index !327
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %18, i1 %19)
  br i1 %18, label %20, label %83, !llfi_index !328

; <label>:20                                      ; preds = %15
  %21 = load i32* %k, align 4, !llfi_index !329
  %22 = load i32* %k, align 4, !llfi_index !329
  %23 = sitofp i32 %21 to float, !llfi_index !330
  %24 = sitofp i32 %22 to float, !llfi_index !330
  %25 = load i32* %2, align 4, !llfi_index !331
  %26 = load i32* %2, align 4, !llfi_index !331
  %27 = sitofp i32 %25 to float, !llfi_index !332
  %28 = sitofp i32 %26 to float, !llfi_index !332
  %29 = fdiv float %23, %27, !llfi_index !333
  %30 = fdiv float %24, %28, !llfi_index !333
  call void bitcast (void (i64, i64)* @global_add to void (float, float)*)(float %29, float %30)
  store float %29, float* %temp, align 4, !llfi_index !334
  %31 = load float* %temp, align 4, !llfi_index !335
  %32 = load float* %temp, align 4, !llfi_index !335
  %33 = load float* %temp, align 4, !llfi_index !336
  %34 = load float* %temp, align 4, !llfi_index !336
  %35 = fmul float %31, %33, !llfi_index !337
  %36 = fmul float %32, %34, !llfi_index !337
  call void bitcast (void (i64, i64)* @global_add to void (float, float)*)(float %35, float %36)
  store float %35, float* %temp, align 4, !llfi_index !338
  %37 = load i32* %3, align 4, !llfi_index !339
  %38 = load i32* %3, align 4, !llfi_index !339
  %39 = icmp eq i32 %37, 6, !llfi_index !340
  %40 = icmp eq i32 %38, 6, !llfi_index !340
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %39, i1 %40)
  br i1 %39, label %41, label %52, !llfi_index !341

; <label>:41                                      ; preds = %20
  %42 = load float* %temp, align 4, !llfi_index !342
  %43 = load float* %temp, align 4, !llfi_index !342
  %44 = load float* %temp, align 4, !llfi_index !343
  %45 = load float* %temp, align 4, !llfi_index !343
  %46 = fmul float %42, %44, !llfi_index !344
  %47 = fmul float %43, %45, !llfi_index !344
  %48 = load float* %temp, align 4, !llfi_index !345
  %49 = load float* %temp, align 4, !llfi_index !345
  %50 = fmul float %46, %48, !llfi_index !346
  %51 = fmul float %47, %49, !llfi_index !346
  call void bitcast (void (i64, i64)* @global_add to void (float, float)*)(float %50, float %51)
  store float %50, float* %temp, align 4, !llfi_index !347
  br label %52, !llfi_index !348

; <label>:52                                      ; preds = %41, %20
  %53 = load float* %temp, align 4, !llfi_index !349
  %54 = load float* %temp, align 4, !llfi_index !349
  %55 = fsub float -0.000000e+00, %53, !llfi_index !350
  %56 = fsub float -0.000000e+00, %54, !llfi_index !350
  %57 = fpext float %55 to double, !llfi_index !351
  %58 = fpext float %56 to double, !llfi_index !351
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %57, double %58)
  %59 = call double @exp(double %57) #4, !llfi_index !352
  %60 = fmul double 1.000000e+02, %59, !llfi_index !353
  %61 = fmul double 1.000000e+02, %59, !llfi_index !353
  %62 = fptrunc double %60 to float, !llfi_index !354
  %63 = fptrunc double %61 to float, !llfi_index !354
  call void bitcast (void (i64, i64)* @global_add to void (float, float)*)(float %62, float %63)
  store float %62, float* %temp, align 4, !llfi_index !355
  %64 = load float* %temp, align 4, !llfi_index !356
  %65 = load float* %temp, align 4, !llfi_index !356
  %66 = fptoui float %64 to i8, !llfi_index !357
  %67 = fptoui float %65 to i8, !llfi_index !357
  call void bitcast (void (i64, i64)* @global_add to void (i8, i8)*)(i8 %66, i8 %67)
  %68 = load i8*** %1, align 8, !llfi_index !358
  %69 = load i8*** %1, align 8, !llfi_index !358
  %70 = load i8** %68, align 8, !llfi_index !359
  %71 = load i8** %69, align 8, !llfi_index !359
  %72 = load i32* %k, align 4, !llfi_index !360
  %73 = load i32* %k, align 4, !llfi_index !360
  %74 = sext i32 %72 to i64, !llfi_index !361
  %75 = sext i32 %73 to i64, !llfi_index !361
  %76 = getelementptr inbounds i8* %70, i64 %74, !llfi_index !362
  %77 = getelementptr inbounds i8* %71, i64 %75, !llfi_index !362
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %76, i8* %77)
  store i8 %66, i8* %76, align 1, !llfi_index !363
  br label %78, !llfi_index !364

; <label>:78                                      ; preds = %52
  %79 = load i32* %k, align 4, !llfi_index !365
  %80 = load i32* %k, align 4, !llfi_index !365
  %81 = add nsw i32 %79, 1, !llfi_index !366
  %82 = add nsw i32 %80, 1, !llfi_index !366
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %81, i32 %82)
  store i32 %81, i32* %k, align 4, !llfi_index !367
  br label %15, !llfi_index !368

; <label>:83                                      ; preds = %15
  ret void, !llfi_index !369
}

; Function Attrs: nounwind
declare double @exp(double) #3

; Function Attrs: nounwind uwtable
define zeroext i8 @median(i8* %in, i32 %i, i32 %j, i32 %x_size) #0 {
  %1 = alloca i8*, align 8, !llfi_index !370
  %2 = alloca i32, align 4, !llfi_index !371
  %3 = alloca i32, align 4, !llfi_index !372
  %4 = alloca i32, align 4, !llfi_index !373
  %p = alloca [8 x i32], align 16, !llfi_index !374
  %k = alloca i32, align 4, !llfi_index !375
  %l = alloca i32, align 4, !llfi_index !376
  %tmp = alloca i32, align 4, !llfi_index !377
  store i8* %in, i8** %1, align 8, !llfi_index !378
  store i32 %i, i32* %2, align 4, !llfi_index !379
  store i32 %j, i32* %3, align 4, !llfi_index !380
  store i32 %x_size, i32* %4, align 4, !llfi_index !381
  %5 = load i32* %2, align 4, !llfi_index !382
  %6 = load i32* %2, align 4, !llfi_index !382
  %7 = sub nsw i32 %5, 1, !llfi_index !383
  %8 = sub nsw i32 %6, 1, !llfi_index !383
  %9 = load i32* %4, align 4, !llfi_index !384
  %10 = load i32* %4, align 4, !llfi_index !384
  %11 = mul nsw i32 %7, %9, !llfi_index !385
  %12 = mul nsw i32 %8, %10, !llfi_index !385
  %13 = load i32* %3, align 4, !llfi_index !386
  %14 = load i32* %3, align 4, !llfi_index !386
  %15 = add nsw i32 %11, %13, !llfi_index !387
  %16 = add nsw i32 %12, %14, !llfi_index !387
  %17 = sub nsw i32 %15, 1, !llfi_index !388
  %18 = sub nsw i32 %16, 1, !llfi_index !388
  %19 = sext i32 %17 to i64, !llfi_index !389
  %20 = sext i32 %18 to i64, !llfi_index !389
  %21 = load i8** %1, align 8, !llfi_index !390
  %22 = load i8** %1, align 8, !llfi_index !390
  %23 = getelementptr inbounds i8* %21, i64 %19, !llfi_index !391
  %24 = getelementptr inbounds i8* %22, i64 %20, !llfi_index !391
  %25 = load i8* %23, align 1, !llfi_index !392
  %26 = load i8* %24, align 1, !llfi_index !392
  %27 = zext i8 %25 to i32, !llfi_index !393
  %28 = zext i8 %26 to i32, !llfi_index !393
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %27, i32 %28)
  %29 = getelementptr inbounds [8 x i32]* %p, i32 0, i64 0, !llfi_index !394
  %30 = getelementptr inbounds [8 x i32]* %p, i32 0, i64 0, !llfi_index !394
  call void bitcast (void (i64, i64)* @global_add to void (i32*, i32*)*)(i32* %29, i32* %30)
  store i32 %27, i32* %29, align 4, !llfi_index !395
  %31 = load i32* %2, align 4, !llfi_index !396
  %32 = load i32* %2, align 4, !llfi_index !396
  %33 = sub nsw i32 %31, 1, !llfi_index !397
  %34 = sub nsw i32 %32, 1, !llfi_index !397
  %35 = load i32* %4, align 4, !llfi_index !398
  %36 = load i32* %4, align 4, !llfi_index !398
  %37 = mul nsw i32 %33, %35, !llfi_index !399
  %38 = mul nsw i32 %34, %36, !llfi_index !399
  %39 = load i32* %3, align 4, !llfi_index !400
  %40 = load i32* %3, align 4, !llfi_index !400
  %41 = add nsw i32 %37, %39, !llfi_index !401
  %42 = add nsw i32 %38, %40, !llfi_index !401
  %43 = sext i32 %41 to i64, !llfi_index !402
  %44 = sext i32 %42 to i64, !llfi_index !402
  %45 = load i8** %1, align 8, !llfi_index !403
  %46 = load i8** %1, align 8, !llfi_index !403
  %47 = getelementptr inbounds i8* %45, i64 %43, !llfi_index !404
  %48 = getelementptr inbounds i8* %46, i64 %44, !llfi_index !404
  %49 = load i8* %47, align 1, !llfi_index !405
  %50 = load i8* %48, align 1, !llfi_index !405
  %51 = zext i8 %49 to i32, !llfi_index !406
  %52 = zext i8 %50 to i32, !llfi_index !406
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %51, i32 %52)
  %53 = getelementptr inbounds [8 x i32]* %p, i32 0, i64 1, !llfi_index !407
  %54 = getelementptr inbounds [8 x i32]* %p, i32 0, i64 1, !llfi_index !407
  call void bitcast (void (i64, i64)* @global_add to void (i32*, i32*)*)(i32* %53, i32* %54)
  store i32 %51, i32* %53, align 4, !llfi_index !408
  %55 = load i32* %2, align 4, !llfi_index !409
  %56 = load i32* %2, align 4, !llfi_index !409
  %57 = sub nsw i32 %55, 1, !llfi_index !410
  %58 = sub nsw i32 %56, 1, !llfi_index !410
  %59 = load i32* %4, align 4, !llfi_index !411
  %60 = load i32* %4, align 4, !llfi_index !411
  %61 = mul nsw i32 %57, %59, !llfi_index !412
  %62 = mul nsw i32 %58, %60, !llfi_index !412
  %63 = load i32* %3, align 4, !llfi_index !413
  %64 = load i32* %3, align 4, !llfi_index !413
  %65 = add nsw i32 %61, %63, !llfi_index !414
  %66 = add nsw i32 %62, %64, !llfi_index !414
  %67 = add nsw i32 %65, 1, !llfi_index !415
  %68 = add nsw i32 %66, 1, !llfi_index !415
  %69 = sext i32 %67 to i64, !llfi_index !416
  %70 = sext i32 %68 to i64, !llfi_index !416
  %71 = load i8** %1, align 8, !llfi_index !417
  %72 = load i8** %1, align 8, !llfi_index !417
  %73 = getelementptr inbounds i8* %71, i64 %69, !llfi_index !418
  %74 = getelementptr inbounds i8* %72, i64 %70, !llfi_index !418
  %75 = load i8* %73, align 1, !llfi_index !419
  %76 = load i8* %74, align 1, !llfi_index !419
  %77 = zext i8 %75 to i32, !llfi_index !420
  %78 = zext i8 %76 to i32, !llfi_index !420
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %77, i32 %78)
  %79 = getelementptr inbounds [8 x i32]* %p, i32 0, i64 2, !llfi_index !421
  %80 = getelementptr inbounds [8 x i32]* %p, i32 0, i64 2, !llfi_index !421
  call void bitcast (void (i64, i64)* @global_add to void (i32*, i32*)*)(i32* %79, i32* %80)
  store i32 %77, i32* %79, align 4, !llfi_index !422
  %81 = load i32* %2, align 4, !llfi_index !423
  %82 = load i32* %2, align 4, !llfi_index !423
  %83 = load i32* %4, align 4, !llfi_index !424
  %84 = load i32* %4, align 4, !llfi_index !424
  %85 = mul nsw i32 %81, %83, !llfi_index !425
  %86 = mul nsw i32 %82, %84, !llfi_index !425
  %87 = load i32* %3, align 4, !llfi_index !426
  %88 = load i32* %3, align 4, !llfi_index !426
  %89 = add nsw i32 %85, %87, !llfi_index !427
  %90 = add nsw i32 %86, %88, !llfi_index !427
  %91 = sub nsw i32 %89, 1, !llfi_index !428
  %92 = sub nsw i32 %90, 1, !llfi_index !428
  %93 = sext i32 %91 to i64, !llfi_index !429
  %94 = sext i32 %92 to i64, !llfi_index !429
  %95 = load i8** %1, align 8, !llfi_index !430
  %96 = load i8** %1, align 8, !llfi_index !430
  %97 = getelementptr inbounds i8* %95, i64 %93, !llfi_index !431
  %98 = getelementptr inbounds i8* %96, i64 %94, !llfi_index !431
  %99 = load i8* %97, align 1, !llfi_index !432
  %100 = load i8* %98, align 1, !llfi_index !432
  %101 = zext i8 %99 to i32, !llfi_index !433
  %102 = zext i8 %100 to i32, !llfi_index !433
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %101, i32 %102)
  %103 = getelementptr inbounds [8 x i32]* %p, i32 0, i64 3, !llfi_index !434
  %104 = getelementptr inbounds [8 x i32]* %p, i32 0, i64 3, !llfi_index !434
  call void bitcast (void (i64, i64)* @global_add to void (i32*, i32*)*)(i32* %103, i32* %104)
  store i32 %101, i32* %103, align 4, !llfi_index !435
  %105 = load i32* %2, align 4, !llfi_index !436
  %106 = load i32* %2, align 4, !llfi_index !436
  %107 = load i32* %4, align 4, !llfi_index !437
  %108 = load i32* %4, align 4, !llfi_index !437
  %109 = mul nsw i32 %105, %107, !llfi_index !438
  %110 = mul nsw i32 %106, %108, !llfi_index !438
  %111 = load i32* %3, align 4, !llfi_index !439
  %112 = load i32* %3, align 4, !llfi_index !439
  %113 = add nsw i32 %109, %111, !llfi_index !440
  %114 = add nsw i32 %110, %112, !llfi_index !440
  %115 = add nsw i32 %113, 1, !llfi_index !441
  %116 = add nsw i32 %114, 1, !llfi_index !441
  %117 = sext i32 %115 to i64, !llfi_index !442
  %118 = sext i32 %116 to i64, !llfi_index !442
  %119 = load i8** %1, align 8, !llfi_index !443
  %120 = load i8** %1, align 8, !llfi_index !443
  %121 = getelementptr inbounds i8* %119, i64 %117, !llfi_index !444
  %122 = getelementptr inbounds i8* %120, i64 %118, !llfi_index !444
  %123 = load i8* %121, align 1, !llfi_index !445
  %124 = load i8* %122, align 1, !llfi_index !445
  %125 = zext i8 %123 to i32, !llfi_index !446
  %126 = zext i8 %124 to i32, !llfi_index !446
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %125, i32 %126)
  %127 = getelementptr inbounds [8 x i32]* %p, i32 0, i64 4, !llfi_index !447
  %128 = getelementptr inbounds [8 x i32]* %p, i32 0, i64 4, !llfi_index !447
  call void bitcast (void (i64, i64)* @global_add to void (i32*, i32*)*)(i32* %127, i32* %128)
  store i32 %125, i32* %127, align 4, !llfi_index !448
  %129 = load i32* %2, align 4, !llfi_index !449
  %130 = load i32* %2, align 4, !llfi_index !449
  %131 = add nsw i32 %129, 1, !llfi_index !450
  %132 = add nsw i32 %130, 1, !llfi_index !450
  %133 = load i32* %4, align 4, !llfi_index !451
  %134 = load i32* %4, align 4, !llfi_index !451
  %135 = mul nsw i32 %131, %133, !llfi_index !452
  %136 = mul nsw i32 %132, %134, !llfi_index !452
  %137 = load i32* %3, align 4, !llfi_index !453
  %138 = load i32* %3, align 4, !llfi_index !453
  %139 = add nsw i32 %135, %137, !llfi_index !454
  %140 = add nsw i32 %136, %138, !llfi_index !454
  %141 = sub nsw i32 %139, 1, !llfi_index !455
  %142 = sub nsw i32 %140, 1, !llfi_index !455
  %143 = sext i32 %141 to i64, !llfi_index !456
  %144 = sext i32 %142 to i64, !llfi_index !456
  %145 = load i8** %1, align 8, !llfi_index !457
  %146 = load i8** %1, align 8, !llfi_index !457
  %147 = getelementptr inbounds i8* %145, i64 %143, !llfi_index !458
  %148 = getelementptr inbounds i8* %146, i64 %144, !llfi_index !458
  %149 = load i8* %147, align 1, !llfi_index !459
  %150 = load i8* %148, align 1, !llfi_index !459
  %151 = zext i8 %149 to i32, !llfi_index !460
  %152 = zext i8 %150 to i32, !llfi_index !460
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %151, i32 %152)
  %153 = getelementptr inbounds [8 x i32]* %p, i32 0, i64 5, !llfi_index !461
  %154 = getelementptr inbounds [8 x i32]* %p, i32 0, i64 5, !llfi_index !461
  call void bitcast (void (i64, i64)* @global_add to void (i32*, i32*)*)(i32* %153, i32* %154)
  store i32 %151, i32* %153, align 4, !llfi_index !462
  %155 = load i32* %2, align 4, !llfi_index !463
  %156 = load i32* %2, align 4, !llfi_index !463
  %157 = add nsw i32 %155, 1, !llfi_index !464
  %158 = add nsw i32 %156, 1, !llfi_index !464
  %159 = load i32* %4, align 4, !llfi_index !465
  %160 = load i32* %4, align 4, !llfi_index !465
  %161 = mul nsw i32 %157, %159, !llfi_index !466
  %162 = mul nsw i32 %158, %160, !llfi_index !466
  %163 = load i32* %3, align 4, !llfi_index !467
  %164 = load i32* %3, align 4, !llfi_index !467
  %165 = add nsw i32 %161, %163, !llfi_index !468
  %166 = add nsw i32 %162, %164, !llfi_index !468
  %167 = sext i32 %165 to i64, !llfi_index !469
  %168 = sext i32 %166 to i64, !llfi_index !469
  %169 = load i8** %1, align 8, !llfi_index !470
  %170 = load i8** %1, align 8, !llfi_index !470
  %171 = getelementptr inbounds i8* %169, i64 %167, !llfi_index !471
  %172 = getelementptr inbounds i8* %170, i64 %168, !llfi_index !471
  %173 = load i8* %171, align 1, !llfi_index !472
  %174 = load i8* %172, align 1, !llfi_index !472
  %175 = zext i8 %173 to i32, !llfi_index !473
  %176 = zext i8 %174 to i32, !llfi_index !473
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %175, i32 %176)
  %177 = getelementptr inbounds [8 x i32]* %p, i32 0, i64 6, !llfi_index !474
  %178 = getelementptr inbounds [8 x i32]* %p, i32 0, i64 6, !llfi_index !474
  call void bitcast (void (i64, i64)* @global_add to void (i32*, i32*)*)(i32* %177, i32* %178)
  store i32 %175, i32* %177, align 4, !llfi_index !475
  %179 = load i32* %2, align 4, !llfi_index !476
  %180 = load i32* %2, align 4, !llfi_index !476
  %181 = add nsw i32 %179, 1, !llfi_index !477
  %182 = add nsw i32 %180, 1, !llfi_index !477
  %183 = load i32* %4, align 4, !llfi_index !478
  %184 = load i32* %4, align 4, !llfi_index !478
  %185 = mul nsw i32 %181, %183, !llfi_index !479
  %186 = mul nsw i32 %182, %184, !llfi_index !479
  %187 = load i32* %3, align 4, !llfi_index !480
  %188 = load i32* %3, align 4, !llfi_index !480
  %189 = add nsw i32 %185, %187, !llfi_index !481
  %190 = add nsw i32 %186, %188, !llfi_index !481
  %191 = add nsw i32 %189, 1, !llfi_index !482
  %192 = add nsw i32 %190, 1, !llfi_index !482
  %193 = sext i32 %191 to i64, !llfi_index !483
  %194 = sext i32 %192 to i64, !llfi_index !483
  %195 = load i8** %1, align 8, !llfi_index !484
  %196 = load i8** %1, align 8, !llfi_index !484
  %197 = getelementptr inbounds i8* %195, i64 %193, !llfi_index !485
  %198 = getelementptr inbounds i8* %196, i64 %194, !llfi_index !485
  %199 = load i8* %197, align 1, !llfi_index !486
  %200 = load i8* %198, align 1, !llfi_index !486
  %201 = zext i8 %199 to i32, !llfi_index !487
  %202 = zext i8 %200 to i32, !llfi_index !487
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %201, i32 %202)
  %203 = getelementptr inbounds [8 x i32]* %p, i32 0, i64 7, !llfi_index !488
  %204 = getelementptr inbounds [8 x i32]* %p, i32 0, i64 7, !llfi_index !488
  call void bitcast (void (i64, i64)* @global_add to void (i32*, i32*)*)(i32* %203, i32* %204)
  store i32 %201, i32* %203, align 4, !llfi_index !489
  store i32 0, i32* %k, align 4, !llfi_index !490
  br label %205, !llfi_index !491

; <label>:205                                     ; preds = %283, %0
  %206 = load i32* %k, align 4, !llfi_index !492
  %207 = load i32* %k, align 4, !llfi_index !492
  %208 = icmp slt i32 %206, 7, !llfi_index !493
  %209 = icmp slt i32 %207, 7, !llfi_index !493
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %208, i1 %209)
  br i1 %208, label %210, label %288, !llfi_index !494

; <label>:210                                     ; preds = %205
  store i32 0, i32* %l, align 4, !llfi_index !495
  br label %211, !llfi_index !496

; <label>:211                                     ; preds = %277, %210
  %212 = load i32* %l, align 4, !llfi_index !497
  %213 = load i32* %l, align 4, !llfi_index !497
  %214 = load i32* %k, align 4, !llfi_index !498
  %215 = load i32* %k, align 4, !llfi_index !498
  %216 = sub nsw i32 7, %214, !llfi_index !499
  %217 = sub nsw i32 7, %215, !llfi_index !499
  %218 = icmp slt i32 %212, %216, !llfi_index !500
  %219 = icmp slt i32 %213, %217, !llfi_index !500
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %218, i1 %219)
  br i1 %218, label %220, label %282, !llfi_index !501

; <label>:220                                     ; preds = %211
  %221 = load i32* %l, align 4, !llfi_index !502
  %222 = load i32* %l, align 4, !llfi_index !502
  %223 = sext i32 %221 to i64, !llfi_index !503
  %224 = sext i32 %222 to i64, !llfi_index !503
  %225 = getelementptr inbounds [8 x i32]* %p, i32 0, i64 %223, !llfi_index !504
  %226 = getelementptr inbounds [8 x i32]* %p, i32 0, i64 %224, !llfi_index !504
  %227 = load i32* %225, align 4, !llfi_index !505
  %228 = load i32* %226, align 4, !llfi_index !505
  %229 = load i32* %l, align 4, !llfi_index !506
  %230 = load i32* %l, align 4, !llfi_index !506
  %231 = add nsw i32 %229, 1, !llfi_index !507
  %232 = add nsw i32 %230, 1, !llfi_index !507
  %233 = sext i32 %231 to i64, !llfi_index !508
  %234 = sext i32 %232 to i64, !llfi_index !508
  %235 = getelementptr inbounds [8 x i32]* %p, i32 0, i64 %233, !llfi_index !509
  %236 = getelementptr inbounds [8 x i32]* %p, i32 0, i64 %234, !llfi_index !509
  %237 = load i32* %235, align 4, !llfi_index !510
  %238 = load i32* %236, align 4, !llfi_index !510
  %239 = icmp sgt i32 %227, %237, !llfi_index !511
  %240 = icmp sgt i32 %228, %238, !llfi_index !511
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %239, i1 %240)
  br i1 %239, label %241, label %276, !llfi_index !512

; <label>:241                                     ; preds = %220
  %242 = load i32* %l, align 4, !llfi_index !513
  %243 = load i32* %l, align 4, !llfi_index !513
  %244 = sext i32 %242 to i64, !llfi_index !514
  %245 = sext i32 %243 to i64, !llfi_index !514
  %246 = getelementptr inbounds [8 x i32]* %p, i32 0, i64 %244, !llfi_index !515
  %247 = getelementptr inbounds [8 x i32]* %p, i32 0, i64 %245, !llfi_index !515
  %248 = load i32* %246, align 4, !llfi_index !516
  %249 = load i32* %247, align 4, !llfi_index !516
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %248, i32 %249)
  store i32 %248, i32* %tmp, align 4, !llfi_index !517
  %250 = load i32* %l, align 4, !llfi_index !518
  %251 = load i32* %l, align 4, !llfi_index !518
  %252 = add nsw i32 %250, 1, !llfi_index !519
  %253 = add nsw i32 %251, 1, !llfi_index !519
  %254 = sext i32 %252 to i64, !llfi_index !520
  %255 = sext i32 %253 to i64, !llfi_index !520
  %256 = getelementptr inbounds [8 x i32]* %p, i32 0, i64 %254, !llfi_index !521
  %257 = getelementptr inbounds [8 x i32]* %p, i32 0, i64 %255, !llfi_index !521
  %258 = load i32* %256, align 4, !llfi_index !522
  %259 = load i32* %257, align 4, !llfi_index !522
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %258, i32 %259)
  %260 = load i32* %l, align 4, !llfi_index !523
  %261 = load i32* %l, align 4, !llfi_index !523
  %262 = sext i32 %260 to i64, !llfi_index !524
  %263 = sext i32 %261 to i64, !llfi_index !524
  %264 = getelementptr inbounds [8 x i32]* %p, i32 0, i64 %262, !llfi_index !525
  %265 = getelementptr inbounds [8 x i32]* %p, i32 0, i64 %263, !llfi_index !525
  call void bitcast (void (i64, i64)* @global_add to void (i32*, i32*)*)(i32* %264, i32* %265)
  store i32 %258, i32* %264, align 4, !llfi_index !526
  %266 = load i32* %tmp, align 4, !llfi_index !527
  %267 = load i32* %tmp, align 4, !llfi_index !527
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %266, i32 %267)
  %268 = load i32* %l, align 4, !llfi_index !528
  %269 = load i32* %l, align 4, !llfi_index !528
  %270 = add nsw i32 %268, 1, !llfi_index !529
  %271 = add nsw i32 %269, 1, !llfi_index !529
  %272 = sext i32 %270 to i64, !llfi_index !530
  %273 = sext i32 %271 to i64, !llfi_index !530
  %274 = getelementptr inbounds [8 x i32]* %p, i32 0, i64 %272, !llfi_index !531
  %275 = getelementptr inbounds [8 x i32]* %p, i32 0, i64 %273, !llfi_index !531
  call void bitcast (void (i64, i64)* @global_add to void (i32*, i32*)*)(i32* %274, i32* %275)
  store i32 %266, i32* %274, align 4, !llfi_index !532
  br label %276, !llfi_index !533

; <label>:276                                     ; preds = %241, %220
  br label %277, !llfi_index !534

; <label>:277                                     ; preds = %276
  %278 = load i32* %l, align 4, !llfi_index !535
  %279 = load i32* %l, align 4, !llfi_index !535
  %280 = add nsw i32 %278, 1, !llfi_index !536
  %281 = add nsw i32 %279, 1, !llfi_index !536
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %280, i32 %281)
  store i32 %280, i32* %l, align 4, !llfi_index !537
  br label %211, !llfi_index !538

; <label>:282                                     ; preds = %211
  br label %283, !llfi_index !539

; <label>:283                                     ; preds = %282
  %284 = load i32* %k, align 4, !llfi_index !540
  %285 = load i32* %k, align 4, !llfi_index !540
  %286 = add nsw i32 %284, 1, !llfi_index !541
  %287 = add nsw i32 %285, 1, !llfi_index !541
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %286, i32 %287)
  store i32 %286, i32* %k, align 4, !llfi_index !542
  br label %205, !llfi_index !543

; <label>:288                                     ; preds = %205
  %289 = getelementptr inbounds [8 x i32]* %p, i32 0, i64 3, !llfi_index !544
  %290 = getelementptr inbounds [8 x i32]* %p, i32 0, i64 3, !llfi_index !544
  %291 = load i32* %289, align 4, !llfi_index !545
  %292 = load i32* %290, align 4, !llfi_index !545
  %293 = getelementptr inbounds [8 x i32]* %p, i32 0, i64 4, !llfi_index !546
  %294 = getelementptr inbounds [8 x i32]* %p, i32 0, i64 4, !llfi_index !546
  %295 = load i32* %293, align 4, !llfi_index !547
  %296 = load i32* %294, align 4, !llfi_index !547
  %297 = add nsw i32 %291, %295, !llfi_index !548
  %298 = add nsw i32 %292, %296, !llfi_index !548
  %299 = sdiv i32 %297, 2, !llfi_index !549
  %300 = sdiv i32 %298, 2, !llfi_index !549
  %301 = trunc i32 %299 to i8, !llfi_index !550
  %302 = trunc i32 %300 to i8, !llfi_index !550
  call void bitcast (void (i64, i64)* @global_add to void (i8, i8)*)(i8 %301, i8 %302)
  ret i8 %301, !llfi_index !551
}

; Function Attrs: nounwind uwtable
define i32 @enlarge(i8** %in, i8* %tmp_image, i32* %x_size, i32* %y_size, i32 %border) #0 {
  %1 = alloca i32, align 4, !llfi_index !552
  %2 = alloca i8**, align 8, !llfi_index !553
  %3 = alloca i8*, align 8, !llfi_index !554
  %4 = alloca i32*, align 8, !llfi_index !555
  %5 = alloca i32*, align 8, !llfi_index !556
  %6 = alloca i32, align 4, !llfi_index !557
  %i = alloca i32, align 4, !llfi_index !558
  %j = alloca i32, align 4, !llfi_index !559
  store i8** %in, i8*** %2, align 8, !llfi_index !560
  store i8* %tmp_image, i8** %3, align 8, !llfi_index !561
  store i32* %x_size, i32** %4, align 8, !llfi_index !562
  store i32* %y_size, i32** %5, align 8, !llfi_index !563
  store i32 %border, i32* %6, align 4, !llfi_index !564
  store i32 0, i32* %i, align 4, !llfi_index !565
  br label %7, !llfi_index !566

; <label>:7                                       ; preds = %69, %0
  %8 = load i32* %i, align 4, !llfi_index !567
  %9 = load i32* %i, align 4, !llfi_index !567
  %10 = load i32** %5, align 8, !llfi_index !568
  %11 = load i32** %5, align 8, !llfi_index !568
  %12 = load i32* %10, align 4, !llfi_index !569
  %13 = load i32* %11, align 4, !llfi_index !569
  %14 = icmp slt i32 %8, %12, !llfi_index !570
  %15 = icmp slt i32 %9, %13, !llfi_index !570
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %14, i1 %15)
  br i1 %14, label %16, label %74, !llfi_index !571

; <label>:16                                      ; preds = %7
  %17 = load i8** %3, align 8, !llfi_index !572
  %18 = load i8** %3, align 8, !llfi_index !572
  %19 = load i32* %i, align 4, !llfi_index !573
  %20 = load i32* %i, align 4, !llfi_index !573
  %21 = load i32* %6, align 4, !llfi_index !574
  %22 = load i32* %6, align 4, !llfi_index !574
  %23 = add nsw i32 %19, %21, !llfi_index !575
  %24 = add nsw i32 %20, %22, !llfi_index !575
  %25 = load i32** %4, align 8, !llfi_index !576
  %26 = load i32** %4, align 8, !llfi_index !576
  %27 = load i32* %25, align 4, !llfi_index !577
  %28 = load i32* %26, align 4, !llfi_index !577
  %29 = load i32* %6, align 4, !llfi_index !578
  %30 = load i32* %6, align 4, !llfi_index !578
  %31 = mul nsw i32 2, %29, !llfi_index !579
  %32 = mul nsw i32 2, %30, !llfi_index !579
  %33 = add nsw i32 %27, %31, !llfi_index !580
  %34 = add nsw i32 %28, %32, !llfi_index !580
  %35 = mul nsw i32 %23, %33, !llfi_index !581
  %36 = mul nsw i32 %24, %34, !llfi_index !581
  %37 = sext i32 %35 to i64, !llfi_index !582
  %38 = sext i32 %36 to i64, !llfi_index !582
  %39 = getelementptr inbounds i8* %17, i64 %37, !llfi_index !583
  %40 = getelementptr inbounds i8* %18, i64 %38, !llfi_index !583
  %41 = load i32* %6, align 4, !llfi_index !584
  %42 = load i32* %6, align 4, !llfi_index !584
  %43 = sext i32 %41 to i64, !llfi_index !585
  %44 = sext i32 %42 to i64, !llfi_index !585
  %45 = getelementptr inbounds i8* %39, i64 %43, !llfi_index !586
  %46 = getelementptr inbounds i8* %40, i64 %44, !llfi_index !586
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %45, i8* %46)
  %47 = load i8*** %2, align 8, !llfi_index !587
  %48 = load i8*** %2, align 8, !llfi_index !587
  %49 = load i8** %47, align 8, !llfi_index !588
  %50 = load i8** %48, align 8, !llfi_index !588
  %51 = load i32* %i, align 4, !llfi_index !589
  %52 = load i32* %i, align 4, !llfi_index !589
  %53 = load i32** %4, align 8, !llfi_index !590
  %54 = load i32** %4, align 8, !llfi_index !590
  %55 = load i32* %53, align 4, !llfi_index !591
  %56 = load i32* %54, align 4, !llfi_index !591
  %57 = mul nsw i32 %51, %55, !llfi_index !592
  %58 = mul nsw i32 %52, %56, !llfi_index !592
  %59 = sext i32 %57 to i64, !llfi_index !593
  %60 = sext i32 %58 to i64, !llfi_index !593
  %61 = getelementptr inbounds i8* %49, i64 %59, !llfi_index !594
  %62 = getelementptr inbounds i8* %50, i64 %60, !llfi_index !594
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %61, i8* %62)
  %63 = load i32** %4, align 8, !llfi_index !595
  %64 = load i32** %4, align 8, !llfi_index !595
  %65 = load i32* %63, align 4, !llfi_index !596
  %66 = load i32* %64, align 4, !llfi_index !596
  %67 = sext i32 %65 to i64, !llfi_index !597
  %68 = sext i32 %66 to i64, !llfi_index !597
  call void @global_add(i64 %67, i64 %68)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %45, i8* %61, i64 %67, i32 1, i1 false), !llfi_index !598
  br label %69, !llfi_index !599

; <label>:69                                      ; preds = %16
  %70 = load i32* %i, align 4, !llfi_index !600
  %71 = load i32* %i, align 4, !llfi_index !600
  %72 = add nsw i32 %70, 1, !llfi_index !601
  %73 = add nsw i32 %71, 1, !llfi_index !601
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %72, i32 %73)
  store i32 %72, i32* %i, align 4, !llfi_index !602
  br label %7, !llfi_index !603

; <label>:74                                      ; preds = %7
  store i32 0, i32* %i, align 4, !llfi_index !604
  br label %75, !llfi_index !605

; <label>:75                                      ; preds = %203, %74
  %76 = load i32* %i, align 4, !llfi_index !606
  %77 = load i32* %i, align 4, !llfi_index !606
  %78 = load i32* %6, align 4, !llfi_index !607
  %79 = load i32* %6, align 4, !llfi_index !607
  %80 = icmp slt i32 %76, %78, !llfi_index !608
  %81 = icmp slt i32 %77, %79, !llfi_index !608
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %80, i1 %81)
  br i1 %80, label %82, label %208, !llfi_index !609

; <label>:82                                      ; preds = %75
  %83 = load i8** %3, align 8, !llfi_index !610
  %84 = load i8** %3, align 8, !llfi_index !610
  %85 = load i32* %6, align 4, !llfi_index !611
  %86 = load i32* %6, align 4, !llfi_index !611
  %87 = sub nsw i32 %85, 1, !llfi_index !612
  %88 = sub nsw i32 %86, 1, !llfi_index !612
  %89 = load i32* %i, align 4, !llfi_index !613
  %90 = load i32* %i, align 4, !llfi_index !613
  %91 = sub nsw i32 %87, %89, !llfi_index !614
  %92 = sub nsw i32 %88, %90, !llfi_index !614
  %93 = load i32** %4, align 8, !llfi_index !615
  %94 = load i32** %4, align 8, !llfi_index !615
  %95 = load i32* %93, align 4, !llfi_index !616
  %96 = load i32* %94, align 4, !llfi_index !616
  %97 = load i32* %6, align 4, !llfi_index !617
  %98 = load i32* %6, align 4, !llfi_index !617
  %99 = mul nsw i32 2, %97, !llfi_index !618
  %100 = mul nsw i32 2, %98, !llfi_index !618
  %101 = add nsw i32 %95, %99, !llfi_index !619
  %102 = add nsw i32 %96, %100, !llfi_index !619
  %103 = mul nsw i32 %91, %101, !llfi_index !620
  %104 = mul nsw i32 %92, %102, !llfi_index !620
  %105 = sext i32 %103 to i64, !llfi_index !621
  %106 = sext i32 %104 to i64, !llfi_index !621
  %107 = getelementptr inbounds i8* %83, i64 %105, !llfi_index !622
  %108 = getelementptr inbounds i8* %84, i64 %106, !llfi_index !622
  %109 = load i32* %6, align 4, !llfi_index !623
  %110 = load i32* %6, align 4, !llfi_index !623
  %111 = sext i32 %109 to i64, !llfi_index !624
  %112 = sext i32 %110 to i64, !llfi_index !624
  %113 = getelementptr inbounds i8* %107, i64 %111, !llfi_index !625
  %114 = getelementptr inbounds i8* %108, i64 %112, !llfi_index !625
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %113, i8* %114)
  %115 = load i8*** %2, align 8, !llfi_index !626
  %116 = load i8*** %2, align 8, !llfi_index !626
  %117 = load i8** %115, align 8, !llfi_index !627
  %118 = load i8** %116, align 8, !llfi_index !627
  %119 = load i32* %i, align 4, !llfi_index !628
  %120 = load i32* %i, align 4, !llfi_index !628
  %121 = load i32** %4, align 8, !llfi_index !629
  %122 = load i32** %4, align 8, !llfi_index !629
  %123 = load i32* %121, align 4, !llfi_index !630
  %124 = load i32* %122, align 4, !llfi_index !630
  %125 = mul nsw i32 %119, %123, !llfi_index !631
  %126 = mul nsw i32 %120, %124, !llfi_index !631
  %127 = sext i32 %125 to i64, !llfi_index !632
  %128 = sext i32 %126 to i64, !llfi_index !632
  %129 = getelementptr inbounds i8* %117, i64 %127, !llfi_index !633
  %130 = getelementptr inbounds i8* %118, i64 %128, !llfi_index !633
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %129, i8* %130)
  %131 = load i32** %4, align 8, !llfi_index !634
  %132 = load i32** %4, align 8, !llfi_index !634
  %133 = load i32* %131, align 4, !llfi_index !635
  %134 = load i32* %132, align 4, !llfi_index !635
  %135 = sext i32 %133 to i64, !llfi_index !636
  %136 = sext i32 %134 to i64, !llfi_index !636
  call void @global_add(i64 %135, i64 %136)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %113, i8* %129, i64 %135, i32 1, i1 false), !llfi_index !637
  %137 = load i8** %3, align 8, !llfi_index !638
  %138 = load i8** %3, align 8, !llfi_index !638
  %139 = load i32** %5, align 8, !llfi_index !639
  %140 = load i32** %5, align 8, !llfi_index !639
  %141 = load i32* %139, align 4, !llfi_index !640
  %142 = load i32* %140, align 4, !llfi_index !640
  %143 = load i32* %6, align 4, !llfi_index !641
  %144 = load i32* %6, align 4, !llfi_index !641
  %145 = add nsw i32 %141, %143, !llfi_index !642
  %146 = add nsw i32 %142, %144, !llfi_index !642
  %147 = load i32* %i, align 4, !llfi_index !643
  %148 = load i32* %i, align 4, !llfi_index !643
  %149 = add nsw i32 %145, %147, !llfi_index !644
  %150 = add nsw i32 %146, %148, !llfi_index !644
  %151 = load i32** %4, align 8, !llfi_index !645
  %152 = load i32** %4, align 8, !llfi_index !645
  %153 = load i32* %151, align 4, !llfi_index !646
  %154 = load i32* %152, align 4, !llfi_index !646
  %155 = load i32* %6, align 4, !llfi_index !647
  %156 = load i32* %6, align 4, !llfi_index !647
  %157 = mul nsw i32 2, %155, !llfi_index !648
  %158 = mul nsw i32 2, %156, !llfi_index !648
  %159 = add nsw i32 %153, %157, !llfi_index !649
  %160 = add nsw i32 %154, %158, !llfi_index !649
  %161 = mul nsw i32 %149, %159, !llfi_index !650
  %162 = mul nsw i32 %150, %160, !llfi_index !650
  %163 = sext i32 %161 to i64, !llfi_index !651
  %164 = sext i32 %162 to i64, !llfi_index !651
  %165 = getelementptr inbounds i8* %137, i64 %163, !llfi_index !652
  %166 = getelementptr inbounds i8* %138, i64 %164, !llfi_index !652
  %167 = load i32* %6, align 4, !llfi_index !653
  %168 = load i32* %6, align 4, !llfi_index !653
  %169 = sext i32 %167 to i64, !llfi_index !654
  %170 = sext i32 %168 to i64, !llfi_index !654
  %171 = getelementptr inbounds i8* %165, i64 %169, !llfi_index !655
  %172 = getelementptr inbounds i8* %166, i64 %170, !llfi_index !655
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %171, i8* %172)
  %173 = load i8*** %2, align 8, !llfi_index !656
  %174 = load i8*** %2, align 8, !llfi_index !656
  %175 = load i8** %173, align 8, !llfi_index !657
  %176 = load i8** %174, align 8, !llfi_index !657
  %177 = load i32** %5, align 8, !llfi_index !658
  %178 = load i32** %5, align 8, !llfi_index !658
  %179 = load i32* %177, align 4, !llfi_index !659
  %180 = load i32* %178, align 4, !llfi_index !659
  %181 = load i32* %i, align 4, !llfi_index !660
  %182 = load i32* %i, align 4, !llfi_index !660
  %183 = sub nsw i32 %179, %181, !llfi_index !661
  %184 = sub nsw i32 %180, %182, !llfi_index !661
  %185 = sub nsw i32 %183, 1, !llfi_index !662
  %186 = sub nsw i32 %184, 1, !llfi_index !662
  %187 = load i32** %4, align 8, !llfi_index !663
  %188 = load i32** %4, align 8, !llfi_index !663
  %189 = load i32* %187, align 4, !llfi_index !664
  %190 = load i32* %188, align 4, !llfi_index !664
  %191 = mul nsw i32 %185, %189, !llfi_index !665
  %192 = mul nsw i32 %186, %190, !llfi_index !665
  %193 = sext i32 %191 to i64, !llfi_index !666
  %194 = sext i32 %192 to i64, !llfi_index !666
  %195 = getelementptr inbounds i8* %175, i64 %193, !llfi_index !667
  %196 = getelementptr inbounds i8* %176, i64 %194, !llfi_index !667
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %195, i8* %196)
  %197 = load i32** %4, align 8, !llfi_index !668
  %198 = load i32** %4, align 8, !llfi_index !668
  %199 = load i32* %197, align 4, !llfi_index !669
  %200 = load i32* %198, align 4, !llfi_index !669
  %201 = sext i32 %199 to i64, !llfi_index !670
  %202 = sext i32 %200 to i64, !llfi_index !670
  call void @global_add(i64 %201, i64 %202)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %171, i8* %195, i64 %201, i32 1, i1 false), !llfi_index !671
  br label %203, !llfi_index !672

; <label>:203                                     ; preds = %82
  %204 = load i32* %i, align 4, !llfi_index !673
  %205 = load i32* %i, align 4, !llfi_index !673
  %206 = add nsw i32 %204, 1, !llfi_index !674
  %207 = add nsw i32 %205, 1, !llfi_index !674
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %206, i32 %207)
  store i32 %206, i32* %i, align 4, !llfi_index !675
  br label %75, !llfi_index !676

; <label>:208                                     ; preds = %75
  store i32 0, i32* %i, align 4, !llfi_index !677
  br label %209, !llfi_index !678

; <label>:209                                     ; preds = %371, %208
  %210 = load i32* %i, align 4, !llfi_index !679
  %211 = load i32* %i, align 4, !llfi_index !679
  %212 = load i32* %6, align 4, !llfi_index !680
  %213 = load i32* %6, align 4, !llfi_index !680
  %214 = icmp slt i32 %210, %212, !llfi_index !681
  %215 = icmp slt i32 %211, %213, !llfi_index !681
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %214, i1 %215)
  br i1 %214, label %216, label %376, !llfi_index !682

; <label>:216                                     ; preds = %209
  store i32 0, i32* %j, align 4, !llfi_index !683
  br label %217, !llfi_index !684

; <label>:217                                     ; preds = %365, %216
  %218 = load i32* %j, align 4, !llfi_index !685
  %219 = load i32* %j, align 4, !llfi_index !685
  %220 = load i32** %5, align 8, !llfi_index !686
  %221 = load i32** %5, align 8, !llfi_index !686
  %222 = load i32* %220, align 4, !llfi_index !687
  %223 = load i32* %221, align 4, !llfi_index !687
  %224 = load i32* %6, align 4, !llfi_index !688
  %225 = load i32* %6, align 4, !llfi_index !688
  %226 = mul nsw i32 2, %224, !llfi_index !689
  %227 = mul nsw i32 2, %225, !llfi_index !689
  %228 = add nsw i32 %222, %226, !llfi_index !690
  %229 = add nsw i32 %223, %227, !llfi_index !690
  %230 = icmp slt i32 %218, %228, !llfi_index !691
  %231 = icmp slt i32 %219, %229, !llfi_index !691
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %230, i1 %231)
  br i1 %230, label %232, label %370, !llfi_index !692

; <label>:232                                     ; preds = %217
  %233 = load i32* %j, align 4, !llfi_index !693
  %234 = load i32* %j, align 4, !llfi_index !693
  %235 = load i32** %4, align 8, !llfi_index !694
  %236 = load i32** %4, align 8, !llfi_index !694
  %237 = load i32* %235, align 4, !llfi_index !695
  %238 = load i32* %236, align 4, !llfi_index !695
  %239 = load i32* %6, align 4, !llfi_index !696
  %240 = load i32* %6, align 4, !llfi_index !696
  %241 = mul nsw i32 2, %239, !llfi_index !697
  %242 = mul nsw i32 2, %240, !llfi_index !697
  %243 = add nsw i32 %237, %241, !llfi_index !698
  %244 = add nsw i32 %238, %242, !llfi_index !698
  %245 = mul nsw i32 %233, %243, !llfi_index !699
  %246 = mul nsw i32 %234, %244, !llfi_index !699
  %247 = load i32* %6, align 4, !llfi_index !700
  %248 = load i32* %6, align 4, !llfi_index !700
  %249 = add nsw i32 %245, %247, !llfi_index !701
  %250 = add nsw i32 %246, %248, !llfi_index !701
  %251 = load i32* %i, align 4, !llfi_index !702
  %252 = load i32* %i, align 4, !llfi_index !702
  %253 = add nsw i32 %249, %251, !llfi_index !703
  %254 = add nsw i32 %250, %252, !llfi_index !703
  %255 = sext i32 %253 to i64, !llfi_index !704
  %256 = sext i32 %254 to i64, !llfi_index !704
  %257 = load i8** %3, align 8, !llfi_index !705
  %258 = load i8** %3, align 8, !llfi_index !705
  %259 = getelementptr inbounds i8* %257, i64 %255, !llfi_index !706
  %260 = getelementptr inbounds i8* %258, i64 %256, !llfi_index !706
  %261 = load i8* %259, align 1, !llfi_index !707
  %262 = load i8* %260, align 1, !llfi_index !707
  call void bitcast (void (i64, i64)* @global_add to void (i8, i8)*)(i8 %261, i8 %262)
  %263 = load i32* %j, align 4, !llfi_index !708
  %264 = load i32* %j, align 4, !llfi_index !708
  %265 = load i32** %4, align 8, !llfi_index !709
  %266 = load i32** %4, align 8, !llfi_index !709
  %267 = load i32* %265, align 4, !llfi_index !710
  %268 = load i32* %266, align 4, !llfi_index !710
  %269 = load i32* %6, align 4, !llfi_index !711
  %270 = load i32* %6, align 4, !llfi_index !711
  %271 = mul nsw i32 2, %269, !llfi_index !712
  %272 = mul nsw i32 2, %270, !llfi_index !712
  %273 = add nsw i32 %267, %271, !llfi_index !713
  %274 = add nsw i32 %268, %272, !llfi_index !713
  %275 = mul nsw i32 %263, %273, !llfi_index !714
  %276 = mul nsw i32 %264, %274, !llfi_index !714
  %277 = load i32* %6, align 4, !llfi_index !715
  %278 = load i32* %6, align 4, !llfi_index !715
  %279 = add nsw i32 %275, %277, !llfi_index !716
  %280 = add nsw i32 %276, %278, !llfi_index !716
  %281 = sub nsw i32 %279, 1, !llfi_index !717
  %282 = sub nsw i32 %280, 1, !llfi_index !717
  %283 = load i32* %i, align 4, !llfi_index !718
  %284 = load i32* %i, align 4, !llfi_index !718
  %285 = sub nsw i32 %281, %283, !llfi_index !719
  %286 = sub nsw i32 %282, %284, !llfi_index !719
  %287 = sext i32 %285 to i64, !llfi_index !720
  %288 = sext i32 %286 to i64, !llfi_index !720
  %289 = load i8** %3, align 8, !llfi_index !721
  %290 = load i8** %3, align 8, !llfi_index !721
  %291 = getelementptr inbounds i8* %289, i64 %287, !llfi_index !722
  %292 = getelementptr inbounds i8* %290, i64 %288, !llfi_index !722
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %291, i8* %292)
  store i8 %261, i8* %291, align 1, !llfi_index !723
  %293 = load i32* %j, align 4, !llfi_index !724
  %294 = load i32* %j, align 4, !llfi_index !724
  %295 = load i32** %4, align 8, !llfi_index !725
  %296 = load i32** %4, align 8, !llfi_index !725
  %297 = load i32* %295, align 4, !llfi_index !726
  %298 = load i32* %296, align 4, !llfi_index !726
  %299 = load i32* %6, align 4, !llfi_index !727
  %300 = load i32* %6, align 4, !llfi_index !727
  %301 = mul nsw i32 2, %299, !llfi_index !728
  %302 = mul nsw i32 2, %300, !llfi_index !728
  %303 = add nsw i32 %297, %301, !llfi_index !729
  %304 = add nsw i32 %298, %302, !llfi_index !729
  %305 = mul nsw i32 %293, %303, !llfi_index !730
  %306 = mul nsw i32 %294, %304, !llfi_index !730
  %307 = load i32** %4, align 8, !llfi_index !731
  %308 = load i32** %4, align 8, !llfi_index !731
  %309 = load i32* %307, align 4, !llfi_index !732
  %310 = load i32* %308, align 4, !llfi_index !732
  %311 = add nsw i32 %305, %309, !llfi_index !733
  %312 = add nsw i32 %306, %310, !llfi_index !733
  %313 = load i32* %6, align 4, !llfi_index !734
  %314 = load i32* %6, align 4, !llfi_index !734
  %315 = add nsw i32 %311, %313, !llfi_index !735
  %316 = add nsw i32 %312, %314, !llfi_index !735
  %317 = sub nsw i32 %315, 1, !llfi_index !736
  %318 = sub nsw i32 %316, 1, !llfi_index !736
  %319 = load i32* %i, align 4, !llfi_index !737
  %320 = load i32* %i, align 4, !llfi_index !737
  %321 = sub nsw i32 %317, %319, !llfi_index !738
  %322 = sub nsw i32 %318, %320, !llfi_index !738
  %323 = sext i32 %321 to i64, !llfi_index !739
  %324 = sext i32 %322 to i64, !llfi_index !739
  %325 = load i8** %3, align 8, !llfi_index !740
  %326 = load i8** %3, align 8, !llfi_index !740
  %327 = getelementptr inbounds i8* %325, i64 %323, !llfi_index !741
  %328 = getelementptr inbounds i8* %326, i64 %324, !llfi_index !741
  %329 = load i8* %327, align 1, !llfi_index !742
  %330 = load i8* %328, align 1, !llfi_index !742
  call void bitcast (void (i64, i64)* @global_add to void (i8, i8)*)(i8 %329, i8 %330)
  %331 = load i32* %j, align 4, !llfi_index !743
  %332 = load i32* %j, align 4, !llfi_index !743
  %333 = load i32** %4, align 8, !llfi_index !744
  %334 = load i32** %4, align 8, !llfi_index !744
  %335 = load i32* %333, align 4, !llfi_index !745
  %336 = load i32* %334, align 4, !llfi_index !745
  %337 = load i32* %6, align 4, !llfi_index !746
  %338 = load i32* %6, align 4, !llfi_index !746
  %339 = mul nsw i32 2, %337, !llfi_index !747
  %340 = mul nsw i32 2, %338, !llfi_index !747
  %341 = add nsw i32 %335, %339, !llfi_index !748
  %342 = add nsw i32 %336, %340, !llfi_index !748
  %343 = mul nsw i32 %331, %341, !llfi_index !749
  %344 = mul nsw i32 %332, %342, !llfi_index !749
  %345 = load i32** %4, align 8, !llfi_index !750
  %346 = load i32** %4, align 8, !llfi_index !750
  %347 = load i32* %345, align 4, !llfi_index !751
  %348 = load i32* %346, align 4, !llfi_index !751
  %349 = add nsw i32 %343, %347, !llfi_index !752
  %350 = add nsw i32 %344, %348, !llfi_index !752
  %351 = load i32* %6, align 4, !llfi_index !753
  %352 = load i32* %6, align 4, !llfi_index !753
  %353 = add nsw i32 %349, %351, !llfi_index !754
  %354 = add nsw i32 %350, %352, !llfi_index !754
  %355 = load i32* %i, align 4, !llfi_index !755
  %356 = load i32* %i, align 4, !llfi_index !755
  %357 = add nsw i32 %353, %355, !llfi_index !756
  %358 = add nsw i32 %354, %356, !llfi_index !756
  %359 = sext i32 %357 to i64, !llfi_index !757
  %360 = sext i32 %358 to i64, !llfi_index !757
  %361 = load i8** %3, align 8, !llfi_index !758
  %362 = load i8** %3, align 8, !llfi_index !758
  %363 = getelementptr inbounds i8* %361, i64 %359, !llfi_index !759
  %364 = getelementptr inbounds i8* %362, i64 %360, !llfi_index !759
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %363, i8* %364)
  store i8 %329, i8* %363, align 1, !llfi_index !760
  br label %365, !llfi_index !761

; <label>:365                                     ; preds = %232
  %366 = load i32* %j, align 4, !llfi_index !762
  %367 = load i32* %j, align 4, !llfi_index !762
  %368 = add nsw i32 %366, 1, !llfi_index !763
  %369 = add nsw i32 %367, 1, !llfi_index !763
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %368, i32 %369)
  store i32 %368, i32* %j, align 4, !llfi_index !764
  br label %217, !llfi_index !765

; <label>:370                                     ; preds = %217
  br label %371, !llfi_index !766

; <label>:371                                     ; preds = %370
  %372 = load i32* %i, align 4, !llfi_index !767
  %373 = load i32* %i, align 4, !llfi_index !767
  %374 = add nsw i32 %372, 1, !llfi_index !768
  %375 = add nsw i32 %373, 1, !llfi_index !768
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %374, i32 %375)
  store i32 %374, i32* %i, align 4, !llfi_index !769
  br label %209, !llfi_index !770

; <label>:376                                     ; preds = %209
  %377 = load i32* %6, align 4, !llfi_index !771
  %378 = load i32* %6, align 4, !llfi_index !771
  %379 = mul nsw i32 2, %377, !llfi_index !772
  %380 = mul nsw i32 2, %378, !llfi_index !772
  %381 = load i32** %4, align 8, !llfi_index !773
  %382 = load i32** %4, align 8, !llfi_index !773
  %383 = load i32* %381, align 4, !llfi_index !774
  %384 = load i32* %382, align 4, !llfi_index !774
  %385 = add nsw i32 %383, %379, !llfi_index !775
  %386 = add nsw i32 %384, %380, !llfi_index !775
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %385, i32 %386)
  store i32 %385, i32* %381, align 4, !llfi_index !776
  %387 = load i32* %6, align 4, !llfi_index !777
  %388 = load i32* %6, align 4, !llfi_index !777
  %389 = mul nsw i32 2, %387, !llfi_index !778
  %390 = mul nsw i32 2, %388, !llfi_index !778
  %391 = load i32** %5, align 8, !llfi_index !779
  %392 = load i32** %5, align 8, !llfi_index !779
  %393 = load i32* %391, align 4, !llfi_index !780
  %394 = load i32* %392, align 4, !llfi_index !780
  %395 = add nsw i32 %393, %389, !llfi_index !781
  %396 = add nsw i32 %394, %390, !llfi_index !781
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %395, i32 %396)
  store i32 %395, i32* %391, align 4, !llfi_index !782
  %397 = load i8** %3, align 8, !llfi_index !783
  %398 = load i8** %3, align 8, !llfi_index !783
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %397, i8* %398)
  %399 = load i8*** %2, align 8, !llfi_index !784
  %400 = load i8*** %2, align 8, !llfi_index !784
  call void bitcast (void (i64, i64)* @global_add to void (i8**, i8**)*)(i8** %399, i8** %400)
  store i8* %397, i8** %399, align 8, !llfi_index !785
  %401 = load i32* %1, !llfi_index !786
  %402 = load i32* %1, !llfi_index !786
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %401, i32 %402)
  ret i32 %401, !llfi_index !787
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #4

; Function Attrs: nounwind uwtable
define void @susan_smoothing(i32 %three_by_three, i8* %in, double, i32 %x_size, i32 %y_size, i8* %bp) #0 {
  %2 = alloca i32, align 4, !llfi_index !788
  %3 = alloca i8*, align 8, !llfi_index !789
  %4 = alloca float, align 4, !llfi_index !790
  %5 = alloca i32, align 4, !llfi_index !791
  %6 = alloca i32, align 4, !llfi_index !792
  %7 = alloca i8*, align 8, !llfi_index !793
  %temp = alloca float, align 4, !llfi_index !794
  %n_max = alloca i32, align 4, !llfi_index !795
  %increment = alloca i32, align 4, !llfi_index !796
  %mask_size = alloca i32, align 4, !llfi_index !797
  %i = alloca i32, align 4, !llfi_index !798
  %j = alloca i32, align 4, !llfi_index !799
  %x = alloca i32, align 4, !llfi_index !800
  %y = alloca i32, align 4, !llfi_index !801
  %area = alloca i32, align 4, !llfi_index !802
  %brightness = alloca i32, align 4, !llfi_index !803
  %tmp = alloca i32, align 4, !llfi_index !804
  %centre = alloca i32, align 4, !llfi_index !805
  %ip = alloca i8*, align 8, !llfi_index !806
  %dp = alloca i8*, align 8, !llfi_index !807
  %dpt = alloca i8*, align 8, !llfi_index !808
  %cp = alloca i8*, align 8, !llfi_index !809
  %out = alloca i8*, align 8, !llfi_index !810
  %tmp_image = alloca i8*, align 8, !llfi_index !811
  %total = alloca i32, align 4, !llfi_index !812
  store i32 %three_by_three, i32* %2, align 4, !llfi_index !813
  store i8* %in, i8** %3, align 8, !llfi_index !814
  %dt = fptrunc double %0 to float, !llfi_index !815
  %8 = fptrunc double %0 to float, !llfi_index !815
  call void bitcast (void (i64, i64)* @global_add to void (float, float)*)(float %dt, float %8)
  store float %dt, float* %4, align 4, !llfi_index !816
  store i32 %x_size, i32* %5, align 4, !llfi_index !817
  store i32 %y_size, i32* %6, align 4, !llfi_index !818
  store i8* %bp, i8** %7, align 8, !llfi_index !819
  %9 = load i8** %3, align 8, !llfi_index !820
  %10 = load i8** %3, align 8, !llfi_index !820
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %9, i8* %10)
  store i8* %9, i8** %out, align 8, !llfi_index !821
  %11 = load i32* %2, align 4, !llfi_index !822
  %12 = load i32* %2, align 4, !llfi_index !822
  %13 = icmp eq i32 %11, 0, !llfi_index !823
  %14 = icmp eq i32 %12, 0, !llfi_index !823
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %13, i1 %14)
  br i1 %13, label %15, label %26, !llfi_index !824

; <label>:15                                      ; preds = %1
  %16 = load float* %4, align 4, !llfi_index !825
  %17 = load float* %4, align 4, !llfi_index !825
  %18 = fpext float %16 to double, !llfi_index !826
  %19 = fpext float %17 to double, !llfi_index !826
  %20 = fmul double 1.500000e+00, %18, !llfi_index !827
  %21 = fmul double 1.500000e+00, %19, !llfi_index !827
  %22 = fptosi double %20 to i32, !llfi_index !828
  %23 = fptosi double %21 to i32, !llfi_index !828
  %24 = add nsw i32 %22, 1, !llfi_index !829
  %25 = add nsw i32 %23, 1, !llfi_index !829
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %24, i32 %25)
  store i32 %24, i32* %mask_size, align 4, !llfi_index !830
  br label %27, !llfi_index !831

; <label>:26                                      ; preds = %1
  store i32 1, i32* %mask_size, align 4, !llfi_index !832
  br label %27, !llfi_index !833

; <label>:27                                      ; preds = %26, %15
  store i32 0, i32* %total, align 4, !llfi_index !834
  %28 = load float* %4, align 4, !llfi_index !835
  %29 = load float* %4, align 4, !llfi_index !835
  %30 = fcmp ogt float %28, 1.500000e+01, !llfi_index !836
  %31 = fcmp ogt float %29, 1.500000e+01, !llfi_index !836
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %30, i1 %31)
  br i1 %30, label %32, label %45, !llfi_index !837

; <label>:32                                      ; preds = %27
  %33 = load i32* %total, align 4, !llfi_index !838
  %34 = load i32* %total, align 4, !llfi_index !838
  %35 = icmp eq i32 %33, 0, !llfi_index !839
  %36 = icmp eq i32 %34, 0, !llfi_index !839
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %35, i1 %36)
  br i1 %35, label %37, label %45, !llfi_index !840

; <label>:37                                      ; preds = %32
  %38 = load float* %4, align 4, !llfi_index !841
  %39 = load float* %4, align 4, !llfi_index !841
  %40 = fpext float %38 to double, !llfi_index !842
  %41 = fpext float %39 to double, !llfi_index !842
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %40, double %41)
  %42 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([54 x i8]* @.str25, i32 0, i32 0), double %40), !llfi_index !843
  %43 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([61 x i8]* @.str26, i32 0, i32 0)), !llfi_index !844
  %44 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([40 x i8]* @.str27, i32 0, i32 0)), !llfi_index !845
  call void @global_check()
  call void @exit(i32 0) #6, !llfi_index !846
  unreachable, !llfi_index !847

; <label>:45                                      ; preds = %32, %27
  %46 = load i32* %mask_size, align 4, !llfi_index !848
  %47 = load i32* %mask_size, align 4, !llfi_index !848
  %48 = mul nsw i32 2, %46, !llfi_index !849
  %49 = mul nsw i32 2, %47, !llfi_index !849
  %50 = add nsw i32 %48, 1, !llfi_index !850
  %51 = add nsw i32 %49, 1, !llfi_index !850
  %52 = load i32* %5, align 4, !llfi_index !851
  %53 = load i32* %5, align 4, !llfi_index !851
  %54 = icmp sgt i32 %50, %52, !llfi_index !852
  %55 = icmp sgt i32 %51, %53, !llfi_index !852
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %54, i1 %55)
  br i1 %54, label %67, label %56, !llfi_index !853

; <label>:56                                      ; preds = %45
  %57 = load i32* %mask_size, align 4, !llfi_index !854
  %58 = load i32* %mask_size, align 4, !llfi_index !854
  %59 = mul nsw i32 2, %57, !llfi_index !855
  %60 = mul nsw i32 2, %58, !llfi_index !855
  %61 = add nsw i32 %59, 1, !llfi_index !856
  %62 = add nsw i32 %60, 1, !llfi_index !856
  %63 = load i32* %6, align 4, !llfi_index !857
  %64 = load i32* %6, align 4, !llfi_index !857
  %65 = icmp sgt i32 %61, %63, !llfi_index !858
  %66 = icmp sgt i32 %62, %64, !llfi_index !858
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %65, i1 %66)
  br i1 %65, label %67, label %75, !llfi_index !859

; <label>:67                                      ; preds = %56, %45
  %68 = load i32* %mask_size, align 4, !llfi_index !860
  %69 = load i32* %mask_size, align 4, !llfi_index !860
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %68, i32 %69)
  %70 = load i32* %5, align 4, !llfi_index !861
  %71 = load i32* %5, align 4, !llfi_index !861
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %70, i32 %71)
  %72 = load i32* %6, align 4, !llfi_index !862
  %73 = load i32* %6, align 4, !llfi_index !862
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %72, i32 %73)
  %74 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([65 x i8]* @.str28, i32 0, i32 0), i32 %68, i32 %70, i32 %72), !llfi_index !863
  call void @global_check()
  call void @exit(i32 0) #6, !llfi_index !864
  unreachable, !llfi_index !865

; <label>:75                                      ; preds = %56
  %76 = load i32* %5, align 4, !llfi_index !866
  %77 = load i32* %5, align 4, !llfi_index !866
  %78 = load i32* %mask_size, align 4, !llfi_index !867
  %79 = load i32* %mask_size, align 4, !llfi_index !867
  %80 = mul nsw i32 %78, 2, !llfi_index !868
  %81 = mul nsw i32 %79, 2, !llfi_index !868
  %82 = add nsw i32 %76, %80, !llfi_index !869
  %83 = add nsw i32 %77, %81, !llfi_index !869
  %84 = load i32* %6, align 4, !llfi_index !870
  %85 = load i32* %6, align 4, !llfi_index !870
  %86 = load i32* %mask_size, align 4, !llfi_index !871
  %87 = load i32* %mask_size, align 4, !llfi_index !871
  %88 = mul nsw i32 %86, 2, !llfi_index !872
  %89 = mul nsw i32 %87, 2, !llfi_index !872
  %90 = add nsw i32 %84, %88, !llfi_index !873
  %91 = add nsw i32 %85, %89, !llfi_index !873
  %92 = mul nsw i32 %82, %90, !llfi_index !874
  %93 = mul nsw i32 %83, %91, !llfi_index !874
  %94 = sext i32 %92 to i64, !llfi_index !875
  %95 = sext i32 %93 to i64, !llfi_index !875
  call void @global_add(i64 %94, i64 %95)
  %96 = call noalias i8* @malloc(i64 %94) #4, !llfi_index !876
  store i8* %96, i8** %tmp_image, align 8, !llfi_index !877
  %97 = load i8** %tmp_image, align 8, !llfi_index !878
  %98 = load i8** %tmp_image, align 8, !llfi_index !878
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %97, i8* %98)
  %99 = load i32* %mask_size, align 4, !llfi_index !879
  %100 = load i32* %mask_size, align 4, !llfi_index !879
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %99, i32 %100)
  %101 = call i32 @enlarge(i8** %3, i8* %97, i32* %5, i32* %6, i32 %99), !llfi_index !880
  %102 = load i32* %2, align 4, !llfi_index !881
  %103 = load i32* %2, align 4, !llfi_index !881
  %104 = icmp eq i32 %102, 0, !llfi_index !882
  %105 = icmp eq i32 %103, 0, !llfi_index !882
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %104, i1 %105)
  br i1 %104, label %106, label %443, !llfi_index !883

; <label>:106                                     ; preds = %75
  %107 = load i32* %mask_size, align 4, !llfi_index !884
  %108 = load i32* %mask_size, align 4, !llfi_index !884
  %109 = mul nsw i32 %107, 2, !llfi_index !885
  %110 = mul nsw i32 %108, 2, !llfi_index !885
  %111 = add nsw i32 %109, 1, !llfi_index !886
  %112 = add nsw i32 %110, 1, !llfi_index !886
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %111, i32 %112)
  store i32 %111, i32* %n_max, align 4, !llfi_index !887
  %113 = load i32* %5, align 4, !llfi_index !888
  %114 = load i32* %5, align 4, !llfi_index !888
  %115 = load i32* %n_max, align 4, !llfi_index !889
  %116 = load i32* %n_max, align 4, !llfi_index !889
  %117 = sub nsw i32 %113, %115, !llfi_index !890
  %118 = sub nsw i32 %114, %116, !llfi_index !890
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %117, i32 %118)
  store i32 %117, i32* %increment, align 4, !llfi_index !891
  %119 = load i32* %n_max, align 4, !llfi_index !892
  %120 = load i32* %n_max, align 4, !llfi_index !892
  %121 = load i32* %n_max, align 4, !llfi_index !893
  %122 = load i32* %n_max, align 4, !llfi_index !893
  %123 = mul nsw i32 %119, %121, !llfi_index !894
  %124 = mul nsw i32 %120, %122, !llfi_index !894
  %125 = sext i32 %123 to i64, !llfi_index !895
  %126 = sext i32 %124 to i64, !llfi_index !895
  call void @global_add(i64 %125, i64 %126)
  %127 = call noalias i8* @malloc(i64 %125) #4, !llfi_index !896
  store i8* %127, i8** %dp, align 8, !llfi_index !897
  %128 = load i8** %dp, align 8, !llfi_index !898
  %129 = load i8** %dp, align 8, !llfi_index !898
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %128, i8* %129)
  store i8* %128, i8** %dpt, align 8, !llfi_index !899
  %130 = load float* %4, align 4, !llfi_index !900
  %131 = load float* %4, align 4, !llfi_index !900
  %132 = load float* %4, align 4, !llfi_index !901
  %133 = load float* %4, align 4, !llfi_index !901
  %134 = fmul float %130, %132, !llfi_index !902
  %135 = fmul float %131, %133, !llfi_index !902
  %136 = fsub float -0.000000e+00, %134, !llfi_index !903
  %137 = fsub float -0.000000e+00, %135, !llfi_index !903
  call void bitcast (void (i64, i64)* @global_add to void (float, float)*)(float %136, float %137)
  store float %136, float* %temp, align 4, !llfi_index !904
  %138 = load i32* %mask_size, align 4, !llfi_index !905
  %139 = load i32* %mask_size, align 4, !llfi_index !905
  %140 = sub nsw i32 0, %138, !llfi_index !906
  %141 = sub nsw i32 0, %139, !llfi_index !906
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %140, i32 %141)
  store i32 %140, i32* %i, align 4, !llfi_index !907
  br label %142, !llfi_index !908

; <label>:142                                     ; preds = %203, %106
  %143 = load i32* %i, align 4, !llfi_index !909
  %144 = load i32* %i, align 4, !llfi_index !909
  %145 = load i32* %mask_size, align 4, !llfi_index !910
  %146 = load i32* %mask_size, align 4, !llfi_index !910
  %147 = icmp sle i32 %143, %145, !llfi_index !911
  %148 = icmp sle i32 %144, %146, !llfi_index !911
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %147, i1 %148)
  br i1 %147, label %149, label %208, !llfi_index !912

; <label>:149                                     ; preds = %142
  %150 = load i32* %mask_size, align 4, !llfi_index !913
  %151 = load i32* %mask_size, align 4, !llfi_index !913
  %152 = sub nsw i32 0, %150, !llfi_index !914
  %153 = sub nsw i32 0, %151, !llfi_index !914
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %152, i32 %153)
  store i32 %152, i32* %j, align 4, !llfi_index !915
  br label %154, !llfi_index !916

; <label>:154                                     ; preds = %197, %149
  %155 = load i32* %j, align 4, !llfi_index !917
  %156 = load i32* %j, align 4, !llfi_index !917
  %157 = load i32* %mask_size, align 4, !llfi_index !918
  %158 = load i32* %mask_size, align 4, !llfi_index !918
  %159 = icmp sle i32 %155, %157, !llfi_index !919
  %160 = icmp sle i32 %156, %158, !llfi_index !919
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %159, i1 %160)
  br i1 %159, label %161, label %202, !llfi_index !920

; <label>:161                                     ; preds = %154
  %162 = load i32* %i, align 4, !llfi_index !921
  %163 = load i32* %i, align 4, !llfi_index !921
  %164 = load i32* %i, align 4, !llfi_index !922
  %165 = load i32* %i, align 4, !llfi_index !922
  %166 = mul nsw i32 %162, %164, !llfi_index !923
  %167 = mul nsw i32 %163, %165, !llfi_index !923
  %168 = load i32* %j, align 4, !llfi_index !924
  %169 = load i32* %j, align 4, !llfi_index !924
  %170 = load i32* %j, align 4, !llfi_index !925
  %171 = load i32* %j, align 4, !llfi_index !925
  %172 = mul nsw i32 %168, %170, !llfi_index !926
  %173 = mul nsw i32 %169, %171, !llfi_index !926
  %174 = add nsw i32 %166, %172, !llfi_index !927
  %175 = add nsw i32 %167, %173, !llfi_index !927
  %176 = sitofp i32 %174 to float, !llfi_index !928
  %177 = sitofp i32 %175 to float, !llfi_index !928
  %178 = load float* %temp, align 4, !llfi_index !929
  %179 = load float* %temp, align 4, !llfi_index !929
  %180 = fdiv float %176, %178, !llfi_index !930
  %181 = fdiv float %177, %179, !llfi_index !930
  %182 = fpext float %180 to double, !llfi_index !931
  %183 = fpext float %181 to double, !llfi_index !931
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %182, double %183)
  %184 = call double @exp(double %182) #4, !llfi_index !932
  %185 = fmul double 1.000000e+02, %184, !llfi_index !933
  %186 = fmul double 1.000000e+02, %184, !llfi_index !933
  %187 = fptosi double %185 to i32, !llfi_index !934
  %188 = fptosi double %186 to i32, !llfi_index !934
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %187, i32 %188)
  store i32 %187, i32* %x, align 4, !llfi_index !935
  %189 = load i32* %x, align 4, !llfi_index !936
  %190 = load i32* %x, align 4, !llfi_index !936
  %191 = trunc i32 %189 to i8, !llfi_index !937
  %192 = trunc i32 %190 to i8, !llfi_index !937
  call void bitcast (void (i64, i64)* @global_add to void (i8, i8)*)(i8 %191, i8 %192)
  %193 = load i8** %dpt, align 8, !llfi_index !938
  %194 = load i8** %dpt, align 8, !llfi_index !938
  %195 = getelementptr inbounds i8* %193, i32 1, !llfi_index !939
  %196 = getelementptr inbounds i8* %194, i32 1, !llfi_index !939
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %195, i8* %196)
  store i8* %195, i8** %dpt, align 8, !llfi_index !940
  store i8 %191, i8* %193, align 1, !llfi_index !941
  br label %197, !llfi_index !942

; <label>:197                                     ; preds = %161
  %198 = load i32* %j, align 4, !llfi_index !943
  %199 = load i32* %j, align 4, !llfi_index !943
  %200 = add nsw i32 %198, 1, !llfi_index !944
  %201 = add nsw i32 %199, 1, !llfi_index !944
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %200, i32 %201)
  store i32 %200, i32* %j, align 4, !llfi_index !945
  br label %154, !llfi_index !946

; <label>:202                                     ; preds = %154
  br label %203, !llfi_index !947

; <label>:203                                     ; preds = %202
  %204 = load i32* %i, align 4, !llfi_index !948
  %205 = load i32* %i, align 4, !llfi_index !948
  %206 = add nsw i32 %204, 1, !llfi_index !949
  %207 = add nsw i32 %205, 1, !llfi_index !949
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %206, i32 %207)
  store i32 %206, i32* %i, align 4, !llfi_index !950
  br label %142, !llfi_index !951

; <label>:208                                     ; preds = %142
  %209 = load i32* %mask_size, align 4, !llfi_index !952
  %210 = load i32* %mask_size, align 4, !llfi_index !952
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %209, i32 %210)
  store i32 %209, i32* %i, align 4, !llfi_index !953
  br label %211, !llfi_index !954

; <label>:211                                     ; preds = %437, %208
  %212 = load i32* %i, align 4, !llfi_index !955
  %213 = load i32* %i, align 4, !llfi_index !955
  %214 = load i32* %6, align 4, !llfi_index !956
  %215 = load i32* %6, align 4, !llfi_index !956
  %216 = load i32* %mask_size, align 4, !llfi_index !957
  %217 = load i32* %mask_size, align 4, !llfi_index !957
  %218 = sub nsw i32 %214, %216, !llfi_index !958
  %219 = sub nsw i32 %215, %217, !llfi_index !958
  %220 = icmp slt i32 %212, %218, !llfi_index !959
  %221 = icmp slt i32 %213, %219, !llfi_index !959
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %220, i1 %221)
  br i1 %220, label %222, label %442, !llfi_index !960

; <label>:222                                     ; preds = %211
  %223 = load i32* %mask_size, align 4, !llfi_index !961
  %224 = load i32* %mask_size, align 4, !llfi_index !961
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %223, i32 %224)
  store i32 %223, i32* %j, align 4, !llfi_index !962
  br label %225, !llfi_index !963

; <label>:225                                     ; preds = %431, %222
  %226 = load i32* %j, align 4, !llfi_index !964
  %227 = load i32* %j, align 4, !llfi_index !964
  %228 = load i32* %5, align 4, !llfi_index !965
  %229 = load i32* %5, align 4, !llfi_index !965
  %230 = load i32* %mask_size, align 4, !llfi_index !966
  %231 = load i32* %mask_size, align 4, !llfi_index !966
  %232 = sub nsw i32 %228, %230, !llfi_index !967
  %233 = sub nsw i32 %229, %231, !llfi_index !967
  %234 = icmp slt i32 %226, %232, !llfi_index !968
  %235 = icmp slt i32 %227, %233, !llfi_index !968
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %234, i1 %235)
  br i1 %234, label %236, label %436, !llfi_index !969

; <label>:236                                     ; preds = %225
  store i32 0, i32* %area, align 4, !llfi_index !970
  store i32 0, i32* %total, align 4, !llfi_index !971
  %237 = load i8** %dp, align 8, !llfi_index !972
  %238 = load i8** %dp, align 8, !llfi_index !972
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %237, i8* %238)
  store i8* %237, i8** %dpt, align 8, !llfi_index !973
  %239 = load i8** %3, align 8, !llfi_index !974
  %240 = load i8** %3, align 8, !llfi_index !974
  %241 = load i32* %i, align 4, !llfi_index !975
  %242 = load i32* %i, align 4, !llfi_index !975
  %243 = load i32* %mask_size, align 4, !llfi_index !976
  %244 = load i32* %mask_size, align 4, !llfi_index !976
  %245 = sub nsw i32 %241, %243, !llfi_index !977
  %246 = sub nsw i32 %242, %244, !llfi_index !977
  %247 = load i32* %5, align 4, !llfi_index !978
  %248 = load i32* %5, align 4, !llfi_index !978
  %249 = mul nsw i32 %245, %247, !llfi_index !979
  %250 = mul nsw i32 %246, %248, !llfi_index !979
  %251 = sext i32 %249 to i64, !llfi_index !980
  %252 = sext i32 %250 to i64, !llfi_index !980
  %253 = getelementptr inbounds i8* %239, i64 %251, !llfi_index !981
  %254 = getelementptr inbounds i8* %240, i64 %252, !llfi_index !981
  %255 = load i32* %j, align 4, !llfi_index !982
  %256 = load i32* %j, align 4, !llfi_index !982
  %257 = sext i32 %255 to i64, !llfi_index !983
  %258 = sext i32 %256 to i64, !llfi_index !983
  %259 = getelementptr inbounds i8* %253, i64 %257, !llfi_index !984
  %260 = getelementptr inbounds i8* %254, i64 %258, !llfi_index !984
  %261 = load i32* %mask_size, align 4, !llfi_index !985
  %262 = load i32* %mask_size, align 4, !llfi_index !985
  %263 = sext i32 %261 to i64, !llfi_index !986
  %264 = sext i32 %262 to i64, !llfi_index !986
  %265 = sub i64 0, %263, !llfi_index !987
  %266 = sub i64 0, %264, !llfi_index !987
  %267 = getelementptr inbounds i8* %259, i64 %265, !llfi_index !988
  %268 = getelementptr inbounds i8* %260, i64 %266, !llfi_index !988
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %267, i8* %268)
  store i8* %267, i8** %ip, align 8, !llfi_index !989
  %269 = load i32* %i, align 4, !llfi_index !990
  %270 = load i32* %i, align 4, !llfi_index !990
  %271 = load i32* %5, align 4, !llfi_index !991
  %272 = load i32* %5, align 4, !llfi_index !991
  %273 = mul nsw i32 %269, %271, !llfi_index !992
  %274 = mul nsw i32 %270, %272, !llfi_index !992
  %275 = load i32* %j, align 4, !llfi_index !993
  %276 = load i32* %j, align 4, !llfi_index !993
  %277 = add nsw i32 %273, %275, !llfi_index !994
  %278 = add nsw i32 %274, %276, !llfi_index !994
  %279 = sext i32 %277 to i64, !llfi_index !995
  %280 = sext i32 %278 to i64, !llfi_index !995
  %281 = load i8** %3, align 8, !llfi_index !996
  %282 = load i8** %3, align 8, !llfi_index !996
  %283 = getelementptr inbounds i8* %281, i64 %279, !llfi_index !997
  %284 = getelementptr inbounds i8* %282, i64 %280, !llfi_index !997
  %285 = load i8* %283, align 1, !llfi_index !998
  %286 = load i8* %284, align 1, !llfi_index !998
  %287 = zext i8 %285 to i32, !llfi_index !999
  %288 = zext i8 %286 to i32, !llfi_index !999
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %287, i32 %288)
  store i32 %287, i32* %centre, align 4, !llfi_index !1000
  %289 = load i8** %7, align 8, !llfi_index !1001
  %290 = load i8** %7, align 8, !llfi_index !1001
  %291 = load i32* %centre, align 4, !llfi_index !1002
  %292 = load i32* %centre, align 4, !llfi_index !1002
  %293 = sext i32 %291 to i64, !llfi_index !1003
  %294 = sext i32 %292 to i64, !llfi_index !1003
  %295 = getelementptr inbounds i8* %289, i64 %293, !llfi_index !1004
  %296 = getelementptr inbounds i8* %290, i64 %294, !llfi_index !1004
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %295, i8* %296)
  store i8* %295, i8** %cp, align 8, !llfi_index !1005
  %297 = load i32* %mask_size, align 4, !llfi_index !1006
  %298 = load i32* %mask_size, align 4, !llfi_index !1006
  %299 = sub nsw i32 0, %297, !llfi_index !1007
  %300 = sub nsw i32 0, %298, !llfi_index !1007
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %299, i32 %300)
  store i32 %299, i32* %y, align 4, !llfi_index !1008
  br label %301, !llfi_index !1009

; <label>:301                                     ; preds = %383, %236
  %302 = load i32* %y, align 4, !llfi_index !1010
  %303 = load i32* %y, align 4, !llfi_index !1010
  %304 = load i32* %mask_size, align 4, !llfi_index !1011
  %305 = load i32* %mask_size, align 4, !llfi_index !1011
  %306 = icmp sle i32 %302, %304, !llfi_index !1012
  %307 = icmp sle i32 %303, %305, !llfi_index !1012
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %306, i1 %307)
  br i1 %306, label %308, label %388, !llfi_index !1013

; <label>:308                                     ; preds = %301
  %309 = load i32* %mask_size, align 4, !llfi_index !1014
  %310 = load i32* %mask_size, align 4, !llfi_index !1014
  %311 = sub nsw i32 0, %309, !llfi_index !1015
  %312 = sub nsw i32 0, %310, !llfi_index !1015
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %311, i32 %312)
  store i32 %311, i32* %x, align 4, !llfi_index !1016
  br label %313, !llfi_index !1017

; <label>:313                                     ; preds = %369, %308
  %314 = load i32* %x, align 4, !llfi_index !1018
  %315 = load i32* %x, align 4, !llfi_index !1018
  %316 = load i32* %mask_size, align 4, !llfi_index !1019
  %317 = load i32* %mask_size, align 4, !llfi_index !1019
  %318 = icmp sle i32 %314, %316, !llfi_index !1020
  %319 = icmp sle i32 %315, %317, !llfi_index !1020
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %318, i1 %319)
  br i1 %318, label %320, label %374, !llfi_index !1021

; <label>:320                                     ; preds = %313
  %321 = load i8** %ip, align 8, !llfi_index !1022
  %322 = load i8** %ip, align 8, !llfi_index !1022
  %323 = getelementptr inbounds i8* %321, i32 1, !llfi_index !1023
  %324 = getelementptr inbounds i8* %322, i32 1, !llfi_index !1023
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %323, i8* %324)
  store i8* %323, i8** %ip, align 8, !llfi_index !1024
  %325 = load i8* %321, align 1, !llfi_index !1025
  %326 = load i8* %322, align 1, !llfi_index !1025
  %327 = zext i8 %325 to i32, !llfi_index !1026
  %328 = zext i8 %326 to i32, !llfi_index !1026
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %327, i32 %328)
  store i32 %327, i32* %brightness, align 4, !llfi_index !1027
  %329 = load i8** %dpt, align 8, !llfi_index !1028
  %330 = load i8** %dpt, align 8, !llfi_index !1028
  %331 = getelementptr inbounds i8* %329, i32 1, !llfi_index !1029
  %332 = getelementptr inbounds i8* %330, i32 1, !llfi_index !1029
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %331, i8* %332)
  store i8* %331, i8** %dpt, align 8, !llfi_index !1030
  %333 = load i8* %329, align 1, !llfi_index !1031
  %334 = load i8* %330, align 1, !llfi_index !1031
  %335 = zext i8 %333 to i32, !llfi_index !1032
  %336 = zext i8 %334 to i32, !llfi_index !1032
  %337 = load i8** %cp, align 8, !llfi_index !1033
  %338 = load i8** %cp, align 8, !llfi_index !1033
  %339 = load i32* %brightness, align 4, !llfi_index !1034
  %340 = load i32* %brightness, align 4, !llfi_index !1034
  %341 = sext i32 %339 to i64, !llfi_index !1035
  %342 = sext i32 %340 to i64, !llfi_index !1035
  %343 = sub i64 0, %341, !llfi_index !1036
  %344 = sub i64 0, %342, !llfi_index !1036
  %345 = getelementptr inbounds i8* %337, i64 %343, !llfi_index !1037
  %346 = getelementptr inbounds i8* %338, i64 %344, !llfi_index !1037
  %347 = load i8* %345, align 1, !llfi_index !1038
  %348 = load i8* %346, align 1, !llfi_index !1038
  %349 = zext i8 %347 to i32, !llfi_index !1039
  %350 = zext i8 %348 to i32, !llfi_index !1039
  %351 = mul nsw i32 %335, %349, !llfi_index !1040
  %352 = mul nsw i32 %336, %350, !llfi_index !1040
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %351, i32 %352)
  store i32 %351, i32* %tmp, align 4, !llfi_index !1041
  %353 = load i32* %tmp, align 4, !llfi_index !1042
  %354 = load i32* %tmp, align 4, !llfi_index !1042
  %355 = load i32* %area, align 4, !llfi_index !1043
  %356 = load i32* %area, align 4, !llfi_index !1043
  %357 = add nsw i32 %355, %353, !llfi_index !1044
  %358 = add nsw i32 %356, %354, !llfi_index !1044
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %357, i32 %358)
  store i32 %357, i32* %area, align 4, !llfi_index !1045
  %359 = load i32* %tmp, align 4, !llfi_index !1046
  %360 = load i32* %tmp, align 4, !llfi_index !1046
  %361 = load i32* %brightness, align 4, !llfi_index !1047
  %362 = load i32* %brightness, align 4, !llfi_index !1047
  %363 = mul nsw i32 %359, %361, !llfi_index !1048
  %364 = mul nsw i32 %360, %362, !llfi_index !1048
  %365 = load i32* %total, align 4, !llfi_index !1049
  %366 = load i32* %total, align 4, !llfi_index !1049
  %367 = add nsw i32 %365, %363, !llfi_index !1050
  %368 = add nsw i32 %366, %364, !llfi_index !1050
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %367, i32 %368)
  store i32 %367, i32* %total, align 4, !llfi_index !1051
  br label %369, !llfi_index !1052

; <label>:369                                     ; preds = %320
  %370 = load i32* %x, align 4, !llfi_index !1053
  %371 = load i32* %x, align 4, !llfi_index !1053
  %372 = add nsw i32 %370, 1, !llfi_index !1054
  %373 = add nsw i32 %371, 1, !llfi_index !1054
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %372, i32 %373)
  store i32 %372, i32* %x, align 4, !llfi_index !1055
  br label %313, !llfi_index !1056

; <label>:374                                     ; preds = %313
  %375 = load i32* %increment, align 4, !llfi_index !1057
  %376 = load i32* %increment, align 4, !llfi_index !1057
  %377 = load i8** %ip, align 8, !llfi_index !1058
  %378 = load i8** %ip, align 8, !llfi_index !1058
  %379 = sext i32 %375 to i64, !llfi_index !1059
  %380 = sext i32 %376 to i64, !llfi_index !1059
  %381 = getelementptr inbounds i8* %377, i64 %379, !llfi_index !1060
  %382 = getelementptr inbounds i8* %378, i64 %380, !llfi_index !1060
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %381, i8* %382)
  store i8* %381, i8** %ip, align 8, !llfi_index !1061
  br label %383, !llfi_index !1062

; <label>:383                                     ; preds = %374
  %384 = load i32* %y, align 4, !llfi_index !1063
  %385 = load i32* %y, align 4, !llfi_index !1063
  %386 = add nsw i32 %384, 1, !llfi_index !1064
  %387 = add nsw i32 %385, 1, !llfi_index !1064
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %386, i32 %387)
  store i32 %386, i32* %y, align 4, !llfi_index !1065
  br label %301, !llfi_index !1066

; <label>:388                                     ; preds = %301
  %389 = load i32* %area, align 4, !llfi_index !1067
  %390 = load i32* %area, align 4, !llfi_index !1067
  %391 = sub nsw i32 %389, 10000, !llfi_index !1068
  %392 = sub nsw i32 %390, 10000, !llfi_index !1068
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %391, i32 %392)
  store i32 %391, i32* %tmp, align 4, !llfi_index !1069
  %393 = load i32* %tmp, align 4, !llfi_index !1070
  %394 = load i32* %tmp, align 4, !llfi_index !1070
  %395 = icmp eq i32 %393, 0, !llfi_index !1071
  %396 = icmp eq i32 %394, 0, !llfi_index !1071
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %395, i1 %396)
  br i1 %395, label %397, label %411, !llfi_index !1072

; <label>:397                                     ; preds = %388
  %398 = load i8** %3, align 8, !llfi_index !1073
  %399 = load i8** %3, align 8, !llfi_index !1073
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %398, i8* %399)
  %400 = load i32* %i, align 4, !llfi_index !1074
  %401 = load i32* %i, align 4, !llfi_index !1074
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %400, i32 %401)
  %402 = load i32* %j, align 4, !llfi_index !1075
  %403 = load i32* %j, align 4, !llfi_index !1075
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %402, i32 %403)
  %404 = load i32* %5, align 4, !llfi_index !1076
  %405 = load i32* %5, align 4, !llfi_index !1076
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %404, i32 %405)
  %406 = call zeroext i8 @median(i8* %398, i32 %400, i32 %402, i32 %404), !llfi_index !1077
  %407 = load i8** %out, align 8, !llfi_index !1078
  %408 = load i8** %out, align 8, !llfi_index !1078
  %409 = getelementptr inbounds i8* %407, i32 1, !llfi_index !1079
  %410 = getelementptr inbounds i8* %408, i32 1, !llfi_index !1079
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %409, i8* %410)
  store i8* %409, i8** %out, align 8, !llfi_index !1080
  store i8 %406, i8* %407, align 1, !llfi_index !1081
  br label %430, !llfi_index !1082

; <label>:411                                     ; preds = %388
  %412 = load i32* %total, align 4, !llfi_index !1083
  %413 = load i32* %total, align 4, !llfi_index !1083
  %414 = load i32* %centre, align 4, !llfi_index !1084
  %415 = load i32* %centre, align 4, !llfi_index !1084
  %416 = mul nsw i32 %414, 10000, !llfi_index !1085
  %417 = mul nsw i32 %415, 10000, !llfi_index !1085
  %418 = sub nsw i32 %412, %416, !llfi_index !1086
  %419 = sub nsw i32 %413, %417, !llfi_index !1086
  %420 = load i32* %tmp, align 4, !llfi_index !1087
  %421 = load i32* %tmp, align 4, !llfi_index !1087
  %422 = sdiv i32 %418, %420, !llfi_index !1088
  %423 = sdiv i32 %419, %421, !llfi_index !1088
  %424 = trunc i32 %422 to i8, !llfi_index !1089
  %425 = trunc i32 %423 to i8, !llfi_index !1089
  call void bitcast (void (i64, i64)* @global_add to void (i8, i8)*)(i8 %424, i8 %425)
  %426 = load i8** %out, align 8, !llfi_index !1090
  %427 = load i8** %out, align 8, !llfi_index !1090
  %428 = getelementptr inbounds i8* %426, i32 1, !llfi_index !1091
  %429 = getelementptr inbounds i8* %427, i32 1, !llfi_index !1091
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %428, i8* %429)
  store i8* %428, i8** %out, align 8, !llfi_index !1092
  store i8 %424, i8* %426, align 1, !llfi_index !1093
  br label %430, !llfi_index !1094

; <label>:430                                     ; preds = %411, %397
  br label %431, !llfi_index !1095

; <label>:431                                     ; preds = %430
  %432 = load i32* %j, align 4, !llfi_index !1096
  %433 = load i32* %j, align 4, !llfi_index !1096
  %434 = add nsw i32 %432, 1, !llfi_index !1097
  %435 = add nsw i32 %433, 1, !llfi_index !1097
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %434, i32 %435)
  store i32 %434, i32* %j, align 4, !llfi_index !1098
  br label %225, !llfi_index !1099

; <label>:436                                     ; preds = %225
  br label %437, !llfi_index !1100

; <label>:437                                     ; preds = %436
  %438 = load i32* %i, align 4, !llfi_index !1101
  %439 = load i32* %i, align 4, !llfi_index !1101
  %440 = add nsw i32 %438, 1, !llfi_index !1102
  %441 = add nsw i32 %439, 1, !llfi_index !1102
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %440, i32 %441)
  store i32 %440, i32* %i, align 4, !llfi_index !1103
  br label %211, !llfi_index !1104

; <label>:442                                     ; preds = %211
  br label %924, !llfi_index !1105

; <label>:443                                     ; preds = %75
  store i32 1, i32* %i, align 4, !llfi_index !1106
  br label %444, !llfi_index !1107

; <label>:444                                     ; preds = %918, %443
  %445 = load i32* %i, align 4, !llfi_index !1108
  %446 = load i32* %i, align 4, !llfi_index !1108
  %447 = load i32* %6, align 4, !llfi_index !1109
  %448 = load i32* %6, align 4, !llfi_index !1109
  %449 = sub nsw i32 %447, 1, !llfi_index !1110
  %450 = sub nsw i32 %448, 1, !llfi_index !1110
  %451 = icmp slt i32 %445, %449, !llfi_index !1111
  %452 = icmp slt i32 %446, %450, !llfi_index !1111
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %451, i1 %452)
  br i1 %451, label %453, label %923, !llfi_index !1112

; <label>:453                                     ; preds = %444
  store i32 1, i32* %j, align 4, !llfi_index !1113
  br label %454, !llfi_index !1114

; <label>:454                                     ; preds = %912, %453
  %455 = load i32* %j, align 4, !llfi_index !1115
  %456 = load i32* %j, align 4, !llfi_index !1115
  %457 = load i32* %5, align 4, !llfi_index !1116
  %458 = load i32* %5, align 4, !llfi_index !1116
  %459 = sub nsw i32 %457, 1, !llfi_index !1117
  %460 = sub nsw i32 %458, 1, !llfi_index !1117
  %461 = icmp slt i32 %455, %459, !llfi_index !1118
  %462 = icmp slt i32 %456, %460, !llfi_index !1118
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %461, i1 %462)
  br i1 %461, label %463, label %917, !llfi_index !1119

; <label>:463                                     ; preds = %454
  store i32 0, i32* %area, align 4, !llfi_index !1120
  store i32 0, i32* %total, align 4, !llfi_index !1121
  %464 = load i8** %3, align 8, !llfi_index !1122
  %465 = load i8** %3, align 8, !llfi_index !1122
  %466 = load i32* %i, align 4, !llfi_index !1123
  %467 = load i32* %i, align 4, !llfi_index !1123
  %468 = sub nsw i32 %466, 1, !llfi_index !1124
  %469 = sub nsw i32 %467, 1, !llfi_index !1124
  %470 = load i32* %5, align 4, !llfi_index !1125
  %471 = load i32* %5, align 4, !llfi_index !1125
  %472 = mul nsw i32 %468, %470, !llfi_index !1126
  %473 = mul nsw i32 %469, %471, !llfi_index !1126
  %474 = sext i32 %472 to i64, !llfi_index !1127
  %475 = sext i32 %473 to i64, !llfi_index !1127
  %476 = getelementptr inbounds i8* %464, i64 %474, !llfi_index !1128
  %477 = getelementptr inbounds i8* %465, i64 %475, !llfi_index !1128
  %478 = load i32* %j, align 4, !llfi_index !1129
  %479 = load i32* %j, align 4, !llfi_index !1129
  %480 = sext i32 %478 to i64, !llfi_index !1130
  %481 = sext i32 %479 to i64, !llfi_index !1130
  %482 = getelementptr inbounds i8* %476, i64 %480, !llfi_index !1131
  %483 = getelementptr inbounds i8* %477, i64 %481, !llfi_index !1131
  %484 = getelementptr inbounds i8* %482, i64 -1, !llfi_index !1132
  %485 = getelementptr inbounds i8* %483, i64 -1, !llfi_index !1132
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %484, i8* %485)
  store i8* %484, i8** %ip, align 8, !llfi_index !1133
  %486 = load i32* %i, align 4, !llfi_index !1134
  %487 = load i32* %i, align 4, !llfi_index !1134
  %488 = load i32* %5, align 4, !llfi_index !1135
  %489 = load i32* %5, align 4, !llfi_index !1135
  %490 = mul nsw i32 %486, %488, !llfi_index !1136
  %491 = mul nsw i32 %487, %489, !llfi_index !1136
  %492 = load i32* %j, align 4, !llfi_index !1137
  %493 = load i32* %j, align 4, !llfi_index !1137
  %494 = add nsw i32 %490, %492, !llfi_index !1138
  %495 = add nsw i32 %491, %493, !llfi_index !1138
  %496 = sext i32 %494 to i64, !llfi_index !1139
  %497 = sext i32 %495 to i64, !llfi_index !1139
  %498 = load i8** %3, align 8, !llfi_index !1140
  %499 = load i8** %3, align 8, !llfi_index !1140
  %500 = getelementptr inbounds i8* %498, i64 %496, !llfi_index !1141
  %501 = getelementptr inbounds i8* %499, i64 %497, !llfi_index !1141
  %502 = load i8* %500, align 1, !llfi_index !1142
  %503 = load i8* %501, align 1, !llfi_index !1142
  %504 = zext i8 %502 to i32, !llfi_index !1143
  %505 = zext i8 %503 to i32, !llfi_index !1143
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %504, i32 %505)
  store i32 %504, i32* %centre, align 4, !llfi_index !1144
  %506 = load i8** %7, align 8, !llfi_index !1145
  %507 = load i8** %7, align 8, !llfi_index !1145
  %508 = load i32* %centre, align 4, !llfi_index !1146
  %509 = load i32* %centre, align 4, !llfi_index !1146
  %510 = sext i32 %508 to i64, !llfi_index !1147
  %511 = sext i32 %509 to i64, !llfi_index !1147
  %512 = getelementptr inbounds i8* %506, i64 %510, !llfi_index !1148
  %513 = getelementptr inbounds i8* %507, i64 %511, !llfi_index !1148
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %512, i8* %513)
  store i8* %512, i8** %cp, align 8, !llfi_index !1149
  %514 = load i8** %ip, align 8, !llfi_index !1150
  %515 = load i8** %ip, align 8, !llfi_index !1150
  %516 = getelementptr inbounds i8* %514, i32 1, !llfi_index !1151
  %517 = getelementptr inbounds i8* %515, i32 1, !llfi_index !1151
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %516, i8* %517)
  store i8* %516, i8** %ip, align 8, !llfi_index !1152
  %518 = load i8* %514, align 1, !llfi_index !1153
  %519 = load i8* %515, align 1, !llfi_index !1153
  %520 = zext i8 %518 to i32, !llfi_index !1154
  %521 = zext i8 %519 to i32, !llfi_index !1154
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %520, i32 %521)
  store i32 %520, i32* %brightness, align 4, !llfi_index !1155
  %522 = load i8** %cp, align 8, !llfi_index !1156
  %523 = load i8** %cp, align 8, !llfi_index !1156
  %524 = load i32* %brightness, align 4, !llfi_index !1157
  %525 = load i32* %brightness, align 4, !llfi_index !1157
  %526 = sext i32 %524 to i64, !llfi_index !1158
  %527 = sext i32 %525 to i64, !llfi_index !1158
  %528 = sub i64 0, %526, !llfi_index !1159
  %529 = sub i64 0, %527, !llfi_index !1159
  %530 = getelementptr inbounds i8* %522, i64 %528, !llfi_index !1160
  %531 = getelementptr inbounds i8* %523, i64 %529, !llfi_index !1160
  %532 = load i8* %530, align 1, !llfi_index !1161
  %533 = load i8* %531, align 1, !llfi_index !1161
  %534 = zext i8 %532 to i32, !llfi_index !1162
  %535 = zext i8 %533 to i32, !llfi_index !1162
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %534, i32 %535)
  store i32 %534, i32* %tmp, align 4, !llfi_index !1163
  %536 = load i32* %tmp, align 4, !llfi_index !1164
  %537 = load i32* %tmp, align 4, !llfi_index !1164
  %538 = load i32* %area, align 4, !llfi_index !1165
  %539 = load i32* %area, align 4, !llfi_index !1165
  %540 = add nsw i32 %538, %536, !llfi_index !1166
  %541 = add nsw i32 %539, %537, !llfi_index !1166
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %540, i32 %541)
  store i32 %540, i32* %area, align 4, !llfi_index !1167
  %542 = load i32* %tmp, align 4, !llfi_index !1168
  %543 = load i32* %tmp, align 4, !llfi_index !1168
  %544 = load i32* %brightness, align 4, !llfi_index !1169
  %545 = load i32* %brightness, align 4, !llfi_index !1169
  %546 = mul nsw i32 %542, %544, !llfi_index !1170
  %547 = mul nsw i32 %543, %545, !llfi_index !1170
  %548 = load i32* %total, align 4, !llfi_index !1171
  %549 = load i32* %total, align 4, !llfi_index !1171
  %550 = add nsw i32 %548, %546, !llfi_index !1172
  %551 = add nsw i32 %549, %547, !llfi_index !1172
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %550, i32 %551)
  store i32 %550, i32* %total, align 4, !llfi_index !1173
  %552 = load i8** %ip, align 8, !llfi_index !1174
  %553 = load i8** %ip, align 8, !llfi_index !1174
  %554 = getelementptr inbounds i8* %552, i32 1, !llfi_index !1175
  %555 = getelementptr inbounds i8* %553, i32 1, !llfi_index !1175
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %554, i8* %555)
  store i8* %554, i8** %ip, align 8, !llfi_index !1176
  %556 = load i8* %552, align 1, !llfi_index !1177
  %557 = load i8* %553, align 1, !llfi_index !1177
  %558 = zext i8 %556 to i32, !llfi_index !1178
  %559 = zext i8 %557 to i32, !llfi_index !1178
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %558, i32 %559)
  store i32 %558, i32* %brightness, align 4, !llfi_index !1179
  %560 = load i8** %cp, align 8, !llfi_index !1180
  %561 = load i8** %cp, align 8, !llfi_index !1180
  %562 = load i32* %brightness, align 4, !llfi_index !1181
  %563 = load i32* %brightness, align 4, !llfi_index !1181
  %564 = sext i32 %562 to i64, !llfi_index !1182
  %565 = sext i32 %563 to i64, !llfi_index !1182
  %566 = sub i64 0, %564, !llfi_index !1183
  %567 = sub i64 0, %565, !llfi_index !1183
  %568 = getelementptr inbounds i8* %560, i64 %566, !llfi_index !1184
  %569 = getelementptr inbounds i8* %561, i64 %567, !llfi_index !1184
  %570 = load i8* %568, align 1, !llfi_index !1185
  %571 = load i8* %569, align 1, !llfi_index !1185
  %572 = zext i8 %570 to i32, !llfi_index !1186
  %573 = zext i8 %571 to i32, !llfi_index !1186
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %572, i32 %573)
  store i32 %572, i32* %tmp, align 4, !llfi_index !1187
  %574 = load i32* %tmp, align 4, !llfi_index !1188
  %575 = load i32* %tmp, align 4, !llfi_index !1188
  %576 = load i32* %area, align 4, !llfi_index !1189
  %577 = load i32* %area, align 4, !llfi_index !1189
  %578 = add nsw i32 %576, %574, !llfi_index !1190
  %579 = add nsw i32 %577, %575, !llfi_index !1190
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %578, i32 %579)
  store i32 %578, i32* %area, align 4, !llfi_index !1191
  %580 = load i32* %tmp, align 4, !llfi_index !1192
  %581 = load i32* %tmp, align 4, !llfi_index !1192
  %582 = load i32* %brightness, align 4, !llfi_index !1193
  %583 = load i32* %brightness, align 4, !llfi_index !1193
  %584 = mul nsw i32 %580, %582, !llfi_index !1194
  %585 = mul nsw i32 %581, %583, !llfi_index !1194
  %586 = load i32* %total, align 4, !llfi_index !1195
  %587 = load i32* %total, align 4, !llfi_index !1195
  %588 = add nsw i32 %586, %584, !llfi_index !1196
  %589 = add nsw i32 %587, %585, !llfi_index !1196
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %588, i32 %589)
  store i32 %588, i32* %total, align 4, !llfi_index !1197
  %590 = load i8** %ip, align 8, !llfi_index !1198
  %591 = load i8** %ip, align 8, !llfi_index !1198
  %592 = load i8* %590, align 1, !llfi_index !1199
  %593 = load i8* %591, align 1, !llfi_index !1199
  %594 = zext i8 %592 to i32, !llfi_index !1200
  %595 = zext i8 %593 to i32, !llfi_index !1200
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %594, i32 %595)
  store i32 %594, i32* %brightness, align 4, !llfi_index !1201
  %596 = load i8** %cp, align 8, !llfi_index !1202
  %597 = load i8** %cp, align 8, !llfi_index !1202
  %598 = load i32* %brightness, align 4, !llfi_index !1203
  %599 = load i32* %brightness, align 4, !llfi_index !1203
  %600 = sext i32 %598 to i64, !llfi_index !1204
  %601 = sext i32 %599 to i64, !llfi_index !1204
  %602 = sub i64 0, %600, !llfi_index !1205
  %603 = sub i64 0, %601, !llfi_index !1205
  %604 = getelementptr inbounds i8* %596, i64 %602, !llfi_index !1206
  %605 = getelementptr inbounds i8* %597, i64 %603, !llfi_index !1206
  %606 = load i8* %604, align 1, !llfi_index !1207
  %607 = load i8* %605, align 1, !llfi_index !1207
  %608 = zext i8 %606 to i32, !llfi_index !1208
  %609 = zext i8 %607 to i32, !llfi_index !1208
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %608, i32 %609)
  store i32 %608, i32* %tmp, align 4, !llfi_index !1209
  %610 = load i32* %tmp, align 4, !llfi_index !1210
  %611 = load i32* %tmp, align 4, !llfi_index !1210
  %612 = load i32* %area, align 4, !llfi_index !1211
  %613 = load i32* %area, align 4, !llfi_index !1211
  %614 = add nsw i32 %612, %610, !llfi_index !1212
  %615 = add nsw i32 %613, %611, !llfi_index !1212
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %614, i32 %615)
  store i32 %614, i32* %area, align 4, !llfi_index !1213
  %616 = load i32* %tmp, align 4, !llfi_index !1214
  %617 = load i32* %tmp, align 4, !llfi_index !1214
  %618 = load i32* %brightness, align 4, !llfi_index !1215
  %619 = load i32* %brightness, align 4, !llfi_index !1215
  %620 = mul nsw i32 %616, %618, !llfi_index !1216
  %621 = mul nsw i32 %617, %619, !llfi_index !1216
  %622 = load i32* %total, align 4, !llfi_index !1217
  %623 = load i32* %total, align 4, !llfi_index !1217
  %624 = add nsw i32 %622, %620, !llfi_index !1218
  %625 = add nsw i32 %623, %621, !llfi_index !1218
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %624, i32 %625)
  store i32 %624, i32* %total, align 4, !llfi_index !1219
  %626 = load i32* %5, align 4, !llfi_index !1220
  %627 = load i32* %5, align 4, !llfi_index !1220
  %628 = sub nsw i32 %626, 2, !llfi_index !1221
  %629 = sub nsw i32 %627, 2, !llfi_index !1221
  %630 = load i8** %ip, align 8, !llfi_index !1222
  %631 = load i8** %ip, align 8, !llfi_index !1222
  %632 = sext i32 %628 to i64, !llfi_index !1223
  %633 = sext i32 %629 to i64, !llfi_index !1223
  %634 = getelementptr inbounds i8* %630, i64 %632, !llfi_index !1224
  %635 = getelementptr inbounds i8* %631, i64 %633, !llfi_index !1224
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %634, i8* %635)
  store i8* %634, i8** %ip, align 8, !llfi_index !1225
  %636 = load i8** %ip, align 8, !llfi_index !1226
  %637 = load i8** %ip, align 8, !llfi_index !1226
  %638 = getelementptr inbounds i8* %636, i32 1, !llfi_index !1227
  %639 = getelementptr inbounds i8* %637, i32 1, !llfi_index !1227
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %638, i8* %639)
  store i8* %638, i8** %ip, align 8, !llfi_index !1228
  %640 = load i8* %636, align 1, !llfi_index !1229
  %641 = load i8* %637, align 1, !llfi_index !1229
  %642 = zext i8 %640 to i32, !llfi_index !1230
  %643 = zext i8 %641 to i32, !llfi_index !1230
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %642, i32 %643)
  store i32 %642, i32* %brightness, align 4, !llfi_index !1231
  %644 = load i8** %cp, align 8, !llfi_index !1232
  %645 = load i8** %cp, align 8, !llfi_index !1232
  %646 = load i32* %brightness, align 4, !llfi_index !1233
  %647 = load i32* %brightness, align 4, !llfi_index !1233
  %648 = sext i32 %646 to i64, !llfi_index !1234
  %649 = sext i32 %647 to i64, !llfi_index !1234
  %650 = sub i64 0, %648, !llfi_index !1235
  %651 = sub i64 0, %649, !llfi_index !1235
  %652 = getelementptr inbounds i8* %644, i64 %650, !llfi_index !1236
  %653 = getelementptr inbounds i8* %645, i64 %651, !llfi_index !1236
  %654 = load i8* %652, align 1, !llfi_index !1237
  %655 = load i8* %653, align 1, !llfi_index !1237
  %656 = zext i8 %654 to i32, !llfi_index !1238
  %657 = zext i8 %655 to i32, !llfi_index !1238
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %656, i32 %657)
  store i32 %656, i32* %tmp, align 4, !llfi_index !1239
  %658 = load i32* %tmp, align 4, !llfi_index !1240
  %659 = load i32* %tmp, align 4, !llfi_index !1240
  %660 = load i32* %area, align 4, !llfi_index !1241
  %661 = load i32* %area, align 4, !llfi_index !1241
  %662 = add nsw i32 %660, %658, !llfi_index !1242
  %663 = add nsw i32 %661, %659, !llfi_index !1242
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %662, i32 %663)
  store i32 %662, i32* %area, align 4, !llfi_index !1243
  %664 = load i32* %tmp, align 4, !llfi_index !1244
  %665 = load i32* %tmp, align 4, !llfi_index !1244
  %666 = load i32* %brightness, align 4, !llfi_index !1245
  %667 = load i32* %brightness, align 4, !llfi_index !1245
  %668 = mul nsw i32 %664, %666, !llfi_index !1246
  %669 = mul nsw i32 %665, %667, !llfi_index !1246
  %670 = load i32* %total, align 4, !llfi_index !1247
  %671 = load i32* %total, align 4, !llfi_index !1247
  %672 = add nsw i32 %670, %668, !llfi_index !1248
  %673 = add nsw i32 %671, %669, !llfi_index !1248
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %672, i32 %673)
  store i32 %672, i32* %total, align 4, !llfi_index !1249
  %674 = load i8** %ip, align 8, !llfi_index !1250
  %675 = load i8** %ip, align 8, !llfi_index !1250
  %676 = getelementptr inbounds i8* %674, i32 1, !llfi_index !1251
  %677 = getelementptr inbounds i8* %675, i32 1, !llfi_index !1251
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %676, i8* %677)
  store i8* %676, i8** %ip, align 8, !llfi_index !1252
  %678 = load i8* %674, align 1, !llfi_index !1253
  %679 = load i8* %675, align 1, !llfi_index !1253
  %680 = zext i8 %678 to i32, !llfi_index !1254
  %681 = zext i8 %679 to i32, !llfi_index !1254
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %680, i32 %681)
  store i32 %680, i32* %brightness, align 4, !llfi_index !1255
  %682 = load i8** %cp, align 8, !llfi_index !1256
  %683 = load i8** %cp, align 8, !llfi_index !1256
  %684 = load i32* %brightness, align 4, !llfi_index !1257
  %685 = load i32* %brightness, align 4, !llfi_index !1257
  %686 = sext i32 %684 to i64, !llfi_index !1258
  %687 = sext i32 %685 to i64, !llfi_index !1258
  %688 = sub i64 0, %686, !llfi_index !1259
  %689 = sub i64 0, %687, !llfi_index !1259
  %690 = getelementptr inbounds i8* %682, i64 %688, !llfi_index !1260
  %691 = getelementptr inbounds i8* %683, i64 %689, !llfi_index !1260
  %692 = load i8* %690, align 1, !llfi_index !1261
  %693 = load i8* %691, align 1, !llfi_index !1261
  %694 = zext i8 %692 to i32, !llfi_index !1262
  %695 = zext i8 %693 to i32, !llfi_index !1262
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %694, i32 %695)
  store i32 %694, i32* %tmp, align 4, !llfi_index !1263
  %696 = load i32* %tmp, align 4, !llfi_index !1264
  %697 = load i32* %tmp, align 4, !llfi_index !1264
  %698 = load i32* %area, align 4, !llfi_index !1265
  %699 = load i32* %area, align 4, !llfi_index !1265
  %700 = add nsw i32 %698, %696, !llfi_index !1266
  %701 = add nsw i32 %699, %697, !llfi_index !1266
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %700, i32 %701)
  store i32 %700, i32* %area, align 4, !llfi_index !1267
  %702 = load i32* %tmp, align 4, !llfi_index !1268
  %703 = load i32* %tmp, align 4, !llfi_index !1268
  %704 = load i32* %brightness, align 4, !llfi_index !1269
  %705 = load i32* %brightness, align 4, !llfi_index !1269
  %706 = mul nsw i32 %702, %704, !llfi_index !1270
  %707 = mul nsw i32 %703, %705, !llfi_index !1270
  %708 = load i32* %total, align 4, !llfi_index !1271
  %709 = load i32* %total, align 4, !llfi_index !1271
  %710 = add nsw i32 %708, %706, !llfi_index !1272
  %711 = add nsw i32 %709, %707, !llfi_index !1272
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %710, i32 %711)
  store i32 %710, i32* %total, align 4, !llfi_index !1273
  %712 = load i8** %ip, align 8, !llfi_index !1274
  %713 = load i8** %ip, align 8, !llfi_index !1274
  %714 = load i8* %712, align 1, !llfi_index !1275
  %715 = load i8* %713, align 1, !llfi_index !1275
  %716 = zext i8 %714 to i32, !llfi_index !1276
  %717 = zext i8 %715 to i32, !llfi_index !1276
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %716, i32 %717)
  store i32 %716, i32* %brightness, align 4, !llfi_index !1277
  %718 = load i8** %cp, align 8, !llfi_index !1278
  %719 = load i8** %cp, align 8, !llfi_index !1278
  %720 = load i32* %brightness, align 4, !llfi_index !1279
  %721 = load i32* %brightness, align 4, !llfi_index !1279
  %722 = sext i32 %720 to i64, !llfi_index !1280
  %723 = sext i32 %721 to i64, !llfi_index !1280
  %724 = sub i64 0, %722, !llfi_index !1281
  %725 = sub i64 0, %723, !llfi_index !1281
  %726 = getelementptr inbounds i8* %718, i64 %724, !llfi_index !1282
  %727 = getelementptr inbounds i8* %719, i64 %725, !llfi_index !1282
  %728 = load i8* %726, align 1, !llfi_index !1283
  %729 = load i8* %727, align 1, !llfi_index !1283
  %730 = zext i8 %728 to i32, !llfi_index !1284
  %731 = zext i8 %729 to i32, !llfi_index !1284
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %730, i32 %731)
  store i32 %730, i32* %tmp, align 4, !llfi_index !1285
  %732 = load i32* %tmp, align 4, !llfi_index !1286
  %733 = load i32* %tmp, align 4, !llfi_index !1286
  %734 = load i32* %area, align 4, !llfi_index !1287
  %735 = load i32* %area, align 4, !llfi_index !1287
  %736 = add nsw i32 %734, %732, !llfi_index !1288
  %737 = add nsw i32 %735, %733, !llfi_index !1288
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %736, i32 %737)
  store i32 %736, i32* %area, align 4, !llfi_index !1289
  %738 = load i32* %tmp, align 4, !llfi_index !1290
  %739 = load i32* %tmp, align 4, !llfi_index !1290
  %740 = load i32* %brightness, align 4, !llfi_index !1291
  %741 = load i32* %brightness, align 4, !llfi_index !1291
  %742 = mul nsw i32 %738, %740, !llfi_index !1292
  %743 = mul nsw i32 %739, %741, !llfi_index !1292
  %744 = load i32* %total, align 4, !llfi_index !1293
  %745 = load i32* %total, align 4, !llfi_index !1293
  %746 = add nsw i32 %744, %742, !llfi_index !1294
  %747 = add nsw i32 %745, %743, !llfi_index !1294
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %746, i32 %747)
  store i32 %746, i32* %total, align 4, !llfi_index !1295
  %748 = load i32* %5, align 4, !llfi_index !1296
  %749 = load i32* %5, align 4, !llfi_index !1296
  %750 = sub nsw i32 %748, 2, !llfi_index !1297
  %751 = sub nsw i32 %749, 2, !llfi_index !1297
  %752 = load i8** %ip, align 8, !llfi_index !1298
  %753 = load i8** %ip, align 8, !llfi_index !1298
  %754 = sext i32 %750 to i64, !llfi_index !1299
  %755 = sext i32 %751 to i64, !llfi_index !1299
  %756 = getelementptr inbounds i8* %752, i64 %754, !llfi_index !1300
  %757 = getelementptr inbounds i8* %753, i64 %755, !llfi_index !1300
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %756, i8* %757)
  store i8* %756, i8** %ip, align 8, !llfi_index !1301
  %758 = load i8** %ip, align 8, !llfi_index !1302
  %759 = load i8** %ip, align 8, !llfi_index !1302
  %760 = getelementptr inbounds i8* %758, i32 1, !llfi_index !1303
  %761 = getelementptr inbounds i8* %759, i32 1, !llfi_index !1303
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %760, i8* %761)
  store i8* %760, i8** %ip, align 8, !llfi_index !1304
  %762 = load i8* %758, align 1, !llfi_index !1305
  %763 = load i8* %759, align 1, !llfi_index !1305
  %764 = zext i8 %762 to i32, !llfi_index !1306
  %765 = zext i8 %763 to i32, !llfi_index !1306
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %764, i32 %765)
  store i32 %764, i32* %brightness, align 4, !llfi_index !1307
  %766 = load i8** %cp, align 8, !llfi_index !1308
  %767 = load i8** %cp, align 8, !llfi_index !1308
  %768 = load i32* %brightness, align 4, !llfi_index !1309
  %769 = load i32* %brightness, align 4, !llfi_index !1309
  %770 = sext i32 %768 to i64, !llfi_index !1310
  %771 = sext i32 %769 to i64, !llfi_index !1310
  %772 = sub i64 0, %770, !llfi_index !1311
  %773 = sub i64 0, %771, !llfi_index !1311
  %774 = getelementptr inbounds i8* %766, i64 %772, !llfi_index !1312
  %775 = getelementptr inbounds i8* %767, i64 %773, !llfi_index !1312
  %776 = load i8* %774, align 1, !llfi_index !1313
  %777 = load i8* %775, align 1, !llfi_index !1313
  %778 = zext i8 %776 to i32, !llfi_index !1314
  %779 = zext i8 %777 to i32, !llfi_index !1314
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %778, i32 %779)
  store i32 %778, i32* %tmp, align 4, !llfi_index !1315
  %780 = load i32* %tmp, align 4, !llfi_index !1316
  %781 = load i32* %tmp, align 4, !llfi_index !1316
  %782 = load i32* %area, align 4, !llfi_index !1317
  %783 = load i32* %area, align 4, !llfi_index !1317
  %784 = add nsw i32 %782, %780, !llfi_index !1318
  %785 = add nsw i32 %783, %781, !llfi_index !1318
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %784, i32 %785)
  store i32 %784, i32* %area, align 4, !llfi_index !1319
  %786 = load i32* %tmp, align 4, !llfi_index !1320
  %787 = load i32* %tmp, align 4, !llfi_index !1320
  %788 = load i32* %brightness, align 4, !llfi_index !1321
  %789 = load i32* %brightness, align 4, !llfi_index !1321
  %790 = mul nsw i32 %786, %788, !llfi_index !1322
  %791 = mul nsw i32 %787, %789, !llfi_index !1322
  %792 = load i32* %total, align 4, !llfi_index !1323
  %793 = load i32* %total, align 4, !llfi_index !1323
  %794 = add nsw i32 %792, %790, !llfi_index !1324
  %795 = add nsw i32 %793, %791, !llfi_index !1324
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %794, i32 %795)
  store i32 %794, i32* %total, align 4, !llfi_index !1325
  %796 = load i8** %ip, align 8, !llfi_index !1326
  %797 = load i8** %ip, align 8, !llfi_index !1326
  %798 = getelementptr inbounds i8* %796, i32 1, !llfi_index !1327
  %799 = getelementptr inbounds i8* %797, i32 1, !llfi_index !1327
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %798, i8* %799)
  store i8* %798, i8** %ip, align 8, !llfi_index !1328
  %800 = load i8* %796, align 1, !llfi_index !1329
  %801 = load i8* %797, align 1, !llfi_index !1329
  %802 = zext i8 %800 to i32, !llfi_index !1330
  %803 = zext i8 %801 to i32, !llfi_index !1330
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %802, i32 %803)
  store i32 %802, i32* %brightness, align 4, !llfi_index !1331
  %804 = load i8** %cp, align 8, !llfi_index !1332
  %805 = load i8** %cp, align 8, !llfi_index !1332
  %806 = load i32* %brightness, align 4, !llfi_index !1333
  %807 = load i32* %brightness, align 4, !llfi_index !1333
  %808 = sext i32 %806 to i64, !llfi_index !1334
  %809 = sext i32 %807 to i64, !llfi_index !1334
  %810 = sub i64 0, %808, !llfi_index !1335
  %811 = sub i64 0, %809, !llfi_index !1335
  %812 = getelementptr inbounds i8* %804, i64 %810, !llfi_index !1336
  %813 = getelementptr inbounds i8* %805, i64 %811, !llfi_index !1336
  %814 = load i8* %812, align 1, !llfi_index !1337
  %815 = load i8* %813, align 1, !llfi_index !1337
  %816 = zext i8 %814 to i32, !llfi_index !1338
  %817 = zext i8 %815 to i32, !llfi_index !1338
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %816, i32 %817)
  store i32 %816, i32* %tmp, align 4, !llfi_index !1339
  %818 = load i32* %tmp, align 4, !llfi_index !1340
  %819 = load i32* %tmp, align 4, !llfi_index !1340
  %820 = load i32* %area, align 4, !llfi_index !1341
  %821 = load i32* %area, align 4, !llfi_index !1341
  %822 = add nsw i32 %820, %818, !llfi_index !1342
  %823 = add nsw i32 %821, %819, !llfi_index !1342
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %822, i32 %823)
  store i32 %822, i32* %area, align 4, !llfi_index !1343
  %824 = load i32* %tmp, align 4, !llfi_index !1344
  %825 = load i32* %tmp, align 4, !llfi_index !1344
  %826 = load i32* %brightness, align 4, !llfi_index !1345
  %827 = load i32* %brightness, align 4, !llfi_index !1345
  %828 = mul nsw i32 %824, %826, !llfi_index !1346
  %829 = mul nsw i32 %825, %827, !llfi_index !1346
  %830 = load i32* %total, align 4, !llfi_index !1347
  %831 = load i32* %total, align 4, !llfi_index !1347
  %832 = add nsw i32 %830, %828, !llfi_index !1348
  %833 = add nsw i32 %831, %829, !llfi_index !1348
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %832, i32 %833)
  store i32 %832, i32* %total, align 4, !llfi_index !1349
  %834 = load i8** %ip, align 8, !llfi_index !1350
  %835 = load i8** %ip, align 8, !llfi_index !1350
  %836 = load i8* %834, align 1, !llfi_index !1351
  %837 = load i8* %835, align 1, !llfi_index !1351
  %838 = zext i8 %836 to i32, !llfi_index !1352
  %839 = zext i8 %837 to i32, !llfi_index !1352
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %838, i32 %839)
  store i32 %838, i32* %brightness, align 4, !llfi_index !1353
  %840 = load i8** %cp, align 8, !llfi_index !1354
  %841 = load i8** %cp, align 8, !llfi_index !1354
  %842 = load i32* %brightness, align 4, !llfi_index !1355
  %843 = load i32* %brightness, align 4, !llfi_index !1355
  %844 = sext i32 %842 to i64, !llfi_index !1356
  %845 = sext i32 %843 to i64, !llfi_index !1356
  %846 = sub i64 0, %844, !llfi_index !1357
  %847 = sub i64 0, %845, !llfi_index !1357
  %848 = getelementptr inbounds i8* %840, i64 %846, !llfi_index !1358
  %849 = getelementptr inbounds i8* %841, i64 %847, !llfi_index !1358
  %850 = load i8* %848, align 1, !llfi_index !1359
  %851 = load i8* %849, align 1, !llfi_index !1359
  %852 = zext i8 %850 to i32, !llfi_index !1360
  %853 = zext i8 %851 to i32, !llfi_index !1360
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %852, i32 %853)
  store i32 %852, i32* %tmp, align 4, !llfi_index !1361
  %854 = load i32* %tmp, align 4, !llfi_index !1362
  %855 = load i32* %tmp, align 4, !llfi_index !1362
  %856 = load i32* %area, align 4, !llfi_index !1363
  %857 = load i32* %area, align 4, !llfi_index !1363
  %858 = add nsw i32 %856, %854, !llfi_index !1364
  %859 = add nsw i32 %857, %855, !llfi_index !1364
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %858, i32 %859)
  store i32 %858, i32* %area, align 4, !llfi_index !1365
  %860 = load i32* %tmp, align 4, !llfi_index !1366
  %861 = load i32* %tmp, align 4, !llfi_index !1366
  %862 = load i32* %brightness, align 4, !llfi_index !1367
  %863 = load i32* %brightness, align 4, !llfi_index !1367
  %864 = mul nsw i32 %860, %862, !llfi_index !1368
  %865 = mul nsw i32 %861, %863, !llfi_index !1368
  %866 = load i32* %total, align 4, !llfi_index !1369
  %867 = load i32* %total, align 4, !llfi_index !1369
  %868 = add nsw i32 %866, %864, !llfi_index !1370
  %869 = add nsw i32 %867, %865, !llfi_index !1370
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %868, i32 %869)
  store i32 %868, i32* %total, align 4, !llfi_index !1371
  %870 = load i32* %area, align 4, !llfi_index !1372
  %871 = load i32* %area, align 4, !llfi_index !1372
  %872 = sub nsw i32 %870, 100, !llfi_index !1373
  %873 = sub nsw i32 %871, 100, !llfi_index !1373
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %872, i32 %873)
  store i32 %872, i32* %tmp, align 4, !llfi_index !1374
  %874 = load i32* %tmp, align 4, !llfi_index !1375
  %875 = load i32* %tmp, align 4, !llfi_index !1375
  %876 = icmp eq i32 %874, 0, !llfi_index !1376
  %877 = icmp eq i32 %875, 0, !llfi_index !1376
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %876, i1 %877)
  br i1 %876, label %878, label %892, !llfi_index !1377

; <label>:878                                     ; preds = %463
  %879 = load i8** %3, align 8, !llfi_index !1378
  %880 = load i8** %3, align 8, !llfi_index !1378
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %879, i8* %880)
  %881 = load i32* %i, align 4, !llfi_index !1379
  %882 = load i32* %i, align 4, !llfi_index !1379
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %881, i32 %882)
  %883 = load i32* %j, align 4, !llfi_index !1380
  %884 = load i32* %j, align 4, !llfi_index !1380
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %883, i32 %884)
  %885 = load i32* %5, align 4, !llfi_index !1381
  %886 = load i32* %5, align 4, !llfi_index !1381
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %885, i32 %886)
  %887 = call zeroext i8 @median(i8* %879, i32 %881, i32 %883, i32 %885), !llfi_index !1382
  %888 = load i8** %out, align 8, !llfi_index !1383
  %889 = load i8** %out, align 8, !llfi_index !1383
  %890 = getelementptr inbounds i8* %888, i32 1, !llfi_index !1384
  %891 = getelementptr inbounds i8* %889, i32 1, !llfi_index !1384
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %890, i8* %891)
  store i8* %890, i8** %out, align 8, !llfi_index !1385
  store i8 %887, i8* %888, align 1, !llfi_index !1386
  br label %911, !llfi_index !1387

; <label>:892                                     ; preds = %463
  %893 = load i32* %total, align 4, !llfi_index !1388
  %894 = load i32* %total, align 4, !llfi_index !1388
  %895 = load i32* %centre, align 4, !llfi_index !1389
  %896 = load i32* %centre, align 4, !llfi_index !1389
  %897 = mul nsw i32 %895, 100, !llfi_index !1390
  %898 = mul nsw i32 %896, 100, !llfi_index !1390
  %899 = sub nsw i32 %893, %897, !llfi_index !1391
  %900 = sub nsw i32 %894, %898, !llfi_index !1391
  %901 = load i32* %tmp, align 4, !llfi_index !1392
  %902 = load i32* %tmp, align 4, !llfi_index !1392
  %903 = sdiv i32 %899, %901, !llfi_index !1393
  %904 = sdiv i32 %900, %902, !llfi_index !1393
  %905 = trunc i32 %903 to i8, !llfi_index !1394
  %906 = trunc i32 %904 to i8, !llfi_index !1394
  call void bitcast (void (i64, i64)* @global_add to void (i8, i8)*)(i8 %905, i8 %906)
  %907 = load i8** %out, align 8, !llfi_index !1395
  %908 = load i8** %out, align 8, !llfi_index !1395
  %909 = getelementptr inbounds i8* %907, i32 1, !llfi_index !1396
  %910 = getelementptr inbounds i8* %908, i32 1, !llfi_index !1396
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %909, i8* %910)
  store i8* %909, i8** %out, align 8, !llfi_index !1397
  store i8 %905, i8* %907, align 1, !llfi_index !1398
  br label %911, !llfi_index !1399

; <label>:911                                     ; preds = %892, %878
  br label %912, !llfi_index !1400

; <label>:912                                     ; preds = %911
  %913 = load i32* %j, align 4, !llfi_index !1401
  %914 = load i32* %j, align 4, !llfi_index !1401
  %915 = add nsw i32 %913, 1, !llfi_index !1402
  %916 = add nsw i32 %914, 1, !llfi_index !1402
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %915, i32 %916)
  store i32 %915, i32* %j, align 4, !llfi_index !1403
  br label %454, !llfi_index !1404

; <label>:917                                     ; preds = %454
  br label %918, !llfi_index !1405

; <label>:918                                     ; preds = %917
  %919 = load i32* %i, align 4, !llfi_index !1406
  %920 = load i32* %i, align 4, !llfi_index !1406
  %921 = add nsw i32 %919, 1, !llfi_index !1407
  %922 = add nsw i32 %920, 1, !llfi_index !1407
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %921, i32 %922)
  store i32 %921, i32* %i, align 4, !llfi_index !1408
  br label %444, !llfi_index !1409

; <label>:923                                     ; preds = %444
  br label %924, !llfi_index !1410

; <label>:924                                     ; preds = %923, %442
  ret void, !llfi_index !1411
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4, !llfi_index !1412
  %2 = alloca i32, align 4, !llfi_index !1413
  %3 = alloca i8**, align 8, !llfi_index !1414
  %ofp = alloca %struct._IO_FILE*, align 8, !llfi_index !1415
  %filename = alloca [80 x i8], align 16, !llfi_index !1416
  %tcp = alloca i8*, align 8, !llfi_index !1417
  %in = alloca i8*, align 8, !llfi_index !1418
  %bp = alloca i8*, align 8, !llfi_index !1419
  %mid = alloca i8*, align 8, !llfi_index !1420
  %dt = alloca float, align 4, !llfi_index !1421
  %r = alloca i32*, align 8, !llfi_index !1422
  %argindex = alloca i32, align 4, !llfi_index !1423
  %bt = alloca i32, align 4, !llfi_index !1424
  %principle = alloca i32, align 4, !llfi_index !1425
  %thin_post_proc = alloca i32, align 4, !llfi_index !1426
  %three_by_three = alloca i32, align 4, !llfi_index !1427
  %drawing_mode = alloca i32, align 4, !llfi_index !1428
  %susan_quick = alloca i32, align 4, !llfi_index !1429
  %max_no_corners = alloca i32, align 4, !llfi_index !1430
  %max_no_edges = alloca i32, align 4, !llfi_index !1431
  %mode = alloca i32, align 4, !llfi_index !1432
  %i = alloca i32, align 4, !llfi_index !1433
  %x_size = alloca i32, align 4, !llfi_index !1434
  %y_size = alloca i32, align 4, !llfi_index !1435
  %corner_list = alloca [15000 x %struct.anon], align 16, !llfi_index !1436
  store i32 0, i32* %1, !llfi_index !1437
  store i32 %argc, i32* %2, align 4, !llfi_index !1438
  store i8** %argv, i8*** %3, align 8, !llfi_index !1439
  store float 4.000000e+00, float* %dt, align 4, !llfi_index !1440
  store i32 3, i32* %argindex, align 4, !llfi_index !1441
  store i32 20, i32* %bt, align 4, !llfi_index !1442
  store i32 0, i32* %principle, align 4, !llfi_index !1443
  store i32 1, i32* %thin_post_proc, align 4, !llfi_index !1444
  store i32 0, i32* %three_by_three, align 4, !llfi_index !1445
  store i32 0, i32* %drawing_mode, align 4, !llfi_index !1446
  store i32 0, i32* %susan_quick, align 4, !llfi_index !1447
  store i32 1850, i32* %max_no_corners, align 4, !llfi_index !1448
  store i32 2650, i32* %max_no_edges, align 4, !llfi_index !1449
  store i32 0, i32* %mode, align 4, !llfi_index !1450
  %4 = load i32* %2, align 4, !llfi_index !1451
  %5 = load i32* %2, align 4, !llfi_index !1451
  %6 = icmp slt i32 %4, 3, !llfi_index !1452
  %7 = icmp slt i32 %5, 3, !llfi_index !1452
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %6, i1 %7)
  br i1 %6, label %8, label %10, !llfi_index !1453

; <label>:8                                       ; preds = %0
  %9 = call i32 @usage(), !llfi_index !1454
  br label %10, !llfi_index !1455

; <label>:10                                      ; preds = %8, %0
  %11 = load i8*** %3, align 8, !llfi_index !1456
  %12 = load i8*** %3, align 8, !llfi_index !1456
  %13 = getelementptr inbounds i8** %11, i64 1, !llfi_index !1457
  %14 = getelementptr inbounds i8** %12, i64 1, !llfi_index !1457
  %15 = load i8** %13, align 8, !llfi_index !1458
  %16 = load i8** %14, align 8, !llfi_index !1458
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %15, i8* %16)
  call void @get_image(i8* %15, i8** %in, i32* %x_size, i32* %y_size), !llfi_index !1459
  br label %17, !llfi_index !1460

; <label>:17                                      ; preds = %117, %10
  %18 = load i32* %argindex, align 4, !llfi_index !1461
  %19 = load i32* %argindex, align 4, !llfi_index !1461
  %20 = load i32* %2, align 4, !llfi_index !1462
  %21 = load i32* %2, align 4, !llfi_index !1462
  %22 = icmp slt i32 %18, %20, !llfi_index !1463
  %23 = icmp slt i32 %19, %21, !llfi_index !1463
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %22, i1 %23)
  br i1 %22, label %24, label %122, !llfi_index !1464

; <label>:24                                      ; preds = %17
  %25 = load i32* %argindex, align 4, !llfi_index !1465
  %26 = load i32* %argindex, align 4, !llfi_index !1465
  %27 = sext i32 %25 to i64, !llfi_index !1466
  %28 = sext i32 %26 to i64, !llfi_index !1466
  %29 = load i8*** %3, align 8, !llfi_index !1467
  %30 = load i8*** %3, align 8, !llfi_index !1467
  %31 = getelementptr inbounds i8** %29, i64 %27, !llfi_index !1468
  %32 = getelementptr inbounds i8** %30, i64 %28, !llfi_index !1468
  %33 = load i8** %31, align 8, !llfi_index !1469
  %34 = load i8** %32, align 8, !llfi_index !1469
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %33, i8* %34)
  store i8* %33, i8** %tcp, align 8, !llfi_index !1470
  %35 = load i8** %tcp, align 8, !llfi_index !1471
  %36 = load i8** %tcp, align 8, !llfi_index !1471
  %37 = load i8* %35, align 1, !llfi_index !1472
  %38 = load i8* %36, align 1, !llfi_index !1472
  %39 = sext i8 %37 to i32, !llfi_index !1473
  %40 = sext i8 %38 to i32, !llfi_index !1473
  %41 = icmp eq i32 %39, 45, !llfi_index !1474
  %42 = icmp eq i32 %40, 45, !llfi_index !1474
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %41, i1 %42)
  br i1 %41, label %43, label %115, !llfi_index !1475

; <label>:43                                      ; preds = %24
  %44 = load i8** %tcp, align 8, !llfi_index !1476
  %45 = load i8** %tcp, align 8, !llfi_index !1476
  %46 = getelementptr inbounds i8* %44, i32 1, !llfi_index !1477
  %47 = getelementptr inbounds i8* %45, i32 1, !llfi_index !1477
  store i8* %46, i8** %tcp, align 8, !llfi_index !1478
  %48 = load i8* %46, align 1, !llfi_index !1479
  %49 = load i8* %47, align 1, !llfi_index !1479
  %50 = sext i8 %48 to i32, !llfi_index !1480
  %51 = sext i8 %49 to i32, !llfi_index !1480
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %50, i32 %51)
  switch i32 %50, label %114 [
    i32 115, label %52
    i32 101, label %53
    i32 99, label %54
    i32 112, label %55
    i32 110, label %56
    i32 98, label %57
    i32 51, label %58
    i32 113, label %59
    i32 100, label %60
    i32 116, label %91
  ], !llfi_index !1481

; <label>:52                                      ; preds = %43
  store i32 0, i32* %mode, align 4, !llfi_index !1482
  br label %114, !llfi_index !1483

; <label>:53                                      ; preds = %43
  store i32 1, i32* %mode, align 4, !llfi_index !1484
  br label %114, !llfi_index !1485

; <label>:54                                      ; preds = %43
  store i32 2, i32* %mode, align 4, !llfi_index !1486
  br label %114, !llfi_index !1487

; <label>:55                                      ; preds = %43
  store i32 1, i32* %principle, align 4, !llfi_index !1488
  br label %114, !llfi_index !1489

; <label>:56                                      ; preds = %43
  store i32 0, i32* %thin_post_proc, align 4, !llfi_index !1490
  br label %114, !llfi_index !1491

; <label>:57                                      ; preds = %43
  store i32 1, i32* %drawing_mode, align 4, !llfi_index !1492
  br label %114, !llfi_index !1493

; <label>:58                                      ; preds = %43
  store i32 1, i32* %three_by_three, align 4, !llfi_index !1494
  br label %114, !llfi_index !1495

; <label>:59                                      ; preds = %43
  store i32 1, i32* %susan_quick, align 4, !llfi_index !1496
  br label %114, !llfi_index !1497

; <label>:60                                      ; preds = %43
  %61 = load i32* %argindex, align 4, !llfi_index !1498
  %62 = load i32* %argindex, align 4, !llfi_index !1498
  %63 = add nsw i32 %61, 1, !llfi_index !1499
  %64 = add nsw i32 %62, 1, !llfi_index !1499
  store i32 %63, i32* %argindex, align 4, !llfi_index !1500
  %65 = load i32* %2, align 4, !llfi_index !1501
  %66 = load i32* %2, align 4, !llfi_index !1501
  %67 = icmp sge i32 %63, %65, !llfi_index !1502
  %68 = icmp sge i32 %64, %66, !llfi_index !1502
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %67, i1 %68)
  br i1 %67, label %69, label %71, !llfi_index !1503

; <label>:69                                      ; preds = %60
  %70 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str29, i32 0, i32 0)), !llfi_index !1504
  call void @global_check()
  call void @exit(i32 0) #6, !llfi_index !1505
  unreachable, !llfi_index !1506

; <label>:71                                      ; preds = %60
  %72 = load i32* %argindex, align 4, !llfi_index !1507
  %73 = load i32* %argindex, align 4, !llfi_index !1507
  %74 = sext i32 %72 to i64, !llfi_index !1508
  %75 = sext i32 %73 to i64, !llfi_index !1508
  %76 = load i8*** %3, align 8, !llfi_index !1509
  %77 = load i8*** %3, align 8, !llfi_index !1509
  %78 = getelementptr inbounds i8** %76, i64 %74, !llfi_index !1510
  %79 = getelementptr inbounds i8** %77, i64 %75, !llfi_index !1510
  %80 = load i8** %78, align 8, !llfi_index !1511
  %81 = load i8** %79, align 8, !llfi_index !1511
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %80, i8* %81)
  %82 = call double @atof(i8* %80) #7, !llfi_index !1512
  %83 = fptrunc double %82 to float, !llfi_index !1513
  %84 = fptrunc double %82 to float, !llfi_index !1513
  call void bitcast (void (i64, i64)* @global_add to void (float, float)*)(float %83, float %84)
  store float %83, float* %dt, align 4, !llfi_index !1514
  %85 = load float* %dt, align 4, !llfi_index !1515
  %86 = load float* %dt, align 4, !llfi_index !1515
  %87 = fcmp olt float %85, 0.000000e+00, !llfi_index !1516
  %88 = fcmp olt float %86, 0.000000e+00, !llfi_index !1516
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %87, i1 %88)
  br i1 %87, label %89, label %90, !llfi_index !1517

; <label>:89                                      ; preds = %71
  store i32 1, i32* %three_by_three, align 4, !llfi_index !1518
  br label %90, !llfi_index !1519

; <label>:90                                      ; preds = %89, %71
  br label %114, !llfi_index !1520

; <label>:91                                      ; preds = %43
  %92 = load i32* %argindex, align 4, !llfi_index !1521
  %93 = load i32* %argindex, align 4, !llfi_index !1521
  %94 = add nsw i32 %92, 1, !llfi_index !1522
  %95 = add nsw i32 %93, 1, !llfi_index !1522
  store i32 %94, i32* %argindex, align 4, !llfi_index !1523
  %96 = load i32* %2, align 4, !llfi_index !1524
  %97 = load i32* %2, align 4, !llfi_index !1524
  %98 = icmp sge i32 %94, %96, !llfi_index !1525
  %99 = icmp sge i32 %95, %97, !llfi_index !1525
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %98, i1 %99)
  br i1 %98, label %100, label %102, !llfi_index !1526

; <label>:100                                     ; preds = %91
  %101 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str30, i32 0, i32 0)), !llfi_index !1527
  call void @global_check()
  call void @exit(i32 0) #6, !llfi_index !1528
  unreachable, !llfi_index !1529

; <label>:102                                     ; preds = %91
  %103 = load i32* %argindex, align 4, !llfi_index !1530
  %104 = load i32* %argindex, align 4, !llfi_index !1530
  %105 = sext i32 %103 to i64, !llfi_index !1531
  %106 = sext i32 %104 to i64, !llfi_index !1531
  %107 = load i8*** %3, align 8, !llfi_index !1532
  %108 = load i8*** %3, align 8, !llfi_index !1532
  %109 = getelementptr inbounds i8** %107, i64 %105, !llfi_index !1533
  %110 = getelementptr inbounds i8** %108, i64 %106, !llfi_index !1533
  %111 = load i8** %109, align 8, !llfi_index !1534
  %112 = load i8** %110, align 8, !llfi_index !1534
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %111, i8* %112)
  %113 = call i32 @atoi(i8* %111) #7, !llfi_index !1535
  store i32 %113, i32* %bt, align 4, !llfi_index !1536
  br label %114, !llfi_index !1537

; <label>:114                                     ; preds = %102, %90, %59, %58, %57, %56, %55, %54, %53, %52, %43
  br label %117, !llfi_index !1538

; <label>:115                                     ; preds = %24
  %116 = call i32 @usage(), !llfi_index !1539
  br label %117, !llfi_index !1540

; <label>:117                                     ; preds = %115, %114
  %118 = load i32* %argindex, align 4, !llfi_index !1541
  %119 = load i32* %argindex, align 4, !llfi_index !1541
  %120 = add nsw i32 %118, 1, !llfi_index !1542
  %121 = add nsw i32 %119, 1, !llfi_index !1542
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %120, i32 %121)
  store i32 %120, i32* %argindex, align 4, !llfi_index !1543
  br label %17, !llfi_index !1544

; <label>:122                                     ; preds = %17
  %123 = load i32* %principle, align 4, !llfi_index !1545
  %124 = load i32* %principle, align 4, !llfi_index !1545
  %125 = icmp eq i32 %123, 1, !llfi_index !1546
  %126 = icmp eq i32 %124, 1, !llfi_index !1546
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %125, i1 %126)
  br i1 %125, label %127, label %133, !llfi_index !1547

; <label>:127                                     ; preds = %122
  %128 = load i32* %mode, align 4, !llfi_index !1548
  %129 = load i32* %mode, align 4, !llfi_index !1548
  %130 = icmp eq i32 %128, 0, !llfi_index !1549
  %131 = icmp eq i32 %129, 0, !llfi_index !1549
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %130, i1 %131)
  br i1 %130, label %132, label %133, !llfi_index !1550

; <label>:132                                     ; preds = %127
  store i32 1, i32* %mode, align 4, !llfi_index !1551
  br label %133, !llfi_index !1552

; <label>:133                                     ; preds = %132, %127, %122
  %134 = load i32* %mode, align 4, !llfi_index !1553
  %135 = load i32* %mode, align 4, !llfi_index !1553
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %134, i32 %135)
  switch i32 %134, label %157 [
    i32 0, label %136
    i32 1, label %153
    i32 2, label %155
  ], !llfi_index !1554

; <label>:136                                     ; preds = %133
  %137 = load i32* %bt, align 4, !llfi_index !1555
  %138 = load i32* %bt, align 4, !llfi_index !1555
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %137, i32 %138)
  call void @setup_brightness_lut(i8** %bp, i32 %137, i32 2), !llfi_index !1556
  %139 = load i32* %three_by_three, align 4, !llfi_index !1557
  %140 = load i32* %three_by_three, align 4, !llfi_index !1557
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %139, i32 %140)
  %141 = load i8** %in, align 8, !llfi_index !1558
  %142 = load i8** %in, align 8, !llfi_index !1558
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %141, i8* %142)
  %143 = load float* %dt, align 4, !llfi_index !1559
  %144 = load float* %dt, align 4, !llfi_index !1559
  %145 = fpext float %143 to double, !llfi_index !1560
  %146 = fpext float %144 to double, !llfi_index !1560
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %145, double %146)
  %147 = load i32* %x_size, align 4, !llfi_index !1561
  %148 = load i32* %x_size, align 4, !llfi_index !1561
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %147, i32 %148)
  %149 = load i32* %y_size, align 4, !llfi_index !1562
  %150 = load i32* %y_size, align 4, !llfi_index !1562
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %149, i32 %150)
  %151 = load i8** %bp, align 8, !llfi_index !1563
  %152 = load i8** %bp, align 8, !llfi_index !1563
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %151, i8* %152)
  call void @susan_smoothing(i32 %139, i8* %141, double %145, i32 %147, i32 %149, i8* %151), !llfi_index !1564
  br label %157, !llfi_index !1565

; <label>:153                                     ; preds = %133
  %154 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str31, i32 0, i32 0)), !llfi_index !1566
  br label %157, !llfi_index !1567

; <label>:155                                     ; preds = %133
  %156 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str32, i32 0, i32 0)), !llfi_index !1568
  br label %157, !llfi_index !1569

; <label>:157                                     ; preds = %155, %153, %136, %133
  %158 = load i8*** %3, align 8, !llfi_index !1570
  %159 = load i8*** %3, align 8, !llfi_index !1570
  %160 = getelementptr inbounds i8** %158, i64 2, !llfi_index !1571
  %161 = getelementptr inbounds i8** %159, i64 2, !llfi_index !1571
  %162 = load i8** %160, align 8, !llfi_index !1572
  %163 = load i8** %161, align 8, !llfi_index !1572
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %162, i8* %163)
  %164 = load i8** %in, align 8, !llfi_index !1573
  %165 = load i8** %in, align 8, !llfi_index !1573
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %164, i8* %165)
  %166 = load i32* %x_size, align 4, !llfi_index !1574
  %167 = load i32* %x_size, align 4, !llfi_index !1574
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %166, i32 %167)
  %168 = load i32* %y_size, align 4, !llfi_index !1575
  %169 = load i32* %y_size, align 4, !llfi_index !1575
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %168, i32 %169)
  %170 = call i32 @put_image(i8* %162, i8* %164, i32 %166, i32 %168), !llfi_index !1576
  %171 = load i32* %1, !llfi_index !1577
  %172 = load i32* %1, !llfi_index !1577
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %171, i32 %172)
  call void @global_check()
  ret i32 %171, !llfi_index !1578
}

; Function Attrs: nounwind readonly
declare double @atof(i8*) #5

; Function Attrs: nounwind readonly
declare i32 @atoi(i8*) #5

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
  call void @exit(i32 99) #6
  unreachable

; <label>:5                                       ; preds = %0
  ret void
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { noreturn nounwind }
attributes #7 = { nounwind readonly }

!llvm.ident = !{!0, !0}

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
!913 = metadata !{i64 913}
!914 = metadata !{i64 914}
!915 = metadata !{i64 915}
!916 = metadata !{i64 916}
!917 = metadata !{i64 917}
!918 = metadata !{i64 918}
!919 = metadata !{i64 919}
!920 = metadata !{i64 920}
!921 = metadata !{i64 921}
!922 = metadata !{i64 922}
!923 = metadata !{i64 923}
!924 = metadata !{i64 924}
!925 = metadata !{i64 925}
!926 = metadata !{i64 926}
!927 = metadata !{i64 927}
!928 = metadata !{i64 928}
!929 = metadata !{i64 929}
!930 = metadata !{i64 930}
!931 = metadata !{i64 931}
!932 = metadata !{i64 932}
!933 = metadata !{i64 933}
!934 = metadata !{i64 934}
!935 = metadata !{i64 935}
!936 = metadata !{i64 936}
!937 = metadata !{i64 937}
!938 = metadata !{i64 938}
!939 = metadata !{i64 939}
!940 = metadata !{i64 940}
!941 = metadata !{i64 941}
!942 = metadata !{i64 942}
!943 = metadata !{i64 943}
!944 = metadata !{i64 944}
!945 = metadata !{i64 945}
!946 = metadata !{i64 946}
!947 = metadata !{i64 947}
!948 = metadata !{i64 948}
!949 = metadata !{i64 949}
!950 = metadata !{i64 950}
!951 = metadata !{i64 951}
!952 = metadata !{i64 952}
!953 = metadata !{i64 953}
!954 = metadata !{i64 954}
!955 = metadata !{i64 955}
!956 = metadata !{i64 956}
!957 = metadata !{i64 957}
!958 = metadata !{i64 958}
!959 = metadata !{i64 959}
!960 = metadata !{i64 960}
!961 = metadata !{i64 961}
!962 = metadata !{i64 962}
!963 = metadata !{i64 963}
!964 = metadata !{i64 964}
!965 = metadata !{i64 965}
!966 = metadata !{i64 966}
!967 = metadata !{i64 967}
!968 = metadata !{i64 968}
!969 = metadata !{i64 969}
!970 = metadata !{i64 970}
!971 = metadata !{i64 971}
!972 = metadata !{i64 972}
!973 = metadata !{i64 973}
!974 = metadata !{i64 974}
!975 = metadata !{i64 975}
!976 = metadata !{i64 976}
!977 = metadata !{i64 977}
!978 = metadata !{i64 978}
!979 = metadata !{i64 979}
!980 = metadata !{i64 980}
!981 = metadata !{i64 981}
!982 = metadata !{i64 982}
!983 = metadata !{i64 983}
!984 = metadata !{i64 984}
!985 = metadata !{i64 985}
!986 = metadata !{i64 986}
!987 = metadata !{i64 987}
!988 = metadata !{i64 988}
!989 = metadata !{i64 989}
!990 = metadata !{i64 990}
!991 = metadata !{i64 991}
!992 = metadata !{i64 992}
!993 = metadata !{i64 993}
!994 = metadata !{i64 994}
!995 = metadata !{i64 995}
!996 = metadata !{i64 996}
!997 = metadata !{i64 997}
!998 = metadata !{i64 998}
!999 = metadata !{i64 999}
!1000 = metadata !{i64 1000}
!1001 = metadata !{i64 1001}
!1002 = metadata !{i64 1002}
!1003 = metadata !{i64 1003}
!1004 = metadata !{i64 1004}
!1005 = metadata !{i64 1005}
!1006 = metadata !{i64 1006}
!1007 = metadata !{i64 1007}
!1008 = metadata !{i64 1008}
!1009 = metadata !{i64 1009}
!1010 = metadata !{i64 1010}
!1011 = metadata !{i64 1011}
!1012 = metadata !{i64 1012}
!1013 = metadata !{i64 1013}
!1014 = metadata !{i64 1014}
!1015 = metadata !{i64 1015}
!1016 = metadata !{i64 1016}
!1017 = metadata !{i64 1017}
!1018 = metadata !{i64 1018}
!1019 = metadata !{i64 1019}
!1020 = metadata !{i64 1020}
!1021 = metadata !{i64 1021}
!1022 = metadata !{i64 1022}
!1023 = metadata !{i64 1023}
!1024 = metadata !{i64 1024}
!1025 = metadata !{i64 1025}
!1026 = metadata !{i64 1026}
!1027 = metadata !{i64 1027}
!1028 = metadata !{i64 1028}
!1029 = metadata !{i64 1029}
!1030 = metadata !{i64 1030}
!1031 = metadata !{i64 1031}
!1032 = metadata !{i64 1032}
!1033 = metadata !{i64 1033}
!1034 = metadata !{i64 1034}
!1035 = metadata !{i64 1035}
!1036 = metadata !{i64 1036}
!1037 = metadata !{i64 1037}
!1038 = metadata !{i64 1038}
!1039 = metadata !{i64 1039}
!1040 = metadata !{i64 1040}
!1041 = metadata !{i64 1041}
!1042 = metadata !{i64 1042}
!1043 = metadata !{i64 1043}
!1044 = metadata !{i64 1044}
!1045 = metadata !{i64 1045}
!1046 = metadata !{i64 1046}
!1047 = metadata !{i64 1047}
!1048 = metadata !{i64 1048}
!1049 = metadata !{i64 1049}
!1050 = metadata !{i64 1050}
!1051 = metadata !{i64 1051}
!1052 = metadata !{i64 1052}
!1053 = metadata !{i64 1053}
!1054 = metadata !{i64 1054}
!1055 = metadata !{i64 1055}
!1056 = metadata !{i64 1056}
!1057 = metadata !{i64 1057}
!1058 = metadata !{i64 1058}
!1059 = metadata !{i64 1059}
!1060 = metadata !{i64 1060}
!1061 = metadata !{i64 1061}
!1062 = metadata !{i64 1062}
!1063 = metadata !{i64 1063}
!1064 = metadata !{i64 1064}
!1065 = metadata !{i64 1065}
!1066 = metadata !{i64 1066}
!1067 = metadata !{i64 1067}
!1068 = metadata !{i64 1068}
!1069 = metadata !{i64 1069}
!1070 = metadata !{i64 1070}
!1071 = metadata !{i64 1071}
!1072 = metadata !{i64 1072}
!1073 = metadata !{i64 1073}
!1074 = metadata !{i64 1074}
!1075 = metadata !{i64 1075}
!1076 = metadata !{i64 1076}
!1077 = metadata !{i64 1077}
!1078 = metadata !{i64 1078}
!1079 = metadata !{i64 1079}
!1080 = metadata !{i64 1080}
!1081 = metadata !{i64 1081}
!1082 = metadata !{i64 1082}
!1083 = metadata !{i64 1083}
!1084 = metadata !{i64 1084}
!1085 = metadata !{i64 1085}
!1086 = metadata !{i64 1086}
!1087 = metadata !{i64 1087}
!1088 = metadata !{i64 1088}
!1089 = metadata !{i64 1089}
!1090 = metadata !{i64 1090}
!1091 = metadata !{i64 1091}
!1092 = metadata !{i64 1092}
!1093 = metadata !{i64 1093}
!1094 = metadata !{i64 1094}
!1095 = metadata !{i64 1095}
!1096 = metadata !{i64 1096}
!1097 = metadata !{i64 1097}
!1098 = metadata !{i64 1098}
!1099 = metadata !{i64 1099}
!1100 = metadata !{i64 1100}
!1101 = metadata !{i64 1101}
!1102 = metadata !{i64 1102}
!1103 = metadata !{i64 1103}
!1104 = metadata !{i64 1104}
!1105 = metadata !{i64 1105}
!1106 = metadata !{i64 1106}
!1107 = metadata !{i64 1107}
!1108 = metadata !{i64 1108}
!1109 = metadata !{i64 1109}
!1110 = metadata !{i64 1110}
!1111 = metadata !{i64 1111}
!1112 = metadata !{i64 1112}
!1113 = metadata !{i64 1113}
!1114 = metadata !{i64 1114}
!1115 = metadata !{i64 1115}
!1116 = metadata !{i64 1116}
!1117 = metadata !{i64 1117}
!1118 = metadata !{i64 1118}
!1119 = metadata !{i64 1119}
!1120 = metadata !{i64 1120}
!1121 = metadata !{i64 1121}
!1122 = metadata !{i64 1122}
!1123 = metadata !{i64 1123}
!1124 = metadata !{i64 1124}
!1125 = metadata !{i64 1125}
!1126 = metadata !{i64 1126}
!1127 = metadata !{i64 1127}
!1128 = metadata !{i64 1128}
!1129 = metadata !{i64 1129}
!1130 = metadata !{i64 1130}
!1131 = metadata !{i64 1131}
!1132 = metadata !{i64 1132}
!1133 = metadata !{i64 1133}
!1134 = metadata !{i64 1134}
!1135 = metadata !{i64 1135}
!1136 = metadata !{i64 1136}
!1137 = metadata !{i64 1137}
!1138 = metadata !{i64 1138}
!1139 = metadata !{i64 1139}
!1140 = metadata !{i64 1140}
!1141 = metadata !{i64 1141}
!1142 = metadata !{i64 1142}
!1143 = metadata !{i64 1143}
!1144 = metadata !{i64 1144}
!1145 = metadata !{i64 1145}
!1146 = metadata !{i64 1146}
!1147 = metadata !{i64 1147}
!1148 = metadata !{i64 1148}
!1149 = metadata !{i64 1149}
!1150 = metadata !{i64 1150}
!1151 = metadata !{i64 1151}
!1152 = metadata !{i64 1152}
!1153 = metadata !{i64 1153}
!1154 = metadata !{i64 1154}
!1155 = metadata !{i64 1155}
!1156 = metadata !{i64 1156}
!1157 = metadata !{i64 1157}
!1158 = metadata !{i64 1158}
!1159 = metadata !{i64 1159}
!1160 = metadata !{i64 1160}
!1161 = metadata !{i64 1161}
!1162 = metadata !{i64 1162}
!1163 = metadata !{i64 1163}
!1164 = metadata !{i64 1164}
!1165 = metadata !{i64 1165}
!1166 = metadata !{i64 1166}
!1167 = metadata !{i64 1167}
!1168 = metadata !{i64 1168}
!1169 = metadata !{i64 1169}
!1170 = metadata !{i64 1170}
!1171 = metadata !{i64 1171}
!1172 = metadata !{i64 1172}
!1173 = metadata !{i64 1173}
!1174 = metadata !{i64 1174}
!1175 = metadata !{i64 1175}
!1176 = metadata !{i64 1176}
!1177 = metadata !{i64 1177}
!1178 = metadata !{i64 1178}
!1179 = metadata !{i64 1179}
!1180 = metadata !{i64 1180}
!1181 = metadata !{i64 1181}
!1182 = metadata !{i64 1182}
!1183 = metadata !{i64 1183}
!1184 = metadata !{i64 1184}
!1185 = metadata !{i64 1185}
!1186 = metadata !{i64 1186}
!1187 = metadata !{i64 1187}
!1188 = metadata !{i64 1188}
!1189 = metadata !{i64 1189}
!1190 = metadata !{i64 1190}
!1191 = metadata !{i64 1191}
!1192 = metadata !{i64 1192}
!1193 = metadata !{i64 1193}
!1194 = metadata !{i64 1194}
!1195 = metadata !{i64 1195}
!1196 = metadata !{i64 1196}
!1197 = metadata !{i64 1197}
!1198 = metadata !{i64 1198}
!1199 = metadata !{i64 1199}
!1200 = metadata !{i64 1200}
!1201 = metadata !{i64 1201}
!1202 = metadata !{i64 1202}
!1203 = metadata !{i64 1203}
!1204 = metadata !{i64 1204}
!1205 = metadata !{i64 1205}
!1206 = metadata !{i64 1206}
!1207 = metadata !{i64 1207}
!1208 = metadata !{i64 1208}
!1209 = metadata !{i64 1209}
!1210 = metadata !{i64 1210}
!1211 = metadata !{i64 1211}
!1212 = metadata !{i64 1212}
!1213 = metadata !{i64 1213}
!1214 = metadata !{i64 1214}
!1215 = metadata !{i64 1215}
!1216 = metadata !{i64 1216}
!1217 = metadata !{i64 1217}
!1218 = metadata !{i64 1218}
!1219 = metadata !{i64 1219}
!1220 = metadata !{i64 1220}
!1221 = metadata !{i64 1221}
!1222 = metadata !{i64 1222}
!1223 = metadata !{i64 1223}
!1224 = metadata !{i64 1224}
!1225 = metadata !{i64 1225}
!1226 = metadata !{i64 1226}
!1227 = metadata !{i64 1227}
!1228 = metadata !{i64 1228}
!1229 = metadata !{i64 1229}
!1230 = metadata !{i64 1230}
!1231 = metadata !{i64 1231}
!1232 = metadata !{i64 1232}
!1233 = metadata !{i64 1233}
!1234 = metadata !{i64 1234}
!1235 = metadata !{i64 1235}
!1236 = metadata !{i64 1236}
!1237 = metadata !{i64 1237}
!1238 = metadata !{i64 1238}
!1239 = metadata !{i64 1239}
!1240 = metadata !{i64 1240}
!1241 = metadata !{i64 1241}
!1242 = metadata !{i64 1242}
!1243 = metadata !{i64 1243}
!1244 = metadata !{i64 1244}
!1245 = metadata !{i64 1245}
!1246 = metadata !{i64 1246}
!1247 = metadata !{i64 1247}
!1248 = metadata !{i64 1248}
!1249 = metadata !{i64 1249}
!1250 = metadata !{i64 1250}
!1251 = metadata !{i64 1251}
!1252 = metadata !{i64 1252}
!1253 = metadata !{i64 1253}
!1254 = metadata !{i64 1254}
!1255 = metadata !{i64 1255}
!1256 = metadata !{i64 1256}
!1257 = metadata !{i64 1257}
!1258 = metadata !{i64 1258}
!1259 = metadata !{i64 1259}
!1260 = metadata !{i64 1260}
!1261 = metadata !{i64 1261}
!1262 = metadata !{i64 1262}
!1263 = metadata !{i64 1263}
!1264 = metadata !{i64 1264}
!1265 = metadata !{i64 1265}
!1266 = metadata !{i64 1266}
!1267 = metadata !{i64 1267}
!1268 = metadata !{i64 1268}
!1269 = metadata !{i64 1269}
!1270 = metadata !{i64 1270}
!1271 = metadata !{i64 1271}
!1272 = metadata !{i64 1272}
!1273 = metadata !{i64 1273}
!1274 = metadata !{i64 1274}
!1275 = metadata !{i64 1275}
!1276 = metadata !{i64 1276}
!1277 = metadata !{i64 1277}
!1278 = metadata !{i64 1278}
!1279 = metadata !{i64 1279}
!1280 = metadata !{i64 1280}
!1281 = metadata !{i64 1281}
!1282 = metadata !{i64 1282}
!1283 = metadata !{i64 1283}
!1284 = metadata !{i64 1284}
!1285 = metadata !{i64 1285}
!1286 = metadata !{i64 1286}
!1287 = metadata !{i64 1287}
!1288 = metadata !{i64 1288}
!1289 = metadata !{i64 1289}
!1290 = metadata !{i64 1290}
!1291 = metadata !{i64 1291}
!1292 = metadata !{i64 1292}
!1293 = metadata !{i64 1293}
!1294 = metadata !{i64 1294}
!1295 = metadata !{i64 1295}
!1296 = metadata !{i64 1296}
!1297 = metadata !{i64 1297}
!1298 = metadata !{i64 1298}
!1299 = metadata !{i64 1299}
!1300 = metadata !{i64 1300}
!1301 = metadata !{i64 1301}
!1302 = metadata !{i64 1302}
!1303 = metadata !{i64 1303}
!1304 = metadata !{i64 1304}
!1305 = metadata !{i64 1305}
!1306 = metadata !{i64 1306}
!1307 = metadata !{i64 1307}
!1308 = metadata !{i64 1308}
!1309 = metadata !{i64 1309}
!1310 = metadata !{i64 1310}
!1311 = metadata !{i64 1311}
!1312 = metadata !{i64 1312}
!1313 = metadata !{i64 1313}
!1314 = metadata !{i64 1314}
!1315 = metadata !{i64 1315}
!1316 = metadata !{i64 1316}
!1317 = metadata !{i64 1317}
!1318 = metadata !{i64 1318}
!1319 = metadata !{i64 1319}
!1320 = metadata !{i64 1320}
!1321 = metadata !{i64 1321}
!1322 = metadata !{i64 1322}
!1323 = metadata !{i64 1323}
!1324 = metadata !{i64 1324}
!1325 = metadata !{i64 1325}
!1326 = metadata !{i64 1326}
!1327 = metadata !{i64 1327}
!1328 = metadata !{i64 1328}
!1329 = metadata !{i64 1329}
!1330 = metadata !{i64 1330}
!1331 = metadata !{i64 1331}
!1332 = metadata !{i64 1332}
!1333 = metadata !{i64 1333}
!1334 = metadata !{i64 1334}
!1335 = metadata !{i64 1335}
!1336 = metadata !{i64 1336}
!1337 = metadata !{i64 1337}
!1338 = metadata !{i64 1338}
!1339 = metadata !{i64 1339}
!1340 = metadata !{i64 1340}
!1341 = metadata !{i64 1341}
!1342 = metadata !{i64 1342}
!1343 = metadata !{i64 1343}
!1344 = metadata !{i64 1344}
!1345 = metadata !{i64 1345}
!1346 = metadata !{i64 1346}
!1347 = metadata !{i64 1347}
!1348 = metadata !{i64 1348}
!1349 = metadata !{i64 1349}
!1350 = metadata !{i64 1350}
!1351 = metadata !{i64 1351}
!1352 = metadata !{i64 1352}
!1353 = metadata !{i64 1353}
!1354 = metadata !{i64 1354}
!1355 = metadata !{i64 1355}
!1356 = metadata !{i64 1356}
!1357 = metadata !{i64 1357}
!1358 = metadata !{i64 1358}
!1359 = metadata !{i64 1359}
!1360 = metadata !{i64 1360}
!1361 = metadata !{i64 1361}
!1362 = metadata !{i64 1362}
!1363 = metadata !{i64 1363}
!1364 = metadata !{i64 1364}
!1365 = metadata !{i64 1365}
!1366 = metadata !{i64 1366}
!1367 = metadata !{i64 1367}
!1368 = metadata !{i64 1368}
!1369 = metadata !{i64 1369}
!1370 = metadata !{i64 1370}
!1371 = metadata !{i64 1371}
!1372 = metadata !{i64 1372}
!1373 = metadata !{i64 1373}
!1374 = metadata !{i64 1374}
!1375 = metadata !{i64 1375}
!1376 = metadata !{i64 1376}
!1377 = metadata !{i64 1377}
!1378 = metadata !{i64 1378}
!1379 = metadata !{i64 1379}
!1380 = metadata !{i64 1380}
!1381 = metadata !{i64 1381}
!1382 = metadata !{i64 1382}
!1383 = metadata !{i64 1383}
!1384 = metadata !{i64 1384}
!1385 = metadata !{i64 1385}
!1386 = metadata !{i64 1386}
!1387 = metadata !{i64 1387}
!1388 = metadata !{i64 1388}
!1389 = metadata !{i64 1389}
!1390 = metadata !{i64 1390}
!1391 = metadata !{i64 1391}
!1392 = metadata !{i64 1392}
!1393 = metadata !{i64 1393}
!1394 = metadata !{i64 1394}
!1395 = metadata !{i64 1395}
!1396 = metadata !{i64 1396}
!1397 = metadata !{i64 1397}
!1398 = metadata !{i64 1398}
!1399 = metadata !{i64 1399}
!1400 = metadata !{i64 1400}
!1401 = metadata !{i64 1401}
!1402 = metadata !{i64 1402}
!1403 = metadata !{i64 1403}
!1404 = metadata !{i64 1404}
!1405 = metadata !{i64 1405}
!1406 = metadata !{i64 1406}
!1407 = metadata !{i64 1407}
!1408 = metadata !{i64 1408}
!1409 = metadata !{i64 1409}
!1410 = metadata !{i64 1410}
!1411 = metadata !{i64 1411}
!1412 = metadata !{i64 1412}
!1413 = metadata !{i64 1413}
!1414 = metadata !{i64 1414}
!1415 = metadata !{i64 1415}
!1416 = metadata !{i64 1416}
!1417 = metadata !{i64 1417}
!1418 = metadata !{i64 1418}
!1419 = metadata !{i64 1419}
!1420 = metadata !{i64 1420}
!1421 = metadata !{i64 1421}
!1422 = metadata !{i64 1422}
!1423 = metadata !{i64 1423}
!1424 = metadata !{i64 1424}
!1425 = metadata !{i64 1425}
!1426 = metadata !{i64 1426}
!1427 = metadata !{i64 1427}
!1428 = metadata !{i64 1428}
!1429 = metadata !{i64 1429}
!1430 = metadata !{i64 1430}
!1431 = metadata !{i64 1431}
!1432 = metadata !{i64 1432}
!1433 = metadata !{i64 1433}
!1434 = metadata !{i64 1434}
!1435 = metadata !{i64 1435}
!1436 = metadata !{i64 1436}
!1437 = metadata !{i64 1437}
!1438 = metadata !{i64 1438}
!1439 = metadata !{i64 1439}
!1440 = metadata !{i64 1440}
!1441 = metadata !{i64 1441}
!1442 = metadata !{i64 1442}
!1443 = metadata !{i64 1443}
!1444 = metadata !{i64 1444}
!1445 = metadata !{i64 1445}
!1446 = metadata !{i64 1446}
!1447 = metadata !{i64 1447}
!1448 = metadata !{i64 1448}
!1449 = metadata !{i64 1449}
!1450 = metadata !{i64 1450}
!1451 = metadata !{i64 1451}
!1452 = metadata !{i64 1452}
!1453 = metadata !{i64 1453}
!1454 = metadata !{i64 1454}
!1455 = metadata !{i64 1455}
!1456 = metadata !{i64 1456}
!1457 = metadata !{i64 1457}
!1458 = metadata !{i64 1458}
!1459 = metadata !{i64 1459}
!1460 = metadata !{i64 1460}
!1461 = metadata !{i64 1461}
!1462 = metadata !{i64 1462}
!1463 = metadata !{i64 1463}
!1464 = metadata !{i64 1464}
!1465 = metadata !{i64 1465}
!1466 = metadata !{i64 1466}
!1467 = metadata !{i64 1467}
!1468 = metadata !{i64 1468}
!1469 = metadata !{i64 1469}
!1470 = metadata !{i64 1470}
!1471 = metadata !{i64 1471}
!1472 = metadata !{i64 1472}
!1473 = metadata !{i64 1473}
!1474 = metadata !{i64 1474}
!1475 = metadata !{i64 1475}
!1476 = metadata !{i64 1476}
!1477 = metadata !{i64 1477}
!1478 = metadata !{i64 1478}
!1479 = metadata !{i64 1479}
!1480 = metadata !{i64 1480}
!1481 = metadata !{i64 1481}
!1482 = metadata !{i64 1482}
!1483 = metadata !{i64 1483}
!1484 = metadata !{i64 1484}
!1485 = metadata !{i64 1485}
!1486 = metadata !{i64 1486}
!1487 = metadata !{i64 1487}
!1488 = metadata !{i64 1488}
!1489 = metadata !{i64 1489}
!1490 = metadata !{i64 1490}
!1491 = metadata !{i64 1491}
!1492 = metadata !{i64 1492}
!1493 = metadata !{i64 1493}
!1494 = metadata !{i64 1494}
!1495 = metadata !{i64 1495}
!1496 = metadata !{i64 1496}
!1497 = metadata !{i64 1497}
!1498 = metadata !{i64 1498}
!1499 = metadata !{i64 1499}
!1500 = metadata !{i64 1500}
!1501 = metadata !{i64 1501}
!1502 = metadata !{i64 1502}
!1503 = metadata !{i64 1503}
!1504 = metadata !{i64 1504}
!1505 = metadata !{i64 1505}
!1506 = metadata !{i64 1506}
!1507 = metadata !{i64 1507}
!1508 = metadata !{i64 1508}
!1509 = metadata !{i64 1509}
!1510 = metadata !{i64 1510}
!1511 = metadata !{i64 1511}
!1512 = metadata !{i64 1512}
!1513 = metadata !{i64 1513}
!1514 = metadata !{i64 1514}
!1515 = metadata !{i64 1515}
!1516 = metadata !{i64 1516}
!1517 = metadata !{i64 1517}
!1518 = metadata !{i64 1518}
!1519 = metadata !{i64 1519}
!1520 = metadata !{i64 1520}
!1521 = metadata !{i64 1521}
!1522 = metadata !{i64 1522}
!1523 = metadata !{i64 1523}
!1524 = metadata !{i64 1524}
!1525 = metadata !{i64 1525}
!1526 = metadata !{i64 1526}
!1527 = metadata !{i64 1527}
!1528 = metadata !{i64 1528}
!1529 = metadata !{i64 1529}
!1530 = metadata !{i64 1530}
!1531 = metadata !{i64 1531}
!1532 = metadata !{i64 1532}
!1533 = metadata !{i64 1533}
!1534 = metadata !{i64 1534}
!1535 = metadata !{i64 1535}
!1536 = metadata !{i64 1536}
!1537 = metadata !{i64 1537}
!1538 = metadata !{i64 1538}
!1539 = metadata !{i64 1539}
!1540 = metadata !{i64 1540}
!1541 = metadata !{i64 1541}
!1542 = metadata !{i64 1542}
!1543 = metadata !{i64 1543}
!1544 = metadata !{i64 1544}
!1545 = metadata !{i64 1545}
!1546 = metadata !{i64 1546}
!1547 = metadata !{i64 1547}
!1548 = metadata !{i64 1548}
!1549 = metadata !{i64 1549}
!1550 = metadata !{i64 1550}
!1551 = metadata !{i64 1551}
!1552 = metadata !{i64 1552}
!1553 = metadata !{i64 1553}
!1554 = metadata !{i64 1554}
!1555 = metadata !{i64 1555}
!1556 = metadata !{i64 1556}
!1557 = metadata !{i64 1557}
!1558 = metadata !{i64 1558}
!1559 = metadata !{i64 1559}
!1560 = metadata !{i64 1560}
!1561 = metadata !{i64 1561}
!1562 = metadata !{i64 1562}
!1563 = metadata !{i64 1563}
!1564 = metadata !{i64 1564}
!1565 = metadata !{i64 1565}
!1566 = metadata !{i64 1566}
!1567 = metadata !{i64 1567}
!1568 = metadata !{i64 1568}
!1569 = metadata !{i64 1569}
!1570 = metadata !{i64 1570}
!1571 = metadata !{i64 1571}
!1572 = metadata !{i64 1572}
!1573 = metadata !{i64 1573}
!1574 = metadata !{i64 1574}
!1575 = metadata !{i64 1575}
!1576 = metadata !{i64 1576}
!1577 = metadata !{i64 1577}
!1578 = metadata !{i64 1578}
