; ModuleID = 'temp2.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._QITEM = type { i32, i32, i32, %struct._QITEM* }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct._NODE = type { i32, i32 }

@qHead = global %struct._QITEM* null, align 8
@g_qCount = global i32 0, align 4
@.str = private unnamed_addr constant [4 x i8] c" %d\00", align 1
@stdout = external global %struct._IO_FILE*
@stderr = external global %struct._IO_FILE*
@.str1 = private unnamed_addr constant [16 x i8] c"Out of memory.\0A\00", align 1
@ch = common global i32 0, align 4
@rgnNodes = common global [100 x %struct._NODE] zeroinitializer, align 16
@.str2 = private unnamed_addr constant [54 x i8] c"Shortest path is 0 in cost. Just stay where you are.\0A\00", align 1
@iNode = common global i32 0, align 4
@iDist = common global i32 0, align 4
@iPrev = common global i32 0, align 4
@i = common global i32 0, align 4
@AdjMatrix = common global [100 x [100 x i32]] zeroinitializer, align 16
@iCost = common global i32 0, align 4
@.str3 = private unnamed_addr constant [30 x i8] c"Shortest path is %d in cost. \00", align 1
@.str4 = private unnamed_addr constant [10 x i8] c"Path is: \00", align 1
@.str5 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str6 = private unnamed_addr constant [28 x i8] c"Usage: dijkstra <filename>\0A\00", align 1
@.str7 = private unnamed_addr constant [41 x i8] c"Only supports matrix size is #define'd.\0A\00", align 1
@.str8 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str9 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@global_var1 = global i64 0, align 8
@global_var2 = global i64 0, align 8

; Function Attrs: nounwind uwtable
define void @print_path(%struct._NODE* %rgnNodes, i32 %chNode) #0 {
  %1 = alloca %struct._NODE*, align 8, !llfi_index !1
  %2 = alloca i32, align 4, !llfi_index !2
  store %struct._NODE* %rgnNodes, %struct._NODE** %1, align 8, !llfi_index !3
  store i32 %chNode, i32* %2, align 4, !llfi_index !4
  %3 = load i32* %2, align 4, !llfi_index !5
  %4 = load i32* %2, align 4, !llfi_index !5
  %5 = sext i32 %3 to i64, !llfi_index !6
  %6 = sext i32 %4 to i64, !llfi_index !6
  %7 = load %struct._NODE** %1, align 8, !llfi_index !7
  %8 = load %struct._NODE** %1, align 8, !llfi_index !7
  %9 = getelementptr inbounds %struct._NODE* %7, i64 %5, !llfi_index !8
  %10 = getelementptr inbounds %struct._NODE* %8, i64 %6, !llfi_index !8
  %11 = getelementptr inbounds %struct._NODE* %9, i32 0, i32 1, !llfi_index !9
  %12 = getelementptr inbounds %struct._NODE* %10, i32 0, i32 1, !llfi_index !9
  %13 = load i32* %11, align 4, !llfi_index !10
  %14 = load i32* %12, align 4, !llfi_index !10
  %15 = icmp ne i32 %13, 9999, !llfi_index !11
  %16 = icmp ne i32 %14, 9999, !llfi_index !11
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %15, i1 %16)
  br i1 %15, label %17, label %32, !llfi_index !12

; <label>:17                                      ; preds = %0
  %18 = load %struct._NODE** %1, align 8, !llfi_index !13
  %19 = load %struct._NODE** %1, align 8, !llfi_index !13
  call void bitcast (void (i64, i64)* @global_add to void (%struct._NODE*, %struct._NODE*)*)(%struct._NODE* %18, %struct._NODE* %19)
  %20 = load i32* %2, align 4, !llfi_index !14
  %21 = load i32* %2, align 4, !llfi_index !14
  %22 = sext i32 %20 to i64, !llfi_index !15
  %23 = sext i32 %21 to i64, !llfi_index !15
  %24 = load %struct._NODE** %1, align 8, !llfi_index !16
  %25 = load %struct._NODE** %1, align 8, !llfi_index !16
  %26 = getelementptr inbounds %struct._NODE* %24, i64 %22, !llfi_index !17
  %27 = getelementptr inbounds %struct._NODE* %25, i64 %23, !llfi_index !17
  %28 = getelementptr inbounds %struct._NODE* %26, i32 0, i32 1, !llfi_index !18
  %29 = getelementptr inbounds %struct._NODE* %27, i32 0, i32 1, !llfi_index !18
  %30 = load i32* %28, align 4, !llfi_index !19
  %31 = load i32* %29, align 4, !llfi_index !19
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %30, i32 %31)
  call void @print_path(%struct._NODE* %18, i32 %30), !llfi_index !20
  br label %32, !llfi_index !21

; <label>:32                                      ; preds = %17, %0
  %33 = load i32* %2, align 4, !llfi_index !22
  %34 = load i32* %2, align 4, !llfi_index !22
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %33, i32 %34)
  %35 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %33), !llfi_index !23
  %36 = load %struct._IO_FILE** @stdout, align 8, !llfi_index !24
  %37 = load %struct._IO_FILE** @stdout, align 8, !llfi_index !24
  call void bitcast (void (i64, i64)* @global_add to void (%struct._IO_FILE*, %struct._IO_FILE*)*)(%struct._IO_FILE* %36, %struct._IO_FILE* %37)
  %38 = call i32 @fflush(%struct._IO_FILE* %36), !llfi_index !25
  ret void, !llfi_index !26
}

declare i32 @printf(i8*, ...) #1

declare i32 @fflush(%struct._IO_FILE*) #1

