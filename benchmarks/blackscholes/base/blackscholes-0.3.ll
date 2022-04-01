; ModuleID = 'temp2.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.OptionData_ = type { float, float, float, float, float, float, i8, float, float }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@numError = global i32 0, align 4
@numOptions = common global i32 0, align 4
@nThreads = common global i32 0, align 4
@sptprice = common global float* null, align 8
@strike = common global float* null, align 8
@rate = common global float* null, align 8
@volatility = common global float* null, align 8
@otime = common global float* null, align 8
@otype = common global i32* null, align 8
@prices = common global float* null, align 8
@.str = private unnamed_addr constant [24 x i8] c"PARSEC Benchmark Suite\0A\00", align 1
@.str1 = private unnamed_addr constant [48 x i8] c"Usage:\0A\09%s <nthreads> <inputFile> <outputFile>\0A\00", align 1
@.str2 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str3 = private unnamed_addr constant [34 x i8] c"ERROR: Unable to open file `%s'.\0A\00", align 1
@.str4 = private unnamed_addr constant [3 x i8] c"%i\00", align 1
@.str5 = private unnamed_addr constant [39 x i8] c"ERROR: Unable to read from file `%s'.\0A\00", align 1
@.str6 = private unnamed_addr constant [82 x i8] c"WARNING: Not enough work, reducing number of threads to match number of options.\0A\00", align 1
@.str7 = private unnamed_addr constant [46 x i8] c"Error: <nthreads> must be 1 (serial version)\0A\00", align 1
@data = common global %struct.OptionData_* null, align 8
@.str8 = private unnamed_addr constant [27 x i8] c"%f %f %f %f %f %f %c %f %f\00", align 1
@.str9 = private unnamed_addr constant [35 x i8] c"ERROR: Unable to close file `%s'.\0A\00", align 1
@.str10 = private unnamed_addr constant [20 x i8] c"Num of Options: %d\0A\00", align 1
@.str11 = private unnamed_addr constant [17 x i8] c"Num of Runs: %d\0A\00", align 1
@.str12 = private unnamed_addr constant [18 x i8] c"Size of data: %d\0A\00", align 1
@.str13 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str14 = private unnamed_addr constant [4 x i8] c"%i\0A\00", align 1
@.str15 = private unnamed_addr constant [38 x i8] c"ERROR: Unable to write to file `%s'.\0A\00", align 1
@.str16 = private unnamed_addr constant [7 x i8] c"%.18f\0A\00", align 1
@global_var1 = global i64 0, align 8
@global_var2 = global i64 0, align 8

; Function Attrs: nounwind uwtable
define float @CNDF(float %InputX) #0 {
  %1 = alloca float, align 4, !llfi_index !1
  %sign = alloca i32, align 4, !llfi_index !2
  %OutputX = alloca float, align 4, !llfi_index !3
  %xInput = alloca float, align 4, !llfi_index !4
  %xNPrimeofX = alloca float, align 4, !llfi_index !5
  %expValues = alloca float, align 4, !llfi_index !6
  %xK2 = alloca float, align 4, !llfi_index !7
  %xK2_2 = alloca float, align 4, !llfi_index !8
  %xK2_3 = alloca float, align 4, !llfi_index !9
  %xK2_4 = alloca float, align 4, !llfi_index !10
  %xK2_5 = alloca float, align 4, !llfi_index !11
  %xLocal = alloca float, align 4, !llfi_index !12
  %xLocal_1 = alloca float, align 4, !llfi_index !13
  %xLocal_2 = alloca float, align 4, !llfi_index !14
  %xLocal_3 = alloca float, align 4, !llfi_index !15
  store float %InputX, float* %1, align 4, !llfi_index !16
  %2 = load float* %1, align 4, !llfi_index !17
  %3 = load float* %1, align 4, !llfi_index !17
  %4 = fpext float %2 to double, !llfi_index !18
  %5 = fpext float %3 to double, !llfi_index !18
  %6 = fcmp olt double %4, 0.000000e+00, !llfi_index !19
  %7 = fcmp olt double %5, 0.000000e+00, !llfi_index !19
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %6, i1 %7)
  br i1 %6, label %8, label %13, !llfi_index !20

; <label>:8                                       ; preds = %0
  %9 = load float* %1, align 4, !llfi_index !21
  %10 = load float* %1, align 4, !llfi_index !21
  %11 = fsub float -0.000000e+00, %9, !llfi_index !22
  %12 = fsub float -0.000000e+00, %10, !llfi_index !22
  call void bitcast (void (i64, i64)* @global_add to void (float, float)*)(float %11, float %12)
  store float %11, float* %1, align 4, !llfi_index !23
  store i32 1, i32* %sign, align 4, !llfi_index !24
  br label %14, !llfi_index !25

; <label>:13                                      ; preds = %0
  store i32 0, i32* %sign, align 4, !llfi_index !26
  br label %14, !llfi_index !27

; <label>:14                                      ; preds = %13, %8
  %15 = load float* %1, align 4, !llfi_index !28
  %16 = load float* %1, align 4, !llfi_index !28
  call void bitcast (void (i64, i64)* @global_add to void (float, float)*)(float %15, float %16)
  store float %15, float* %xInput, align 4, !llfi_index !29
  %17 = load float* %1, align 4, !llfi_index !30
  %18 = load float* %1, align 4, !llfi_index !30
  %19 = fmul float -5.000000e-01, %17, !llfi_index !31
  %20 = fmul float -5.000000e-01, %18, !llfi_index !31
  %21 = load float* %1, align 4, !llfi_index !32
  %22 = load float* %1, align 4, !llfi_index !32
  %23 = fmul float %19, %21, !llfi_index !33
  %24 = fmul float %20, %22, !llfi_index !33
  %25 = fpext float %23 to double, !llfi_index !34
  %26 = fpext float %24 to double, !llfi_index !34
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %25, double %26)
  %27 = call double @exp(double %25) #5, !llfi_index !35
  %28 = fptrunc double %27 to float, !llfi_index !36
  %29 = fptrunc double %27 to float, !llfi_index !36
  call void bitcast (void (i64, i64)* @global_add to void (float, float)*)(float %28, float %29)
  store float %28, float* %expValues, align 4, !llfi_index !37
  %30 = load float* %expValues, align 4, !llfi_index !38
  %31 = load float* %expValues, align 4, !llfi_index !38
  call void bitcast (void (i64, i64)* @global_add to void (float, float)*)(float %30, float %31)
  store float %30, float* %xNPrimeofX, align 4, !llfi_index !39
  %32 = load float* %xNPrimeofX, align 4, !llfi_index !40
  %33 = load float* %xNPrimeofX, align 4, !llfi_index !40
  %34 = fpext float %32 to double, !llfi_index !41
  %35 = fpext float %33 to double, !llfi_index !41
  %36 = fmul double %34, 0x3FD9884533D43651, !llfi_index !42
  %37 = fmul double %35, 0x3FD9884533D43651, !llfi_index !42
  %38 = fptrunc double %36 to float, !llfi_index !43
  %39 = fptrunc double %37 to float, !llfi_index !43
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (float, float)*)(float %38, float %39)
  store float %38, float* %xNPrimeofX, align 4, !llfi_index !44
  %40 = load float* %xInput, align 4, !llfi_index !45
  %41 = load float* %xInput, align 4, !llfi_index !45
  %42 = fpext float %40 to double, !llfi_index !46
  %43 = fpext float %41 to double, !llfi_index !46
  %44 = fmul double 2.316419e-01, %42, !llfi_index !47
  %45 = fmul double 2.316419e-01, %43, !llfi_index !47
  %46 = fptrunc double %44 to float, !llfi_index !48
  %47 = fptrunc double %45 to float, !llfi_index !48
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (float, float)*)(float %46, float %47)
  store float %46, float* %xK2, align 4, !llfi_index !49
  %48 = load float* %xK2, align 4, !llfi_index !50
  %49 = load float* %xK2, align 4, !llfi_index !50
  %50 = fpext float %48 to double, !llfi_index !51
  %51 = fpext float %49 to double, !llfi_index !51
  %52 = fadd double 1.000000e+00, %50, !llfi_index !52
  %53 = fadd double 1.000000e+00, %51, !llfi_index !52
  %54 = fptrunc double %52 to float, !llfi_index !53
  %55 = fptrunc double %53 to float, !llfi_index !53
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (float, float)*)(float %54, float %55)
  store float %54, float* %xK2, align 4, !llfi_index !54
  %56 = load float* %xK2, align 4, !llfi_index !55
  %57 = load float* %xK2, align 4, !llfi_index !55
  %58 = fpext float %56 to double, !llfi_index !56
  %59 = fpext float %57 to double, !llfi_index !56
  %60 = fdiv double 1.000000e+00, %58, !llfi_index !57
  %61 = fdiv double 1.000000e+00, %59, !llfi_index !57
  %62 = fptrunc double %60 to float, !llfi_index !58
  %63 = fptrunc double %61 to float, !llfi_index !58
  call void bitcast (void (i64, i64)* @global_add to void (float, float)*)(float %62, float %63)
  store float %62, float* %xK2, align 4, !llfi_index !59
  %64 = load float* %xK2, align 4, !llfi_index !60
  %65 = load float* %xK2, align 4, !llfi_index !60
  %66 = load float* %xK2, align 4, !llfi_index !61
  %67 = load float* %xK2, align 4, !llfi_index !61
  %68 = fmul float %64, %66, !llfi_index !62
  %69 = fmul float %65, %67, !llfi_index !62
  call void bitcast (void (i64, i64)* @global_add to void (float, float)*)(float %68, float %69)
  store float %68, float* %xK2_2, align 4, !llfi_index !63
  %70 = load float* %xK2_2, align 4, !llfi_index !64
  %71 = load float* %xK2_2, align 4, !llfi_index !64
  %72 = load float* %xK2, align 4, !llfi_index !65
  %73 = load float* %xK2, align 4, !llfi_index !65
  %74 = fmul float %70, %72, !llfi_index !66
  %75 = fmul float %71, %73, !llfi_index !66
  call void bitcast (void (i64, i64)* @global_add to void (float, float)*)(float %74, float %75)
  store float %74, float* %xK2_3, align 4, !llfi_index !67
  %76 = load float* %xK2_3, align 4, !llfi_index !68
  %77 = load float* %xK2_3, align 4, !llfi_index !68
  %78 = load float* %xK2, align 4, !llfi_index !69
  %79 = load float* %xK2, align 4, !llfi_index !69
  %80 = fmul float %76, %78, !llfi_index !70
  %81 = fmul float %77, %79, !llfi_index !70
  call void bitcast (void (i64, i64)* @global_add to void (float, float)*)(float %80, float %81)
  store float %80, float* %xK2_4, align 4, !llfi_index !71
  %82 = load float* %xK2_4, align 4, !llfi_index !72
  %83 = load float* %xK2_4, align 4, !llfi_index !72
  %84 = load float* %xK2, align 4, !llfi_index !73
  %85 = load float* %xK2, align 4, !llfi_index !73
  %86 = fmul float %82, %84, !llfi_index !74
  %87 = fmul float %83, %85, !llfi_index !74
  call void bitcast (void (i64, i64)* @global_add to void (float, float)*)(float %86, float %87)
  store float %86, float* %xK2_5, align 4, !llfi_index !75
  %88 = load float* %xK2, align 4, !llfi_index !76
  %89 = load float* %xK2, align 4, !llfi_index !76
  %90 = fpext float %88 to double, !llfi_index !77
  %91 = fpext float %89 to double, !llfi_index !77
  %92 = fmul double %90, 0x3FD470BF3A92F8EC, !llfi_index !78
  %93 = fmul double %91, 0x3FD470BF3A92F8EC, !llfi_index !78
  %94 = fptrunc double %92 to float, !llfi_index !79
  %95 = fptrunc double %93 to float, !llfi_index !79
  call void bitcast (void (i64, i64)* @global_add to void (float, float)*)(float %94, float %95)
  store float %94, float* %xLocal_1, align 4, !llfi_index !80
  %96 = load float* %xK2_2, align 4, !llfi_index !81
  %97 = load float* %xK2_2, align 4, !llfi_index !81
  %98 = fpext float %96 to double, !llfi_index !82
  %99 = fpext float %97 to double, !llfi_index !82
  %100 = fmul double %98, 0xBFD6D1F0E5A8325B, !llfi_index !83
  %101 = fmul double %99, 0xBFD6D1F0E5A8325B, !llfi_index !83
  %102 = fptrunc double %100 to float, !llfi_index !84
  %103 = fptrunc double %101 to float, !llfi_index !84
  call void bitcast (void (i64, i64)* @global_add to void (float, float)*)(float %102, float %103)
  store float %102, float* %xLocal_2, align 4, !llfi_index !85
  %104 = load float* %xK2_3, align 4, !llfi_index !86
  %105 = load float* %xK2_3, align 4, !llfi_index !86
  %106 = fpext float %104 to double, !llfi_index !87
  %107 = fpext float %105 to double, !llfi_index !87
  %108 = fmul double %106, 0x3FFC80EF025F5E68, !llfi_index !88
  %109 = fmul double %107, 0x3FFC80EF025F5E68, !llfi_index !88
  %110 = fptrunc double %108 to float, !llfi_index !89
  %111 = fptrunc double %109 to float, !llfi_index !89
  call void bitcast (void (i64, i64)* @global_add to void (float, float)*)(float %110, float %111)
  store float %110, float* %xLocal_3, align 4, !llfi_index !90
  %112 = load float* %xLocal_2, align 4, !llfi_index !91
  %113 = load float* %xLocal_2, align 4, !llfi_index !91
  %114 = load float* %xLocal_3, align 4, !llfi_index !92
  %115 = load float* %xLocal_3, align 4, !llfi_index !92
  %116 = fadd float %112, %114, !llfi_index !93
  %117 = fadd float %113, %115, !llfi_index !93
  call void bitcast (void (i64, i64)* @global_add to void (float, float)*)(float %116, float %117)
  store float %116, float* %xLocal_2, align 4, !llfi_index !94
  %118 = load float* %xK2_4, align 4, !llfi_index !95
  %119 = load float* %xK2_4, align 4, !llfi_index !95
  %120 = fpext float %118 to double, !llfi_index !96
  %121 = fpext float %119 to double, !llfi_index !96
  %122 = fmul double %120, 0xBFFD23DD4EF278D0, !llfi_index !97
  %123 = fmul double %121, 0xBFFD23DD4EF278D0, !llfi_index !97
  %124 = fptrunc double %122 to float, !llfi_index !98
  %125 = fptrunc double %123 to float, !llfi_index !98
  call void bitcast (void (i64, i64)* @global_add to void (float, float)*)(float %124, float %125)
  store float %124, float* %xLocal_3, align 4, !llfi_index !99
  %126 = load float* %xLocal_2, align 4, !llfi_index !100
  %127 = load float* %xLocal_2, align 4, !llfi_index !100
  %128 = load float* %xLocal_3, align 4, !llfi_index !101
  %129 = load float* %xLocal_3, align 4, !llfi_index !101
  %130 = fadd float %126, %128, !llfi_index !102
  %131 = fadd float %127, %129, !llfi_index !102
  call void bitcast (void (i64, i64)* @global_add to void (float, float)*)(float %130, float %131)
  store float %130, float* %xLocal_2, align 4, !llfi_index !103
  %132 = load float* %xK2_5, align 4, !llfi_index !104
  %133 = load float* %xK2_5, align 4, !llfi_index !104
  %134 = fpext float %132 to double, !llfi_index !105
  %135 = fpext float %133 to double, !llfi_index !105
  %136 = fmul double %134, 0x3FF548CDD6F42943, !llfi_index !106
  %137 = fmul double %135, 0x3FF548CDD6F42943, !llfi_index !106
  %138 = fptrunc double %136 to float, !llfi_index !107
  %139 = fptrunc double %137 to float, !llfi_index !107
  call void bitcast (void (i64, i64)* @global_add to void (float, float)*)(float %138, float %139)
  store float %138, float* %xLocal_3, align 4, !llfi_index !108
  %140 = load float* %xLocal_2, align 4, !llfi_index !109
  %141 = load float* %xLocal_2, align 4, !llfi_index !109
  %142 = load float* %xLocal_3, align 4, !llfi_index !110
  %143 = load float* %xLocal_3, align 4, !llfi_index !110
  %144 = fadd float %140, %142, !llfi_index !111
  %145 = fadd float %141, %143, !llfi_index !111
  call void bitcast (void (i64, i64)* @global_add to void (float, float)*)(float %144, float %145)
  store float %144, float* %xLocal_2, align 4, !llfi_index !112
  %146 = load float* %xLocal_2, align 4, !llfi_index !113
  %147 = load float* %xLocal_2, align 4, !llfi_index !113
  %148 = load float* %xLocal_1, align 4, !llfi_index !114
  %149 = load float* %xLocal_1, align 4, !llfi_index !114
  %150 = fadd float %146, %148, !llfi_index !115
  %151 = fadd float %147, %149, !llfi_index !115
  call void bitcast (void (i64, i64)* @global_add to void (float, float)*)(float %150, float %151)
  store float %150, float* %xLocal_1, align 4, !llfi_index !116
  %152 = load float* %xLocal_1, align 4, !llfi_index !117
  %153 = load float* %xLocal_1, align 4, !llfi_index !117
  %154 = load float* %xNPrimeofX, align 4, !llfi_index !118
  %155 = load float* %xNPrimeofX, align 4, !llfi_index !118
  %156 = fmul float %152, %154, !llfi_index !119
  %157 = fmul float %153, %155, !llfi_index !119
  call void bitcast (void (i64, i64)* @global_add to void (float, float)*)(float %156, float %157)
  store float %156, float* %xLocal, align 4, !llfi_index !120
  %158 = load float* %xLocal, align 4, !llfi_index !121
  %159 = load float* %xLocal, align 4, !llfi_index !121
  %160 = fpext float %158 to double, !llfi_index !122
  %161 = fpext float %159 to double, !llfi_index !122
  %162 = fsub double 1.000000e+00, %160, !llfi_index !123
  %163 = fsub double 1.000000e+00, %161, !llfi_index !123
  %164 = fptrunc double %162 to float, !llfi_index !124
  %165 = fptrunc double %163 to float, !llfi_index !124
  call void bitcast (void (i64, i64)* @global_add to void (float, float)*)(float %164, float %165)
  store float %164, float* %xLocal, align 4, !llfi_index !125
  %166 = load float* %xLocal, align 4, !llfi_index !126
  %167 = load float* %xLocal, align 4, !llfi_index !126
  call void bitcast (void (i64, i64)* @global_add to void (float, float)*)(float %166, float %167)
  store float %166, float* %OutputX, align 4, !llfi_index !127
  %168 = load i32* %sign, align 4, !llfi_index !128
  %169 = load i32* %sign, align 4, !llfi_index !128
  %170 = icmp ne i32 %168, 0, !llfi_index !129
  %171 = icmp ne i32 %169, 0, !llfi_index !129
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %170, i1 %171)
  br i1 %170, label %172, label %181, !llfi_index !130

