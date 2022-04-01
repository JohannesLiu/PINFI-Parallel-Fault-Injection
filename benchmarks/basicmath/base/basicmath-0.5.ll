; ModuleID = 'temp2.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.int_sqrt = type { i32, i32 }

@.str = private unnamed_addr constant [39 x i8] c"********* CUBIC FUNCTIONS ***********\0A\00", align 1
@.str1 = private unnamed_addr constant [11 x i8] c"Solutions:\00", align 1
@.str2 = private unnamed_addr constant [4 x i8] c" %f\00", align 1
@.str3 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str4 = private unnamed_addr constant [41 x i8] c"********* INTEGER SQR ROOTS ***********\0A\00", align 1
@.str5 = private unnamed_addr constant [17 x i8] c"sqrt(%3d) = %2d\0A\00", align 1
@.str6 = private unnamed_addr constant [17 x i8] c"\0Asqrt(%lX) = %X\0A\00", align 1
@.str7 = private unnamed_addr constant [40 x i8] c"********* ANGLE CONVERSION ***********\0A\00", align 1
@.str8 = private unnamed_addr constant [31 x i8] c"%3.0f degrees = %.12f radians\0A\00", align 1
@.str9 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str10 = private unnamed_addr constant [31 x i8] c"%.12f radians = %3.0f degrees\0A\00", align 1
@global_var1 = global i64 0, align 8
@global_var2 = global i64 0, align 8

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4, !llfi_index !1
  %a1 = alloca double, align 8, !llfi_index !2
  %b1 = alloca double, align 8, !llfi_index !3
  %c1 = alloca double, align 8, !llfi_index !4
  %d1 = alloca double, align 8, !llfi_index !5
  %a2 = alloca double, align 8, !llfi_index !6
  %b2 = alloca double, align 8, !llfi_index !7
  %c2 = alloca double, align 8, !llfi_index !8
  %d2 = alloca double, align 8, !llfi_index !9
  %a3 = alloca double, align 8, !llfi_index !10
  %b3 = alloca double, align 8, !llfi_index !11
  %c3 = alloca double, align 8, !llfi_index !12
  %d3 = alloca double, align 8, !llfi_index !13
  %a4 = alloca double, align 8, !llfi_index !14
  %b4 = alloca double, align 8, !llfi_index !15
  %c4 = alloca double, align 8, !llfi_index !16
  %d4 = alloca double, align 8, !llfi_index !17
  %x = alloca [3 x double], align 16, !llfi_index !18
  %X = alloca double, align 8, !llfi_index !19
  %solutions = alloca i32, align 4, !llfi_index !20
  %i = alloca i32, align 4, !llfi_index !21
  %l = alloca i64, align 8, !llfi_index !22
  %q = alloca %struct.int_sqrt, align 4, !llfi_index !23
  %n = alloca i64, align 8, !llfi_index !24
  store i32 0, i32* %1, !llfi_index !25
  store double 1.000000e+00, double* %a1, align 8, !llfi_index !26
  store double -1.050000e+01, double* %b1, align 8, !llfi_index !27
  store double 3.200000e+01, double* %c1, align 8, !llfi_index !28
  store double -3.000000e+01, double* %d1, align 8, !llfi_index !29
  store double 1.000000e+00, double* %a2, align 8, !llfi_index !30
  store double -4.500000e+00, double* %b2, align 8, !llfi_index !31
  store double 1.700000e+01, double* %c2, align 8, !llfi_index !32
  store double -3.000000e+01, double* %d2, align 8, !llfi_index !33
  store double 1.000000e+00, double* %a3, align 8, !llfi_index !34
  store double -3.500000e+00, double* %b3, align 8, !llfi_index !35
  store double 2.200000e+01, double* %c3, align 8, !llfi_index !36
  store double -3.100000e+01, double* %d3, align 8, !llfi_index !37
  store double 1.000000e+00, double* %a4, align 8, !llfi_index !38
  store double -1.370000e+01, double* %b4, align 8, !llfi_index !39
  store double 1.000000e+00, double* %c4, align 8, !llfi_index !40
  store double -3.500000e+01, double* %d4, align 8, !llfi_index !41
  store i64 1072497001, i64* %l, align 8, !llfi_index !42
  store i64 0, i64* %n, align 8, !llfi_index !43
  %2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([39 x i8]* @.str, i32 0, i32 0)), !llfi_index !44
  %3 = load double* %a1, align 8, !llfi_index !45
  %4 = load double* %a1, align 8, !llfi_index !45
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %3, double %4)
  %5 = load double* %b1, align 8, !llfi_index !46
  %6 = load double* %b1, align 8, !llfi_index !46
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %5, double %6)
  %7 = load double* %c1, align 8, !llfi_index !47
  %8 = load double* %c1, align 8, !llfi_index !47
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %7, double %8)
  %9 = load double* %d1, align 8, !llfi_index !48
  %10 = load double* %d1, align 8, !llfi_index !48
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %9, double %10)
  %11 = getelementptr inbounds [3 x double]* %x, i32 0, i32 0, !llfi_index !49
  %12 = getelementptr inbounds [3 x double]* %x, i32 0, i32 0, !llfi_index !49
  call void bitcast (void (i64, i64)* @global_add to void (double*, double*)*)(double* %11, double* %12)
  call void @SolveCubic(double %3, double %5, double %7, double %9, i32* %solutions, double* %11), !llfi_index !50
  %13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str1, i32 0, i32 0)), !llfi_index !51
  store i32 0, i32* %i, align 4, !llfi_index !52
  br label %14, !llfi_index !53

; <label>:14                                      ; preds = %31, %0
  %15 = load i32* %i, align 4, !llfi_index !54
  %16 = load i32* %i, align 4, !llfi_index !54
  %17 = load i32* %solutions, align 4, !llfi_index !55
  %18 = load i32* %solutions, align 4, !llfi_index !55
  %19 = icmp slt i32 %15, %17, !llfi_index !56
  %20 = icmp slt i32 %16, %18, !llfi_index !56
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %19, i1 %20)
  br i1 %19, label %21, label %36, !llfi_index !57

; <label>:21                                      ; preds = %14
  %22 = load i32* %i, align 4, !llfi_index !58
  %23 = load i32* %i, align 4, !llfi_index !58
  %24 = sext i32 %22 to i64, !llfi_index !59
  %25 = sext i32 %23 to i64, !llfi_index !59
  %26 = getelementptr inbounds [3 x double]* %x, i32 0, i64 %24, !llfi_index !60
  %27 = getelementptr inbounds [3 x double]* %x, i32 0, i64 %25, !llfi_index !60
  %28 = load double* %26, align 8, !llfi_index !61
  %29 = load double* %27, align 8, !llfi_index !61
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %28, double %29)
  %30 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str2, i32 0, i32 0), double %28), !llfi_index !62
  br label %31, !llfi_index !63

; <label>:31                                      ; preds = %21
  %32 = load i32* %i, align 4, !llfi_index !64
  %33 = load i32* %i, align 4, !llfi_index !64
  %34 = add nsw i32 %32, 1, !llfi_index !65
  %35 = add nsw i32 %33, 1, !llfi_index !65
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %34, i32 %35)
  store i32 %34, i32* %i, align 4, !llfi_index !66
  br label %14, !llfi_index !67

; <label>:36                                      ; preds = %14
  %37 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str3, i32 0, i32 0)), !llfi_index !68
  %38 = load double* %a2, align 8, !llfi_index !69
  %39 = load double* %a2, align 8, !llfi_index !69
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %38, double %39)
  %40 = load double* %b2, align 8, !llfi_index !70
  %41 = load double* %b2, align 8, !llfi_index !70
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %40, double %41)
  %42 = load double* %c2, align 8, !llfi_index !71
  %43 = load double* %c2, align 8, !llfi_index !71
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %42, double %43)
  %44 = load double* %d2, align 8, !llfi_index !72
  %45 = load double* %d2, align 8, !llfi_index !72
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %44, double %45)
  %46 = getelementptr inbounds [3 x double]* %x, i32 0, i32 0, !llfi_index !73
  %47 = getelementptr inbounds [3 x double]* %x, i32 0, i32 0, !llfi_index !73
  call void bitcast (void (i64, i64)* @global_add to void (double*, double*)*)(double* %46, double* %47)
  call void @SolveCubic(double %38, double %40, double %42, double %44, i32* %solutions, double* %46), !llfi_index !74
  %48 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str1, i32 0, i32 0)), !llfi_index !75
  store i32 0, i32* %i, align 4, !llfi_index !76
  br label %49, !llfi_index !77