; Function Attrs: nounwind uwtable
define void @enqueue(i32 %iNode, i32 %iDist, i32 %iPrev) #0 {
  %1 = alloca i32, align 4, !llfi_index !27
  %2 = alloca i32, align 4, !llfi_index !28
  %3 = alloca i32, align 4, !llfi_index !29
  %qNew = alloca %struct._QITEM*, align 8, !llfi_index !30
  %qLast = alloca %struct._QITEM*, align 8, !llfi_index !31
  store i32 %iNode, i32* %1, align 4, !llfi_index !32
  store i32 %iDist, i32* %2, align 4, !llfi_index !33
  store i32 %iPrev, i32* %3, align 4, !llfi_index !34
  %4 = call i8* @malloc(i64 24), !llfi_index !35
  %5 = bitcast i8* %4 to %struct._QITEM*, !llfi_index !36
  %6 = bitcast i8* %4 to %struct._QITEM*, !llfi_index !36
  call void bitcast (void (i64, i64)* @global_add to void (%struct._QITEM*, %struct._QITEM*)*)(%struct._QITEM* %5, %struct._QITEM* %6)
  store %struct._QITEM* %5, %struct._QITEM** %qNew, align 8, !llfi_index !37
  %7 = load %struct._QITEM** @qHead, align 8, !llfi_index !38
  %8 = load %struct._QITEM** @qHead, align 8, !llfi_index !38
  call void bitcast (void (i64, i64)* @global_add to void (%struct._QITEM*, %struct._QITEM*)*)(%struct._QITEM* %7, %struct._QITEM* %8)
  store %struct._QITEM* %7, %struct._QITEM** %qLast, align 8, !llfi_index !39
  %9 = load %struct._QITEM** %qNew, align 8, !llfi_index !40
  %10 = load %struct._QITEM** %qNew, align 8, !llfi_index !40
  %11 = icmp ne %struct._QITEM* %9, null, !llfi_index !41
  %12 = icmp ne %struct._QITEM* %10, null, !llfi_index !41
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %11, i1 %12)
  br i1 %11, label %17, label %13, !llfi_index !42

; <label>:13                                      ; preds = %0
  %14 = load %struct._IO_FILE** @stderr, align 8, !llfi_index !43
  %15 = load %struct._IO_FILE** @stderr, align 8, !llfi_index !43
  call void bitcast (void (i64, i64)* @global_add to void (%struct._IO_FILE*, %struct._IO_FILE*)*)(%struct._IO_FILE* %14, %struct._IO_FILE* %15)
  %16 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([16 x i8]* @.str1, i32 0, i32 0)), !llfi_index !44
  call void @global_check()
  call void @exit(i32 1) #3, !llfi_index !45
  unreachable, !llfi_index !46

; <label>:17                                      ; preds = %0
  %18 = load i32* %1, align 4, !llfi_index !47
  %19 = load i32* %1, align 4, !llfi_index !47
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %18, i32 %19)
  %20 = load %struct._QITEM** %qNew, align 8, !llfi_index !48
  %21 = load %struct._QITEM** %qNew, align 8, !llfi_index !48
  %22 = getelementptr inbounds %struct._QITEM* %20, i32 0, i32 0, !llfi_index !49
  %23 = getelementptr inbounds %struct._QITEM* %21, i32 0, i32 0, !llfi_index !49
  call void bitcast (void (i64, i64)* @global_add to void (i32*, i32*)*)(i32* %22, i32* %23)
  store i32 %18, i32* %22, align 4, !llfi_index !50
  %24 = load i32* %2, align 4, !llfi_index !51
  %25 = load i32* %2, align 4, !llfi_index !51
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %24, i32 %25)
  %26 = load %struct._QITEM** %qNew, align 8, !llfi_index !52
  %27 = load %struct._QITEM** %qNew, align 8, !llfi_index !52
  %28 = getelementptr inbounds %struct._QITEM* %26, i32 0, i32 1, !llfi_index !53
  %29 = getelementptr inbounds %struct._QITEM* %27, i32 0, i32 1, !llfi_index !53
  call void bitcast (void (i64, i64)* @global_add to void (i32*, i32*)*)(i32* %28, i32* %29)
  store i32 %24, i32* %28, align 4, !llfi_index !54
  %30 = load i32* %3, align 4, !llfi_index !55
  %31 = load i32* %3, align 4, !llfi_index !55
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %30, i32 %31)
  %32 = load %struct._QITEM** %qNew, align 8, !llfi_index !56
  %33 = load %struct._QITEM** %qNew, align 8, !llfi_index !56
  %34 = getelementptr inbounds %struct._QITEM* %32, i32 0, i32 2, !llfi_index !57
  %35 = getelementptr inbounds %struct._QITEM* %33, i32 0, i32 2, !llfi_index !57
  call void bitcast (void (i64, i64)* @global_add to void (i32*, i32*)*)(i32* %34, i32* %35)
  store i32 %30, i32* %34, align 4, !llfi_index !58
  %36 = load %struct._QITEM** %qNew, align 8, !llfi_index !59
  %37 = load %struct._QITEM** %qNew, align 8, !llfi_index !59
  %38 = getelementptr inbounds %struct._QITEM* %36, i32 0, i32 3, !llfi_index !60
  %39 = getelementptr inbounds %struct._QITEM* %37, i32 0, i32 3, !llfi_index !60
  call void bitcast (void (i64, i64)* @global_add to void (%struct._QITEM**, %struct._QITEM**)*)(%struct._QITEM** %38, %struct._QITEM** %39)
  store %struct._QITEM* null, %struct._QITEM** %38, align 8, !llfi_index !61
  %40 = load %struct._QITEM** %qLast, align 8, !llfi_index !62
  %41 = load %struct._QITEM** %qLast, align 8, !llfi_index !62
  %42 = icmp ne %struct._QITEM* %40, null, !llfi_index !63
  %43 = icmp ne %struct._QITEM* %41, null, !llfi_index !63
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %42, i1 %43)
  br i1 %42, label %47, label %44, !llfi_index !64

; <label>:44                                      ; preds = %17
  %45 = load %struct._QITEM** %qNew, align 8, !llfi_index !65
  %46 = load %struct._QITEM** %qNew, align 8, !llfi_index !65
  call void bitcast (void (i64, i64)* @global_add to void (%struct._QITEM*, %struct._QITEM*)*)(%struct._QITEM* %45, %struct._QITEM* %46)
  store %struct._QITEM* %45, %struct._QITEM** @qHead, align 8, !llfi_index !66
  br label %71, !llfi_index !67

; <label>:47                                      ; preds = %17
  br label %48, !llfi_index !68