; <label>:172                                     ; preds = %14
  %173 = load float* %OutputX, align 4, !llfi_index !131
  %174 = load float* %OutputX, align 4, !llfi_index !131
  %175 = fpext float %173 to double, !llfi_index !132
  %176 = fpext float %174 to double, !llfi_index !132
  %177 = fsub double 1.000000e+00, %175, !llfi_index !133
  %178 = fsub double 1.000000e+00, %176, !llfi_index !133
  %179 = fptrunc double %177 to float, !llfi_index !134
  %180 = fptrunc double %178 to float, !llfi_index !134
  call void bitcast (void (i64, i64)* @global_add to void (float, float)*)(float %179, float %180)
  store float %179, float* %OutputX, align 4, !llfi_index !135
  br label %181, !llfi_index !136

; <label>:181                                     ; preds = %172, %14
  %182 = load float* %OutputX, align 4, !llfi_index !137
  %183 = load float* %OutputX, align 4, !llfi_index !137
  call void bitcast (void (i64, i64)* @global_add to void (float, float)*)(float %182, float %183)
  ret float %182, !llfi_index !138
}

; Function Attrs: nounwind
declare double @exp(double) #1

; Function Attrs: nounwind uwtable
define float @BlkSchlsEqEuroNoDiv(float %sptprice, float %strike, float %rate, float %volatility, float %time, i32 %otype, float %timet) #0 {
  %1 = alloca float, align 4, !llfi_index !139
  %2 = alloca float, align 4, !llfi_index !140
  %3 = alloca float, align 4, !llfi_index !141
  %4 = alloca float, align 4, !llfi_index !142
  %5 = alloca float, align 4, !llfi_index !143
  %6 = alloca i32, align 4, !llfi_index !144
  %7 = alloca float, align 4, !llfi_index !145
  %OptionPrice = alloca float, align 4, !llfi_index !146
  %xStockPrice = alloca float, align 4, !llfi_index !147
  %xStrikePrice = alloca float, align 4, !llfi_index !148
  %xRiskFreeRate = alloca float, align 4, !llfi_index !149
  %xVolatility = alloca float, align 4, !llfi_index !150
  %xTime = alloca float, align 4, !llfi_index !151
  %xSqrtTime = alloca float, align 4, !llfi_index !152
  %logValues = alloca float, align 4, !llfi_index !153
  %xLogTerm = alloca float, align 4, !llfi_index !154
  %xD1 = alloca float, align 4, !llfi_index !155
  %xD2 = alloca float, align 4, !llfi_index !156
  %xPowerTerm = alloca float, align 4, !llfi_index !157
  %xDen = alloca float, align 4, !llfi_index !158
  %d1 = alloca float, align 4, !llfi_index !159
  %d2 = alloca float, align 4, !llfi_index !160
  %FutureValueX = alloca float, align 4, !llfi_index !161
  %NofXd1 = alloca float, align 4, !llfi_index !162
  %NofXd2 = alloca float, align 4, !llfi_index !163
  %NegNofXd1 = alloca float, align 4, !llfi_index !164
  %NegNofXd2 = alloca float, align 4, !llfi_index !165
  store float %sptprice, float* %1, align 4, !llfi_index !166
  store float %strike, float* %2, align 4, !llfi_index !167
  store float %rate, float* %3, align 4, !llfi_index !168
  store float %volatility, float* %4, align 4, !llfi_index !169
  store float %time, float* %5, align 4, !llfi_index !170
  store i32 %otype, i32* %6, align 4, !llfi_index !171
  store float %timet, float* %7, align 4, !llfi_index !172
  %8 = load float* %1, align 4, !llfi_index !173
  %9 = load float* %1, align 4, !llfi_index !173
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (float, float)*)(float %8, float %9)
  store float %8, float* %xStockPrice, align 4, !llfi_index !174
  %10 = load float* %2, align 4, !llfi_index !175
  %11 = load float* %2, align 4, !llfi_index !175
  call void bitcast (void (i64, i64)* @global_add to void (float, float)*)(float %10, float %11)
  store float %10, float* %xStrikePrice, align 4, !llfi_index !176
  %12 = load float* %3, align 4, !llfi_index !177
  %13 = load float* %3, align 4, !llfi_index !177
  call void bitcast (void (i64, i64)* @global_add to void (float, float)*)(float %12, float %13)
  store float %12, float* %xRiskFreeRate, align 4, !llfi_index !178
  %14 = load float* %4, align 4, !llfi_index !179
  %15 = load float* %4, align 4, !llfi_index !179
  call void bitcast (void (i64, i64)* @global_add to void (float, float)*)(float %14, float %15)
  store float %14, float* %xVolatility, align 4, !llfi_index !180
  %16 = load float* %5, align 4, !llfi_index !181
  %17 = load float* %5, align 4, !llfi_index !181
  call void bitcast (void (i64, i64)* @global_add to void (float, float)*)(float %16, float %17)
  store float %16, float* %xTime, align 4, !llfi_index !182
  %18 = load float* %xTime, align 4, !llfi_index !183
  %19 = load float* %xTime, align 4, !llfi_index !183
  %20 = fpext float %18 to double, !llfi_index !184
  %21 = fpext float %19 to double, !llfi_index !184
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %20, double %21)
  %22 = call double @sqrt(double %20) #5, !llfi_index !185
  %23 = fptrunc double %22 to float, !llfi_index !186
  %24 = fptrunc double %22 to float, !llfi_index !186
  call void bitcast (void (i64, i64)* @global_add to void (float, float)*)(float %23, float %24)
  store float %23, float* %xSqrtTime, align 4, !llfi_index !187
  %25 = load float* %1, align 4, !llfi_index !188
  %26 = load float* %1, align 4, !llfi_index !188
  %27 = load float* %2, align 4, !llfi_index !189
  %28 = load float* %2, align 4, !llfi_index !189
  %29 = fdiv float %25, %27, !llfi_index !190
  %30 = fdiv float %26, %28, !llfi_index !190
  %31 = fpext float %29 to double, !llfi_index !191
  %32 = fpext float %30 to double, !llfi_index !191
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %31, double %32)
  %33 = call double @log(double %31) #5, !llfi_index !192
  %34 = fptrunc double %33 to float, !llfi_index !193
  %35 = fptrunc double %33 to float, !llfi_index !193
  call void bitcast (void (i64, i64)* @global_add to void (float, float)*)(float %34, float %35)
  store float %34, float* %logValues, align 4, !llfi_index !194
  %36 = load float* %logValues, align 4, !llfi_index !195
  %37 = load float* %logValues, align 4, !llfi_index !195
  call void bitcast (void (i64, i64)* @global_add to void (float, float)*)(float %36, float %37)
  store float %36, float* %xLogTerm, align 4, !llfi_index !196
  %38 = load float* %xVolatility, align 4, !llfi_index !197
  %39 = load float* %xVolatility, align 4, !llfi_index !197
  %40 = load float* %xVolatility, align 4, !llfi_index !198
  %41 = load float* %xVolatility, align 4, !llfi_index !198
  %42 = fmul float %38, %40, !llfi_index !199
  %43 = fmul float %39, %41, !llfi_index !199
  call void bitcast (void (i64, i64)* @global_add to void (float, float)*)(float %42, float %43)
  store float %42, float* %xPowerTerm, align 4, !llfi_index !200
  %44 = load float* %xPowerTerm, align 4, !llfi_index !201
  %45 = load float* %xPowerTerm, align 4, !llfi_index !201
  %46 = fpext float %44 to double, !llfi_index !202
  %47 = fpext float %45 to double, !llfi_index !202
  %48 = fmul double %46, 5.000000e-01, !llfi_index !203
  %49 = fmul double %47, 5.000000e-01, !llfi_index !203
  %50 = fptrunc double %48 to float, !llfi_index !204
  %51 = fptrunc double %49 to float, !llfi_index !204
  call void bitcast (void (i64, i64)* @global_add to void (float, float)*)(float %50, float %51)
  store float %50, float* %xPowerTerm, align 4, !llfi_index !205
  %52 = load float* %xRiskFreeRate, align 4, !llfi_index !206
  %53 = load float* %xRiskFreeRate, align 4, !llfi_index !206
  %54 = load float* %xPowerTerm, align 4, !llfi_index !207
  %55 = load float* %xPowerTerm, align 4, !llfi_index !207
  %56 = fadd float %52, %54, !llfi_index !208
  %57 = fadd float %53, %55, !llfi_index !208
  call void bitcast (void (i64, i64)* @global_add to void (float, float)*)(float %56, float %57)
  store float %56, float* %xD1, align 4, !llfi_index !209
  %58 = load float* %xD1, align 4, !llfi_index !210
  %59 = load float* %xD1, align 4, !llfi_index !210
  %60 = load float* %xTime, align 4, !llfi_index !211
  %61 = load float* %xTime, align 4, !llfi_index !211
  %62 = fmul float %58, %60, !llfi_index !212
  %63 = fmul float %59, %61, !llfi_index !212
  call void bitcast (void (i64, i64)* @global_add to void (float, float)*)(float %62, float %63)
  store float %62, float* %xD1, align 4, !llfi_index !213
  %64 = load float* %xD1, align 4, !llfi_index !214
  %65 = load float* %xD1, align 4, !llfi_index !214
  %66 = load float* %xLogTerm, align 4, !llfi_index !215
  %67 = load float* %xLogTerm, align 4, !llfi_index !215
  %68 = fadd float %64, %66, !llfi_index !216
  %69 = fadd float %65, %67, !llfi_index !216
  call void bitcast (void (i64, i64)* @global_add to void (float, float)*)(float %68, float %69)
  store float %68, float* %xD1, align 4, !llfi_index !217
  %70 = load float* %xVolatility, align 4, !llfi_index !218
  %71 = load float* %xVolatility, align 4, !llfi_index !218
  %72 = load float* %xSqrtTime, align 4, !llfi_index !219
  %73 = load float* %xSqrtTime, align 4, !llfi_index !219
  %74 = fmul float %70, %72, !llfi_index !220
  %75 = fmul float %71, %73, !llfi_index !220
  call void bitcast (void (i64, i64)* @global_add to void (float, float)*)(float %74, float %75)
  store float %74, float* %xDen, align 4, !llfi_index !221
  %76 = load float* %xD1, align 4, !llfi_index !222
  %77 = load float* %xD1, align 4, !llfi_index !222
  %78 = load float* %xDen, align 4, !llfi_index !223
  %79 = load float* %xDen, align 4, !llfi_index !223
  %80 = fdiv float %76, %78, !llfi_index !224
  %81 = fdiv float %77, %79, !llfi_index !224
  call void bitcast (void (i64, i64)* @global_add to void (float, float)*)(float %80, float %81)
  store float %80, float* %xD1, align 4, !llfi_index !225
  %82 = load float* %xD1, align 4, !llfi_index !226
  %83 = load float* %xD1, align 4, !llfi_index !226
  %84 = load float* %xDen, align 4, !llfi_index !227
  %85 = load float* %xDen, align 4, !llfi_index !227
  %86 = fsub float %82, %84, !llfi_index !228
  %87 = fsub float %83, %85, !llfi_index !228
  call void bitcast (void (i64, i64)* @global_add to void (float, float)*)(float %86, float %87)
  store float %86, float* %xD2, align 4, !llfi_index !229
  %88 = load float* %xD1, align 4, !llfi_index !230
  %89 = load float* %xD1, align 4, !llfi_index !230
  call void bitcast (void (i64, i64)* @global_add to void (float, float)*)(float %88, float %89)
  store float %88, float* %d1, align 4, !llfi_index !231
  %90 = load float* %xD2, align 4, !llfi_index !232
  %91 = load float* %xD2, align 4, !llfi_index !232
  call void bitcast (void (i64, i64)* @global_add to void (float, float)*)(float %90, float %91)
  store float %90, float* %d2, align 4, !llfi_index !233
  %92 = load float* %d1, align 4, !llfi_index !234
  %93 = load float* %d1, align 4, !llfi_index !234
  call void bitcast (void (i64, i64)* @global_add to void (float, float)*)(float %92, float %93)
  %94 = call float @CNDF(float %92), !llfi_index !235
  store float %94, float* %NofXd1, align 4, !llfi_index !236
  %95 = load float* %d2, align 4, !llfi_index !237
  %96 = load float* %d2, align 4, !llfi_index !237
  call void bitcast (void (i64, i64)* @global_add to void (float, float)*)(float %95, float %96)
  %97 = call float @CNDF(float %95), !llfi_index !238
  store float %97, float* %NofXd2, align 4, !llfi_index !239
  %98 = load float* %2, align 4, !llfi_index !240
  %99 = load float* %2, align 4, !llfi_index !240
  %100 = fpext float %98 to double, !llfi_index !241
  %101 = fpext float %99 to double, !llfi_index !241
  %102 = load float* %3, align 4, !llfi_index !242
  %103 = load float* %3, align 4, !llfi_index !242
  %104 = fsub float -0.000000e+00, %102, !llfi_index !243
  %105 = fsub float -0.000000e+00, %103, !llfi_index !243
  %106 = load float* %5, align 4, !llfi_index !244
  %107 = load float* %5, align 4, !llfi_index !244
  %108 = fmul float %104, %106, !llfi_index !245
  %109 = fmul float %105, %107, !llfi_index !245
  %110 = fpext float %108 to double, !llfi_index !246
  %111 = fpext float %109 to double, !llfi_index !246
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %110, double %111)
  %112 = call double @exp(double %110) #5, !llfi_index !247
  %113 = fmul double %100, %112, !llfi_index !248
  %114 = fmul double %101, %112, !llfi_index !248
  %115 = fptrunc double %113 to float, !llfi_index !249
  %116 = fptrunc double %114 to float, !llfi_index !249
  call void bitcast (void (i64, i64)* @global_add to void (float, float)*)(float %115, float %116)
  store float %115, float* %FutureValueX, align 4, !llfi_index !250
  %117 = load i32* %6, align 4, !llfi_index !251
  %118 = load i32* %6, align 4, !llfi_index !251
  %119 = icmp eq i32 %117, 0, !llfi_index !252
  %120 = icmp eq i32 %118, 0, !llfi_index !252
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %119, i1 %120)
  br i1 %119, label %121, label %136, !llfi_index !253

