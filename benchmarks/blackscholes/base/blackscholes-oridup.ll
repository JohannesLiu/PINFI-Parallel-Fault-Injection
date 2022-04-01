; ModuleID = 'link-unreadable.ll'
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
@.str17 = private unnamed_addr constant [59 x i8] c"**********************SDC DETECTED!**********************\0A\00", align 1

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
  %check_cmp = icmp eq i1 %6, %7
  br i1 %check_cmp, label %8, label %checkBb

checkBb:                                          ; preds = %0
  call void @check_flag()
  br label %8

; <label>:8                                       ; preds = %checkBb, %0
  br i1 %6, label %9, label %15, !llfi_index !20

; <label>:9                                       ; preds = %8
  %10 = load float* %1, align 4, !llfi_index !21
  %11 = load float* %1, align 4, !llfi_index !21
  %12 = fsub float -0.000000e+00, %10, !llfi_index !22
  %13 = fsub float -0.000000e+00, %11, !llfi_index !22
  %check_cmp1 = fcmp ueq float %12, %13
  br i1 %check_cmp1, label %14, label %checkBb2

checkBb2:                                         ; preds = %9
  call void @check_flag()
  br label %14

; <label>:14                                      ; preds = %checkBb2, %9
  store float %12, float* %1, align 4, !llfi_index !23
  store i32 1, i32* %sign, align 4, !llfi_index !24
  br label %16, !llfi_index !25

; <label>:15                                      ; preds = %8
  store i32 0, i32* %sign, align 4, !llfi_index !26
  br label %16, !llfi_index !27

; <label>:16                                      ; preds = %15, %14
  %17 = load float* %1, align 4, !llfi_index !28
  %18 = load float* %1, align 4, !llfi_index !28
  %check_cmp3 = fcmp ueq float %17, %18
  br i1 %check_cmp3, label %19, label %checkBb4

checkBb4:                                         ; preds = %16
  call void @check_flag()
  br label %19

; <label>:19                                      ; preds = %checkBb4, %16
  store float %17, float* %xInput, align 4, !llfi_index !29
  %20 = load float* %1, align 4, !llfi_index !30
  %21 = load float* %1, align 4, !llfi_index !30
  %22 = fmul float -5.000000e-01, %20, !llfi_index !31
  %23 = fmul float -5.000000e-01, %21, !llfi_index !31
  %24 = load float* %1, align 4, !llfi_index !32
  %25 = load float* %1, align 4, !llfi_index !32
  %26 = fmul float %22, %24, !llfi_index !33
  %27 = fmul float %23, %25, !llfi_index !33
  %28 = fpext float %26 to double, !llfi_index !34
  %29 = fpext float %27 to double, !llfi_index !34
  %check_cmp5 = fcmp ueq double %28, %29
  br i1 %check_cmp5, label %30, label %checkBb6

checkBb6:                                         ; preds = %19
  call void @check_flag()
  br label %30

; <label>:30                                      ; preds = %checkBb6, %19
  %31 = call double @exp(double %28) #5, !llfi_index !35
  %32 = fptrunc double %31 to float, !llfi_index !36
  %33 = fptrunc double %31 to float, !llfi_index !36
  %check_cmp7 = fcmp ueq float %32, %33
  br i1 %check_cmp7, label %34, label %checkBb8

checkBb8:                                         ; preds = %30
  call void @check_flag()
  br label %34

; <label>:34                                      ; preds = %checkBb8, %30
  store float %32, float* %expValues, align 4, !llfi_index !37
  %35 = load float* %expValues, align 4, !llfi_index !38
  %36 = load float* %expValues, align 4, !llfi_index !38
  %check_cmp9 = fcmp ueq float %35, %36
  br i1 %check_cmp9, label %37, label %checkBb10

checkBb10:                                        ; preds = %34
  call void @check_flag()
  br label %37

; <label>:37                                      ; preds = %checkBb10, %34
  store float %35, float* %xNPrimeofX, align 4, !llfi_index !39
  %38 = load float* %xNPrimeofX, align 4, !llfi_index !40
  %39 = load float* %xNPrimeofX, align 4, !llfi_index !40
  %40 = fpext float %38 to double, !llfi_index !41
  %41 = fpext float %39 to double, !llfi_index !41
  %42 = fmul double %40, 0x3FD9884533D43651, !llfi_index !42
  %43 = fmul double %41, 0x3FD9884533D43651, !llfi_index !42
  %44 = fptrunc double %42 to float, !llfi_index !43
  %45 = fptrunc double %43 to float, !llfi_index !43
  %check_cmp11 = fcmp ueq float %44, %45
  br i1 %check_cmp11, label %46, label %checkBb12

checkBb12:                                        ; preds = %37
  call void @check_flag()
  br label %46

; <label>:46                                      ; preds = %checkBb12, %37
  store float %44, float* %xNPrimeofX, align 4, !llfi_index !44
  %47 = load float* %xInput, align 4, !llfi_index !45
  %48 = load float* %xInput, align 4, !llfi_index !45
  %49 = fpext float %47 to double, !llfi_index !46
  %50 = fpext float %48 to double, !llfi_index !46
  %51 = fmul double 2.316419e-01, %49, !llfi_index !47
  %52 = fmul double 2.316419e-01, %50, !llfi_index !47
  %53 = fptrunc double %51 to float, !llfi_index !48
  %54 = fptrunc double %52 to float, !llfi_index !48
  %check_cmp13 = fcmp ueq float %53, %54
  br i1 %check_cmp13, label %55, label %checkBb14

checkBb14:                                        ; preds = %46
  call void @check_flag()
  br label %55

; <label>:55                                      ; preds = %checkBb14, %46
  store float %53, float* %xK2, align 4, !llfi_index !49
  %56 = load float* %xK2, align 4, !llfi_index !50
  %57 = load float* %xK2, align 4, !llfi_index !50
  %58 = fpext float %56 to double, !llfi_index !51
  %59 = fpext float %57 to double, !llfi_index !51
  %60 = fadd double 1.000000e+00, %58, !llfi_index !52
  %61 = fadd double 1.000000e+00, %59, !llfi_index !52
  %62 = fptrunc double %60 to float, !llfi_index !53
  %63 = fptrunc double %61 to float, !llfi_index !53
  %check_cmp15 = fcmp ueq float %62, %63
  br i1 %check_cmp15, label %64, label %checkBb16

checkBb16:                                        ; preds = %55
  call void @check_flag()
  br label %64

; <label>:64                                      ; preds = %checkBb16, %55
  store float %62, float* %xK2, align 4, !llfi_index !54
  %65 = load float* %xK2, align 4, !llfi_index !55
  %66 = load float* %xK2, align 4, !llfi_index !55
  %67 = fpext float %65 to double, !llfi_index !56
  %68 = fpext float %66 to double, !llfi_index !56
  %69 = fdiv double 1.000000e+00, %67, !llfi_index !57
  %70 = fdiv double 1.000000e+00, %68, !llfi_index !57
  %71 = fptrunc double %69 to float, !llfi_index !58
  %72 = fptrunc double %70 to float, !llfi_index !58
  %check_cmp17 = fcmp ueq float %71, %72
  br i1 %check_cmp17, label %73, label %checkBb18

checkBb18:                                        ; preds = %64
  call void @check_flag()
  br label %73

; <label>:73                                      ; preds = %checkBb18, %64
  store float %71, float* %xK2, align 4, !llfi_index !59
  %74 = load float* %xK2, align 4, !llfi_index !60
  %75 = load float* %xK2, align 4, !llfi_index !60
  %76 = load float* %xK2, align 4, !llfi_index !61
  %77 = load float* %xK2, align 4, !llfi_index !61
  %78 = fmul float %74, %76, !llfi_index !62
  %79 = fmul float %75, %77, !llfi_index !62
  %check_cmp19 = fcmp ueq float %78, %79
  br i1 %check_cmp19, label %80, label %checkBb20

checkBb20:                                        ; preds = %73
  call void @check_flag()
  br label %80

; <label>:80                                      ; preds = %checkBb20, %73
  store float %78, float* %xK2_2, align 4, !llfi_index !63
  %81 = load float* %xK2_2, align 4, !llfi_index !64
  %82 = load float* %xK2_2, align 4, !llfi_index !64
  %83 = load float* %xK2, align 4, !llfi_index !65
  %84 = load float* %xK2, align 4, !llfi_index !65
  %85 = fmul float %81, %83, !llfi_index !66
  %86 = fmul float %82, %84, !llfi_index !66
  %check_cmp21 = fcmp ueq float %85, %86
  br i1 %check_cmp21, label %87, label %checkBb22

checkBb22:                                        ; preds = %80
  call void @check_flag()
  br label %87

; <label>:87                                      ; preds = %checkBb22, %80
  store float %85, float* %xK2_3, align 4, !llfi_index !67
  %88 = load float* %xK2_3, align 4, !llfi_index !68
  %89 = load float* %xK2_3, align 4, !llfi_index !68
  %90 = load float* %xK2, align 4, !llfi_index !69
  %91 = load float* %xK2, align 4, !llfi_index !69
  %92 = fmul float %88, %90, !llfi_index !70
  %93 = fmul float %89, %91, !llfi_index !70
  %check_cmp23 = fcmp ueq float %92, %93
  br i1 %check_cmp23, label %94, label %checkBb24

checkBb24:                                        ; preds = %87
  call void @check_flag()
  br label %94

; <label>:94                                      ; preds = %checkBb24, %87
  store float %92, float* %xK2_4, align 4, !llfi_index !71
  %95 = load float* %xK2_4, align 4, !llfi_index !72
  %96 = load float* %xK2_4, align 4, !llfi_index !72
  %97 = load float* %xK2, align 4, !llfi_index !73
  %98 = load float* %xK2, align 4, !llfi_index !73
  %99 = fmul float %95, %97, !llfi_index !74
  %100 = fmul float %96, %98, !llfi_index !74
  %check_cmp25 = fcmp ueq float %99, %100
  br i1 %check_cmp25, label %101, label %checkBb26

checkBb26:                                        ; preds = %94
  call void @check_flag()
  br label %101

; <label>:101                                     ; preds = %checkBb26, %94
  store float %99, float* %xK2_5, align 4, !llfi_index !75
  %102 = load float* %xK2, align 4, !llfi_index !76
  %103 = load float* %xK2, align 4, !llfi_index !76
  %104 = fpext float %102 to double, !llfi_index !77
  %105 = fpext float %103 to double, !llfi_index !77
  %106 = fmul double %104, 0x3FD470BF3A92F8EC, !llfi_index !78
  %107 = fmul double %105, 0x3FD470BF3A92F8EC, !llfi_index !78
  %108 = fptrunc double %106 to float, !llfi_index !79
  %109 = fptrunc double %107 to float, !llfi_index !79
  %check_cmp27 = fcmp ueq float %108, %109
  br i1 %check_cmp27, label %110, label %checkBb28

checkBb28:                                        ; preds = %101
  call void @check_flag()
  br label %110

; <label>:110                                     ; preds = %checkBb28, %101
  store float %108, float* %xLocal_1, align 4, !llfi_index !80
  %111 = load float* %xK2_2, align 4, !llfi_index !81
  %112 = load float* %xK2_2, align 4, !llfi_index !81
  %113 = fpext float %111 to double, !llfi_index !82
  %114 = fpext float %112 to double, !llfi_index !82
  %115 = fmul double %113, 0xBFD6D1F0E5A8325B, !llfi_index !83
  %116 = fmul double %114, 0xBFD6D1F0E5A8325B, !llfi_index !83
  %117 = fptrunc double %115 to float, !llfi_index !84
  %118 = fptrunc double %116 to float, !llfi_index !84
  %check_cmp29 = fcmp ueq float %117, %118
  br i1 %check_cmp29, label %119, label %checkBb30

checkBb30:                                        ; preds = %110
  call void @check_flag()
  br label %119

; <label>:119                                     ; preds = %checkBb30, %110
  store float %117, float* %xLocal_2, align 4, !llfi_index !85
  %120 = load float* %xK2_3, align 4, !llfi_index !86
  %121 = load float* %xK2_3, align 4, !llfi_index !86
  %122 = fpext float %120 to double, !llfi_index !87
  %123 = fpext float %121 to double, !llfi_index !87
  %124 = fmul double %122, 0x3FFC80EF025F5E68, !llfi_index !88
  %125 = fmul double %123, 0x3FFC80EF025F5E68, !llfi_index !88
  %126 = fptrunc double %124 to float, !llfi_index !89
  %127 = fptrunc double %125 to float, !llfi_index !89
  %check_cmp31 = fcmp ueq float %126, %127
  br i1 %check_cmp31, label %128, label %checkBb32

checkBb32:                                        ; preds = %119
  call void @check_flag()
  br label %128

; <label>:128                                     ; preds = %checkBb32, %119
  store float %126, float* %xLocal_3, align 4, !llfi_index !90
  %129 = load float* %xLocal_2, align 4, !llfi_index !91
  %130 = load float* %xLocal_2, align 4, !llfi_index !91
  %131 = load float* %xLocal_3, align 4, !llfi_index !92
  %132 = load float* %xLocal_3, align 4, !llfi_index !92
  %133 = fadd float %129, %131, !llfi_index !93
  %134 = fadd float %130, %132, !llfi_index !93
  %check_cmp33 = fcmp ueq float %133, %134
  br i1 %check_cmp33, label %135, label %checkBb34

checkBb34:                                        ; preds = %128
  call void @check_flag()
  br label %135

; <label>:135                                     ; preds = %checkBb34, %128
  store float %133, float* %xLocal_2, align 4, !llfi_index !94
  %136 = load float* %xK2_4, align 4, !llfi_index !95
  %137 = load float* %xK2_4, align 4, !llfi_index !95
  %138 = fpext float %136 to double, !llfi_index !96
  %139 = fpext float %137 to double, !llfi_index !96
  %140 = fmul double %138, 0xBFFD23DD4EF278D0, !llfi_index !97
  %141 = fmul double %139, 0xBFFD23DD4EF278D0, !llfi_index !97
  %142 = fptrunc double %140 to float, !llfi_index !98
  %143 = fptrunc double %141 to float, !llfi_index !98
  %check_cmp35 = fcmp ueq float %142, %143
  br i1 %check_cmp35, label %144, label %checkBb36

checkBb36:                                        ; preds = %135
  call void @check_flag()
  br label %144

; <label>:144                                     ; preds = %checkBb36, %135
  store float %142, float* %xLocal_3, align 4, !llfi_index !99
  %145 = load float* %xLocal_2, align 4, !llfi_index !100
  %146 = load float* %xLocal_2, align 4, !llfi_index !100
  %147 = load float* %xLocal_3, align 4, !llfi_index !101
  %148 = load float* %xLocal_3, align 4, !llfi_index !101
  %149 = fadd float %145, %147, !llfi_index !102
  %150 = fadd float %146, %148, !llfi_index !102
  %check_cmp37 = fcmp ueq float %149, %150
  br i1 %check_cmp37, label %151, label %checkBb38

checkBb38:                                        ; preds = %144
  call void @check_flag()
  br label %151