; <label>:48                                      ; preds = %57, %47
  %49 = load %struct._QITEM** %qLast, align 8, !llfi_index !69
  %50 = load %struct._QITEM** %qLast, align 8, !llfi_index !69
  %51 = getelementptr inbounds %struct._QITEM* %49, i32 0, i32 3, !llfi_index !70
  %52 = getelementptr inbounds %struct._QITEM* %50, i32 0, i32 3, !llfi_index !70
  %53 = load %struct._QITEM** %51, align 8, !llfi_index !71
  %54 = load %struct._QITEM** %52, align 8, !llfi_index !71
  %55 = icmp ne %struct._QITEM* %53, null, !llfi_index !72
  %56 = icmp ne %struct._QITEM* %54, null, !llfi_index !72
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %55, i1 %56)
  br i1 %55, label %57, label %64, !llfi_index !73

; <label>:57                                      ; preds = %48
  %58 = load %struct._QITEM** %qLast, align 8, !llfi_index !74
  %59 = load %struct._QITEM** %qLast, align 8, !llfi_index !74
  %60 = getelementptr inbounds %struct._QITEM* %58, i32 0, i32 3, !llfi_index !75
  %61 = getelementptr inbounds %struct._QITEM* %59, i32 0, i32 3, !llfi_index !75
  %62 = load %struct._QITEM** %60, align 8, !llfi_index !76
  %63 = load %struct._QITEM** %61, align 8, !llfi_index !76
  call void bitcast (void (i64, i64)* @global_add to void (%struct._QITEM*, %struct._QITEM*)*)(%struct._QITEM* %62, %struct._QITEM* %63)
  store %struct._QITEM* %62, %struct._QITEM** %qLast, align 8, !llfi_index !77
  br label %48, !llfi_index !78

; <label>:64                                      ; preds = %48
  %65 = load %struct._QITEM** %qNew, align 8, !llfi_index !79
  %66 = load %struct._QITEM** %qNew, align 8, !llfi_index !79
  call void bitcast (void (i64, i64)* @global_add to void (%struct._QITEM*, %struct._QITEM*)*)(%struct._QITEM* %65, %struct._QITEM* %66)
  %67 = load %struct._QITEM** %qLast, align 8, !llfi_index !80
  %68 = load %struct._QITEM** %qLast, align 8, !llfi_index !80
  %69 = getelementptr inbounds %struct._QITEM* %67, i32 0, i32 3, !llfi_index !81
  %70 = getelementptr inbounds %struct._QITEM* %68, i32 0, i32 3, !llfi_index !81
  call void bitcast (void (i64, i64)* @global_add to void (%struct._QITEM**, %struct._QITEM**)*)(%struct._QITEM** %69, %struct._QITEM** %70)
  store %struct._QITEM* %65, %struct._QITEM** %69, align 8, !llfi_index !82
  br label %71, !llfi_index !83

; <label>:71                                      ; preds = %64, %44
  %72 = load i32* @g_qCount, align 4, !llfi_index !84
  %73 = load i32* @g_qCount, align 4, !llfi_index !84
  %74 = add nsw i32 %72, 1, !llfi_index !85
  %75 = add nsw i32 %73, 1, !llfi_index !85
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %74, i32 %75)
  store i32 %74, i32* @g_qCount, align 4, !llfi_index !86
  ret void, !llfi_index !87
}

declare i8* @malloc(i64) #1

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: noreturn
declare void @exit(i32) #2

; Function Attrs: nounwind uwtable
define void @dequeue(i32* %piNode, i32* %piDist, i32* %piPrev) #0 {
  %1 = alloca i32*, align 8, !llfi_index !88
  %2 = alloca i32*, align 8, !llfi_index !89
  %3 = alloca i32*, align 8, !llfi_index !90
  %qKill = alloca %struct._QITEM*, align 8, !llfi_index !91
  store i32* %piNode, i32** %1, align 8, !llfi_index !92
  store i32* %piDist, i32** %2, align 8, !llfi_index !93
  store i32* %piPrev, i32** %3, align 8, !llfi_index !94
  %4 = load %struct._QITEM** @qHead, align 8, !llfi_index !95
  %5 = load %struct._QITEM** @qHead, align 8, !llfi_index !95
  call void bitcast (void (i64, i64)* @global_add to void (%struct._QITEM*, %struct._QITEM*)*)(%struct._QITEM* %4, %struct._QITEM* %5)
  store %struct._QITEM* %4, %struct._QITEM** %qKill, align 8, !llfi_index !96
  %6 = load %struct._QITEM** @qHead, align 8, !llfi_index !97
  %7 = load %struct._QITEM** @qHead, align 8, !llfi_index !97
  %8 = icmp ne %struct._QITEM* %6, null, !llfi_index !98
  %9 = icmp ne %struct._QITEM* %7, null, !llfi_index !98
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %8, i1 %9)
  br i1 %8, label %10, label %48, !llfi_index !99