; <label>:49                                      ; preds = %66, %36
  %50 = load i32* %i, align 4, !llfi_index !78
  %51 = load i32* %i, align 4, !llfi_index !78
  %52 = load i32* %solutions, align 4, !llfi_index !79
  %53 = load i32* %solutions, align 4, !llfi_index !79
  %54 = icmp slt i32 %50, %52, !llfi_index !80
  %55 = icmp slt i32 %51, %53, !llfi_index !80
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %54, i1 %55)
  br i1 %54, label %56, label %71, !llfi_index !81

; <label>:56                                      ; preds = %49
  %57 = load i32* %i, align 4, !llfi_index !82
  %58 = load i32* %i, align 4, !llfi_index !82
  %59 = sext i32 %57 to i64, !llfi_index !83
  %60 = sext i32 %58 to i64, !llfi_index !83
  %61 = getelementptr inbounds [3 x double]* %x, i32 0, i64 %59, !llfi_index !84
  %62 = getelementptr inbounds [3 x double]* %x, i32 0, i64 %60, !llfi_index !84
  %63 = load double* %61, align 8, !llfi_index !85
  %64 = load double* %62, align 8, !llfi_index !85
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %63, double %64)
  %65 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str2, i32 0, i32 0), double %63), !llfi_index !86
  br label %66, !llfi_index !87

; <label>:66                                      ; preds = %56
  %67 = load i32* %i, align 4, !llfi_index !88
  %68 = load i32* %i, align 4, !llfi_index !88
  %69 = add nsw i32 %67, 1, !llfi_index !89
  %70 = add nsw i32 %68, 1, !llfi_index !89
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %69, i32 %70)
  store i32 %69, i32* %i, align 4, !llfi_index !90
  br label %49, !llfi_index !91

; <label>:71                                      ; preds = %49
  %72 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str3, i32 0, i32 0)), !llfi_index !92
  %73 = load double* %a3, align 8, !llfi_index !93
  %74 = load double* %a3, align 8, !llfi_index !93
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %73, double %74)
  %75 = load double* %b3, align 8, !llfi_index !94
  %76 = load double* %b3, align 8, !llfi_index !94
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %75, double %76)
  %77 = load double* %c3, align 8, !llfi_index !95
  %78 = load double* %c3, align 8, !llfi_index !95
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %77, double %78)
  %79 = load double* %d3, align 8, !llfi_index !96
  %80 = load double* %d3, align 8, !llfi_index !96
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %79, double %80)
  %81 = getelementptr inbounds [3 x double]* %x, i32 0, i32 0, !llfi_index !97
  %82 = getelementptr inbounds [3 x double]* %x, i32 0, i32 0, !llfi_index !97
  call void bitcast (void (i64, i64)* @global_add to void (double*, double*)*)(double* %81, double* %82)
  call void @SolveCubic(double %73, double %75, double %77, double %79, i32* %solutions, double* %81), !llfi_index !98
  %83 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str1, i32 0, i32 0)), !llfi_index !99
  store i32 0, i32* %i, align 4, !llfi_index !100
  br label %84, !llfi_index !101

; <label>:84                                      ; preds = %101, %71
  %85 = load i32* %i, align 4, !llfi_index !102
  %86 = load i32* %i, align 4, !llfi_index !102
  %87 = load i32* %solutions, align 4, !llfi_index !103
  %88 = load i32* %solutions, align 4, !llfi_index !103
  %89 = icmp slt i32 %85, %87, !llfi_index !104
  %90 = icmp slt i32 %86, %88, !llfi_index !104
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %89, i1 %90)
  br i1 %89, label %91, label %106, !llfi_index !105

; <label>:91                                      ; preds = %84
  %92 = load i32* %i, align 4, !llfi_index !106
  %93 = load i32* %i, align 4, !llfi_index !106
  %94 = sext i32 %92 to i64, !llfi_index !107
  %95 = sext i32 %93 to i64, !llfi_index !107
  %96 = getelementptr inbounds [3 x double]* %x, i32 0, i64 %94, !llfi_index !108
  %97 = getelementptr inbounds [3 x double]* %x, i32 0, i64 %95, !llfi_index !108
  %98 = load double* %96, align 8, !llfi_index !109
  %99 = load double* %97, align 8, !llfi_index !109
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %98, double %99)
  %100 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str2, i32 0, i32 0), double %98), !llfi_index !110
  br label %101, !llfi_index !111

; <label>:101                                     ; preds = %91
  %102 = load i32* %i, align 4, !llfi_index !112
  %103 = load i32* %i, align 4, !llfi_index !112
  %104 = add nsw i32 %102, 1, !llfi_index !113
  %105 = add nsw i32 %103, 1, !llfi_index !113
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %104, i32 %105)
  store i32 %104, i32* %i, align 4, !llfi_index !114
  br label %84, !llfi_index !115

; <label>:106                                     ; preds = %84
  %107 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str3, i32 0, i32 0)), !llfi_index !116
  %108 = load double* %a4, align 8, !llfi_index !117
  %109 = load double* %a4, align 8, !llfi_index !117
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %108, double %109)
  %110 = load double* %b4, align 8, !llfi_index !118
  %111 = load double* %b4, align 8, !llfi_index !118
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %110, double %111)
  %112 = load double* %c4, align 8, !llfi_index !119
  %113 = load double* %c4, align 8, !llfi_index !119
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %112, double %113)
  %114 = load double* %d4, align 8, !llfi_index !120
  %115 = load double* %d4, align 8, !llfi_index !120
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %114, double %115)
  %116 = getelementptr inbounds [3 x double]* %x, i32 0, i32 0, !llfi_index !121
  %117 = getelementptr inbounds [3 x double]* %x, i32 0, i32 0, !llfi_index !121
  call void bitcast (void (i64, i64)* @global_add to void (double*, double*)*)(double* %116, double* %117)
  call void @SolveCubic(double %108, double %110, double %112, double %114, i32* %solutions, double* %116), !llfi_index !122
  %118 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str1, i32 0, i32 0)), !llfi_index !123
  store i32 0, i32* %i, align 4, !llfi_index !124
  br label %119, !llfi_index !125

; <label>:119                                     ; preds = %136, %106
  %120 = load i32* %i, align 4, !llfi_index !126
  %121 = load i32* %i, align 4, !llfi_index !126
  %122 = load i32* %solutions, align 4, !llfi_index !127
  %123 = load i32* %solutions, align 4, !llfi_index !127
  %124 = icmp slt i32 %120, %122, !llfi_index !128
  %125 = icmp slt i32 %121, %123, !llfi_index !128
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %124, i1 %125)
  br i1 %124, label %126, label %141, !llfi_index !129

; <label>:126                                     ; preds = %119
  %127 = load i32* %i, align 4, !llfi_index !130
  %128 = load i32* %i, align 4, !llfi_index !130
  %129 = sext i32 %127 to i64, !llfi_index !131
  %130 = sext i32 %128 to i64, !llfi_index !131
  %131 = getelementptr inbounds [3 x double]* %x, i32 0, i64 %129, !llfi_index !132
  %132 = getelementptr inbounds [3 x double]* %x, i32 0, i64 %130, !llfi_index !132
  %133 = load double* %131, align 8, !llfi_index !133
  %134 = load double* %132, align 8, !llfi_index !133
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %133, double %134)
  %135 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str2, i32 0, i32 0), double %133), !llfi_index !134
  br label %136, !llfi_index !135

; <label>:136                                     ; preds = %126
  %137 = load i32* %i, align 4, !llfi_index !136
  %138 = load i32* %i, align 4, !llfi_index !136
  %139 = add nsw i32 %137, 1, !llfi_index !137
  %140 = add nsw i32 %138, 1, !llfi_index !137
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %139, i32 %140)
  store i32 %139, i32* %i, align 4, !llfi_index !138
  br label %119, !llfi_index !139

; <label>:141                                     ; preds = %119
  %142 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str3, i32 0, i32 0)), !llfi_index !140
  store double 1.000000e+00, double* %a1, align 8, !llfi_index !141
  br label %143, !llfi_index !142