; <label>:151                                     ; preds = %checkBb38, %144
  store float %149, float* %xLocal_2, align 4, !llfi_index !103
  %152 = load float* %xK2_5, align 4, !llfi_index !104
  %153 = load float* %xK2_5, align 4, !llfi_index !104
  %154 = fpext float %152 to double, !llfi_index !105
  %155 = fpext float %153 to double, !llfi_index !105
  %156 = fmul double %154, 0x3FF548CDD6F42943, !llfi_index !106
  %157 = fmul double %155, 0x3FF548CDD6F42943, !llfi_index !106
  %158 = fptrunc double %156 to float, !llfi_index !107
  %159 = fptrunc double %157 to float, !llfi_index !107
  %check_cmp39 = fcmp ueq float %158, %159
  br i1 %check_cmp39, label %160, label %checkBb40

checkBb40:                                        ; preds = %151
  call void @check_flag()
  br label %160

; <label>:160                                     ; preds = %checkBb40, %151
  store float %158, float* %xLocal_3, align 4, !llfi_index !108
  %161 = load float* %xLocal_2, align 4, !llfi_index !109
  %162 = load float* %xLocal_2, align 4, !llfi_index !109
  %163 = load float* %xLocal_3, align 4, !llfi_index !110
  %164 = load float* %xLocal_3, align 4, !llfi_index !110
  %165 = fadd float %161, %163, !llfi_index !111
  %166 = fadd float %162, %164, !llfi_index !111
  %check_cmp41 = fcmp ueq float %165, %166
  br i1 %check_cmp41, label %167, label %checkBb42

checkBb42:                                        ; preds = %160
  call void @check_flag()
  br label %167

; <label>:167                                     ; preds = %checkBb42, %160
  store float %165, float* %xLocal_2, align 4, !llfi_index !112
  %168 = load float* %xLocal_2, align 4, !llfi_index !113
  %169 = load float* %xLocal_2, align 4, !llfi_index !113
  %170 = load float* %xLocal_1, align 4, !llfi_index !114
  %171 = load float* %xLocal_1, align 4, !llfi_index !114
  %172 = fadd float %168, %170, !llfi_index !115
  %173 = fadd float %169, %171, !llfi_index !115
  %check_cmp43 = fcmp ueq float %172, %173
  br i1 %check_cmp43, label %174, label %checkBb44

checkBb44:                                        ; preds = %167
  call void @check_flag()
  br label %174

; <label>:174                                     ; preds = %checkBb44, %167
  store float %172, float* %xLocal_1, align 4, !llfi_index !116
  %175 = load float* %xLocal_1, align 4, !llfi_index !117
  %176 = load float* %xLocal_1, align 4, !llfi_index !117
  %177 = load float* %xNPrimeofX, align 4, !llfi_index !118
  %178 = load float* %xNPrimeofX, align 4, !llfi_index !118
  %179 = fmul float %175, %177, !llfi_index !119
  %180 = fmul float %176, %178, !llfi_index !119
  %check_cmp45 = fcmp ueq float %179, %180
  br i1 %check_cmp45, label %181, label %checkBb46

checkBb46:                                        ; preds = %174
  call void @check_flag()
  br label %181

; <label>:181                                     ; preds = %checkBb46, %174
  store float %179, float* %xLocal, align 4, !llfi_index !120
  %182 = load float* %xLocal, align 4, !llfi_index !121
  %183 = load float* %xLocal, align 4, !llfi_index !121
  %184 = fpext float %182 to double, !llfi_index !122
  %185 = fpext float %183 to double, !llfi_index !122
  %186 = fsub double 1.000000e+00, %184, !llfi_index !123
  %187 = fsub double 1.000000e+00, %185, !llfi_index !123
  %188 = fptrunc double %186 to float, !llfi_index !124
  %189 = fptrunc double %187 to float, !llfi_index !124
  %check_cmp47 = fcmp ueq float %188, %189
  br i1 %check_cmp47, label %190, label %checkBb48

checkBb48:                                        ; preds = %181
  call void @check_flag()
  br label %190

; <label>:190                                     ; preds = %checkBb48, %181
  store float %188, float* %xLocal, align 4, !llfi_index !125
  %191 = load float* %xLocal, align 4, !llfi_index !126
  %192 = load float* %xLocal, align 4, !llfi_index !126
  %check_cmp49 = fcmp ueq float %191, %192
  br i1 %check_cmp49, label %193, label %checkBb50

checkBb50:                                        ; preds = %190
  call void @check_flag()
  br label %193

; <label>:193                                     ; preds = %checkBb50, %190
  store float %191, float* %OutputX, align 4, !llfi_index !127
  %194 = load i32* %sign, align 4, !llfi_index !128
  %195 = load i32* %sign, align 4, !llfi_index !128
  %196 = icmp ne i32 %194, 0, !llfi_index !129
  %197 = icmp ne i32 %195, 0, !llfi_index !129
  %check_cmp51 = icmp eq i1 %196, %197
  br i1 %check_cmp51, label %198, label %checkBb52

checkBb52:                                        ; preds = %193
  call void @check_flag()
  br label %198

; <label>:198                                     ; preds = %checkBb52, %193
  br i1 %196, label %199, label %209, !llfi_index !130

; <label>:199                                     ; preds = %198
  %200 = load float* %OutputX, align 4, !llfi_index !131
  %201 = load float* %OutputX, align 4, !llfi_index !131
  %202 = fpext float %200 to double, !llfi_index !132
  %203 = fpext float %201 to double, !llfi_index !132
  %204 = fsub double 1.000000e+00, %202, !llfi_index !133
  %205 = fsub double 1.000000e+00, %203, !llfi_index !133
  %206 = fptrunc double %204 to float, !llfi_index !134
  %207 = fptrunc double %205 to float, !llfi_index !134
  %check_cmp53 = fcmp ueq float %206, %207
  br i1 %check_cmp53, label %208, label %checkBb54

checkBb54:                                        ; preds = %199
  call void @check_flag()
  br label %208

; <label>:208                                     ; preds = %checkBb54, %199
  store float %206, float* %OutputX, align 4, !llfi_index !135
  br label %209, !llfi_index !136

; <label>:209                                     ; preds = %208, %198
  %210 = load float* %OutputX, align 4, !llfi_index !137
  %211 = load float* %OutputX, align 4, !llfi_index !137
  %check_cmp55 = fcmp ueq float %210, %211
  br i1 %check_cmp55, label %212, label %checkBb56

checkBb56:                                        ; preds = %209
  call void @check_flag()
  br label %212

; <label>:212                                     ; preds = %checkBb56, %209
  ret float %210, !llfi_index !138
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
  %check_cmp = fcmp ueq float %8, %9
  br i1 %check_cmp, label %10, label %checkBb

checkBb:                                          ; preds = %0
  call void @check_flag()
  br label %10

; <label>:10                                      ; preds = %checkBb, %0
  store float %8, float* %xStockPrice, align 4, !llfi_index !174
  %11 = load float* %2, align 4, !llfi_index !175
  %12 = load float* %2, align 4, !llfi_index !175
  %check_cmp1 = fcmp ueq float %11, %12
  br i1 %check_cmp1, label %13, label %checkBb2

checkBb2:                                         ; preds = %10
  call void @check_flag()
  br label %13

; <label>:13                                      ; preds = %checkBb2, %10
  store float %11, float* %xStrikePrice, align 4, !llfi_index !176
  %14 = load float* %3, align 4, !llfi_index !177
  %15 = load float* %3, align 4, !llfi_index !177
  %check_cmp3 = fcmp ueq float %14, %15
  br i1 %check_cmp3, label %16, label %checkBb4

checkBb4:                                         ; preds = %13
  call void @check_flag()
  br label %16

; <label>:16                                      ; preds = %checkBb4, %13
  store float %14, float* %xRiskFreeRate, align 4, !llfi_index !178
  %17 = load float* %4, align 4, !llfi_index !179
  %18 = load float* %4, align 4, !llfi_index !179
  %check_cmp5 = fcmp ueq float %17, %18
  br i1 %check_cmp5, label %19, label %checkBb6

checkBb6:                                         ; preds = %16
  call void @check_flag()
  br label %19

; <label>:19                                      ; preds = %checkBb6, %16
  store float %17, float* %xVolatility, align 4, !llfi_index !180
  %20 = load float* %5, align 4, !llfi_index !181
  %21 = load float* %5, align 4, !llfi_index !181
  %check_cmp7 = fcmp ueq float %20, %21
  br i1 %check_cmp7, label %22, label %checkBb8

checkBb8:                                         ; preds = %19
  call void @check_flag()
  br label %22

; <label>:22                                      ; preds = %checkBb8, %19
  store float %20, float* %xTime, align 4, !llfi_index !182
  %23 = load float* %xTime, align 4, !llfi_index !183
  %24 = load float* %xTime, align 4, !llfi_index !183
  %25 = fpext float %23 to double, !llfi_index !184
  %26 = fpext float %24 to double, !llfi_index !184
  %check_cmp9 = fcmp ueq double %25, %26
  br i1 %check_cmp9, label %27, label %checkBb10

checkBb10:                                        ; preds = %22
  call void @check_flag()
  br label %27

; <label>:27                                      ; preds = %checkBb10, %22
  %28 = call double @sqrt(double %25) #5, !llfi_index !185
  %29 = fptrunc double %28 to float, !llfi_index !186
  %30 = fptrunc double %28 to float, !llfi_index !186
  %check_cmp11 = fcmp ueq float %29, %30
  br i1 %check_cmp11, label %31, label %checkBb12

checkBb12:                                        ; preds = %27
  call void @check_flag()
  br label %31

; <label>:31                                      ; preds = %checkBb12, %27
  store float %29, float* %xSqrtTime, align 4, !llfi_index !187
  %32 = load float* %1, align 4, !llfi_index !188
  %33 = load float* %1, align 4, !llfi_index !188
  %34 = load float* %2, align 4, !llfi_index !189
  %35 = load float* %2, align 4, !llfi_index !189
  %36 = fdiv float %32, %34, !llfi_index !190
  %37 = fdiv float %33, %35, !llfi_index !190
  %38 = fpext float %36 to double, !llfi_index !191
  %39 = fpext float %37 to double, !llfi_index !191
  %check_cmp13 = fcmp ueq double %38, %39
  br i1 %check_cmp13, label %40, label %checkBb14

checkBb14:                                        ; preds = %31
  call void @check_flag()
  br label %40

; <label>:40                                      ; preds = %checkBb14, %31
  %41 = call double @log(double %38) #5, !llfi_index !192
  %42 = fptrunc double %41 to float, !llfi_index !193
  %43 = fptrunc double %41 to float, !llfi_index !193
  %check_cmp15 = fcmp ueq float %42, %43
  br i1 %check_cmp15, label %44, label %checkBb16

checkBb16:                                        ; preds = %40
  call void @check_flag()
  br label %44

; <label>:44                                      ; preds = %checkBb16, %40
  store float %42, float* %logValues, align 4, !llfi_index !194
  %45 = load float* %logValues, align 4, !llfi_index !195
  %46 = load float* %logValues, align 4, !llfi_index !195
  %check_cmp17 = fcmp ueq float %45, %46
  br i1 %check_cmp17, label %47, label %checkBb18

checkBb18:                                        ; preds = %44
  call void @check_flag()
  br label %47

; <label>:47                                      ; preds = %checkBb18, %44
  store float %45, float* %xLogTerm, align 4, !llfi_index !196
  %48 = load float* %xVolatility, align 4, !llfi_index !197
  %49 = load float* %xVolatility, align 4, !llfi_index !197
  %50 = load float* %xVolatility, align 4, !llfi_index !198
  %51 = load float* %xVolatility, align 4, !llfi_index !198
  %52 = fmul float %48, %50, !llfi_index !199
  %53 = fmul float %49, %51, !llfi_index !199
  %check_cmp19 = fcmp ueq float %52, %53
  br i1 %check_cmp19, label %54, label %checkBb20

checkBb20:                                        ; preds = %47
  call void @check_flag()
  br label %54

; <label>:54                                      ; preds = %checkBb20, %47
  store float %52, float* %xPowerTerm, align 4, !llfi_index !200
  %55 = load float* %xPowerTerm, align 4, !llfi_index !201
  %56 = load float* %xPowerTerm, align 4, !llfi_index !201
  %57 = fpext float %55 to double, !llfi_index !202
  %58 = fpext float %56 to double, !llfi_index !202
  %59 = fmul double %57, 5.000000e-01, !llfi_index !203
  %60 = fmul double %58, 5.000000e-01, !llfi_index !203
  %61 = fptrunc double %59 to float, !llfi_index !204
  %62 = fptrunc double %60 to float, !llfi_index !204
  %check_cmp21 = fcmp ueq float %61, %62
  br i1 %check_cmp21, label %63, label %checkBb22

checkBb22:                                        ; preds = %54
  call void @check_flag()
  br label %63

; <label>:63                                      ; preds = %checkBb22, %54
  store float %61, float* %xPowerTerm, align 4, !llfi_index !205
  %64 = load float* %xRiskFreeRate, align 4, !llfi_index !206
  %65 = load float* %xRiskFreeRate, align 4, !llfi_index !206
  %66 = load float* %xPowerTerm, align 4, !llfi_index !207
  %67 = load float* %xPowerTerm, align 4, !llfi_index !207
  %68 = fadd float %64, %66, !llfi_index !208
  %69 = fadd float %65, %67, !llfi_index !208
  %check_cmp23 = fcmp ueq float %68, %69
  br i1 %check_cmp23, label %70, label %checkBb24

checkBb24:                                        ; preds = %63
  call void @check_flag()
  br label %70

; <label>:70                                      ; preds = %checkBb24, %63
  store float %68, float* %xD1, align 4, !llfi_index !209
  %71 = load float* %xD1, align 4, !llfi_index !210
  %72 = load float* %xD1, align 4, !llfi_index !210
  %73 = load float* %xTime, align 4, !llfi_index !211
  %74 = load float* %xTime, align 4, !llfi_index !211
  %75 = fmul float %71, %73, !llfi_index !212
  %76 = fmul float %72, %74, !llfi_index !212
  %check_cmp25 = fcmp ueq float %75, %76
  br i1 %check_cmp25, label %77, label %checkBb26

checkBb26:                                        ; preds = %70
  call void @check_flag()
  br label %77

; <label>:77                                      ; preds = %checkBb26, %70
  store float %75, float* %xD1, align 4, !llfi_index !213
  %78 = load float* %xD1, align 4, !llfi_index !214
  %79 = load float* %xD1, align 4, !llfi_index !214
  %80 = load float* %xLogTerm, align 4, !llfi_index !215
  %81 = load float* %xLogTerm, align 4, !llfi_index !215
  %82 = fadd float %78, %80, !llfi_index !216
  %83 = fadd float %79, %81, !llfi_index !216
  %check_cmp27 = fcmp ueq float %82, %83
  br i1 %check_cmp27, label %84, label %checkBb28

checkBb28:                                        ; preds = %77
  call void @check_flag()
  br label %84