; <label>:10                                      ; preds = %0
  %11 = load %struct._QITEM** @qHead, align 8, !llfi_index !100
  %12 = load %struct._QITEM** @qHead, align 8, !llfi_index !100
  %13 = getelementptr inbounds %struct._QITEM* %11, i32 0, i32 0, !llfi_index !101
  %14 = getelementptr inbounds %struct._QITEM* %12, i32 0, i32 0, !llfi_index !101
  %15 = load i32* %13, align 4, !llfi_index !102
  %16 = load i32* %14, align 4, !llfi_index !102
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %15, i32 %16)
  %17 = load i32** %1, align 8, !llfi_index !103
  %18 = load i32** %1, align 8, !llfi_index !103
  call void bitcast (void (i64, i64)* @global_add to void (i32*, i32*)*)(i32* %17, i32* %18)
  store i32 %15, i32* %17, align 4, !llfi_index !104
  %19 = load %struct._QITEM** @qHead, align 8, !llfi_index !105
  %20 = load %struct._QITEM** @qHead, align 8, !llfi_index !105
  %21 = getelementptr inbounds %struct._QITEM* %19, i32 0, i32 1, !llfi_index !106
  %22 = getelementptr inbounds %struct._QITEM* %20, i32 0, i32 1, !llfi_index !106
  %23 = load i32* %21, align 4, !llfi_index !107
  %24 = load i32* %22, align 4, !llfi_index !107
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %23, i32 %24)
  %25 = load i32** %2, align 8, !llfi_index !108
  %26 = load i32** %2, align 8, !llfi_index !108
  call void bitcast (void (i64, i64)* @global_add to void (i32*, i32*)*)(i32* %25, i32* %26)
  store i32 %23, i32* %25, align 4, !llfi_index !109
  %27 = load %struct._QITEM** @qHead, align 8, !llfi_index !110
  %28 = load %struct._QITEM** @qHead, align 8, !llfi_index !110
  %29 = getelementptr inbounds %struct._QITEM* %27, i32 0, i32 2, !llfi_index !111
  %30 = getelementptr inbounds %struct._QITEM* %28, i32 0, i32 2, !llfi_index !111
  %31 = load i32* %29, align 4, !llfi_index !112
  %32 = load i32* %30, align 4, !llfi_index !112
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %31, i32 %32)
  %33 = load i32** %3, align 8, !llfi_index !113
  %34 = load i32** %3, align 8, !llfi_index !113
  call void bitcast (void (i64, i64)* @global_add to void (i32*, i32*)*)(i32* %33, i32* %34)
  store i32 %31, i32* %33, align 4, !llfi_index !114
  %35 = load %struct._QITEM** @qHead, align 8, !llfi_index !115
  %36 = load %struct._QITEM** @qHead, align 8, !llfi_index !115
  %37 = getelementptr inbounds %struct._QITEM* %35, i32 0, i32 3, !llfi_index !116
  %38 = getelementptr inbounds %struct._QITEM* %36, i32 0, i32 3, !llfi_index !116
  %39 = load %struct._QITEM** %37, align 8, !llfi_index !117
  %40 = load %struct._QITEM** %38, align 8, !llfi_index !117
  call void bitcast (void (i64, i64)* @global_add to void (%struct._QITEM*, %struct._QITEM*)*)(%struct._QITEM* %39, %struct._QITEM* %40)
  store %struct._QITEM* %39, %struct._QITEM** @qHead, align 8, !llfi_index !118
  %41 = load %struct._QITEM** %qKill, align 8, !llfi_index !119
  %42 = load %struct._QITEM** %qKill, align 8, !llfi_index !119
  call void bitcast (void (i64, i64)* @global_add to void (%struct._QITEM*, %struct._QITEM*)*)(%struct._QITEM* %41, %struct._QITEM* %42)
  %43 = call i32 (%struct._QITEM*, ...)* bitcast (i32 (...)* @free to i32 (%struct._QITEM*, ...)*)(%struct._QITEM* %41), !llfi_index !120
  %44 = load i32* @g_qCount, align 4, !llfi_index !121
  %45 = load i32* @g_qCount, align 4, !llfi_index !121
  %46 = add nsw i32 %44, -1, !llfi_index !122
  %47 = add nsw i32 %45, -1, !llfi_index !122
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %46, i32 %47)
  store i32 %46, i32* @g_qCount, align 4, !llfi_index !123
  br label %48, !llfi_index !124

; <label>:48                                      ; preds = %10, %0
  ret void, !llfi_index !125
}

declare i32 @free(...) #1

; Function Attrs: nounwind uwtable
define i32 @qcount() #0 {
  %1 = load i32* @g_qCount, align 4, !llfi_index !126
  %2 = load i32* @g_qCount, align 4, !llfi_index !126
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %1, i32 %2)
  ret i32 %1, !llfi_index !127
}

; Function Attrs: nounwind uwtable
define i32 @dijkstra(i32 %chStart, i32 %chEnd) #0 {
  %1 = alloca i32, align 4, !llfi_index !128
  %2 = alloca i32, align 4, !llfi_index !129
  %3 = alloca i32, align 4, !llfi_index !130
  store i32 %chStart, i32* %2, align 4, !llfi_index !131
  store i32 %chEnd, i32* %3, align 4, !llfi_index !132
  store i32 0, i32* @ch, align 4, !llfi_index !133
  br label %4, !llfi_index !134

; <label>:4                                       ; preds = %26, %0
  %5 = load i32* @ch, align 4, !llfi_index !135
  %6 = load i32* @ch, align 4, !llfi_index !135
  %7 = icmp slt i32 %5, 100, !llfi_index !136
  %8 = icmp slt i32 %6, 100, !llfi_index !136
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %7, i1 %8)
  br i1 %7, label %9, label %31, !llfi_index !137

; <label>:9                                       ; preds = %4
  %10 = load i32* @ch, align 4, !llfi_index !138
  %11 = load i32* @ch, align 4, !llfi_index !138
  %12 = sext i32 %10 to i64, !llfi_index !139
  %13 = sext i32 %11 to i64, !llfi_index !139
  %14 = getelementptr inbounds [100 x %struct._NODE]* @rgnNodes, i32 0, i64 %12, !llfi_index !140
  %15 = getelementptr inbounds [100 x %struct._NODE]* @rgnNodes, i32 0, i64 %13, !llfi_index !140
  %16 = getelementptr inbounds %struct._NODE* %14, i32 0, i32 0, !llfi_index !141
  %17 = getelementptr inbounds %struct._NODE* %15, i32 0, i32 0, !llfi_index !141
  call void bitcast (void (i64, i64)* @global_add to void (i32*, i32*)*)(i32* %16, i32* %17)
  store i32 9999, i32* %16, align 4, !llfi_index !142
  %18 = load i32* @ch, align 4, !llfi_index !143
  %19 = load i32* @ch, align 4, !llfi_index !143
  %20 = sext i32 %18 to i64, !llfi_index !144
  %21 = sext i32 %19 to i64, !llfi_index !144
  %22 = getelementptr inbounds [100 x %struct._NODE]* @rgnNodes, i32 0, i64 %20, !llfi_index !145
  %23 = getelementptr inbounds [100 x %struct._NODE]* @rgnNodes, i32 0, i64 %21, !llfi_index !145
  %24 = getelementptr inbounds %struct._NODE* %22, i32 0, i32 1, !llfi_index !146
  %25 = getelementptr inbounds %struct._NODE* %23, i32 0, i32 1, !llfi_index !146
  call void bitcast (void (i64, i64)* @global_add to void (i32*, i32*)*)(i32* %24, i32* %25)
  store i32 9999, i32* %24, align 4, !llfi_index !147
  br label %26, !llfi_index !148

