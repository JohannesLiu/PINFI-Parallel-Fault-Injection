; ModuleID = 'dijkstra_small.c'
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

; Function Attrs: nounwind uwtable
define void @print_path(%struct._NODE* %rgnNodes, i32 %chNode) #0 {
  %1 = alloca %struct._NODE*, align 8
  %2 = alloca i32, align 4
  store %struct._NODE* %rgnNodes, %struct._NODE** %1, align 8
  store i32 %chNode, i32* %2, align 4
  %3 = load i32* %2, align 4
  %4 = sext i32 %3 to i64
  %5 = load %struct._NODE** %1, align 8
  %6 = getelementptr inbounds %struct._NODE* %5, i64 %4
  %7 = getelementptr inbounds %struct._NODE* %6, i32 0, i32 1
  %8 = load i32* %7, align 4
  %9 = icmp ne i32 %8, 9999
  br i1 %9, label %10, label %18

; <label>:10                                      ; preds = %0
  %11 = load %struct._NODE** %1, align 8
  %12 = load i32* %2, align 4
  %13 = sext i32 %12 to i64
  %14 = load %struct._NODE** %1, align 8
  %15 = getelementptr inbounds %struct._NODE* %14, i64 %13
  %16 = getelementptr inbounds %struct._NODE* %15, i32 0, i32 1
  %17 = load i32* %16, align 4
  call void @print_path(%struct._NODE* %11, i32 %17)
  br label %18

; <label>:18                                      ; preds = %10, %0
  %19 = load i32* %2, align 4
  %20 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %19)
  %21 = load %struct._IO_FILE** @stdout, align 8
  %22 = call i32 @fflush(%struct._IO_FILE* %21)
  ret void
}

declare i32 @printf(i8*, ...) #1

declare i32 @fflush(%struct._IO_FILE*) #1

; Function Attrs: nounwind uwtable
define void @enqueue(i32 %iNode, i32 %iDist, i32 %iPrev) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %qNew = alloca %struct._QITEM*, align 8
  %qLast = alloca %struct._QITEM*, align 8
  store i32 %iNode, i32* %1, align 4
  store i32 %iDist, i32* %2, align 4
  store i32 %iPrev, i32* %3, align 4
  %4 = call i8* @malloc(i64 24)
  %5 = bitcast i8* %4 to %struct._QITEM*
  store %struct._QITEM* %5, %struct._QITEM** %qNew, align 8
  %6 = load %struct._QITEM** @qHead, align 8
  store %struct._QITEM* %6, %struct._QITEM** %qLast, align 8
  %7 = load %struct._QITEM** %qNew, align 8
  %8 = icmp ne %struct._QITEM* %7, null
  br i1 %8, label %12, label %9

; <label>:9                                       ; preds = %0
  %10 = load %struct._IO_FILE** @stderr, align 8
  %11 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([16 x i8]* @.str1, i32 0, i32 0))
  call void @exit(i32 1) #3
  unreachable

; <label>:12                                      ; preds = %0
  %13 = load i32* %1, align 4
  %14 = load %struct._QITEM** %qNew, align 8
  %15 = getelementptr inbounds %struct._QITEM* %14, i32 0, i32 0
  store i32 %13, i32* %15, align 4
  %16 = load i32* %2, align 4
  %17 = load %struct._QITEM** %qNew, align 8
  %18 = getelementptr inbounds %struct._QITEM* %17, i32 0, i32 1
  store i32 %16, i32* %18, align 4
  %19 = load i32* %3, align 4
  %20 = load %struct._QITEM** %qNew, align 8
  %21 = getelementptr inbounds %struct._QITEM* %20, i32 0, i32 2
  store i32 %19, i32* %21, align 4
  %22 = load %struct._QITEM** %qNew, align 8
  %23 = getelementptr inbounds %struct._QITEM* %22, i32 0, i32 3
  store %struct._QITEM* null, %struct._QITEM** %23, align 8
  %24 = load %struct._QITEM** %qLast, align 8
  %25 = icmp ne %struct._QITEM* %24, null
  br i1 %25, label %28, label %26

; <label>:26                                      ; preds = %12
  %27 = load %struct._QITEM** %qNew, align 8
  store %struct._QITEM* %27, %struct._QITEM** @qHead, align 8
  br label %42

; <label>:28                                      ; preds = %12
  br label %29

; <label>:29                                      ; preds = %34, %28
  %30 = load %struct._QITEM** %qLast, align 8
  %31 = getelementptr inbounds %struct._QITEM* %30, i32 0, i32 3
  %32 = load %struct._QITEM** %31, align 8
  %33 = icmp ne %struct._QITEM* %32, null
  br i1 %33, label %34, label %38

