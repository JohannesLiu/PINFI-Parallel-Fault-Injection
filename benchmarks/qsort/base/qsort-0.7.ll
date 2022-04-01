; ModuleID = 'temp2.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.myStringStruct = type { [128 x i8] }

@stderr = external global %struct._IO_FILE*
@.str = private unnamed_addr constant [27 x i8] c"Usage: qsort_small <file>\0A\00", align 1
@.str1 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str2 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str3 = private unnamed_addr constant [24 x i8] c"\0ASorting %d elements.\0A\0A\00", align 1
@.str4 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@global_var1 = global i64 0, align 8
@global_var2 = global i64 0, align 8

; Function Attrs: nounwind uwtable
define i32 @compare(i8* %elem1, i8* %elem2) #0 {
  %1 = alloca i8*, align 8, !llfi_index !1
  %2 = alloca i8*, align 8, !llfi_index !2
  %result = alloca i32, align 4, !llfi_index !3
  store i8* %elem1, i8** %1, align 8, !llfi_index !4
  store i8* %elem2, i8** %2, align 8, !llfi_index !5
  %3 = load i8** %1, align 8, !llfi_index !6
  %4 = load i8** %1, align 8, !llfi_index !6
  %5 = bitcast i8* %3 to %struct.myStringStruct*, !llfi_index !7
  %6 = bitcast i8* %4 to %struct.myStringStruct*, !llfi_index !7
  %7 = getelementptr inbounds %struct.myStringStruct* %5, i32 0, i32 0, !llfi_index !8
  %8 = getelementptr inbounds %struct.myStringStruct* %6, i32 0, i32 0, !llfi_index !8
  %9 = getelementptr inbounds [128 x i8]* %7, i32 0, i32 0, !llfi_index !9
  %10 = getelementptr inbounds [128 x i8]* %8, i32 0, i32 0, !llfi_index !9
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %9, i8* %10)
  %11 = load i8** %2, align 8, !llfi_index !10
  %12 = load i8** %2, align 8, !llfi_index !10
  %13 = bitcast i8* %11 to %struct.myStringStruct*, !llfi_index !11
  %14 = bitcast i8* %12 to %struct.myStringStruct*, !llfi_index !11
  %15 = getelementptr inbounds %struct.myStringStruct* %13, i32 0, i32 0, !llfi_index !12
  %16 = getelementptr inbounds %struct.myStringStruct* %14, i32 0, i32 0, !llfi_index !12
  %17 = getelementptr inbounds [128 x i8]* %15, i32 0, i32 0, !llfi_index !13
  %18 = getelementptr inbounds [128 x i8]* %16, i32 0, i32 0, !llfi_index !13
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %17, i8* %18)
  %19 = call i32 @strcmp(i8* %9, i8* %17) #4, !llfi_index !14
  store i32 %19, i32* %result, align 4, !llfi_index !15
  %20 = load i32* %result, align 4, !llfi_index !16
  %21 = load i32* %result, align 4, !llfi_index !16
  %22 = icmp slt i32 %20, 0, !llfi_index !17
  %23 = icmp slt i32 %21, 0, !llfi_index !17
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %22, i1 %23)
  br i1 %22, label %24, label %25, !llfi_index !18

; <label>:24                                      ; preds = %0
  br label %31, !llfi_index !19

; <label>:25                                      ; preds = %0
  %26 = load i32* %result, align 4, !llfi_index !20
  %27 = load i32* %result, align 4, !llfi_index !20
  %28 = icmp eq i32 %26, 0, !llfi_index !21
  %29 = icmp eq i32 %27, 0, !llfi_index !21
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %28, i1 %29)
  %30 = select i1 %28, i32 0, i32 -1, !llfi_index !22
  br label %31, !llfi_index !23

; <label>:31                                      ; preds = %25, %24
  %32 = phi i32 [ 1, %24 ], [ %30, %25 ], !llfi_index !24
  ret i32 %32, !llfi_index !25
}

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4, !llfi_index !26
  %2 = alloca i32, align 4, !llfi_index !27
  %3 = alloca i8**, align 8, !llfi_index !28
  %array = alloca [60000 x %struct.myStringStruct], align 16, !llfi_index !29
  %fp = alloca %struct._IO_FILE*, align 8, !llfi_index !30
  %i = alloca i32, align 4, !llfi_index !31
  %count = alloca i32, align 4, !llfi_index !32
  store i32 0, i32* %1, !llfi_index !33
  store i32 %argc, i32* %2, align 4, !llfi_index !34
  store i8** %argv, i8*** %3, align 8, !llfi_index !35
  store i32 0, i32* %count, align 4, !llfi_index !36
  %4 = load i32* %2, align 4, !llfi_index !37
  %5 = load i32* %2, align 4, !llfi_index !37
  %6 = icmp slt i32 %4, 2, !llfi_index !38
  %7 = icmp slt i32 %5, 2, !llfi_index !38
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %6, i1 %7)
  br i1 %6, label %8, label %12, !llfi_index !39