; <label>:26                                      ; preds = %9
  %27 = load i32* @ch, align 4, !llfi_index !149
  %28 = load i32* @ch, align 4, !llfi_index !149
  %29 = add nsw i32 %27, 1, !llfi_index !150
  %30 = add nsw i32 %28, 1, !llfi_index !150
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %29, i32 %30)
  store i32 %29, i32* @ch, align 4, !llfi_index !151
  br label %4, !llfi_index !152

; <label>:31                                      ; preds = %4
  %32 = load i32* %2, align 4, !llfi_index !153
  %33 = load i32* %2, align 4, !llfi_index !153
  %34 = load i32* %3, align 4, !llfi_index !154
  %35 = load i32* %3, align 4, !llfi_index !154
  %36 = icmp eq i32 %32, %34, !llfi_index !155
  %37 = icmp eq i32 %33, %35, !llfi_index !155
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %36, i1 %37)
  br i1 %36, label %38, label %40, !llfi_index !156

; <label>:38                                      ; preds = %31
  %39 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([54 x i8]* @.str2, i32 0, i32 0)), !llfi_index !157
  br label %177, !llfi_index !158

; <label>:40                                      ; preds = %31
  %41 = load i32* %2, align 4, !llfi_index !159
  %42 = load i32* %2, align 4, !llfi_index !159
  %43 = sext i32 %41 to i64, !llfi_index !160
  %44 = sext i32 %42 to i64, !llfi_index !160
  %45 = getelementptr inbounds [100 x %struct._NODE]* @rgnNodes, i32 0, i64 %43, !llfi_index !161
  %46 = getelementptr inbounds [100 x %struct._NODE]* @rgnNodes, i32 0, i64 %44, !llfi_index !161
  %47 = getelementptr inbounds %struct._NODE* %45, i32 0, i32 0, !llfi_index !162
  %48 = getelementptr inbounds %struct._NODE* %46, i32 0, i32 0, !llfi_index !162
  call void bitcast (void (i64, i64)* @global_add to void (i32*, i32*)*)(i32* %47, i32* %48)
  store i32 0, i32* %47, align 4, !llfi_index !163
  %49 = load i32* %2, align 4, !llfi_index !164
  %50 = load i32* %2, align 4, !llfi_index !164
  %51 = sext i32 %49 to i64, !llfi_index !165
  %52 = sext i32 %50 to i64, !llfi_index !165
  %53 = getelementptr inbounds [100 x %struct._NODE]* @rgnNodes, i32 0, i64 %51, !llfi_index !166
  %54 = getelementptr inbounds [100 x %struct._NODE]* @rgnNodes, i32 0, i64 %52, !llfi_index !166
  %55 = getelementptr inbounds %struct._NODE* %53, i32 0, i32 1, !llfi_index !167
  %56 = getelementptr inbounds %struct._NODE* %54, i32 0, i32 1, !llfi_index !167
  call void bitcast (void (i64, i64)* @global_add to void (i32*, i32*)*)(i32* %55, i32* %56)
  store i32 9999, i32* %55, align 4, !llfi_index !168
  %57 = load i32* %2, align 4, !llfi_index !169
  %58 = load i32* %2, align 4, !llfi_index !169
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %57, i32 %58)
  call void @enqueue(i32 %57, i32 0, i32 9999), !llfi_index !170
  br label %59, !llfi_index !171

; <label>:59                                      ; preds = %160, %40
  %60 = call i32 @qcount(), !llfi_index !172
  %61 = icmp sgt i32 %60, 0, !llfi_index !173
  %62 = icmp sgt i32 %60, 0, !llfi_index !173
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %61, i1 %62)
  br i1 %61, label %63, label %161, !llfi_index !174

; <label>:63                                      ; preds = %59
  call void @dequeue(i32* @iNode, i32* @iDist, i32* @iPrev), !llfi_index !175
  store i32 0, i32* @i, align 4, !llfi_index !176
  br label %64, !llfi_index !177

; <label>:64                                      ; preds = %155, %63
  %65 = load i32* @i, align 4, !llfi_index !178
  %66 = load i32* @i, align 4, !llfi_index !178
  %67 = icmp slt i32 %65, 100, !llfi_index !179
  %68 = icmp slt i32 %66, 100, !llfi_index !179
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %67, i1 %68)
  br i1 %67, label %69, label %160, !llfi_index !180

; <label>:69                                      ; preds = %64
  %70 = load i32* @i, align 4, !llfi_index !181
  %71 = load i32* @i, align 4, !llfi_index !181
  %72 = sext i32 %70 to i64, !llfi_index !182
  %73 = sext i32 %71 to i64, !llfi_index !182
  %74 = load i32* @iNode, align 4, !llfi_index !183
  %75 = load i32* @iNode, align 4, !llfi_index !183
  %76 = sext i32 %74 to i64, !llfi_index !184
  %77 = sext i32 %75 to i64, !llfi_index !184
  %78 = getelementptr inbounds [100 x [100 x i32]]* @AdjMatrix, i32 0, i64 %76, !llfi_index !185
  %79 = getelementptr inbounds [100 x [100 x i32]]* @AdjMatrix, i32 0, i64 %77, !llfi_index !185
  %80 = getelementptr inbounds [100 x i32]* %78, i32 0, i64 %72, !llfi_index !186
  %81 = getelementptr inbounds [100 x i32]* %79, i32 0, i64 %73, !llfi_index !186
  %82 = load i32* %80, align 4, !llfi_index !187
  %83 = load i32* %81, align 4, !llfi_index !187
  store i32 %82, i32* @iCost, align 4, !llfi_index !188
  %84 = icmp ne i32 %82, 9999, !llfi_index !189
  %85 = icmp ne i32 %83, 9999, !llfi_index !189
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %84, i1 %85)
  br i1 %84, label %86, label %154, !llfi_index !190