; <label>:84                                      ; preds = %checkBb28, %77
  store float %82, float* %xD1, align 4, !llfi_index !217
  %85 = load float* %xVolatility, align 4, !llfi_index !218
  %86 = load float* %xVolatility, align 4, !llfi_index !218
  %87 = load float* %xSqrtTime, align 4, !llfi_index !219
  %88 = load float* %xSqrtTime, align 4, !llfi_index !219
  %89 = fmul float %85, %87, !llfi_index !220
  %90 = fmul float %86, %88, !llfi_index !220
  %check_cmp29 = fcmp ueq float %89, %90
  br i1 %check_cmp29, label %91, label %checkBb30

checkBb30:                                        ; preds = %84
  call void @check_flag()
  br label %91

; <label>:91                                      ; preds = %checkBb30, %84
  store float %89, float* %xDen, align 4, !llfi_index !221
  %92 = load float* %xD1, align 4, !llfi_index !222
  %93 = load float* %xD1, align 4, !llfi_index !222
  %94 = load float* %xDen, align 4, !llfi_index !223
  %95 = load float* %xDen, align 4, !llfi_index !223
  %96 = fdiv float %92, %94, !llfi_index !224
  %97 = fdiv float %93, %95, !llfi_index !224
  %check_cmp31 = fcmp ueq float %96, %97
  br i1 %check_cmp31, label %98, label %checkBb32

checkBb32:                                        ; preds = %91
  call void @check_flag()
  br label %98

; <label>:98                                      ; preds = %checkBb32, %91
  store float %96, float* %xD1, align 4, !llfi_index !225
  %99 = load float* %xD1, align 4, !llfi_index !226
  %100 = load float* %xD1, align 4, !llfi_index !226
  %101 = load float* %xDen, align 4, !llfi_index !227
  %102 = load float* %xDen, align 4, !llfi_index !227
  %103 = fsub float %99, %101, !llfi_index !228
  %104 = fsub float %100, %102, !llfi_index !228
  %check_cmp33 = fcmp ueq float %103, %104
  br i1 %check_cmp33, label %105, label %checkBb34

checkBb34:                                        ; preds = %98
  call void @check_flag()
  br label %105

; <label>:105                                     ; preds = %checkBb34, %98
  store float %103, float* %xD2, align 4, !llfi_index !229
  %106 = load float* %xD1, align 4, !llfi_index !230
  %107 = load float* %xD1, align 4, !llfi_index !230
  %check_cmp35 = fcmp ueq float %106, %107
  br i1 %check_cmp35, label %108, label %checkBb36

checkBb36:                                        ; preds = %105
  call void @check_flag()
  br label %108

; <label>:108                                     ; preds = %checkBb36, %105
  store float %106, float* %d1, align 4, !llfi_index !231
  %109 = load float* %xD2, align 4, !llfi_index !232
  %110 = load float* %xD2, align 4, !llfi_index !232
  %check_cmp37 = fcmp ueq float %109, %110
  br i1 %check_cmp37, label %111, label %checkBb38

checkBb38:                                        ; preds = %108
  call void @check_flag()
  br label %111

; <label>:111                                     ; preds = %checkBb38, %108
  store float %109, float* %d2, align 4, !llfi_index !233
  %112 = load float* %d1, align 4, !llfi_index !234
  %113 = load float* %d1, align 4, !llfi_index !234
  %check_cmp39 = fcmp ueq float %112, %113
  br i1 %check_cmp39, label %114, label %checkBb40

checkBb40:                                        ; preds = %111
  call void @check_flag()
  br label %114

; <label>:114                                     ; preds = %checkBb40, %111
  %115 = call float @CNDF(float %112), !llfi_index !235
  store float %115, float* %NofXd1, align 4, !llfi_index !236
  %116 = load float* %d2, align 4, !llfi_index !237
  %117 = load float* %d2, align 4, !llfi_index !237
  %check_cmp41 = fcmp ueq float %116, %117
  br i1 %check_cmp41, label %118, label %checkBb42

checkBb42:                                        ; preds = %114
  call void @check_flag()
  br label %118

; <label>:118                                     ; preds = %checkBb42, %114
  %119 = call float @CNDF(float %116), !llfi_index !238
  store float %119, float* %NofXd2, align 4, !llfi_index !239
  %120 = load float* %2, align 4, !llfi_index !240
  %121 = load float* %2, align 4, !llfi_index !240
  %122 = fpext float %120 to double, !llfi_index !241
  %123 = fpext float %121 to double, !llfi_index !241
  %124 = load float* %3, align 4, !llfi_index !242
  %125 = load float* %3, align 4, !llfi_index !242
  %126 = fsub float -0.000000e+00, %124, !llfi_index !243
  %127 = fsub float -0.000000e+00, %125, !llfi_index !243
  %128 = load float* %5, align 4, !llfi_index !244
  %129 = load float* %5, align 4, !llfi_index !244
  %130 = fmul float %126, %128, !llfi_index !245
  %131 = fmul float %127, %129, !llfi_index !245
  %132 = fpext float %130 to double, !llfi_index !246
  %133 = fpext float %131 to double, !llfi_index !246
  %check_cmp43 = fcmp ueq double %132, %133
  br i1 %check_cmp43, label %134, label %checkBb44

checkBb44:                                        ; preds = %118
  call void @check_flag()
  br label %134

; <label>:134                                     ; preds = %checkBb44, %118
  %135 = call double @exp(double %132) #5, !llfi_index !247
  %136 = fmul double %122, %135, !llfi_index !248
  %137 = fmul double %123, %135, !llfi_index !248
  %138 = fptrunc double %136 to float, !llfi_index !249
  %139 = fptrunc double %137 to float, !llfi_index !249
  %check_cmp45 = fcmp ueq float %138, %139
  br i1 %check_cmp45, label %140, label %checkBb46

checkBb46:                                        ; preds = %134
  call void @check_flag()
  br label %140

; <label>:140                                     ; preds = %checkBb46, %134
  store float %138, float* %FutureValueX, align 4, !llfi_index !250
  %141 = load i32* %6, align 4, !llfi_index !251
  %142 = load i32* %6, align 4, !llfi_index !251
  %143 = icmp eq i32 %141, 0, !llfi_index !252
  %144 = icmp eq i32 %142, 0, !llfi_index !252
  %check_cmp47 = icmp eq i1 %143, %144
  br i1 %check_cmp47, label %145, label %checkBb48

checkBb48:                                        ; preds = %140
  call void @check_flag()
  br label %145

; <label>:145                                     ; preds = %checkBb48, %140
  br i1 %143, label %146, label %162, !llfi_index !253

; <label>:146                                     ; preds = %145
  %147 = load float* %1, align 4, !llfi_index !254
  %148 = load float* %1, align 4, !llfi_index !254
  %149 = load float* %NofXd1, align 4, !llfi_index !255
  %150 = load float* %NofXd1, align 4, !llfi_index !255
  %151 = fmul float %147, %149, !llfi_index !256
  %152 = fmul float %148, %150, !llfi_index !256
  %153 = load float* %FutureValueX, align 4, !llfi_index !257
  %154 = load float* %FutureValueX, align 4, !llfi_index !257
  %155 = load float* %NofXd2, align 4, !llfi_index !258
  %156 = load float* %NofXd2, align 4, !llfi_index !258
  %157 = fmul float %153, %155, !llfi_index !259
  %158 = fmul float %154, %156, !llfi_index !259
  %159 = fsub float %151, %157, !llfi_index !260
  %160 = fsub float %152, %158, !llfi_index !260
  %check_cmp49 = fcmp ueq float %159, %160
  br i1 %check_cmp49, label %161, label %checkBb50

checkBb50:                                        ; preds = %146
  call void @check_flag()
  br label %161

; <label>:161                                     ; preds = %checkBb50, %146
  store float %159, float* %OptionPrice, align 4, !llfi_index !261
  br label %196, !llfi_index !262

; <label>:162                                     ; preds = %145
  %163 = load float* %NofXd1, align 4, !llfi_index !263
  %164 = load float* %NofXd1, align 4, !llfi_index !263
  %165 = fpext float %163 to double, !llfi_index !264
  %166 = fpext float %164 to double, !llfi_index !264
  %167 = fsub double 1.000000e+00, %165, !llfi_index !265
  %168 = fsub double 1.000000e+00, %166, !llfi_index !265
  %169 = fptrunc double %167 to float, !llfi_index !266
  %170 = fptrunc double %168 to float, !llfi_index !266
  %check_cmp51 = fcmp ueq float %169, %170
  br i1 %check_cmp51, label %171, label %checkBb52

checkBb52:                                        ; preds = %162
  call void @check_flag()
  br label %171

; <label>:171                                     ; preds = %checkBb52, %162
  store float %169, float* %NegNofXd1, align 4, !llfi_index !267
  %172 = load float* %NofXd2, align 4, !llfi_index !268
  %173 = load float* %NofXd2, align 4, !llfi_index !268
  %174 = fpext float %172 to double, !llfi_index !269
  %175 = fpext float %173 to double, !llfi_index !269
  %176 = fsub double 1.000000e+00, %174, !llfi_index !270
  %177 = fsub double 1.000000e+00, %175, !llfi_index !270
  %178 = fptrunc double %176 to float, !llfi_index !271
  %179 = fptrunc double %177 to float, !llfi_index !271
  %check_cmp53 = fcmp ueq float %178, %179
  br i1 %check_cmp53, label %180, label %checkBb54

checkBb54:                                        ; preds = %171
  call void @check_flag()
  br label %180

; <label>:180                                     ; preds = %checkBb54, %171
  store float %178, float* %NegNofXd2, align 4, !llfi_index !272
  %181 = load float* %FutureValueX, align 4, !llfi_index !273
  %182 = load float* %FutureValueX, align 4, !llfi_index !273
  %183 = load float* %NegNofXd2, align 4, !llfi_index !274
  %184 = load float* %NegNofXd2, align 4, !llfi_index !274
  %185 = fmul float %181, %183, !llfi_index !275
  %186 = fmul float %182, %184, !llfi_index !275
  %187 = load float* %1, align 4, !llfi_index !276
  %188 = load float* %1, align 4, !llfi_index !276
  %189 = load float* %NegNofXd1, align 4, !llfi_index !277
  %190 = load float* %NegNofXd1, align 4, !llfi_index !277
  %191 = fmul float %187, %189, !llfi_index !278
  %192 = fmul float %188, %190, !llfi_index !278
  %193 = fsub float %185, %191, !llfi_index !279
  %194 = fsub float %186, %192, !llfi_index !279
  %check_cmp55 = fcmp ueq float %193, %194
  br i1 %check_cmp55, label %195, label %checkBb56

checkBb56:                                        ; preds = %180
  call void @check_flag()
  br label %195

; <label>:195                                     ; preds = %checkBb56, %180
  store float %193, float* %OptionPrice, align 4, !llfi_index !280
  br label %196, !llfi_index !281

; <label>:196                                     ; preds = %195, %161
  %197 = load float* %OptionPrice, align 4, !llfi_index !282
  %198 = load float* %OptionPrice, align 4, !llfi_index !282
  %check_cmp57 = fcmp ueq float %197, %198
  br i1 %check_cmp57, label %199, label %checkBb58

checkBb58:                                        ; preds = %196
  call void @check_flag()
  br label %199

; <label>:199                                     ; preds = %checkBb58, %196
  ret float %197, !llfi_index !283
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
  %check_cmp = icmp eq i32 %6, %7
  br i1 %check_cmp, label %8, label %checkBb

checkBb:                                          ; preds = %0
  call void @check_flag()
  br label %8

; <label>:8                                       ; preds = %checkBb, %0
  store i32 %6, i32* %tid, align 4, !llfi_index !296
  %9 = load i32* %tid, align 4, !llfi_index !297
  %10 = load i32* %tid, align 4, !llfi_index !297
  %11 = load i32* @numOptions, align 4, !llfi_index !298
  %12 = load i32* @numOptions, align 4, !llfi_index !298
  %13 = load i32* @nThreads, align 4, !llfi_index !299
  %14 = load i32* @nThreads, align 4, !llfi_index !299
  %15 = sdiv i32 %11, %13, !llfi_index !300
  %16 = sdiv i32 %12, %14, !llfi_index !300
  %17 = mul nsw i32 %9, %15, !llfi_index !301
  %18 = mul nsw i32 %10, %16, !llfi_index !301
  %check_cmp1 = icmp eq i32 %17, %18
  br i1 %check_cmp1, label %19, label %checkBb2

checkBb2:                                         ; preds = %8
  call void @check_flag()
  br label %19

; <label>:19                                      ; preds = %checkBb2, %8
  store i32 %17, i32* %start, align 4, !llfi_index !302
  %20 = load i32* %start, align 4, !llfi_index !303
  %21 = load i32* %start, align 4, !llfi_index !303
  %22 = load i32* @numOptions, align 4, !llfi_index !304
  %23 = load i32* @numOptions, align 4, !llfi_index !304
  %24 = load i32* @nThreads, align 4, !llfi_index !305
  %25 = load i32* @nThreads, align 4, !llfi_index !305
  %26 = sdiv i32 %22, %24, !llfi_index !306
  %27 = sdiv i32 %23, %25, !llfi_index !306
  %28 = add nsw i32 %20, %26, !llfi_index !307
  %29 = add nsw i32 %21, %27, !llfi_index !307
  %check_cmp3 = icmp eq i32 %28, %29
  br i1 %check_cmp3, label %30, label %checkBb4

checkBb4:                                         ; preds = %19
  call void @check_flag()
  br label %30

; <label>:30                                      ; preds = %checkBb4, %19
  store i32 %28, i32* %end, align 4, !llfi_index !308
  store i32 0, i32* %j, align 4, !llfi_index !309
  br label %31, !llfi_index !310

; <label>:31                                      ; preds = %141, %30
  %32 = load i32* %j, align 4, !llfi_index !311
  %33 = load i32* %j, align 4, !llfi_index !311
  %34 = icmp slt i32 %32, 100, !llfi_index !312
  %35 = icmp slt i32 %33, 100, !llfi_index !312
  %check_cmp5 = icmp eq i1 %34, %35
  br i1 %check_cmp5, label %36, label %checkBb6

checkBb6:                                         ; preds = %31
  call void @check_flag()
  br label %36

; <label>:36                                      ; preds = %checkBb6, %31
  br i1 %34, label %37, label %142, !llfi_index !313

; <label>:37                                      ; preds = %36
  %38 = load i32* %start, align 4, !llfi_index !314
  %39 = load i32* %start, align 4, !llfi_index !314
  %check_cmp7 = icmp eq i32 %38, %39
  br i1 %check_cmp7, label %40, label %checkBb8

checkBb8:                                         ; preds = %37
  call void @check_flag()
  br label %40

; <label>:40                                      ; preds = %checkBb8, %37
  store i32 %38, i32* %i, align 4, !llfi_index !315
  br label %41, !llfi_index !316

; <label>:41                                      ; preds = %134, %40
  %42 = load i32* %i, align 4, !llfi_index !317
  %43 = load i32* %i, align 4, !llfi_index !317
  %44 = load i32* %end, align 4, !llfi_index !318
  %45 = load i32* %end, align 4, !llfi_index !318
  %46 = icmp slt i32 %42, %44, !llfi_index !319
  %47 = icmp slt i32 %43, %45, !llfi_index !319
  %check_cmp9 = icmp eq i1 %46, %47
  br i1 %check_cmp9, label %48, label %checkBb10