; <label>:8                                       ; preds = %0
  %9 = load %struct._IO_FILE** @stderr, align 8, !llfi_index !40
  %10 = load %struct._IO_FILE** @stderr, align 8, !llfi_index !40
  call void bitcast (void (i64, i64)* @global_add to void (%struct._IO_FILE*, %struct._IO_FILE*)*)(%struct._IO_FILE* %9, %struct._IO_FILE* %10)
  %11 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([27 x i8]* @.str, i32 0, i32 0)), !llfi_index !41
  call void @global_check()
  call void @exit(i32 -1) #5, !llfi_index !42
  unreachable, !llfi_index !43

; <label>:12                                      ; preds = %0
  %13 = load i8*** %3, align 8, !llfi_index !44
  %14 = load i8*** %3, align 8, !llfi_index !44
  %15 = getelementptr inbounds i8** %13, i64 1, !llfi_index !45
  %16 = getelementptr inbounds i8** %14, i64 1, !llfi_index !45
  %17 = load i8** %15, align 8, !llfi_index !46
  %18 = load i8** %16, align 8, !llfi_index !46
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %17, i8* %18)
  %19 = call %struct._IO_FILE* @fopen(i8* %17, i8* getelementptr inbounds ([2 x i8]* @.str1, i32 0, i32 0)), !llfi_index !47
  store %struct._IO_FILE* %19, %struct._IO_FILE** %fp, align 8, !llfi_index !48
  br label %20, !llfi_index !49

; <label>:20                                      ; preds = %41, %12
  %21 = load %struct._IO_FILE** %fp, align 8, !llfi_index !50
  %22 = load %struct._IO_FILE** %fp, align 8, !llfi_index !50
  call void bitcast (void (i64, i64)* @global_add to void (%struct._IO_FILE*, %struct._IO_FILE*)*)(%struct._IO_FILE* %21, %struct._IO_FILE* %22)
  %23 = load i32* %count, align 4, !llfi_index !51
  %24 = load i32* %count, align 4, !llfi_index !51
  %25 = sext i32 %23 to i64, !llfi_index !52
  %26 = sext i32 %24 to i64, !llfi_index !52
  %27 = getelementptr inbounds [60000 x %struct.myStringStruct]* %array, i32 0, i64 %25, !llfi_index !53
  %28 = getelementptr inbounds [60000 x %struct.myStringStruct]* %array, i32 0, i64 %26, !llfi_index !53
  %29 = getelementptr inbounds %struct.myStringStruct* %27, i32 0, i32 0, !llfi_index !54
  %30 = getelementptr inbounds %struct.myStringStruct* %28, i32 0, i32 0, !llfi_index !54
  call void bitcast (void (i64, i64)* @global_add to void ([128 x i8]*, [128 x i8]*)*)([128 x i8]* %29, [128 x i8]* %30)
  %31 = call i32 (%struct._IO_FILE*, i8*, ...)* @__isoc99_fscanf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([3 x i8]* @.str2, i32 0, i32 0), [128 x i8]* %29), !llfi_index !55
  %32 = icmp eq i32 %31, 1, !llfi_index !56
  %33 = icmp eq i32 %31, 1, !llfi_index !56
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %32, i1 %33)
  br i1 %32, label %34, label %39, !llfi_index !57

; <label>:34                                      ; preds = %20
  %35 = load i32* %count, align 4, !llfi_index !58
  %36 = load i32* %count, align 4, !llfi_index !58
  %37 = icmp slt i32 %35, 60000, !llfi_index !59
  %38 = icmp slt i32 %36, 60000, !llfi_index !59
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %37, i1 %38)
  br label %39, !llfi_index !60

; <label>:39                                      ; preds = %34, %20
  %40 = phi i1 [ false, %20 ], [ %37, %34 ], !llfi_index !61
  br i1 %40, label %41, label %46, !llfi_index !62