; <label>:143                                     ; preds = %220, %141
  %144 = load double* %a1, align 8, !llfi_index !143
  %145 = load double* %a1, align 8, !llfi_index !143
  %146 = fcmp olt double %144, 1.000000e+01, !llfi_index !144
  %147 = fcmp olt double %145, 1.000000e+01, !llfi_index !144
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %146, i1 %147)
  br i1 %146, label %148, label %225, !llfi_index !145

; <label>:148                                     ; preds = %143
  store double 1.000000e+01, double* %b1, align 8, !llfi_index !146
  br label %149, !llfi_index !147

; <label>:149                                     ; preds = %214, %148
  %150 = load double* %b1, align 8, !llfi_index !148
  %151 = load double* %b1, align 8, !llfi_index !148
  %152 = fcmp ogt double %150, 0.000000e+00, !llfi_index !149
  %153 = fcmp ogt double %151, 0.000000e+00, !llfi_index !149
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %152, i1 %153)
  br i1 %152, label %154, label %219, !llfi_index !150

; <label>:154                                     ; preds = %149
  store double 5.000000e+00, double* %c1, align 8, !llfi_index !151
  br label %155, !llfi_index !152

; <label>:155                                     ; preds = %208, %154
  %156 = load double* %c1, align 8, !llfi_index !153
  %157 = load double* %c1, align 8, !llfi_index !153
  %158 = fcmp olt double %156, 1.500000e+01, !llfi_index !154
  %159 = fcmp olt double %157, 1.500000e+01, !llfi_index !154
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %158, i1 %159)
  br i1 %158, label %160, label %213, !llfi_index !155

; <label>:160                                     ; preds = %155
  store double -1.000000e+00, double* %d1, align 8, !llfi_index !156
  br label %161, !llfi_index !157

; <label>:161                                     ; preds = %202, %160
  %162 = load double* %d1, align 8, !llfi_index !158
  %163 = load double* %d1, align 8, !llfi_index !158
  %164 = fcmp ogt double %162, -1.100000e+01, !llfi_index !159
  %165 = fcmp ogt double %163, -1.100000e+01, !llfi_index !159
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %164, i1 %165)
  br i1 %164, label %166, label %207, !llfi_index !160

; <label>:166                                     ; preds = %161
  %167 = load double* %a1, align 8, !llfi_index !161
  %168 = load double* %a1, align 8, !llfi_index !161
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %167, double %168)
  %169 = load double* %b1, align 8, !llfi_index !162
  %170 = load double* %b1, align 8, !llfi_index !162
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %169, double %170)
  %171 = load double* %c1, align 8, !llfi_index !163
  %172 = load double* %c1, align 8, !llfi_index !163
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %171, double %172)
  %173 = load double* %d1, align 8, !llfi_index !164
  %174 = load double* %d1, align 8, !llfi_index !164
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %173, double %174)
  %175 = getelementptr inbounds [3 x double]* %x, i32 0, i32 0, !llfi_index !165
  %176 = getelementptr inbounds [3 x double]* %x, i32 0, i32 0, !llfi_index !165
  call void bitcast (void (i64, i64)* @global_add to void (double*, double*)*)(double* %175, double* %176)
  call void @SolveCubic(double %167, double %169, double %171, double %173, i32* %solutions, double* %175), !llfi_index !166
  %177 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str1, i32 0, i32 0)), !llfi_index !167
  store i32 0, i32* %i, align 4, !llfi_index !168
  br label %178, !llfi_index !169

; <label>:178                                     ; preds = %195, %166
  %179 = load i32* %i, align 4, !llfi_index !170
  %180 = load i32* %i, align 4, !llfi_index !170
  %181 = load i32* %solutions, align 4, !llfi_index !171
  %182 = load i32* %solutions, align 4, !llfi_index !171
  %183 = icmp slt i32 %179, %181, !llfi_index !172
  %184 = icmp slt i32 %180, %182, !llfi_index !172
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %183, i1 %184)
  br i1 %183, label %185, label %200, !llfi_index !173

; <label>:185                                     ; preds = %178
  %186 = load i32* %i, align 4, !llfi_index !174
  %187 = load i32* %i, align 4, !llfi_index !174
  %188 = sext i32 %186 to i64, !llfi_index !175
  %189 = sext i32 %187 to i64, !llfi_index !175
  %190 = getelementptr inbounds [3 x double]* %x, i32 0, i64 %188, !llfi_index !176
  %191 = getelementptr inbounds [3 x double]* %x, i32 0, i64 %189, !llfi_index !176
  %192 = load double* %190, align 8, !llfi_index !177
  %193 = load double* %191, align 8, !llfi_index !177
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %192, double %193)
  %194 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str2, i32 0, i32 0), double %192), !llfi_index !178
  br label %195, !llfi_index !179

; <label>:195                                     ; preds = %185
  %196 = load i32* %i, align 4, !llfi_index !180
  %197 = load i32* %i, align 4, !llfi_index !180
  %198 = add nsw i32 %196, 1, !llfi_index !181
  %199 = add nsw i32 %197, 1, !llfi_index !181
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %198, i32 %199)
  store i32 %198, i32* %i, align 4, !llfi_index !182
  br label %178, !llfi_index !183

; <label>:200                                     ; preds = %178
  %201 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str3, i32 0, i32 0)), !llfi_index !184
  br label %202, !llfi_index !185

; <label>:202                                     ; preds = %200
  %203 = load double* %d1, align 8, !llfi_index !186
  %204 = load double* %d1, align 8, !llfi_index !186
  %205 = fadd double %203, -1.000000e+00, !llfi_index !187
  %206 = fadd double %204, -1.000000e+00, !llfi_index !187
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %205, double %206)
  store double %205, double* %d1, align 8, !llfi_index !188
  br label %161, !llfi_index !189

; <label>:207                                     ; preds = %161
  br label %208, !llfi_index !190

; <label>:208                                     ; preds = %207
  %209 = load double* %c1, align 8, !llfi_index !191
  %210 = load double* %c1, align 8, !llfi_index !191
  %211 = fadd double %209, 5.000000e-01, !llfi_index !192
  %212 = fadd double %210, 5.000000e-01, !llfi_index !192
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %211, double %212)
  store double %211, double* %c1, align 8, !llfi_index !193
  br label %155, !llfi_index !194

; <label>:213                                     ; preds = %155
  br label %214, !llfi_index !195

; <label>:214                                     ; preds = %213
  %215 = load double* %b1, align 8, !llfi_index !196
  %216 = load double* %b1, align 8, !llfi_index !196
  %217 = fadd double %215, -1.000000e+00, !llfi_index !197
  %218 = fadd double %216, -1.000000e+00, !llfi_index !197
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %217, double %218)
  store double %217, double* %b1, align 8, !llfi_index !198
  br label %149, !llfi_index !199

; <label>:219                                     ; preds = %149
  br label %220, !llfi_index !200

; <label>:220                                     ; preds = %219
  %221 = load double* %a1, align 8, !llfi_index !201
  %222 = load double* %a1, align 8, !llfi_index !201
  %223 = fadd double %221, 1.000000e+00, !llfi_index !202
  %224 = fadd double %222, 1.000000e+00, !llfi_index !202
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %223, double %224)
  store double %223, double* %a1, align 8, !llfi_index !203
  br label %143, !llfi_index !204

; <label>:225                                     ; preds = %143
  %226 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([41 x i8]* @.str4, i32 0, i32 0)), !llfi_index !205
  store i32 0, i32* %i, align 4, !llfi_index !206
  br label %227, !llfi_index !207

; <label>:227                                     ; preds = %244, %225
  %228 = load i32* %i, align 4, !llfi_index !208
  %229 = load i32* %i, align 4, !llfi_index !208
  %230 = icmp slt i32 %228, 1001, !llfi_index !209
  %231 = icmp slt i32 %229, 1001, !llfi_index !209
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %230, i1 %231)
  br i1 %230, label %232, label %249, !llfi_index !210