; <label>:34                                      ; preds = %29
  %35 = load %struct._QITEM** %qLast, align 8
  %36 = getelementptr inbounds %struct._QITEM* %35, i32 0, i32 3
  %37 = load %struct._QITEM** %36, align 8
  store %struct._QITEM* %37, %struct._QITEM** %qLast, align 8
  br label %29

; <label>:38                                      ; preds = %29
  %39 = load %struct._QITEM** %qNew, align 8
  %40 = load %struct._QITEM** %qLast, align 8
  %41 = getelementptr inbounds %struct._QITEM* %40, i32 0, i32 3
  store %struct._QITEM* %39, %struct._QITEM** %41, align 8
  br label %42

; <label>:42                                      ; preds = %38, %26
  %43 = load i32* @g_qCount, align 4
  %44 = add nsw i32 %43, 1
  store i32 %44, i32* @g_qCount, align 4
  ret void
}

declare i8* @malloc(i64) #1

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: noreturn
declare void @exit(i32) #2

; Function Attrs: nounwind uwtable
define void @dequeue(i32* %piNode, i32* %piDist, i32* %piPrev) #0 {
  %1 = alloca i32*, align 8
  %2 = alloca i32*, align 8
  %3 = alloca i32*, align 8
  %qKill = alloca %struct._QITEM*, align 8
  store i32* %piNode, i32** %1, align 8
  store i32* %piDist, i32** %2, align 8
  store i32* %piPrev, i32** %3, align 8
  %4 = load %struct._QITEM** @qHead, align 8
  store %struct._QITEM* %4, %struct._QITEM** %qKill, align 8
  %5 = load %struct._QITEM** @qHead, align 8
  %6 = icmp ne %struct._QITEM* %5, null
  br i1 %6, label %7, label %27

; <label>:7                                       ; preds = %0
  %8 = load %struct._QITEM** @qHead, align 8
  %9 = getelementptr inbounds %struct._QITEM* %8, i32 0, i32 0
  %10 = load i32* %9, align 4
  %11 = load i32** %1, align 8
  store i32 %10, i32* %11, align 4
  %12 = load %struct._QITEM** @qHead, align 8
  %13 = getelementptr inbounds %struct._QITEM* %12, i32 0, i32 1
  %14 = load i32* %13, align 4
  %15 = load i32** %2, align 8
  store i32 %14, i32* %15, align 4
  %16 = load %struct._QITEM** @qHead, align 8
  %17 = getelementptr inbounds %struct._QITEM* %16, i32 0, i32 2
  %18 = load i32* %17, align 4
  %19 = load i32** %3, align 8
  store i32 %18, i32* %19, align 4
  %20 = load %struct._QITEM** @qHead, align 8
  %21 = getelementptr inbounds %struct._QITEM* %20, i32 0, i32 3
  %22 = load %struct._QITEM** %21, align 8
  store %struct._QITEM* %22, %struct._QITEM** @qHead, align 8
  %23 = load %struct._QITEM** %qKill, align 8
  %24 = call i32 (%struct._QITEM*, ...)* bitcast (i32 (...)* @free to i32 (%struct._QITEM*, ...)*)(%struct._QITEM* %23)
  %25 = load i32* @g_qCount, align 4
  %26 = add nsw i32 %25, -1
  store i32 %26, i32* @g_qCount, align 4
  br label %27

; <label>:27                                      ; preds = %7, %0
  ret void
}

declare i32 @free(...) #1

; Function Attrs: nounwind uwtable
define i32 @qcount() #0 {
  %1 = load i32* @g_qCount, align 4
  ret i32 %1
}

; Function Attrs: nounwind uwtable
define i32 @dijkstra(i32 %chStart, i32 %chEnd) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %chStart, i32* %2, align 4
  store i32 %chEnd, i32* %3, align 4
  store i32 0, i32* @ch, align 4
  br label %4

; <label>:4                                       ; preds = %16, %0
  %5 = load i32* @ch, align 4
  %6 = icmp slt i32 %5, 100
  br i1 %6, label %7, label %19

; <label>:7                                       ; preds = %4
  %8 = load i32* @ch, align 4
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds [100 x %struct._NODE]* @rgnNodes, i32 0, i64 %9
  %11 = getelementptr inbounds %struct._NODE* %10, i32 0, i32 0
  store i32 9999, i32* %11, align 4
  %12 = load i32* @ch, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [100 x %struct._NODE]* @rgnNodes, i32 0, i64 %13
  %15 = getelementptr inbounds %struct._NODE* %14, i32 0, i32 1
  store i32 9999, i32* %15, align 4
  br label %16