; <label>:41                                      ; preds = %39
  %42 = load i32* %count, align 4, !llfi_index !63
  %43 = load i32* %count, align 4, !llfi_index !63
  %44 = add nsw i32 %42, 1, !llfi_index !64
  %45 = add nsw i32 %43, 1, !llfi_index !64
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %44, i32 %45)
  store i32 %44, i32* %count, align 4, !llfi_index !65
  br label %20, !llfi_index !66

; <label>:46                                      ; preds = %39
  br label %47, !llfi_index !67

; <label>:47                                      ; preds = %46
  %48 = load i32* %count, align 4, !llfi_index !68
  %49 = load i32* %count, align 4, !llfi_index !68
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %48, i32 %49)
  %50 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([24 x i8]* @.str3, i32 0, i32 0), i32 %48), !llfi_index !69
  %51 = getelementptr inbounds [60000 x %struct.myStringStruct]* %array, i32 0, i32 0, !llfi_index !70
  %52 = getelementptr inbounds [60000 x %struct.myStringStruct]* %array, i32 0, i32 0, !llfi_index !70
  %53 = bitcast %struct.myStringStruct* %51 to i8*, !llfi_index !71
  %54 = bitcast %struct.myStringStruct* %52 to i8*, !llfi_index !71
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %53, i8* %54)
  %55 = load i32* %count, align 4, !llfi_index !72
  %56 = load i32* %count, align 4, !llfi_index !72
  %57 = sext i32 %55 to i64, !llfi_index !73
  %58 = sext i32 %56 to i64, !llfi_index !73
  call void @global_add(i64 %57, i64 %58)
  call void @qsort(i8* %53, i64 %57, i64 128, i32 (i8*, i8*)* @compare), !llfi_index !74
  store i32 0, i32* %i, align 4, !llfi_index !75
  br label %59, !llfi_index !76

; <label>:59                                      ; preds = %78, %47
  %60 = load i32* %i, align 4, !llfi_index !77
  %61 = load i32* %i, align 4, !llfi_index !77
  %62 = load i32* %count, align 4, !llfi_index !78
  %63 = load i32* %count, align 4, !llfi_index !78
  %64 = icmp slt i32 %60, %62, !llfi_index !79
  %65 = icmp slt i32 %61, %63, !llfi_index !79
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %64, i1 %65)
  br i1 %64, label %66, label %83, !llfi_index !80

; <label>:66                                      ; preds = %59
  %67 = load i32* %i, align 4, !llfi_index !81
  %68 = load i32* %i, align 4, !llfi_index !81
  %69 = sext i32 %67 to i64, !llfi_index !82
  %70 = sext i32 %68 to i64, !llfi_index !82
  %71 = getelementptr inbounds [60000 x %struct.myStringStruct]* %array, i32 0, i64 %69, !llfi_index !83
  %72 = getelementptr inbounds [60000 x %struct.myStringStruct]* %array, i32 0, i64 %70, !llfi_index !83
  %73 = getelementptr inbounds %struct.myStringStruct* %71, i32 0, i32 0, !llfi_index !84
  %74 = getelementptr inbounds %struct.myStringStruct* %72, i32 0, i32 0, !llfi_index !84
  %75 = getelementptr inbounds [128 x i8]* %73, i32 0, i32 0, !llfi_index !85
  %76 = getelementptr inbounds [128 x i8]* %74, i32 0, i32 0, !llfi_index !85
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %75, i8* %76)
  %77 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str4, i32 0, i32 0), i8* %75), !llfi_index !86
  br label %78, !llfi_index !87

; <label>:78                                      ; preds = %66
  %79 = load i32* %i, align 4, !llfi_index !88
  %80 = load i32* %i, align 4, !llfi_index !88
  %81 = add nsw i32 %79, 1, !llfi_index !89
  %82 = add nsw i32 %80, 1, !llfi_index !89
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %81, i32 %82)
  store i32 %81, i32* %i, align 4, !llfi_index !90
  br label %59, !llfi_index !91

; <label>:83                                      ; preds = %59
  call void @global_check()
  ret i32 0, !llfi_index !92
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

declare %struct._IO_FILE* @fopen(i8*, i8*) #2

declare i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #2

declare i32 @printf(i8*, ...) #2

declare void @qsort(i8*, i64, i64, i32 (i8*, i8*)*) #2

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
  call void @exit(i32 99) #5
  unreachable

; <label>:5                                       ; preds = %0
  ret void
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly }
attributes #5 = { noreturn nounwind }

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