; <label>:121                                     ; preds = %0
  %122 = load float* %1, align 4, !llfi_index !254
  %123 = load float* %1, align 4, !llfi_index !254
  %124 = load float* %NofXd1, align 4, !llfi_index !255
  %125 = load float* %NofXd1, align 4, !llfi_index !255
  %126 = fmul float %122, %124, !llfi_index !256
  %127 = fmul float %123, %125, !llfi_index !256
  %128 = load float* %FutureValueX, align 4, !llfi_index !257
  %129 = load float* %FutureValueX, align 4, !llfi_index !257
  %130 = load float* %NofXd2, align 4, !llfi_index !258
  %131 = load float* %NofXd2, align 4, !llfi_index !258
  %132 = fmul float %128, %130, !llfi_index !259
  %133 = fmul float %129, %131, !llfi_index !259
  %134 = fsub float %126, %132, !llfi_index !260
  %135 = fsub float %127, %133, !llfi_index !260
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (float, float)*)(float %134, float %135)
  store float %134, float* %OptionPrice, align 4, !llfi_index !261
  br label %167, !llfi_index !262

; <label>:136                                     ; preds = %0
  %137 = load float* %NofXd1, align 4, !llfi_index !263
  %138 = load float* %NofXd1, align 4, !llfi_index !263
  %139 = fpext float %137 to double, !llfi_index !264
  %140 = fpext float %138 to double, !llfi_index !264
  %141 = fsub double 1.000000e+00, %139, !llfi_index !265
  %142 = fsub double 1.000000e+00, %140, !llfi_index !265
  %143 = fptrunc double %141 to float, !llfi_index !266
  %144 = fptrunc double %142 to float, !llfi_index !266
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (float, float)*)(float %143, float %144)
  store float %143, float* %NegNofXd1, align 4, !llfi_index !267
  %145 = load float* %NofXd2, align 4, !llfi_index !268
  %146 = load float* %NofXd2, align 4, !llfi_index !268
  %147 = fpext float %145 to double, !llfi_index !269
  %148 = fpext float %146 to double, !llfi_index !269
  %149 = fsub double 1.000000e+00, %147, !llfi_index !270
  %150 = fsub double 1.000000e+00, %148, !llfi_index !270
  %151 = fptrunc double %149 to float, !llfi_index !271
  %152 = fptrunc double %150 to float, !llfi_index !271
  call void bitcast (void (i64, i64)* @global_add to void (float, float)*)(float %151, float %152)
  store float %151, float* %NegNofXd2, align 4, !llfi_index !272
  %153 = load float* %FutureValueX, align 4, !llfi_index !273
  %154 = load float* %FutureValueX, align 4, !llfi_index !273
  %155 = load float* %NegNofXd2, align 4, !llfi_index !274
  %156 = load float* %NegNofXd2, align 4, !llfi_index !274
  %157 = fmul float %153, %155, !llfi_index !275
  %158 = fmul float %154, %156, !llfi_index !275
  %159 = load float* %1, align 4, !llfi_index !276
  %160 = load float* %1, align 4, !llfi_index !276
  %161 = load float* %NegNofXd1, align 4, !llfi_index !277
  %162 = load float* %NegNofXd1, align 4, !llfi_index !277
  %163 = fmul float %159, %161, !llfi_index !278
  %164 = fmul float %160, %162, !llfi_index !278
  %165 = fsub float %157, %163, !llfi_index !279
  %166 = fsub float %158, %164, !llfi_index !279
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (float, float)*)(float %165, float %166)
  store float %165, float* %OptionPrice, align 4, !llfi_index !280
  br label %167, !llfi_index !281

; <label>:167                                     ; preds = %136, %121
  %168 = load float* %OptionPrice, align 4, !llfi_index !282
  %169 = load float* %OptionPrice, align 4, !llfi_index !282
  call void bitcast (void (i64, i64)* @global_add to void (float, float)*)(float %168, float %169)
  ret float %168, !llfi_index !283
}

; Function Attrs: nounwind
declare double @sqrt(double) #1

; Function Attrs: nounwind
declare double @log(double) #1