; <label>:16                                      ; preds = %7
  %17 = load i32* @ch, align 4
  %18 = add nsw i32 %17, 1
  store i32 %18, i32* @ch, align 4
  br label %4

; <label>:19                                      ; preds = %4
  %20 = load i32* %2, align 4
  %21 = load i32* %3, align 4
  %22 = icmp eq i32 %20, %21
  br i1 %22, label %23, label %25

; <label>:23                                      ; preds = %19
  %24 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([54 x i8]* @.str2, i32 0, i32 0))
  br label %102

; <label>:25                                      ; preds = %19
  %26 = load i32* %2, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds [100 x %struct._NODE]* @rgnNodes, i32 0, i64 %27
  %29 = getelementptr inbounds %struct._NODE* %28, i32 0, i32 0
  store i32 0, i32* %29, align 4
  %30 = load i32* %2, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [100 x %struct._NODE]* @rgnNodes, i32 0, i64 %31
  %33 = getelementptr inbounds %struct._NODE* %32, i32 0, i32 1
  store i32 9999, i32* %33, align 4
  %34 = load i32* %2, align 4
  call void @enqueue(i32 %34, i32 0, i32 9999)
  br label %35

; <label>:35                                      ; preds = %91, %25
  %36 = call i32 @qcount()
  %37 = icmp sgt i32 %36, 0
  br i1 %37, label %38, label %92

; <label>:38                                      ; preds = %35
  call void @dequeue(i32* @iNode, i32* @iDist, i32* @iPrev)
  store i32 0, i32* @i, align 4
  br label %39

; <label>:39                                      ; preds = %88, %38
  %40 = load i32* @i, align 4
  %41 = icmp slt i32 %40, 100
  br i1 %41, label %42, label %91

; <label>:42                                      ; preds = %39
  %43 = load i32* @i, align 4
  %44 = sext i32 %43 to i64
  %45 = load i32* @iNode, align 4
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds [100 x [100 x i32]]* @AdjMatrix, i32 0, i64 %46
  %48 = getelementptr inbounds [100 x i32]* %47, i32 0, i64 %44
  %49 = load i32* %48, align 4
  store i32 %49, i32* @iCost, align 4
  %50 = icmp ne i32 %49, 9999
  br i1 %50, label %51, label %87

; <label>:51                                      ; preds = %42
  %52 = load i32* @i, align 4
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds [100 x %struct._NODE]* @rgnNodes, i32 0, i64 %53
  %55 = getelementptr inbounds %struct._NODE* %54, i32 0, i32 0
  %56 = load i32* %55, align 4
  %57 = icmp eq i32 9999, %56
  br i1 %57, label %68, label %58

; <label>:58                                      ; preds = %51
  %59 = load i32* @i, align 4
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds [100 x %struct._NODE]* @rgnNodes, i32 0, i64 %60
  %62 = getelementptr inbounds %struct._NODE* %61, i32 0, i32 0
  %63 = load i32* %62, align 4
  %64 = load i32* @iCost, align 4
  %65 = load i32* @iDist, align 4
  %66 = add nsw i32 %64, %65
  %67 = icmp sgt i32 %63, %66
  br i1 %67, label %68, label %86

; <label>:68                                      ; preds = %58, %51
  %69 = load i32* @iDist, align 4
  %70 = load i32* @iCost, align 4
  %71 = add nsw i32 %69, %70
  %72 = load i32* @i, align 4
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds [100 x %struct._NODE]* @rgnNodes, i32 0, i64 %73
  %75 = getelementptr inbounds %struct._NODE* %74, i32 0, i32 0
  store i32 %71, i32* %75, align 4
  %76 = load i32* @iNode, align 4
  %77 = load i32* @i, align 4
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds [100 x %struct._NODE]* @rgnNodes, i32 0, i64 %78
  %80 = getelementptr inbounds %struct._NODE* %79, i32 0, i32 1
  store i32 %76, i32* %80, align 4
  %81 = load i32* @i, align 4
  %82 = load i32* @iDist, align 4
  %83 = load i32* @iCost, align 4
  %84 = add nsw i32 %82, %83
  %85 = load i32* @iNode, align 4
  call void @enqueue(i32 %81, i32 %84, i32 %85)
  br label %86

; <label>:86                                      ; preds = %68, %58
  br label %87

; <label>:87                                      ; preds = %86, %42
  br label %88

; <label>:88                                      ; preds = %87
  %89 = load i32* @i, align 4
  %90 = add nsw i32 %89, 1
  store i32 %90, i32* @i, align 4
  br label %39

; <label>:91                                      ; preds = %39
  br label %35