checkBb10:                                        ; preds = %41
  call void @check_flag()
  br label %48

; <label>:48                                      ; preds = %checkBb10, %41
  br i1 %46, label %49, label %135, !llfi_index !320

; <label>:49                                      ; preds = %48
  %50 = load i32* %i, align 4, !llfi_index !321
  %51 = load i32* %i, align 4, !llfi_index !321
  %52 = sext i32 %50 to i64, !llfi_index !322
  %53 = sext i32 %51 to i64, !llfi_index !322
  %54 = load float** @sptprice, align 8, !llfi_index !323
  %55 = load float** @sptprice, align 8, !llfi_index !323
  %56 = getelementptr inbounds float* %54, i64 %52, !llfi_index !324
  %57 = getelementptr inbounds float* %55, i64 %53, !llfi_index !324
  %58 = load float* %56, align 4, !llfi_index !325
  %59 = load float* %57, align 4, !llfi_index !325
  %check_cmp11 = fcmp ueq float %58, %59
  br i1 %check_cmp11, label %60, label %checkBb12

checkBb12:                                        ; preds = %49
  call void @check_flag()
  br label %60

; <label>:60                                      ; preds = %checkBb12, %49
  %61 = load i32* %i, align 4, !llfi_index !326
  %62 = load i32* %i, align 4, !llfi_index !326
  %63 = sext i32 %61 to i64, !llfi_index !327
  %64 = sext i32 %62 to i64, !llfi_index !327
  %65 = load float** @strike, align 8, !llfi_index !328
  %66 = load float** @strike, align 8, !llfi_index !328
  %67 = getelementptr inbounds float* %65, i64 %63, !llfi_index !329
  %68 = getelementptr inbounds float* %66, i64 %64, !llfi_index !329
  %69 = load float* %67, align 4, !llfi_index !330
  %70 = load float* %68, align 4, !llfi_index !330
  %check_cmp13 = fcmp ueq float %69, %70
  br i1 %check_cmp13, label %71, label %checkBb14

checkBb14:                                        ; preds = %60
  call void @check_flag()
  br label %71

; <label>:71                                      ; preds = %checkBb14, %60
  %72 = load i32* %i, align 4, !llfi_index !331
  %73 = load i32* %i, align 4, !llfi_index !331
  %74 = sext i32 %72 to i64, !llfi_index !332
  %75 = sext i32 %73 to i64, !llfi_index !332
  %76 = load float** @rate, align 8, !llfi_index !333
  %77 = load float** @rate, align 8, !llfi_index !333
  %78 = getelementptr inbounds float* %76, i64 %74, !llfi_index !334
  %79 = getelementptr inbounds float* %77, i64 %75, !llfi_index !334
  %80 = load float* %78, align 4, !llfi_index !335
  %81 = load float* %79, align 4, !llfi_index !335
  %check_cmp15 = fcmp ueq float %80, %81
  br i1 %check_cmp15, label %82, label %checkBb16

checkBb16:                                        ; preds = %71
  call void @check_flag()
  br label %82

; <label>:82                                      ; preds = %checkBb16, %71
  %83 = load i32* %i, align 4, !llfi_index !336
  %84 = load i32* %i, align 4, !llfi_index !336
  %85 = sext i32 %83 to i64, !llfi_index !337
  %86 = sext i32 %84 to i64, !llfi_index !337
  %87 = load float** @volatility, align 8, !llfi_index !338
  %88 = load float** @volatility, align 8, !llfi_index !338
  %89 = getelementptr inbounds float* %87, i64 %85, !llfi_index !339
  %90 = getelementptr inbounds float* %88, i64 %86, !llfi_index !339
  %91 = load float* %89, align 4, !llfi_index !340
  %92 = load float* %90, align 4, !llfi_index !340
  %check_cmp17 = fcmp ueq float %91, %92
  br i1 %check_cmp17, label %93, label %checkBb18

checkBb18:                                        ; preds = %82
  call void @check_flag()
  br label %93

; <label>:93                                      ; preds = %checkBb18, %82
  %94 = load i32* %i, align 4, !llfi_index !341
  %95 = load i32* %i, align 4, !llfi_index !341
  %96 = sext i32 %94 to i64, !llfi_index !342
  %97 = sext i32 %95 to i64, !llfi_index !342
  %98 = load float** @otime, align 8, !llfi_index !343
  %99 = load float** @otime, align 8, !llfi_index !343
  %100 = getelementptr inbounds float* %98, i64 %96, !llfi_index !344
  %101 = getelementptr inbounds float* %99, i64 %97, !llfi_index !344
  %102 = load float* %100, align 4, !llfi_index !345
  %103 = load float* %101, align 4, !llfi_index !345
  %check_cmp19 = fcmp ueq float %102, %103
  br i1 %check_cmp19, label %104, label %checkBb20

checkBb20:                                        ; preds = %93
  call void @check_flag()
  br label %104

; <label>:104                                     ; preds = %checkBb20, %93
  %105 = load i32* %i, align 4, !llfi_index !346
  %106 = load i32* %i, align 4, !llfi_index !346
  %107 = sext i32 %105 to i64, !llfi_index !347
  %108 = sext i32 %106 to i64, !llfi_index !347
  %109 = load i32** @otype, align 8, !llfi_index !348
  %110 = load i32** @otype, align 8, !llfi_index !348
  %111 = getelementptr inbounds i32* %109, i64 %107, !llfi_index !349
  %112 = getelementptr inbounds i32* %110, i64 %108, !llfi_index !349
  %113 = load i32* %111, align 4, !llfi_index !350
  %114 = load i32* %112, align 4, !llfi_index !350
  %check_cmp21 = icmp eq i32 %113, %114
  br i1 %check_cmp21, label %115, label %checkBb22

checkBb22:                                        ; preds = %104
  call void @check_flag()
  br label %115

; <label>:115                                     ; preds = %checkBb22, %104
  %116 = call float @BlkSchlsEqEuroNoDiv(float %58, float %69, float %80, float %91, float %102, i32 %113, float 0.000000e+00), !llfi_index !351
  store float %116, float* %price, align 4, !llfi_index !352
  %117 = load float* %price, align 4, !llfi_index !353
  %118 = load float* %price, align 4, !llfi_index !353
  %check_cmp23 = fcmp ueq float %117, %118
  br i1 %check_cmp23, label %119, label %checkBb24

checkBb24:                                        ; preds = %115
  call void @check_flag()
  br label %119

; <label>:119                                     ; preds = %checkBb24, %115
  %120 = load i32* %i, align 4, !llfi_index !354
  %121 = load i32* %i, align 4, !llfi_index !354
  %122 = sext i32 %120 to i64, !llfi_index !355
  %123 = sext i32 %121 to i64, !llfi_index !355
  %124 = load float** @prices, align 8, !llfi_index !356
  %125 = load float** @prices, align 8, !llfi_index !356
  %126 = getelementptr inbounds float* %124, i64 %122, !llfi_index !357
  %127 = getelementptr inbounds float* %125, i64 %123, !llfi_index !357
  %check_cmp25 = icmp eq float* %126, %127
  br i1 %check_cmp25, label %128, label %checkBb26

checkBb26:                                        ; preds = %119
  call void @check_flag()
  br label %128

; <label>:128                                     ; preds = %checkBb26, %119
  store float %117, float* %126, align 4, !llfi_index !358
  br label %129, !llfi_index !359

; <label>:129                                     ; preds = %128
  %130 = load i32* %i, align 4, !llfi_index !360
  %131 = load i32* %i, align 4, !llfi_index !360
  %132 = add nsw i32 %130, 1, !llfi_index !361
  %133 = add nsw i32 %131, 1, !llfi_index !361
  %check_cmp27 = icmp eq i32 %132, %133
  br i1 %check_cmp27, label %134, label %checkBb28

checkBb28:                                        ; preds = %129
  call void @check_flag()
  br label %134

; <label>:134                                     ; preds = %checkBb28, %129
  store i32 %132, i32* %i, align 4, !llfi_index !362
  br label %41, !llfi_index !363

; <label>:135                                     ; preds = %48
  br label %136, !llfi_index !364

; <label>:136                                     ; preds = %135
  %137 = load i32* %j, align 4, !llfi_index !365
  %138 = load i32* %j, align 4, !llfi_index !365
  %139 = add nsw i32 %137, 1, !llfi_index !366
  %140 = add nsw i32 %138, 1, !llfi_index !366
  %check_cmp29 = icmp eq i32 %139, %140
  br i1 %check_cmp29, label %141, label %checkBb30

checkBb30:                                        ; preds = %136
  call void @check_flag()
  br label %141

; <label>:141                                     ; preds = %checkBb30, %136
  store i32 %139, i32* %j, align 4, !llfi_index !367
  br label %31, !llfi_index !368

; <label>:142                                     ; preds = %36
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
  %check_cmp = icmp eq i1 %8, %9
  br i1 %check_cmp, label %10, label %checkBb

checkBb:                                          ; preds = %0
  call void @check_flag()
  br label %10

; <label>:10                                      ; preds = %checkBb, %0
  br i1 %8, label %11, label %20, !llfi_index !389

; <label>:11                                      ; preds = %10
  %12 = load i8*** %3, align 8, !llfi_index !390
  %13 = load i8*** %3, align 8, !llfi_index !390
  %14 = getelementptr inbounds i8** %12, i64 0, !llfi_index !391
  %15 = getelementptr inbounds i8** %13, i64 0, !llfi_index !391
  %16 = load i8** %14, align 8, !llfi_index !392
  %17 = load i8** %15, align 8, !llfi_index !392
  %check_cmp1 = icmp eq i8* %16, %17
  br i1 %check_cmp1, label %18, label %checkBb2

checkBb2:                                         ; preds = %11
  call void @check_flag()
  br label %18

; <label>:18                                      ; preds = %checkBb2, %11
  %19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([48 x i8]* @.str1, i32 0, i32 0), i8* %16), !llfi_index !393
  call void @exit(i32 1) #6, !llfi_index !394
  unreachable, !llfi_index !395

; <label>:20                                      ; preds = %10
  %21 = load i8*** %3, align 8, !llfi_index !396
  %22 = load i8*** %3, align 8, !llfi_index !396
  %23 = getelementptr inbounds i8** %21, i64 1, !llfi_index !397
  %24 = getelementptr inbounds i8** %22, i64 1, !llfi_index !397
  %25 = load i8** %23, align 8, !llfi_index !398
  %26 = load i8** %24, align 8, !llfi_index !398
  %check_cmp3 = icmp eq i8* %25, %26
  br i1 %check_cmp3, label %27, label %checkBb4

checkBb4:                                         ; preds = %20
  call void @check_flag()
  br label %27

; <label>:27                                      ; preds = %checkBb4, %20
  %28 = call i32 @atoi(i8* %25) #7, !llfi_index !399
  store i32 %28, i32* @nThreads, align 4, !llfi_index !400
  %29 = load i8*** %3, align 8, !llfi_index !401
  %30 = load i8*** %3, align 8, !llfi_index !401
  %31 = getelementptr inbounds i8** %29, i64 2, !llfi_index !402
  %32 = getelementptr inbounds i8** %30, i64 2, !llfi_index !402
  %33 = load i8** %31, align 8, !llfi_index !403
  %34 = load i8** %32, align 8, !llfi_index !403
  %check_cmp5 = icmp eq i8* %33, %34
  br i1 %check_cmp5, label %35, label %checkBb6

checkBb6:                                         ; preds = %27
  call void @check_flag()
  br label %35

; <label>:35                                      ; preds = %checkBb6, %27
  store i8* %33, i8** %inputFile, align 8, !llfi_index !404
  %36 = load i8*** %3, align 8, !llfi_index !405
  %37 = load i8*** %3, align 8, !llfi_index !405
  %38 = getelementptr inbounds i8** %36, i64 3, !llfi_index !406
  %39 = getelementptr inbounds i8** %37, i64 3, !llfi_index !406
  %40 = load i8** %38, align 8, !llfi_index !407
  %41 = load i8** %39, align 8, !llfi_index !407
  %check_cmp7 = icmp eq i8* %40, %41
  br i1 %check_cmp7, label %42, label %checkBb8

checkBb8:                                         ; preds = %35
  call void @check_flag()
  br label %42

; <label>:42                                      ; preds = %checkBb8, %35
  store i8* %40, i8** %outputFile, align 8, !llfi_index !408
  %43 = load i8** %inputFile, align 8, !llfi_index !409
  %44 = load i8** %inputFile, align 8, !llfi_index !409
  %check_cmp9 = icmp eq i8* %43, %44
  br i1 %check_cmp9, label %45, label %checkBb10

checkBb10:                                        ; preds = %42
  call void @check_flag()
  br label %45

; <label>:45                                      ; preds = %checkBb10, %42
  %46 = call %struct._IO_FILE* @fopen(i8* %43, i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0)), !llfi_index !410
  store %struct._IO_FILE* %46, %struct._IO_FILE** %file, align 8, !llfi_index !411
  %47 = load %struct._IO_FILE** %file, align 8, !llfi_index !412
  %48 = load %struct._IO_FILE** %file, align 8, !llfi_index !412
  %49 = icmp eq %struct._IO_FILE* %47, null, !llfi_index !413
  %50 = icmp eq %struct._IO_FILE* %48, null, !llfi_index !413
  %check_cmp11 = icmp eq i1 %49, %50
  br i1 %check_cmp11, label %51, label %checkBb12

checkBb12:                                        ; preds = %45
  call void @check_flag()
  br label %51

; <label>:51                                      ; preds = %checkBb12, %45
  br i1 %49, label %52, label %57, !llfi_index !414

; <label>:52                                      ; preds = %51
  %53 = load i8** %inputFile, align 8, !llfi_index !415
  %54 = load i8** %inputFile, align 8, !llfi_index !415
  %check_cmp13 = icmp eq i8* %53, %54
  br i1 %check_cmp13, label %55, label %checkBb14

checkBb14:                                        ; preds = %52
  call void @check_flag()
  br label %55

; <label>:55                                      ; preds = %checkBb14, %52
  %56 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([34 x i8]* @.str3, i32 0, i32 0), i8* %53), !llfi_index !416
  call void @exit(i32 1) #6, !llfi_index !417
  unreachable, !llfi_index !418

; <label>:57                                      ; preds = %51
  %58 = load %struct._IO_FILE** %file, align 8, !llfi_index !419
  %59 = load %struct._IO_FILE** %file, align 8, !llfi_index !419
  %check_cmp15 = icmp eq %struct._IO_FILE* %58, %59
  br i1 %check_cmp15, label %60, label %checkBb16

checkBb16:                                        ; preds = %57
  call void @check_flag()
  br label %60

; <label>:60                                      ; preds = %checkBb16, %57
  %61 = call i32 (%struct._IO_FILE*, i8*, ...)* @__isoc99_fscanf(%struct._IO_FILE* %58, i8* getelementptr inbounds ([3 x i8]* @.str4, i32 0, i32 0), i32* @numOptions), !llfi_index !420
  store i32 %61, i32* %rv, align 4, !llfi_index !421
  %62 = load i32* %rv, align 4, !llfi_index !422
  %63 = load i32* %rv, align 4, !llfi_index !422
  %64 = icmp ne i32 %62, 1, !llfi_index !423
  %65 = icmp ne i32 %63, 1, !llfi_index !423
  %check_cmp17 = icmp eq i1 %64, %65
  br i1 %check_cmp17, label %66, label %checkBb18