; Function Attrs: nounwind uwtable
define i32 @bs_thread(i8* %tid_ptr) #0 {
  %1 = alloca i8*, align 8, !llfi_index !284
  %i = alloca i32, align 4, !llfi_index !285
  %j = alloca i32, align 4, !llfi_index !286
  %price = alloca float, align 4, !llfi_index !287
  %priceDelta = alloca float, align 4, !llfi_index !288
  %tid = alloca i32, align 4, !llfi_index !289
  %start = alloca i32, align 4, !llfi_index !290
  %end = alloca i32, align 4, !llfi_index !291
  store i8* %tid_ptr, i8** %1, align 8, !llfi_index !292
  %2 = load i8** %1, align 8, !llfi_index !293
  %3 = load i8** %1, align 8, !llfi_index !293
  %4 = bitcast i8* %2 to i32*, !llfi_index !294
  %5 = bitcast i8* %3 to i32*, !llfi_index !294
  %6 = load i32* %4, align 4, !llfi_index !295
  %7 = load i32* %5, align 4, !llfi_index !295
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %6, i32 %7)
  store i32 %6, i32* %tid, align 4, !llfi_index !296
  %8 = load i32* %tid, align 4, !llfi_index !297
  %9 = load i32* %tid, align 4, !llfi_index !297
  %10 = load i32* @numOptions, align 4, !llfi_index !298
  %11 = load i32* @numOptions, align 4, !llfi_index !298
  %12 = load i32* @nThreads, align 4, !llfi_index !299
  %13 = load i32* @nThreads, align 4, !llfi_index !299
  %14 = sdiv i32 %10, %12, !llfi_index !300
  %15 = sdiv i32 %11, %13, !llfi_index !300
  %16 = mul nsw i32 %8, %14, !llfi_index !301
  %17 = mul nsw i32 %9, %15, !llfi_index !301
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %16, i32 %17)
  store i32 %16, i32* %start, align 4, !llfi_index !302
  %18 = load i32* %start, align 4, !llfi_index !303
  %19 = load i32* %start, align 4, !llfi_index !303
  %20 = load i32* @numOptions, align 4, !llfi_index !304
  %21 = load i32* @numOptions, align 4, !llfi_index !304
  %22 = load i32* @nThreads, align 4, !llfi_index !305
  %23 = load i32* @nThreads, align 4, !llfi_index !305
  %24 = sdiv i32 %20, %22, !llfi_index !306
  %25 = sdiv i32 %21, %23, !llfi_index !306
  %26 = add nsw i32 %18, %24, !llfi_index !307
  %27 = add nsw i32 %19, %25, !llfi_index !307
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %26, i32 %27)
  store i32 %26, i32* %end, align 4, !llfi_index !308
  store i32 0, i32* %j, align 4, !llfi_index !309
  br label %28, !llfi_index !310

; <label>:28                                      ; preds = %121, %0
  %29 = load i32* %j, align 4, !llfi_index !311
  %30 = load i32* %j, align 4, !llfi_index !311
  %31 = icmp slt i32 %29, 100, !llfi_index !312
  %32 = icmp slt i32 %30, 100, !llfi_index !312
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %31, i1 %32)
  br i1 %31, label %33, label %126, !llfi_index !313

; <label>:33                                      ; preds = %28
  %34 = load i32* %start, align 4, !llfi_index !314
  %35 = load i32* %start, align 4, !llfi_index !314
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %34, i32 %35)
  store i32 %34, i32* %i, align 4, !llfi_index !315
  br label %36, !llfi_index !316

; <label>:36                                      ; preds = %115, %33
  %37 = load i32* %i, align 4, !llfi_index !317
  %38 = load i32* %i, align 4, !llfi_index !317
  %39 = load i32* %end, align 4, !llfi_index !318
  %40 = load i32* %end, align 4, !llfi_index !318
  %41 = icmp slt i32 %37, %39, !llfi_index !319
  %42 = icmp slt i32 %38, %40, !llfi_index !319
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %41, i1 %42)
  br i1 %41, label %43, label %120, !llfi_index !320

; <label>:43                                      ; preds = %36
  %44 = load i32* %i, align 4, !llfi_index !321
  %45 = load i32* %i, align 4, !llfi_index !321
  %46 = sext i32 %44 to i64, !llfi_index !322
  %47 = sext i32 %45 to i64, !llfi_index !322
  %48 = load float** @sptprice, align 8, !llfi_index !323
  %49 = load float** @sptprice, align 8, !llfi_index !323
  %50 = getelementptr inbounds float* %48, i64 %46, !llfi_index !324
  %51 = getelementptr inbounds float* %49, i64 %47, !llfi_index !324
  %52 = load float* %50, align 4, !llfi_index !325
  %53 = load float* %51, align 4, !llfi_index !325
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (float, float)*)(float %52, float %53)
  %54 = load i32* %i, align 4, !llfi_index !326
  %55 = load i32* %i, align 4, !llfi_index !326
  %56 = sext i32 %54 to i64, !llfi_index !327
  %57 = sext i32 %55 to i64, !llfi_index !327
  %58 = load float** @strike, align 8, !llfi_index !328
  %59 = load float** @strike, align 8, !llfi_index !328
  %60 = getelementptr inbounds float* %58, i64 %56, !llfi_index !329
  %61 = getelementptr inbounds float* %59, i64 %57, !llfi_index !329
  %62 = load float* %60, align 4, !llfi_index !330
  %63 = load float* %61, align 4, !llfi_index !330
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (float, float)*)(float %62, float %63)
  %64 = load i32* %i, align 4, !llfi_index !331
  %65 = load i32* %i, align 4, !llfi_index !331
  %66 = sext i32 %64 to i64, !llfi_index !332
  %67 = sext i32 %65 to i64, !llfi_index !332
  %68 = load float** @rate, align 8, !llfi_index !333
  %69 = load float** @rate, align 8, !llfi_index !333
  %70 = getelementptr inbounds float* %68, i64 %66, !llfi_index !334
  %71 = getelementptr inbounds float* %69, i64 %67, !llfi_index !334
  %72 = load float* %70, align 4, !llfi_index !335
  %73 = load float* %71, align 4, !llfi_index !335
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (float, float)*)(float %72, float %73)
  %74 = load i32* %i, align 4, !llfi_index !336
  %75 = load i32* %i, align 4, !llfi_index !336
  %76 = sext i32 %74 to i64, !llfi_index !337
  %77 = sext i32 %75 to i64, !llfi_index !337
  %78 = load float** @volatility, align 8, !llfi_index !338
  %79 = load float** @volatility, align 8, !llfi_index !338
  %80 = getelementptr inbounds float* %78, i64 %76, !llfi_index !339
  %81 = getelementptr inbounds float* %79, i64 %77, !llfi_index !339
  %82 = load float* %80, align 4, !llfi_index !340
  %83 = load float* %81, align 4, !llfi_index !340
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (float, float)*)(float %82, float %83)
  %84 = load i32* %i, align 4, !llfi_index !341
  %85 = load i32* %i, align 4, !llfi_index !341
  %86 = sext i32 %84 to i64, !llfi_index !342
  %87 = sext i32 %85 to i64, !llfi_index !342
  %88 = load float** @otime, align 8, !llfi_index !343
  %89 = load float** @otime, align 8, !llfi_index !343
  %90 = getelementptr inbounds float* %88, i64 %86, !llfi_index !344
  %91 = getelementptr inbounds float* %89, i64 %87, !llfi_index !344
  %92 = load float* %90, align 4, !llfi_index !345
  %93 = load float* %91, align 4, !llfi_index !345
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (float, float)*)(float %92, float %93)
  %94 = load i32* %i, align 4, !llfi_index !346
  %95 = load i32* %i, align 4, !llfi_index !346
  %96 = sext i32 %94 to i64, !llfi_index !347
  %97 = sext i32 %95 to i64, !llfi_index !347
  %98 = load i32** @otype, align 8, !llfi_index !348
  %99 = load i32** @otype, align 8, !llfi_index !348
  %100 = getelementptr inbounds i32* %98, i64 %96, !llfi_index !349
  %101 = getelementptr inbounds i32* %99, i64 %97, !llfi_index !349
  %102 = load i32* %100, align 4, !llfi_index !350
  %103 = load i32* %101, align 4, !llfi_index !350
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %102, i32 %103)
  %104 = call float @BlkSchlsEqEuroNoDiv(float %52, float %62, float %72, float %82, float %92, i32 %102, float 0.000000e+00), !llfi_index !351
  store float %104, float* %price, align 4, !llfi_index !352
  %105 = load float* %price, align 4, !llfi_index !353
  %106 = load float* %price, align 4, !llfi_index !353
  call void bitcast (void (i64, i64)* @global_add to void (float, float)*)(float %105, float %106)
  %107 = load i32* %i, align 4, !llfi_index !354
  %108 = load i32* %i, align 4, !llfi_index !354
  %109 = sext i32 %107 to i64, !llfi_index !355
  %110 = sext i32 %108 to i64, !llfi_index !355
  %111 = load float** @prices, align 8, !llfi_index !356
  %112 = load float** @prices, align 8, !llfi_index !356
  %113 = getelementptr inbounds float* %111, i64 %109, !llfi_index !357
  %114 = getelementptr inbounds float* %112, i64 %110, !llfi_index !357
  call void bitcast (void (i64, i64)* @global_add to void (float*, float*)*)(float* %113, float* %114)
  store float %105, float* %113, align 4, !llfi_index !358
  br label %115, !llfi_index !359

; <label>:115                                     ; preds = %43
  %116 = load i32* %i, align 4, !llfi_index !360
  %117 = load i32* %i, align 4, !llfi_index !360
  %118 = add nsw i32 %116, 1, !llfi_index !361
  %119 = add nsw i32 %117, 1, !llfi_index !361
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %118, i32 %119)
  store i32 %118, i32* %i, align 4, !llfi_index !362
  br label %36, !llfi_index !363

; <label>:120                                     ; preds = %36
  br label %121, !llfi_index !364

; <label>:121                                     ; preds = %120
  %122 = load i32* %j, align 4, !llfi_index !365
  %123 = load i32* %j, align 4, !llfi_index !365
  %124 = add nsw i32 %122, 1, !llfi_index !366
  %125 = add nsw i32 %123, 1, !llfi_index !366
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %124, i32 %125)
  store i32 %124, i32* %j, align 4, !llfi_index !367
  br label %28, !llfi_index !368

; <label>:126                                     ; preds = %28
  ret i32 0, !llfi_index !369
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4, !llfi_index !370
  %2 = alloca i32, align 4, !llfi_index !371
  %3 = alloca i8**, align 8, !llfi_index !372
  %file = alloca %struct._IO_FILE*, align 8, !llfi_index !373
  %i = alloca i32, align 4, !llfi_index !374
  %loopnum = alloca i32, align 4, !llfi_index !375
  %buffer = alloca float*, align 8, !llfi_index !376
  %buffer2 = alloca i32*, align 8, !llfi_index !377
  %rv = alloca i32, align 4, !llfi_index !378
  %inputFile = alloca i8*, align 8, !llfi_index !379
  %outputFile = alloca i8*, align 8, !llfi_index !380
  %tid = alloca i32, align 4, !llfi_index !381
  store i32 0, i32* %1, !llfi_index !382
  store i32 %argc, i32* %2, align 4, !llfi_index !383
  store i8** %argv, i8*** %3, align 8, !llfi_index !384
  %4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([24 x i8]* @.str, i32 0, i32 0)), !llfi_index !385
  %5 = call i32 @fflush(%struct._IO_FILE* null), !llfi_index !386
  %6 = load i32* %2, align 4, !llfi_index !387
  %7 = load i32* %2, align 4, !llfi_index !387
  %8 = icmp ne i32 %6, 4, !llfi_index !388
  %9 = icmp ne i32 %7, 4, !llfi_index !388
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %8, i1 %9)
  br i1 %8, label %10, label %18, !llfi_index !389

; <label>:10                                      ; preds = %0
  %11 = load i8*** %3, align 8, !llfi_index !390
  %12 = load i8*** %3, align 8, !llfi_index !390
  %13 = getelementptr inbounds i8** %11, i64 0, !llfi_index !391
  %14 = getelementptr inbounds i8** %12, i64 0, !llfi_index !391
  %15 = load i8** %13, align 8, !llfi_index !392
  %16 = load i8** %14, align 8, !llfi_index !392
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %15, i8* %16)
  %17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([48 x i8]* @.str1, i32 0, i32 0), i8* %15), !llfi_index !393
  call void @global_check()
  call void @exit(i32 1) #6, !llfi_index !394
  unreachable, !llfi_index !395