; <label>:232                                     ; preds = %227
  %233 = load i32* %i, align 4, !llfi_index !211
  %234 = load i32* %i, align 4, !llfi_index !211
  %235 = sext i32 %233 to i64, !llfi_index !212
  %236 = sext i32 %234 to i64, !llfi_index !212
  call void @global_add(i64 %235, i64 %236)
  call void @usqrt(i64 %235, %struct.int_sqrt* %q), !llfi_index !213
  %237 = load i32* %i, align 4, !llfi_index !214
  %238 = load i32* %i, align 4, !llfi_index !214
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %237, i32 %238)
  %239 = getelementptr inbounds %struct.int_sqrt* %q, i32 0, i32 0, !llfi_index !215
  %240 = getelementptr inbounds %struct.int_sqrt* %q, i32 0, i32 0, !llfi_index !215
  %241 = load i32* %239, align 4, !llfi_index !216
  %242 = load i32* %240, align 4, !llfi_index !216
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %241, i32 %242)
  %243 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str5, i32 0, i32 0), i32 %237, i32 %241), !llfi_index !217
  br label %244, !llfi_index !218

; <label>:244                                     ; preds = %232
  %245 = load i32* %i, align 4, !llfi_index !219
  %246 = load i32* %i, align 4, !llfi_index !219
  %247 = add nsw i32 %245, 1, !llfi_index !220
  %248 = add nsw i32 %246, 1, !llfi_index !220
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %247, i32 %248)
  store i32 %247, i32* %i, align 4, !llfi_index !221
  br label %227, !llfi_index !222

; <label>:249                                     ; preds = %227
  %250 = load i64* %l, align 8, !llfi_index !223
  %251 = load i64* %l, align 8, !llfi_index !223
  call void @global_add(i64 %250, i64 %251)
  call void @usqrt(i64 %250, %struct.int_sqrt* %q), !llfi_index !224
  %252 = load i64* %l, align 8, !llfi_index !225
  %253 = load i64* %l, align 8, !llfi_index !225
  call void @global_add(i64 %252, i64 %253)
  %254 = getelementptr inbounds %struct.int_sqrt* %q, i32 0, i32 0, !llfi_index !226
  %255 = getelementptr inbounds %struct.int_sqrt* %q, i32 0, i32 0, !llfi_index !226
  %256 = load i32* %254, align 4, !llfi_index !227
  %257 = load i32* %255, align 4, !llfi_index !227
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %256, i32 %257)
  %258 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str6, i32 0, i32 0), i64 %252, i32 %256), !llfi_index !228
  %259 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([40 x i8]* @.str7, i32 0, i32 0)), !llfi_index !229
  store double 0.000000e+00, double* %X, align 8, !llfi_index !230
  br label %260, !llfi_index !231

; <label>:260                                     ; preds = %278, %249
  %261 = load double* %X, align 8, !llfi_index !232
  %262 = load double* %X, align 8, !llfi_index !232
  %263 = fcmp ole double %261, 3.600000e+02, !llfi_index !233
  %264 = fcmp ole double %262, 3.600000e+02, !llfi_index !233
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %263, i1 %264)
  br i1 %263, label %265, label %283, !llfi_index !234

; <label>:265                                     ; preds = %260
  %266 = load double* %X, align 8, !llfi_index !235
  %267 = load double* %X, align 8, !llfi_index !235
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %266, double %267)
  %268 = load double* %X, align 8, !llfi_index !236
  %269 = load double* %X, align 8, !llfi_index !236
  %270 = call double @atan(double 1.000000e+00) #4, !llfi_index !237
  %271 = fmul double 4.000000e+00, %270, !llfi_index !238
  %272 = fmul double 4.000000e+00, %270, !llfi_index !238
  %273 = fmul double %268, %271, !llfi_index !239
  %274 = fmul double %269, %272, !llfi_index !239
  %275 = fdiv double %273, 1.800000e+02, !llfi_index !240
  %276 = fdiv double %274, 1.800000e+02, !llfi_index !240
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %275, double %276)
  %277 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str8, i32 0, i32 0), double %266, double %275), !llfi_index !241
  br label %278, !llfi_index !242

; <label>:278                                     ; preds = %265
  %279 = load double* %X, align 8, !llfi_index !243
  %280 = load double* %X, align 8, !llfi_index !243
  %281 = fadd double %279, 1.000000e+00, !llfi_index !244
  %282 = fadd double %280, 1.000000e+00, !llfi_index !244
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %281, double %282)
  store double %281, double* %X, align 8, !llfi_index !245
  br label %260, !llfi_index !246

; <label>:283                                     ; preds = %260
  %284 = call i32 (i8*, ...)* bitcast (i32 (...)* @puts to i32 (i8*, ...)*)(i8* getelementptr inbounds ([1 x i8]* @.str9, i32 0, i32 0)), !llfi_index !247
  store double 0.000000e+00, double* %X, align 8, !llfi_index !248
  br label %285, !llfi_index !249

; <label>:285                                     ; preds = %310, %283
  %286 = load double* %X, align 8, !llfi_index !250
  %287 = load double* %X, align 8, !llfi_index !250
  %288 = call double @atan(double 1.000000e+00) #4, !llfi_index !251
  %289 = fmul double 4.000000e+00, %288, !llfi_index !252
  %290 = fmul double 4.000000e+00, %288, !llfi_index !252
  %291 = fmul double 2.000000e+00, %289, !llfi_index !253
  %292 = fmul double 2.000000e+00, %290, !llfi_index !253
  %293 = fadd double %291, 1.000000e-06, !llfi_index !254
  %294 = fadd double %292, 1.000000e-06, !llfi_index !254
  %295 = fcmp ole double %286, %293, !llfi_index !255
  %296 = fcmp ole double %287, %294, !llfi_index !255
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %295, i1 %296)
  br i1 %295, label %297, label %320, !llfi_index !256

; <label>:297                                     ; preds = %285
  %298 = load double* %X, align 8, !llfi_index !257
  %299 = load double* %X, align 8, !llfi_index !257
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %298, double %299)
  %300 = load double* %X, align 8, !llfi_index !258
  %301 = load double* %X, align 8, !llfi_index !258
  %302 = fmul double %300, 1.800000e+02, !llfi_index !259
  %303 = fmul double %301, 1.800000e+02, !llfi_index !259
  %304 = call double @atan(double 1.000000e+00) #4, !llfi_index !260
  %305 = fmul double 4.000000e+00, %304, !llfi_index !261
  %306 = fmul double 4.000000e+00, %304, !llfi_index !261
  %307 = fdiv double %302, %305, !llfi_index !262
  %308 = fdiv double %303, %306, !llfi_index !262
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %307, double %308)
  %309 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str10, i32 0, i32 0), double %298, double %307), !llfi_index !263
  br label %310, !llfi_index !264

; <label>:310                                     ; preds = %297
  %311 = call double @atan(double 1.000000e+00) #4, !llfi_index !265
  %312 = fmul double 4.000000e+00, %311, !llfi_index !266
  %313 = fmul double 4.000000e+00, %311, !llfi_index !266
  %314 = fdiv double %312, 1.800000e+02, !llfi_index !267
  %315 = fdiv double %313, 1.800000e+02, !llfi_index !267
  %316 = load double* %X, align 8, !llfi_index !268
  %317 = load double* %X, align 8, !llfi_index !268
  %318 = fadd double %316, %314, !llfi_index !269
  %319 = fadd double %317, %315, !llfi_index !269
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %318, double %319)
  store double %318, double* %X, align 8, !llfi_index !270
  br label %285, !llfi_index !271

; <label>:320                                     ; preds = %285
  call void @global_check()
  ret i32 0, !llfi_index !272
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind
declare double @atan(double) #2

declare i32 @puts(...) #1