checkBb18:                                        ; preds = %60
  call void @check_flag()
  br label %66

; <label>:66                                      ; preds = %checkBb18, %60
  br i1 %64, label %67, label %76, !llfi_index !424

; <label>:67                                      ; preds = %66
  %68 = load i8** %inputFile, align 8, !llfi_index !425
  %69 = load i8** %inputFile, align 8, !llfi_index !425
  %check_cmp19 = icmp eq i8* %68, %69
  br i1 %check_cmp19, label %70, label %checkBb20

checkBb20:                                        ; preds = %67
  call void @check_flag()
  br label %70

; <label>:70                                      ; preds = %checkBb20, %67
  %71 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([39 x i8]* @.str5, i32 0, i32 0), i8* %68), !llfi_index !426
  %72 = load %struct._IO_FILE** %file, align 8, !llfi_index !427
  %73 = load %struct._IO_FILE** %file, align 8, !llfi_index !427
  %check_cmp21 = icmp eq %struct._IO_FILE* %72, %73
  br i1 %check_cmp21, label %74, label %checkBb22

checkBb22:                                        ; preds = %70
  call void @check_flag()
  br label %74

; <label>:74                                      ; preds = %checkBb22, %70
  %75 = call i32 @fclose(%struct._IO_FILE* %72), !llfi_index !428
  call void @exit(i32 1) #6, !llfi_index !429
  unreachable, !llfi_index !430

; <label>:76                                      ; preds = %66
  %77 = load i32* @nThreads, align 4, !llfi_index !431
  %78 = load i32* @nThreads, align 4, !llfi_index !431
  %79 = load i32* @numOptions, align 4, !llfi_index !432
  %80 = load i32* @numOptions, align 4, !llfi_index !432
  %81 = icmp sgt i32 %77, %79, !llfi_index !433
  %82 = icmp sgt i32 %78, %80, !llfi_index !433
  %check_cmp23 = icmp eq i1 %81, %82
  br i1 %check_cmp23, label %83, label %checkBb24

checkBb24:                                        ; preds = %76
  call void @check_flag()
  br label %83

; <label>:83                                      ; preds = %checkBb24, %76
  br i1 %81, label %84, label %89, !llfi_index !434

; <label>:84                                      ; preds = %83
  %85 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([82 x i8]* @.str6, i32 0, i32 0)), !llfi_index !435
  %86 = load i32* @numOptions, align 4, !llfi_index !436
  %87 = load i32* @numOptions, align 4, !llfi_index !436
  %check_cmp25 = icmp eq i32 %86, %87
  br i1 %check_cmp25, label %88, label %checkBb26

checkBb26:                                        ; preds = %84
  call void @check_flag()
  br label %88

; <label>:88                                      ; preds = %checkBb26, %84
  store i32 %86, i32* @nThreads, align 4, !llfi_index !437
  br label %89, !llfi_index !438

; <label>:89                                      ; preds = %88, %83
  %90 = load i32* @nThreads, align 4, !llfi_index !439
  %91 = load i32* @nThreads, align 4, !llfi_index !439
  %92 = icmp ne i32 %90, 1, !llfi_index !440
  %93 = icmp ne i32 %91, 1, !llfi_index !440
  %check_cmp27 = icmp eq i1 %92, %93
  br i1 %check_cmp27, label %94, label %checkBb28

checkBb28:                                        ; preds = %89
  call void @check_flag()
  br label %94

; <label>:94                                      ; preds = %checkBb28, %89
  br i1 %92, label %95, label %97, !llfi_index !441

; <label>:95                                      ; preds = %94
  %96 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([46 x i8]* @.str7, i32 0, i32 0)), !llfi_index !442
  call void @exit(i32 1) #6, !llfi_index !443
  unreachable, !llfi_index !444

; <label>:97                                      ; preds = %94
  %98 = load i32* @numOptions, align 4, !llfi_index !445
  %99 = load i32* @numOptions, align 4, !llfi_index !445
  %100 = sext i32 %98 to i64, !llfi_index !446
  %101 = sext i32 %99 to i64, !llfi_index !446
  %102 = mul i64 %100, 36, !llfi_index !447
  %103 = mul i64 %101, 36, !llfi_index !447
  %check_cmp29 = icmp eq i64 %102, %103
  br i1 %check_cmp29, label %104, label %checkBb30

checkBb30:                                        ; preds = %97
  call void @check_flag()
  br label %104

; <label>:104                                     ; preds = %checkBb30, %97
  %105 = call noalias i8* @malloc(i64 %102) #5, !llfi_index !448
  %106 = bitcast i8* %105 to %struct.OptionData_*, !llfi_index !449
  %107 = bitcast i8* %105 to %struct.OptionData_*, !llfi_index !449
  %check_cmp31 = icmp eq %struct.OptionData_* %106, %107
  br i1 %check_cmp31, label %108, label %checkBb32

checkBb32:                                        ; preds = %104
  call void @check_flag()
  br label %108

; <label>:108                                     ; preds = %checkBb32, %104
  store %struct.OptionData_* %106, %struct.OptionData_** @data, align 8, !llfi_index !450
  %109 = load i32* @numOptions, align 4, !llfi_index !451
  %110 = load i32* @numOptions, align 4, !llfi_index !451
  %111 = sext i32 %109 to i64, !llfi_index !452
  %112 = sext i32 %110 to i64, !llfi_index !452
  %113 = mul i64 %111, 4, !llfi_index !453
  %114 = mul i64 %112, 4, !llfi_index !453
  %check_cmp33 = icmp eq i64 %113, %114
  br i1 %check_cmp33, label %115, label %checkBb34

checkBb34:                                        ; preds = %108
  call void @check_flag()
  br label %115

; <label>:115                                     ; preds = %checkBb34, %108
  %116 = call noalias i8* @malloc(i64 %113) #5, !llfi_index !454
  %117 = bitcast i8* %116 to float*, !llfi_index !455
  %118 = bitcast i8* %116 to float*, !llfi_index !455
  %check_cmp35 = icmp eq float* %117, %118
  br i1 %check_cmp35, label %119, label %checkBb36

checkBb36:                                        ; preds = %115
  call void @check_flag()
  br label %119

; <label>:119                                     ; preds = %checkBb36, %115
  store float* %117, float** @prices, align 8, !llfi_index !456
  store i32 0, i32* %loopnum, align 4, !llfi_index !457
  br label %120, !llfi_index !458

; <label>:120                                     ; preds = %252, %119
  %121 = load i32* %loopnum, align 4, !llfi_index !459
  %122 = load i32* %loopnum, align 4, !llfi_index !459
  %123 = load i32* @numOptions, align 4, !llfi_index !460
  %124 = load i32* @numOptions, align 4, !llfi_index !460
  %125 = icmp slt i32 %121, %123, !llfi_index !461
  %126 = icmp slt i32 %122, %124, !llfi_index !461
  %check_cmp37 = icmp eq i1 %125, %126
  br i1 %check_cmp37, label %127, label %checkBb38

checkBb38:                                        ; preds = %120
  call void @check_flag()
  br label %127

; <label>:127                                     ; preds = %checkBb38, %120
  br i1 %125, label %128, label %253, !llfi_index !462

; <label>:128                                     ; preds = %127
  %129 = load %struct._IO_FILE** %file, align 8, !llfi_index !463
  %130 = load %struct._IO_FILE** %file, align 8, !llfi_index !463
  %check_cmp39 = icmp eq %struct._IO_FILE* %129, %130
  br i1 %check_cmp39, label %131, label %checkBb40

checkBb40:                                        ; preds = %128
  call void @check_flag()
  br label %131

; <label>:131                                     ; preds = %checkBb40, %128
  %132 = load i32* %loopnum, align 4, !llfi_index !464
  %133 = load i32* %loopnum, align 4, !llfi_index !464
  %134 = sext i32 %132 to i64, !llfi_index !465
  %135 = sext i32 %133 to i64, !llfi_index !465
  %136 = load %struct.OptionData_** @data, align 8, !llfi_index !466
  %137 = load %struct.OptionData_** @data, align 8, !llfi_index !466
  %138 = getelementptr inbounds %struct.OptionData_* %136, i64 %134, !llfi_index !467
  %139 = getelementptr inbounds %struct.OptionData_* %137, i64 %135, !llfi_index !467
  %140 = getelementptr inbounds %struct.OptionData_* %138, i32 0, i32 0, !llfi_index !468
  %141 = getelementptr inbounds %struct.OptionData_* %139, i32 0, i32 0, !llfi_index !468
  %check_cmp41 = icmp eq float* %140, %141
  br i1 %check_cmp41, label %142, label %checkBb42

checkBb42:                                        ; preds = %131
  call void @check_flag()
  br label %142

; <label>:142                                     ; preds = %checkBb42, %131
  %143 = load i32* %loopnum, align 4, !llfi_index !469
  %144 = load i32* %loopnum, align 4, !llfi_index !469
  %145 = sext i32 %143 to i64, !llfi_index !470
  %146 = sext i32 %144 to i64, !llfi_index !470
  %147 = load %struct.OptionData_** @data, align 8, !llfi_index !471
  %148 = load %struct.OptionData_** @data, align 8, !llfi_index !471
  %149 = getelementptr inbounds %struct.OptionData_* %147, i64 %145, !llfi_index !472
  %150 = getelementptr inbounds %struct.OptionData_* %148, i64 %146, !llfi_index !472
  %151 = getelementptr inbounds %struct.OptionData_* %149, i32 0, i32 1, !llfi_index !473
  %152 = getelementptr inbounds %struct.OptionData_* %150, i32 0, i32 1, !llfi_index !473
  %check_cmp43 = icmp eq float* %151, %152
  br i1 %check_cmp43, label %153, label %checkBb44

checkBb44:                                        ; preds = %142
  call void @check_flag()
  br label %153

; <label>:153                                     ; preds = %checkBb44, %142
  %154 = load i32* %loopnum, align 4, !llfi_index !474
  %155 = load i32* %loopnum, align 4, !llfi_index !474
  %156 = sext i32 %154 to i64, !llfi_index !475
  %157 = sext i32 %155 to i64, !llfi_index !475
  %158 = load %struct.OptionData_** @data, align 8, !llfi_index !476
  %159 = load %struct.OptionData_** @data, align 8, !llfi_index !476
  %160 = getelementptr inbounds %struct.OptionData_* %158, i64 %156, !llfi_index !477
  %161 = getelementptr inbounds %struct.OptionData_* %159, i64 %157, !llfi_index !477
  %162 = getelementptr inbounds %struct.OptionData_* %160, i32 0, i32 2, !llfi_index !478
  %163 = getelementptr inbounds %struct.OptionData_* %161, i32 0, i32 2, !llfi_index !478
  %check_cmp45 = icmp eq float* %162, %163
  br i1 %check_cmp45, label %164, label %checkBb46

checkBb46:                                        ; preds = %153
  call void @check_flag()
  br label %164

; <label>:164                                     ; preds = %checkBb46, %153
  %165 = load i32* %loopnum, align 4, !llfi_index !479
  %166 = load i32* %loopnum, align 4, !llfi_index !479
  %167 = sext i32 %165 to i64, !llfi_index !480
  %168 = sext i32 %166 to i64, !llfi_index !480
  %169 = load %struct.OptionData_** @data, align 8, !llfi_index !481
  %170 = load %struct.OptionData_** @data, align 8, !llfi_index !481
  %171 = getelementptr inbounds %struct.OptionData_* %169, i64 %167, !llfi_index !482
  %172 = getelementptr inbounds %struct.OptionData_* %170, i64 %168, !llfi_index !482
  %173 = getelementptr inbounds %struct.OptionData_* %171, i32 0, i32 3, !llfi_index !483
  %174 = getelementptr inbounds %struct.OptionData_* %172, i32 0, i32 3, !llfi_index !483
  %check_cmp47 = icmp eq float* %173, %174
  br i1 %check_cmp47, label %175, label %checkBb48

checkBb48:                                        ; preds = %164
  call void @check_flag()
  br label %175

; <label>:175                                     ; preds = %checkBb48, %164
  %176 = load i32* %loopnum, align 4, !llfi_index !484
  %177 = load i32* %loopnum, align 4, !llfi_index !484
  %178 = sext i32 %176 to i64, !llfi_index !485
  %179 = sext i32 %177 to i64, !llfi_index !485
  %180 = load %struct.OptionData_** @data, align 8, !llfi_index !486
  %181 = load %struct.OptionData_** @data, align 8, !llfi_index !486
  %182 = getelementptr inbounds %struct.OptionData_* %180, i64 %178, !llfi_index !487
  %183 = getelementptr inbounds %struct.OptionData_* %181, i64 %179, !llfi_index !487
  %184 = getelementptr inbounds %struct.OptionData_* %182, i32 0, i32 4, !llfi_index !488
  %185 = getelementptr inbounds %struct.OptionData_* %183, i32 0, i32 4, !llfi_index !488
  %check_cmp49 = icmp eq float* %184, %185
  br i1 %check_cmp49, label %186, label %checkBb50

checkBb50:                                        ; preds = %175
  call void @check_flag()
  br label %186

; <label>:186                                     ; preds = %checkBb50, %175
  %187 = load i32* %loopnum, align 4, !llfi_index !489
  %188 = load i32* %loopnum, align 4, !llfi_index !489
  %189 = sext i32 %187 to i64, !llfi_index !490
  %190 = sext i32 %188 to i64, !llfi_index !490
  %191 = load %struct.OptionData_** @data, align 8, !llfi_index !491
  %192 = load %struct.OptionData_** @data, align 8, !llfi_index !491
  %193 = getelementptr inbounds %struct.OptionData_* %191, i64 %189, !llfi_index !492
  %194 = getelementptr inbounds %struct.OptionData_* %192, i64 %190, !llfi_index !492
  %195 = getelementptr inbounds %struct.OptionData_* %193, i32 0, i32 5, !llfi_index !493
  %196 = getelementptr inbounds %struct.OptionData_* %194, i32 0, i32 5, !llfi_index !493
  %check_cmp51 = icmp eq float* %195, %196
  br i1 %check_cmp51, label %197, label %checkBb52

checkBb52:                                        ; preds = %186
  call void @check_flag()
  br label %197

; <label>:197                                     ; preds = %checkBb52, %186
  %198 = load i32* %loopnum, align 4, !llfi_index !494
  %199 = load i32* %loopnum, align 4, !llfi_index !494
  %200 = sext i32 %198 to i64, !llfi_index !495
  %201 = sext i32 %199 to i64, !llfi_index !495
  %202 = load %struct.OptionData_** @data, align 8, !llfi_index !496
  %203 = load %struct.OptionData_** @data, align 8, !llfi_index !496
  %204 = getelementptr inbounds %struct.OptionData_* %202, i64 %200, !llfi_index !497
  %205 = getelementptr inbounds %struct.OptionData_* %203, i64 %201, !llfi_index !497
  %206 = getelementptr inbounds %struct.OptionData_* %204, i32 0, i32 6, !llfi_index !498
  %207 = getelementptr inbounds %struct.OptionData_* %205, i32 0, i32 6, !llfi_index !498
  %check_cmp53 = icmp eq i8* %206, %207
  br i1 %check_cmp53, label %208, label %checkBb54