; <label>:18                                      ; preds = %0
  %19 = load i8*** %3, align 8, !llfi_index !396
  %20 = load i8*** %3, align 8, !llfi_index !396
  %21 = getelementptr inbounds i8** %19, i64 1, !llfi_index !397
  %22 = getelementptr inbounds i8** %20, i64 1, !llfi_index !397
  %23 = load i8** %21, align 8, !llfi_index !398
  %24 = load i8** %22, align 8, !llfi_index !398
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %23, i8* %24)
  %25 = call i32 @atoi(i8* %23) #7, !llfi_index !399
  store i32 %25, i32* @nThreads, align 4, !llfi_index !400
  %26 = load i8*** %3, align 8, !llfi_index !401
  %27 = load i8*** %3, align 8, !llfi_index !401
  %28 = getelementptr inbounds i8** %26, i64 2, !llfi_index !402
  %29 = getelementptr inbounds i8** %27, i64 2, !llfi_index !402
  %30 = load i8** %28, align 8, !llfi_index !403
  %31 = load i8** %29, align 8, !llfi_index !403
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %30, i8* %31)
  store i8* %30, i8** %inputFile, align 8, !llfi_index !404
  %32 = load i8*** %3, align 8, !llfi_index !405
  %33 = load i8*** %3, align 8, !llfi_index !405
  %34 = getelementptr inbounds i8** %32, i64 3, !llfi_index !406
  %35 = getelementptr inbounds i8** %33, i64 3, !llfi_index !406
  %36 = load i8** %34, align 8, !llfi_index !407
  %37 = load i8** %35, align 8, !llfi_index !407
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %36, i8* %37)
  store i8* %36, i8** %outputFile, align 8, !llfi_index !408
  %38 = load i8** %inputFile, align 8, !llfi_index !409
  %39 = load i8** %inputFile, align 8, !llfi_index !409
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %38, i8* %39)
  %40 = call %struct._IO_FILE* @fopen(i8* %38, i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0)), !llfi_index !410
  store %struct._IO_FILE* %40, %struct._IO_FILE** %file, align 8, !llfi_index !411
  %41 = load %struct._IO_FILE** %file, align 8, !llfi_index !412
  %42 = load %struct._IO_FILE** %file, align 8, !llfi_index !412
  %43 = icmp eq %struct._IO_FILE* %41, null, !llfi_index !413
  %44 = icmp eq %struct._IO_FILE* %42, null, !llfi_index !413
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %43, i1 %44)
  br i1 %43, label %45, label %49, !llfi_index !414

; <label>:45                                      ; preds = %18
  %46 = load i8** %inputFile, align 8, !llfi_index !415
  %47 = load i8** %inputFile, align 8, !llfi_index !415
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %46, i8* %47)
  %48 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([34 x i8]* @.str3, i32 0, i32 0), i8* %46), !llfi_index !416
  call void @global_check()
  call void @exit(i32 1) #6, !llfi_index !417
  unreachable, !llfi_index !418

; <label>:49                                      ; preds = %18
  %50 = load %struct._IO_FILE** %file, align 8, !llfi_index !419
  %51 = load %struct._IO_FILE** %file, align 8, !llfi_index !419
  call void bitcast (void (i64, i64)* @global_add to void (%struct._IO_FILE*, %struct._IO_FILE*)*)(%struct._IO_FILE* %50, %struct._IO_FILE* %51)
  %52 = call i32 (%struct._IO_FILE*, i8*, ...)* @__isoc99_fscanf(%struct._IO_FILE* %50, i8* getelementptr inbounds ([3 x i8]* @.str4, i32 0, i32 0), i32* @numOptions), !llfi_index !420
  store i32 %52, i32* %rv, align 4, !llfi_index !421
  %53 = load i32* %rv, align 4, !llfi_index !422
  %54 = load i32* %rv, align 4, !llfi_index !422
  %55 = icmp ne i32 %53, 1, !llfi_index !423
  %56 = icmp ne i32 %54, 1, !llfi_index !423
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %55, i1 %56)
  br i1 %55, label %57, label %64, !llfi_index !424

; <label>:57                                      ; preds = %49
  %58 = load i8** %inputFile, align 8, !llfi_index !425
  %59 = load i8** %inputFile, align 8, !llfi_index !425
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %58, i8* %59)
  %60 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([39 x i8]* @.str5, i32 0, i32 0), i8* %58), !llfi_index !426
  %61 = load %struct._IO_FILE** %file, align 8, !llfi_index !427
  %62 = load %struct._IO_FILE** %file, align 8, !llfi_index !427
  call void bitcast (void (i64, i64)* @global_add to void (%struct._IO_FILE*, %struct._IO_FILE*)*)(%struct._IO_FILE* %61, %struct._IO_FILE* %62)
  %63 = call i32 @fclose(%struct._IO_FILE* %61), !llfi_index !428
  call void @global_check()
  call void @exit(i32 1) #6, !llfi_index !429
  unreachable, !llfi_index !430

; <label>:64                                      ; preds = %49
  %65 = load i32* @nThreads, align 4, !llfi_index !431
  %66 = load i32* @nThreads, align 4, !llfi_index !431
  %67 = load i32* @numOptions, align 4, !llfi_index !432
  %68 = load i32* @numOptions, align 4, !llfi_index !432
  %69 = icmp sgt i32 %65, %67, !llfi_index !433
  %70 = icmp sgt i32 %66, %68, !llfi_index !433
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %69, i1 %70)
  br i1 %69, label %71, label %75, !llfi_index !434

; <label>:71                                      ; preds = %64
  %72 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([82 x i8]* @.str6, i32 0, i32 0)), !llfi_index !435
  %73 = load i32* @numOptions, align 4, !llfi_index !436
  %74 = load i32* @numOptions, align 4, !llfi_index !436
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %73, i32 %74)
  store i32 %73, i32* @nThreads, align 4, !llfi_index !437
  br label %75, !llfi_index !438

; <label>:75                                      ; preds = %71, %64
  %76 = load i32* @nThreads, align 4, !llfi_index !439
  %77 = load i32* @nThreads, align 4, !llfi_index !439
  %78 = icmp ne i32 %76, 1, !llfi_index !440
  %79 = icmp ne i32 %77, 1, !llfi_index !440
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %78, i1 %79)
  br i1 %78, label %80, label %82, !llfi_index !441

; <label>:80                                      ; preds = %75
  %81 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([46 x i8]* @.str7, i32 0, i32 0)), !llfi_index !442
  call void @global_check()
  call void @exit(i32 1) #6, !llfi_index !443
  unreachable, !llfi_index !444

; <label>:82                                      ; preds = %75
  %83 = load i32* @numOptions, align 4, !llfi_index !445
  %84 = load i32* @numOptions, align 4, !llfi_index !445
  %85 = sext i32 %83 to i64, !llfi_index !446
  %86 = sext i32 %84 to i64, !llfi_index !446
  %87 = mul i64 %85, 36, !llfi_index !447
  %88 = mul i64 %86, 36, !llfi_index !447
  call void @global_add(i64 %87, i64 %88)
  %89 = call noalias i8* @malloc(i64 %87) #5, !llfi_index !448
  %90 = bitcast i8* %89 to %struct.OptionData_*, !llfi_index !449
  %91 = bitcast i8* %89 to %struct.OptionData_*, !llfi_index !449
  call void bitcast (void (i64, i64)* @global_add to void (%struct.OptionData_*, %struct.OptionData_*)*)(%struct.OptionData_* %90, %struct.OptionData_* %91)
  store %struct.OptionData_* %90, %struct.OptionData_** @data, align 8, !llfi_index !450
  %92 = load i32* @numOptions, align 4, !llfi_index !451
  %93 = load i32* @numOptions, align 4, !llfi_index !451
  %94 = sext i32 %92 to i64, !llfi_index !452
  %95 = sext i32 %93 to i64, !llfi_index !452
  %96 = mul i64 %94, 4, !llfi_index !453
  %97 = mul i64 %95, 4, !llfi_index !453
  call void @global_add(i64 %96, i64 %97)
  %98 = call noalias i8* @malloc(i64 %96) #5, !llfi_index !454
  %99 = bitcast i8* %98 to float*, !llfi_index !455
  %100 = bitcast i8* %98 to float*, !llfi_index !455
  call void bitcast (void (i64, i64)* @global_add to void (float*, float*)*)(float* %99, float* %100)
  store float* %99, float** @prices, align 8, !llfi_index !456
  store i32 0, i32* %loopnum, align 4, !llfi_index !457
  br label %101, !llfi_index !458

; <label>:101                                     ; preds = %214, %82
  %102 = load i32* %loopnum, align 4, !llfi_index !459
  %103 = load i32* %loopnum, align 4, !llfi_index !459
  %104 = load i32* @numOptions, align 4, !llfi_index !460
  %105 = load i32* @numOptions, align 4, !llfi_index !460
  %106 = icmp slt i32 %102, %104, !llfi_index !461
  %107 = icmp slt i32 %103, %105, !llfi_index !461
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %106, i1 %107)
  br i1 %106, label %108, label %219, !llfi_index !462