; Function Attrs: nounwind uwtable
define void @SolveCubic(double %a, double %b, double %c, double %d, i32* %solutions, double* %x) #0 {
  %1 = alloca double, align 8, !llfi_index !273
  %2 = alloca double, align 8, !llfi_index !274
  %3 = alloca double, align 8, !llfi_index !275
  %4 = alloca double, align 8, !llfi_index !276
  %5 = alloca i32*, align 8, !llfi_index !277
  %6 = alloca double*, align 8, !llfi_index !278
  %a1 = alloca x86_fp80, align 16, !llfi_index !279
  %a2 = alloca x86_fp80, align 16, !llfi_index !280
  %a3 = alloca x86_fp80, align 16, !llfi_index !281
  %Q = alloca x86_fp80, align 16, !llfi_index !282
  %R = alloca x86_fp80, align 16, !llfi_index !283
  %R2_Q3 = alloca double, align 8, !llfi_index !284
  %theta = alloca double, align 8, !llfi_index !285
  store double %a, double* %1, align 8, !llfi_index !286
  store double %b, double* %2, align 8, !llfi_index !287
  store double %c, double* %3, align 8, !llfi_index !288
  store double %d, double* %4, align 8, !llfi_index !289
  store i32* %solutions, i32** %5, align 8, !llfi_index !290
  store double* %x, double** %6, align 8, !llfi_index !291
  %7 = load double* %2, align 8, !llfi_index !292
  %8 = load double* %2, align 8, !llfi_index !292
  %9 = load double* %1, align 8, !llfi_index !293
  %10 = load double* %1, align 8, !llfi_index !293
  %11 = fdiv double %7, %9, !llfi_index !294
  %12 = fdiv double %8, %10, !llfi_index !294
  %13 = fpext double %11 to x86_fp80, !llfi_index !295
  %14 = fpext double %12 to x86_fp80, !llfi_index !295
  call void bitcast (void (i64, i64)* @global_add to void (x86_fp80, x86_fp80)*)(x86_fp80 %13, x86_fp80 %14)
  store x86_fp80 %13, x86_fp80* %a1, align 16, !llfi_index !296
  %15 = load double* %3, align 8, !llfi_index !297
  %16 = load double* %3, align 8, !llfi_index !297
  %17 = load double* %1, align 8, !llfi_index !298
  %18 = load double* %1, align 8, !llfi_index !298
  %19 = fdiv double %15, %17, !llfi_index !299
  %20 = fdiv double %16, %18, !llfi_index !299
  %21 = fpext double %19 to x86_fp80, !llfi_index !300
  %22 = fpext double %20 to x86_fp80, !llfi_index !300
  call void bitcast (void (i64, i64)* @global_add to void (x86_fp80, x86_fp80)*)(x86_fp80 %21, x86_fp80 %22)
  store x86_fp80 %21, x86_fp80* %a2, align 16, !llfi_index !301
  %23 = load double* %4, align 8, !llfi_index !302
  %24 = load double* %4, align 8, !llfi_index !302
  %25 = load double* %1, align 8, !llfi_index !303
  %26 = load double* %1, align 8, !llfi_index !303
  %27 = fdiv double %23, %25, !llfi_index !304
  %28 = fdiv double %24, %26, !llfi_index !304
  %29 = fpext double %27 to x86_fp80, !llfi_index !305
  %30 = fpext double %28 to x86_fp80, !llfi_index !305
  call void bitcast (void (i64, i64)* @global_add to void (x86_fp80, x86_fp80)*)(x86_fp80 %29, x86_fp80 %30)
  store x86_fp80 %29, x86_fp80* %a3, align 16, !llfi_index !306
  %31 = load x86_fp80* %a1, align 16, !llfi_index !307
  %32 = load x86_fp80* %a1, align 16, !llfi_index !307
  %33 = load x86_fp80* %a1, align 16, !llfi_index !308
  %34 = load x86_fp80* %a1, align 16, !llfi_index !308
  %35 = fmul x86_fp80 %31, %33, !llfi_index !309
  %36 = fmul x86_fp80 %32, %34, !llfi_index !309
  %37 = load x86_fp80* %a2, align 16, !llfi_index !310
  %38 = load x86_fp80* %a2, align 16, !llfi_index !310
  %39 = fmul x86_fp80 0xK4000C000000000000000, %37, !llfi_index !311
  %40 = fmul x86_fp80 0xK4000C000000000000000, %38, !llfi_index !311
  %41 = fsub x86_fp80 %35, %39, !llfi_index !312
  %42 = fsub x86_fp80 %36, %40, !llfi_index !312
  %43 = fdiv x86_fp80 %41, 0xK40029000000000000000, !llfi_index !313
  %44 = fdiv x86_fp80 %42, 0xK40029000000000000000, !llfi_index !313
  call void bitcast (void (i64, i64)* @global_add to void (x86_fp80, x86_fp80)*)(x86_fp80 %43, x86_fp80 %44)
  store x86_fp80 %43, x86_fp80* %Q, align 16, !llfi_index !314
  %45 = load x86_fp80* %a1, align 16, !llfi_index !315
  %46 = load x86_fp80* %a1, align 16, !llfi_index !315
  %47 = fmul x86_fp80 0xK40008000000000000000, %45, !llfi_index !316
  %48 = fmul x86_fp80 0xK40008000000000000000, %46, !llfi_index !316
  %49 = load x86_fp80* %a1, align 16, !llfi_index !317
  %50 = load x86_fp80* %a1, align 16, !llfi_index !317
  %51 = fmul x86_fp80 %47, %49, !llfi_index !318
  %52 = fmul x86_fp80 %48, %50, !llfi_index !318
  %53 = load x86_fp80* %a1, align 16, !llfi_index !319
  %54 = load x86_fp80* %a1, align 16, !llfi_index !319
  %55 = fmul x86_fp80 %51, %53, !llfi_index !320
  %56 = fmul x86_fp80 %52, %54, !llfi_index !320
  %57 = load x86_fp80* %a1, align 16, !llfi_index !321
  %58 = load x86_fp80* %a1, align 16, !llfi_index !321
  %59 = fmul x86_fp80 0xK40029000000000000000, %57, !llfi_index !322
  %60 = fmul x86_fp80 0xK40029000000000000000, %58, !llfi_index !322
  %61 = load x86_fp80* %a2, align 16, !llfi_index !323
  %62 = load x86_fp80* %a2, align 16, !llfi_index !323
  %63 = fmul x86_fp80 %59, %61, !llfi_index !324
  %64 = fmul x86_fp80 %60, %62, !llfi_index !324
  %65 = fsub x86_fp80 %55, %63, !llfi_index !325
  %66 = fsub x86_fp80 %56, %64, !llfi_index !325
  %67 = load x86_fp80* %a3, align 16, !llfi_index !326
  %68 = load x86_fp80* %a3, align 16, !llfi_index !326
  %69 = fmul x86_fp80 0xK4003D800000000000000, %67, !llfi_index !327
  %70 = fmul x86_fp80 0xK4003D800000000000000, %68, !llfi_index !327
  %71 = fadd x86_fp80 %65, %69, !llfi_index !328
  %72 = fadd x86_fp80 %66, %70, !llfi_index !328
  %73 = fdiv x86_fp80 %71, 0xK4004D800000000000000, !llfi_index !329
  %74 = fdiv x86_fp80 %72, 0xK4004D800000000000000, !llfi_index !329
  call void bitcast (void (i64, i64)* @global_add to void (x86_fp80, x86_fp80)*)(x86_fp80 %73, x86_fp80 %74)
  store x86_fp80 %73, x86_fp80* %R, align 16, !llfi_index !330
  %75 = load x86_fp80* %R, align 16, !llfi_index !331
  %76 = load x86_fp80* %R, align 16, !llfi_index !331
  %77 = load x86_fp80* %R, align 16, !llfi_index !332
  %78 = load x86_fp80* %R, align 16, !llfi_index !332
  %79 = fmul x86_fp80 %75, %77, !llfi_index !333
  %80 = fmul x86_fp80 %76, %78, !llfi_index !333
  %81 = load x86_fp80* %Q, align 16, !llfi_index !334
  %82 = load x86_fp80* %Q, align 16, !llfi_index !334
  %83 = load x86_fp80* %Q, align 16, !llfi_index !335
  %84 = load x86_fp80* %Q, align 16, !llfi_index !335
  %85 = fmul x86_fp80 %81, %83, !llfi_index !336
  %86 = fmul x86_fp80 %82, %84, !llfi_index !336
  %87 = load x86_fp80* %Q, align 16, !llfi_index !337
  %88 = load x86_fp80* %Q, align 16, !llfi_index !337
  %89 = fmul x86_fp80 %85, %87, !llfi_index !338
  %90 = fmul x86_fp80 %86, %88, !llfi_index !338
  %91 = fsub x86_fp80 %79, %89, !llfi_index !339
  %92 = fsub x86_fp80 %80, %90, !llfi_index !339
  %93 = fptrunc x86_fp80 %91 to double, !llfi_index !340
  %94 = fptrunc x86_fp80 %92 to double, !llfi_index !340
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %93, double %94)
  store double %93, double* %R2_Q3, align 8, !llfi_index !341
  %95 = load double* %R2_Q3, align 8, !llfi_index !342
  %96 = load double* %R2_Q3, align 8, !llfi_index !342
  %97 = fcmp ole double %95, 0.000000e+00, !llfi_index !343
  %98 = fcmp ole double %96, 0.000000e+00, !llfi_index !343
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %97, i1 %98)
  br i1 %97, label %99, label %222, !llfi_index !344