checkBb54:                                        ; preds = %197
  call void @check_flag()
  br label %208

; <label>:208                                     ; preds = %checkBb54, %197
  %209 = load i32* %loopnum, align 4, !llfi_index !499
  %210 = load i32* %loopnum, align 4, !llfi_index !499
  %211 = sext i32 %209 to i64, !llfi_index !500
  %212 = sext i32 %210 to i64, !llfi_index !500
  %213 = load %struct.OptionData_** @data, align 8, !llfi_index !501
  %214 = load %struct.OptionData_** @data, align 8, !llfi_index !501
  %215 = getelementptr inbounds %struct.OptionData_* %213, i64 %211, !llfi_index !502
  %216 = getelementptr inbounds %struct.OptionData_* %214, i64 %212, !llfi_index !502
  %217 = getelementptr inbounds %struct.OptionData_* %215, i32 0, i32 7, !llfi_index !503
  %218 = getelementptr inbounds %struct.OptionData_* %216, i32 0, i32 7, !llfi_index !503
  %check_cmp55 = icmp eq float* %217, %218
  br i1 %check_cmp55, label %219, label %checkBb56

checkBb56:                                        ; preds = %208
  call void @check_flag()
  br label %219

; <label>:219                                     ; preds = %checkBb56, %208
  %220 = load i32* %loopnum, align 4, !llfi_index !504
  %221 = load i32* %loopnum, align 4, !llfi_index !504
  %222 = sext i32 %220 to i64, !llfi_index !505
  %223 = sext i32 %221 to i64, !llfi_index !505
  %224 = load %struct.OptionData_** @data, align 8, !llfi_index !506
  %225 = load %struct.OptionData_** @data, align 8, !llfi_index !506
  %226 = getelementptr inbounds %struct.OptionData_* %224, i64 %222, !llfi_index !507
  %227 = getelementptr inbounds %struct.OptionData_* %225, i64 %223, !llfi_index !507
  %228 = getelementptr inbounds %struct.OptionData_* %226, i32 0, i32 8, !llfi_index !508
  %229 = getelementptr inbounds %struct.OptionData_* %227, i32 0, i32 8, !llfi_index !508
  %check_cmp57 = icmp eq float* %228, %229
  br i1 %check_cmp57, label %230, label %checkBb58

checkBb58:                                        ; preds = %219
  call void @check_flag()
  br label %230

; <label>:230                                     ; preds = %checkBb58, %219
  %231 = call i32 (%struct._IO_FILE*, i8*, ...)* @__isoc99_fscanf(%struct._IO_FILE* %129, i8* getelementptr inbounds ([27 x i8]* @.str8, i32 0, i32 0), float* %140, float* %151, float* %162, float* %173, float* %184, float* %195, i8* %206, float* %217, float* %228), !llfi_index !509
  store i32 %231, i32* %rv, align 4, !llfi_index !510
  %232 = load i32* %rv, align 4, !llfi_index !511
  %233 = load i32* %rv, align 4, !llfi_index !511
  %234 = icmp ne i32 %232, 9, !llfi_index !512
  %235 = icmp ne i32 %233, 9, !llfi_index !512
  %check_cmp59 = icmp eq i1 %234, %235
  br i1 %check_cmp59, label %236, label %checkBb60

checkBb60:                                        ; preds = %230
  call void @check_flag()
  br label %236

; <label>:236                                     ; preds = %checkBb60, %230
  br i1 %234, label %237, label %246, !llfi_index !513

; <label>:237                                     ; preds = %236
  %238 = load i8** %inputFile, align 8, !llfi_index !514
  %239 = load i8** %inputFile, align 8, !llfi_index !514
  %check_cmp61 = icmp eq i8* %238, %239
  br i1 %check_cmp61, label %240, label %checkBb62

checkBb62:                                        ; preds = %237
  call void @check_flag()
  br label %240

; <label>:240                                     ; preds = %checkBb62, %237
  %241 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([39 x i8]* @.str5, i32 0, i32 0), i8* %238), !llfi_index !515
  %242 = load %struct._IO_FILE** %file, align 8, !llfi_index !516
  %243 = load %struct._IO_FILE** %file, align 8, !llfi_index !516
  %check_cmp63 = icmp eq %struct._IO_FILE* %242, %243
  br i1 %check_cmp63, label %244, label %checkBb64

checkBb64:                                        ; preds = %240
  call void @check_flag()
  br label %244

; <label>:244                                     ; preds = %checkBb64, %240
  %245 = call i32 @fclose(%struct._IO_FILE* %242), !llfi_index !517
  call void @exit(i32 1) #6, !llfi_index !518
  unreachable, !llfi_index !519

; <label>:246                                     ; preds = %236
  br label %247, !llfi_index !520

; <label>:247                                     ; preds = %246
  %248 = load i32* %loopnum, align 4, !llfi_index !521
  %249 = load i32* %loopnum, align 4, !llfi_index !521
  %250 = add nsw i32 %248, 1, !llfi_index !522
  %251 = add nsw i32 %249, 1, !llfi_index !522
  %check_cmp65 = icmp eq i32 %250, %251
  br i1 %check_cmp65, label %252, label %checkBb66

checkBb66:                                        ; preds = %247
  call void @check_flag()
  br label %252

; <label>:252                                     ; preds = %checkBb66, %247
  store i32 %250, i32* %loopnum, align 4, !llfi_index !523
  br label %120, !llfi_index !524

; <label>:253                                     ; preds = %127
  %254 = load %struct._IO_FILE** %file, align 8, !llfi_index !525
  %255 = load %struct._IO_FILE** %file, align 8, !llfi_index !525
  %check_cmp67 = icmp eq %struct._IO_FILE* %254, %255
  br i1 %check_cmp67, label %256, label %checkBb68

checkBb68:                                        ; preds = %253
  call void @check_flag()
  br label %256

; <label>:256                                     ; preds = %checkBb68, %253
  %257 = call i32 @fclose(%struct._IO_FILE* %254), !llfi_index !526
  store i32 %257, i32* %rv, align 4, !llfi_index !527
  %258 = load i32* %rv, align 4, !llfi_index !528
  %259 = load i32* %rv, align 4, !llfi_index !528
  %260 = icmp ne i32 %258, 0, !llfi_index !529
  %261 = icmp ne i32 %259, 0, !llfi_index !529
  %check_cmp69 = icmp eq i1 %260, %261
  br i1 %check_cmp69, label %262, label %checkBb70

checkBb70:                                        ; preds = %256
  call void @check_flag()
  br label %262

; <label>:262                                     ; preds = %checkBb70, %256
  br i1 %260, label %263, label %268, !llfi_index !530

; <label>:263                                     ; preds = %262
  %264 = load i8** %inputFile, align 8, !llfi_index !531
  %265 = load i8** %inputFile, align 8, !llfi_index !531
  %check_cmp71 = icmp eq i8* %264, %265
  br i1 %check_cmp71, label %266, label %checkBb72

checkBb72:                                        ; preds = %263
  call void @check_flag()
  br label %266

; <label>:266                                     ; preds = %checkBb72, %263
  %267 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([35 x i8]* @.str9, i32 0, i32 0), i8* %264), !llfi_index !532
  call void @exit(i32 1) #6, !llfi_index !533
  unreachable, !llfi_index !534

; <label>:268                                     ; preds = %262
  %269 = load i32* @numOptions, align 4, !llfi_index !535
  %270 = load i32* @numOptions, align 4, !llfi_index !535
  %check_cmp73 = icmp eq i32 %269, %270
  br i1 %check_cmp73, label %271, label %checkBb74

checkBb74:                                        ; preds = %268
  call void @check_flag()
  br label %271

; <label>:271                                     ; preds = %checkBb74, %268
  %272 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str10, i32 0, i32 0), i32 %269), !llfi_index !536
  %273 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str11, i32 0, i32 0), i32 100), !llfi_index !537
  %274 = load i32* @numOptions, align 4, !llfi_index !538
  %275 = load i32* @numOptions, align 4, !llfi_index !538
  %276 = mul nsw i32 5, %274, !llfi_index !539
  %277 = mul nsw i32 5, %275, !llfi_index !539
  %278 = sext i32 %276 to i64, !llfi_index !540
  %279 = sext i32 %277 to i64, !llfi_index !540
  %280 = mul i64 %278, 4, !llfi_index !541
  %281 = mul i64 %279, 4, !llfi_index !541
  %282 = add i64 %280, 256, !llfi_index !542
  %283 = add i64 %281, 256, !llfi_index !542
  %check_cmp75 = icmp eq i64 %282, %283
  br i1 %check_cmp75, label %284, label %checkBb76

checkBb76:                                        ; preds = %271
  call void @check_flag()
  br label %284

; <label>:284                                     ; preds = %checkBb76, %271
  %285 = call noalias i8* @malloc(i64 %282) #5, !llfi_index !543
  %286 = bitcast i8* %285 to float*, !llfi_index !544
  %287 = bitcast i8* %285 to float*, !llfi_index !544
  %check_cmp77 = icmp eq float* %286, %287
  br i1 %check_cmp77, label %288, label %checkBb78

checkBb78:                                        ; preds = %284
  call void @check_flag()
  br label %288

; <label>:288                                     ; preds = %checkBb78, %284
  store float* %286, float** %buffer, align 8, !llfi_index !545
  %289 = load float** %buffer, align 8, !llfi_index !546
  %290 = load float** %buffer, align 8, !llfi_index !546
  %291 = ptrtoint float* %289 to i64, !llfi_index !547
  %292 = ptrtoint float* %290 to i64, !llfi_index !547
  %293 = add i64 %291, 256, !llfi_index !548
  %294 = add i64 %292, 256, !llfi_index !548
  %295 = and i64 %293, -64, !llfi_index !549
  %296 = and i64 %294, -64, !llfi_index !549
  %297 = inttoptr i64 %295 to float*, !llfi_index !550
  %298 = inttoptr i64 %296 to float*, !llfi_index !550
  %check_cmp79 = icmp eq float* %297, %298
  br i1 %check_cmp79, label %299, label %checkBb80

checkBb80:                                        ; preds = %288
  call void @check_flag()
  br label %299

; <label>:299                                     ; preds = %checkBb80, %288
  store float* %297, float** @sptprice, align 8, !llfi_index !551
  %300 = load float** @sptprice, align 8, !llfi_index !552
  %301 = load float** @sptprice, align 8, !llfi_index !552
  %302 = load i32* @numOptions, align 4, !llfi_index !553
  %303 = load i32* @numOptions, align 4, !llfi_index !553
  %304 = sext i32 %302 to i64, !llfi_index !554
  %305 = sext i32 %303 to i64, !llfi_index !554
  %306 = getelementptr inbounds float* %300, i64 %304, !llfi_index !555
  %307 = getelementptr inbounds float* %301, i64 %305, !llfi_index !555
  %check_cmp81 = icmp eq float* %306, %307
  br i1 %check_cmp81, label %308, label %checkBb82

checkBb82:                                        ; preds = %299
  call void @check_flag()
  br label %308

; <label>:308                                     ; preds = %checkBb82, %299
  store float* %306, float** @strike, align 8, !llfi_index !556
  %309 = load float** @strike, align 8, !llfi_index !557
  %310 = load float** @strike, align 8, !llfi_index !557
  %311 = load i32* @numOptions, align 4, !llfi_index !558
  %312 = load i32* @numOptions, align 4, !llfi_index !558
  %313 = sext i32 %311 to i64, !llfi_index !559
  %314 = sext i32 %312 to i64, !llfi_index !559
  %315 = getelementptr inbounds float* %309, i64 %313, !llfi_index !560
  %316 = getelementptr inbounds float* %310, i64 %314, !llfi_index !560
  %check_cmp83 = icmp eq float* %315, %316
  br i1 %check_cmp83, label %317, label %checkBb84

checkBb84:                                        ; preds = %308
  call void @check_flag()
  br label %317

; <label>:317                                     ; preds = %checkBb84, %308
  store float* %315, float** @rate, align 8, !llfi_index !561
  %318 = load float** @rate, align 8, !llfi_index !562
  %319 = load float** @rate, align 8, !llfi_index !562
  %320 = load i32* @numOptions, align 4, !llfi_index !563
  %321 = load i32* @numOptions, align 4, !llfi_index !563
  %322 = sext i32 %320 to i64, !llfi_index !564
  %323 = sext i32 %321 to i64, !llfi_index !564
  %324 = getelementptr inbounds float* %318, i64 %322, !llfi_index !565
  %325 = getelementptr inbounds float* %319, i64 %323, !llfi_index !565
  %check_cmp85 = icmp eq float* %324, %325
  br i1 %check_cmp85, label %326, label %checkBb86

checkBb86:                                        ; preds = %317
  call void @check_flag()
  br label %326

; <label>:326                                     ; preds = %checkBb86, %317
  store float* %324, float** @volatility, align 8, !llfi_index !566
  %327 = load float** @volatility, align 8, !llfi_index !567
  %328 = load float** @volatility, align 8, !llfi_index !567
  %329 = load i32* @numOptions, align 4, !llfi_index !568
  %330 = load i32* @numOptions, align 4, !llfi_index !568
  %331 = sext i32 %329 to i64, !llfi_index !569
  %332 = sext i32 %330 to i64, !llfi_index !569
  %333 = getelementptr inbounds float* %327, i64 %331, !llfi_index !570
  %334 = getelementptr inbounds float* %328, i64 %332, !llfi_index !570
  %check_cmp87 = icmp eq float* %333, %334
  br i1 %check_cmp87, label %335, label %checkBb88

checkBb88:                                        ; preds = %326
  call void @check_flag()
  br label %335

; <label>:335                                     ; preds = %checkBb88, %326
  store float* %333, float** @otime, align 8, !llfi_index !571
  %336 = load i32* @numOptions, align 4, !llfi_index !572
  %337 = load i32* @numOptions, align 4, !llfi_index !572
  %338 = sext i32 %336 to i64, !llfi_index !573
  %339 = sext i32 %337 to i64, !llfi_index !573
  %340 = mul i64 %338, 4, !llfi_index !574
  %341 = mul i64 %339, 4, !llfi_index !574
  %342 = add i64 %340, 256, !llfi_index !575
  %343 = add i64 %341, 256, !llfi_index !575
  %check_cmp89 = icmp eq i64 %342, %343
  br i1 %check_cmp89, label %344, label %checkBb90

checkBb90:                                        ; preds = %335
  call void @check_flag()
  br label %344

; <label>:344                                     ; preds = %checkBb90, %335
  %345 = call noalias i8* @malloc(i64 %342) #5, !llfi_index !576
  %346 = bitcast i8* %345 to i32*, !llfi_index !577
  %347 = bitcast i8* %345 to i32*, !llfi_index !577
  %check_cmp91 = icmp eq i32* %346, %347
  br i1 %check_cmp91, label %348, label %checkBb92