; <label>:108                                     ; preds = %101
  %109 = load %struct._IO_FILE** %file, align 8, !llfi_index !463
  %110 = load %struct._IO_FILE** %file, align 8, !llfi_index !463
  call void bitcast (void (i64, i64)* @global_add to void (%struct._IO_FILE*, %struct._IO_FILE*)*)(%struct._IO_FILE* %109, %struct._IO_FILE* %110)
  %111 = load i32* %loopnum, align 4, !llfi_index !464
  %112 = load i32* %loopnum, align 4, !llfi_index !464
  %113 = sext i32 %111 to i64, !llfi_index !465
  %114 = sext i32 %112 to i64, !llfi_index !465
  %115 = load %struct.OptionData_** @data, align 8, !llfi_index !466
  %116 = load %struct.OptionData_** @data, align 8, !llfi_index !466
  %117 = getelementptr inbounds %struct.OptionData_* %115, i64 %113, !llfi_index !467
  %118 = getelementptr inbounds %struct.OptionData_* %116, i64 %114, !llfi_index !467
  %119 = getelementptr inbounds %struct.OptionData_* %117, i32 0, i32 0, !llfi_index !468
  %120 = getelementptr inbounds %struct.OptionData_* %118, i32 0, i32 0, !llfi_index !468
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (float*, float*)*)(float* %119, float* %120)
  %121 = load i32* %loopnum, align 4, !llfi_index !469
  %122 = load i32* %loopnum, align 4, !llfi_index !469
  %123 = sext i32 %121 to i64, !llfi_index !470
  %124 = sext i32 %122 to i64, !llfi_index !470
  %125 = load %struct.OptionData_** @data, align 8, !llfi_index !471
  %126 = load %struct.OptionData_** @data, align 8, !llfi_index !471
  %127 = getelementptr inbounds %struct.OptionData_* %125, i64 %123, !llfi_index !472
  %128 = getelementptr inbounds %struct.OptionData_* %126, i64 %124, !llfi_index !472
  %129 = getelementptr inbounds %struct.OptionData_* %127, i32 0, i32 1, !llfi_index !473
  %130 = getelementptr inbounds %struct.OptionData_* %128, i32 0, i32 1, !llfi_index !473
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (float*, float*)*)(float* %129, float* %130)
  %131 = load i32* %loopnum, align 4, !llfi_index !474
  %132 = load i32* %loopnum, align 4, !llfi_index !474
  %133 = sext i32 %131 to i64, !llfi_index !475
  %134 = sext i32 %132 to i64, !llfi_index !475
  %135 = load %struct.OptionData_** @data, align 8, !llfi_index !476
  %136 = load %struct.OptionData_** @data, align 8, !llfi_index !476
  %137 = getelementptr inbounds %struct.OptionData_* %135, i64 %133, !llfi_index !477
  %138 = getelementptr inbounds %struct.OptionData_* %136, i64 %134, !llfi_index !477
  %139 = getelementptr inbounds %struct.OptionData_* %137, i32 0, i32 2, !llfi_index !478
  %140 = getelementptr inbounds %struct.OptionData_* %138, i32 0, i32 2, !llfi_index !478
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (float*, float*)*)(float* %139, float* %140)
  %141 = load i32* %loopnum, align 4, !llfi_index !479
  %142 = load i32* %loopnum, align 4, !llfi_index !479
  %143 = sext i32 %141 to i64, !llfi_index !480
  %144 = sext i32 %142 to i64, !llfi_index !480
  %145 = load %struct.OptionData_** @data, align 8, !llfi_index !481
  %146 = load %struct.OptionData_** @data, align 8, !llfi_index !481
  %147 = getelementptr inbounds %struct.OptionData_* %145, i64 %143, !llfi_index !482
  %148 = getelementptr inbounds %struct.OptionData_* %146, i64 %144, !llfi_index !482
  %149 = getelementptr inbounds %struct.OptionData_* %147, i32 0, i32 3, !llfi_index !483
  %150 = getelementptr inbounds %struct.OptionData_* %148, i32 0, i32 3, !llfi_index !483
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (float*, float*)*)(float* %149, float* %150)
  %151 = load i32* %loopnum, align 4, !llfi_index !484
  %152 = load i32* %loopnum, align 4, !llfi_index !484
  %153 = sext i32 %151 to i64, !llfi_index !485
  %154 = sext i32 %152 to i64, !llfi_index !485
  %155 = load %struct.OptionData_** @data, align 8, !llfi_index !486
  %156 = load %struct.OptionData_** @data, align 8, !llfi_index !486
  %157 = getelementptr inbounds %struct.OptionData_* %155, i64 %153, !llfi_index !487
  %158 = getelementptr inbounds %struct.OptionData_* %156, i64 %154, !llfi_index !487
  %159 = getelementptr inbounds %struct.OptionData_* %157, i32 0, i32 4, !llfi_index !488
  %160 = getelementptr inbounds %struct.OptionData_* %158, i32 0, i32 4, !llfi_index !488
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (float*, float*)*)(float* %159, float* %160)
  %161 = load i32* %loopnum, align 4, !llfi_index !489
  %162 = load i32* %loopnum, align 4, !llfi_index !489
  %163 = sext i32 %161 to i64, !llfi_index !490
  %164 = sext i32 %162 to i64, !llfi_index !490
  %165 = load %struct.OptionData_** @data, align 8, !llfi_index !491
  %166 = load %struct.OptionData_** @data, align 8, !llfi_index !491
  %167 = getelementptr inbounds %struct.OptionData_* %165, i64 %163, !llfi_index !492
  %168 = getelementptr inbounds %struct.OptionData_* %166, i64 %164, !llfi_index !492
  %169 = getelementptr inbounds %struct.OptionData_* %167, i32 0, i32 5, !llfi_index !493
  %170 = getelementptr inbounds %struct.OptionData_* %168, i32 0, i32 5, !llfi_index !493
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (float*, float*)*)(float* %169, float* %170)
  %171 = load i32* %loopnum, align 4, !llfi_index !494
  %172 = load i32* %loopnum, align 4, !llfi_index !494
  %173 = sext i32 %171 to i64, !llfi_index !495
  %174 = sext i32 %172 to i64, !llfi_index !495
  %175 = load %struct.OptionData_** @data, align 8, !llfi_index !496
  %176 = load %struct.OptionData_** @data, align 8, !llfi_index !496
  %177 = getelementptr inbounds %struct.OptionData_* %175, i64 %173, !llfi_index !497
  %178 = getelementptr inbounds %struct.OptionData_* %176, i64 %174, !llfi_index !497
  %179 = getelementptr inbounds %struct.OptionData_* %177, i32 0, i32 6, !llfi_index !498
  %180 = getelementptr inbounds %struct.OptionData_* %178, i32 0, i32 6, !llfi_index !498
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %179, i8* %180)
  %181 = load i32* %loopnum, align 4, !llfi_index !499
  %182 = load i32* %loopnum, align 4, !llfi_index !499
  %183 = sext i32 %181 to i64, !llfi_index !500
  %184 = sext i32 %182 to i64, !llfi_index !500
  %185 = load %struct.OptionData_** @data, align 8, !llfi_index !501
  %186 = load %struct.OptionData_** @data, align 8, !llfi_index !501
  %187 = getelementptr inbounds %struct.OptionData_* %185, i64 %183, !llfi_index !502
  %188 = getelementptr inbounds %struct.OptionData_* %186, i64 %184, !llfi_index !502
  %189 = getelementptr inbounds %struct.OptionData_* %187, i32 0, i32 7, !llfi_index !503
  %190 = getelementptr inbounds %struct.OptionData_* %188, i32 0, i32 7, !llfi_index !503
  call void bitcast (void (i64, i64)* @global_add to void (float*, float*)*)(float* %189, float* %190)
  %191 = load i32* %loopnum, align 4, !llfi_index !504
  %192 = load i32* %loopnum, align 4, !llfi_index !504
  %193 = sext i32 %191 to i64, !llfi_index !505
  %194 = sext i32 %192 to i64, !llfi_index !505
  %195 = load %struct.OptionData_** @data, align 8, !llfi_index !506
  %196 = load %struct.OptionData_** @data, align 8, !llfi_index !506
  %197 = getelementptr inbounds %struct.OptionData_* %195, i64 %193, !llfi_index !507
  %198 = getelementptr inbounds %struct.OptionData_* %196, i64 %194, !llfi_index !507
  %199 = getelementptr inbounds %struct.OptionData_* %197, i32 0, i32 8, !llfi_index !508
  %200 = getelementptr inbounds %struct.OptionData_* %198, i32 0, i32 8, !llfi_index !508
  call void bitcast (void (i64, i64)* @global_add to void (float*, float*)*)(float* %199, float* %200)
  %201 = call i32 (%struct._IO_FILE*, i8*, ...)* @__isoc99_fscanf(%struct._IO_FILE* %109, i8* getelementptr inbounds ([27 x i8]* @.str8, i32 0, i32 0), float* %119, float* %129, float* %139, float* %149, float* %159, float* %169, i8* %179, float* %189, float* %199), !llfi_index !509
  store i32 %201, i32* %rv, align 4, !llfi_index !510
  %202 = load i32* %rv, align 4, !llfi_index !511
  %203 = load i32* %rv, align 4, !llfi_index !511
  %204 = icmp ne i32 %202, 9, !llfi_index !512
  %205 = icmp ne i32 %203, 9, !llfi_index !512
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %204, i1 %205)
  br i1 %204, label %206, label %213, !llfi_index !513

; <label>:206                                     ; preds = %108
  %207 = load i8** %inputFile, align 8, !llfi_index !514
  %208 = load i8** %inputFile, align 8, !llfi_index !514
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %207, i8* %208)
  %209 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([39 x i8]* @.str5, i32 0, i32 0), i8* %207), !llfi_index !515
  %210 = load %struct._IO_FILE** %file, align 8, !llfi_index !516
  %211 = load %struct._IO_FILE** %file, align 8, !llfi_index !516
  call void bitcast (void (i64, i64)* @global_add to void (%struct._IO_FILE*, %struct._IO_FILE*)*)(%struct._IO_FILE* %210, %struct._IO_FILE* %211)
  %212 = call i32 @fclose(%struct._IO_FILE* %210), !llfi_index !517
  call void @global_check()
  call void @exit(i32 1) #6, !llfi_index !518
  unreachable, !llfi_index !519

; <label>:213                                     ; preds = %108
  br label %214, !llfi_index !520

; <label>:214                                     ; preds = %213
  %215 = load i32* %loopnum, align 4, !llfi_index !521
  %216 = load i32* %loopnum, align 4, !llfi_index !521
  %217 = add nsw i32 %215, 1, !llfi_index !522
  %218 = add nsw i32 %216, 1, !llfi_index !522
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %217, i32 %218)
  store i32 %217, i32* %loopnum, align 4, !llfi_index !523
  br label %101, !llfi_index !524

; <label>:219                                     ; preds = %101
  %220 = load %struct._IO_FILE** %file, align 8, !llfi_index !525
  %221 = load %struct._IO_FILE** %file, align 8, !llfi_index !525
  call void bitcast (void (i64, i64)* @global_add to void (%struct._IO_FILE*, %struct._IO_FILE*)*)(%struct._IO_FILE* %220, %struct._IO_FILE* %221)
  %222 = call i32 @fclose(%struct._IO_FILE* %220), !llfi_index !526
  store i32 %222, i32* %rv, align 4, !llfi_index !527
  %223 = load i32* %rv, align 4, !llfi_index !528
  %224 = load i32* %rv, align 4, !llfi_index !528
  %225 = icmp ne i32 %223, 0, !llfi_index !529
  %226 = icmp ne i32 %224, 0, !llfi_index !529
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %225, i1 %226)
  br i1 %225, label %227, label %231, !llfi_index !530

; <label>:227                                     ; preds = %219
  %228 = load i8** %inputFile, align 8, !llfi_index !531
  %229 = load i8** %inputFile, align 8, !llfi_index !531
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %228, i8* %229)
  %230 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([35 x i8]* @.str9, i32 0, i32 0), i8* %228), !llfi_index !532
  call void @global_check()
  call void @exit(i32 1) #6, !llfi_index !533
  unreachable, !llfi_index !534

; <label>:231                                     ; preds = %219
  %232 = load i32* @numOptions, align 4, !llfi_index !535
  %233 = load i32* @numOptions, align 4, !llfi_index !535
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %232, i32 %233)
  %234 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str10, i32 0, i32 0), i32 %232), !llfi_index !536
  %235 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str11, i32 0, i32 0), i32 100), !llfi_index !537
  %236 = load i32* @numOptions, align 4, !llfi_index !538
  %237 = load i32* @numOptions, align 4, !llfi_index !538
  %238 = mul nsw i32 5, %236, !llfi_index !539
  %239 = mul nsw i32 5, %237, !llfi_index !539
  %240 = sext i32 %238 to i64, !llfi_index !540
  %241 = sext i32 %239 to i64, !llfi_index !540
  %242 = mul i64 %240, 4, !llfi_index !541
  %243 = mul i64 %241, 4, !llfi_index !541
  %244 = add i64 %242, 256, !llfi_index !542
  %245 = add i64 %243, 256, !llfi_index !542
  call void @global_add(i64 %244, i64 %245)
  %246 = call noalias i8* @malloc(i64 %244) #5, !llfi_index !543
  %247 = bitcast i8* %246 to float*, !llfi_index !544
  %248 = bitcast i8* %246 to float*, !llfi_index !544
  call void bitcast (void (i64, i64)* @global_add to void (float*, float*)*)(float* %247, float* %248)
  store float* %247, float** %buffer, align 8, !llfi_index !545
  %249 = load float** %buffer, align 8, !llfi_index !546
  %250 = load float** %buffer, align 8, !llfi_index !546
  %251 = ptrtoint float* %249 to i64, !llfi_index !547
  %252 = ptrtoint float* %250 to i64, !llfi_index !547
  %253 = add i64 %251, 256, !llfi_index !548
  %254 = add i64 %252, 256, !llfi_index !548
  %255 = and i64 %253, -64, !llfi_index !549
  %256 = and i64 %254, -64, !llfi_index !549
  %257 = inttoptr i64 %255 to float*, !llfi_index !550
  %258 = inttoptr i64 %256 to float*, !llfi_index !550
  call void bitcast (void (i64, i64)* @global_add to void (float*, float*)*)(float* %257, float* %258)
  store float* %257, float** @sptprice, align 8, !llfi_index !551
  %259 = load float** @sptprice, align 8, !llfi_index !552
  %260 = load float** @sptprice, align 8, !llfi_index !552
  %261 = load i32* @numOptions, align 4, !llfi_index !553
  %262 = load i32* @numOptions, align 4, !llfi_index !553
  %263 = sext i32 %261 to i64, !llfi_index !554
  %264 = sext i32 %262 to i64, !llfi_index !554
  %265 = getelementptr inbounds float* %259, i64 %263, !llfi_index !555
  %266 = getelementptr inbounds float* %260, i64 %264, !llfi_index !555
  call void bitcast (void (i64, i64)* @global_add to void (float*, float*)*)(float* %265, float* %266)
  store float* %265, float** @strike, align 8, !llfi_index !556
  %267 = load float** @strike, align 8, !llfi_index !557
  %268 = load float** @strike, align 8, !llfi_index !557
  %269 = load i32* @numOptions, align 4, !llfi_index !558
  %270 = load i32* @numOptions, align 4, !llfi_index !558
  %271 = sext i32 %269 to i64, !llfi_index !559
  %272 = sext i32 %270 to i64, !llfi_index !559
  %273 = getelementptr inbounds float* %267, i64 %271, !llfi_index !560
  %274 = getelementptr inbounds float* %268, i64 %272, !llfi_index !560
  call void bitcast (void (i64, i64)* @global_add to void (float*, float*)*)(float* %273, float* %274)
  store float* %273, float** @rate, align 8, !llfi_index !561
  %275 = load float** @rate, align 8, !llfi_index !562
  %276 = load float** @rate, align 8, !llfi_index !562
  %277 = load i32* @numOptions, align 4, !llfi_index !563
  %278 = load i32* @numOptions, align 4, !llfi_index !563
  %279 = sext i32 %277 to i64, !llfi_index !564
  %280 = sext i32 %278 to i64, !llfi_index !564
  %281 = getelementptr inbounds float* %275, i64 %279, !llfi_index !565
  %282 = getelementptr inbounds float* %276, i64 %280, !llfi_index !565
  call void bitcast (void (i64, i64)* @global_add to void (float*, float*)*)(float* %281, float* %282)
  store float* %281, float** @volatility, align 8, !llfi_index !566
  %283 = load float** @volatility, align 8, !llfi_index !567
  %284 = load float** @volatility, align 8, !llfi_index !567
  %285 = load i32* @numOptions, align 4, !llfi_index !568
  %286 = load i32* @numOptions, align 4, !llfi_index !568
  %287 = sext i32 %285 to i64, !llfi_index !569
  %288 = sext i32 %286 to i64, !llfi_index !569
  %289 = getelementptr inbounds float* %283, i64 %287, !llfi_index !570
  %290 = getelementptr inbounds float* %284, i64 %288, !llfi_index !570
  call void bitcast (void (i64, i64)* @global_add to void (float*, float*)*)(float* %289, float* %290)
  store float* %289, float** @otime, align 8, !llfi_index !571
  %291 = load i32* @numOptions, align 4, !llfi_index !572
  %292 = load i32* @numOptions, align 4, !llfi_index !572
  %293 = sext i32 %291 to i64, !llfi_index !573
  %294 = sext i32 %292 to i64, !llfi_index !573
  %295 = mul i64 %293, 4, !llfi_index !574
  %296 = mul i64 %294, 4, !llfi_index !574
  %297 = add i64 %295, 256, !llfi_index !575
  %298 = add i64 %296, 256, !llfi_index !575
  call void @global_add(i64 %297, i64 %298)
  %299 = call noalias i8* @malloc(i64 %297) #5, !llfi_index !576
  %300 = bitcast i8* %299 to i32*, !llfi_index !577
  %301 = bitcast i8* %299 to i32*, !llfi_index !577
  call void bitcast (void (i64, i64)* @global_add to void (i32*, i32*)*)(i32* %300, i32* %301)
  store i32* %300, i32** %buffer2, align 8, !llfi_index !578
  %302 = load i32** %buffer2, align 8, !llfi_index !579
  %303 = load i32** %buffer2, align 8, !llfi_index !579
  %304 = ptrtoint i32* %302 to i64, !llfi_index !580
  %305 = ptrtoint i32* %303 to i64, !llfi_index !580
  %306 = add i64 %304, 256, !llfi_index !581
  %307 = add i64 %305, 256, !llfi_index !581
  %308 = and i64 %306, -64, !llfi_index !582
  %309 = and i64 %307, -64, !llfi_index !582
  %310 = inttoptr i64 %308 to i32*, !llfi_index !583
  %311 = inttoptr i64 %309 to i32*, !llfi_index !583
  call void bitcast (void (i64, i64)* @global_add to void (i32*, i32*)*)(i32* %310, i32* %311)
  store i32* %310, i32** @otype, align 8, !llfi_index !584
  store i32 0, i32* %i, align 4, !llfi_index !585
  br label %312, !llfi_index !586