; <label>:86                                      ; preds = %69
  %87 = load i32* @i, align 4, !llfi_index !191
  %88 = load i32* @i, align 4, !llfi_index !191
  %89 = sext i32 %87 to i64, !llfi_index !192
  %90 = sext i32 %88 to i64, !llfi_index !192
  %91 = getelementptr inbounds [100 x %struct._NODE]* @rgnNodes, i32 0, i64 %89, !llfi_index !193
  %92 = getelementptr inbounds [100 x %struct._NODE]* @rgnNodes, i32 0, i64 %90, !llfi_index !193
  %93 = getelementptr inbounds %struct._NODE* %91, i32 0, i32 0, !llfi_index !194
  %94 = getelementptr inbounds %struct._NODE* %92, i32 0, i32 0, !llfi_index !194
  %95 = load i32* %93, align 4, !llfi_index !195
  %96 = load i32* %94, align 4, !llfi_index !195
  %97 = icmp eq i32 9999, %95, !llfi_index !196
  %98 = icmp eq i32 9999, %96, !llfi_index !196
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %97, i1 %98)
  br i1 %97, label %118, label %99, !llfi_index !197

; <label>:99                                      ; preds = %86
  %100 = load i32* @i, align 4, !llfi_index !198
  %101 = load i32* @i, align 4, !llfi_index !198
  %102 = sext i32 %100 to i64, !llfi_index !199
  %103 = sext i32 %101 to i64, !llfi_index !199
  %104 = getelementptr inbounds [100 x %struct._NODE]* @rgnNodes, i32 0, i64 %102, !llfi_index !200
  %105 = getelementptr inbounds [100 x %struct._NODE]* @rgnNodes, i32 0, i64 %103, !llfi_index !200
  %106 = getelementptr inbounds %struct._NODE* %104, i32 0, i32 0, !llfi_index !201
  %107 = getelementptr inbounds %struct._NODE* %105, i32 0, i32 0, !llfi_index !201
  %108 = load i32* %106, align 4, !llfi_index !202
  %109 = load i32* %107, align 4, !llfi_index !202
  %110 = load i32* @iCost, align 4, !llfi_index !203
  %111 = load i32* @iCost, align 4, !llfi_index !203
  %112 = load i32* @iDist, align 4, !llfi_index !204
  %113 = load i32* @iDist, align 4, !llfi_index !204
  %114 = add nsw i32 %110, %112, !llfi_index !205
  %115 = add nsw i32 %111, %113, !llfi_index !205
  %116 = icmp sgt i32 %108, %114, !llfi_index !206
  %117 = icmp sgt i32 %109, %115, !llfi_index !206
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %116, i1 %117)
  br i1 %116, label %118, label %153, !llfi_index !207

; <label>:118                                     ; preds = %99, %86
  %119 = load i32* @iDist, align 4, !llfi_index !208
  %120 = load i32* @iDist, align 4, !llfi_index !208
  %121 = load i32* @iCost, align 4, !llfi_index !209
  %122 = load i32* @iCost, align 4, !llfi_index !209
  %123 = add nsw i32 %119, %121, !llfi_index !210
  %124 = add nsw i32 %120, %122, !llfi_index !210
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %123, i32 %124)
  %125 = load i32* @i, align 4, !llfi_index !211
  %126 = load i32* @i, align 4, !llfi_index !211
  %127 = sext i32 %125 to i64, !llfi_index !212
  %128 = sext i32 %126 to i64, !llfi_index !212
  %129 = getelementptr inbounds [100 x %struct._NODE]* @rgnNodes, i32 0, i64 %127, !llfi_index !213
  %130 = getelementptr inbounds [100 x %struct._NODE]* @rgnNodes, i32 0, i64 %128, !llfi_index !213
  %131 = getelementptr inbounds %struct._NODE* %129, i32 0, i32 0, !llfi_index !214
  %132 = getelementptr inbounds %struct._NODE* %130, i32 0, i32 0, !llfi_index !214
  call void bitcast (void (i64, i64)* @global_add to void (i32*, i32*)*)(i32* %131, i32* %132)
  store i32 %123, i32* %131, align 4, !llfi_index !215
  %133 = load i32* @iNode, align 4, !llfi_index !216
  %134 = load i32* @iNode, align 4, !llfi_index !216
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %133, i32 %134)
  %135 = load i32* @i, align 4, !llfi_index !217
  %136 = load i32* @i, align 4, !llfi_index !217
  %137 = sext i32 %135 to i64, !llfi_index !218
  %138 = sext i32 %136 to i64, !llfi_index !218
  %139 = getelementptr inbounds [100 x %struct._NODE]* @rgnNodes, i32 0, i64 %137, !llfi_index !219
  %140 = getelementptr inbounds [100 x %struct._NODE]* @rgnNodes, i32 0, i64 %138, !llfi_index !219
  %141 = getelementptr inbounds %struct._NODE* %139, i32 0, i32 1, !llfi_index !220
  %142 = getelementptr inbounds %struct._NODE* %140, i32 0, i32 1, !llfi_index !220
  call void bitcast (void (i64, i64)* @global_add to void (i32*, i32*)*)(i32* %141, i32* %142)
  store i32 %133, i32* %141, align 4, !llfi_index !221
  %143 = load i32* @i, align 4, !llfi_index !222
  %144 = load i32* @i, align 4, !llfi_index !222
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %143, i32 %144)
  %145 = load i32* @iDist, align 4, !llfi_index !223
  %146 = load i32* @iDist, align 4, !llfi_index !223
  %147 = load i32* @iCost, align 4, !llfi_index !224
  %148 = load i32* @iCost, align 4, !llfi_index !224
  %149 = add nsw i32 %145, %147, !llfi_index !225
  %150 = add nsw i32 %146, %148, !llfi_index !225
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %149, i32 %150)
  %151 = load i32* @iNode, align 4, !llfi_index !226
  %152 = load i32* @iNode, align 4, !llfi_index !226
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %151, i32 %152)
  call void @enqueue(i32 %143, i32 %149, i32 %151), !llfi_index !227
  br label %153, !llfi_index !228