checkBb92:                                        ; preds = %344
  call void @check_flag()
  br label %348

; <label>:348                                     ; preds = %checkBb92, %344
  store i32* %346, i32** %buffer2, align 8, !llfi_index !578
  %349 = load i32** %buffer2, align 8, !llfi_index !579
  %350 = load i32** %buffer2, align 8, !llfi_index !579
  %351 = ptrtoint i32* %349 to i64, !llfi_index !580
  %352 = ptrtoint i32* %350 to i64, !llfi_index !580
  %353 = add i64 %351, 256, !llfi_index !581
  %354 = add i64 %352, 256, !llfi_index !581
  %355 = and i64 %353, -64, !llfi_index !582
  %356 = and i64 %354, -64, !llfi_index !582
  %357 = inttoptr i64 %355 to i32*, !llfi_index !583
  %358 = inttoptr i64 %356 to i32*, !llfi_index !583
  %check_cmp93 = icmp eq i32* %357, %358
  br i1 %check_cmp93, label %359, label %checkBb94

checkBb94:                                        ; preds = %348
  call void @check_flag()
  br label %359

; <label>:359                                     ; preds = %checkBb94, %348
  store i32* %357, i32** @otype, align 8, !llfi_index !584
  store i32 0, i32* %i, align 4, !llfi_index !585
  br label %360, !llfi_index !586

; <label>:360                                     ; preds = %511, %359
  %361 = load i32* %i, align 4, !llfi_index !587
  %362 = load i32* %i, align 4, !llfi_index !587
  %363 = load i32* @numOptions, align 4, !llfi_index !588
  %364 = load i32* @numOptions, align 4, !llfi_index !588
  %365 = icmp slt i32 %361, %363, !llfi_index !589
  %366 = icmp slt i32 %362, %364, !llfi_index !589
  %check_cmp95 = icmp eq i1 %365, %366
  br i1 %check_cmp95, label %367, label %checkBb96

checkBb96:                                        ; preds = %360
  call void @check_flag()
  br label %367

; <label>:367                                     ; preds = %checkBb96, %360
  br i1 %365, label %368, label %512, !llfi_index !590

; <label>:368                                     ; preds = %367
  %369 = load i32* %i, align 4, !llfi_index !591
  %370 = load i32* %i, align 4, !llfi_index !591
  %371 = sext i32 %369 to i64, !llfi_index !592
  %372 = sext i32 %370 to i64, !llfi_index !592
  %373 = load %struct.OptionData_** @data, align 8, !llfi_index !593
  %374 = load %struct.OptionData_** @data, align 8, !llfi_index !593
  %375 = getelementptr inbounds %struct.OptionData_* %373, i64 %371, !llfi_index !594
  %376 = getelementptr inbounds %struct.OptionData_* %374, i64 %372, !llfi_index !594
  %377 = getelementptr inbounds %struct.OptionData_* %375, i32 0, i32 6, !llfi_index !595
  %378 = getelementptr inbounds %struct.OptionData_* %376, i32 0, i32 6, !llfi_index !595
  %379 = load i8* %377, align 1, !llfi_index !596
  %380 = load i8* %378, align 1, !llfi_index !596
  %381 = sext i8 %379 to i32, !llfi_index !597
  %382 = sext i8 %380 to i32, !llfi_index !597
  %383 = icmp eq i32 %381, 80, !llfi_index !598
  %384 = icmp eq i32 %382, 80, !llfi_index !598
  %check_cmp97 = icmp eq i1 %383, %384
  br i1 %check_cmp97, label %385, label %checkBb98

checkBb98:                                        ; preds = %368
  call void @check_flag()
  br label %385

; <label>:385                                     ; preds = %checkBb98, %368
  %386 = select i1 %383, i32 1, i32 0, !llfi_index !599
  %387 = load i32* %i, align 4, !llfi_index !600
  %388 = load i32* %i, align 4, !llfi_index !600
  %389 = sext i32 %387 to i64, !llfi_index !601
  %390 = sext i32 %388 to i64, !llfi_index !601
  %391 = load i32** @otype, align 8, !llfi_index !602
  %392 = load i32** @otype, align 8, !llfi_index !602
  %393 = getelementptr inbounds i32* %391, i64 %389, !llfi_index !603
  %394 = getelementptr inbounds i32* %392, i64 %390, !llfi_index !603
  %check_cmp99 = icmp eq i32* %393, %394
  br i1 %check_cmp99, label %395, label %checkBb100

checkBb100:                                       ; preds = %385
  call void @check_flag()
  br label %395

; <label>:395                                     ; preds = %checkBb100, %385
  store i32 %386, i32* %393, align 4, !llfi_index !604
  %396 = load i32* %i, align 4, !llfi_index !605
  %397 = load i32* %i, align 4, !llfi_index !605
  %398 = sext i32 %396 to i64, !llfi_index !606
  %399 = sext i32 %397 to i64, !llfi_index !606
  %400 = load %struct.OptionData_** @data, align 8, !llfi_index !607
  %401 = load %struct.OptionData_** @data, align 8, !llfi_index !607
  %402 = getelementptr inbounds %struct.OptionData_* %400, i64 %398, !llfi_index !608
  %403 = getelementptr inbounds %struct.OptionData_* %401, i64 %399, !llfi_index !608
  %404 = getelementptr inbounds %struct.OptionData_* %402, i32 0, i32 0, !llfi_index !609
  %405 = getelementptr inbounds %struct.OptionData_* %403, i32 0, i32 0, !llfi_index !609
  %406 = load float* %404, align 4, !llfi_index !610
  %407 = load float* %405, align 4, !llfi_index !610
  %check_cmp101 = fcmp ueq float %406, %407
  br i1 %check_cmp101, label %408, label %checkBb102

checkBb102:                                       ; preds = %395
  call void @check_flag()
  br label %408

; <label>:408                                     ; preds = %checkBb102, %395
  %409 = load i32* %i, align 4, !llfi_index !611
  %410 = load i32* %i, align 4, !llfi_index !611
  %411 = sext i32 %409 to i64, !llfi_index !612
  %412 = sext i32 %410 to i64, !llfi_index !612
  %413 = load float** @sptprice, align 8, !llfi_index !613
  %414 = load float** @sptprice, align 8, !llfi_index !613
  %415 = getelementptr inbounds float* %413, i64 %411, !llfi_index !614
  %416 = getelementptr inbounds float* %414, i64 %412, !llfi_index !614
  %check_cmp103 = icmp eq float* %415, %416
  br i1 %check_cmp103, label %417, label %checkBb104

checkBb104:                                       ; preds = %408
  call void @check_flag()
  br label %417

; <label>:417                                     ; preds = %checkBb104, %408
  store float %406, float* %415, align 4, !llfi_index !615
  %418 = load i32* %i, align 4, !llfi_index !616
  %419 = load i32* %i, align 4, !llfi_index !616
  %420 = sext i32 %418 to i64, !llfi_index !617
  %421 = sext i32 %419 to i64, !llfi_index !617
  %422 = load %struct.OptionData_** @data, align 8, !llfi_index !618
  %423 = load %struct.OptionData_** @data, align 8, !llfi_index !618
  %424 = getelementptr inbounds %struct.OptionData_* %422, i64 %420, !llfi_index !619
  %425 = getelementptr inbounds %struct.OptionData_* %423, i64 %421, !llfi_index !619
  %426 = getelementptr inbounds %struct.OptionData_* %424, i32 0, i32 1, !llfi_index !620
  %427 = getelementptr inbounds %struct.OptionData_* %425, i32 0, i32 1, !llfi_index !620
  %428 = load float* %426, align 4, !llfi_index !621
  %429 = load float* %427, align 4, !llfi_index !621
  %check_cmp105 = fcmp ueq float %428, %429
  br i1 %check_cmp105, label %430, label %checkBb106

checkBb106:                                       ; preds = %417
  call void @check_flag()
  br label %430

; <label>:430                                     ; preds = %checkBb106, %417
  %431 = load i32* %i, align 4, !llfi_index !622
  %432 = load i32* %i, align 4, !llfi_index !622
  %433 = sext i32 %431 to i64, !llfi_index !623
  %434 = sext i32 %432 to i64, !llfi_index !623
  %435 = load float** @strike, align 8, !llfi_index !624
  %436 = load float** @strike, align 8, !llfi_index !624
  %437 = getelementptr inbounds float* %435, i64 %433, !llfi_index !625
  %438 = getelementptr inbounds float* %436, i64 %434, !llfi_index !625
  %check_cmp107 = icmp eq float* %437, %438
  br i1 %check_cmp107, label %439, label %checkBb108

checkBb108:                                       ; preds = %430
  call void @check_flag()
  br label %439

; <label>:439                                     ; preds = %checkBb108, %430
  store float %428, float* %437, align 4, !llfi_index !626
  %440 = load i32* %i, align 4, !llfi_index !627
  %441 = load i32* %i, align 4, !llfi_index !627
  %442 = sext i32 %440 to i64, !llfi_index !628
  %443 = sext i32 %441 to i64, !llfi_index !628
  %444 = load %struct.OptionData_** @data, align 8, !llfi_index !629
  %445 = load %struct.OptionData_** @data, align 8, !llfi_index !629
  %446 = getelementptr inbounds %struct.OptionData_* %444, i64 %442, !llfi_index !630
  %447 = getelementptr inbounds %struct.OptionData_* %445, i64 %443, !llfi_index !630
  %448 = getelementptr inbounds %struct.OptionData_* %446, i32 0, i32 2, !llfi_index !631
  %449 = getelementptr inbounds %struct.OptionData_* %447, i32 0, i32 2, !llfi_index !631
  %450 = load float* %448, align 4, !llfi_index !632
  %451 = load float* %449, align 4, !llfi_index !632
  %check_cmp109 = fcmp ueq float %450, %451
  br i1 %check_cmp109, label %452, label %checkBb110

checkBb110:                                       ; preds = %439
  call void @check_flag()
  br label %452

; <label>:452                                     ; preds = %checkBb110, %439
  %453 = load i32* %i, align 4, !llfi_index !633
  %454 = load i32* %i, align 4, !llfi_index !633
  %455 = sext i32 %453 to i64, !llfi_index !634
  %456 = sext i32 %454 to i64, !llfi_index !634
  %457 = load float** @rate, align 8, !llfi_index !635
  %458 = load float** @rate, align 8, !llfi_index !635
  %459 = getelementptr inbounds float* %457, i64 %455, !llfi_index !636
  %460 = getelementptr inbounds float* %458, i64 %456, !llfi_index !636
  %check_cmp111 = icmp eq float* %459, %460
  br i1 %check_cmp111, label %461, label %checkBb112

checkBb112:                                       ; preds = %452
  call void @check_flag()
  br label %461

; <label>:461                                     ; preds = %checkBb112, %452
  store float %450, float* %459, align 4, !llfi_index !637
  %462 = load i32* %i, align 4, !llfi_index !638
  %463 = load i32* %i, align 4, !llfi_index !638
  %464 = sext i32 %462 to i64, !llfi_index !639
  %465 = sext i32 %463 to i64, !llfi_index !639
  %466 = load %struct.OptionData_** @data, align 8, !llfi_index !640
  %467 = load %struct.OptionData_** @data, align 8, !llfi_index !640
  %468 = getelementptr inbounds %struct.OptionData_* %466, i64 %464, !llfi_index !641
  %469 = getelementptr inbounds %struct.OptionData_* %467, i64 %465, !llfi_index !641
  %470 = getelementptr inbounds %struct.OptionData_* %468, i32 0, i32 4, !llfi_index !642
  %471 = getelementptr inbounds %struct.OptionData_* %469, i32 0, i32 4, !llfi_index !642
  %472 = load float* %470, align 4, !llfi_index !643
  %473 = load float* %471, align 4, !llfi_index !643
  %check_cmp113 = fcmp ueq float %472, %473
  br i1 %check_cmp113, label %474, label %checkBb114

checkBb114:                                       ; preds = %461
  call void @check_flag()
  br label %474

; <label>:474                                     ; preds = %checkBb114, %461
  %475 = load i32* %i, align 4, !llfi_index !644
  %476 = load i32* %i, align 4, !llfi_index !644
  %477 = sext i32 %475 to i64, !llfi_index !645
  %478 = sext i32 %476 to i64, !llfi_index !645
  %479 = load float** @volatility, align 8, !llfi_index !646
  %480 = load float** @volatility, align 8, !llfi_index !646
  %481 = getelementptr inbounds float* %479, i64 %477, !llfi_index !647
  %482 = getelementptr inbounds float* %480, i64 %478, !llfi_index !647
  %check_cmp115 = icmp eq float* %481, %482
  br i1 %check_cmp115, label %483, label %checkBb116

checkBb116:                                       ; preds = %474
  call void @check_flag()
  br label %483

; <label>:483                                     ; preds = %checkBb116, %474
  store float %472, float* %481, align 4, !llfi_index !648
  %484 = load i32* %i, align 4, !llfi_index !649
  %485 = load i32* %i, align 4, !llfi_index !649
  %486 = sext i32 %484 to i64, !llfi_index !650
  %487 = sext i32 %485 to i64, !llfi_index !650
  %488 = load %struct.OptionData_** @data, align 8, !llfi_index !651
  %489 = load %struct.OptionData_** @data, align 8, !llfi_index !651
  %490 = getelementptr inbounds %struct.OptionData_* %488, i64 %486, !llfi_index !652
  %491 = getelementptr inbounds %struct.OptionData_* %489, i64 %487, !llfi_index !652
  %492 = getelementptr inbounds %struct.OptionData_* %490, i32 0, i32 5, !llfi_index !653
  %493 = getelementptr inbounds %struct.OptionData_* %491, i32 0, i32 5, !llfi_index !653
  %494 = load float* %492, align 4, !llfi_index !654
  %495 = load float* %493, align 4, !llfi_index !654
  %check_cmp117 = fcmp ueq float %494, %495
  br i1 %check_cmp117, label %496, label %checkBb118

checkBb118:                                       ; preds = %483
  call void @check_flag()
  br label %496

; <label>:496                                     ; preds = %checkBb118, %483
  %497 = load i32* %i, align 4, !llfi_index !655
  %498 = load i32* %i, align 4, !llfi_index !655
  %499 = sext i32 %497 to i64, !llfi_index !656
  %500 = sext i32 %498 to i64, !llfi_index !656
  %501 = load float** @otime, align 8, !llfi_index !657
  %502 = load float** @otime, align 8, !llfi_index !657
  %503 = getelementptr inbounds float* %501, i64 %499, !llfi_index !658
  %504 = getelementptr inbounds float* %502, i64 %500, !llfi_index !658
  %check_cmp119 = icmp eq float* %503, %504
  br i1 %check_cmp119, label %505, label %checkBb120

checkBb120:                                       ; preds = %496
  call void @check_flag()
  br label %505

; <label>:505                                     ; preds = %checkBb120, %496
  store float %494, float* %503, align 4, !llfi_index !659
  br label %506, !llfi_index !660