; <label>:312                                     ; preds = %445, %231
  %313 = load i32* %i, align 4, !llfi_index !587
  %314 = load i32* %i, align 4, !llfi_index !587
  %315 = load i32* @numOptions, align 4, !llfi_index !588
  %316 = load i32* @numOptions, align 4, !llfi_index !588
  %317 = icmp slt i32 %313, %315, !llfi_index !589
  %318 = icmp slt i32 %314, %316, !llfi_index !589
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %317, i1 %318)
  br i1 %317, label %319, label %450, !llfi_index !590

; <label>:319                                     ; preds = %312
  %320 = load i32* %i, align 4, !llfi_index !591
  %321 = load i32* %i, align 4, !llfi_index !591
  %322 = sext i32 %320 to i64, !llfi_index !592
  %323 = sext i32 %321 to i64, !llfi_index !592
  %324 = load %struct.OptionData_** @data, align 8, !llfi_index !593
  %325 = load %struct.OptionData_** @data, align 8, !llfi_index !593
  %326 = getelementptr inbounds %struct.OptionData_* %324, i64 %322, !llfi_index !594
  %327 = getelementptr inbounds %struct.OptionData_* %325, i64 %323, !llfi_index !594
  %328 = getelementptr inbounds %struct.OptionData_* %326, i32 0, i32 6, !llfi_index !595
  %329 = getelementptr inbounds %struct.OptionData_* %327, i32 0, i32 6, !llfi_index !595
  %330 = load i8* %328, align 1, !llfi_index !596
  %331 = load i8* %329, align 1, !llfi_index !596
  %332 = sext i8 %330 to i32, !llfi_index !597
  %333 = sext i8 %331 to i32, !llfi_index !597
  %334 = icmp eq i32 %332, 80, !llfi_index !598
  %335 = icmp eq i32 %333, 80, !llfi_index !598
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %334, i1 %335)
  %336 = select i1 %334, i32 1, i32 0, !llfi_index !599
  %337 = load i32* %i, align 4, !llfi_index !600
  %338 = load i32* %i, align 4, !llfi_index !600
  %339 = sext i32 %337 to i64, !llfi_index !601
  %340 = sext i32 %338 to i64, !llfi_index !601
  %341 = load i32** @otype, align 8, !llfi_index !602
  %342 = load i32** @otype, align 8, !llfi_index !602
  %343 = getelementptr inbounds i32* %341, i64 %339, !llfi_index !603
  %344 = getelementptr inbounds i32* %342, i64 %340, !llfi_index !603
  call void bitcast (void (i64, i64)* @global_add to void (i32*, i32*)*)(i32* %343, i32* %344)
  store i32 %336, i32* %343, align 4, !llfi_index !604
  %345 = load i32* %i, align 4, !llfi_index !605
  %346 = load i32* %i, align 4, !llfi_index !605
  %347 = sext i32 %345 to i64, !llfi_index !606
  %348 = sext i32 %346 to i64, !llfi_index !606
  %349 = load %struct.OptionData_** @data, align 8, !llfi_index !607
  %350 = load %struct.OptionData_** @data, align 8, !llfi_index !607
  %351 = getelementptr inbounds %struct.OptionData_* %349, i64 %347, !llfi_index !608
  %352 = getelementptr inbounds %struct.OptionData_* %350, i64 %348, !llfi_index !608
  %353 = getelementptr inbounds %struct.OptionData_* %351, i32 0, i32 0, !llfi_index !609
  %354 = getelementptr inbounds %struct.OptionData_* %352, i32 0, i32 0, !llfi_index !609
  %355 = load float* %353, align 4, !llfi_index !610
  %356 = load float* %354, align 4, !llfi_index !610
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (float, float)*)(float %355, float %356)
  %357 = load i32* %i, align 4, !llfi_index !611
  %358 = load i32* %i, align 4, !llfi_index !611
  %359 = sext i32 %357 to i64, !llfi_index !612
  %360 = sext i32 %358 to i64, !llfi_index !612
  %361 = load float** @sptprice, align 8, !llfi_index !613
  %362 = load float** @sptprice, align 8, !llfi_index !613
  %363 = getelementptr inbounds float* %361, i64 %359, !llfi_index !614
  %364 = getelementptr inbounds float* %362, i64 %360, !llfi_index !614
  call void bitcast (void (i64, i64)* @global_add to void (float*, float*)*)(float* %363, float* %364)
  store float %355, float* %363, align 4, !llfi_index !615
  %365 = load i32* %i, align 4, !llfi_index !616
  %366 = load i32* %i, align 4, !llfi_index !616
  %367 = sext i32 %365 to i64, !llfi_index !617
  %368 = sext i32 %366 to i64, !llfi_index !617
  %369 = load %struct.OptionData_** @data, align 8, !llfi_index !618
  %370 = load %struct.OptionData_** @data, align 8, !llfi_index !618
  %371 = getelementptr inbounds %struct.OptionData_* %369, i64 %367, !llfi_index !619
  %372 = getelementptr inbounds %struct.OptionData_* %370, i64 %368, !llfi_index !619
  %373 = getelementptr inbounds %struct.OptionData_* %371, i32 0, i32 1, !llfi_index !620
  %374 = getelementptr inbounds %struct.OptionData_* %372, i32 0, i32 1, !llfi_index !620
  %375 = load float* %373, align 4, !llfi_index !621
  %376 = load float* %374, align 4, !llfi_index !621
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (float, float)*)(float %375, float %376)
  %377 = load i32* %i, align 4, !llfi_index !622
  %378 = load i32* %i, align 4, !llfi_index !622
  %379 = sext i32 %377 to i64, !llfi_index !623
  %380 = sext i32 %378 to i64, !llfi_index !623
  %381 = load float** @strike, align 8, !llfi_index !624
  %382 = load float** @strike, align 8, !llfi_index !624
  %383 = getelementptr inbounds float* %381, i64 %379, !llfi_index !625
  %384 = getelementptr inbounds float* %382, i64 %380, !llfi_index !625
  call void bitcast (void (i64, i64)* @global_add to void (float*, float*)*)(float* %383, float* %384)
  store float %375, float* %383, align 4, !llfi_index !626
  %385 = load i32* %i, align 4, !llfi_index !627
  %386 = load i32* %i, align 4, !llfi_index !627
  %387 = sext i32 %385 to i64, !llfi_index !628
  %388 = sext i32 %386 to i64, !llfi_index !628
  %389 = load %struct.OptionData_** @data, align 8, !llfi_index !629
  %390 = load %struct.OptionData_** @data, align 8, !llfi_index !629
  %391 = getelementptr inbounds %struct.OptionData_* %389, i64 %387, !llfi_index !630
  %392 = getelementptr inbounds %struct.OptionData_* %390, i64 %388, !llfi_index !630
  %393 = getelementptr inbounds %struct.OptionData_* %391, i32 0, i32 2, !llfi_index !631
  %394 = getelementptr inbounds %struct.OptionData_* %392, i32 0, i32 2, !llfi_index !631
  %395 = load float* %393, align 4, !llfi_index !632
  %396 = load float* %394, align 4, !llfi_index !632
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (float, float)*)(float %395, float %396)
  %397 = load i32* %i, align 4, !llfi_index !633
  %398 = load i32* %i, align 4, !llfi_index !633
  %399 = sext i32 %397 to i64, !llfi_index !634
  %400 = sext i32 %398 to i64, !llfi_index !634
  %401 = load float** @rate, align 8, !llfi_index !635
  %402 = load float** @rate, align 8, !llfi_index !635
  %403 = getelementptr inbounds float* %401, i64 %399, !llfi_index !636
  %404 = getelementptr inbounds float* %402, i64 %400, !llfi_index !636
  call void bitcast (void (i64, i64)* @global_add to void (float*, float*)*)(float* %403, float* %404)
  store float %395, float* %403, align 4, !llfi_index !637
  %405 = load i32* %i, align 4, !llfi_index !638
  %406 = load i32* %i, align 4, !llfi_index !638
  %407 = sext i32 %405 to i64, !llfi_index !639
  %408 = sext i32 %406 to i64, !llfi_index !639
  %409 = load %struct.OptionData_** @data, align 8, !llfi_index !640
  %410 = load %struct.OptionData_** @data, align 8, !llfi_index !640
  %411 = getelementptr inbounds %struct.OptionData_* %409, i64 %407, !llfi_index !641
  %412 = getelementptr inbounds %struct.OptionData_* %410, i64 %408, !llfi_index !641
  %413 = getelementptr inbounds %struct.OptionData_* %411, i32 0, i32 4, !llfi_index !642
  %414 = getelementptr inbounds %struct.OptionData_* %412, i32 0, i32 4, !llfi_index !642
  %415 = load float* %413, align 4, !llfi_index !643
  %416 = load float* %414, align 4, !llfi_index !643
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (float, float)*)(float %415, float %416)
  %417 = load i32* %i, align 4, !llfi_index !644
  %418 = load i32* %i, align 4, !llfi_index !644
  %419 = sext i32 %417 to i64, !llfi_index !645
  %420 = sext i32 %418 to i64, !llfi_index !645
  %421 = load float** @volatility, align 8, !llfi_index !646
  %422 = load float** @volatility, align 8, !llfi_index !646
  %423 = getelementptr inbounds float* %421, i64 %419, !llfi_index !647
  %424 = getelementptr inbounds float* %422, i64 %420, !llfi_index !647
  call void bitcast (void (i64, i64)* @global_add to void (float*, float*)*)(float* %423, float* %424)
  store float %415, float* %423, align 4, !llfi_index !648
  %425 = load i32* %i, align 4, !llfi_index !649
  %426 = load i32* %i, align 4, !llfi_index !649
  %427 = sext i32 %425 to i64, !llfi_index !650
  %428 = sext i32 %426 to i64, !llfi_index !650
  %429 = load %struct.OptionData_** @data, align 8, !llfi_index !651
  %430 = load %struct.OptionData_** @data, align 8, !llfi_index !651
  %431 = getelementptr inbounds %struct.OptionData_* %429, i64 %427, !llfi_index !652
  %432 = getelementptr inbounds %struct.OptionData_* %430, i64 %428, !llfi_index !652
  %433 = getelementptr inbounds %struct.OptionData_* %431, i32 0, i32 5, !llfi_index !653
  %434 = getelementptr inbounds %struct.OptionData_* %432, i32 0, i32 5, !llfi_index !653
  %435 = load float* %433, align 4, !llfi_index !654
  %436 = load float* %434, align 4, !llfi_index !654
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (float, float)*)(float %435, float %436)
  %437 = load i32* %i, align 4, !llfi_index !655
  %438 = load i32* %i, align 4, !llfi_index !655
  %439 = sext i32 %437 to i64, !llfi_index !656
  %440 = sext i32 %438 to i64, !llfi_index !656
  %441 = load float** @otime, align 8, !llfi_index !657
  %442 = load float** @otime, align 8, !llfi_index !657
  %443 = getelementptr inbounds float* %441, i64 %439, !llfi_index !658
  %444 = getelementptr inbounds float* %442, i64 %440, !llfi_index !658
  call void bitcast (void (i64, i64)* @global_add to void (float*, float*)*)(float* %443, float* %444)
  store float %435, float* %443, align 4, !llfi_index !659
  br label %445, !llfi_index !660