; <label>:153                                     ; preds = %118, %99
  br label %154, !llfi_index !229

; <label>:154                                     ; preds = %153, %69
  br label %155, !llfi_index !230

; <label>:155                                     ; preds = %154
  %156 = load i32* @i, align 4, !llfi_index !231
  %157 = load i32* @i, align 4, !llfi_index !231
  %158 = add nsw i32 %156, 1, !llfi_index !232
  %159 = add nsw i32 %157, 1, !llfi_index !232
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %158, i32 %159)
  store i32 %158, i32* @i, align 4, !llfi_index !233
  br label %64, !llfi_index !234

; <label>:160                                     ; preds = %64
  br label %59, !llfi_index !235

; <label>:161                                     ; preds = %59
  %162 = load i32* %3, align 4, !llfi_index !236
  %163 = load i32* %3, align 4, !llfi_index !236
  %164 = sext i32 %162 to i64, !llfi_index !237
  %165 = sext i32 %163 to i64, !llfi_index !237
  %166 = getelementptr inbounds [100 x %struct._NODE]* @rgnNodes, i32 0, i64 %164, !llfi_index !238
  %167 = getelementptr inbounds [100 x %struct._NODE]* @rgnNodes, i32 0, i64 %165, !llfi_index !238
  %168 = getelementptr inbounds %struct._NODE* %166, i32 0, i32 0, !llfi_index !239
  %169 = getelementptr inbounds %struct._NODE* %167, i32 0, i32 0, !llfi_index !239
  %170 = load i32* %168, align 4, !llfi_index !240
  %171 = load i32* %169, align 4, !llfi_index !240
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %170, i32 %171)
  %172 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([30 x i8]* @.str3, i32 0, i32 0), i32 %170), !llfi_index !241
  %173 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str4, i32 0, i32 0)), !llfi_index !242
  %174 = load i32* %3, align 4, !llfi_index !243
  %175 = load i32* %3, align 4, !llfi_index !243
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %174, i32 %175)
  call void @print_path(%struct._NODE* getelementptr inbounds ([100 x %struct._NODE]* @rgnNodes, i32 0, i32 0), i32 %174), !llfi_index !244
  %176 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str5, i32 0, i32 0)), !llfi_index !245
  br label %177, !llfi_index !246

; <label>:177                                     ; preds = %161, %38
  %178 = load i32* %1, !llfi_index !247
  %179 = load i32* %1, !llfi_index !247
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %178, i32 %179)
  ret i32 %178, !llfi_index !248
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4, !llfi_index !249
  %2 = alloca i32, align 4, !llfi_index !250
  %3 = alloca i8**, align 8, !llfi_index !251
  %i = alloca i32, align 4, !llfi_index !252
  %j = alloca i32, align 4, !llfi_index !253
  %k = alloca i32, align 4, !llfi_index !254
  %fp = alloca %struct._IO_FILE*, align 8, !llfi_index !255
  store i32 0, i32* %1, !llfi_index !256
  store i32 %argc, i32* %2, align 4, !llfi_index !257
  store i8** %argv, i8*** %3, align 8, !llfi_index !258
  %4 = load i32* %2, align 4, !llfi_index !259
  %5 = load i32* %2, align 4, !llfi_index !259
  %6 = icmp slt i32 %4, 2, !llfi_index !260
  %7 = icmp slt i32 %5, 2, !llfi_index !260
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %6, i1 %7)
  br i1 %6, label %8, label %15, !llfi_index !261

; <label>:8                                       ; preds = %0
  %9 = load %struct._IO_FILE** @stderr, align 8, !llfi_index !262
  %10 = load %struct._IO_FILE** @stderr, align 8, !llfi_index !262
  call void bitcast (void (i64, i64)* @global_add to void (%struct._IO_FILE*, %struct._IO_FILE*)*)(%struct._IO_FILE* %9, %struct._IO_FILE* %10)
  %11 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([28 x i8]* @.str6, i32 0, i32 0)), !llfi_index !263
  %12 = load %struct._IO_FILE** @stderr, align 8, !llfi_index !264
  %13 = load %struct._IO_FILE** @stderr, align 8, !llfi_index !264
  call void bitcast (void (i64, i64)* @global_add to void (%struct._IO_FILE*, %struct._IO_FILE*)*)(%struct._IO_FILE* %12, %struct._IO_FILE* %13)
  %14 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([41 x i8]* @.str7, i32 0, i32 0)), !llfi_index !265
  br label %15, !llfi_index !266

; <label>:15                                      ; preds = %8, %0
  %16 = load i8*** %3, align 8, !llfi_index !267
  %17 = load i8*** %3, align 8, !llfi_index !267
  %18 = getelementptr inbounds i8** %16, i64 1, !llfi_index !268
  %19 = getelementptr inbounds i8** %17, i64 1, !llfi_index !268
  %20 = load i8** %18, align 8, !llfi_index !269
  %21 = load i8** %19, align 8, !llfi_index !269
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %20, i8* %21)
  %22 = call %struct._IO_FILE* @fopen(i8* %20, i8* getelementptr inbounds ([2 x i8]* @.str8, i32 0, i32 0)), !llfi_index !270
  store %struct._IO_FILE* %22, %struct._IO_FILE** %fp, align 8, !llfi_index !271
  store i32 0, i32* %i, align 4, !llfi_index !272
  br label %23, !llfi_index !273

; <label>:23                                      ; preds = %58, %15
  %24 = load i32* %i, align 4, !llfi_index !274
  %25 = load i32* %i, align 4, !llfi_index !274
  %26 = icmp slt i32 %24, 100, !llfi_index !275
  %27 = icmp slt i32 %25, 100, !llfi_index !275
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %26, i1 %27)
  br i1 %26, label %28, label %63, !llfi_index !276

; <label>:28                                      ; preds = %23
  store i32 0, i32* %j, align 4, !llfi_index !277
  br label %29, !llfi_index !278