; <label>:506                                     ; preds = %505
  %507 = load i32* %i, align 4, !llfi_index !661
  %508 = load i32* %i, align 4, !llfi_index !661
  %509 = add nsw i32 %507, 1, !llfi_index !662
  %510 = add nsw i32 %508, 1, !llfi_index !662
  %check_cmp121 = icmp eq i32 %509, %510
  br i1 %check_cmp121, label %511, label %checkBb122

checkBb122:                                       ; preds = %506
  call void @check_flag()
  br label %511

; <label>:511                                     ; preds = %checkBb122, %506
  store i32 %509, i32* %i, align 4, !llfi_index !663
  br label %360, !llfi_index !664

; <label>:512                                     ; preds = %367
  %513 = load i32* @numOptions, align 4, !llfi_index !665
  %514 = load i32* @numOptions, align 4, !llfi_index !665
  %515 = sext i32 %513 to i64, !llfi_index !666
  %516 = sext i32 %514 to i64, !llfi_index !666
  %517 = mul i64 %515, 40, !llfi_index !667
  %518 = mul i64 %516, 40, !llfi_index !667
  %check_cmp123 = icmp eq i64 %517, %518
  br i1 %check_cmp123, label %519, label %checkBb124

checkBb124:                                       ; preds = %512
  call void @check_flag()
  br label %519

; <label>:519                                     ; preds = %checkBb124, %512
  %520 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([18 x i8]* @.str12, i32 0, i32 0), i64 %517), !llfi_index !668
  store i32 0, i32* %tid, align 4, !llfi_index !669
  %521 = bitcast i32* %tid to i8*, !llfi_index !670
  %522 = bitcast i32* %tid to i8*, !llfi_index !670
  %check_cmp125 = icmp eq i8* %521, %522
  br i1 %check_cmp125, label %523, label %checkBb126

checkBb126:                                       ; preds = %519
  call void @check_flag()
  br label %523

; <label>:523                                     ; preds = %checkBb126, %519
  %524 = call i32 @bs_thread(i8* %521), !llfi_index !671
  %525 = load i8** %outputFile, align 8, !llfi_index !672
  %526 = load i8** %outputFile, align 8, !llfi_index !672
  %check_cmp127 = icmp eq i8* %525, %526
  br i1 %check_cmp127, label %527, label %checkBb128

checkBb128:                                       ; preds = %523
  call void @check_flag()
  br label %527

; <label>:527                                     ; preds = %checkBb128, %523
  %528 = call %struct._IO_FILE* @fopen(i8* %525, i8* getelementptr inbounds ([2 x i8]* @.str13, i32 0, i32 0)), !llfi_index !673
  store %struct._IO_FILE* %528, %struct._IO_FILE** %file, align 8, !llfi_index !674
  %529 = load %struct._IO_FILE** %file, align 8, !llfi_index !675
  %530 = load %struct._IO_FILE** %file, align 8, !llfi_index !675
  %531 = icmp eq %struct._IO_FILE* %529, null, !llfi_index !676
  %532 = icmp eq %struct._IO_FILE* %530, null, !llfi_index !676
  %check_cmp129 = icmp eq i1 %531, %532
  br i1 %check_cmp129, label %533, label %checkBb130

checkBb130:                                       ; preds = %527
  call void @check_flag()
  br label %533

; <label>:533                                     ; preds = %checkBb130, %527
  br i1 %531, label %534, label %539, !llfi_index !677

; <label>:534                                     ; preds = %533
  %535 = load i8** %outputFile, align 8, !llfi_index !678
  %536 = load i8** %outputFile, align 8, !llfi_index !678
  %check_cmp131 = icmp eq i8* %535, %536
  br i1 %check_cmp131, label %537, label %checkBb132

checkBb132:                                       ; preds = %534
  call void @check_flag()
  br label %537

; <label>:537                                     ; preds = %checkBb132, %534
  %538 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([34 x i8]* @.str3, i32 0, i32 0), i8* %535), !llfi_index !679
  call void @exit(i32 1) #6, !llfi_index !680
  unreachable, !llfi_index !681

; <label>:539                                     ; preds = %533
  %540 = load %struct._IO_FILE** %file, align 8, !llfi_index !682
  %541 = load %struct._IO_FILE** %file, align 8, !llfi_index !682
  %check_cmp133 = icmp eq %struct._IO_FILE* %540, %541
  br i1 %check_cmp133, label %542, label %checkBb134

checkBb134:                                       ; preds = %539
  call void @check_flag()
  br label %542

; <label>:542                                     ; preds = %checkBb134, %539
  %543 = load i32* @numOptions, align 4, !llfi_index !683
  %544 = load i32* @numOptions, align 4, !llfi_index !683
  %check_cmp135 = icmp eq i32 %543, %544
  br i1 %check_cmp135, label %545, label %checkBb136

checkBb136:                                       ; preds = %542
  call void @check_flag()
  br label %545

; <label>:545                                     ; preds = %checkBb136, %542
  %546 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %540, i8* getelementptr inbounds ([4 x i8]* @.str14, i32 0, i32 0), i32 %543), !llfi_index !684
  store i32 %546, i32* %rv, align 4, !llfi_index !685
  %547 = load i32* %rv, align 4, !llfi_index !686
  %548 = load i32* %rv, align 4, !llfi_index !686
  %549 = icmp slt i32 %547, 0, !llfi_index !687
  %550 = icmp slt i32 %548, 0, !llfi_index !687
  %check_cmp137 = icmp eq i1 %549, %550
  br i1 %check_cmp137, label %551, label %checkBb138

checkBb138:                                       ; preds = %545
  call void @check_flag()
  br label %551

; <label>:551                                     ; preds = %checkBb138, %545
  br i1 %549, label %552, label %561, !llfi_index !688

; <label>:552                                     ; preds = %551
  %553 = load i8** %outputFile, align 8, !llfi_index !689
  %554 = load i8** %outputFile, align 8, !llfi_index !689
  %check_cmp139 = icmp eq i8* %553, %554
  br i1 %check_cmp139, label %555, label %checkBb140

checkBb140:                                       ; preds = %552
  call void @check_flag()
  br label %555

; <label>:555                                     ; preds = %checkBb140, %552
  %556 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str15, i32 0, i32 0), i8* %553), !llfi_index !690
  %557 = load %struct._IO_FILE** %file, align 8, !llfi_index !691
  %558 = load %struct._IO_FILE** %file, align 8, !llfi_index !691
  %check_cmp141 = icmp eq %struct._IO_FILE* %557, %558
  br i1 %check_cmp141, label %559, label %checkBb142

checkBb142:                                       ; preds = %555
  call void @check_flag()
  br label %559

; <label>:559                                     ; preds = %checkBb142, %555
  %560 = call i32 @fclose(%struct._IO_FILE* %557), !llfi_index !692
  call void @exit(i32 1) #6, !llfi_index !693
  unreachable, !llfi_index !694

; <label>:561                                     ; preds = %551
  store i32 0, i32* %i, align 4, !llfi_index !695
  br label %562, !llfi_index !696

; <label>:562                                     ; preds = %608, %561
  %563 = load i32* %i, align 4, !llfi_index !697
  %564 = load i32* %i, align 4, !llfi_index !697
  %565 = load i32* @numOptions, align 4, !llfi_index !698
  %566 = load i32* @numOptions, align 4, !llfi_index !698
  %567 = icmp slt i32 %563, %565, !llfi_index !699
  %568 = icmp slt i32 %564, %566, !llfi_index !699
  %check_cmp143 = icmp eq i1 %567, %568
  br i1 %check_cmp143, label %569, label %checkBb144

checkBb144:                                       ; preds = %562
  call void @check_flag()
  br label %569

; <label>:569                                     ; preds = %checkBb144, %562
  br i1 %567, label %570, label %609, !llfi_index !700

; <label>:570                                     ; preds = %569
  %571 = load %struct._IO_FILE** %file, align 8, !llfi_index !701
  %572 = load %struct._IO_FILE** %file, align 8, !llfi_index !701
  %check_cmp145 = icmp eq %struct._IO_FILE* %571, %572
  br i1 %check_cmp145, label %573, label %checkBb146

checkBb146:                                       ; preds = %570
  call void @check_flag()
  br label %573

; <label>:573                                     ; preds = %checkBb146, %570
  %574 = load i32* %i, align 4, !llfi_index !702
  %575 = load i32* %i, align 4, !llfi_index !702
  %576 = sext i32 %574 to i64, !llfi_index !703
  %577 = sext i32 %575 to i64, !llfi_index !703
  %578 = load float** @prices, align 8, !llfi_index !704
  %579 = load float** @prices, align 8, !llfi_index !704
  %580 = getelementptr inbounds float* %578, i64 %576, !llfi_index !705
  %581 = getelementptr inbounds float* %579, i64 %577, !llfi_index !705
  %582 = load float* %580, align 4, !llfi_index !706
  %583 = load float* %581, align 4, !llfi_index !706
  %584 = fpext float %582 to double, !llfi_index !707
  %585 = fpext float %583 to double, !llfi_index !707
  %check_cmp147 = fcmp ueq double %584, %585
  br i1 %check_cmp147, label %586, label %checkBb148

checkBb148:                                       ; preds = %573
  call void @check_flag()
  br label %586

; <label>:586                                     ; preds = %checkBb148, %573
  %587 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %571, i8* getelementptr inbounds ([7 x i8]* @.str16, i32 0, i32 0), double %584), !llfi_index !708
  store i32 %587, i32* %rv, align 4, !llfi_index !709
  %588 = load i32* %rv, align 4, !llfi_index !710
  %589 = load i32* %rv, align 4, !llfi_index !710
  %590 = icmp slt i32 %588, 0, !llfi_index !711
  %591 = icmp slt i32 %589, 0, !llfi_index !711
  %check_cmp149 = icmp eq i1 %590, %591
  br i1 %check_cmp149, label %592, label %checkBb150

checkBb150:                                       ; preds = %586
  call void @check_flag()
  br label %592

; <label>:592                                     ; preds = %checkBb150, %586
  br i1 %590, label %593, label %602, !llfi_index !712

; <label>:593                                     ; preds = %592
  %594 = load i8** %outputFile, align 8, !llfi_index !713
  %595 = load i8** %outputFile, align 8, !llfi_index !713
  %check_cmp151 = icmp eq i8* %594, %595
  br i1 %check_cmp151, label %596, label %checkBb152

checkBb152:                                       ; preds = %593
  call void @check_flag()
  br label %596

; <label>:596                                     ; preds = %checkBb152, %593
  %597 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str15, i32 0, i32 0), i8* %594), !llfi_index !714
  %598 = load %struct._IO_FILE** %file, align 8, !llfi_index !715
  %599 = load %struct._IO_FILE** %file, align 8, !llfi_index !715
  %check_cmp153 = icmp eq %struct._IO_FILE* %598, %599
  br i1 %check_cmp153, label %600, label %checkBb154

checkBb154:                                       ; preds = %596
  call void @check_flag()
  br label %600

; <label>:600                                     ; preds = %checkBb154, %596
  %601 = call i32 @fclose(%struct._IO_FILE* %598), !llfi_index !716
  call void @exit(i32 1) #6, !llfi_index !717
  unreachable, !llfi_index !718

; <label>:602                                     ; preds = %592
  br label %603, !llfi_index !719

; <label>:603                                     ; preds = %602
  %604 = load i32* %i, align 4, !llfi_index !720
  %605 = load i32* %i, align 4, !llfi_index !720
  %606 = add nsw i32 %604, 1, !llfi_index !721
  %607 = add nsw i32 %605, 1, !llfi_index !721
  %check_cmp155 = icmp eq i32 %606, %607
  br i1 %check_cmp155, label %608, label %checkBb156

checkBb156:                                       ; preds = %603
  call void @check_flag()
  br label %608

; <label>:608                                     ; preds = %checkBb156, %603
  store i32 %606, i32* %i, align 4, !llfi_index !722
  br label %562, !llfi_index !723

; <label>:609                                     ; preds = %569
  %610 = load %struct._IO_FILE** %file, align 8, !llfi_index !724
  %611 = load %struct._IO_FILE** %file, align 8, !llfi_index !724
  %check_cmp157 = icmp eq %struct._IO_FILE* %610, %611
  br i1 %check_cmp157, label %612, label %checkBb158

checkBb158:                                       ; preds = %609
  call void @check_flag()
  br label %612

; <label>:612                                     ; preds = %checkBb158, %609
  %613 = call i32 @fclose(%struct._IO_FILE* %610), !llfi_index !725
  store i32 %613, i32* %rv, align 4, !llfi_index !726
  %614 = load i32* %rv, align 4, !llfi_index !727
  %615 = load i32* %rv, align 4, !llfi_index !727
  %616 = icmp ne i32 %614, 0, !llfi_index !728
  %617 = icmp ne i32 %615, 0, !llfi_index !728
  %check_cmp159 = icmp eq i1 %616, %617
  br i1 %check_cmp159, label %618, label %checkBb160

checkBb160:                                       ; preds = %612
  call void @check_flag()
  br label %618

; <label>:618                                     ; preds = %checkBb160, %612
  br i1 %616, label %619, label %624, !llfi_index !729

; <label>:619                                     ; preds = %618
  %620 = load i8** %outputFile, align 8, !llfi_index !730
  %621 = load i8** %outputFile, align 8, !llfi_index !730
  %check_cmp161 = icmp eq i8* %620, %621
  br i1 %check_cmp161, label %622, label %checkBb162

checkBb162:                                       ; preds = %619
  call void @check_flag()
  br label %622

; <label>:622                                     ; preds = %checkBb162, %619
  %623 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([35 x i8]* @.str9, i32 0, i32 0), i8* %620), !llfi_index !731
  call void @exit(i32 1) #6, !llfi_index !732
  unreachable, !llfi_index !733

; <label>:624                                     ; preds = %618
  %625 = load %struct.OptionData_** @data, align 8, !llfi_index !734
  %626 = load %struct.OptionData_** @data, align 8, !llfi_index !734
  %627 = bitcast %struct.OptionData_* %625 to i8*, !llfi_index !735
  %628 = bitcast %struct.OptionData_* %626 to i8*, !llfi_index !735
  %check_cmp163 = icmp eq i8* %627, %628
  br i1 %check_cmp163, label %629, label %checkBb164

checkBb164:                                       ; preds = %624
  call void @check_flag()
  br label %629

; <label>:629                                     ; preds = %checkBb164, %624
  call void @free(i8* %627) #5, !llfi_index !736
  %630 = load float** @prices, align 8, !llfi_index !737
  %631 = load float** @prices, align 8, !llfi_index !737
  %632 = bitcast float* %630 to i8*, !llfi_index !738
  %633 = bitcast float* %631 to i8*, !llfi_index !738
  %check_cmp165 = icmp eq i8* %632, %633
  br i1 %check_cmp165, label %634, label %checkBb166

checkBb166:                                       ; preds = %629
  call void @check_flag()
  br label %634

; <label>:634                                     ; preds = %checkBb166, %629
  call void @free(i8* %632) #5, !llfi_index !739
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

declare void @dumpIndex(i64)

; Function Attrs: nounwind uwtable
define void @check_flag() #0 {
  %1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([59 x i8]* @.str17, i32 0, i32 0))
  call void @exit(i32 99) #6
  unreachable
                                                  ; No predecessors!
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