; <label>:445                                     ; preds = %319
  %446 = load i32* %i, align 4, !llfi_index !661
  %447 = load i32* %i, align 4, !llfi_index !661
  %448 = add nsw i32 %446, 1, !llfi_index !662
  %449 = add nsw i32 %447, 1, !llfi_index !662
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %448, i32 %449)
  store i32 %448, i32* %i, align 4, !llfi_index !663
  br label %312, !llfi_index !664

; <label>:450                                     ; preds = %312
  %451 = load i32* @numOptions, align 4, !llfi_index !665
  %452 = load i32* @numOptions, align 4, !llfi_index !665
  %453 = sext i32 %451 to i64, !llfi_index !666
  %454 = sext i32 %452 to i64, !llfi_index !666
  %455 = mul i64 %453, 40, !llfi_index !667
  %456 = mul i64 %454, 40, !llfi_index !667
  call void @global_add(i64 %455, i64 %456)
  %457 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([18 x i8]* @.str12, i32 0, i32 0), i64 %455), !llfi_index !668
  store i32 0, i32* %tid, align 4, !llfi_index !669
  %458 = bitcast i32* %tid to i8*, !llfi_index !670
  %459 = bitcast i32* %tid to i8*, !llfi_index !670
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %458, i8* %459)
  %460 = call i32 @bs_thread(i8* %458), !llfi_index !671
  %461 = load i8** %outputFile, align 8, !llfi_index !672
  %462 = load i8** %outputFile, align 8, !llfi_index !672
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %461, i8* %462)
  %463 = call %struct._IO_FILE* @fopen(i8* %461, i8* getelementptr inbounds ([2 x i8]* @.str13, i32 0, i32 0)), !llfi_index !673
  store %struct._IO_FILE* %463, %struct._IO_FILE** %file, align 8, !llfi_index !674
  %464 = load %struct._IO_FILE** %file, align 8, !llfi_index !675
  %465 = load %struct._IO_FILE** %file, align 8, !llfi_index !675
  %466 = icmp eq %struct._IO_FILE* %464, null, !llfi_index !676
  %467 = icmp eq %struct._IO_FILE* %465, null, !llfi_index !676
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %466, i1 %467)
  br i1 %466, label %468, label %472, !llfi_index !677

; <label>:468                                     ; preds = %450
  %469 = load i8** %outputFile, align 8, !llfi_index !678
  %470 = load i8** %outputFile, align 8, !llfi_index !678
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %469, i8* %470)
  %471 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([34 x i8]* @.str3, i32 0, i32 0), i8* %469), !llfi_index !679
  call void @global_check()
  call void @exit(i32 1) #6, !llfi_index !680
  unreachable, !llfi_index !681

; <label>:472                                     ; preds = %450
  %473 = load %struct._IO_FILE** %file, align 8, !llfi_index !682
  %474 = load %struct._IO_FILE** %file, align 8, !llfi_index !682
  call void bitcast (void (i64, i64)* @global_add to void (%struct._IO_FILE*, %struct._IO_FILE*)*)(%struct._IO_FILE* %473, %struct._IO_FILE* %474)
  %475 = load i32* @numOptions, align 4, !llfi_index !683
  %476 = load i32* @numOptions, align 4, !llfi_index !683
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %475, i32 %476)
  %477 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %473, i8* getelementptr inbounds ([4 x i8]* @.str14, i32 0, i32 0), i32 %475), !llfi_index !684
  store i32 %477, i32* %rv, align 4, !llfi_index !685
  %478 = load i32* %rv, align 4, !llfi_index !686
  %479 = load i32* %rv, align 4, !llfi_index !686
  %480 = icmp slt i32 %478, 0, !llfi_index !687
  %481 = icmp slt i32 %479, 0, !llfi_index !687
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %480, i1 %481)
  br i1 %480, label %482, label %489, !llfi_index !688

; <label>:482                                     ; preds = %472
  %483 = load i8** %outputFile, align 8, !llfi_index !689
  %484 = load i8** %outputFile, align 8, !llfi_index !689
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %483, i8* %484)
  %485 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str15, i32 0, i32 0), i8* %483), !llfi_index !690
  %486 = load %struct._IO_FILE** %file, align 8, !llfi_index !691
  %487 = load %struct._IO_FILE** %file, align 8, !llfi_index !691
  call void bitcast (void (i64, i64)* @global_add to void (%struct._IO_FILE*, %struct._IO_FILE*)*)(%struct._IO_FILE* %486, %struct._IO_FILE* %487)
  %488 = call i32 @fclose(%struct._IO_FILE* %486), !llfi_index !692
  call void @global_check()
  call void @exit(i32 1) #6, !llfi_index !693
  unreachable, !llfi_index !694

; <label>:489                                     ; preds = %472
  store i32 0, i32* %i, align 4, !llfi_index !695
  br label %490, !llfi_index !696

; <label>:490                                     ; preds = %525, %489
  %491 = load i32* %i, align 4, !llfi_index !697
  %492 = load i32* %i, align 4, !llfi_index !697
  %493 = load i32* @numOptions, align 4, !llfi_index !698
  %494 = load i32* @numOptions, align 4, !llfi_index !698
  %495 = icmp slt i32 %491, %493, !llfi_index !699
  %496 = icmp slt i32 %492, %494, !llfi_index !699
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %495, i1 %496)
  br i1 %495, label %497, label %530, !llfi_index !700

; <label>:497                                     ; preds = %490
  %498 = load %struct._IO_FILE** %file, align 8, !llfi_index !701
  %499 = load %struct._IO_FILE** %file, align 8, !llfi_index !701
  call void bitcast (void (i64, i64)* @global_add to void (%struct._IO_FILE*, %struct._IO_FILE*)*)(%struct._IO_FILE* %498, %struct._IO_FILE* %499)
  %500 = load i32* %i, align 4, !llfi_index !702
  %501 = load i32* %i, align 4, !llfi_index !702
  %502 = sext i32 %500 to i64, !llfi_index !703
  %503 = sext i32 %501 to i64, !llfi_index !703
  %504 = load float** @prices, align 8, !llfi_index !704
  %505 = load float** @prices, align 8, !llfi_index !704
  %506 = getelementptr inbounds float* %504, i64 %502, !llfi_index !705
  %507 = getelementptr inbounds float* %505, i64 %503, !llfi_index !705
  %508 = load float* %506, align 4, !llfi_index !706
  %509 = load float* %507, align 4, !llfi_index !706
  %510 = fpext float %508 to double, !llfi_index !707
  %511 = fpext float %509 to double, !llfi_index !707
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %510, double %511)
  %512 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %498, i8* getelementptr inbounds ([7 x i8]* @.str16, i32 0, i32 0), double %510), !llfi_index !708
  store i32 %512, i32* %rv, align 4, !llfi_index !709
  %513 = load i32* %rv, align 4, !llfi_index !710
  %514 = load i32* %rv, align 4, !llfi_index !710
  %515 = icmp slt i32 %513, 0, !llfi_index !711
  %516 = icmp slt i32 %514, 0, !llfi_index !711
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %515, i1 %516)
  br i1 %515, label %517, label %524, !llfi_index !712

; <label>:517                                     ; preds = %497
  %518 = load i8** %outputFile, align 8, !llfi_index !713
  %519 = load i8** %outputFile, align 8, !llfi_index !713
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %518, i8* %519)
  %520 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str15, i32 0, i32 0), i8* %518), !llfi_index !714
  %521 = load %struct._IO_FILE** %file, align 8, !llfi_index !715
  %522 = load %struct._IO_FILE** %file, align 8, !llfi_index !715
  call void bitcast (void (i64, i64)* @global_add to void (%struct._IO_FILE*, %struct._IO_FILE*)*)(%struct._IO_FILE* %521, %struct._IO_FILE* %522)
  %523 = call i32 @fclose(%struct._IO_FILE* %521), !llfi_index !716
  call void @global_check()
  call void @exit(i32 1) #6, !llfi_index !717
  unreachable, !llfi_index !718

; <label>:524                                     ; preds = %497
  br label %525, !llfi_index !719

; <label>:525                                     ; preds = %524
  %526 = load i32* %i, align 4, !llfi_index !720
  %527 = load i32* %i, align 4, !llfi_index !720
  %528 = add nsw i32 %526, 1, !llfi_index !721
  %529 = add nsw i32 %527, 1, !llfi_index !721
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %528, i32 %529)
  store i32 %528, i32* %i, align 4, !llfi_index !722
  br label %490, !llfi_index !723

; <label>:530                                     ; preds = %490
  %531 = load %struct._IO_FILE** %file, align 8, !llfi_index !724
  %532 = load %struct._IO_FILE** %file, align 8, !llfi_index !724
  call void bitcast (void (i64, i64)* @global_add to void (%struct._IO_FILE*, %struct._IO_FILE*)*)(%struct._IO_FILE* %531, %struct._IO_FILE* %532)
  %533 = call i32 @fclose(%struct._IO_FILE* %531), !llfi_index !725
  store i32 %533, i32* %rv, align 4, !llfi_index !726
  %534 = load i32* %rv, align 4, !llfi_index !727
  %535 = load i32* %rv, align 4, !llfi_index !727
  %536 = icmp ne i32 %534, 0, !llfi_index !728
  %537 = icmp ne i32 %535, 0, !llfi_index !728
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %536, i1 %537)
  br i1 %536, label %538, label %542, !llfi_index !729

; <label>:538                                     ; preds = %530
  %539 = load i8** %outputFile, align 8, !llfi_index !730
  %540 = load i8** %outputFile, align 8, !llfi_index !730
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %539, i8* %540)
  %541 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([35 x i8]* @.str9, i32 0, i32 0), i8* %539), !llfi_index !731
  call void @global_check()
  call void @exit(i32 1) #6, !llfi_index !732
  unreachable, !llfi_index !733

; <label>:542                                     ; preds = %530
  %543 = load %struct.OptionData_** @data, align 8, !llfi_index !734
  %544 = load %struct.OptionData_** @data, align 8, !llfi_index !734
  %545 = bitcast %struct.OptionData_* %543 to i8*, !llfi_index !735
  %546 = bitcast %struct.OptionData_* %544 to i8*, !llfi_index !735
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %545, i8* %546)
  call void @free(i8* %545) #5, !llfi_index !736
  %547 = load float** @prices, align 8, !llfi_index !737
  %548 = load float** @prices, align 8, !llfi_index !737
  %549 = bitcast float* %547 to i8*, !llfi_index !738
  %550 = bitcast float* %548 to i8*, !llfi_index !738
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %549, i8* %550)
  call void @free(i8* %549) #5, !llfi_index !739
  call void @global_check()
  ret i32 0, !llfi_index !740
}

declare i32 @printf(i8*, ...) #2

declare i32 @fflush(%struct._IO_FILE*) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

; Function Attrs: nounwind readonly
declare i32 @atoi(i8*) #4

declare %struct._IO_FILE* @fopen(i8*, i8*) #2

declare i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #2

declare i32 @fclose(%struct._IO_FILE*) #2

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: nounwind
declare void @free(i8*) #1

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
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
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