; <label>:99                                      ; preds = %0
  %100 = load i32** %5, align 8, !llfi_index !345
  %101 = load i32** %5, align 8, !llfi_index !345
  call void bitcast (void (i64, i64)* @global_add to void (i32*, i32*)*)(i32* %100, i32* %101)
  store i32 3, i32* %100, align 4, !llfi_index !346
  %102 = load x86_fp80* %R, align 16, !llfi_index !347
  %103 = load x86_fp80* %R, align 16, !llfi_index !347
  %104 = load x86_fp80* %Q, align 16, !llfi_index !348
  %105 = load x86_fp80* %Q, align 16, !llfi_index !348
  %106 = load x86_fp80* %Q, align 16, !llfi_index !349
  %107 = load x86_fp80* %Q, align 16, !llfi_index !349
  %108 = fmul x86_fp80 %104, %106, !llfi_index !350
  %109 = fmul x86_fp80 %105, %107, !llfi_index !350
  %110 = load x86_fp80* %Q, align 16, !llfi_index !351
  %111 = load x86_fp80* %Q, align 16, !llfi_index !351
  %112 = fmul x86_fp80 %108, %110, !llfi_index !352
  %113 = fmul x86_fp80 %109, %111, !llfi_index !352
  %114 = fptrunc x86_fp80 %112 to double, !llfi_index !353
  %115 = fptrunc x86_fp80 %113 to double, !llfi_index !353
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %114, double %115)
  %116 = call double @sqrt(double %114) #4, !llfi_index !354
  %117 = fpext double %116 to x86_fp80, !llfi_index !355
  %118 = fpext double %116 to x86_fp80, !llfi_index !355
  %119 = fdiv x86_fp80 %102, %117, !llfi_index !356
  %120 = fdiv x86_fp80 %103, %118, !llfi_index !356
  %121 = fptrunc x86_fp80 %119 to double, !llfi_index !357
  %122 = fptrunc x86_fp80 %120 to double, !llfi_index !357
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %121, double %122)
  %123 = call double @acos(double %121) #4, !llfi_index !358
  store double %123, double* %theta, align 8, !llfi_index !359
  %124 = load x86_fp80* %Q, align 16, !llfi_index !360
  %125 = load x86_fp80* %Q, align 16, !llfi_index !360
  %126 = fptrunc x86_fp80 %124 to double, !llfi_index !361
  %127 = fptrunc x86_fp80 %125 to double, !llfi_index !361
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %126, double %127)
  %128 = call double @sqrt(double %126) #4, !llfi_index !362
  %129 = fmul double -2.000000e+00, %128, !llfi_index !363
  %130 = fmul double -2.000000e+00, %128, !llfi_index !363
  %131 = load double* %theta, align 8, !llfi_index !364
  %132 = load double* %theta, align 8, !llfi_index !364
  %133 = fdiv double %131, 3.000000e+00, !llfi_index !365
  %134 = fdiv double %132, 3.000000e+00, !llfi_index !365
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %133, double %134)
  %135 = call double @cos(double %133) #4, !llfi_index !366
  %136 = fmul double %129, %135, !llfi_index !367
  %137 = fmul double %130, %135, !llfi_index !367
  %138 = fpext double %136 to x86_fp80, !llfi_index !368
  %139 = fpext double %137 to x86_fp80, !llfi_index !368
  %140 = load x86_fp80* %a1, align 16, !llfi_index !369
  %141 = load x86_fp80* %a1, align 16, !llfi_index !369
  %142 = fdiv x86_fp80 %140, 0xK4000C000000000000000, !llfi_index !370
  %143 = fdiv x86_fp80 %141, 0xK4000C000000000000000, !llfi_index !370
  %144 = fsub x86_fp80 %138, %142, !llfi_index !371
  %145 = fsub x86_fp80 %139, %143, !llfi_index !371
  %146 = fptrunc x86_fp80 %144 to double, !llfi_index !372
  %147 = fptrunc x86_fp80 %145 to double, !llfi_index !372
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %146, double %147)
  %148 = load double** %6, align 8, !llfi_index !373
  %149 = load double** %6, align 8, !llfi_index !373
  %150 = getelementptr inbounds double* %148, i64 0, !llfi_index !374
  %151 = getelementptr inbounds double* %149, i64 0, !llfi_index !374
  call void bitcast (void (i64, i64)* @global_add to void (double*, double*)*)(double* %150, double* %151)
  store double %146, double* %150, align 8, !llfi_index !375
  %152 = load x86_fp80* %Q, align 16, !llfi_index !376
  %153 = load x86_fp80* %Q, align 16, !llfi_index !376
  %154 = fptrunc x86_fp80 %152 to double, !llfi_index !377
  %155 = fptrunc x86_fp80 %153 to double, !llfi_index !377
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %154, double %155)
  %156 = call double @sqrt(double %154) #4, !llfi_index !378
  %157 = fmul double -2.000000e+00, %156, !llfi_index !379
  %158 = fmul double -2.000000e+00, %156, !llfi_index !379
  %159 = load double* %theta, align 8, !llfi_index !380
  %160 = load double* %theta, align 8, !llfi_index !380
  %161 = call double @atan(double 1.000000e+00) #4, !llfi_index !381
  %162 = fmul double 4.000000e+00, %161, !llfi_index !382
  %163 = fmul double 4.000000e+00, %161, !llfi_index !382
  %164 = fmul double 2.000000e+00, %162, !llfi_index !383
  %165 = fmul double 2.000000e+00, %163, !llfi_index !383
  %166 = fadd double %159, %164, !llfi_index !384
  %167 = fadd double %160, %165, !llfi_index !384
  %168 = fdiv double %166, 3.000000e+00, !llfi_index !385
  %169 = fdiv double %167, 3.000000e+00, !llfi_index !385
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %168, double %169)
  %170 = call double @cos(double %168) #4, !llfi_index !386
  %171 = fmul double %157, %170, !llfi_index !387
  %172 = fmul double %158, %170, !llfi_index !387
  %173 = fpext double %171 to x86_fp80, !llfi_index !388
  %174 = fpext double %172 to x86_fp80, !llfi_index !388
  %175 = load x86_fp80* %a1, align 16, !llfi_index !389
  %176 = load x86_fp80* %a1, align 16, !llfi_index !389
  %177 = fdiv x86_fp80 %175, 0xK4000C000000000000000, !llfi_index !390
  %178 = fdiv x86_fp80 %176, 0xK4000C000000000000000, !llfi_index !390
  %179 = fsub x86_fp80 %173, %177, !llfi_index !391
  %180 = fsub x86_fp80 %174, %178, !llfi_index !391
  %181 = fptrunc x86_fp80 %179 to double, !llfi_index !392
  %182 = fptrunc x86_fp80 %180 to double, !llfi_index !392
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %181, double %182)
  %183 = load double** %6, align 8, !llfi_index !393
  %184 = load double** %6, align 8, !llfi_index !393
  %185 = getelementptr inbounds double* %183, i64 1, !llfi_index !394
  %186 = getelementptr inbounds double* %184, i64 1, !llfi_index !394
  call void bitcast (void (i64, i64)* @global_add to void (double*, double*)*)(double* %185, double* %186)
  store double %181, double* %185, align 8, !llfi_index !395
  %187 = load x86_fp80* %Q, align 16, !llfi_index !396
  %188 = load x86_fp80* %Q, align 16, !llfi_index !396
  %189 = fptrunc x86_fp80 %187 to double, !llfi_index !397
  %190 = fptrunc x86_fp80 %188 to double, !llfi_index !397
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %189, double %190)
  %191 = call double @sqrt(double %189) #4, !llfi_index !398
  %192 = fmul double -2.000000e+00, %191, !llfi_index !399
  %193 = fmul double -2.000000e+00, %191, !llfi_index !399
  %194 = load double* %theta, align 8, !llfi_index !400
  %195 = load double* %theta, align 8, !llfi_index !400
  %196 = call double @atan(double 1.000000e+00) #4, !llfi_index !401
  %197 = fmul double 4.000000e+00, %196, !llfi_index !402
  %198 = fmul double 4.000000e+00, %196, !llfi_index !402
  %199 = fmul double 4.000000e+00, %197, !llfi_index !403
  %200 = fmul double 4.000000e+00, %198, !llfi_index !403
  %201 = fadd double %194, %199, !llfi_index !404
  %202 = fadd double %195, %200, !llfi_index !404
  %203 = fdiv double %201, 3.000000e+00, !llfi_index !405
  %204 = fdiv double %202, 3.000000e+00, !llfi_index !405
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %203, double %204)
  %205 = call double @cos(double %203) #4, !llfi_index !406
  %206 = fmul double %192, %205, !llfi_index !407
  %207 = fmul double %193, %205, !llfi_index !407
  %208 = fpext double %206 to x86_fp80, !llfi_index !408
  %209 = fpext double %207 to x86_fp80, !llfi_index !408
  %210 = load x86_fp80* %a1, align 16, !llfi_index !409
  %211 = load x86_fp80* %a1, align 16, !llfi_index !409
  %212 = fdiv x86_fp80 %210, 0xK4000C000000000000000, !llfi_index !410
  %213 = fdiv x86_fp80 %211, 0xK4000C000000000000000, !llfi_index !410
  %214 = fsub x86_fp80 %208, %212, !llfi_index !411
  %215 = fsub x86_fp80 %209, %213, !llfi_index !411
  %216 = fptrunc x86_fp80 %214 to double, !llfi_index !412
  %217 = fptrunc x86_fp80 %215 to double, !llfi_index !412
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %216, double %217)
  %218 = load double** %6, align 8, !llfi_index !413
  %219 = load double** %6, align 8, !llfi_index !413
  %220 = getelementptr inbounds double* %218, i64 2, !llfi_index !414
  %221 = getelementptr inbounds double* %219, i64 2, !llfi_index !414
  call void bitcast (void (i64, i64)* @global_add to void (double*, double*)*)(double* %220, double* %221)
  store double %216, double* %220, align 8, !llfi_index !415
  br label %295, !llfi_index !416