; <label>:92                                      ; preds = %35
  %93 = load i32* %3, align 4
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds [100 x %struct._NODE]* @rgnNodes, i32 0, i64 %94
  %96 = getelementptr inbounds %struct._NODE* %95, i32 0, i32 0
  %97 = load i32* %96, align 4
  %98 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([30 x i8]* @.str3, i32 0, i32 0), i32 %97)
  %99 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str4, i32 0, i32 0))
  %100 = load i32* %3, align 4
  call void @print_path(%struct._NODE* getelementptr inbounds ([100 x %struct._NODE]* @rgnNodes, i32 0, i32 0), i32 %100)
  %101 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str5, i32 0, i32 0))
  br label %102

; <label>:102                                     ; preds = %92, %23
  %103 = load i32* %1
  ret i32 %103
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %fp = alloca %struct._IO_FILE*, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = load i32* %2, align 4
  %5 = icmp slt i32 %4, 2
  br i1 %5, label %6, label %11

; <label>:6                                       ; preds = %0
  %7 = load %struct._IO_FILE** @stderr, align 8
  %8 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([28 x i8]* @.str6, i32 0, i32 0))
  %9 = load %struct._IO_FILE** @stderr, align 8
  %10 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([41 x i8]* @.str7, i32 0, i32 0))
  br label %11

; <label>:11                                      ; preds = %6, %0
  %12 = load i8*** %3, align 8
  %13 = getelementptr inbounds i8** %12, i64 1
  %14 = load i8** %13, align 8
  %15 = call %struct._IO_FILE* @fopen(i8* %14, i8* getelementptr inbounds ([2 x i8]* @.str8, i32 0, i32 0))
  store %struct._IO_FILE* %15, %struct._IO_FILE** %fp, align 8
  store i32 0, i32* %i, align 4
  br label %16

; <label>:16                                      ; preds = %37, %11
  %17 = load i32* %i, align 4
  %18 = icmp slt i32 %17, 100
  br i1 %18, label %19, label %40

; <label>:19                                      ; preds = %16
  store i32 0, i32* %j, align 4
  br label %20

; <label>:20                                      ; preds = %33, %19
  %21 = load i32* %j, align 4
  %22 = icmp slt i32 %21, 100
  br i1 %22, label %23, label %36

; <label>:23                                      ; preds = %20
  %24 = load %struct._IO_FILE** %fp, align 8
  %25 = call i32 (%struct._IO_FILE*, i8*, ...)* @__isoc99_fscanf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([3 x i8]* @.str9, i32 0, i32 0), i32* %k)
  %26 = load i32* %k, align 4
  %27 = load i32* %j, align 4
  %28 = sext i32 %27 to i64
  %29 = load i32* %i, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [100 x [100 x i32]]* @AdjMatrix, i32 0, i64 %30
  %32 = getelementptr inbounds [100 x i32]* %31, i32 0, i64 %28
  store i32 %26, i32* %32, align 4
  br label %33

; <label>:33                                      ; preds = %23
  %34 = load i32* %j, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, i32* %j, align 4
  br label %20

; <label>:36                                      ; preds = %20
  br label %37

; <label>:37                                      ; preds = %36
  %38 = load i32* %i, align 4
  %39 = add nsw i32 %38, 1
  store i32 %39, i32* %i, align 4
  br label %16

; <label>:40                                      ; preds = %16
  store i32 0, i32* %i, align 4
  store i32 50, i32* %j, align 4
  br label %41

; <label>:41                                      ; preds = %50, %40
  %42 = load i32* %i, align 4
  %43 = icmp slt i32 %42, 20
  br i1 %43, label %44, label %55

; <label>:44                                      ; preds = %41
  %45 = load i32* %j, align 4
  %46 = srem i32 %45, 100
  store i32 %46, i32* %j, align 4
  %47 = load i32* %i, align 4
  %48 = load i32* %j, align 4
  %49 = call i32 @dijkstra(i32 %47, i32 %48)
  br label %50

; <label>:50                                      ; preds = %44
  %51 = load i32* %i, align 4
  %52 = add nsw i32 %51, 1
  store i32 %52, i32* %i, align 4
  %53 = load i32* %j, align 4
  %54 = add nsw i32 %53, 1
  store i32 %54, i32* %j, align 4
  br label %41

; <label>:55                                      ; preds = %41
  call void @exit(i32 0) #3
  unreachable
                                                  ; No predecessors!
  %57 = load i32* %1
  ret i32 %57
}

declare %struct._IO_FILE* @fopen(i8*, i8*) #1

declare i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.4 (tags/RELEASE_34/final)"}