; <label>:29                                      ; preds = %52, %28
  %30 = load i32* %j, align 4, !llfi_index !279
  %31 = load i32* %j, align 4, !llfi_index !279
  %32 = icmp slt i32 %30, 100, !llfi_index !280
  %33 = icmp slt i32 %31, 100, !llfi_index !280
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %32, i1 %33)
  br i1 %32, label %34, label %57, !llfi_index !281

; <label>:34                                      ; preds = %29
  %35 = load %struct._IO_FILE** %fp, align 8, !llfi_index !282
  %36 = load %struct._IO_FILE** %fp, align 8, !llfi_index !282
  call void bitcast (void (i64, i64)* @global_add to void (%struct._IO_FILE*, %struct._IO_FILE*)*)(%struct._IO_FILE* %35, %struct._IO_FILE* %36)
  %37 = call i32 (%struct._IO_FILE*, i8*, ...)* @__isoc99_fscanf(%struct._IO_FILE* %35, i8* getelementptr inbounds ([3 x i8]* @.str9, i32 0, i32 0), i32* %k), !llfi_index !283
  %38 = load i32* %k, align 4, !llfi_index !284
  %39 = load i32* %k, align 4, !llfi_index !284
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %38, i32 %39)
  %40 = load i32* %j, align 4, !llfi_index !285
  %41 = load i32* %j, align 4, !llfi_index !285
  %42 = sext i32 %40 to i64, !llfi_index !286
  %43 = sext i32 %41 to i64, !llfi_index !286
  %44 = load i32* %i, align 4, !llfi_index !287
  %45 = load i32* %i, align 4, !llfi_index !287
  %46 = sext i32 %44 to i64, !llfi_index !288
  %47 = sext i32 %45 to i64, !llfi_index !288
  %48 = getelementptr inbounds [100 x [100 x i32]]* @AdjMatrix, i32 0, i64 %46, !llfi_index !289
  %49 = getelementptr inbounds [100 x [100 x i32]]* @AdjMatrix, i32 0, i64 %47, !llfi_index !289
  %50 = getelementptr inbounds [100 x i32]* %48, i32 0, i64 %42, !llfi_index !290
  %51 = getelementptr inbounds [100 x i32]* %49, i32 0, i64 %43, !llfi_index !290
  call void bitcast (void (i64, i64)* @global_add to void (i32*, i32*)*)(i32* %50, i32* %51)
  store i32 %38, i32* %50, align 4, !llfi_index !291
  br label %52, !llfi_index !292

; <label>:52                                      ; preds = %34
  %53 = load i32* %j, align 4, !llfi_index !293
  %54 = load i32* %j, align 4, !llfi_index !293
  %55 = add nsw i32 %53, 1, !llfi_index !294
  %56 = add nsw i32 %54, 1, !llfi_index !294
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %55, i32 %56)
  store i32 %55, i32* %j, align 4, !llfi_index !295
  br label %29, !llfi_index !296

; <label>:57                                      ; preds = %29
  br label %58, !llfi_index !297

; <label>:58                                      ; preds = %57
  %59 = load i32* %i, align 4, !llfi_index !298
  %60 = load i32* %i, align 4, !llfi_index !298
  %61 = add nsw i32 %59, 1, !llfi_index !299
  %62 = add nsw i32 %60, 1, !llfi_index !299
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %61, i32 %62)
  store i32 %61, i32* %i, align 4, !llfi_index !300
  br label %23, !llfi_index !301

; <label>:63                                      ; preds = %23
  store i32 0, i32* %i, align 4, !llfi_index !302
  store i32 50, i32* %j, align 4, !llfi_index !303
  br label %64, !llfi_index !304

; <label>:64                                      ; preds = %79, %63
  %65 = load i32* %i, align 4, !llfi_index !305
  %66 = load i32* %i, align 4, !llfi_index !305
  %67 = icmp slt i32 %65, 20, !llfi_index !306
  %68 = icmp slt i32 %66, 20, !llfi_index !306
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %67, i1 %68)
  br i1 %67, label %69, label %88, !llfi_index !307

; <label>:69                                      ; preds = %64
  %70 = load i32* %j, align 4, !llfi_index !308
  %71 = load i32* %j, align 4, !llfi_index !308
  %72 = srem i32 %70, 100, !llfi_index !309
  %73 = srem i32 %71, 100, !llfi_index !309
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %72, i32 %73)
  store i32 %72, i32* %j, align 4, !llfi_index !310
  %74 = load i32* %i, align 4, !llfi_index !311
  %75 = load i32* %i, align 4, !llfi_index !311
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %74, i32 %75)
  %76 = load i32* %j, align 4, !llfi_index !312
  %77 = load i32* %j, align 4, !llfi_index !312
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %76, i32 %77)
  %78 = call i32 @dijkstra(i32 %74, i32 %76), !llfi_index !313
  br label %79, !llfi_index !314

; <label>:79                                      ; preds = %69
  %80 = load i32* %i, align 4, !llfi_index !315
  %81 = load i32* %i, align 4, !llfi_index !315
  %82 = add nsw i32 %80, 1, !llfi_index !316
  %83 = add nsw i32 %81, 1, !llfi_index !316
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %82, i32 %83)
  store i32 %82, i32* %i, align 4, !llfi_index !317
  %84 = load i32* %j, align 4, !llfi_index !318
  %85 = load i32* %j, align 4, !llfi_index !318
  %86 = add nsw i32 %84, 1, !llfi_index !319
  %87 = add nsw i32 %85, 1, !llfi_index !319
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %86, i32 %87)
  store i32 %86, i32* %j, align 4, !llfi_index !320
  br label %64, !llfi_index !321

; <label>:88                                      ; preds = %64
  call void @global_check()
  call void @exit(i32 0) #3, !llfi_index !322
  unreachable, !llfi_index !323
                                                  ; No predecessors!
  %90 = load i32* %1, !llfi_index !324
  %91 = load i32* %1, !llfi_index !324
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %90, i32 %91)
  call void @global_check()
  ret i32 %90, !llfi_index !325
}

declare %struct._IO_FILE* @fopen(i8*, i8*) #1

declare i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #1

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
  call void @exit(i32 99) #4
  unreachable

; <label>:5                                       ; preds = %0
  ret void
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn }
attributes #4 = { noreturn nounwind }

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