; <label>:222                                     ; preds = %0
  %223 = load i32** %5, align 8, !llfi_index !417
  %224 = load i32** %5, align 8, !llfi_index !417
  call void bitcast (void (i64, i64)* @global_add to void (i32*, i32*)*)(i32* %223, i32* %224)
  store i32 1, i32* %223, align 4, !llfi_index !418
  %225 = load double* %R2_Q3, align 8, !llfi_index !419
  %226 = load double* %R2_Q3, align 8, !llfi_index !419
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %225, double %226)
  %227 = call double @sqrt(double %225) #4, !llfi_index !420
  %228 = load x86_fp80* %R, align 16, !llfi_index !421
  %229 = load x86_fp80* %R, align 16, !llfi_index !421
  %230 = fptrunc x86_fp80 %228 to double, !llfi_index !422
  %231 = fptrunc x86_fp80 %229 to double, !llfi_index !422
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %230, double %231)
  %232 = call double @fabs(double %230) #6, !llfi_index !423
  %233 = fadd double %227, %232, !llfi_index !424
  %234 = fadd double %227, %232, !llfi_index !424
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %233, double %234)
  %235 = call double @pow(double %233, double 0x3FD5555555555555) #4, !llfi_index !425
  %236 = load double** %6, align 8, !llfi_index !426
  %237 = load double** %6, align 8, !llfi_index !426
  %238 = getelementptr inbounds double* %236, i64 0, !llfi_index !427
  %239 = getelementptr inbounds double* %237, i64 0, !llfi_index !427
  call void bitcast (void (i64, i64)* @global_add to void (double*, double*)*)(double* %238, double* %239)
  store double %235, double* %238, align 8, !llfi_index !428
  %240 = load x86_fp80* %Q, align 16, !llfi_index !429
  %241 = load x86_fp80* %Q, align 16, !llfi_index !429
  %242 = load double** %6, align 8, !llfi_index !430
  %243 = load double** %6, align 8, !llfi_index !430
  %244 = getelementptr inbounds double* %242, i64 0, !llfi_index !431
  %245 = getelementptr inbounds double* %243, i64 0, !llfi_index !431
  %246 = load double* %244, align 8, !llfi_index !432
  %247 = load double* %245, align 8, !llfi_index !432
  %248 = fpext double %246 to x86_fp80, !llfi_index !433
  %249 = fpext double %247 to x86_fp80, !llfi_index !433
  %250 = fdiv x86_fp80 %240, %248, !llfi_index !434
  %251 = fdiv x86_fp80 %241, %249, !llfi_index !434
  %252 = load double** %6, align 8, !llfi_index !435
  %253 = load double** %6, align 8, !llfi_index !435
  %254 = getelementptr inbounds double* %252, i64 0, !llfi_index !436
  %255 = getelementptr inbounds double* %253, i64 0, !llfi_index !436
  %256 = load double* %254, align 8, !llfi_index !437
  %257 = load double* %255, align 8, !llfi_index !437
  %258 = fpext double %256 to x86_fp80, !llfi_index !438
  %259 = fpext double %257 to x86_fp80, !llfi_index !438
  %260 = fadd x86_fp80 %258, %250, !llfi_index !439
  %261 = fadd x86_fp80 %259, %251, !llfi_index !439
  %262 = fptrunc x86_fp80 %260 to double, !llfi_index !440
  %263 = fptrunc x86_fp80 %261 to double, !llfi_index !440
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %262, double %263)
  store double %262, double* %254, align 8, !llfi_index !441
  %264 = load x86_fp80* %R, align 16, !llfi_index !442
  %265 = load x86_fp80* %R, align 16, !llfi_index !442
  %266 = fcmp olt x86_fp80 %264, 0xK00000000000000000000, !llfi_index !443
  %267 = fcmp olt x86_fp80 %265, 0xK00000000000000000000, !llfi_index !443
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %266, i1 %267)
  %268 = select i1 %266, i32 1, i32 -1, !llfi_index !444
  %269 = sitofp i32 %268 to double, !llfi_index !445
  %270 = sitofp i32 %268 to double, !llfi_index !445
  %271 = load double** %6, align 8, !llfi_index !446
  %272 = load double** %6, align 8, !llfi_index !446
  %273 = getelementptr inbounds double* %271, i64 0, !llfi_index !447
  %274 = getelementptr inbounds double* %272, i64 0, !llfi_index !447
  %275 = load double* %273, align 8, !llfi_index !448
  %276 = load double* %274, align 8, !llfi_index !448
  %277 = fmul double %275, %269, !llfi_index !449
  %278 = fmul double %276, %270, !llfi_index !449
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %277, double %278)
  store double %277, double* %273, align 8, !llfi_index !450
  %279 = load x86_fp80* %a1, align 16, !llfi_index !451
  %280 = load x86_fp80* %a1, align 16, !llfi_index !451
  %281 = fdiv x86_fp80 %279, 0xK4000C000000000000000, !llfi_index !452
  %282 = fdiv x86_fp80 %280, 0xK4000C000000000000000, !llfi_index !452
  %283 = load double** %6, align 8, !llfi_index !453
  %284 = load double** %6, align 8, !llfi_index !453
  %285 = getelementptr inbounds double* %283, i64 0, !llfi_index !454
  %286 = getelementptr inbounds double* %284, i64 0, !llfi_index !454
  %287 = load double* %285, align 8, !llfi_index !455
  %288 = load double* %286, align 8, !llfi_index !455
  %289 = fpext double %287 to x86_fp80, !llfi_index !456
  %290 = fpext double %288 to x86_fp80, !llfi_index !456
  %291 = fsub x86_fp80 %289, %281, !llfi_index !457
  %292 = fsub x86_fp80 %290, %282, !llfi_index !457
  %293 = fptrunc x86_fp80 %291 to double, !llfi_index !458
  %294 = fptrunc x86_fp80 %292 to double, !llfi_index !458
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %293, double %294)
  store double %293, double* %285, align 8, !llfi_index !459
  br label %295, !llfi_index !460

; <label>:295                                     ; preds = %222, %99
  ret void, !llfi_index !461
}

; Function Attrs: nounwind
declare double @acos(double) #2

; Function Attrs: nounwind
declare double @sqrt(double) #2

; Function Attrs: nounwind
declare double @cos(double) #2

; Function Attrs: nounwind
declare double @pow(double, double) #2

; Function Attrs: nounwind readnone
declare double @fabs(double) #3

; Function Attrs: nounwind uwtable
define void @usqrt(i64 %x, %struct.int_sqrt* %q) #0 {
  %1 = alloca i64, align 8, !llfi_index !462
  %2 = alloca %struct.int_sqrt*, align 8, !llfi_index !463
  %a = alloca i64, align 8, !llfi_index !464
  %r = alloca i64, align 8, !llfi_index !465
  %e = alloca i64, align 8, !llfi_index !466
  %i = alloca i32, align 4, !llfi_index !467
  store i64 %x, i64* %1, align 8, !llfi_index !468
  store %struct.int_sqrt* %q, %struct.int_sqrt** %2, align 8, !llfi_index !469
  store i64 0, i64* %a, align 8, !llfi_index !470
  store i64 0, i64* %r, align 8, !llfi_index !471
  store i64 0, i64* %e, align 8, !llfi_index !472
  store i32 0, i32* %i, align 4, !llfi_index !473
  br label %3, !llfi_index !474

; <label>:3                                       ; preds = %53, %0
  %4 = load i32* %i, align 4, !llfi_index !475
  %5 = load i32* %i, align 4, !llfi_index !475
  %6 = icmp slt i32 %4, 32, !llfi_index !476
  %7 = icmp slt i32 %5, 32, !llfi_index !476
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %6, i1 %7)
  br i1 %6, label %8, label %58, !llfi_index !477

; <label>:8                                       ; preds = %3
  %9 = load i64* %r, align 8, !llfi_index !478
  %10 = load i64* %r, align 8, !llfi_index !478
  %11 = shl i64 %9, 2, !llfi_index !479
  %12 = shl i64 %10, 2, !llfi_index !479
  %13 = load i64* %1, align 8, !llfi_index !480
  %14 = load i64* %1, align 8, !llfi_index !480
  %15 = and i64 %13, 3221225472, !llfi_index !481
  %16 = and i64 %14, 3221225472, !llfi_index !481
  %17 = lshr i64 %15, 30, !llfi_index !482
  %18 = lshr i64 %16, 30, !llfi_index !482
  %19 = add i64 %11, %17, !llfi_index !483
  %20 = add i64 %12, %18, !llfi_index !483
  call void @global_add(i64 %19, i64 %20)
  store i64 %19, i64* %r, align 8, !llfi_index !484
  %21 = load i64* %1, align 8, !llfi_index !485
  %22 = load i64* %1, align 8, !llfi_index !485
  %23 = shl i64 %21, 2, !llfi_index !486
  %24 = shl i64 %22, 2, !llfi_index !486
  call void @global_add(i64 %23, i64 %24)
  store i64 %23, i64* %1, align 8, !llfi_index !487
  %25 = load i64* %a, align 8, !llfi_index !488
  %26 = load i64* %a, align 8, !llfi_index !488
  %27 = shl i64 %25, 1, !llfi_index !489
  %28 = shl i64 %26, 1, !llfi_index !489
  call void @global_add(i64 %27, i64 %28)
  store i64 %27, i64* %a, align 8, !llfi_index !490
  %29 = load i64* %a, align 8, !llfi_index !491
  %30 = load i64* %a, align 8, !llfi_index !491
  %31 = shl i64 %29, 1, !llfi_index !492
  %32 = shl i64 %30, 1, !llfi_index !492
  %33 = add i64 %31, 1, !llfi_index !493
  %34 = add i64 %32, 1, !llfi_index !493
  call void @global_add(i64 %33, i64 %34)
  store i64 %33, i64* %e, align 8, !llfi_index !494
  %35 = load i64* %r, align 8, !llfi_index !495
  %36 = load i64* %r, align 8, !llfi_index !495
  %37 = load i64* %e, align 8, !llfi_index !496
  %38 = load i64* %e, align 8, !llfi_index !496
  %39 = icmp uge i64 %35, %37, !llfi_index !497
  %40 = icmp uge i64 %36, %38, !llfi_index !497
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %39, i1 %40)
  br i1 %39, label %41, label %52, !llfi_index !498

; <label>:41                                      ; preds = %8
  %42 = load i64* %e, align 8, !llfi_index !499
  %43 = load i64* %e, align 8, !llfi_index !499
  %44 = load i64* %r, align 8, !llfi_index !500
  %45 = load i64* %r, align 8, !llfi_index !500
  %46 = sub i64 %44, %42, !llfi_index !501
  %47 = sub i64 %45, %43, !llfi_index !501
  call void @global_add(i64 %46, i64 %47)
  store i64 %46, i64* %r, align 8, !llfi_index !502
  %48 = load i64* %a, align 8, !llfi_index !503
  %49 = load i64* %a, align 8, !llfi_index !503
  %50 = add i64 %48, 1, !llfi_index !504
  %51 = add i64 %49, 1, !llfi_index !504
  call void @global_add(i64 %50, i64 %51)
  store i64 %50, i64* %a, align 8, !llfi_index !505
  br label %52, !llfi_index !506

; <label>:52                                      ; preds = %41, %8
  br label %53, !llfi_index !507

; <label>:53                                      ; preds = %52
  %54 = load i32* %i, align 4, !llfi_index !508
  %55 = load i32* %i, align 4, !llfi_index !508
  %56 = add nsw i32 %54, 1, !llfi_index !509
  %57 = add nsw i32 %55, 1, !llfi_index !509
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %56, i32 %57)
  store i32 %56, i32* %i, align 4, !llfi_index !510
  br label %3, !llfi_index !511

; <label>:58                                      ; preds = %3
  %59 = load %struct.int_sqrt** %2, align 8, !llfi_index !512
  %60 = load %struct.int_sqrt** %2, align 8, !llfi_index !512
  %61 = bitcast %struct.int_sqrt* %59 to i8*, !llfi_index !513
  %62 = bitcast %struct.int_sqrt* %60 to i8*, !llfi_index !513
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %61, i8* %62)
  %63 = bitcast i64* %a to i8*, !llfi_index !514
  %64 = bitcast i64* %a to i8*, !llfi_index !514
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %63, i8* %64)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %61, i8* %63, i64 8, i32 4, i1 false), !llfi_index !515
  ret void, !llfi_index !516
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #4

; Function Attrs: nounwind uwtable
define double @rad2deg(double %rad) #0 {
  %1 = alloca double, align 8, !llfi_index !517
  store double %rad, double* %1, align 8, !llfi_index !518
  %2 = load double* %1, align 8, !llfi_index !519
  %3 = load double* %1, align 8, !llfi_index !519
  %4 = fmul double 1.800000e+02, %2, !llfi_index !520
  %5 = fmul double 1.800000e+02, %3, !llfi_index !520
  %6 = call double @atan(double 1.000000e+00) #4, !llfi_index !521
  %7 = fmul double 4.000000e+00, %6, !llfi_index !522
  %8 = fmul double 4.000000e+00, %6, !llfi_index !522
  %9 = fdiv double %4, %7, !llfi_index !523
  %10 = fdiv double %5, %8, !llfi_index !523
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %9, double %10)
  ret double %9, !llfi_index !524
}

; Function Attrs: nounwind uwtable
define double @deg2rad(double %deg) #0 {
  %1 = alloca double, align 8, !llfi_index !525
  store double %deg, double* %1, align 8, !llfi_index !526
  %2 = call double @atan(double 1.000000e+00) #4, !llfi_index !527
  %3 = fmul double 4.000000e+00, %2, !llfi_index !528
  %4 = fmul double 4.000000e+00, %2, !llfi_index !528
  %5 = load double* %1, align 8, !llfi_index !529
  %6 = load double* %1, align 8, !llfi_index !529
  %7 = fmul double %3, %5, !llfi_index !530
  %8 = fmul double %4, %6, !llfi_index !530
  %9 = fdiv double %7, 1.800000e+02, !llfi_index !531
  %10 = fdiv double %8, 1.800000e+02, !llfi_index !531
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %9, double %10)
  ret double %9, !llfi_index !532
}

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
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind readnone }
attributes #7 = { noreturn nounwind }

!llvm.ident = !{!0, !0, !0, !0, !0}

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
