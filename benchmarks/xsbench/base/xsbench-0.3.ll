; ModuleID = 'temp2.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.GridPoint = type { double, i32* }
%struct.NuclideGridPoint = type { double, double, double, double, double, double }
%struct.Inputs = type { i32, i64, i64, i32, i8* }
%struct.timeval = type { i64, i64 }
%struct.timezone = type { i32, i32 }

@.str = private unnamed_addr constant [37 x i8] c"Generating Unionized Energy Grid...\0A\00", align 1
@.str1 = private unnamed_addr constant [42 x i8] c"Copying and Sorting all nuclide grids...\0A\00", align 1
@.str2 = private unnamed_addr constant [41 x i8] c"Assigning energies to unionized grid...\0A\00", align 1
@stderr = external global %struct._IO_FILE*
@.str3 = private unnamed_addr constant [24 x i8] c"ERROR - Out Of Memory!\0A\00", align 1
@.str4 = private unnamed_addr constant [48 x i8] c"Assigning pointers to Unionized Energy Grid...\0A\00", align 1
@.str5 = private unnamed_addr constant [46 x i8] c"\0DAligning Unionized Grid...(%.0lf%% complete)\00", align 1
@.str6 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str7 = private unnamed_addr constant [488 x i8] c"                   __   __ ___________                 _                        \0A                   \5C \5C / //  ___| ___ \5C               | |                       \0A                    \5C V / \5C `--.| |_/ / ___ _ __   ___| |__                     \0A                    /   \5C  `--. \5C ___ \5C/ _ \5C '_ \5C / __| '_ \5C                    \0A                   / /^\5C \5C/\5C__/ / |_/ /  __/ | | | (__| | | |                   \0A                   \5C/   \5C/\5C____/\5C____/ \5C___|_| |_|\5C___|_| |_|                   \0A\0A\00", align 1
@.str18 = private unnamed_addr constant [41 x i8] c"Developed at Argonne National Laboratory\00", align 1
@.str29 = private unnamed_addr constant [12 x i8] c"Version: %d\00", align 1
@.str310 = private unnamed_addr constant [2 x i8] c" \00", align 1
@stdout = external global %struct._IO_FILE*
@.str411 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str512 = private unnamed_addr constant [8 x i8] c"RESULTS\00", align 1
@.str613 = private unnamed_addr constant [17 x i8] c"Threads:     %d\0A\00", align 1
@.str714 = private unnamed_addr constant [14 x i8] c"Lookups:     \00", align 1
@.str8 = private unnamed_addr constant [29 x i8] c"Verification checksum: %llu\0A\00", align 1
@.str9 = private unnamed_addr constant [12 x i8] c"results.txt\00", align 1
@.str10 = private unnamed_addr constant [2 x i8] c"a\00", align 1
@.str11 = private unnamed_addr constant [7 x i8] c"%d\09%d\0A\00", align 1
@.str12 = private unnamed_addr constant [14 x i8] c"INPUT SUMMARY\00", align 1
@.str13 = private unnamed_addr constant [34 x i8] c"Verification Mode:            on\0A\00", align 1
@.str14 = private unnamed_addr constant [34 x i8] c"Materials:                    %d\0A\00", align 1
@.str15 = private unnamed_addr constant [34 x i8] c"H-M Benchmark Size:           %s\0A\00", align 1
@.str16 = private unnamed_addr constant [35 x i8] c"Total Nuclides:               %ld\0A\00", align 1
@.str17 = private unnamed_addr constant [31 x i8] c"Gridpoints (per Nuclide):     \00", align 1
@.str1815 = private unnamed_addr constant [31 x i8] c"Unionized Energy Gridpoints:  \00", align 1
@.str19 = private unnamed_addr constant [31 x i8] c"XS Lookups:                   \00", align 1
@.str20 = private unnamed_addr constant [34 x i8] c"Threads:                      %d\0A\00", align 1
@.str21 = private unnamed_addr constant [31 x i8] c"Est. Memory Usage (MB):       \00", align 1
@.str22 = private unnamed_addr constant [15 x i8] c"INITIALIZATION\00", align 1
@.str23 = private unnamed_addr constant [82 x i8] c"================================================================================\0A\00", align 1
@.str24 = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.str25 = private unnamed_addr constant [11 x i8] c"%ld,%03ld\0A\00", align 1
@.str26 = private unnamed_addr constant [17 x i8] c"%ld,%03ld,%03ld\0A\00", align 1
@.str27 = private unnamed_addr constant [23 x i8] c"%ld,%03ld,%03ld,%03ld\0A\00", align 1
@.str28 = private unnamed_addr constant [28 x i8] c"Usage: ./XSBench <options>\0A\00", align 1
@.str2916 = private unnamed_addr constant [18 x i8] c"Options include:\0A\00", align 1
@.str30 = private unnamed_addr constant [52 x i8] c"  -t <threads>     Number of OpenMP threads to run\0A\00", align 1
@.str31 = private unnamed_addr constant [73 x i8] c"  -s <size>        Size of H-M Benchmark to run (small, large, XL, XXL)\0A\00", align 1
@.str32 = private unnamed_addr constant [77 x i8] c"  -g <gridpoints>  Number of gridpoints per nuclide (overrides -s defaults)\0A\00", align 1
@.str33 = private unnamed_addr constant [57 x i8] c"  -l <lookups>     Number of Cross-section (XS) lookups\0A\00", align 1
@.str34 = private unnamed_addr constant [48 x i8] c"Default is equivalent to: -s large -l 15000000\0A\00", align 1
@.str35 = private unnamed_addr constant [55 x i8] c"See readme for full description of default run values\0A\00", align 1
@.str36 = private unnamed_addr constant [3 x i8] c"-t\00", align 1
@.str37 = private unnamed_addr constant [3 x i8] c"-g\00", align 1
@.str38 = private unnamed_addr constant [3 x i8] c"-l\00", align 1
@.str39 = private unnamed_addr constant [3 x i8] c"-s\00", align 1
@.str40 = private unnamed_addr constant [6 x i8] c"small\00", align 1
@.str41 = private unnamed_addr constant [6 x i8] c"large\00", align 1
@.str42 = private unnamed_addr constant [3 x i8] c"XL\00", align 1
@.str43 = private unnamed_addr constant [4 x i8] c"XXL\00", align 1
@.str44 = private unnamed_addr constant [36 x i8] c"Generating Nuclide Energy Grids...\0A\00", align 1
@.str145 = private unnamed_addr constant [33 x i8] c"Sorting Nuclide Energy Grids...\0A\00", align 1
@.str246 = private unnamed_addr constant [17 x i8] c"Loading Mats...\0A\00", align 1
@.str347 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str448 = private unnamed_addr constant [11 x i8] c"SIMULATION\00", align 1
@.str549 = private unnamed_addr constant [41 x i8] c"\0DCalculating XS's... (%.0lf%% completed)\00", align 1
@.str650 = private unnamed_addr constant [39 x i8] c"%.5lf %d %.5lf %.5lf %.5lf %.5lf %.5lf\00", align 1
@.str751 = private unnamed_addr constant [22 x i8] c"Simulation complete.\0A\00", align 1
@load_mats.mats0_Sml = private unnamed_addr constant [34 x i32] [i32 58, i32 59, i32 60, i32 61, i32 40, i32 42, i32 43, i32 44, i32 45, i32 46, i32 1, i32 2, i32 3, i32 7, i32 8, i32 9, i32 10, i32 29, i32 57, i32 47, i32 48, i32 0, i32 62, i32 15, i32 33, i32 34, i32 52, i32 53, i32 54, i32 55, i32 56, i32 18, i32 23, i32 41], align 16
@load_mats.mats0_Lrg = private unnamed_addr constant [321 x i32] [i32 58, i32 59, i32 60, i32 61, i32 40, i32 42, i32 43, i32 44, i32 45, i32 46, i32 1, i32 2, i32 3, i32 7, i32 8, i32 9, i32 10, i32 29, i32 57, i32 47, i32 48, i32 0, i32 62, i32 15, i32 33, i32 34, i32 52, i32 53, i32 54, i32 55, i32 56, i32 18, i32 23, i32 41, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0], align 16
@load_mats.mats1 = private unnamed_addr constant [5 x i32] [i32 63, i32 64, i32 65, i32 66, i32 67], align 16
@load_mats.mats2 = private unnamed_addr constant [4 x i32] [i32 24, i32 41, i32 4, i32 5], align 16
@load_mats.mats3 = private unnamed_addr constant [4 x i32] [i32 24, i32 41, i32 4, i32 5], align 16
@load_mats.mats4 = private unnamed_addr constant [27 x i32] [i32 19, i32 20, i32 21, i32 22, i32 35, i32 36, i32 37, i32 38, i32 39, i32 25, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 26, i32 49, i32 50, i32 51, i32 11, i32 12, i32 13, i32 14, i32 6, i32 16, i32 17], align 16
@load_mats.mats5 = private unnamed_addr constant [21 x i32] [i32 24, i32 41, i32 4, i32 5, i32 19, i32 20, i32 21, i32 22, i32 35, i32 36, i32 37, i32 38, i32 39, i32 25, i32 49, i32 50, i32 51, i32 11, i32 12, i32 13, i32 14], align 16
@load_mats.mats6 = private unnamed_addr constant [21 x i32] [i32 24, i32 41, i32 4, i32 5, i32 19, i32 20, i32 21, i32 22, i32 35, i32 36, i32 37, i32 38, i32 39, i32 25, i32 49, i32 50, i32 51, i32 11, i32 12, i32 13, i32 14], align 16
@load_mats.mats7 = private unnamed_addr constant [21 x i32] [i32 24, i32 41, i32 4, i32 5, i32 19, i32 20, i32 21, i32 22, i32 35, i32 36, i32 37, i32 38, i32 39, i32 25, i32 49, i32 50, i32 51, i32 11, i32 12, i32 13, i32 14], align 16
@load_mats.mats8 = private unnamed_addr constant [21 x i32] [i32 24, i32 41, i32 4, i32 5, i32 19, i32 20, i32 21, i32 22, i32 35, i32 36, i32 37, i32 38, i32 39, i32 25, i32 49, i32 50, i32 51, i32 11, i32 12, i32 13, i32 14], align 16
@load_mats.mats9 = private unnamed_addr constant [21 x i32] [i32 24, i32 41, i32 4, i32 5, i32 19, i32 20, i32 21, i32 22, i32 35, i32 36, i32 37, i32 38, i32 39, i32 25, i32 49, i32 50, i32 51, i32 11, i32 12, i32 13, i32 14], align 16
@load_mats.mats10 = private unnamed_addr constant [9 x i32] [i32 24, i32 41, i32 4, i32 5, i32 63, i32 64, i32 65, i32 66, i32 67], align 16
@load_mats.mats11 = private unnamed_addr constant [9 x i32] [i32 24, i32 41, i32 4, i32 5, i32 63, i32 64, i32 65, i32 66, i32 67], align 16
@rn_v.seed = internal global i64 1337, align 8
@.str60 = private unnamed_addr constant [12 x i8] c"XS_data.dat\00", align 1
@.str161 = private unnamed_addr constant [3 x i8] c"wb\00", align 1
@.str262 = private unnamed_addr constant [3 x i8] c"rb\00", align 1
@global_var1 = global i64 0, align 8
@global_var2 = global i64 0, align 8

; Function Attrs: nounwind uwtable
define void @calculate_micro_xs(double %p_energy, i32 %nuc, i64 %n_isotopes, i64 %n_gridpoints, %struct.GridPoint* noalias %energy_grid, %struct.NuclideGridPoint** noalias %nuclide_grids, i32 %idx, double* noalias %xs_vector) #0 {
  %1 = alloca double, align 8, !llfi_index !1
  %2 = alloca i32, align 4, !llfi_index !2
  %3 = alloca i64, align 8, !llfi_index !3
  %4 = alloca i64, align 8, !llfi_index !4
  %5 = alloca %struct.GridPoint*, align 8, !llfi_index !5
  %6 = alloca %struct.NuclideGridPoint**, align 8, !llfi_index !6
  %7 = alloca i32, align 4, !llfi_index !7
  %8 = alloca double*, align 8, !llfi_index !8
  %f = alloca double, align 8, !llfi_index !9
  %low = alloca %struct.NuclideGridPoint*, align 8, !llfi_index !10
  %high = alloca %struct.NuclideGridPoint*, align 8, !llfi_index !11
  store double %p_energy, double* %1, align 8, !llfi_index !12
  store i32 %nuc, i32* %2, align 4, !llfi_index !13
  store i64 %n_isotopes, i64* %3, align 8, !llfi_index !14
  store i64 %n_gridpoints, i64* %4, align 8, !llfi_index !15
  store %struct.GridPoint* %energy_grid, %struct.GridPoint** %5, align 8, !llfi_index !16
  store %struct.NuclideGridPoint** %nuclide_grids, %struct.NuclideGridPoint*** %6, align 8, !llfi_index !17
  store i32 %idx, i32* %7, align 4, !llfi_index !18
  store double* %xs_vector, double** %8, align 8, !llfi_index !19
  %9 = load i32* %2, align 4, !llfi_index !20
  %10 = load i32* %2, align 4, !llfi_index !20
  %11 = sext i32 %9 to i64, !llfi_index !21
  %12 = sext i32 %10 to i64, !llfi_index !21
  %13 = load i32* %7, align 4, !llfi_index !22
  %14 = load i32* %7, align 4, !llfi_index !22
  %15 = sext i32 %13 to i64, !llfi_index !23
  %16 = sext i32 %14 to i64, !llfi_index !23
  %17 = load %struct.GridPoint** %5, align 8, !llfi_index !24
  %18 = load %struct.GridPoint** %5, align 8, !llfi_index !24
  %19 = getelementptr inbounds %struct.GridPoint* %17, i64 %15, !llfi_index !25
  %20 = getelementptr inbounds %struct.GridPoint* %18, i64 %16, !llfi_index !25
  %21 = getelementptr inbounds %struct.GridPoint* %19, i32 0, i32 1, !llfi_index !26
  %22 = getelementptr inbounds %struct.GridPoint* %20, i32 0, i32 1, !llfi_index !26
  %23 = load i32** %21, align 8, !llfi_index !27
  %24 = load i32** %22, align 8, !llfi_index !27
  %25 = getelementptr inbounds i32* %23, i64 %11, !llfi_index !28
  %26 = getelementptr inbounds i32* %24, i64 %12, !llfi_index !28
  %27 = load i32* %25, align 4, !llfi_index !29
  %28 = load i32* %26, align 4, !llfi_index !29
  %29 = sext i32 %27 to i64, !llfi_index !30
  %30 = sext i32 %28 to i64, !llfi_index !30
  %31 = load i64* %4, align 8, !llfi_index !31
  %32 = load i64* %4, align 8, !llfi_index !31
  %33 = sub nsw i64 %31, 1, !llfi_index !32
  %34 = sub nsw i64 %32, 1, !llfi_index !32
  %35 = icmp eq i64 %29, %33, !llfi_index !33
  %36 = icmp eq i64 %30, %34, !llfi_index !33
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %35, i1 %36)
  br i1 %35, label %37, label %74, !llfi_index !34

; <label>:37                                      ; preds = %0
  %38 = load i32* %2, align 4, !llfi_index !35
  %39 = load i32* %2, align 4, !llfi_index !35
  %40 = sext i32 %38 to i64, !llfi_index !36
  %41 = sext i32 %39 to i64, !llfi_index !36
  %42 = load i32* %7, align 4, !llfi_index !37
  %43 = load i32* %7, align 4, !llfi_index !37
  %44 = sext i32 %42 to i64, !llfi_index !38
  %45 = sext i32 %43 to i64, !llfi_index !38
  %46 = load %struct.GridPoint** %5, align 8, !llfi_index !39
  %47 = load %struct.GridPoint** %5, align 8, !llfi_index !39
  %48 = getelementptr inbounds %struct.GridPoint* %46, i64 %44, !llfi_index !40
  %49 = getelementptr inbounds %struct.GridPoint* %47, i64 %45, !llfi_index !40
  %50 = getelementptr inbounds %struct.GridPoint* %48, i32 0, i32 1, !llfi_index !41
  %51 = getelementptr inbounds %struct.GridPoint* %49, i32 0, i32 1, !llfi_index !41
  %52 = load i32** %50, align 8, !llfi_index !42
  %53 = load i32** %51, align 8, !llfi_index !42
  %54 = getelementptr inbounds i32* %52, i64 %40, !llfi_index !43
  %55 = getelementptr inbounds i32* %53, i64 %41, !llfi_index !43
  %56 = load i32* %54, align 4, !llfi_index !44
  %57 = load i32* %55, align 4, !llfi_index !44
  %58 = sub nsw i32 %56, 1, !llfi_index !45
  %59 = sub nsw i32 %57, 1, !llfi_index !45
  %60 = sext i32 %58 to i64, !llfi_index !46
  %61 = sext i32 %59 to i64, !llfi_index !46
  %62 = load i32* %2, align 4, !llfi_index !47
  %63 = load i32* %2, align 4, !llfi_index !47
  %64 = sext i32 %62 to i64, !llfi_index !48
  %65 = sext i32 %63 to i64, !llfi_index !48
  %66 = load %struct.NuclideGridPoint*** %6, align 8, !llfi_index !49
  %67 = load %struct.NuclideGridPoint*** %6, align 8, !llfi_index !49
  %68 = getelementptr inbounds %struct.NuclideGridPoint** %66, i64 %64, !llfi_index !50
  %69 = getelementptr inbounds %struct.NuclideGridPoint** %67, i64 %65, !llfi_index !50
  %70 = load %struct.NuclideGridPoint** %68, align 8, !llfi_index !51
  %71 = load %struct.NuclideGridPoint** %69, align 8, !llfi_index !51
  %72 = getelementptr inbounds %struct.NuclideGridPoint* %70, i64 %60, !llfi_index !52
  %73 = getelementptr inbounds %struct.NuclideGridPoint* %71, i64 %61, !llfi_index !52
  call void bitcast (void (i64, i64)* @global_add to void (%struct.NuclideGridPoint*, %struct.NuclideGridPoint*)*)(%struct.NuclideGridPoint* %72, %struct.NuclideGridPoint* %73)
  store %struct.NuclideGridPoint* %72, %struct.NuclideGridPoint** %low, align 8, !llfi_index !53
  br label %109, !llfi_index !54

; <label>:74                                      ; preds = %0
  %75 = load i32* %2, align 4, !llfi_index !55
  %76 = load i32* %2, align 4, !llfi_index !55
  %77 = sext i32 %75 to i64, !llfi_index !56
  %78 = sext i32 %76 to i64, !llfi_index !56
  %79 = load i32* %7, align 4, !llfi_index !57
  %80 = load i32* %7, align 4, !llfi_index !57
  %81 = sext i32 %79 to i64, !llfi_index !58
  %82 = sext i32 %80 to i64, !llfi_index !58
  %83 = load %struct.GridPoint** %5, align 8, !llfi_index !59
  %84 = load %struct.GridPoint** %5, align 8, !llfi_index !59
  %85 = getelementptr inbounds %struct.GridPoint* %83, i64 %81, !llfi_index !60
  %86 = getelementptr inbounds %struct.GridPoint* %84, i64 %82, !llfi_index !60
  %87 = getelementptr inbounds %struct.GridPoint* %85, i32 0, i32 1, !llfi_index !61
  %88 = getelementptr inbounds %struct.GridPoint* %86, i32 0, i32 1, !llfi_index !61
  %89 = load i32** %87, align 8, !llfi_index !62
  %90 = load i32** %88, align 8, !llfi_index !62
  %91 = getelementptr inbounds i32* %89, i64 %77, !llfi_index !63
  %92 = getelementptr inbounds i32* %90, i64 %78, !llfi_index !63
  %93 = load i32* %91, align 4, !llfi_index !64
  %94 = load i32* %92, align 4, !llfi_index !64
  %95 = sext i32 %93 to i64, !llfi_index !65
  %96 = sext i32 %94 to i64, !llfi_index !65
  %97 = load i32* %2, align 4, !llfi_index !66
  %98 = load i32* %2, align 4, !llfi_index !66
  %99 = sext i32 %97 to i64, !llfi_index !67
  %100 = sext i32 %98 to i64, !llfi_index !67
  %101 = load %struct.NuclideGridPoint*** %6, align 8, !llfi_index !68
  %102 = load %struct.NuclideGridPoint*** %6, align 8, !llfi_index !68
  %103 = getelementptr inbounds %struct.NuclideGridPoint** %101, i64 %99, !llfi_index !69
  %104 = getelementptr inbounds %struct.NuclideGridPoint** %102, i64 %100, !llfi_index !69
  %105 = load %struct.NuclideGridPoint** %103, align 8, !llfi_index !70
  %106 = load %struct.NuclideGridPoint** %104, align 8, !llfi_index !70
  %107 = getelementptr inbounds %struct.NuclideGridPoint* %105, i64 %95, !llfi_index !71
  %108 = getelementptr inbounds %struct.NuclideGridPoint* %106, i64 %96, !llfi_index !71
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (%struct.NuclideGridPoint*, %struct.NuclideGridPoint*)*)(%struct.NuclideGridPoint* %107, %struct.NuclideGridPoint* %108)
  store %struct.NuclideGridPoint* %107, %struct.NuclideGridPoint** %low, align 8, !llfi_index !72
  br label %109, !llfi_index !73

; <label>:109                                     ; preds = %74, %37
  %110 = load %struct.NuclideGridPoint** %low, align 8, !llfi_index !74
  %111 = load %struct.NuclideGridPoint** %low, align 8, !llfi_index !74
  %112 = getelementptr inbounds %struct.NuclideGridPoint* %110, i64 1, !llfi_index !75
  %113 = getelementptr inbounds %struct.NuclideGridPoint* %111, i64 1, !llfi_index !75
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (%struct.NuclideGridPoint*, %struct.NuclideGridPoint*)*)(%struct.NuclideGridPoint* %112, %struct.NuclideGridPoint* %113)
  store %struct.NuclideGridPoint* %112, %struct.NuclideGridPoint** %high, align 8, !llfi_index !76
  %114 = load %struct.NuclideGridPoint** %high, align 8, !llfi_index !77
  %115 = load %struct.NuclideGridPoint** %high, align 8, !llfi_index !77
  %116 = getelementptr inbounds %struct.NuclideGridPoint* %114, i32 0, i32 0, !llfi_index !78
  %117 = getelementptr inbounds %struct.NuclideGridPoint* %115, i32 0, i32 0, !llfi_index !78
  %118 = load double* %116, align 8, !llfi_index !79
  %119 = load double* %117, align 8, !llfi_index !79
  %120 = load double* %1, align 8, !llfi_index !80
  %121 = load double* %1, align 8, !llfi_index !80
  %122 = fsub double %118, %120, !llfi_index !81
  %123 = fsub double %119, %121, !llfi_index !81
  %124 = load %struct.NuclideGridPoint** %high, align 8, !llfi_index !82
  %125 = load %struct.NuclideGridPoint** %high, align 8, !llfi_index !82
  %126 = getelementptr inbounds %struct.NuclideGridPoint* %124, i32 0, i32 0, !llfi_index !83
  %127 = getelementptr inbounds %struct.NuclideGridPoint* %125, i32 0, i32 0, !llfi_index !83
  %128 = load double* %126, align 8, !llfi_index !84
  %129 = load double* %127, align 8, !llfi_index !84
  %130 = load %struct.NuclideGridPoint** %low, align 8, !llfi_index !85
  %131 = load %struct.NuclideGridPoint** %low, align 8, !llfi_index !85
  %132 = getelementptr inbounds %struct.NuclideGridPoint* %130, i32 0, i32 0, !llfi_index !86
  %133 = getelementptr inbounds %struct.NuclideGridPoint* %131, i32 0, i32 0, !llfi_index !86
  %134 = load double* %132, align 8, !llfi_index !87
  %135 = load double* %133, align 8, !llfi_index !87
  %136 = fsub double %128, %134, !llfi_index !88
  %137 = fsub double %129, %135, !llfi_index !88
  %138 = fdiv double %122, %136, !llfi_index !89
  %139 = fdiv double %123, %137, !llfi_index !89
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %138, double %139)
  store double %138, double* %f, align 8, !llfi_index !90
  %140 = load %struct.NuclideGridPoint** %high, align 8, !llfi_index !91
  %141 = load %struct.NuclideGridPoint** %high, align 8, !llfi_index !91
  %142 = getelementptr inbounds %struct.NuclideGridPoint* %140, i32 0, i32 1, !llfi_index !92
  %143 = getelementptr inbounds %struct.NuclideGridPoint* %141, i32 0, i32 1, !llfi_index !92
  %144 = load double* %142, align 8, !llfi_index !93
  %145 = load double* %143, align 8, !llfi_index !93
  %146 = load double* %f, align 8, !llfi_index !94
  %147 = load double* %f, align 8, !llfi_index !94
  %148 = load %struct.NuclideGridPoint** %high, align 8, !llfi_index !95
  %149 = load %struct.NuclideGridPoint** %high, align 8, !llfi_index !95
  %150 = getelementptr inbounds %struct.NuclideGridPoint* %148, i32 0, i32 1, !llfi_index !96
  %151 = getelementptr inbounds %struct.NuclideGridPoint* %149, i32 0, i32 1, !llfi_index !96
  %152 = load double* %150, align 8, !llfi_index !97
  %153 = load double* %151, align 8, !llfi_index !97
  %154 = load %struct.NuclideGridPoint** %low, align 8, !llfi_index !98
  %155 = load %struct.NuclideGridPoint** %low, align 8, !llfi_index !98
  %156 = getelementptr inbounds %struct.NuclideGridPoint* %154, i32 0, i32 1, !llfi_index !99
  %157 = getelementptr inbounds %struct.NuclideGridPoint* %155, i32 0, i32 1, !llfi_index !99
  %158 = load double* %156, align 8, !llfi_index !100
  %159 = load double* %157, align 8, !llfi_index !100
  %160 = fsub double %152, %158, !llfi_index !101
  %161 = fsub double %153, %159, !llfi_index !101
  %162 = fmul double %146, %160, !llfi_index !102
  %163 = fmul double %147, %161, !llfi_index !102
  %164 = fsub double %144, %162, !llfi_index !103
  %165 = fsub double %145, %163, !llfi_index !103
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %164, double %165)
  %166 = load double** %8, align 8, !llfi_index !104
  %167 = load double** %8, align 8, !llfi_index !104
  %168 = getelementptr inbounds double* %166, i64 0, !llfi_index !105
  %169 = getelementptr inbounds double* %167, i64 0, !llfi_index !105
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (double*, double*)*)(double* %168, double* %169)
  store double %164, double* %168, align 8, !llfi_index !106
  %170 = load %struct.NuclideGridPoint** %high, align 8, !llfi_index !107
  %171 = load %struct.NuclideGridPoint** %high, align 8, !llfi_index !107
  %172 = getelementptr inbounds %struct.NuclideGridPoint* %170, i32 0, i32 2, !llfi_index !108
  %173 = getelementptr inbounds %struct.NuclideGridPoint* %171, i32 0, i32 2, !llfi_index !108
  %174 = load double* %172, align 8, !llfi_index !109
  %175 = load double* %173, align 8, !llfi_index !109
  %176 = load double* %f, align 8, !llfi_index !110
  %177 = load double* %f, align 8, !llfi_index !110
  %178 = load %struct.NuclideGridPoint** %high, align 8, !llfi_index !111
  %179 = load %struct.NuclideGridPoint** %high, align 8, !llfi_index !111
  %180 = getelementptr inbounds %struct.NuclideGridPoint* %178, i32 0, i32 2, !llfi_index !112
  %181 = getelementptr inbounds %struct.NuclideGridPoint* %179, i32 0, i32 2, !llfi_index !112
  %182 = load double* %180, align 8, !llfi_index !113
  %183 = load double* %181, align 8, !llfi_index !113
  %184 = load %struct.NuclideGridPoint** %low, align 8, !llfi_index !114
  %185 = load %struct.NuclideGridPoint** %low, align 8, !llfi_index !114
  %186 = getelementptr inbounds %struct.NuclideGridPoint* %184, i32 0, i32 2, !llfi_index !115
  %187 = getelementptr inbounds %struct.NuclideGridPoint* %185, i32 0, i32 2, !llfi_index !115
  %188 = load double* %186, align 8, !llfi_index !116
  %189 = load double* %187, align 8, !llfi_index !116
  %190 = fsub double %182, %188, !llfi_index !117
  %191 = fsub double %183, %189, !llfi_index !117
  %192 = fmul double %176, %190, !llfi_index !118
  %193 = fmul double %177, %191, !llfi_index !118
  %194 = fsub double %174, %192, !llfi_index !119
  %195 = fsub double %175, %193, !llfi_index !119
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %194, double %195)
  %196 = load double** %8, align 8, !llfi_index !120
  %197 = load double** %8, align 8, !llfi_index !120
  %198 = getelementptr inbounds double* %196, i64 1, !llfi_index !121
  %199 = getelementptr inbounds double* %197, i64 1, !llfi_index !121
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (double*, double*)*)(double* %198, double* %199)
  store double %194, double* %198, align 8, !llfi_index !122
  %200 = load %struct.NuclideGridPoint** %high, align 8, !llfi_index !123
  %201 = load %struct.NuclideGridPoint** %high, align 8, !llfi_index !123
  %202 = getelementptr inbounds %struct.NuclideGridPoint* %200, i32 0, i32 3, !llfi_index !124
  %203 = getelementptr inbounds %struct.NuclideGridPoint* %201, i32 0, i32 3, !llfi_index !124
  %204 = load double* %202, align 8, !llfi_index !125
  %205 = load double* %203, align 8, !llfi_index !125
  %206 = load double* %f, align 8, !llfi_index !126
  %207 = load double* %f, align 8, !llfi_index !126
  %208 = load %struct.NuclideGridPoint** %high, align 8, !llfi_index !127
  %209 = load %struct.NuclideGridPoint** %high, align 8, !llfi_index !127
  %210 = getelementptr inbounds %struct.NuclideGridPoint* %208, i32 0, i32 3, !llfi_index !128
  %211 = getelementptr inbounds %struct.NuclideGridPoint* %209, i32 0, i32 3, !llfi_index !128
  %212 = load double* %210, align 8, !llfi_index !129
  %213 = load double* %211, align 8, !llfi_index !129
  %214 = load %struct.NuclideGridPoint** %low, align 8, !llfi_index !130
  %215 = load %struct.NuclideGridPoint** %low, align 8, !llfi_index !130
  %216 = getelementptr inbounds %struct.NuclideGridPoint* %214, i32 0, i32 3, !llfi_index !131
  %217 = getelementptr inbounds %struct.NuclideGridPoint* %215, i32 0, i32 3, !llfi_index !131
  %218 = load double* %216, align 8, !llfi_index !132
  %219 = load double* %217, align 8, !llfi_index !132
  %220 = fsub double %212, %218, !llfi_index !133
  %221 = fsub double %213, %219, !llfi_index !133
  %222 = fmul double %206, %220, !llfi_index !134
  %223 = fmul double %207, %221, !llfi_index !134
  %224 = fsub double %204, %222, !llfi_index !135
  %225 = fsub double %205, %223, !llfi_index !135
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %224, double %225)
  %226 = load double** %8, align 8, !llfi_index !136
  %227 = load double** %8, align 8, !llfi_index !136
  %228 = getelementptr inbounds double* %226, i64 2, !llfi_index !137
  %229 = getelementptr inbounds double* %227, i64 2, !llfi_index !137
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (double*, double*)*)(double* %228, double* %229)
  store double %224, double* %228, align 8, !llfi_index !138
  %230 = load %struct.NuclideGridPoint** %high, align 8, !llfi_index !139
  %231 = load %struct.NuclideGridPoint** %high, align 8, !llfi_index !139
  %232 = getelementptr inbounds %struct.NuclideGridPoint* %230, i32 0, i32 4, !llfi_index !140
  %233 = getelementptr inbounds %struct.NuclideGridPoint* %231, i32 0, i32 4, !llfi_index !140
  %234 = load double* %232, align 8, !llfi_index !141
  %235 = load double* %233, align 8, !llfi_index !141
  %236 = load double* %f, align 8, !llfi_index !142
  %237 = load double* %f, align 8, !llfi_index !142
  %238 = load %struct.NuclideGridPoint** %high, align 8, !llfi_index !143
  %239 = load %struct.NuclideGridPoint** %high, align 8, !llfi_index !143
  %240 = getelementptr inbounds %struct.NuclideGridPoint* %238, i32 0, i32 4, !llfi_index !144
  %241 = getelementptr inbounds %struct.NuclideGridPoint* %239, i32 0, i32 4, !llfi_index !144
  %242 = load double* %240, align 8, !llfi_index !145
  %243 = load double* %241, align 8, !llfi_index !145
  %244 = load %struct.NuclideGridPoint** %low, align 8, !llfi_index !146
  %245 = load %struct.NuclideGridPoint** %low, align 8, !llfi_index !146
  %246 = getelementptr inbounds %struct.NuclideGridPoint* %244, i32 0, i32 4, !llfi_index !147
  %247 = getelementptr inbounds %struct.NuclideGridPoint* %245, i32 0, i32 4, !llfi_index !147
  %248 = load double* %246, align 8, !llfi_index !148
  %249 = load double* %247, align 8, !llfi_index !148
  %250 = fsub double %242, %248, !llfi_index !149
  %251 = fsub double %243, %249, !llfi_index !149
  %252 = fmul double %236, %250, !llfi_index !150
  %253 = fmul double %237, %251, !llfi_index !150
  %254 = fsub double %234, %252, !llfi_index !151
  %255 = fsub double %235, %253, !llfi_index !151
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %254, double %255)
  %256 = load double** %8, align 8, !llfi_index !152
  %257 = load double** %8, align 8, !llfi_index !152
  %258 = getelementptr inbounds double* %256, i64 3, !llfi_index !153
  %259 = getelementptr inbounds double* %257, i64 3, !llfi_index !153
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (double*, double*)*)(double* %258, double* %259)
  store double %254, double* %258, align 8, !llfi_index !154
  %260 = load %struct.NuclideGridPoint** %high, align 8, !llfi_index !155
  %261 = load %struct.NuclideGridPoint** %high, align 8, !llfi_index !155
  %262 = getelementptr inbounds %struct.NuclideGridPoint* %260, i32 0, i32 5, !llfi_index !156
  %263 = getelementptr inbounds %struct.NuclideGridPoint* %261, i32 0, i32 5, !llfi_index !156
  %264 = load double* %262, align 8, !llfi_index !157
  %265 = load double* %263, align 8, !llfi_index !157
  %266 = load double* %f, align 8, !llfi_index !158
  %267 = load double* %f, align 8, !llfi_index !158
  %268 = load %struct.NuclideGridPoint** %high, align 8, !llfi_index !159
  %269 = load %struct.NuclideGridPoint** %high, align 8, !llfi_index !159
  %270 = getelementptr inbounds %struct.NuclideGridPoint* %268, i32 0, i32 5, !llfi_index !160
  %271 = getelementptr inbounds %struct.NuclideGridPoint* %269, i32 0, i32 5, !llfi_index !160
  %272 = load double* %270, align 8, !llfi_index !161
  %273 = load double* %271, align 8, !llfi_index !161
  %274 = load %struct.NuclideGridPoint** %low, align 8, !llfi_index !162
  %275 = load %struct.NuclideGridPoint** %low, align 8, !llfi_index !162
  %276 = getelementptr inbounds %struct.NuclideGridPoint* %274, i32 0, i32 5, !llfi_index !163
  %277 = getelementptr inbounds %struct.NuclideGridPoint* %275, i32 0, i32 5, !llfi_index !163
  %278 = load double* %276, align 8, !llfi_index !164
  %279 = load double* %277, align 8, !llfi_index !164
  %280 = fsub double %272, %278, !llfi_index !165
  %281 = fsub double %273, %279, !llfi_index !165
  %282 = fmul double %266, %280, !llfi_index !166
  %283 = fmul double %267, %281, !llfi_index !166
  %284 = fsub double %264, %282, !llfi_index !167
  %285 = fsub double %265, %283, !llfi_index !167
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %284, double %285)
  %286 = load double** %8, align 8, !llfi_index !168
  %287 = load double** %8, align 8, !llfi_index !168
  %288 = getelementptr inbounds double* %286, i64 4, !llfi_index !169
  %289 = getelementptr inbounds double* %287, i64 4, !llfi_index !169
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (double*, double*)*)(double* %288, double* %289)
  store double %284, double* %288, align 8, !llfi_index !170
  ret void, !llfi_index !171
}

; Function Attrs: nounwind uwtable
define void @calculate_macro_xs(double %p_energy, i32 %mat, i64 %n_isotopes, i64 %n_gridpoints, i32* noalias %num_nucs, double** noalias %concs, %struct.GridPoint* noalias %energy_grid, %struct.NuclideGridPoint** noalias %nuclide_grids, i32** noalias %mats, double* noalias %macro_xs_vector) #0 {
  %1 = alloca double, align 8, !llfi_index !172
  %2 = alloca i32, align 4, !llfi_index !173
  %3 = alloca i64, align 8, !llfi_index !174
  %4 = alloca i64, align 8, !llfi_index !175
  %5 = alloca i32*, align 8, !llfi_index !176
  %6 = alloca double**, align 8, !llfi_index !177
  %7 = alloca %struct.GridPoint*, align 8, !llfi_index !178
  %8 = alloca %struct.NuclideGridPoint**, align 8, !llfi_index !179
  %9 = alloca i32**, align 8, !llfi_index !180
  %10 = alloca double*, align 8, !llfi_index !181
  %xs_vector = alloca [5 x double], align 16, !llfi_index !182
  %p_nuc = alloca i32, align 4, !llfi_index !183
  %idx = alloca i64, align 8, !llfi_index !184
  %conc = alloca double, align 8, !llfi_index !185
  %k = alloca i32, align 4, !llfi_index !186
  %j = alloca i32, align 4, !llfi_index !187
  %k1 = alloca i32, align 4, !llfi_index !188
  store double %p_energy, double* %1, align 8, !llfi_index !189
  store i32 %mat, i32* %2, align 4, !llfi_index !190
  store i64 %n_isotopes, i64* %3, align 8, !llfi_index !191
  store i64 %n_gridpoints, i64* %4, align 8, !llfi_index !192
  store i32* %num_nucs, i32** %5, align 8, !llfi_index !193
  store double** %concs, double*** %6, align 8, !llfi_index !194
  store %struct.GridPoint* %energy_grid, %struct.GridPoint** %7, align 8, !llfi_index !195
  store %struct.NuclideGridPoint** %nuclide_grids, %struct.NuclideGridPoint*** %8, align 8, !llfi_index !196
  store i32** %mats, i32*** %9, align 8, !llfi_index !197
  store double* %macro_xs_vector, double** %10, align 8, !llfi_index !198
  store i64 0, i64* %idx, align 8, !llfi_index !199
  store i32 0, i32* %k, align 4, !llfi_index !200
  br label %11, !llfi_index !201

; <label>:11                                      ; preds = %25, %0
  %12 = load i32* %k, align 4, !llfi_index !202
  %13 = load i32* %k, align 4, !llfi_index !202
  %14 = icmp slt i32 %12, 5, !llfi_index !203
  %15 = icmp slt i32 %13, 5, !llfi_index !203
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %14, i1 %15)
  br i1 %14, label %16, label %30, !llfi_index !204

; <label>:16                                      ; preds = %11
  %17 = load i32* %k, align 4, !llfi_index !205
  %18 = load i32* %k, align 4, !llfi_index !205
  %19 = sext i32 %17 to i64, !llfi_index !206
  %20 = sext i32 %18 to i64, !llfi_index !206
  %21 = load double** %10, align 8, !llfi_index !207
  %22 = load double** %10, align 8, !llfi_index !207
  %23 = getelementptr inbounds double* %21, i64 %19, !llfi_index !208
  %24 = getelementptr inbounds double* %22, i64 %20, !llfi_index !208
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (double*, double*)*)(double* %23, double* %24)
  store double 0.000000e+00, double* %23, align 8, !llfi_index !209
  br label %25, !llfi_index !210

; <label>:25                                      ; preds = %16
  %26 = load i32* %k, align 4, !llfi_index !211
  %27 = load i32* %k, align 4, !llfi_index !211
  %28 = add nsw i32 %26, 1, !llfi_index !212
  %29 = add nsw i32 %27, 1, !llfi_index !212
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %28, i32 %29)
  store i32 %28, i32* %k, align 4, !llfi_index !213
  br label %11, !llfi_index !214

; <label>:30                                      ; preds = %11
  %31 = load i64* %3, align 8, !llfi_index !215
  %32 = load i64* %3, align 8, !llfi_index !215
  %33 = load i64* %4, align 8, !llfi_index !216
  %34 = load i64* %4, align 8, !llfi_index !216
  %35 = mul nsw i64 %31, %33, !llfi_index !217
  %36 = mul nsw i64 %32, %34, !llfi_index !217
  call void @global_check()
  call void @global_add(i64 %35, i64 %36)
  %37 = load double* %1, align 8, !llfi_index !218
  %38 = load double* %1, align 8, !llfi_index !218
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %37, double %38)
  %39 = load %struct.GridPoint** %7, align 8, !llfi_index !219
  %40 = load %struct.GridPoint** %7, align 8, !llfi_index !219
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (%struct.GridPoint*, %struct.GridPoint*)*)(%struct.GridPoint* %39, %struct.GridPoint* %40)
  %41 = call i64 @grid_search(i64 %35, double %37, %struct.GridPoint* %39), !llfi_index !220
  store i64 %41, i64* %idx, align 8, !llfi_index !221
  store i32 0, i32* %j, align 4, !llfi_index !222
  br label %42, !llfi_index !223

; <label>:42                                      ; preds = %148, %30
  %43 = load i32* %j, align 4, !llfi_index !224
  %44 = load i32* %j, align 4, !llfi_index !224
  %45 = load i32* %2, align 4, !llfi_index !225
  %46 = load i32* %2, align 4, !llfi_index !225
  %47 = sext i32 %45 to i64, !llfi_index !226
  %48 = sext i32 %46 to i64, !llfi_index !226
  %49 = load i32** %5, align 8, !llfi_index !227
  %50 = load i32** %5, align 8, !llfi_index !227
  %51 = getelementptr inbounds i32* %49, i64 %47, !llfi_index !228
  %52 = getelementptr inbounds i32* %50, i64 %48, !llfi_index !228
  %53 = load i32* %51, align 4, !llfi_index !229
  %54 = load i32* %52, align 4, !llfi_index !229
  %55 = icmp slt i32 %43, %53, !llfi_index !230
  %56 = icmp slt i32 %44, %54, !llfi_index !230
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %55, i1 %56)
  br i1 %55, label %57, label %153, !llfi_index !231

; <label>:57                                      ; preds = %42
  %58 = load i32* %j, align 4, !llfi_index !232
  %59 = load i32* %j, align 4, !llfi_index !232
  %60 = sext i32 %58 to i64, !llfi_index !233
  %61 = sext i32 %59 to i64, !llfi_index !233
  %62 = load i32* %2, align 4, !llfi_index !234
  %63 = load i32* %2, align 4, !llfi_index !234
  %64 = sext i32 %62 to i64, !llfi_index !235
  %65 = sext i32 %63 to i64, !llfi_index !235
  %66 = load i32*** %9, align 8, !llfi_index !236
  %67 = load i32*** %9, align 8, !llfi_index !236
  %68 = getelementptr inbounds i32** %66, i64 %64, !llfi_index !237
  %69 = getelementptr inbounds i32** %67, i64 %65, !llfi_index !237
  %70 = load i32** %68, align 8, !llfi_index !238
  %71 = load i32** %69, align 8, !llfi_index !238
  %72 = getelementptr inbounds i32* %70, i64 %60, !llfi_index !239
  %73 = getelementptr inbounds i32* %71, i64 %61, !llfi_index !239
  %74 = load i32* %72, align 4, !llfi_index !240
  %75 = load i32* %73, align 4, !llfi_index !240
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %74, i32 %75)
  store i32 %74, i32* %p_nuc, align 4, !llfi_index !241
  %76 = load i32* %j, align 4, !llfi_index !242
  %77 = load i32* %j, align 4, !llfi_index !242
  %78 = sext i32 %76 to i64, !llfi_index !243
  %79 = sext i32 %77 to i64, !llfi_index !243
  %80 = load i32* %2, align 4, !llfi_index !244
  %81 = load i32* %2, align 4, !llfi_index !244
  %82 = sext i32 %80 to i64, !llfi_index !245
  %83 = sext i32 %81 to i64, !llfi_index !245
  %84 = load double*** %6, align 8, !llfi_index !246
  %85 = load double*** %6, align 8, !llfi_index !246
  %86 = getelementptr inbounds double** %84, i64 %82, !llfi_index !247
  %87 = getelementptr inbounds double** %85, i64 %83, !llfi_index !247
  %88 = load double** %86, align 8, !llfi_index !248
  %89 = load double** %87, align 8, !llfi_index !248
  %90 = getelementptr inbounds double* %88, i64 %78, !llfi_index !249
  %91 = getelementptr inbounds double* %89, i64 %79, !llfi_index !249
  %92 = load double* %90, align 8, !llfi_index !250
  %93 = load double* %91, align 8, !llfi_index !250
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %92, double %93)
  store double %92, double* %conc, align 8, !llfi_index !251
  %94 = load double* %1, align 8, !llfi_index !252
  %95 = load double* %1, align 8, !llfi_index !252
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %94, double %95)
  %96 = load i32* %p_nuc, align 4, !llfi_index !253
  %97 = load i32* %p_nuc, align 4, !llfi_index !253
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %96, i32 %97)
  %98 = load i64* %3, align 8, !llfi_index !254
  %99 = load i64* %3, align 8, !llfi_index !254
  call void @global_add(i64 %98, i64 %99)
  %100 = load i64* %4, align 8, !llfi_index !255
  %101 = load i64* %4, align 8, !llfi_index !255
  call void @global_add(i64 %100, i64 %101)
  %102 = load %struct.GridPoint** %7, align 8, !llfi_index !256
  %103 = load %struct.GridPoint** %7, align 8, !llfi_index !256
  call void bitcast (void (i64, i64)* @global_add to void (%struct.GridPoint*, %struct.GridPoint*)*)(%struct.GridPoint* %102, %struct.GridPoint* %103)
  %104 = load %struct.NuclideGridPoint*** %8, align 8, !llfi_index !257
  %105 = load %struct.NuclideGridPoint*** %8, align 8, !llfi_index !257
  call void bitcast (void (i64, i64)* @global_add to void (%struct.NuclideGridPoint**, %struct.NuclideGridPoint**)*)(%struct.NuclideGridPoint** %104, %struct.NuclideGridPoint** %105)
  %106 = load i64* %idx, align 8, !llfi_index !258
  %107 = load i64* %idx, align 8, !llfi_index !258
  %108 = trunc i64 %106 to i32, !llfi_index !259
  %109 = trunc i64 %107 to i32, !llfi_index !259
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %108, i32 %109)
  %110 = getelementptr inbounds [5 x double]* %xs_vector, i32 0, i32 0, !llfi_index !260
  %111 = getelementptr inbounds [5 x double]* %xs_vector, i32 0, i32 0, !llfi_index !260
  call void bitcast (void (i64, i64)* @global_add to void (double*, double*)*)(double* %110, double* %111)
  call void @calculate_micro_xs(double %94, i32 %96, i64 %98, i64 %100, %struct.GridPoint* %102, %struct.NuclideGridPoint** %104, i32 %108, double* %110), !llfi_index !261
  store i32 0, i32* %k1, align 4, !llfi_index !262
  br label %112, !llfi_index !263

; <label>:112                                     ; preds = %142, %57
  %113 = load i32* %k1, align 4, !llfi_index !264
  %114 = load i32* %k1, align 4, !llfi_index !264
  %115 = icmp slt i32 %113, 5, !llfi_index !265
  %116 = icmp slt i32 %114, 5, !llfi_index !265
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %115, i1 %116)
  br i1 %115, label %117, label %147, !llfi_index !266

; <label>:117                                     ; preds = %112
  %118 = load i32* %k1, align 4, !llfi_index !267
  %119 = load i32* %k1, align 4, !llfi_index !267
  %120 = sext i32 %118 to i64, !llfi_index !268
  %121 = sext i32 %119 to i64, !llfi_index !268
  %122 = getelementptr inbounds [5 x double]* %xs_vector, i32 0, i64 %120, !llfi_index !269
  %123 = getelementptr inbounds [5 x double]* %xs_vector, i32 0, i64 %121, !llfi_index !269
  %124 = load double* %122, align 8, !llfi_index !270
  %125 = load double* %123, align 8, !llfi_index !270
  %126 = load double* %conc, align 8, !llfi_index !271
  %127 = load double* %conc, align 8, !llfi_index !271
  %128 = fmul double %124, %126, !llfi_index !272
  %129 = fmul double %125, %127, !llfi_index !272
  %130 = load i32* %k1, align 4, !llfi_index !273
  %131 = load i32* %k1, align 4, !llfi_index !273
  %132 = sext i32 %130 to i64, !llfi_index !274
  %133 = sext i32 %131 to i64, !llfi_index !274
  %134 = load double** %10, align 8, !llfi_index !275
  %135 = load double** %10, align 8, !llfi_index !275
  %136 = getelementptr inbounds double* %134, i64 %132, !llfi_index !276
  %137 = getelementptr inbounds double* %135, i64 %133, !llfi_index !276
  %138 = load double* %136, align 8, !llfi_index !277
  %139 = load double* %137, align 8, !llfi_index !277
  %140 = fadd double %138, %128, !llfi_index !278
  %141 = fadd double %139, %129, !llfi_index !278
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %140, double %141)
  store double %140, double* %136, align 8, !llfi_index !279
  br label %142, !llfi_index !280

; <label>:142                                     ; preds = %117
  %143 = load i32* %k1, align 4, !llfi_index !281
  %144 = load i32* %k1, align 4, !llfi_index !281
  %145 = add nsw i32 %143, 1, !llfi_index !282
  %146 = add nsw i32 %144, 1, !llfi_index !282
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %145, i32 %146)
  store i32 %145, i32* %k1, align 4, !llfi_index !283
  br label %112, !llfi_index !284

; <label>:147                                     ; preds = %112
  br label %148, !llfi_index !285

; <label>:148                                     ; preds = %147
  %149 = load i32* %j, align 4, !llfi_index !286
  %150 = load i32* %j, align 4, !llfi_index !286
  %151 = add nsw i32 %149, 1, !llfi_index !287
  %152 = add nsw i32 %150, 1, !llfi_index !287
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %151, i32 %152)
  store i32 %151, i32* %j, align 4, !llfi_index !288
  br label %42, !llfi_index !289

; <label>:153                                     ; preds = %42
  ret void, !llfi_index !290
}

; Function Attrs: nounwind uwtable
define i64 @grid_search(i64 %n, double %quarry, %struct.GridPoint* %A) #0 {
  %1 = alloca i64, align 8, !llfi_index !291
  %2 = alloca double, align 8, !llfi_index !292
  %3 = alloca %struct.GridPoint*, align 8, !llfi_index !293
  %lowerLimit = alloca i64, align 8, !llfi_index !294
  %upperLimit = alloca i64, align 8, !llfi_index !295
  %examinationPoint = alloca i64, align 8, !llfi_index !296
  %length = alloca i64, align 8, !llfi_index !297
  store i64 %n, i64* %1, align 8, !llfi_index !298
  store double %quarry, double* %2, align 8, !llfi_index !299
  store %struct.GridPoint* %A, %struct.GridPoint** %3, align 8, !llfi_index !300
  store i64 0, i64* %lowerLimit, align 8, !llfi_index !301
  %4 = load i64* %1, align 8, !llfi_index !302
  %5 = load i64* %1, align 8, !llfi_index !302
  %6 = sub nsw i64 %4, 1, !llfi_index !303
  %7 = sub nsw i64 %5, 1, !llfi_index !303
  call void @global_check()
  call void @global_add(i64 %6, i64 %7)
  store i64 %6, i64* %upperLimit, align 8, !llfi_index !304
  %8 = load i64* %upperLimit, align 8, !llfi_index !305
  %9 = load i64* %upperLimit, align 8, !llfi_index !305
  %10 = load i64* %lowerLimit, align 8, !llfi_index !306
  %11 = load i64* %lowerLimit, align 8, !llfi_index !306
  %12 = sub nsw i64 %8, %10, !llfi_index !307
  %13 = sub nsw i64 %9, %11, !llfi_index !307
  call void @global_check()
  call void @global_add(i64 %12, i64 %13)
  store i64 %12, i64* %length, align 8, !llfi_index !308
  br label %14, !llfi_index !309

; <label>:14                                      ; preds = %48, %0
  %15 = load i64* %length, align 8, !llfi_index !310
  %16 = load i64* %length, align 8, !llfi_index !310
  %17 = icmp sgt i64 %15, 1, !llfi_index !311
  %18 = icmp sgt i64 %16, 1, !llfi_index !311
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %17, i1 %18)
  br i1 %17, label %19, label %55, !llfi_index !312

; <label>:19                                      ; preds = %14
  %20 = load i64* %lowerLimit, align 8, !llfi_index !313
  %21 = load i64* %lowerLimit, align 8, !llfi_index !313
  %22 = load i64* %length, align 8, !llfi_index !314
  %23 = load i64* %length, align 8, !llfi_index !314
  %24 = sdiv i64 %22, 2, !llfi_index !315
  %25 = sdiv i64 %23, 2, !llfi_index !315
  %26 = add nsw i64 %20, %24, !llfi_index !316
  %27 = add nsw i64 %21, %25, !llfi_index !316
  call void @global_check()
  call void @global_add(i64 %26, i64 %27)
  store i64 %26, i64* %examinationPoint, align 8, !llfi_index !317
  %28 = load i64* %examinationPoint, align 8, !llfi_index !318
  %29 = load i64* %examinationPoint, align 8, !llfi_index !318
  %30 = load %struct.GridPoint** %3, align 8, !llfi_index !319
  %31 = load %struct.GridPoint** %3, align 8, !llfi_index !319
  %32 = getelementptr inbounds %struct.GridPoint* %30, i64 %28, !llfi_index !320
  %33 = getelementptr inbounds %struct.GridPoint* %31, i64 %29, !llfi_index !320
  %34 = getelementptr inbounds %struct.GridPoint* %32, i32 0, i32 0, !llfi_index !321
  %35 = getelementptr inbounds %struct.GridPoint* %33, i32 0, i32 0, !llfi_index !321
  %36 = load double* %34, align 8, !llfi_index !322
  %37 = load double* %35, align 8, !llfi_index !322
  %38 = load double* %2, align 8, !llfi_index !323
  %39 = load double* %2, align 8, !llfi_index !323
  %40 = fcmp ogt double %36, %38, !llfi_index !324
  %41 = fcmp ogt double %37, %39, !llfi_index !324
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %40, i1 %41)
  br i1 %40, label %42, label %45, !llfi_index !325

; <label>:42                                      ; preds = %19
  %43 = load i64* %examinationPoint, align 8, !llfi_index !326
  %44 = load i64* %examinationPoint, align 8, !llfi_index !326
  call void @global_check()
  call void @global_add(i64 %43, i64 %44)
  store i64 %43, i64* %upperLimit, align 8, !llfi_index !327
  br label %48, !llfi_index !328

; <label>:45                                      ; preds = %19
  %46 = load i64* %examinationPoint, align 8, !llfi_index !329
  %47 = load i64* %examinationPoint, align 8, !llfi_index !329
  call void @global_add(i64 %46, i64 %47)
  store i64 %46, i64* %lowerLimit, align 8, !llfi_index !330
  br label %48, !llfi_index !331

; <label>:48                                      ; preds = %45, %42
  %49 = load i64* %upperLimit, align 8, !llfi_index !332
  %50 = load i64* %upperLimit, align 8, !llfi_index !332
  %51 = load i64* %lowerLimit, align 8, !llfi_index !333
  %52 = load i64* %lowerLimit, align 8, !llfi_index !333
  %53 = sub nsw i64 %49, %51, !llfi_index !334
  %54 = sub nsw i64 %50, %52, !llfi_index !334
  call void @global_check()
  call void @global_add(i64 %53, i64 %54)
  store i64 %53, i64* %length, align 8, !llfi_index !335
  br label %14, !llfi_index !336

; <label>:55                                      ; preds = %14
  %56 = load i64* %lowerLimit, align 8, !llfi_index !337
  %57 = load i64* %lowerLimit, align 8, !llfi_index !337
  call void @global_check()
  call void @global_add(i64 %56, i64 %57)
  ret i64 %56, !llfi_index !338
}

; Function Attrs: nounwind uwtable
define void @generate_grids(%struct.NuclideGridPoint** %nuclide_grids, i64 %n_isotopes, i64 %n_gridpoints) #0 {
  %1 = alloca %struct.NuclideGridPoint**, align 8, !llfi_index !339
  %2 = alloca i64, align 8, !llfi_index !340
  %3 = alloca i64, align 8, !llfi_index !341
  %i = alloca i64, align 8, !llfi_index !342
  %j = alloca i64, align 8, !llfi_index !343
  store %struct.NuclideGridPoint** %nuclide_grids, %struct.NuclideGridPoint*** %1, align 8, !llfi_index !344
  store i64 %n_isotopes, i64* %2, align 8, !llfi_index !345
  store i64 %n_gridpoints, i64* %3, align 8, !llfi_index !346
  store i64 0, i64* %i, align 8, !llfi_index !347
  br label %4, !llfi_index !348

; <label>:4                                       ; preds = %110, %0
  %5 = load i64* %i, align 8, !llfi_index !349
  %6 = load i64* %i, align 8, !llfi_index !349
  %7 = load i64* %2, align 8, !llfi_index !350
  %8 = load i64* %2, align 8, !llfi_index !350
  %9 = icmp slt i64 %5, %7, !llfi_index !351
  %10 = icmp slt i64 %6, %8, !llfi_index !351
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %9, i1 %10)
  br i1 %9, label %11, label %115, !llfi_index !352

; <label>:11                                      ; preds = %4
  store i64 0, i64* %j, align 8, !llfi_index !353
  br label %12, !llfi_index !354

; <label>:12                                      ; preds = %104, %11
  %13 = load i64* %j, align 8, !llfi_index !355
  %14 = load i64* %j, align 8, !llfi_index !355
  %15 = load i64* %3, align 8, !llfi_index !356
  %16 = load i64* %3, align 8, !llfi_index !356
  %17 = icmp slt i64 %13, %15, !llfi_index !357
  %18 = icmp slt i64 %14, %16, !llfi_index !357
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %17, i1 %18)
  br i1 %17, label %19, label %109, !llfi_index !358

; <label>:19                                      ; preds = %12
  %20 = load i64* %j, align 8, !llfi_index !359
  %21 = load i64* %j, align 8, !llfi_index !359
  %22 = load i64* %i, align 8, !llfi_index !360
  %23 = load i64* %i, align 8, !llfi_index !360
  %24 = load %struct.NuclideGridPoint*** %1, align 8, !llfi_index !361
  %25 = load %struct.NuclideGridPoint*** %1, align 8, !llfi_index !361
  %26 = getelementptr inbounds %struct.NuclideGridPoint** %24, i64 %22, !llfi_index !362
  %27 = getelementptr inbounds %struct.NuclideGridPoint** %25, i64 %23, !llfi_index !362
  %28 = load %struct.NuclideGridPoint** %26, align 8, !llfi_index !363
  %29 = load %struct.NuclideGridPoint** %27, align 8, !llfi_index !363
  %30 = getelementptr inbounds %struct.NuclideGridPoint* %28, i64 %20, !llfi_index !364
  %31 = getelementptr inbounds %struct.NuclideGridPoint* %29, i64 %21, !llfi_index !364
  %32 = getelementptr inbounds %struct.NuclideGridPoint* %30, i32 0, i32 0, !llfi_index !365
  %33 = getelementptr inbounds %struct.NuclideGridPoint* %31, i32 0, i32 0, !llfi_index !365
  call void bitcast (void (i64, i64)* @global_add to void (double*, double*)*)(double* %32, double* %33)
  store double 3.240000e+02, double* %32, align 8, !llfi_index !366
  %34 = load i64* %j, align 8, !llfi_index !367
  %35 = load i64* %j, align 8, !llfi_index !367
  %36 = load i64* %i, align 8, !llfi_index !368
  %37 = load i64* %i, align 8, !llfi_index !368
  %38 = load %struct.NuclideGridPoint*** %1, align 8, !llfi_index !369
  %39 = load %struct.NuclideGridPoint*** %1, align 8, !llfi_index !369
  %40 = getelementptr inbounds %struct.NuclideGridPoint** %38, i64 %36, !llfi_index !370
  %41 = getelementptr inbounds %struct.NuclideGridPoint** %39, i64 %37, !llfi_index !370
  %42 = load %struct.NuclideGridPoint** %40, align 8, !llfi_index !371
  %43 = load %struct.NuclideGridPoint** %41, align 8, !llfi_index !371
  %44 = getelementptr inbounds %struct.NuclideGridPoint* %42, i64 %34, !llfi_index !372
  %45 = getelementptr inbounds %struct.NuclideGridPoint* %43, i64 %35, !llfi_index !372
  %46 = getelementptr inbounds %struct.NuclideGridPoint* %44, i32 0, i32 1, !llfi_index !373
  %47 = getelementptr inbounds %struct.NuclideGridPoint* %45, i32 0, i32 1, !llfi_index !373
  call void bitcast (void (i64, i64)* @global_add to void (double*, double*)*)(double* %46, double* %47)
  store double 5.200000e+02, double* %46, align 8, !llfi_index !374
  %48 = load i64* %j, align 8, !llfi_index !375
  %49 = load i64* %j, align 8, !llfi_index !375
  %50 = load i64* %i, align 8, !llfi_index !376
  %51 = load i64* %i, align 8, !llfi_index !376
  %52 = load %struct.NuclideGridPoint*** %1, align 8, !llfi_index !377
  %53 = load %struct.NuclideGridPoint*** %1, align 8, !llfi_index !377
  %54 = getelementptr inbounds %struct.NuclideGridPoint** %52, i64 %50, !llfi_index !378
  %55 = getelementptr inbounds %struct.NuclideGridPoint** %53, i64 %51, !llfi_index !378
  %56 = load %struct.NuclideGridPoint** %54, align 8, !llfi_index !379
  %57 = load %struct.NuclideGridPoint** %55, align 8, !llfi_index !379
  %58 = getelementptr inbounds %struct.NuclideGridPoint* %56, i64 %48, !llfi_index !380
  %59 = getelementptr inbounds %struct.NuclideGridPoint* %57, i64 %49, !llfi_index !380
  %60 = getelementptr inbounds %struct.NuclideGridPoint* %58, i32 0, i32 2, !llfi_index !381
  %61 = getelementptr inbounds %struct.NuclideGridPoint* %59, i32 0, i32 2, !llfi_index !381
  call void bitcast (void (i64, i64)* @global_add to void (double*, double*)*)(double* %60, double* %61)
  store double 3.450000e+02, double* %60, align 8, !llfi_index !382
  %62 = load i64* %j, align 8, !llfi_index !383
  %63 = load i64* %j, align 8, !llfi_index !383
  %64 = load i64* %i, align 8, !llfi_index !384
  %65 = load i64* %i, align 8, !llfi_index !384
  %66 = load %struct.NuclideGridPoint*** %1, align 8, !llfi_index !385
  %67 = load %struct.NuclideGridPoint*** %1, align 8, !llfi_index !385
  %68 = getelementptr inbounds %struct.NuclideGridPoint** %66, i64 %64, !llfi_index !386
  %69 = getelementptr inbounds %struct.NuclideGridPoint** %67, i64 %65, !llfi_index !386
  %70 = load %struct.NuclideGridPoint** %68, align 8, !llfi_index !387
  %71 = load %struct.NuclideGridPoint** %69, align 8, !llfi_index !387
  %72 = getelementptr inbounds %struct.NuclideGridPoint* %70, i64 %62, !llfi_index !388
  %73 = getelementptr inbounds %struct.NuclideGridPoint* %71, i64 %63, !llfi_index !388
  %74 = getelementptr inbounds %struct.NuclideGridPoint* %72, i32 0, i32 3, !llfi_index !389
  %75 = getelementptr inbounds %struct.NuclideGridPoint* %73, i32 0, i32 3, !llfi_index !389
  call void bitcast (void (i64, i64)* @global_add to void (double*, double*)*)(double* %74, double* %75)
  store double 3.260000e+02, double* %74, align 8, !llfi_index !390
  %76 = load i64* %j, align 8, !llfi_index !391
  %77 = load i64* %j, align 8, !llfi_index !391
  %78 = load i64* %i, align 8, !llfi_index !392
  %79 = load i64* %i, align 8, !llfi_index !392
  %80 = load %struct.NuclideGridPoint*** %1, align 8, !llfi_index !393
  %81 = load %struct.NuclideGridPoint*** %1, align 8, !llfi_index !393
  %82 = getelementptr inbounds %struct.NuclideGridPoint** %80, i64 %78, !llfi_index !394
  %83 = getelementptr inbounds %struct.NuclideGridPoint** %81, i64 %79, !llfi_index !394
  %84 = load %struct.NuclideGridPoint** %82, align 8, !llfi_index !395
  %85 = load %struct.NuclideGridPoint** %83, align 8, !llfi_index !395
  %86 = getelementptr inbounds %struct.NuclideGridPoint* %84, i64 %76, !llfi_index !396
  %87 = getelementptr inbounds %struct.NuclideGridPoint* %85, i64 %77, !llfi_index !396
  %88 = getelementptr inbounds %struct.NuclideGridPoint* %86, i32 0, i32 4, !llfi_index !397
  %89 = getelementptr inbounds %struct.NuclideGridPoint* %87, i32 0, i32 4, !llfi_index !397
  call void bitcast (void (i64, i64)* @global_add to void (double*, double*)*)(double* %88, double* %89)
  store double 4.560000e+02, double* %88, align 8, !llfi_index !398
  %90 = load i64* %j, align 8, !llfi_index !399
  %91 = load i64* %j, align 8, !llfi_index !399
  %92 = load i64* %i, align 8, !llfi_index !400
  %93 = load i64* %i, align 8, !llfi_index !400
  %94 = load %struct.NuclideGridPoint*** %1, align 8, !llfi_index !401
  %95 = load %struct.NuclideGridPoint*** %1, align 8, !llfi_index !401
  %96 = getelementptr inbounds %struct.NuclideGridPoint** %94, i64 %92, !llfi_index !402
  %97 = getelementptr inbounds %struct.NuclideGridPoint** %95, i64 %93, !llfi_index !402
  %98 = load %struct.NuclideGridPoint** %96, align 8, !llfi_index !403
  %99 = load %struct.NuclideGridPoint** %97, align 8, !llfi_index !403
  %100 = getelementptr inbounds %struct.NuclideGridPoint* %98, i64 %90, !llfi_index !404
  %101 = getelementptr inbounds %struct.NuclideGridPoint* %99, i64 %91, !llfi_index !404
  %102 = getelementptr inbounds %struct.NuclideGridPoint* %100, i32 0, i32 5, !llfi_index !405
  %103 = getelementptr inbounds %struct.NuclideGridPoint* %101, i32 0, i32 5, !llfi_index !405
  call void bitcast (void (i64, i64)* @global_add to void (double*, double*)*)(double* %102, double* %103)
  store double 5.120000e+02, double* %102, align 8, !llfi_index !406
  br label %104, !llfi_index !407

; <label>:104                                     ; preds = %19
  %105 = load i64* %j, align 8, !llfi_index !408
  %106 = load i64* %j, align 8, !llfi_index !408
  %107 = add nsw i64 %105, 1, !llfi_index !409
  %108 = add nsw i64 %106, 1, !llfi_index !409
  call void @global_add(i64 %107, i64 %108)
  store i64 %107, i64* %j, align 8, !llfi_index !410
  br label %12, !llfi_index !411

; <label>:109                                     ; preds = %12
  br label %110, !llfi_index !412

; <label>:110                                     ; preds = %109
  %111 = load i64* %i, align 8, !llfi_index !413
  %112 = load i64* %i, align 8, !llfi_index !413
  %113 = add nsw i64 %111, 1, !llfi_index !414
  %114 = add nsw i64 %112, 1, !llfi_index !414
  call void @global_add(i64 %113, i64 %114)
  store i64 %113, i64* %i, align 8, !llfi_index !415
  br label %4, !llfi_index !416

; <label>:115                                     ; preds = %4
  ret void, !llfi_index !417
}

; Function Attrs: nounwind uwtable
define void @generate_grids_v(%struct.NuclideGridPoint** %nuclide_grids, i64 %n_isotopes, i64 %n_gridpoints) #0 {
  %1 = alloca %struct.NuclideGridPoint**, align 8, !llfi_index !418
  %2 = alloca i64, align 8, !llfi_index !419
  %3 = alloca i64, align 8, !llfi_index !420
  %i = alloca i64, align 8, !llfi_index !421
  %j = alloca i64, align 8, !llfi_index !422
  store %struct.NuclideGridPoint** %nuclide_grids, %struct.NuclideGridPoint*** %1, align 8, !llfi_index !423
  store i64 %n_isotopes, i64* %2, align 8, !llfi_index !424
  store i64 %n_gridpoints, i64* %3, align 8, !llfi_index !425
  store i64 0, i64* %i, align 8, !llfi_index !426
  br label %4, !llfi_index !427

; <label>:4                                       ; preds = %116, %0
  %5 = load i64* %i, align 8, !llfi_index !428
  %6 = load i64* %i, align 8, !llfi_index !428
  %7 = load i64* %2, align 8, !llfi_index !429
  %8 = load i64* %2, align 8, !llfi_index !429
  %9 = icmp slt i64 %5, %7, !llfi_index !430
  %10 = icmp slt i64 %6, %8, !llfi_index !430
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %9, i1 %10)
  br i1 %9, label %11, label %121, !llfi_index !431

; <label>:11                                      ; preds = %4
  store i64 0, i64* %j, align 8, !llfi_index !432
  br label %12, !llfi_index !433

; <label>:12                                      ; preds = %110, %11
  %13 = load i64* %j, align 8, !llfi_index !434
  %14 = load i64* %j, align 8, !llfi_index !434
  %15 = load i64* %3, align 8, !llfi_index !435
  %16 = load i64* %3, align 8, !llfi_index !435
  %17 = icmp slt i64 %13, %15, !llfi_index !436
  %18 = icmp slt i64 %14, %16, !llfi_index !436
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %17, i1 %18)
  br i1 %17, label %19, label %115, !llfi_index !437

; <label>:19                                      ; preds = %12
  %20 = call double @rn_v(), !llfi_index !438
  %21 = load i64* %j, align 8, !llfi_index !439
  %22 = load i64* %j, align 8, !llfi_index !439
  %23 = load i64* %i, align 8, !llfi_index !440
  %24 = load i64* %i, align 8, !llfi_index !440
  %25 = load %struct.NuclideGridPoint*** %1, align 8, !llfi_index !441
  %26 = load %struct.NuclideGridPoint*** %1, align 8, !llfi_index !441
  %27 = getelementptr inbounds %struct.NuclideGridPoint** %25, i64 %23, !llfi_index !442
  %28 = getelementptr inbounds %struct.NuclideGridPoint** %26, i64 %24, !llfi_index !442
  %29 = load %struct.NuclideGridPoint** %27, align 8, !llfi_index !443
  %30 = load %struct.NuclideGridPoint** %28, align 8, !llfi_index !443
  %31 = getelementptr inbounds %struct.NuclideGridPoint* %29, i64 %21, !llfi_index !444
  %32 = getelementptr inbounds %struct.NuclideGridPoint* %30, i64 %22, !llfi_index !444
  %33 = getelementptr inbounds %struct.NuclideGridPoint* %31, i32 0, i32 0, !llfi_index !445
  %34 = getelementptr inbounds %struct.NuclideGridPoint* %32, i32 0, i32 0, !llfi_index !445
  call void bitcast (void (i64, i64)* @global_add to void (double*, double*)*)(double* %33, double* %34)
  store double %20, double* %33, align 8, !llfi_index !446
  %35 = call double @rn_v(), !llfi_index !447
  %36 = load i64* %j, align 8, !llfi_index !448
  %37 = load i64* %j, align 8, !llfi_index !448
  %38 = load i64* %i, align 8, !llfi_index !449
  %39 = load i64* %i, align 8, !llfi_index !449
  %40 = load %struct.NuclideGridPoint*** %1, align 8, !llfi_index !450
  %41 = load %struct.NuclideGridPoint*** %1, align 8, !llfi_index !450
  %42 = getelementptr inbounds %struct.NuclideGridPoint** %40, i64 %38, !llfi_index !451
  %43 = getelementptr inbounds %struct.NuclideGridPoint** %41, i64 %39, !llfi_index !451
  %44 = load %struct.NuclideGridPoint** %42, align 8, !llfi_index !452
  %45 = load %struct.NuclideGridPoint** %43, align 8, !llfi_index !452
  %46 = getelementptr inbounds %struct.NuclideGridPoint* %44, i64 %36, !llfi_index !453
  %47 = getelementptr inbounds %struct.NuclideGridPoint* %45, i64 %37, !llfi_index !453
  %48 = getelementptr inbounds %struct.NuclideGridPoint* %46, i32 0, i32 1, !llfi_index !454
  %49 = getelementptr inbounds %struct.NuclideGridPoint* %47, i32 0, i32 1, !llfi_index !454
  call void bitcast (void (i64, i64)* @global_add to void (double*, double*)*)(double* %48, double* %49)
  store double %35, double* %48, align 8, !llfi_index !455
  %50 = call double @rn_v(), !llfi_index !456
  %51 = load i64* %j, align 8, !llfi_index !457
  %52 = load i64* %j, align 8, !llfi_index !457
  %53 = load i64* %i, align 8, !llfi_index !458
  %54 = load i64* %i, align 8, !llfi_index !458
  %55 = load %struct.NuclideGridPoint*** %1, align 8, !llfi_index !459
  %56 = load %struct.NuclideGridPoint*** %1, align 8, !llfi_index !459
  %57 = getelementptr inbounds %struct.NuclideGridPoint** %55, i64 %53, !llfi_index !460
  %58 = getelementptr inbounds %struct.NuclideGridPoint** %56, i64 %54, !llfi_index !460
  %59 = load %struct.NuclideGridPoint** %57, align 8, !llfi_index !461
  %60 = load %struct.NuclideGridPoint** %58, align 8, !llfi_index !461
  %61 = getelementptr inbounds %struct.NuclideGridPoint* %59, i64 %51, !llfi_index !462
  %62 = getelementptr inbounds %struct.NuclideGridPoint* %60, i64 %52, !llfi_index !462
  %63 = getelementptr inbounds %struct.NuclideGridPoint* %61, i32 0, i32 2, !llfi_index !463
  %64 = getelementptr inbounds %struct.NuclideGridPoint* %62, i32 0, i32 2, !llfi_index !463
  call void bitcast (void (i64, i64)* @global_add to void (double*, double*)*)(double* %63, double* %64)
  store double %50, double* %63, align 8, !llfi_index !464
  %65 = call double @rn_v(), !llfi_index !465
  %66 = load i64* %j, align 8, !llfi_index !466
  %67 = load i64* %j, align 8, !llfi_index !466
  %68 = load i64* %i, align 8, !llfi_index !467
  %69 = load i64* %i, align 8, !llfi_index !467
  %70 = load %struct.NuclideGridPoint*** %1, align 8, !llfi_index !468
  %71 = load %struct.NuclideGridPoint*** %1, align 8, !llfi_index !468
  %72 = getelementptr inbounds %struct.NuclideGridPoint** %70, i64 %68, !llfi_index !469
  %73 = getelementptr inbounds %struct.NuclideGridPoint** %71, i64 %69, !llfi_index !469
  %74 = load %struct.NuclideGridPoint** %72, align 8, !llfi_index !470
  %75 = load %struct.NuclideGridPoint** %73, align 8, !llfi_index !470
  %76 = getelementptr inbounds %struct.NuclideGridPoint* %74, i64 %66, !llfi_index !471
  %77 = getelementptr inbounds %struct.NuclideGridPoint* %75, i64 %67, !llfi_index !471
  %78 = getelementptr inbounds %struct.NuclideGridPoint* %76, i32 0, i32 3, !llfi_index !472
  %79 = getelementptr inbounds %struct.NuclideGridPoint* %77, i32 0, i32 3, !llfi_index !472
  call void bitcast (void (i64, i64)* @global_add to void (double*, double*)*)(double* %78, double* %79)
  store double %65, double* %78, align 8, !llfi_index !473
  %80 = call double @rn_v(), !llfi_index !474
  %81 = load i64* %j, align 8, !llfi_index !475
  %82 = load i64* %j, align 8, !llfi_index !475
  %83 = load i64* %i, align 8, !llfi_index !476
  %84 = load i64* %i, align 8, !llfi_index !476
  %85 = load %struct.NuclideGridPoint*** %1, align 8, !llfi_index !477
  %86 = load %struct.NuclideGridPoint*** %1, align 8, !llfi_index !477
  %87 = getelementptr inbounds %struct.NuclideGridPoint** %85, i64 %83, !llfi_index !478
  %88 = getelementptr inbounds %struct.NuclideGridPoint** %86, i64 %84, !llfi_index !478
  %89 = load %struct.NuclideGridPoint** %87, align 8, !llfi_index !479
  %90 = load %struct.NuclideGridPoint** %88, align 8, !llfi_index !479
  %91 = getelementptr inbounds %struct.NuclideGridPoint* %89, i64 %81, !llfi_index !480
  %92 = getelementptr inbounds %struct.NuclideGridPoint* %90, i64 %82, !llfi_index !480
  %93 = getelementptr inbounds %struct.NuclideGridPoint* %91, i32 0, i32 4, !llfi_index !481
  %94 = getelementptr inbounds %struct.NuclideGridPoint* %92, i32 0, i32 4, !llfi_index !481
  call void bitcast (void (i64, i64)* @global_add to void (double*, double*)*)(double* %93, double* %94)
  store double %80, double* %93, align 8, !llfi_index !482
  %95 = call double @rn_v(), !llfi_index !483
  %96 = load i64* %j, align 8, !llfi_index !484
  %97 = load i64* %j, align 8, !llfi_index !484
  %98 = load i64* %i, align 8, !llfi_index !485
  %99 = load i64* %i, align 8, !llfi_index !485
  %100 = load %struct.NuclideGridPoint*** %1, align 8, !llfi_index !486
  %101 = load %struct.NuclideGridPoint*** %1, align 8, !llfi_index !486
  %102 = getelementptr inbounds %struct.NuclideGridPoint** %100, i64 %98, !llfi_index !487
  %103 = getelementptr inbounds %struct.NuclideGridPoint** %101, i64 %99, !llfi_index !487
  %104 = load %struct.NuclideGridPoint** %102, align 8, !llfi_index !488
  %105 = load %struct.NuclideGridPoint** %103, align 8, !llfi_index !488
  %106 = getelementptr inbounds %struct.NuclideGridPoint* %104, i64 %96, !llfi_index !489
  %107 = getelementptr inbounds %struct.NuclideGridPoint* %105, i64 %97, !llfi_index !489
  %108 = getelementptr inbounds %struct.NuclideGridPoint* %106, i32 0, i32 5, !llfi_index !490
  %109 = getelementptr inbounds %struct.NuclideGridPoint* %107, i32 0, i32 5, !llfi_index !490
  call void bitcast (void (i64, i64)* @global_add to void (double*, double*)*)(double* %108, double* %109)
  store double %95, double* %108, align 8, !llfi_index !491
  br label %110, !llfi_index !492

; <label>:110                                     ; preds = %19
  %111 = load i64* %j, align 8, !llfi_index !493
  %112 = load i64* %j, align 8, !llfi_index !493
  %113 = add nsw i64 %111, 1, !llfi_index !494
  %114 = add nsw i64 %112, 1, !llfi_index !494
  call void @global_add(i64 %113, i64 %114)
  store i64 %113, i64* %j, align 8, !llfi_index !495
  br label %12, !llfi_index !496

; <label>:115                                     ; preds = %12
  br label %116, !llfi_index !497

; <label>:116                                     ; preds = %115
  %117 = load i64* %i, align 8, !llfi_index !498
  %118 = load i64* %i, align 8, !llfi_index !498
  %119 = add nsw i64 %117, 1, !llfi_index !499
  %120 = add nsw i64 %118, 1, !llfi_index !499
  call void @global_add(i64 %119, i64 %120)
  store i64 %119, i64* %i, align 8, !llfi_index !500
  br label %4, !llfi_index !501

; <label>:121                                     ; preds = %4
  ret void, !llfi_index !502
}

; Function Attrs: nounwind uwtable
define void @sort_nuclide_grids(%struct.NuclideGridPoint** %nuclide_grids, i64 %n_isotopes, i64 %n_gridpoints) #0 {
  %1 = alloca %struct.NuclideGridPoint**, align 8, !llfi_index !503
  %2 = alloca i64, align 8, !llfi_index !504
  %3 = alloca i64, align 8, !llfi_index !505
  %cmp = alloca i32 (i8*, i8*)*, align 8, !llfi_index !506
  %i = alloca i64, align 8, !llfi_index !507
  store %struct.NuclideGridPoint** %nuclide_grids, %struct.NuclideGridPoint*** %1, align 8, !llfi_index !508
  store i64 %n_isotopes, i64* %2, align 8, !llfi_index !509
  store i64 %n_gridpoints, i64* %3, align 8, !llfi_index !510
  store i32 (i8*, i8*)* @NGP_compare, i32 (i8*, i8*)** %cmp, align 8, !llfi_index !511
  store i64 0, i64* %i, align 8, !llfi_index !512
  br label %4, !llfi_index !513

; <label>:4                                       ; preds = %26, %0
  %5 = load i64* %i, align 8, !llfi_index !514
  %6 = load i64* %i, align 8, !llfi_index !514
  %7 = load i64* %2, align 8, !llfi_index !515
  %8 = load i64* %2, align 8, !llfi_index !515
  %9 = icmp slt i64 %5, %7, !llfi_index !516
  %10 = icmp slt i64 %6, %8, !llfi_index !516
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %9, i1 %10)
  br i1 %9, label %11, label %31, !llfi_index !517

; <label>:11                                      ; preds = %4
  %12 = load i64* %i, align 8, !llfi_index !518
  %13 = load i64* %i, align 8, !llfi_index !518
  %14 = load %struct.NuclideGridPoint*** %1, align 8, !llfi_index !519
  %15 = load %struct.NuclideGridPoint*** %1, align 8, !llfi_index !519
  %16 = getelementptr inbounds %struct.NuclideGridPoint** %14, i64 %12, !llfi_index !520
  %17 = getelementptr inbounds %struct.NuclideGridPoint** %15, i64 %13, !llfi_index !520
  %18 = load %struct.NuclideGridPoint** %16, align 8, !llfi_index !521
  %19 = load %struct.NuclideGridPoint** %17, align 8, !llfi_index !521
  %20 = bitcast %struct.NuclideGridPoint* %18 to i8*, !llfi_index !522
  %21 = bitcast %struct.NuclideGridPoint* %19 to i8*, !llfi_index !522
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %20, i8* %21)
  %22 = load i64* %3, align 8, !llfi_index !523
  %23 = load i64* %3, align 8, !llfi_index !523
  call void @global_add(i64 %22, i64 %23)
  %24 = load i32 (i8*, i8*)** %cmp, align 8, !llfi_index !524
  %25 = load i32 (i8*, i8*)** %cmp, align 8, !llfi_index !524
  call void bitcast (void (i64, i64)* @global_add to void (i32 (i8*, i8*)*, i32 (i8*, i8*)*)*)(i32 (i8*, i8*)* %24, i32 (i8*, i8*)* %25)
  call void @qsort(i8* %20, i64 %22, i64 48, i32 (i8*, i8*)* %24), !llfi_index !525
  br label %26, !llfi_index !526

; <label>:26                                      ; preds = %11
  %27 = load i64* %i, align 8, !llfi_index !527
  %28 = load i64* %i, align 8, !llfi_index !527
  %29 = add nsw i64 %27, 1, !llfi_index !528
  %30 = add nsw i64 %28, 1, !llfi_index !528
  call void @global_add(i64 %29, i64 %30)
  store i64 %29, i64* %i, align 8, !llfi_index !529
  br label %4, !llfi_index !530

; <label>:31                                      ; preds = %4
  ret void, !llfi_index !531
}

declare void @qsort(i8*, i64, i64, i32 (i8*, i8*)*) #1

; Function Attrs: nounwind uwtable
define %struct.GridPoint* @generate_energy_grid(i64 %n_isotopes, i64 %n_gridpoints, %struct.NuclideGridPoint** %nuclide_grids) #0 {
  %1 = alloca i64, align 8, !llfi_index !532
  %2 = alloca i64, align 8, !llfi_index !533
  %3 = alloca %struct.NuclideGridPoint**, align 8, !llfi_index !534
  %mype = alloca i32, align 4, !llfi_index !535
  %n_unionized_grid_points = alloca i64, align 8, !llfi_index !536
  %cmp = alloca i32 (i8*, i8*)*, align 8, !llfi_index !537
  %energy_grid = alloca %struct.GridPoint*, align 8, !llfi_index !538
  %n_grid_sorted = alloca %struct.NuclideGridPoint**, align 8, !llfi_index !539
  %i = alloca i64, align 8, !llfi_index !540
  %full = alloca i32*, align 8, !llfi_index !541
  %i1 = alloca i64, align 8, !llfi_index !542
  store i64 %n_isotopes, i64* %1, align 8, !llfi_index !543
  store i64 %n_gridpoints, i64* %2, align 8, !llfi_index !544
  store %struct.NuclideGridPoint** %nuclide_grids, %struct.NuclideGridPoint*** %3, align 8, !llfi_index !545
  store i32 0, i32* %mype, align 4, !llfi_index !546
  %4 = load i32* %mype, align 4, !llfi_index !547
  %5 = load i32* %mype, align 4, !llfi_index !547
  %6 = icmp eq i32 %4, 0, !llfi_index !548
  %7 = icmp eq i32 %5, 0, !llfi_index !548
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %6, i1 %7)
  br i1 %6, label %8, label %10, !llfi_index !549

; <label>:8                                       ; preds = %0
  %9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str, i32 0, i32 0)), !llfi_index !550
  br label %10, !llfi_index !551

; <label>:10                                      ; preds = %8, %0
  %11 = load i64* %1, align 8, !llfi_index !552
  %12 = load i64* %1, align 8, !llfi_index !552
  %13 = load i64* %2, align 8, !llfi_index !553
  %14 = load i64* %2, align 8, !llfi_index !553
  %15 = mul nsw i64 %11, %13, !llfi_index !554
  %16 = mul nsw i64 %12, %14, !llfi_index !554
  call void @global_add(i64 %15, i64 %16)
  store i64 %15, i64* %n_unionized_grid_points, align 8, !llfi_index !555
  store i32 (i8*, i8*)* @NGP_compare, i32 (i8*, i8*)** %cmp, align 8, !llfi_index !556
  %17 = load i64* %n_unionized_grid_points, align 8, !llfi_index !557
  %18 = load i64* %n_unionized_grid_points, align 8, !llfi_index !557
  %19 = mul i64 %17, 16, !llfi_index !558
  %20 = mul i64 %18, 16, !llfi_index !558
  call void @global_add(i64 %19, i64 %20)
  %21 = call noalias i8* @malloc(i64 %19) #3, !llfi_index !559
  %22 = bitcast i8* %21 to %struct.GridPoint*, !llfi_index !560
  %23 = bitcast i8* %21 to %struct.GridPoint*, !llfi_index !560
  call void bitcast (void (i64, i64)* @global_add to void (%struct.GridPoint*, %struct.GridPoint*)*)(%struct.GridPoint* %22, %struct.GridPoint* %23)
  store %struct.GridPoint* %22, %struct.GridPoint** %energy_grid, align 8, !llfi_index !561
  %24 = load i32* %mype, align 4, !llfi_index !562
  %25 = load i32* %mype, align 4, !llfi_index !562
  %26 = icmp eq i32 %24, 0, !llfi_index !563
  %27 = icmp eq i32 %25, 0, !llfi_index !563
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %26, i1 %27)
  br i1 %26, label %28, label %30, !llfi_index !564

; <label>:28                                      ; preds = %10
  %29 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([42 x i8]* @.str1, i32 0, i32 0)), !llfi_index !565
  br label %30, !llfi_index !566

; <label>:30                                      ; preds = %28, %10
  %31 = load i64* %1, align 8, !llfi_index !567
  %32 = load i64* %1, align 8, !llfi_index !567
  call void @global_add(i64 %31, i64 %32)
  %33 = load i64* %2, align 8, !llfi_index !568
  %34 = load i64* %2, align 8, !llfi_index !568
  call void @global_add(i64 %33, i64 %34)
  %35 = call %struct.NuclideGridPoint** @gpmatrix(i64 %31, i64 %33), !llfi_index !569
  store %struct.NuclideGridPoint** %35, %struct.NuclideGridPoint*** %n_grid_sorted, align 8, !llfi_index !570
  %36 = load %struct.NuclideGridPoint*** %n_grid_sorted, align 8, !llfi_index !571
  %37 = load %struct.NuclideGridPoint*** %n_grid_sorted, align 8, !llfi_index !571
  %38 = getelementptr inbounds %struct.NuclideGridPoint** %36, i64 0, !llfi_index !572
  %39 = getelementptr inbounds %struct.NuclideGridPoint** %37, i64 0, !llfi_index !572
  %40 = load %struct.NuclideGridPoint** %38, align 8, !llfi_index !573
  %41 = load %struct.NuclideGridPoint** %39, align 8, !llfi_index !573
  %42 = bitcast %struct.NuclideGridPoint* %40 to i8*, !llfi_index !574
  %43 = bitcast %struct.NuclideGridPoint* %41 to i8*, !llfi_index !574
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %42, i8* %43)
  %44 = load %struct.NuclideGridPoint*** %3, align 8, !llfi_index !575
  %45 = load %struct.NuclideGridPoint*** %3, align 8, !llfi_index !575
  %46 = getelementptr inbounds %struct.NuclideGridPoint** %44, i64 0, !llfi_index !576
  %47 = getelementptr inbounds %struct.NuclideGridPoint** %45, i64 0, !llfi_index !576
  %48 = load %struct.NuclideGridPoint** %46, align 8, !llfi_index !577
  %49 = load %struct.NuclideGridPoint** %47, align 8, !llfi_index !577
  %50 = bitcast %struct.NuclideGridPoint* %48 to i8*, !llfi_index !578
  %51 = bitcast %struct.NuclideGridPoint* %49 to i8*, !llfi_index !578
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %50, i8* %51)
  %52 = load i64* %1, align 8, !llfi_index !579
  %53 = load i64* %1, align 8, !llfi_index !579
  %54 = load i64* %2, align 8, !llfi_index !580
  %55 = load i64* %2, align 8, !llfi_index !580
  %56 = mul nsw i64 %52, %54, !llfi_index !581
  %57 = mul nsw i64 %53, %55, !llfi_index !581
  %58 = mul i64 %56, 48, !llfi_index !582
  %59 = mul i64 %57, 48, !llfi_index !582
  call void @global_add(i64 %58, i64 %59)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %42, i8* %50, i64 %58, i32 8, i1 false), !llfi_index !583
  %60 = load %struct.NuclideGridPoint*** %n_grid_sorted, align 8, !llfi_index !584
  %61 = load %struct.NuclideGridPoint*** %n_grid_sorted, align 8, !llfi_index !584
  %62 = getelementptr inbounds %struct.NuclideGridPoint** %60, i64 0, !llfi_index !585
  %63 = getelementptr inbounds %struct.NuclideGridPoint** %61, i64 0, !llfi_index !585
  %64 = load %struct.NuclideGridPoint** %62, align 8, !llfi_index !586
  %65 = load %struct.NuclideGridPoint** %63, align 8, !llfi_index !586
  %66 = getelementptr inbounds %struct.NuclideGridPoint* %64, i64 0, !llfi_index !587
  %67 = getelementptr inbounds %struct.NuclideGridPoint* %65, i64 0, !llfi_index !587
  %68 = bitcast %struct.NuclideGridPoint* %66 to i8*, !llfi_index !588
  %69 = bitcast %struct.NuclideGridPoint* %67 to i8*, !llfi_index !588
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %68, i8* %69)
  %70 = load i64* %n_unionized_grid_points, align 8, !llfi_index !589
  %71 = load i64* %n_unionized_grid_points, align 8, !llfi_index !589
  call void @global_add(i64 %70, i64 %71)
  %72 = load i32 (i8*, i8*)** %cmp, align 8, !llfi_index !590
  %73 = load i32 (i8*, i8*)** %cmp, align 8, !llfi_index !590
  call void bitcast (void (i64, i64)* @global_add to void (i32 (i8*, i8*)*, i32 (i8*, i8*)*)*)(i32 (i8*, i8*)* %72, i32 (i8*, i8*)* %73)
  call void @qsort(i8* %68, i64 %70, i64 48, i32 (i8*, i8*)* %72), !llfi_index !591
  %74 = load i32* %mype, align 4, !llfi_index !592
  %75 = load i32* %mype, align 4, !llfi_index !592
  %76 = icmp eq i32 %74, 0, !llfi_index !593
  %77 = icmp eq i32 %75, 0, !llfi_index !593
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %76, i1 %77)
  br i1 %76, label %78, label %80, !llfi_index !594

; <label>:78                                      ; preds = %30
  %79 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([41 x i8]* @.str2, i32 0, i32 0)), !llfi_index !595
  br label %80, !llfi_index !596

; <label>:80                                      ; preds = %78, %30
  store i64 0, i64* %i, align 8, !llfi_index !597
  br label %81, !llfi_index !598

; <label>:81                                      ; preds = %111, %80
  %82 = load i64* %i, align 8, !llfi_index !599
  %83 = load i64* %i, align 8, !llfi_index !599
  %84 = load i64* %n_unionized_grid_points, align 8, !llfi_index !600
  %85 = load i64* %n_unionized_grid_points, align 8, !llfi_index !600
  %86 = icmp slt i64 %82, %84, !llfi_index !601
  %87 = icmp slt i64 %83, %85, !llfi_index !601
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %86, i1 %87)
  br i1 %86, label %88, label %116, !llfi_index !602

; <label>:88                                      ; preds = %81
  %89 = load i64* %i, align 8, !llfi_index !603
  %90 = load i64* %i, align 8, !llfi_index !603
  %91 = load %struct.NuclideGridPoint*** %n_grid_sorted, align 8, !llfi_index !604
  %92 = load %struct.NuclideGridPoint*** %n_grid_sorted, align 8, !llfi_index !604
  %93 = getelementptr inbounds %struct.NuclideGridPoint** %91, i64 0, !llfi_index !605
  %94 = getelementptr inbounds %struct.NuclideGridPoint** %92, i64 0, !llfi_index !605
  %95 = load %struct.NuclideGridPoint** %93, align 8, !llfi_index !606
  %96 = load %struct.NuclideGridPoint** %94, align 8, !llfi_index !606
  %97 = getelementptr inbounds %struct.NuclideGridPoint* %95, i64 %89, !llfi_index !607
  %98 = getelementptr inbounds %struct.NuclideGridPoint* %96, i64 %90, !llfi_index !607
  %99 = getelementptr inbounds %struct.NuclideGridPoint* %97, i32 0, i32 0, !llfi_index !608
  %100 = getelementptr inbounds %struct.NuclideGridPoint* %98, i32 0, i32 0, !llfi_index !608
  %101 = load double* %99, align 8, !llfi_index !609
  %102 = load double* %100, align 8, !llfi_index !609
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %101, double %102)
  %103 = load i64* %i, align 8, !llfi_index !610
  %104 = load i64* %i, align 8, !llfi_index !610
  %105 = load %struct.GridPoint** %energy_grid, align 8, !llfi_index !611
  %106 = load %struct.GridPoint** %energy_grid, align 8, !llfi_index !611
  %107 = getelementptr inbounds %struct.GridPoint* %105, i64 %103, !llfi_index !612
  %108 = getelementptr inbounds %struct.GridPoint* %106, i64 %104, !llfi_index !612
  %109 = getelementptr inbounds %struct.GridPoint* %107, i32 0, i32 0, !llfi_index !613
  %110 = getelementptr inbounds %struct.GridPoint* %108, i32 0, i32 0, !llfi_index !613
  call void bitcast (void (i64, i64)* @global_add to void (double*, double*)*)(double* %109, double* %110)
  store double %101, double* %109, align 8, !llfi_index !614
  br label %111, !llfi_index !615

; <label>:111                                     ; preds = %88
  %112 = load i64* %i, align 8, !llfi_index !616
  %113 = load i64* %i, align 8, !llfi_index !616
  %114 = add nsw i64 %112, 1, !llfi_index !617
  %115 = add nsw i64 %113, 1, !llfi_index !617
  call void @global_add(i64 %114, i64 %115)
  store i64 %114, i64* %i, align 8, !llfi_index !618
  br label %81, !llfi_index !619

; <label>:116                                     ; preds = %81
  %117 = load %struct.NuclideGridPoint*** %n_grid_sorted, align 8, !llfi_index !620
  %118 = load %struct.NuclideGridPoint*** %n_grid_sorted, align 8, !llfi_index !620
  call void bitcast (void (i64, i64)* @global_add to void (%struct.NuclideGridPoint**, %struct.NuclideGridPoint**)*)(%struct.NuclideGridPoint** %117, %struct.NuclideGridPoint** %118)
  call void @gpmatrix_free(%struct.NuclideGridPoint** %117), !llfi_index !621
  %119 = load i64* %1, align 8, !llfi_index !622
  %120 = load i64* %1, align 8, !llfi_index !622
  %121 = load i64* %n_unionized_grid_points, align 8, !llfi_index !623
  %122 = load i64* %n_unionized_grid_points, align 8, !llfi_index !623
  %123 = mul nsw i64 %119, %121, !llfi_index !624
  %124 = mul nsw i64 %120, %122, !llfi_index !624
  %125 = mul i64 %123, 4, !llfi_index !625
  %126 = mul i64 %124, 4, !llfi_index !625
  call void @global_add(i64 %125, i64 %126)
  %127 = call noalias i8* @malloc(i64 %125) #3, !llfi_index !626
  %128 = bitcast i8* %127 to i32*, !llfi_index !627
  %129 = bitcast i8* %127 to i32*, !llfi_index !627
  call void bitcast (void (i64, i64)* @global_add to void (i32*, i32*)*)(i32* %128, i32* %129)
  store i32* %128, i32** %full, align 8, !llfi_index !628
  %130 = load i32** %full, align 8, !llfi_index !629
  %131 = load i32** %full, align 8, !llfi_index !629
  %132 = icmp eq i32* %130, null, !llfi_index !630
  %133 = icmp eq i32* %131, null, !llfi_index !630
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %132, i1 %133)
  br i1 %132, label %134, label %138, !llfi_index !631

; <label>:134                                     ; preds = %116
  %135 = load %struct._IO_FILE** @stderr, align 8, !llfi_index !632
  %136 = load %struct._IO_FILE** @stderr, align 8, !llfi_index !632
  call void bitcast (void (i64, i64)* @global_add to void (%struct._IO_FILE*, %struct._IO_FILE*)*)(%struct._IO_FILE* %135, %struct._IO_FILE* %136)
  %137 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %135, i8* getelementptr inbounds ([24 x i8]* @.str3, i32 0, i32 0)), !llfi_index !633
  call void @global_check()
  call void @exit(i32 1) #7, !llfi_index !634
  unreachable, !llfi_index !635

; <label>:138                                     ; preds = %116
  store i64 0, i64* %i1, align 8, !llfi_index !636
  br label %139, !llfi_index !637

; <label>:139                                     ; preds = %165, %138
  %140 = load i64* %i1, align 8, !llfi_index !638
  %141 = load i64* %i1, align 8, !llfi_index !638
  %142 = load i64* %n_unionized_grid_points, align 8, !llfi_index !639
  %143 = load i64* %n_unionized_grid_points, align 8, !llfi_index !639
  %144 = icmp slt i64 %140, %142, !llfi_index !640
  %145 = icmp slt i64 %141, %143, !llfi_index !640
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %144, i1 %145)
  br i1 %144, label %146, label %170, !llfi_index !641

; <label>:146                                     ; preds = %139
  %147 = load i64* %1, align 8, !llfi_index !642
  %148 = load i64* %1, align 8, !llfi_index !642
  %149 = load i64* %i1, align 8, !llfi_index !643
  %150 = load i64* %i1, align 8, !llfi_index !643
  %151 = mul nsw i64 %147, %149, !llfi_index !644
  %152 = mul nsw i64 %148, %150, !llfi_index !644
  %153 = load i32** %full, align 8, !llfi_index !645
  %154 = load i32** %full, align 8, !llfi_index !645
  %155 = getelementptr inbounds i32* %153, i64 %151, !llfi_index !646
  %156 = getelementptr inbounds i32* %154, i64 %152, !llfi_index !646
  call void bitcast (void (i64, i64)* @global_add to void (i32*, i32*)*)(i32* %155, i32* %156)
  %157 = load i64* %i1, align 8, !llfi_index !647
  %158 = load i64* %i1, align 8, !llfi_index !647
  %159 = load %struct.GridPoint** %energy_grid, align 8, !llfi_index !648
  %160 = load %struct.GridPoint** %energy_grid, align 8, !llfi_index !648
  %161 = getelementptr inbounds %struct.GridPoint* %159, i64 %157, !llfi_index !649
  %162 = getelementptr inbounds %struct.GridPoint* %160, i64 %158, !llfi_index !649
  %163 = getelementptr inbounds %struct.GridPoint* %161, i32 0, i32 1, !llfi_index !650
  %164 = getelementptr inbounds %struct.GridPoint* %162, i32 0, i32 1, !llfi_index !650
  call void bitcast (void (i64, i64)* @global_add to void (i32**, i32**)*)(i32** %163, i32** %164)
  store i32* %155, i32** %163, align 8, !llfi_index !651
  br label %165, !llfi_index !652

; <label>:165                                     ; preds = %146
  %166 = load i64* %i1, align 8, !llfi_index !653
  %167 = load i64* %i1, align 8, !llfi_index !653
  %168 = add nsw i64 %166, 1, !llfi_index !654
  %169 = add nsw i64 %167, 1, !llfi_index !654
  call void @global_add(i64 %168, i64 %169)
  store i64 %168, i64* %i1, align 8, !llfi_index !655
  br label %139, !llfi_index !656

; <label>:170                                     ; preds = %139
  %171 = load %struct.GridPoint** %energy_grid, align 8, !llfi_index !657
  %172 = load %struct.GridPoint** %energy_grid, align 8, !llfi_index !657
  call void bitcast (void (i64, i64)* @global_add to void (%struct.GridPoint*, %struct.GridPoint*)*)(%struct.GridPoint* %171, %struct.GridPoint* %172)
  ret %struct.GridPoint* %171, !llfi_index !658
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #4

; Function Attrs: nounwind uwtable
define void @set_grid_ptrs(%struct.GridPoint* %energy_grid, %struct.NuclideGridPoint** %nuclide_grids, i64 %n_isotopes, i64 %n_gridpoints) #0 {
  %1 = alloca %struct.GridPoint*, align 8, !llfi_index !659
  %2 = alloca %struct.NuclideGridPoint**, align 8, !llfi_index !660
  %3 = alloca i64, align 8, !llfi_index !661
  %4 = alloca i64, align 8, !llfi_index !662
  %mype = alloca i32, align 4, !llfi_index !663
  %i = alloca i64, align 8, !llfi_index !664
  %quarry = alloca double, align 8, !llfi_index !665
  %j = alloca i64, align 8, !llfi_index !666
  store %struct.GridPoint* %energy_grid, %struct.GridPoint** %1, align 8, !llfi_index !667
  store %struct.NuclideGridPoint** %nuclide_grids, %struct.NuclideGridPoint*** %2, align 8, !llfi_index !668
  store i64 %n_isotopes, i64* %3, align 8, !llfi_index !669
  store i64 %n_gridpoints, i64* %4, align 8, !llfi_index !670
  store i32 0, i32* %mype, align 4, !llfi_index !671
  %5 = load i32* %mype, align 4, !llfi_index !672
  %6 = load i32* %mype, align 4, !llfi_index !672
  %7 = icmp eq i32 %5, 0, !llfi_index !673
  %8 = icmp eq i32 %6, 0, !llfi_index !673
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %7, i1 %8)
  br i1 %7, label %9, label %11, !llfi_index !674

; <label>:9                                       ; preds = %0
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([48 x i8]* @.str4, i32 0, i32 0)), !llfi_index !675
  br label %11, !llfi_index !676

; <label>:11                                      ; preds = %9, %0
  store i64 0, i64* %i, align 8, !llfi_index !677
  br label %12, !llfi_index !678

; <label>:12                                      ; preds = %109, %11
  %13 = load i64* %i, align 8, !llfi_index !679
  %14 = load i64* %i, align 8, !llfi_index !679
  %15 = load i64* %3, align 8, !llfi_index !680
  %16 = load i64* %3, align 8, !llfi_index !680
  %17 = load i64* %4, align 8, !llfi_index !681
  %18 = load i64* %4, align 8, !llfi_index !681
  %19 = mul nsw i64 %15, %17, !llfi_index !682
  %20 = mul nsw i64 %16, %18, !llfi_index !682
  %21 = icmp slt i64 %13, %19, !llfi_index !683
  %22 = icmp slt i64 %14, %20, !llfi_index !683
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %21, i1 %22)
  br i1 %21, label %23, label %114, !llfi_index !684

; <label>:23                                      ; preds = %12
  %24 = load i64* %i, align 8, !llfi_index !685
  %25 = load i64* %i, align 8, !llfi_index !685
  %26 = load %struct.GridPoint** %1, align 8, !llfi_index !686
  %27 = load %struct.GridPoint** %1, align 8, !llfi_index !686
  %28 = getelementptr inbounds %struct.GridPoint* %26, i64 %24, !llfi_index !687
  %29 = getelementptr inbounds %struct.GridPoint* %27, i64 %25, !llfi_index !687
  %30 = getelementptr inbounds %struct.GridPoint* %28, i32 0, i32 0, !llfi_index !688
  %31 = getelementptr inbounds %struct.GridPoint* %29, i32 0, i32 0, !llfi_index !688
  %32 = load double* %30, align 8, !llfi_index !689
  %33 = load double* %31, align 8, !llfi_index !689
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %32, double %33)
  store double %32, double* %quarry, align 8, !llfi_index !690
  %34 = load i32* %mype, align 4, !llfi_index !691
  %35 = load i32* %mype, align 4, !llfi_index !691
  %36 = icmp eq i32 %34, 0, !llfi_index !692
  %37 = icmp eq i32 %35, 0, !llfi_index !692
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %36, i1 %37)
  br i1 %36, label %38, label %65, !llfi_index !693

; <label>:38                                      ; preds = %23
  %39 = load i64* %i, align 8, !llfi_index !694
  %40 = load i64* %i, align 8, !llfi_index !694
  %41 = srem i64 %39, 200, !llfi_index !695
  %42 = srem i64 %40, 200, !llfi_index !695
  %43 = icmp eq i64 %41, 0, !llfi_index !696
  %44 = icmp eq i64 %42, 0, !llfi_index !696
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %43, i1 %44)
  br i1 %43, label %45, label %65, !llfi_index !697

; <label>:45                                      ; preds = %38
  %46 = load i64* %i, align 8, !llfi_index !698
  %47 = load i64* %i, align 8, !llfi_index !698
  %48 = sitofp i64 %46 to double, !llfi_index !699
  %49 = sitofp i64 %47 to double, !llfi_index !699
  %50 = fmul double 1.000000e+02, %48, !llfi_index !700
  %51 = fmul double 1.000000e+02, %49, !llfi_index !700
  %52 = load i64* %3, align 8, !llfi_index !701
  %53 = load i64* %3, align 8, !llfi_index !701
  %54 = load i64* %4, align 8, !llfi_index !702
  %55 = load i64* %4, align 8, !llfi_index !702
  %56 = mul nsw i64 %52, %54, !llfi_index !703
  %57 = mul nsw i64 %53, %55, !llfi_index !703
  %58 = sdiv i64 %56, 1, !llfi_index !704
  %59 = sdiv i64 %57, 1, !llfi_index !704
  %60 = sitofp i64 %58 to double, !llfi_index !705
  %61 = sitofp i64 %59 to double, !llfi_index !705
  %62 = fdiv double %50, %60, !llfi_index !706
  %63 = fdiv double %51, %61, !llfi_index !706
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %62, double %63)
  %64 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([46 x i8]* @.str5, i32 0, i32 0), double %62), !llfi_index !707
  br label %65, !llfi_index !708

; <label>:65                                      ; preds = %45, %38, %23
  store i64 0, i64* %j, align 8, !llfi_index !709
  br label %66, !llfi_index !710

; <label>:66                                      ; preds = %103, %65
  %67 = load i64* %j, align 8, !llfi_index !711
  %68 = load i64* %j, align 8, !llfi_index !711
  %69 = load i64* %3, align 8, !llfi_index !712
  %70 = load i64* %3, align 8, !llfi_index !712
  %71 = icmp slt i64 %67, %69, !llfi_index !713
  %72 = icmp slt i64 %68, %70, !llfi_index !713
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %71, i1 %72)
  br i1 %71, label %73, label %108, !llfi_index !714

; <label>:73                                      ; preds = %66
  %74 = load i64* %j, align 8, !llfi_index !715
  %75 = load i64* %j, align 8, !llfi_index !715
  %76 = load %struct.NuclideGridPoint*** %2, align 8, !llfi_index !716
  %77 = load %struct.NuclideGridPoint*** %2, align 8, !llfi_index !716
  %78 = getelementptr inbounds %struct.NuclideGridPoint** %76, i64 %74, !llfi_index !717
  %79 = getelementptr inbounds %struct.NuclideGridPoint** %77, i64 %75, !llfi_index !717
  %80 = load %struct.NuclideGridPoint** %78, align 8, !llfi_index !718
  %81 = load %struct.NuclideGridPoint** %79, align 8, !llfi_index !718
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (%struct.NuclideGridPoint*, %struct.NuclideGridPoint*)*)(%struct.NuclideGridPoint* %80, %struct.NuclideGridPoint* %81)
  %82 = load double* %quarry, align 8, !llfi_index !719
  %83 = load double* %quarry, align 8, !llfi_index !719
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %82, double %83)
  %84 = load i64* %4, align 8, !llfi_index !720
  %85 = load i64* %4, align 8, !llfi_index !720
  %86 = trunc i64 %84 to i32, !llfi_index !721
  %87 = trunc i64 %85 to i32, !llfi_index !721
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %86, i32 %87)
  %88 = call i32 @binary_search(%struct.NuclideGridPoint* %80, double %82, i32 %86), !llfi_index !722
  %89 = load i64* %j, align 8, !llfi_index !723
  %90 = load i64* %j, align 8, !llfi_index !723
  %91 = load i64* %i, align 8, !llfi_index !724
  %92 = load i64* %i, align 8, !llfi_index !724
  %93 = load %struct.GridPoint** %1, align 8, !llfi_index !725
  %94 = load %struct.GridPoint** %1, align 8, !llfi_index !725
  %95 = getelementptr inbounds %struct.GridPoint* %93, i64 %91, !llfi_index !726
  %96 = getelementptr inbounds %struct.GridPoint* %94, i64 %92, !llfi_index !726
  %97 = getelementptr inbounds %struct.GridPoint* %95, i32 0, i32 1, !llfi_index !727
  %98 = getelementptr inbounds %struct.GridPoint* %96, i32 0, i32 1, !llfi_index !727
  %99 = load i32** %97, align 8, !llfi_index !728
  %100 = load i32** %98, align 8, !llfi_index !728
  %101 = getelementptr inbounds i32* %99, i64 %89, !llfi_index !729
  %102 = getelementptr inbounds i32* %100, i64 %90, !llfi_index !729
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (i32*, i32*)*)(i32* %101, i32* %102)
  store i32 %88, i32* %101, align 4, !llfi_index !730
  br label %103, !llfi_index !731

; <label>:103                                     ; preds = %73
  %104 = load i64* %j, align 8, !llfi_index !732
  %105 = load i64* %j, align 8, !llfi_index !732
  %106 = add nsw i64 %104, 1, !llfi_index !733
  %107 = add nsw i64 %105, 1, !llfi_index !733
  call void @global_check()
  call void @global_add(i64 %106, i64 %107)
  store i64 %106, i64* %j, align 8, !llfi_index !734
  br label %66, !llfi_index !735

; <label>:108                                     ; preds = %66
  br label %109, !llfi_index !736

; <label>:109                                     ; preds = %108
  %110 = load i64* %i, align 8, !llfi_index !737
  %111 = load i64* %i, align 8, !llfi_index !737
  %112 = add nsw i64 %110, 1, !llfi_index !738
  %113 = add nsw i64 %111, 1, !llfi_index !738
  call void @global_add(i64 %112, i64 %113)
  store i64 %112, i64* %i, align 8, !llfi_index !739
  br label %12, !llfi_index !740

; <label>:114                                     ; preds = %12
  %115 = load i32* %mype, align 4, !llfi_index !741
  %116 = load i32* %mype, align 4, !llfi_index !741
  %117 = icmp eq i32 %115, 0, !llfi_index !742
  %118 = icmp eq i32 %116, 0, !llfi_index !742
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %117, i1 %118)
  br i1 %117, label %119, label %121, !llfi_index !743

; <label>:119                                     ; preds = %114
  %120 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str6, i32 0, i32 0)), !llfi_index !744
  br label %121, !llfi_index !745

; <label>:121                                     ; preds = %119, %114
  ret void, !llfi_index !746
}

; Function Attrs: nounwind uwtable
define void @logo(i32 %version) #0 {
  %1 = alloca i32, align 4, !llfi_index !747
  %v = alloca [100 x i8], align 16, !llfi_index !748
  store i32 %version, i32* %1, align 4, !llfi_index !749
  call void @border_print(), !llfi_index !750
  %2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([488 x i8]* @.str7, i32 0, i32 0)), !llfi_index !751
  call void @border_print(), !llfi_index !752
  call void @center_print(i8* getelementptr inbounds ([41 x i8]* @.str18, i32 0, i32 0), i32 79), !llfi_index !753
  %3 = getelementptr inbounds [100 x i8]* %v, i32 0, i32 0, !llfi_index !754
  %4 = getelementptr inbounds [100 x i8]* %v, i32 0, i32 0, !llfi_index !754
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %3, i8* %4)
  %5 = load i32* %1, align 4, !llfi_index !755
  %6 = load i32* %1, align 4, !llfi_index !755
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %5, i32 %6)
  %7 = call i32 (i8*, i8*, ...)* @sprintf(i8* %3, i8* getelementptr inbounds ([12 x i8]* @.str29, i32 0, i32 0), i32 %5) #3, !llfi_index !756
  %8 = getelementptr inbounds [100 x i8]* %v, i32 0, i32 0, !llfi_index !757
  %9 = getelementptr inbounds [100 x i8]* %v, i32 0, i32 0, !llfi_index !757
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %8, i8* %9)
  call void @center_print(i8* %8, i32 79), !llfi_index !758
  call void @border_print(), !llfi_index !759
  ret void, !llfi_index !760
}

; Function Attrs: nounwind uwtable
define void @border_print() #0 {
  %1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([82 x i8]* @.str23, i32 0, i32 0)), !llfi_index !761
  ret void, !llfi_index !762
}

; Function Attrs: nounwind uwtable
define void @center_print(i8* %s, i32 %width) #0 {
  %1 = alloca i8*, align 8, !llfi_index !763
  %2 = alloca i32, align 4, !llfi_index !764
  %length = alloca i32, align 4, !llfi_index !765
  %i = alloca i32, align 4, !llfi_index !766
  store i8* %s, i8** %1, align 8, !llfi_index !767
  store i32 %width, i32* %2, align 4, !llfi_index !768
  %3 = load i8** %1, align 8, !llfi_index !769
  %4 = load i8** %1, align 8, !llfi_index !769
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %3, i8* %4)
  %5 = call i64 @strlen(i8* %3) #8, !llfi_index !770
  %6 = trunc i64 %5 to i32, !llfi_index !771
  %7 = trunc i64 %5 to i32, !llfi_index !771
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %6, i32 %7)
  store i32 %6, i32* %length, align 4, !llfi_index !772
  store i32 0, i32* %i, align 4, !llfi_index !773
  br label %8, !llfi_index !774

; <label>:8                                       ; preds = %25, %0
  %9 = load i32* %i, align 4, !llfi_index !775
  %10 = load i32* %i, align 4, !llfi_index !775
  %11 = load i32* %2, align 4, !llfi_index !776
  %12 = load i32* %2, align 4, !llfi_index !776
  %13 = load i32* %length, align 4, !llfi_index !777
  %14 = load i32* %length, align 4, !llfi_index !777
  %15 = sub nsw i32 %11, %13, !llfi_index !778
  %16 = sub nsw i32 %12, %14, !llfi_index !778
  %17 = sdiv i32 %15, 2, !llfi_index !779
  %18 = sdiv i32 %16, 2, !llfi_index !779
  %19 = icmp sle i32 %9, %17, !llfi_index !780
  %20 = icmp sle i32 %10, %18, !llfi_index !780
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %19, i1 %20)
  br i1 %19, label %21, label %30, !llfi_index !781

; <label>:21                                      ; preds = %8
  %22 = load %struct._IO_FILE** @stdout, align 8, !llfi_index !782
  %23 = load %struct._IO_FILE** @stdout, align 8, !llfi_index !782
  call void bitcast (void (i64, i64)* @global_add to void (%struct._IO_FILE*, %struct._IO_FILE*)*)(%struct._IO_FILE* %22, %struct._IO_FILE* %23)
  %24 = call i32 @fputs(i8* getelementptr inbounds ([2 x i8]* @.str310, i32 0, i32 0), %struct._IO_FILE* %22), !llfi_index !783
  br label %25, !llfi_index !784

; <label>:25                                      ; preds = %21
  %26 = load i32* %i, align 4, !llfi_index !785
  %27 = load i32* %i, align 4, !llfi_index !785
  %28 = add nsw i32 %26, 1, !llfi_index !786
  %29 = add nsw i32 %27, 1, !llfi_index !786
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %28, i32 %29)
  store i32 %28, i32* %i, align 4, !llfi_index !787
  br label %8, !llfi_index !788

; <label>:30                                      ; preds = %8
  %31 = load i8** %1, align 8, !llfi_index !789
  %32 = load i8** %1, align 8, !llfi_index !789
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %31, i8* %32)
  %33 = load %struct._IO_FILE** @stdout, align 8, !llfi_index !790
  %34 = load %struct._IO_FILE** @stdout, align 8, !llfi_index !790
  call void bitcast (void (i64, i64)* @global_add to void (%struct._IO_FILE*, %struct._IO_FILE*)*)(%struct._IO_FILE* %33, %struct._IO_FILE* %34)
  %35 = call i32 @fputs(i8* %31, %struct._IO_FILE* %33), !llfi_index !791
  %36 = load %struct._IO_FILE** @stdout, align 8, !llfi_index !792
  %37 = load %struct._IO_FILE** @stdout, align 8, !llfi_index !792
  call void bitcast (void (i64, i64)* @global_add to void (%struct._IO_FILE*, %struct._IO_FILE*)*)(%struct._IO_FILE* %36, %struct._IO_FILE* %37)
  %38 = call i32 @fputs(i8* getelementptr inbounds ([2 x i8]* @.str411, i32 0, i32 0), %struct._IO_FILE* %36), !llfi_index !793
  ret void, !llfi_index !794
}

; Function Attrs: nounwind
declare i32 @sprintf(i8*, i8*, ...) #2

; Function Attrs: nounwind readonly
declare i64 @strlen(i8*) #5

declare i32 @fputs(i8*, %struct._IO_FILE*) #1

; Function Attrs: nounwind uwtable
define void @print_results(%struct.Inputs* byval align 8 %in, i32 %mype, double %runtime, i32 %nprocs, i64 %vhash) #0 {
  %1 = alloca i32, align 4, !llfi_index !795
  %2 = alloca double, align 8, !llfi_index !796
  %3 = alloca i32, align 4, !llfi_index !797
  %4 = alloca i64, align 8, !llfi_index !798
  %lookups_per_sec = alloca i32, align 4, !llfi_index !799
  %out = alloca %struct._IO_FILE*, align 8, !llfi_index !800
  store i32 %mype, i32* %1, align 4, !llfi_index !801
  store double %runtime, double* %2, align 8, !llfi_index !802
  store i32 %nprocs, i32* %3, align 4, !llfi_index !803
  store i64 %vhash, i64* %4, align 8, !llfi_index !804
  %5 = getelementptr inbounds %struct.Inputs* %in, i32 0, i32 3, !llfi_index !805
  %6 = getelementptr inbounds %struct.Inputs* %in, i32 0, i32 3, !llfi_index !805
  %7 = load i32* %5, align 4, !llfi_index !806
  %8 = load i32* %6, align 4, !llfi_index !806
  %9 = sitofp i32 %7 to double, !llfi_index !807
  %10 = sitofp i32 %8 to double, !llfi_index !807
  %11 = load double* %2, align 8, !llfi_index !808
  %12 = load double* %2, align 8, !llfi_index !808
  %13 = fdiv double %9, %11, !llfi_index !809
  %14 = fdiv double %10, %12, !llfi_index !809
  %15 = fptosi double %13 to i32, !llfi_index !810
  %16 = fptosi double %14 to i32, !llfi_index !810
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %15, i32 %16)
  store i32 %15, i32* %lookups_per_sec, align 4, !llfi_index !811
  %17 = load i32* %1, align 4, !llfi_index !812
  %18 = load i32* %1, align 4, !llfi_index !812
  %19 = icmp eq i32 %17, 0, !llfi_index !813
  %20 = icmp eq i32 %18, 0, !llfi_index !813
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %19, i1 %20)
  br i1 %19, label %21, label %50, !llfi_index !814

; <label>:21                                      ; preds = %0
  call void @border_print(), !llfi_index !815
  call void @center_print(i8* getelementptr inbounds ([8 x i8]* @.str512, i32 0, i32 0), i32 79), !llfi_index !816
  call void @border_print(), !llfi_index !817
  %22 = getelementptr inbounds %struct.Inputs* %in, i32 0, i32 0, !llfi_index !818
  %23 = getelementptr inbounds %struct.Inputs* %in, i32 0, i32 0, !llfi_index !818
  %24 = load i32* %22, align 4, !llfi_index !819
  %25 = load i32* %23, align 4, !llfi_index !819
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %24, i32 %25)
  %26 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str613, i32 0, i32 0), i32 %24), !llfi_index !820
  %27 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([14 x i8]* @.str714, i32 0, i32 0)), !llfi_index !821
  %28 = getelementptr inbounds %struct.Inputs* %in, i32 0, i32 3, !llfi_index !822
  %29 = getelementptr inbounds %struct.Inputs* %in, i32 0, i32 3, !llfi_index !822
  %30 = load i32* %28, align 4, !llfi_index !823
  %31 = load i32* %29, align 4, !llfi_index !823
  %32 = sext i32 %30 to i64, !llfi_index !824
  %33 = sext i32 %31 to i64, !llfi_index !824
  call void @global_add(i64 %32, i64 %33)
  call void @fancy_int(i64 %32), !llfi_index !825
  %34 = load i64* %4, align 8, !llfi_index !826
  %35 = load i64* %4, align 8, !llfi_index !826
  call void @global_add(i64 %34, i64 %35)
  %36 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str8, i32 0, i32 0), i64 %34), !llfi_index !827
  call void @border_print(), !llfi_index !828
  %37 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([12 x i8]* @.str9, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str10, i32 0, i32 0)), !llfi_index !829
  store %struct._IO_FILE* %37, %struct._IO_FILE** %out, align 8, !llfi_index !830
  %38 = load %struct._IO_FILE** %out, align 8, !llfi_index !831
  %39 = load %struct._IO_FILE** %out, align 8, !llfi_index !831
  call void bitcast (void (i64, i64)* @global_add to void (%struct._IO_FILE*, %struct._IO_FILE*)*)(%struct._IO_FILE* %38, %struct._IO_FILE* %39)
  %40 = getelementptr inbounds %struct.Inputs* %in, i32 0, i32 0, !llfi_index !832
  %41 = getelementptr inbounds %struct.Inputs* %in, i32 0, i32 0, !llfi_index !832
  %42 = load i32* %40, align 4, !llfi_index !833
  %43 = load i32* %41, align 4, !llfi_index !833
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %42, i32 %43)
  %44 = load i32* %lookups_per_sec, align 4, !llfi_index !834
  %45 = load i32* %lookups_per_sec, align 4, !llfi_index !834
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %44, i32 %45)
  %46 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %38, i8* getelementptr inbounds ([7 x i8]* @.str11, i32 0, i32 0), i32 %42, i32 %44), !llfi_index !835
  %47 = load %struct._IO_FILE** %out, align 8, !llfi_index !836
  %48 = load %struct._IO_FILE** %out, align 8, !llfi_index !836
  call void bitcast (void (i64, i64)* @global_add to void (%struct._IO_FILE*, %struct._IO_FILE*)*)(%struct._IO_FILE* %47, %struct._IO_FILE* %48)
  %49 = call i32 @fclose(%struct._IO_FILE* %47), !llfi_index !837
  br label %50, !llfi_index !838

; <label>:50                                      ; preds = %21, %0
  ret void, !llfi_index !839
}

; Function Attrs: nounwind uwtable
define void @fancy_int(i64 %a) #0 {
  %1 = alloca i64, align 8, !llfi_index !840
  store i64 %a, i64* %1, align 8, !llfi_index !841
  %2 = load i64* %1, align 8, !llfi_index !842
  %3 = load i64* %1, align 8, !llfi_index !842
  %4 = icmp slt i64 %2, 1000, !llfi_index !843
  %5 = icmp slt i64 %3, 1000, !llfi_index !843
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %4, i1 %5)
  br i1 %4, label %6, label %10, !llfi_index !844

; <label>:6                                       ; preds = %0
  %7 = load i64* %1, align 8, !llfi_index !845
  %8 = load i64* %1, align 8, !llfi_index !845
  call void @global_add(i64 %7, i64 %8)
  %9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str24, i32 0, i32 0), i64 %7), !llfi_index !846
  br label %90, !llfi_index !847

; <label>:10                                      ; preds = %0
  %11 = load i64* %1, align 8, !llfi_index !848
  %12 = load i64* %1, align 8, !llfi_index !848
  %13 = icmp sge i64 %11, 1000, !llfi_index !849
  %14 = icmp sge i64 %12, 1000, !llfi_index !849
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %13, i1 %14)
  br i1 %13, label %15, label %30, !llfi_index !850

; <label>:15                                      ; preds = %10
  %16 = load i64* %1, align 8, !llfi_index !851
  %17 = load i64* %1, align 8, !llfi_index !851
  %18 = icmp slt i64 %16, 1000000, !llfi_index !852
  %19 = icmp slt i64 %17, 1000000, !llfi_index !852
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %18, i1 %19)
  br i1 %18, label %20, label %30, !llfi_index !853

; <label>:20                                      ; preds = %15
  %21 = load i64* %1, align 8, !llfi_index !854
  %22 = load i64* %1, align 8, !llfi_index !854
  %23 = sdiv i64 %21, 1000, !llfi_index !855
  %24 = sdiv i64 %22, 1000, !llfi_index !855
  call void @global_add(i64 %23, i64 %24)
  %25 = load i64* %1, align 8, !llfi_index !856
  %26 = load i64* %1, align 8, !llfi_index !856
  %27 = srem i64 %25, 1000, !llfi_index !857
  %28 = srem i64 %26, 1000, !llfi_index !857
  call void @global_add(i64 %27, i64 %28)
  %29 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str25, i32 0, i32 0), i64 %23, i64 %27), !llfi_index !858
  br label %89, !llfi_index !859

; <label>:30                                      ; preds = %15, %10
  %31 = load i64* %1, align 8, !llfi_index !860
  %32 = load i64* %1, align 8, !llfi_index !860
  %33 = icmp sge i64 %31, 1000000, !llfi_index !861
  %34 = icmp sge i64 %32, 1000000, !llfi_index !861
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %33, i1 %34)
  br i1 %33, label %35, label %56, !llfi_index !862

; <label>:35                                      ; preds = %30
  %36 = load i64* %1, align 8, !llfi_index !863
  %37 = load i64* %1, align 8, !llfi_index !863
  %38 = icmp slt i64 %36, 1000000000, !llfi_index !864
  %39 = icmp slt i64 %37, 1000000000, !llfi_index !864
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %38, i1 %39)
  br i1 %38, label %40, label %56, !llfi_index !865

; <label>:40                                      ; preds = %35
  %41 = load i64* %1, align 8, !llfi_index !866
  %42 = load i64* %1, align 8, !llfi_index !866
  %43 = sdiv i64 %41, 1000000, !llfi_index !867
  %44 = sdiv i64 %42, 1000000, !llfi_index !867
  call void @global_add(i64 %43, i64 %44)
  %45 = load i64* %1, align 8, !llfi_index !868
  %46 = load i64* %1, align 8, !llfi_index !868
  %47 = srem i64 %45, 1000000, !llfi_index !869
  %48 = srem i64 %46, 1000000, !llfi_index !869
  %49 = sdiv i64 %47, 1000, !llfi_index !870
  %50 = sdiv i64 %48, 1000, !llfi_index !870
  call void @global_add(i64 %49, i64 %50)
  %51 = load i64* %1, align 8, !llfi_index !871
  %52 = load i64* %1, align 8, !llfi_index !871
  %53 = srem i64 %51, 1000, !llfi_index !872
  %54 = srem i64 %52, 1000, !llfi_index !872
  call void @global_add(i64 %53, i64 %54)
  %55 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str26, i32 0, i32 0), i64 %43, i64 %49, i64 %53), !llfi_index !873
  br label %88, !llfi_index !874

; <label>:56                                      ; preds = %35, %30
  %57 = load i64* %1, align 8, !llfi_index !875
  %58 = load i64* %1, align 8, !llfi_index !875
  %59 = icmp sge i64 %57, 1000000000, !llfi_index !876
  %60 = icmp sge i64 %58, 1000000000, !llfi_index !876
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %59, i1 %60)
  br i1 %59, label %61, label %83, !llfi_index !877

; <label>:61                                      ; preds = %56
  %62 = load i64* %1, align 8, !llfi_index !878
  %63 = load i64* %1, align 8, !llfi_index !878
  %64 = sdiv i64 %62, 1000000000, !llfi_index !879
  %65 = sdiv i64 %63, 1000000000, !llfi_index !879
  call void @global_add(i64 %64, i64 %65)
  %66 = load i64* %1, align 8, !llfi_index !880
  %67 = load i64* %1, align 8, !llfi_index !880
  %68 = srem i64 %66, 1000000000, !llfi_index !881
  %69 = srem i64 %67, 1000000000, !llfi_index !881
  %70 = sdiv i64 %68, 1000000, !llfi_index !882
  %71 = sdiv i64 %69, 1000000, !llfi_index !882
  call void @global_add(i64 %70, i64 %71)
  %72 = load i64* %1, align 8, !llfi_index !883
  %73 = load i64* %1, align 8, !llfi_index !883
  %74 = srem i64 %72, 1000000, !llfi_index !884
  %75 = srem i64 %73, 1000000, !llfi_index !884
  %76 = sdiv i64 %74, 1000, !llfi_index !885
  %77 = sdiv i64 %75, 1000, !llfi_index !885
  call void @global_add(i64 %76, i64 %77)
  %78 = load i64* %1, align 8, !llfi_index !886
  %79 = load i64* %1, align 8, !llfi_index !886
  %80 = srem i64 %78, 1000, !llfi_index !887
  %81 = srem i64 %79, 1000, !llfi_index !887
  call void @global_add(i64 %80, i64 %81)
  %82 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str27, i32 0, i32 0), i64 %64, i64 %70, i64 %76, i64 %80), !llfi_index !888
  br label %87, !llfi_index !889

; <label>:83                                      ; preds = %56
  %84 = load i64* %1, align 8, !llfi_index !890
  %85 = load i64* %1, align 8, !llfi_index !890
  call void @global_add(i64 %84, i64 %85)
  %86 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str24, i32 0, i32 0), i64 %84), !llfi_index !891
  br label %87, !llfi_index !892

; <label>:87                                      ; preds = %83, %61
  br label %88, !llfi_index !893

; <label>:88                                      ; preds = %87, %40
  br label %89, !llfi_index !894

; <label>:89                                      ; preds = %88, %20
  br label %90, !llfi_index !895

; <label>:90                                      ; preds = %89, %6
  ret void, !llfi_index !896
}

declare %struct._IO_FILE* @fopen(i8*, i8*) #1

declare i32 @fclose(%struct._IO_FILE*) #1

; Function Attrs: nounwind uwtable
define void @print_inputs(%struct.Inputs* byval align 8 %in, i32 %nprocs, i32 %version) #0 {
  %1 = alloca i32, align 4, !llfi_index !897
  %2 = alloca i32, align 4, !llfi_index !898
  %mem_tot = alloca i32, align 4, !llfi_index !899
  store i32 %nprocs, i32* %1, align 4, !llfi_index !900
  store i32 %version, i32* %2, align 4, !llfi_index !901
  %3 = call i64 @estimate_mem_usage(%struct.Inputs* byval align 8 %in), !llfi_index !902
  %4 = trunc i64 %3 to i32, !llfi_index !903
  %5 = trunc i64 %3 to i32, !llfi_index !903
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %4, i32 %5)
  store i32 %4, i32* %mem_tot, align 4, !llfi_index !904
  %6 = load i32* %2, align 4, !llfi_index !905
  %7 = load i32* %2, align 4, !llfi_index !905
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %6, i32 %7)
  call void @logo(i32 %6), !llfi_index !906
  call void @center_print(i8* getelementptr inbounds ([14 x i8]* @.str12, i32 0, i32 0), i32 79), !llfi_index !907
  call void @border_print(), !llfi_index !908
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([34 x i8]* @.str13, i32 0, i32 0)), !llfi_index !909
  %9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([34 x i8]* @.str14, i32 0, i32 0), i32 12), !llfi_index !910
  %10 = getelementptr inbounds %struct.Inputs* %in, i32 0, i32 4, !llfi_index !911
  %11 = getelementptr inbounds %struct.Inputs* %in, i32 0, i32 4, !llfi_index !911
  %12 = load i8** %10, align 8, !llfi_index !912
  %13 = load i8** %11, align 8, !llfi_index !912
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %12, i8* %13)
  %14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([34 x i8]* @.str15, i32 0, i32 0), i8* %12), !llfi_index !913
  %15 = getelementptr inbounds %struct.Inputs* %in, i32 0, i32 1, !llfi_index !914
  %16 = getelementptr inbounds %struct.Inputs* %in, i32 0, i32 1, !llfi_index !914
  %17 = load i64* %15, align 8, !llfi_index !915
  %18 = load i64* %16, align 8, !llfi_index !915
  call void @global_add(i64 %17, i64 %18)
  %19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([35 x i8]* @.str16, i32 0, i32 0), i64 %17), !llfi_index !916
  %20 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str17, i32 0, i32 0)), !llfi_index !917
  %21 = getelementptr inbounds %struct.Inputs* %in, i32 0, i32 2, !llfi_index !918
  %22 = getelementptr inbounds %struct.Inputs* %in, i32 0, i32 2, !llfi_index !918
  %23 = load i64* %21, align 8, !llfi_index !919
  %24 = load i64* %22, align 8, !llfi_index !919
  call void @global_add(i64 %23, i64 %24)
  call void @fancy_int(i64 %23), !llfi_index !920
  %25 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str1815, i32 0, i32 0)), !llfi_index !921
  %26 = getelementptr inbounds %struct.Inputs* %in, i32 0, i32 1, !llfi_index !922
  %27 = getelementptr inbounds %struct.Inputs* %in, i32 0, i32 1, !llfi_index !922
  %28 = load i64* %26, align 8, !llfi_index !923
  %29 = load i64* %27, align 8, !llfi_index !923
  %30 = getelementptr inbounds %struct.Inputs* %in, i32 0, i32 2, !llfi_index !924
  %31 = getelementptr inbounds %struct.Inputs* %in, i32 0, i32 2, !llfi_index !924
  %32 = load i64* %30, align 8, !llfi_index !925
  %33 = load i64* %31, align 8, !llfi_index !925
  %34 = mul nsw i64 %28, %32, !llfi_index !926
  %35 = mul nsw i64 %29, %33, !llfi_index !926
  call void @global_add(i64 %34, i64 %35)
  call void @fancy_int(i64 %34), !llfi_index !927
  %36 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str19, i32 0, i32 0)), !llfi_index !928
  %37 = getelementptr inbounds %struct.Inputs* %in, i32 0, i32 3, !llfi_index !929
  %38 = getelementptr inbounds %struct.Inputs* %in, i32 0, i32 3, !llfi_index !929
  %39 = load i32* %37, align 4, !llfi_index !930
  %40 = load i32* %38, align 4, !llfi_index !930
  %41 = sext i32 %39 to i64, !llfi_index !931
  %42 = sext i32 %40 to i64, !llfi_index !931
  call void @global_add(i64 %41, i64 %42)
  call void @fancy_int(i64 %41), !llfi_index !932
  %43 = getelementptr inbounds %struct.Inputs* %in, i32 0, i32 0, !llfi_index !933
  %44 = getelementptr inbounds %struct.Inputs* %in, i32 0, i32 0, !llfi_index !933
  %45 = load i32* %43, align 4, !llfi_index !934
  %46 = load i32* %44, align 4, !llfi_index !934
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %45, i32 %46)
  %47 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([34 x i8]* @.str20, i32 0, i32 0), i32 %45), !llfi_index !935
  %48 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str21, i32 0, i32 0)), !llfi_index !936
  %49 = load i32* %mem_tot, align 4, !llfi_index !937
  %50 = load i32* %mem_tot, align 4, !llfi_index !937
  %51 = sext i32 %49 to i64, !llfi_index !938
  %52 = sext i32 %50 to i64, !llfi_index !938
  call void @global_add(i64 %51, i64 %52)
  call void @fancy_int(i64 %51), !llfi_index !939
  call void @border_print(), !llfi_index !940
  call void @center_print(i8* getelementptr inbounds ([15 x i8]* @.str22, i32 0, i32 0), i32 79), !llfi_index !941
  call void @border_print(), !llfi_index !942
  ret void, !llfi_index !943
}

; Function Attrs: nounwind uwtable
define void @print_CLI_error() #0 {
  %1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str28, i32 0, i32 0)), !llfi_index !944
  %2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([18 x i8]* @.str2916, i32 0, i32 0)), !llfi_index !945
  %3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([52 x i8]* @.str30, i32 0, i32 0)), !llfi_index !946
  %4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([73 x i8]* @.str31, i32 0, i32 0)), !llfi_index !947
  %5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([77 x i8]* @.str32, i32 0, i32 0)), !llfi_index !948
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([57 x i8]* @.str33, i32 0, i32 0)), !llfi_index !949
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([48 x i8]* @.str34, i32 0, i32 0)), !llfi_index !950
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([55 x i8]* @.str35, i32 0, i32 0)), !llfi_index !951
  call void @global_check()
  call void @exit(i32 4) #7, !llfi_index !952
  unreachable, !llfi_index !953
                                                  ; No predecessors!
  ret void, !llfi_index !954
}

; Function Attrs: nounwind uwtable
define void @read_CLI(%struct.Inputs* noalias sret %agg.result, i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4, !llfi_index !955
  %2 = alloca i8**, align 8, !llfi_index !956
  %input = alloca %struct.Inputs, align 8, !llfi_index !957
  %user_g = alloca i32, align 4, !llfi_index !958
  %i = alloca i32, align 4, !llfi_index !959
  %arg = alloca i8*, align 8, !llfi_index !960
  store i32 %argc, i32* %1, align 4, !llfi_index !961
  store i8** %argv, i8*** %2, align 8, !llfi_index !962
  %3 = getelementptr inbounds %struct.Inputs* %input, i32 0, i32 0, !llfi_index !963
  %4 = getelementptr inbounds %struct.Inputs* %input, i32 0, i32 0, !llfi_index !963
  call void bitcast (void (i64, i64)* @global_add to void (i32*, i32*)*)(i32* %3, i32* %4)
  store i32 1, i32* %3, align 4, !llfi_index !964
  %5 = getelementptr inbounds %struct.Inputs* %input, i32 0, i32 1, !llfi_index !965
  %6 = getelementptr inbounds %struct.Inputs* %input, i32 0, i32 1, !llfi_index !965
  call void bitcast (void (i64, i64)* @global_add to void (i64*, i64*)*)(i64* %5, i64* %6)
  store i64 355, i64* %5, align 8, !llfi_index !966
  %7 = getelementptr inbounds %struct.Inputs* %input, i32 0, i32 2, !llfi_index !967
  %8 = getelementptr inbounds %struct.Inputs* %input, i32 0, i32 2, !llfi_index !967
  call void bitcast (void (i64, i64)* @global_add to void (i64*, i64*)*)(i64* %7, i64* %8)
  store i64 11303, i64* %7, align 8, !llfi_index !968
  %9 = getelementptr inbounds %struct.Inputs* %input, i32 0, i32 3, !llfi_index !969
  %10 = getelementptr inbounds %struct.Inputs* %input, i32 0, i32 3, !llfi_index !969
  call void bitcast (void (i64, i64)* @global_add to void (i32*, i32*)*)(i32* %9, i32* %10)
  store i32 15000000, i32* %9, align 4, !llfi_index !970
  %11 = call noalias i8* @malloc(i64 6) #3, !llfi_index !971
  %12 = getelementptr inbounds %struct.Inputs* %input, i32 0, i32 4, !llfi_index !972
  %13 = getelementptr inbounds %struct.Inputs* %input, i32 0, i32 4, !llfi_index !972
  call void bitcast (void (i64, i64)* @global_add to void (i8**, i8**)*)(i8** %12, i8** %13)
  store i8* %11, i8** %12, align 8, !llfi_index !973
  %14 = getelementptr inbounds %struct.Inputs* %input, i32 0, i32 4, !llfi_index !974
  %15 = getelementptr inbounds %struct.Inputs* %input, i32 0, i32 4, !llfi_index !974
  %16 = load i8** %14, align 8, !llfi_index !975
  %17 = load i8** %15, align 8, !llfi_index !975
  %18 = getelementptr inbounds i8* %16, i64 0, !llfi_index !976
  %19 = getelementptr inbounds i8* %17, i64 0, !llfi_index !976
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %18, i8* %19)
  store i8 108, i8* %18, align 1, !llfi_index !977
  %20 = getelementptr inbounds %struct.Inputs* %input, i32 0, i32 4, !llfi_index !978
  %21 = getelementptr inbounds %struct.Inputs* %input, i32 0, i32 4, !llfi_index !978
  %22 = load i8** %20, align 8, !llfi_index !979
  %23 = load i8** %21, align 8, !llfi_index !979
  %24 = getelementptr inbounds i8* %22, i64 1, !llfi_index !980
  %25 = getelementptr inbounds i8* %23, i64 1, !llfi_index !980
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %24, i8* %25)
  store i8 97, i8* %24, align 1, !llfi_index !981
  %26 = getelementptr inbounds %struct.Inputs* %input, i32 0, i32 4, !llfi_index !982
  %27 = getelementptr inbounds %struct.Inputs* %input, i32 0, i32 4, !llfi_index !982
  %28 = load i8** %26, align 8, !llfi_index !983
  %29 = load i8** %27, align 8, !llfi_index !983
  %30 = getelementptr inbounds i8* %28, i64 2, !llfi_index !984
  %31 = getelementptr inbounds i8* %29, i64 2, !llfi_index !984
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %30, i8* %31)
  store i8 114, i8* %30, align 1, !llfi_index !985
  %32 = getelementptr inbounds %struct.Inputs* %input, i32 0, i32 4, !llfi_index !986
  %33 = getelementptr inbounds %struct.Inputs* %input, i32 0, i32 4, !llfi_index !986
  %34 = load i8** %32, align 8, !llfi_index !987
  %35 = load i8** %33, align 8, !llfi_index !987
  %36 = getelementptr inbounds i8* %34, i64 3, !llfi_index !988
  %37 = getelementptr inbounds i8* %35, i64 3, !llfi_index !988
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %36, i8* %37)
  store i8 103, i8* %36, align 1, !llfi_index !989
  %38 = getelementptr inbounds %struct.Inputs* %input, i32 0, i32 4, !llfi_index !990
  %39 = getelementptr inbounds %struct.Inputs* %input, i32 0, i32 4, !llfi_index !990
  %40 = load i8** %38, align 8, !llfi_index !991
  %41 = load i8** %39, align 8, !llfi_index !991
  %42 = getelementptr inbounds i8* %40, i64 4, !llfi_index !992
  %43 = getelementptr inbounds i8* %41, i64 4, !llfi_index !992
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %42, i8* %43)
  store i8 101, i8* %42, align 1, !llfi_index !993
  %44 = getelementptr inbounds %struct.Inputs* %input, i32 0, i32 4, !llfi_index !994
  %45 = getelementptr inbounds %struct.Inputs* %input, i32 0, i32 4, !llfi_index !994
  %46 = load i8** %44, align 8, !llfi_index !995
  %47 = load i8** %45, align 8, !llfi_index !995
  %48 = getelementptr inbounds i8* %46, i64 5, !llfi_index !996
  %49 = getelementptr inbounds i8* %47, i64 5, !llfi_index !996
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %48, i8* %49)
  store i8 0, i8* %48, align 1, !llfi_index !997
  store i32 0, i32* %user_g, align 4, !llfi_index !998
  store i32 1, i32* %i, align 4, !llfi_index !999
  br label %50, !llfi_index !1000

; <label>:50                                      ; preds = %195, %0
  %51 = load i32* %i, align 4, !llfi_index !1001
  %52 = load i32* %i, align 4, !llfi_index !1001
  %53 = load i32* %1, align 4, !llfi_index !1002
  %54 = load i32* %1, align 4, !llfi_index !1002
  %55 = icmp slt i32 %51, %53, !llfi_index !1003
  %56 = icmp slt i32 %52, %54, !llfi_index !1003
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %55, i1 %56)
  br i1 %55, label %57, label %200, !llfi_index !1004

; <label>:57                                      ; preds = %50
  %58 = load i32* %i, align 4, !llfi_index !1005
  %59 = load i32* %i, align 4, !llfi_index !1005
  %60 = sext i32 %58 to i64, !llfi_index !1006
  %61 = sext i32 %59 to i64, !llfi_index !1006
  %62 = load i8*** %2, align 8, !llfi_index !1007
  %63 = load i8*** %2, align 8, !llfi_index !1007
  %64 = getelementptr inbounds i8** %62, i64 %60, !llfi_index !1008
  %65 = getelementptr inbounds i8** %63, i64 %61, !llfi_index !1008
  %66 = load i8** %64, align 8, !llfi_index !1009
  %67 = load i8** %65, align 8, !llfi_index !1009
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %66, i8* %67)
  store i8* %66, i8** %arg, align 8, !llfi_index !1010
  %68 = load i8** %arg, align 8, !llfi_index !1011
  %69 = load i8** %arg, align 8, !llfi_index !1011
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %68, i8* %69)
  %70 = call i32 @strcmp(i8* %68, i8* getelementptr inbounds ([3 x i8]* @.str36, i32 0, i32 0)) #8, !llfi_index !1012
  %71 = icmp eq i32 %70, 0, !llfi_index !1013
  %72 = icmp eq i32 %70, 0, !llfi_index !1013
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %71, i1 %72)
  br i1 %71, label %73, label %98, !llfi_index !1014

; <label>:73                                      ; preds = %57
  %74 = load i32* %i, align 4, !llfi_index !1015
  %75 = load i32* %i, align 4, !llfi_index !1015
  %76 = add nsw i32 %74, 1, !llfi_index !1016
  %77 = add nsw i32 %75, 1, !llfi_index !1016
  store i32 %76, i32* %i, align 4, !llfi_index !1017
  %78 = load i32* %1, align 4, !llfi_index !1018
  %79 = load i32* %1, align 4, !llfi_index !1018
  %80 = icmp slt i32 %76, %78, !llfi_index !1019
  %81 = icmp slt i32 %77, %79, !llfi_index !1019
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %80, i1 %81)
  br i1 %80, label %82, label %96, !llfi_index !1020

; <label>:82                                      ; preds = %73
  %83 = load i32* %i, align 4, !llfi_index !1021
  %84 = load i32* %i, align 4, !llfi_index !1021
  %85 = sext i32 %83 to i64, !llfi_index !1022
  %86 = sext i32 %84 to i64, !llfi_index !1022
  %87 = load i8*** %2, align 8, !llfi_index !1023
  %88 = load i8*** %2, align 8, !llfi_index !1023
  %89 = getelementptr inbounds i8** %87, i64 %85, !llfi_index !1024
  %90 = getelementptr inbounds i8** %88, i64 %86, !llfi_index !1024
  %91 = load i8** %89, align 8, !llfi_index !1025
  %92 = load i8** %90, align 8, !llfi_index !1025
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %91, i8* %92)
  %93 = call i32 @atoi(i8* %91) #8, !llfi_index !1026
  %94 = getelementptr inbounds %struct.Inputs* %input, i32 0, i32 0, !llfi_index !1027
  %95 = getelementptr inbounds %struct.Inputs* %input, i32 0, i32 0, !llfi_index !1027
  call void bitcast (void (i64, i64)* @global_add to void (i32*, i32*)*)(i32* %94, i32* %95)
  store i32 %93, i32* %94, align 4, !llfi_index !1028
  br label %97, !llfi_index !1029

; <label>:96                                      ; preds = %73
  call void @print_CLI_error(), !llfi_index !1030
  br label %97, !llfi_index !1031

; <label>:97                                      ; preds = %96, %82
  br label %194, !llfi_index !1032

; <label>:98                                      ; preds = %57
  %99 = load i8** %arg, align 8, !llfi_index !1033
  %100 = load i8** %arg, align 8, !llfi_index !1033
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %99, i8* %100)
  %101 = call i32 @strcmp(i8* %99, i8* getelementptr inbounds ([3 x i8]* @.str37, i32 0, i32 0)) #8, !llfi_index !1034
  %102 = icmp eq i32 %101, 0, !llfi_index !1035
  %103 = icmp eq i32 %101, 0, !llfi_index !1035
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %102, i1 %103)
  br i1 %102, label %104, label %129, !llfi_index !1036

; <label>:104                                     ; preds = %98
  %105 = load i32* %i, align 4, !llfi_index !1037
  %106 = load i32* %i, align 4, !llfi_index !1037
  %107 = add nsw i32 %105, 1, !llfi_index !1038
  %108 = add nsw i32 %106, 1, !llfi_index !1038
  store i32 %107, i32* %i, align 4, !llfi_index !1039
  %109 = load i32* %1, align 4, !llfi_index !1040
  %110 = load i32* %1, align 4, !llfi_index !1040
  %111 = icmp slt i32 %107, %109, !llfi_index !1041
  %112 = icmp slt i32 %108, %110, !llfi_index !1041
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %111, i1 %112)
  br i1 %111, label %113, label %127, !llfi_index !1042

; <label>:113                                     ; preds = %104
  store i32 1, i32* %user_g, align 4, !llfi_index !1043
  %114 = load i32* %i, align 4, !llfi_index !1044
  %115 = load i32* %i, align 4, !llfi_index !1044
  %116 = sext i32 %114 to i64, !llfi_index !1045
  %117 = sext i32 %115 to i64, !llfi_index !1045
  %118 = load i8*** %2, align 8, !llfi_index !1046
  %119 = load i8*** %2, align 8, !llfi_index !1046
  %120 = getelementptr inbounds i8** %118, i64 %116, !llfi_index !1047
  %121 = getelementptr inbounds i8** %119, i64 %117, !llfi_index !1047
  %122 = load i8** %120, align 8, !llfi_index !1048
  %123 = load i8** %121, align 8, !llfi_index !1048
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %122, i8* %123)
  %124 = call i64 @atol(i8* %122) #8, !llfi_index !1049
  %125 = getelementptr inbounds %struct.Inputs* %input, i32 0, i32 2, !llfi_index !1050
  %126 = getelementptr inbounds %struct.Inputs* %input, i32 0, i32 2, !llfi_index !1050
  call void bitcast (void (i64, i64)* @global_add to void (i64*, i64*)*)(i64* %125, i64* %126)
  store i64 %124, i64* %125, align 8, !llfi_index !1051
  br label %128, !llfi_index !1052

; <label>:127                                     ; preds = %104
  call void @print_CLI_error(), !llfi_index !1053
  br label %128, !llfi_index !1054

; <label>:128                                     ; preds = %127, %113
  br label %193, !llfi_index !1055

; <label>:129                                     ; preds = %98
  %130 = load i8** %arg, align 8, !llfi_index !1056
  %131 = load i8** %arg, align 8, !llfi_index !1056
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %130, i8* %131)
  %132 = call i32 @strcmp(i8* %130, i8* getelementptr inbounds ([3 x i8]* @.str38, i32 0, i32 0)) #8, !llfi_index !1057
  %133 = icmp eq i32 %132, 0, !llfi_index !1058
  %134 = icmp eq i32 %132, 0, !llfi_index !1058
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %133, i1 %134)
  br i1 %133, label %135, label %160, !llfi_index !1059

; <label>:135                                     ; preds = %129
  %136 = load i32* %i, align 4, !llfi_index !1060
  %137 = load i32* %i, align 4, !llfi_index !1060
  %138 = add nsw i32 %136, 1, !llfi_index !1061
  %139 = add nsw i32 %137, 1, !llfi_index !1061
  store i32 %138, i32* %i, align 4, !llfi_index !1062
  %140 = load i32* %1, align 4, !llfi_index !1063
  %141 = load i32* %1, align 4, !llfi_index !1063
  %142 = icmp slt i32 %138, %140, !llfi_index !1064
  %143 = icmp slt i32 %139, %141, !llfi_index !1064
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %142, i1 %143)
  br i1 %142, label %144, label %158, !llfi_index !1065

; <label>:144                                     ; preds = %135
  %145 = load i32* %i, align 4, !llfi_index !1066
  %146 = load i32* %i, align 4, !llfi_index !1066
  %147 = sext i32 %145 to i64, !llfi_index !1067
  %148 = sext i32 %146 to i64, !llfi_index !1067
  %149 = load i8*** %2, align 8, !llfi_index !1068
  %150 = load i8*** %2, align 8, !llfi_index !1068
  %151 = getelementptr inbounds i8** %149, i64 %147, !llfi_index !1069
  %152 = getelementptr inbounds i8** %150, i64 %148, !llfi_index !1069
  %153 = load i8** %151, align 8, !llfi_index !1070
  %154 = load i8** %152, align 8, !llfi_index !1070
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %153, i8* %154)
  %155 = call i32 @atoi(i8* %153) #8, !llfi_index !1071
  %156 = getelementptr inbounds %struct.Inputs* %input, i32 0, i32 3, !llfi_index !1072
  %157 = getelementptr inbounds %struct.Inputs* %input, i32 0, i32 3, !llfi_index !1072
  call void bitcast (void (i64, i64)* @global_add to void (i32*, i32*)*)(i32* %156, i32* %157)
  store i32 %155, i32* %156, align 4, !llfi_index !1073
  br label %159, !llfi_index !1074

; <label>:158                                     ; preds = %135
  call void @print_CLI_error(), !llfi_index !1075
  br label %159, !llfi_index !1076

; <label>:159                                     ; preds = %158, %144
  br label %192, !llfi_index !1077

; <label>:160                                     ; preds = %129
  %161 = load i8** %arg, align 8, !llfi_index !1078
  %162 = load i8** %arg, align 8, !llfi_index !1078
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %161, i8* %162)
  %163 = call i32 @strcmp(i8* %161, i8* getelementptr inbounds ([3 x i8]* @.str39, i32 0, i32 0)) #8, !llfi_index !1079
  %164 = icmp eq i32 %163, 0, !llfi_index !1080
  %165 = icmp eq i32 %163, 0, !llfi_index !1080
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %164, i1 %165)
  br i1 %164, label %166, label %190, !llfi_index !1081

; <label>:166                                     ; preds = %160
  %167 = load i32* %i, align 4, !llfi_index !1082
  %168 = load i32* %i, align 4, !llfi_index !1082
  %169 = add nsw i32 %167, 1, !llfi_index !1083
  %170 = add nsw i32 %168, 1, !llfi_index !1083
  store i32 %169, i32* %i, align 4, !llfi_index !1084
  %171 = load i32* %1, align 4, !llfi_index !1085
  %172 = load i32* %1, align 4, !llfi_index !1085
  %173 = icmp slt i32 %169, %171, !llfi_index !1086
  %174 = icmp slt i32 %170, %172, !llfi_index !1086
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %173, i1 %174)
  br i1 %173, label %175, label %188, !llfi_index !1087

; <label>:175                                     ; preds = %166
  %176 = load i32* %i, align 4, !llfi_index !1088
  %177 = load i32* %i, align 4, !llfi_index !1088
  %178 = sext i32 %176 to i64, !llfi_index !1089
  %179 = sext i32 %177 to i64, !llfi_index !1089
  %180 = load i8*** %2, align 8, !llfi_index !1090
  %181 = load i8*** %2, align 8, !llfi_index !1090
  %182 = getelementptr inbounds i8** %180, i64 %178, !llfi_index !1091
  %183 = getelementptr inbounds i8** %181, i64 %179, !llfi_index !1091
  %184 = load i8** %182, align 8, !llfi_index !1092
  %185 = load i8** %183, align 8, !llfi_index !1092
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %184, i8* %185)
  %186 = getelementptr inbounds %struct.Inputs* %input, i32 0, i32 4, !llfi_index !1093
  %187 = getelementptr inbounds %struct.Inputs* %input, i32 0, i32 4, !llfi_index !1093
  call void bitcast (void (i64, i64)* @global_add to void (i8**, i8**)*)(i8** %186, i8** %187)
  store i8* %184, i8** %186, align 8, !llfi_index !1094
  br label %189, !llfi_index !1095

; <label>:188                                     ; preds = %166
  call void @print_CLI_error(), !llfi_index !1096
  br label %189, !llfi_index !1097

; <label>:189                                     ; preds = %188, %175
  br label %191, !llfi_index !1098

; <label>:190                                     ; preds = %160
  call void @print_CLI_error(), !llfi_index !1099
  br label %191, !llfi_index !1100

; <label>:191                                     ; preds = %190, %189
  br label %192, !llfi_index !1101

; <label>:192                                     ; preds = %191, %159
  br label %193, !llfi_index !1102

; <label>:193                                     ; preds = %192, %128
  br label %194, !llfi_index !1103

; <label>:194                                     ; preds = %193, %97
  br label %195, !llfi_index !1104

; <label>:195                                     ; preds = %194
  %196 = load i32* %i, align 4, !llfi_index !1105
  %197 = load i32* %i, align 4, !llfi_index !1105
  %198 = add nsw i32 %196, 1, !llfi_index !1106
  %199 = add nsw i32 %197, 1, !llfi_index !1106
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %198, i32 %199)
  store i32 %198, i32* %i, align 4, !llfi_index !1107
  br label %50, !llfi_index !1108

; <label>:200                                     ; preds = %50
  %201 = getelementptr inbounds %struct.Inputs* %input, i32 0, i32 0, !llfi_index !1109
  %202 = getelementptr inbounds %struct.Inputs* %input, i32 0, i32 0, !llfi_index !1109
  %203 = load i32* %201, align 4, !llfi_index !1110
  %204 = load i32* %202, align 4, !llfi_index !1110
  %205 = icmp slt i32 %203, 1, !llfi_index !1111
  %206 = icmp slt i32 %204, 1, !llfi_index !1111
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %205, i1 %206)
  br i1 %205, label %207, label %208, !llfi_index !1112

; <label>:207                                     ; preds = %200
  call void @print_CLI_error(), !llfi_index !1113
  br label %208, !llfi_index !1114

; <label>:208                                     ; preds = %207, %200
  %209 = getelementptr inbounds %struct.Inputs* %input, i32 0, i32 1, !llfi_index !1115
  %210 = getelementptr inbounds %struct.Inputs* %input, i32 0, i32 1, !llfi_index !1115
  %211 = load i64* %209, align 8, !llfi_index !1116
  %212 = load i64* %210, align 8, !llfi_index !1116
  %213 = icmp slt i64 %211, 1, !llfi_index !1117
  %214 = icmp slt i64 %212, 1, !llfi_index !1117
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %213, i1 %214)
  br i1 %213, label %215, label %216, !llfi_index !1118

; <label>:215                                     ; preds = %208
  call void @print_CLI_error(), !llfi_index !1119
  br label %216, !llfi_index !1120

; <label>:216                                     ; preds = %215, %208
  %217 = getelementptr inbounds %struct.Inputs* %input, i32 0, i32 2, !llfi_index !1121
  %218 = getelementptr inbounds %struct.Inputs* %input, i32 0, i32 2, !llfi_index !1121
  %219 = load i64* %217, align 8, !llfi_index !1122
  %220 = load i64* %218, align 8, !llfi_index !1122
  %221 = icmp slt i64 %219, 1, !llfi_index !1123
  %222 = icmp slt i64 %220, 1, !llfi_index !1123
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %221, i1 %222)
  br i1 %221, label %223, label %224, !llfi_index !1124

; <label>:223                                     ; preds = %216
  call void @print_CLI_error(), !llfi_index !1125
  br label %224, !llfi_index !1126

; <label>:224                                     ; preds = %223, %216
  %225 = getelementptr inbounds %struct.Inputs* %input, i32 0, i32 3, !llfi_index !1127
  %226 = getelementptr inbounds %struct.Inputs* %input, i32 0, i32 3, !llfi_index !1127
  %227 = load i32* %225, align 4, !llfi_index !1128
  %228 = load i32* %226, align 4, !llfi_index !1128
  %229 = icmp slt i32 %227, 1, !llfi_index !1129
  %230 = icmp slt i32 %228, 1, !llfi_index !1129
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %229, i1 %230)
  br i1 %229, label %231, label %232, !llfi_index !1130

; <label>:231                                     ; preds = %224
  call void @print_CLI_error(), !llfi_index !1131
  br label %232, !llfi_index !1132

; <label>:232                                     ; preds = %231, %224
  %233 = getelementptr inbounds %struct.Inputs* %input, i32 0, i32 4, !llfi_index !1133
  %234 = getelementptr inbounds %struct.Inputs* %input, i32 0, i32 4, !llfi_index !1133
  %235 = load i8** %233, align 8, !llfi_index !1134
  %236 = load i8** %234, align 8, !llfi_index !1134
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %235, i8* %236)
  %237 = call i32 @strcasecmp(i8* %235, i8* getelementptr inbounds ([6 x i8]* @.str40, i32 0, i32 0)) #8, !llfi_index !1135
  %238 = icmp ne i32 %237, 0, !llfi_index !1136
  %239 = icmp ne i32 %237, 0, !llfi_index !1136
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %238, i1 %239)
  br i1 %238, label %240, label %265, !llfi_index !1137

; <label>:240                                     ; preds = %232
  %241 = getelementptr inbounds %struct.Inputs* %input, i32 0, i32 4, !llfi_index !1138
  %242 = getelementptr inbounds %struct.Inputs* %input, i32 0, i32 4, !llfi_index !1138
  %243 = load i8** %241, align 8, !llfi_index !1139
  %244 = load i8** %242, align 8, !llfi_index !1139
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %243, i8* %244)
  %245 = call i32 @strcasecmp(i8* %243, i8* getelementptr inbounds ([6 x i8]* @.str41, i32 0, i32 0)) #8, !llfi_index !1140
  %246 = icmp ne i32 %245, 0, !llfi_index !1141
  %247 = icmp ne i32 %245, 0, !llfi_index !1141
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %246, i1 %247)
  br i1 %246, label %248, label %265, !llfi_index !1142

; <label>:248                                     ; preds = %240
  %249 = getelementptr inbounds %struct.Inputs* %input, i32 0, i32 4, !llfi_index !1143
  %250 = getelementptr inbounds %struct.Inputs* %input, i32 0, i32 4, !llfi_index !1143
  %251 = load i8** %249, align 8, !llfi_index !1144
  %252 = load i8** %250, align 8, !llfi_index !1144
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %251, i8* %252)
  %253 = call i32 @strcasecmp(i8* %251, i8* getelementptr inbounds ([3 x i8]* @.str42, i32 0, i32 0)) #8, !llfi_index !1145
  %254 = icmp ne i32 %253, 0, !llfi_index !1146
  %255 = icmp ne i32 %253, 0, !llfi_index !1146
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %254, i1 %255)
  br i1 %254, label %256, label %265, !llfi_index !1147

; <label>:256                                     ; preds = %248
  %257 = getelementptr inbounds %struct.Inputs* %input, i32 0, i32 4, !llfi_index !1148
  %258 = getelementptr inbounds %struct.Inputs* %input, i32 0, i32 4, !llfi_index !1148
  %259 = load i8** %257, align 8, !llfi_index !1149
  %260 = load i8** %258, align 8, !llfi_index !1149
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %259, i8* %260)
  %261 = call i32 @strcasecmp(i8* %259, i8* getelementptr inbounds ([4 x i8]* @.str43, i32 0, i32 0)) #8, !llfi_index !1150
  %262 = icmp ne i32 %261, 0, !llfi_index !1151
  %263 = icmp ne i32 %261, 0, !llfi_index !1151
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %262, i1 %263)
  br i1 %262, label %264, label %265, !llfi_index !1152

; <label>:264                                     ; preds = %256
  call void @print_CLI_error(), !llfi_index !1153
  br label %265, !llfi_index !1154

; <label>:265                                     ; preds = %264, %256, %248, %240, %232
  %266 = getelementptr inbounds %struct.Inputs* %input, i32 0, i32 4, !llfi_index !1155
  %267 = getelementptr inbounds %struct.Inputs* %input, i32 0, i32 4, !llfi_index !1155
  %268 = load i8** %266, align 8, !llfi_index !1156
  %269 = load i8** %267, align 8, !llfi_index !1156
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %268, i8* %269)
  %270 = call i32 @strcasecmp(i8* %268, i8* getelementptr inbounds ([6 x i8]* @.str40, i32 0, i32 0)) #8, !llfi_index !1157
  %271 = icmp eq i32 %270, 0, !llfi_index !1158
  %272 = icmp eq i32 %270, 0, !llfi_index !1158
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %271, i1 %272)
  br i1 %271, label %273, label %276, !llfi_index !1159

; <label>:273                                     ; preds = %265
  %274 = getelementptr inbounds %struct.Inputs* %input, i32 0, i32 1, !llfi_index !1160
  %275 = getelementptr inbounds %struct.Inputs* %input, i32 0, i32 1, !llfi_index !1160
  call void bitcast (void (i64, i64)* @global_add to void (i64*, i64*)*)(i64* %274, i64* %275)
  store i64 68, i64* %274, align 8, !llfi_index !1161
  br label %310, !llfi_index !1162

; <label>:276                                     ; preds = %265
  %277 = getelementptr inbounds %struct.Inputs* %input, i32 0, i32 4, !llfi_index !1163
  %278 = getelementptr inbounds %struct.Inputs* %input, i32 0, i32 4, !llfi_index !1163
  %279 = load i8** %277, align 8, !llfi_index !1164
  %280 = load i8** %278, align 8, !llfi_index !1164
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %279, i8* %280)
  %281 = call i32 @strcasecmp(i8* %279, i8* getelementptr inbounds ([3 x i8]* @.str42, i32 0, i32 0)) #8, !llfi_index !1165
  %282 = icmp eq i32 %281, 0, !llfi_index !1166
  %283 = icmp eq i32 %281, 0, !llfi_index !1166
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %282, i1 %283)
  br i1 %282, label %284, label %292, !llfi_index !1167

; <label>:284                                     ; preds = %276
  %285 = load i32* %user_g, align 4, !llfi_index !1168
  %286 = load i32* %user_g, align 4, !llfi_index !1168
  %287 = icmp eq i32 %285, 0, !llfi_index !1169
  %288 = icmp eq i32 %286, 0, !llfi_index !1169
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %287, i1 %288)
  br i1 %287, label %289, label %292, !llfi_index !1170

; <label>:289                                     ; preds = %284
  %290 = getelementptr inbounds %struct.Inputs* %input, i32 0, i32 2, !llfi_index !1171
  %291 = getelementptr inbounds %struct.Inputs* %input, i32 0, i32 2, !llfi_index !1171
  call void bitcast (void (i64, i64)* @global_add to void (i64*, i64*)*)(i64* %290, i64* %291)
  store i64 238847, i64* %290, align 8, !llfi_index !1172
  br label %309, !llfi_index !1173

; <label>:292                                     ; preds = %284, %276
  %293 = getelementptr inbounds %struct.Inputs* %input, i32 0, i32 4, !llfi_index !1174
  %294 = getelementptr inbounds %struct.Inputs* %input, i32 0, i32 4, !llfi_index !1174
  %295 = load i8** %293, align 8, !llfi_index !1175
  %296 = load i8** %294, align 8, !llfi_index !1175
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %295, i8* %296)
  %297 = call i32 @strcasecmp(i8* %295, i8* getelementptr inbounds ([4 x i8]* @.str43, i32 0, i32 0)) #8, !llfi_index !1176
  %298 = icmp eq i32 %297, 0, !llfi_index !1177
  %299 = icmp eq i32 %297, 0, !llfi_index !1177
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %298, i1 %299)
  br i1 %298, label %300, label %308, !llfi_index !1178

; <label>:300                                     ; preds = %292
  %301 = load i32* %user_g, align 4, !llfi_index !1179
  %302 = load i32* %user_g, align 4, !llfi_index !1179
  %303 = icmp eq i32 %301, 0, !llfi_index !1180
  %304 = icmp eq i32 %302, 0, !llfi_index !1180
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %303, i1 %304)
  br i1 %303, label %305, label %308, !llfi_index !1181

; <label>:305                                     ; preds = %300
  %306 = getelementptr inbounds %struct.Inputs* %input, i32 0, i32 2, !llfi_index !1182
  %307 = getelementptr inbounds %struct.Inputs* %input, i32 0, i32 2, !llfi_index !1182
  call void bitcast (void (i64, i64)* @global_add to void (i64*, i64*)*)(i64* %306, i64* %307)
  store i64 501578, i64* %306, align 8, !llfi_index !1183
  br label %308, !llfi_index !1184

; <label>:308                                     ; preds = %305, %300, %292
  br label %309, !llfi_index !1185

; <label>:309                                     ; preds = %308, %289
  br label %310, !llfi_index !1186

; <label>:310                                     ; preds = %309, %273
  %311 = bitcast %struct.Inputs* %agg.result to i8*, !llfi_index !1187
  %312 = bitcast %struct.Inputs* %agg.result to i8*, !llfi_index !1187
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %311, i8* %312)
  %313 = bitcast %struct.Inputs* %input to i8*, !llfi_index !1188
  %314 = bitcast %struct.Inputs* %input to i8*, !llfi_index !1188
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %313, i8* %314)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %311, i8* %313, i64 40, i32 8, i1 false), !llfi_index !1189
  ret void, !llfi_index !1190
}

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #5

; Function Attrs: nounwind readonly
declare i32 @atoi(i8*) #5

; Function Attrs: nounwind readonly
declare i64 @atol(i8*) #5

; Function Attrs: nounwind readonly
declare i32 @strcasecmp(i8*, i8*) #5

; Function Attrs: nounwind uwtable
define double @get_wtime() #0 {
  %tv = alloca %struct.timeval, align 8, !llfi_index !1191
  %ret = alloca double, align 8, !llfi_index !1192
  %1 = call i32 @gettimeofday(%struct.timeval* %tv, %struct.timezone* null) #3, !llfi_index !1193
  %2 = getelementptr inbounds %struct.timeval* %tv, i32 0, i32 0, !llfi_index !1194
  %3 = getelementptr inbounds %struct.timeval* %tv, i32 0, i32 0, !llfi_index !1194
  %4 = load i64* %2, align 8, !llfi_index !1195
  %5 = load i64* %3, align 8, !llfi_index !1195
  %6 = sitofp i64 %4 to double, !llfi_index !1196
  %7 = sitofp i64 %5 to double, !llfi_index !1196
  %8 = getelementptr inbounds %struct.timeval* %tv, i32 0, i32 1, !llfi_index !1197
  %9 = getelementptr inbounds %struct.timeval* %tv, i32 0, i32 1, !llfi_index !1197
  %10 = load i64* %8, align 8, !llfi_index !1198
  %11 = load i64* %9, align 8, !llfi_index !1198
  %12 = sitofp i64 %10 to double, !llfi_index !1199
  %13 = sitofp i64 %11 to double, !llfi_index !1199
  %14 = fdiv double %12, 1.000000e+06, !llfi_index !1200
  %15 = fdiv double %13, 1.000000e+06, !llfi_index !1200
  %16 = fadd double %6, %14, !llfi_index !1201
  %17 = fadd double %7, %15, !llfi_index !1201
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %16, double %17)
  store double %16, double* %ret, align 8, !llfi_index !1202
  %18 = load double* %ret, align 8, !llfi_index !1203
  %19 = load double* %ret, align 8, !llfi_index !1203
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %18, double %19)
  ret double %18, !llfi_index !1204
}

; Function Attrs: nounwind
declare i32 @gettimeofday(%struct.timeval*, %struct.timezone*) #2

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4, !llfi_index !1205
  %2 = alloca i32, align 4, !llfi_index !1206
  %3 = alloca i8**, align 8, !llfi_index !1207
  %version = alloca i32, align 4, !llfi_index !1208
  %mype = alloca i32, align 4, !llfi_index !1209
  %i = alloca i32, align 4, !llfi_index !1210
  %thread = alloca i32, align 4, !llfi_index !1211
  %mat = alloca i32, align 4, !llfi_index !1212
  %seed = alloca i64, align 8, !llfi_index !1213
  %omp_start = alloca double, align 8, !llfi_index !1214
  %omp_end = alloca double, align 8, !llfi_index !1215
  %p_energy = alloca double, align 8, !llfi_index !1216
  %vhash = alloca i64, align 8, !llfi_index !1217
  %nprocs = alloca i32, align 4, !llfi_index !1218
  %in = alloca %struct.Inputs, align 8, !llfi_index !1219
  %nuclide_grids = alloca %struct.NuclideGridPoint**, align 8, !llfi_index !1220
  %energy_grid = alloca %struct.GridPoint*, align 8, !llfi_index !1221
  %num_nucs = alloca i32*, align 8, !llfi_index !1222
  %mats = alloca i32**, align 8, !llfi_index !1223
  %concs = alloca double**, align 8, !llfi_index !1224
  %macro_xs_vector = alloca [5 x double], align 16, !llfi_index !1225
  %xs = alloca double*, align 8, !llfi_index !1226
  %line = alloca [256 x i8], align 16, !llfi_index !1227
  %vhash_local = alloca i64, align 8, !llfi_index !1228
  store i32 0, i32* %1, !llfi_index !1229
  store i32 %argc, i32* %2, align 4, !llfi_index !1230
  store i8** %argv, i8*** %3, align 8, !llfi_index !1231
  store i32 13, i32* %version, align 4, !llfi_index !1232
  store i32 0, i32* %mype, align 4, !llfi_index !1233
  store i64 0, i64* %vhash, align 8, !llfi_index !1234
  %4 = load i32* %2, align 4, !llfi_index !1235
  %5 = load i32* %2, align 4, !llfi_index !1235
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %4, i32 %5)
  %6 = load i8*** %3, align 8, !llfi_index !1236
  %7 = load i8*** %3, align 8, !llfi_index !1236
  call void bitcast (void (i64, i64)* @global_add to void (i8**, i8**)*)(i8** %6, i8** %7)
  call void @read_CLI(%struct.Inputs* sret %in, i32 %4, i8** %6), !llfi_index !1237
  %8 = load i32* %mype, align 4, !llfi_index !1238
  %9 = load i32* %mype, align 4, !llfi_index !1238
  %10 = icmp eq i32 %8, 0, !llfi_index !1239
  %11 = icmp eq i32 %9, 0, !llfi_index !1239
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %10, i1 %11)
  br i1 %10, label %12, label %17, !llfi_index !1240

; <label>:12                                      ; preds = %0
  %13 = load i32* %nprocs, align 4, !llfi_index !1241
  %14 = load i32* %nprocs, align 4, !llfi_index !1241
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %13, i32 %14)
  %15 = load i32* %version, align 4, !llfi_index !1242
  %16 = load i32* %version, align 4, !llfi_index !1242
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %15, i32 %16)
  call void @print_inputs(%struct.Inputs* byval align 8 %in, i32 %13, i32 %15), !llfi_index !1243
  br label %17, !llfi_index !1244

; <label>:17                                      ; preds = %12, %0
  %18 = load i32* %mype, align 4, !llfi_index !1245
  %19 = load i32* %mype, align 4, !llfi_index !1245
  %20 = icmp eq i32 %18, 0, !llfi_index !1246
  %21 = icmp eq i32 %19, 0, !llfi_index !1246
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %20, i1 %21)
  br i1 %20, label %22, label %24, !llfi_index !1247

; <label>:22                                      ; preds = %17
  %23 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str44, i32 0, i32 0)), !llfi_index !1248
  br label %24, !llfi_index !1249

; <label>:24                                      ; preds = %22, %17
  %25 = getelementptr inbounds %struct.Inputs* %in, i32 0, i32 1, !llfi_index !1250
  %26 = getelementptr inbounds %struct.Inputs* %in, i32 0, i32 1, !llfi_index !1250
  %27 = load i64* %25, align 8, !llfi_index !1251
  %28 = load i64* %26, align 8, !llfi_index !1251
  call void @global_add(i64 %27, i64 %28)
  %29 = getelementptr inbounds %struct.Inputs* %in, i32 0, i32 2, !llfi_index !1252
  %30 = getelementptr inbounds %struct.Inputs* %in, i32 0, i32 2, !llfi_index !1252
  %31 = load i64* %29, align 8, !llfi_index !1253
  %32 = load i64* %30, align 8, !llfi_index !1253
  call void @global_add(i64 %31, i64 %32)
  %33 = call %struct.NuclideGridPoint** @gpmatrix(i64 %27, i64 %31), !llfi_index !1254
  store %struct.NuclideGridPoint** %33, %struct.NuclideGridPoint*** %nuclide_grids, align 8, !llfi_index !1255
  %34 = load %struct.NuclideGridPoint*** %nuclide_grids, align 8, !llfi_index !1256
  %35 = load %struct.NuclideGridPoint*** %nuclide_grids, align 8, !llfi_index !1256
  call void bitcast (void (i64, i64)* @global_add to void (%struct.NuclideGridPoint**, %struct.NuclideGridPoint**)*)(%struct.NuclideGridPoint** %34, %struct.NuclideGridPoint** %35)
  %36 = getelementptr inbounds %struct.Inputs* %in, i32 0, i32 1, !llfi_index !1257
  %37 = getelementptr inbounds %struct.Inputs* %in, i32 0, i32 1, !llfi_index !1257
  %38 = load i64* %36, align 8, !llfi_index !1258
  %39 = load i64* %37, align 8, !llfi_index !1258
  call void @global_add(i64 %38, i64 %39)
  %40 = getelementptr inbounds %struct.Inputs* %in, i32 0, i32 2, !llfi_index !1259
  %41 = getelementptr inbounds %struct.Inputs* %in, i32 0, i32 2, !llfi_index !1259
  %42 = load i64* %40, align 8, !llfi_index !1260
  %43 = load i64* %41, align 8, !llfi_index !1260
  call void @global_add(i64 %42, i64 %43)
  call void @generate_grids_v(%struct.NuclideGridPoint** %34, i64 %38, i64 %42), !llfi_index !1261
  %44 = load i32* %mype, align 4, !llfi_index !1262
  %45 = load i32* %mype, align 4, !llfi_index !1262
  %46 = icmp eq i32 %44, 0, !llfi_index !1263
  %47 = icmp eq i32 %45, 0, !llfi_index !1263
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %46, i1 %47)
  br i1 %46, label %48, label %50, !llfi_index !1264

; <label>:48                                      ; preds = %24
  %49 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([33 x i8]* @.str145, i32 0, i32 0)), !llfi_index !1265
  br label %50, !llfi_index !1266

; <label>:50                                      ; preds = %48, %24
  %51 = load %struct.NuclideGridPoint*** %nuclide_grids, align 8, !llfi_index !1267
  %52 = load %struct.NuclideGridPoint*** %nuclide_grids, align 8, !llfi_index !1267
  call void bitcast (void (i64, i64)* @global_add to void (%struct.NuclideGridPoint**, %struct.NuclideGridPoint**)*)(%struct.NuclideGridPoint** %51, %struct.NuclideGridPoint** %52)
  %53 = getelementptr inbounds %struct.Inputs* %in, i32 0, i32 1, !llfi_index !1268
  %54 = getelementptr inbounds %struct.Inputs* %in, i32 0, i32 1, !llfi_index !1268
  %55 = load i64* %53, align 8, !llfi_index !1269
  %56 = load i64* %54, align 8, !llfi_index !1269
  call void @global_add(i64 %55, i64 %56)
  %57 = getelementptr inbounds %struct.Inputs* %in, i32 0, i32 2, !llfi_index !1270
  %58 = getelementptr inbounds %struct.Inputs* %in, i32 0, i32 2, !llfi_index !1270
  %59 = load i64* %57, align 8, !llfi_index !1271
  %60 = load i64* %58, align 8, !llfi_index !1271
  call void @global_add(i64 %59, i64 %60)
  call void @sort_nuclide_grids(%struct.NuclideGridPoint** %51, i64 %55, i64 %59), !llfi_index !1272
  %61 = getelementptr inbounds %struct.Inputs* %in, i32 0, i32 1, !llfi_index !1273
  %62 = getelementptr inbounds %struct.Inputs* %in, i32 0, i32 1, !llfi_index !1273
  %63 = load i64* %61, align 8, !llfi_index !1274
  %64 = load i64* %62, align 8, !llfi_index !1274
  call void @global_add(i64 %63, i64 %64)
  %65 = getelementptr inbounds %struct.Inputs* %in, i32 0, i32 2, !llfi_index !1275
  %66 = getelementptr inbounds %struct.Inputs* %in, i32 0, i32 2, !llfi_index !1275
  %67 = load i64* %65, align 8, !llfi_index !1276
  %68 = load i64* %66, align 8, !llfi_index !1276
  call void @global_add(i64 %67, i64 %68)
  %69 = load %struct.NuclideGridPoint*** %nuclide_grids, align 8, !llfi_index !1277
  %70 = load %struct.NuclideGridPoint*** %nuclide_grids, align 8, !llfi_index !1277
  call void bitcast (void (i64, i64)* @global_add to void (%struct.NuclideGridPoint**, %struct.NuclideGridPoint**)*)(%struct.NuclideGridPoint** %69, %struct.NuclideGridPoint** %70)
  %71 = call %struct.GridPoint* @generate_energy_grid(i64 %63, i64 %67, %struct.NuclideGridPoint** %69), !llfi_index !1278
  store %struct.GridPoint* %71, %struct.GridPoint** %energy_grid, align 8, !llfi_index !1279
  %72 = load %struct.GridPoint** %energy_grid, align 8, !llfi_index !1280
  %73 = load %struct.GridPoint** %energy_grid, align 8, !llfi_index !1280
  call void bitcast (void (i64, i64)* @global_add to void (%struct.GridPoint*, %struct.GridPoint*)*)(%struct.GridPoint* %72, %struct.GridPoint* %73)
  %74 = load %struct.NuclideGridPoint*** %nuclide_grids, align 8, !llfi_index !1281
  %75 = load %struct.NuclideGridPoint*** %nuclide_grids, align 8, !llfi_index !1281
  call void bitcast (void (i64, i64)* @global_add to void (%struct.NuclideGridPoint**, %struct.NuclideGridPoint**)*)(%struct.NuclideGridPoint** %74, %struct.NuclideGridPoint** %75)
  %76 = getelementptr inbounds %struct.Inputs* %in, i32 0, i32 1, !llfi_index !1282
  %77 = getelementptr inbounds %struct.Inputs* %in, i32 0, i32 1, !llfi_index !1282
  %78 = load i64* %76, align 8, !llfi_index !1283
  %79 = load i64* %77, align 8, !llfi_index !1283
  call void @global_add(i64 %78, i64 %79)
  %80 = getelementptr inbounds %struct.Inputs* %in, i32 0, i32 2, !llfi_index !1284
  %81 = getelementptr inbounds %struct.Inputs* %in, i32 0, i32 2, !llfi_index !1284
  %82 = load i64* %80, align 8, !llfi_index !1285
  %83 = load i64* %81, align 8, !llfi_index !1285
  call void @global_add(i64 %82, i64 %83)
  call void @set_grid_ptrs(%struct.GridPoint* %72, %struct.NuclideGridPoint** %74, i64 %78, i64 %82), !llfi_index !1286
  %84 = load i32* %mype, align 4, !llfi_index !1287
  %85 = load i32* %mype, align 4, !llfi_index !1287
  %86 = icmp eq i32 %84, 0, !llfi_index !1288
  %87 = icmp eq i32 %85, 0, !llfi_index !1288
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %86, i1 %87)
  br i1 %86, label %88, label %90, !llfi_index !1289

; <label>:88                                      ; preds = %50
  %89 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str246, i32 0, i32 0)), !llfi_index !1290
  br label %90, !llfi_index !1291

; <label>:90                                      ; preds = %88, %50
  %91 = getelementptr inbounds %struct.Inputs* %in, i32 0, i32 1, !llfi_index !1292
  %92 = getelementptr inbounds %struct.Inputs* %in, i32 0, i32 1, !llfi_index !1292
  %93 = load i64* %91, align 8, !llfi_index !1293
  %94 = load i64* %92, align 8, !llfi_index !1293
  call void @global_add(i64 %93, i64 %94)
  %95 = call i32* @load_num_nucs(i64 %93), !llfi_index !1294
  store i32* %95, i32** %num_nucs, align 8, !llfi_index !1295
  %96 = load i32** %num_nucs, align 8, !llfi_index !1296
  %97 = load i32** %num_nucs, align 8, !llfi_index !1296
  call void bitcast (void (i64, i64)* @global_add to void (i32*, i32*)*)(i32* %96, i32* %97)
  %98 = getelementptr inbounds %struct.Inputs* %in, i32 0, i32 1, !llfi_index !1297
  %99 = getelementptr inbounds %struct.Inputs* %in, i32 0, i32 1, !llfi_index !1297
  %100 = load i64* %98, align 8, !llfi_index !1298
  %101 = load i64* %99, align 8, !llfi_index !1298
  call void @global_add(i64 %100, i64 %101)
  %102 = call i32** @load_mats(i32* %96, i64 %100), !llfi_index !1299
  store i32** %102, i32*** %mats, align 8, !llfi_index !1300
  %103 = load i32** %num_nucs, align 8, !llfi_index !1301
  %104 = load i32** %num_nucs, align 8, !llfi_index !1301
  call void bitcast (void (i64, i64)* @global_add to void (i32*, i32*)*)(i32* %103, i32* %104)
  %105 = call double** @load_concs_v(i32* %103), !llfi_index !1302
  store double** %105, double*** %concs, align 8, !llfi_index !1303
  %106 = load i32* %mype, align 4, !llfi_index !1304
  %107 = load i32* %mype, align 4, !llfi_index !1304
  %108 = icmp eq i32 %106, 0, !llfi_index !1305
  %109 = icmp eq i32 %107, 0, !llfi_index !1305
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %108, i1 %109)
  br i1 %108, label %110, label %112, !llfi_index !1306

; <label>:110                                     ; preds = %90
  %111 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str347, i32 0, i32 0)), !llfi_index !1307
  call void @border_print(), !llfi_index !1308
  call void @center_print(i8* getelementptr inbounds ([11 x i8]* @.str448, i32 0, i32 0), i32 79), !llfi_index !1309
  call void @border_print(), !llfi_index !1310
  br label %112, !llfi_index !1311

; <label>:112                                     ; preds = %110, %90
  %113 = call double @get_wtime(), !llfi_index !1312
  store double %113, double* %omp_start, align 8, !llfi_index !1313
  %114 = call noalias i8* @calloc(i64 5, i64 8) #3, !llfi_index !1314
  %115 = bitcast i8* %114 to double*, !llfi_index !1315
  %116 = bitcast i8* %114 to double*, !llfi_index !1315
  call void bitcast (void (i64, i64)* @global_add to void (double*, double*)*)(double* %115, double* %116)
  store double* %115, double** %xs, align 8, !llfi_index !1316
  store i32 0, i32* %thread, align 4, !llfi_index !1317
  store i64 36, i64* %seed, align 8, !llfi_index !1318
  store i32 0, i32* %i, align 4, !llfi_index !1319
  br label %117, !llfi_index !1320

; <label>:117                                     ; preds = %246, %112
  %118 = load i32* %i, align 4, !llfi_index !1321
  %119 = load i32* %i, align 4, !llfi_index !1321
  %120 = getelementptr inbounds %struct.Inputs* %in, i32 0, i32 3, !llfi_index !1322
  %121 = getelementptr inbounds %struct.Inputs* %in, i32 0, i32 3, !llfi_index !1322
  %122 = load i32* %120, align 4, !llfi_index !1323
  %123 = load i32* %121, align 4, !llfi_index !1323
  %124 = icmp slt i32 %118, %122, !llfi_index !1324
  %125 = icmp slt i32 %119, %123, !llfi_index !1324
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %124, i1 %125)
  br i1 %124, label %126, label %251, !llfi_index !1325

; <label>:126                                     ; preds = %117
  %127 = load i32* %mype, align 4, !llfi_index !1326
  %128 = load i32* %mype, align 4, !llfi_index !1326
  %129 = icmp eq i32 %127, 0, !llfi_index !1327
  %130 = icmp eq i32 %128, 0, !llfi_index !1327
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %129, i1 %130)
  br i1 %129, label %131, label %175, !llfi_index !1328

; <label>:131                                     ; preds = %126
  %132 = load i32* %thread, align 4, !llfi_index !1329
  %133 = load i32* %thread, align 4, !llfi_index !1329
  %134 = icmp eq i32 %132, 0, !llfi_index !1330
  %135 = icmp eq i32 %133, 0, !llfi_index !1330
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %134, i1 %135)
  br i1 %134, label %136, label %175, !llfi_index !1331

; <label>:136                                     ; preds = %131
  %137 = load i32* %i, align 4, !llfi_index !1332
  %138 = load i32* %i, align 4, !llfi_index !1332
  %139 = srem i32 %137, 1000, !llfi_index !1333
  %140 = srem i32 %138, 1000, !llfi_index !1333
  %141 = icmp eq i32 %139, 0, !llfi_index !1334
  %142 = icmp eq i32 %140, 0, !llfi_index !1334
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %141, i1 %142)
  br i1 %141, label %143, label %175, !llfi_index !1335

; <label>:143                                     ; preds = %136
  %144 = load i32* %i, align 4, !llfi_index !1336
  %145 = load i32* %i, align 4, !llfi_index !1336
  %146 = sitofp i32 %144 to double, !llfi_index !1337
  %147 = sitofp i32 %145 to double, !llfi_index !1337
  %148 = getelementptr inbounds %struct.Inputs* %in, i32 0, i32 3, !llfi_index !1338
  %149 = getelementptr inbounds %struct.Inputs* %in, i32 0, i32 3, !llfi_index !1338
  %150 = load i32* %148, align 4, !llfi_index !1339
  %151 = load i32* %149, align 4, !llfi_index !1339
  %152 = sitofp i32 %150 to double, !llfi_index !1340
  %153 = sitofp i32 %151 to double, !llfi_index !1340
  %154 = getelementptr inbounds %struct.Inputs* %in, i32 0, i32 0, !llfi_index !1341
  %155 = getelementptr inbounds %struct.Inputs* %in, i32 0, i32 0, !llfi_index !1341
  %156 = load i32* %154, align 4, !llfi_index !1342
  %157 = load i32* %155, align 4, !llfi_index !1342
  %158 = sitofp i32 %156 to double, !llfi_index !1343
  %159 = sitofp i32 %157 to double, !llfi_index !1343
  %160 = fdiv double %152, %158, !llfi_index !1344
  %161 = fdiv double %153, %159, !llfi_index !1344
  %162 = fdiv double %146, %160, !llfi_index !1345
  %163 = fdiv double %147, %161, !llfi_index !1345
  %164 = getelementptr inbounds %struct.Inputs* %in, i32 0, i32 0, !llfi_index !1346
  %165 = getelementptr inbounds %struct.Inputs* %in, i32 0, i32 0, !llfi_index !1346
  %166 = load i32* %164, align 4, !llfi_index !1347
  %167 = load i32* %165, align 4, !llfi_index !1347
  %168 = sitofp i32 %166 to double, !llfi_index !1348
  %169 = sitofp i32 %167 to double, !llfi_index !1348
  %170 = fdiv double %162, %168, !llfi_index !1349
  %171 = fdiv double %163, %169, !llfi_index !1349
  %172 = fmul double %170, 1.000000e+02, !llfi_index !1350
  %173 = fmul double %171, 1.000000e+02, !llfi_index !1350
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %172, double %173)
  %174 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([41 x i8]* @.str549, i32 0, i32 0), double %172), !llfi_index !1351
  br label %175, !llfi_index !1352

; <label>:175                                     ; preds = %143, %136, %131, %126
  %176 = call double @rn_v(), !llfi_index !1353
  store double %176, double* %p_energy, align 8, !llfi_index !1354
  %177 = call i32 @pick_mat(i64* %seed), !llfi_index !1355
  store i32 %177, i32* %mat, align 4, !llfi_index !1356
  %178 = load double* %p_energy, align 8, !llfi_index !1357
  %179 = load double* %p_energy, align 8, !llfi_index !1357
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %178, double %179)
  %180 = load i32* %mat, align 4, !llfi_index !1358
  %181 = load i32* %mat, align 4, !llfi_index !1358
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %180, i32 %181)
  %182 = getelementptr inbounds %struct.Inputs* %in, i32 0, i32 1, !llfi_index !1359
  %183 = getelementptr inbounds %struct.Inputs* %in, i32 0, i32 1, !llfi_index !1359
  %184 = load i64* %182, align 8, !llfi_index !1360
  %185 = load i64* %183, align 8, !llfi_index !1360
  call void @global_check()
  call void @global_add(i64 %184, i64 %185)
  %186 = getelementptr inbounds %struct.Inputs* %in, i32 0, i32 2, !llfi_index !1361
  %187 = getelementptr inbounds %struct.Inputs* %in, i32 0, i32 2, !llfi_index !1361
  %188 = load i64* %186, align 8, !llfi_index !1362
  %189 = load i64* %187, align 8, !llfi_index !1362
  call void @global_check()
  call void @global_add(i64 %188, i64 %189)
  %190 = load i32** %num_nucs, align 8, !llfi_index !1363
  %191 = load i32** %num_nucs, align 8, !llfi_index !1363
  call void bitcast (void (i64, i64)* @global_add to void (i32*, i32*)*)(i32* %190, i32* %191)
  %192 = load double*** %concs, align 8, !llfi_index !1364
  %193 = load double*** %concs, align 8, !llfi_index !1364
  call void bitcast (void (i64, i64)* @global_add to void (double**, double**)*)(double** %192, double** %193)
  %194 = load %struct.GridPoint** %energy_grid, align 8, !llfi_index !1365
  %195 = load %struct.GridPoint** %energy_grid, align 8, !llfi_index !1365
  call void bitcast (void (i64, i64)* @global_add to void (%struct.GridPoint*, %struct.GridPoint*)*)(%struct.GridPoint* %194, %struct.GridPoint* %195)
  %196 = load %struct.NuclideGridPoint*** %nuclide_grids, align 8, !llfi_index !1366
  %197 = load %struct.NuclideGridPoint*** %nuclide_grids, align 8, !llfi_index !1366
  call void bitcast (void (i64, i64)* @global_add to void (%struct.NuclideGridPoint**, %struct.NuclideGridPoint**)*)(%struct.NuclideGridPoint** %196, %struct.NuclideGridPoint** %197)
  %198 = load i32*** %mats, align 8, !llfi_index !1367
  %199 = load i32*** %mats, align 8, !llfi_index !1367
  call void bitcast (void (i64, i64)* @global_add to void (i32**, i32**)*)(i32** %198, i32** %199)
  %200 = getelementptr inbounds [5 x double]* %macro_xs_vector, i32 0, i32 0, !llfi_index !1368
  %201 = getelementptr inbounds [5 x double]* %macro_xs_vector, i32 0, i32 0, !llfi_index !1368
  call void bitcast (void (i64, i64)* @global_add to void (double*, double*)*)(double* %200, double* %201)
  call void @calculate_macro_xs(double %178, i32 %180, i64 %184, i64 %188, i32* %190, double** %192, %struct.GridPoint* %194, %struct.NuclideGridPoint** %196, i32** %198, double* %200), !llfi_index !1369
  %202 = load double** %xs, align 8, !llfi_index !1370
  %203 = load double** %xs, align 8, !llfi_index !1370
  %204 = bitcast double* %202 to i8*, !llfi_index !1371
  %205 = bitcast double* %203 to i8*, !llfi_index !1371
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %204, i8* %205)
  %206 = bitcast [5 x double]* %macro_xs_vector to i8*, !llfi_index !1372
  %207 = bitcast [5 x double]* %macro_xs_vector to i8*, !llfi_index !1372
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %206, i8* %207)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %204, i8* %206, i64 40, i32 8, i1 false), !llfi_index !1373
  %208 = getelementptr inbounds [256 x i8]* %line, i32 0, i32 0, !llfi_index !1374
  %209 = getelementptr inbounds [256 x i8]* %line, i32 0, i32 0, !llfi_index !1374
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %208, i8* %209)
  %210 = load double* %p_energy, align 8, !llfi_index !1375
  %211 = load double* %p_energy, align 8, !llfi_index !1375
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %210, double %211)
  %212 = load i32* %mat, align 4, !llfi_index !1376
  %213 = load i32* %mat, align 4, !llfi_index !1376
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %212, i32 %213)
  %214 = getelementptr inbounds [5 x double]* %macro_xs_vector, i32 0, i64 0, !llfi_index !1377
  %215 = getelementptr inbounds [5 x double]* %macro_xs_vector, i32 0, i64 0, !llfi_index !1377
  %216 = load double* %214, align 8, !llfi_index !1378
  %217 = load double* %215, align 8, !llfi_index !1378
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %216, double %217)
  %218 = getelementptr inbounds [5 x double]* %macro_xs_vector, i32 0, i64 1, !llfi_index !1379
  %219 = getelementptr inbounds [5 x double]* %macro_xs_vector, i32 0, i64 1, !llfi_index !1379
  %220 = load double* %218, align 8, !llfi_index !1380
  %221 = load double* %219, align 8, !llfi_index !1380
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %220, double %221)
  %222 = getelementptr inbounds [5 x double]* %macro_xs_vector, i32 0, i64 2, !llfi_index !1381
  %223 = getelementptr inbounds [5 x double]* %macro_xs_vector, i32 0, i64 2, !llfi_index !1381
  %224 = load double* %222, align 8, !llfi_index !1382
  %225 = load double* %223, align 8, !llfi_index !1382
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %224, double %225)
  %226 = getelementptr inbounds [5 x double]* %macro_xs_vector, i32 0, i64 3, !llfi_index !1383
  %227 = getelementptr inbounds [5 x double]* %macro_xs_vector, i32 0, i64 3, !llfi_index !1383
  %228 = load double* %226, align 8, !llfi_index !1384
  %229 = load double* %227, align 8, !llfi_index !1384
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %228, double %229)
  %230 = getelementptr inbounds [5 x double]* %macro_xs_vector, i32 0, i64 4, !llfi_index !1385
  %231 = getelementptr inbounds [5 x double]* %macro_xs_vector, i32 0, i64 4, !llfi_index !1385
  %232 = load double* %230, align 8, !llfi_index !1386
  %233 = load double* %231, align 8, !llfi_index !1386
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %232, double %233)
  %234 = call i32 (i8*, i8*, ...)* @sprintf(i8* %208, i8* getelementptr inbounds ([39 x i8]* @.str650, i32 0, i32 0), double %210, i32 %212, double %216, double %220, double %224, double %228, double %232) #3, !llfi_index !1387
  %235 = getelementptr inbounds [256 x i8]* %line, i32 0, i32 0, !llfi_index !1388
  %236 = getelementptr inbounds [256 x i8]* %line, i32 0, i32 0, !llfi_index !1388
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %235, i8* %236)
  %237 = call i32 @hash(i8* %235, i32 10000), !llfi_index !1389
  %238 = zext i32 %237 to i64, !llfi_index !1390
  %239 = zext i32 %237 to i64, !llfi_index !1390
  call void @global_check()
  call void @global_add(i64 %238, i64 %239)
  store i64 %238, i64* %vhash_local, align 8, !llfi_index !1391
  %240 = load i64* %vhash_local, align 8, !llfi_index !1392
  %241 = load i64* %vhash_local, align 8, !llfi_index !1392
  %242 = load i64* %vhash, align 8, !llfi_index !1393
  %243 = load i64* %vhash, align 8, !llfi_index !1393
  %244 = add i64 %242, %240, !llfi_index !1394
  %245 = add i64 %243, %241, !llfi_index !1394
  call void @global_check()
  call void @global_add(i64 %244, i64 %245)
  store i64 %244, i64* %vhash, align 8, !llfi_index !1395
  br label %246, !llfi_index !1396

; <label>:246                                     ; preds = %175
  %247 = load i32* %i, align 4, !llfi_index !1397
  %248 = load i32* %i, align 4, !llfi_index !1397
  %249 = add nsw i32 %247, 1, !llfi_index !1398
  %250 = add nsw i32 %248, 1, !llfi_index !1398
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %249, i32 %250)
  store i32 %249, i32* %i, align 4, !llfi_index !1399
  br label %117, !llfi_index !1400

; <label>:251                                     ; preds = %117
  %252 = load i32* %mype, align 4, !llfi_index !1401
  %253 = load i32* %mype, align 4, !llfi_index !1401
  %254 = icmp eq i32 %252, 0, !llfi_index !1402
  %255 = icmp eq i32 %253, 0, !llfi_index !1402
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %254, i1 %255)
  br i1 %254, label %256, label %259, !llfi_index !1403

; <label>:256                                     ; preds = %251
  %257 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str347, i32 0, i32 0)), !llfi_index !1404
  %258 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str751, i32 0, i32 0)), !llfi_index !1405
  br label %259, !llfi_index !1406

; <label>:259                                     ; preds = %256, %251
  %260 = call double @get_wtime(), !llfi_index !1407
  store double %260, double* %omp_end, align 8, !llfi_index !1408
  %261 = load i32* %mype, align 4, !llfi_index !1409
  %262 = load i32* %mype, align 4, !llfi_index !1409
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %261, i32 %262)
  %263 = load double* %omp_end, align 8, !llfi_index !1410
  %264 = load double* %omp_end, align 8, !llfi_index !1410
  %265 = load double* %omp_start, align 8, !llfi_index !1411
  %266 = load double* %omp_start, align 8, !llfi_index !1411
  %267 = fsub double %263, %265, !llfi_index !1412
  %268 = fsub double %264, %266, !llfi_index !1412
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %267, double %268)
  %269 = load i32* %nprocs, align 4, !llfi_index !1413
  %270 = load i32* %nprocs, align 4, !llfi_index !1413
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %269, i32 %270)
  %271 = load i64* %vhash, align 8, !llfi_index !1414
  %272 = load i64* %vhash, align 8, !llfi_index !1414
  call void @global_add(i64 %271, i64 %272)
  call void @print_results(%struct.Inputs* byval align 8 %in, i32 %261, double %267, i32 %269, i64 %271), !llfi_index !1415
  call void @global_check()
  ret i32 0, !llfi_index !1416
}

; Function Attrs: nounwind
declare noalias i8* @calloc(i64, i64) #2

; Function Attrs: nounwind uwtable
define i32* @load_num_nucs(i64 %n_isotopes) #0 {
  %1 = alloca i64, align 8, !llfi_index !1417
  %num_nucs = alloca i32*, align 8, !llfi_index !1418
  store i64 %n_isotopes, i64* %1, align 8, !llfi_index !1419
  %2 = call noalias i8* @malloc(i64 48) #3, !llfi_index !1420
  %3 = bitcast i8* %2 to i32*, !llfi_index !1421
  %4 = bitcast i8* %2 to i32*, !llfi_index !1421
  call void bitcast (void (i64, i64)* @global_add to void (i32*, i32*)*)(i32* %3, i32* %4)
  store i32* %3, i32** %num_nucs, align 8, !llfi_index !1422
  %5 = load i64* %1, align 8, !llfi_index !1423
  %6 = load i64* %1, align 8, !llfi_index !1423
  %7 = icmp eq i64 %5, 68, !llfi_index !1424
  %8 = icmp eq i64 %6, 68, !llfi_index !1424
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %7, i1 %8)
  br i1 %7, label %9, label %14, !llfi_index !1425

; <label>:9                                       ; preds = %0
  %10 = load i32** %num_nucs, align 8, !llfi_index !1426
  %11 = load i32** %num_nucs, align 8, !llfi_index !1426
  %12 = getelementptr inbounds i32* %10, i64 0, !llfi_index !1427
  %13 = getelementptr inbounds i32* %11, i64 0, !llfi_index !1427
  call void bitcast (void (i64, i64)* @global_add to void (i32*, i32*)*)(i32* %12, i32* %13)
  store i32 34, i32* %12, align 4, !llfi_index !1428
  br label %19, !llfi_index !1429

; <label>:14                                      ; preds = %0
  %15 = load i32** %num_nucs, align 8, !llfi_index !1430
  %16 = load i32** %num_nucs, align 8, !llfi_index !1430
  %17 = getelementptr inbounds i32* %15, i64 0, !llfi_index !1431
  %18 = getelementptr inbounds i32* %16, i64 0, !llfi_index !1431
  call void bitcast (void (i64, i64)* @global_add to void (i32*, i32*)*)(i32* %17, i32* %18)
  store i32 321, i32* %17, align 4, !llfi_index !1432
  br label %19, !llfi_index !1433

; <label>:19                                      ; preds = %14, %9
  %20 = load i32** %num_nucs, align 8, !llfi_index !1434
  %21 = load i32** %num_nucs, align 8, !llfi_index !1434
  %22 = getelementptr inbounds i32* %20, i64 1, !llfi_index !1435
  %23 = getelementptr inbounds i32* %21, i64 1, !llfi_index !1435
  call void bitcast (void (i64, i64)* @global_add to void (i32*, i32*)*)(i32* %22, i32* %23)
  store i32 5, i32* %22, align 4, !llfi_index !1436
  %24 = load i32** %num_nucs, align 8, !llfi_index !1437
  %25 = load i32** %num_nucs, align 8, !llfi_index !1437
  %26 = getelementptr inbounds i32* %24, i64 2, !llfi_index !1438
  %27 = getelementptr inbounds i32* %25, i64 2, !llfi_index !1438
  call void bitcast (void (i64, i64)* @global_add to void (i32*, i32*)*)(i32* %26, i32* %27)
  store i32 4, i32* %26, align 4, !llfi_index !1439
  %28 = load i32** %num_nucs, align 8, !llfi_index !1440
  %29 = load i32** %num_nucs, align 8, !llfi_index !1440
  %30 = getelementptr inbounds i32* %28, i64 3, !llfi_index !1441
  %31 = getelementptr inbounds i32* %29, i64 3, !llfi_index !1441
  call void bitcast (void (i64, i64)* @global_add to void (i32*, i32*)*)(i32* %30, i32* %31)
  store i32 4, i32* %30, align 4, !llfi_index !1442
  %32 = load i32** %num_nucs, align 8, !llfi_index !1443
  %33 = load i32** %num_nucs, align 8, !llfi_index !1443
  %34 = getelementptr inbounds i32* %32, i64 4, !llfi_index !1444
  %35 = getelementptr inbounds i32* %33, i64 4, !llfi_index !1444
  call void bitcast (void (i64, i64)* @global_add to void (i32*, i32*)*)(i32* %34, i32* %35)
  store i32 27, i32* %34, align 4, !llfi_index !1445
  %36 = load i32** %num_nucs, align 8, !llfi_index !1446
  %37 = load i32** %num_nucs, align 8, !llfi_index !1446
  %38 = getelementptr inbounds i32* %36, i64 5, !llfi_index !1447
  %39 = getelementptr inbounds i32* %37, i64 5, !llfi_index !1447
  call void bitcast (void (i64, i64)* @global_add to void (i32*, i32*)*)(i32* %38, i32* %39)
  store i32 21, i32* %38, align 4, !llfi_index !1448
  %40 = load i32** %num_nucs, align 8, !llfi_index !1449
  %41 = load i32** %num_nucs, align 8, !llfi_index !1449
  %42 = getelementptr inbounds i32* %40, i64 6, !llfi_index !1450
  %43 = getelementptr inbounds i32* %41, i64 6, !llfi_index !1450
  call void bitcast (void (i64, i64)* @global_add to void (i32*, i32*)*)(i32* %42, i32* %43)
  store i32 21, i32* %42, align 4, !llfi_index !1451
  %44 = load i32** %num_nucs, align 8, !llfi_index !1452
  %45 = load i32** %num_nucs, align 8, !llfi_index !1452
  %46 = getelementptr inbounds i32* %44, i64 7, !llfi_index !1453
  %47 = getelementptr inbounds i32* %45, i64 7, !llfi_index !1453
  call void bitcast (void (i64, i64)* @global_add to void (i32*, i32*)*)(i32* %46, i32* %47)
  store i32 21, i32* %46, align 4, !llfi_index !1454
  %48 = load i32** %num_nucs, align 8, !llfi_index !1455
  %49 = load i32** %num_nucs, align 8, !llfi_index !1455
  %50 = getelementptr inbounds i32* %48, i64 8, !llfi_index !1456
  %51 = getelementptr inbounds i32* %49, i64 8, !llfi_index !1456
  call void bitcast (void (i64, i64)* @global_add to void (i32*, i32*)*)(i32* %50, i32* %51)
  store i32 21, i32* %50, align 4, !llfi_index !1457
  %52 = load i32** %num_nucs, align 8, !llfi_index !1458
  %53 = load i32** %num_nucs, align 8, !llfi_index !1458
  %54 = getelementptr inbounds i32* %52, i64 9, !llfi_index !1459
  %55 = getelementptr inbounds i32* %53, i64 9, !llfi_index !1459
  call void bitcast (void (i64, i64)* @global_add to void (i32*, i32*)*)(i32* %54, i32* %55)
  store i32 21, i32* %54, align 4, !llfi_index !1460
  %56 = load i32** %num_nucs, align 8, !llfi_index !1461
  %57 = load i32** %num_nucs, align 8, !llfi_index !1461
  %58 = getelementptr inbounds i32* %56, i64 10, !llfi_index !1462
  %59 = getelementptr inbounds i32* %57, i64 10, !llfi_index !1462
  call void bitcast (void (i64, i64)* @global_add to void (i32*, i32*)*)(i32* %58, i32* %59)
  store i32 9, i32* %58, align 4, !llfi_index !1463
  %60 = load i32** %num_nucs, align 8, !llfi_index !1464
  %61 = load i32** %num_nucs, align 8, !llfi_index !1464
  %62 = getelementptr inbounds i32* %60, i64 11, !llfi_index !1465
  %63 = getelementptr inbounds i32* %61, i64 11, !llfi_index !1465
  call void bitcast (void (i64, i64)* @global_add to void (i32*, i32*)*)(i32* %62, i32* %63)
  store i32 9, i32* %62, align 4, !llfi_index !1466
  %64 = load i32** %num_nucs, align 8, !llfi_index !1467
  %65 = load i32** %num_nucs, align 8, !llfi_index !1467
  call void bitcast (void (i64, i64)* @global_add to void (i32*, i32*)*)(i32* %64, i32* %65)
  ret i32* %64, !llfi_index !1468
}

; Function Attrs: nounwind uwtable
define i32** @load_mats(i32* %num_nucs, i64 %n_isotopes) #0 {
  %1 = alloca i32*, align 8, !llfi_index !1469
  %2 = alloca i64, align 8, !llfi_index !1470
  %mats = alloca i32**, align 8, !llfi_index !1471
  %i = alloca i32, align 4, !llfi_index !1472
  %mats0_Sml = alloca [34 x i32], align 16, !llfi_index !1473
  %mats0_Lrg = alloca [321 x i32], align 16, !llfi_index !1474
  %i1 = alloca i32, align 4, !llfi_index !1475
  %mats1 = alloca [5 x i32], align 16, !llfi_index !1476
  %mats2 = alloca [4 x i32], align 16, !llfi_index !1477
  %mats3 = alloca [4 x i32], align 16, !llfi_index !1478
  %mats4 = alloca [27 x i32], align 16, !llfi_index !1479
  %mats5 = alloca [21 x i32], align 16, !llfi_index !1480
  %mats6 = alloca [21 x i32], align 16, !llfi_index !1481
  %mats7 = alloca [21 x i32], align 16, !llfi_index !1482
  %mats8 = alloca [21 x i32], align 16, !llfi_index !1483
  %mats9 = alloca [21 x i32], align 16, !llfi_index !1484
  %mats10 = alloca [9 x i32], align 16, !llfi_index !1485
  %mats11 = alloca [9 x i32], align 16, !llfi_index !1486
  store i32* %num_nucs, i32** %1, align 8, !llfi_index !1487
  store i64 %n_isotopes, i64* %2, align 8, !llfi_index !1488
  %3 = call noalias i8* @malloc(i64 96) #3, !llfi_index !1489
  %4 = bitcast i8* %3 to i32**, !llfi_index !1490
  %5 = bitcast i8* %3 to i32**, !llfi_index !1490
  call void bitcast (void (i64, i64)* @global_add to void (i32**, i32**)*)(i32** %4, i32** %5)
  store i32** %4, i32*** %mats, align 8, !llfi_index !1491
  store i32 0, i32* %i, align 4, !llfi_index !1492
  br label %6, !llfi_index !1493

; <label>:6                                       ; preds = %37, %0
  %7 = load i32* %i, align 4, !llfi_index !1494
  %8 = load i32* %i, align 4, !llfi_index !1494
  %9 = icmp slt i32 %7, 12, !llfi_index !1495
  %10 = icmp slt i32 %8, 12, !llfi_index !1495
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %9, i1 %10)
  br i1 %9, label %11, label %42, !llfi_index !1496

; <label>:11                                      ; preds = %6
  %12 = load i32* %i, align 4, !llfi_index !1497
  %13 = load i32* %i, align 4, !llfi_index !1497
  %14 = sext i32 %12 to i64, !llfi_index !1498
  %15 = sext i32 %13 to i64, !llfi_index !1498
  %16 = load i32** %1, align 8, !llfi_index !1499
  %17 = load i32** %1, align 8, !llfi_index !1499
  %18 = getelementptr inbounds i32* %16, i64 %14, !llfi_index !1500
  %19 = getelementptr inbounds i32* %17, i64 %15, !llfi_index !1500
  %20 = load i32* %18, align 4, !llfi_index !1501
  %21 = load i32* %19, align 4, !llfi_index !1501
  %22 = sext i32 %20 to i64, !llfi_index !1502
  %23 = sext i32 %21 to i64, !llfi_index !1502
  %24 = mul i64 %22, 4, !llfi_index !1503
  %25 = mul i64 %23, 4, !llfi_index !1503
  call void @global_add(i64 %24, i64 %25)
  %26 = call noalias i8* @malloc(i64 %24) #3, !llfi_index !1504
  %27 = bitcast i8* %26 to i32*, !llfi_index !1505
  %28 = bitcast i8* %26 to i32*, !llfi_index !1505
  call void bitcast (void (i64, i64)* @global_add to void (i32*, i32*)*)(i32* %27, i32* %28)
  %29 = load i32* %i, align 4, !llfi_index !1506
  %30 = load i32* %i, align 4, !llfi_index !1506
  %31 = sext i32 %29 to i64, !llfi_index !1507
  %32 = sext i32 %30 to i64, !llfi_index !1507
  %33 = load i32*** %mats, align 8, !llfi_index !1508
  %34 = load i32*** %mats, align 8, !llfi_index !1508
  %35 = getelementptr inbounds i32** %33, i64 %31, !llfi_index !1509
  %36 = getelementptr inbounds i32** %34, i64 %32, !llfi_index !1509
  call void bitcast (void (i64, i64)* @global_add to void (i32**, i32**)*)(i32** %35, i32** %36)
  store i32* %27, i32** %35, align 8, !llfi_index !1510
  br label %37, !llfi_index !1511

; <label>:37                                      ; preds = %11
  %38 = load i32* %i, align 4, !llfi_index !1512
  %39 = load i32* %i, align 4, !llfi_index !1512
  %40 = add nsw i32 %38, 1, !llfi_index !1513
  %41 = add nsw i32 %39, 1, !llfi_index !1513
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %40, i32 %41)
  store i32 %40, i32* %i, align 4, !llfi_index !1514
  br label %6, !llfi_index !1515

; <label>:42                                      ; preds = %6
  %43 = bitcast [34 x i32]* %mats0_Sml to i8*, !llfi_index !1516
  %44 = bitcast [34 x i32]* %mats0_Sml to i8*, !llfi_index !1516
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %43, i8* %44)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %43, i8* bitcast ([34 x i32]* @load_mats.mats0_Sml to i8*), i64 136, i32 16, i1 false), !llfi_index !1517
  %45 = bitcast [321 x i32]* %mats0_Lrg to i8*, !llfi_index !1518
  %46 = bitcast [321 x i32]* %mats0_Lrg to i8*, !llfi_index !1518
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %45, i8* %46)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %45, i8* bitcast ([321 x i32]* @load_mats.mats0_Lrg to i8*), i64 1284, i32 16, i1 false), !llfi_index !1519
  store i32 0, i32* %i1, align 4, !llfi_index !1520
  br label %47, !llfi_index !1521

; <label>:47                                      ; preds = %65, %42
  %48 = load i32* %i1, align 4, !llfi_index !1522
  %49 = load i32* %i1, align 4, !llfi_index !1522
  %50 = icmp slt i32 %48, 287, !llfi_index !1523
  %51 = icmp slt i32 %49, 287, !llfi_index !1523
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %50, i1 %51)
  br i1 %50, label %52, label %70, !llfi_index !1524

; <label>:52                                      ; preds = %47
  %53 = load i32* %i1, align 4, !llfi_index !1525
  %54 = load i32* %i1, align 4, !llfi_index !1525
  %55 = add nsw i32 68, %53, !llfi_index !1526
  %56 = add nsw i32 68, %54, !llfi_index !1526
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %55, i32 %56)
  %57 = load i32* %i1, align 4, !llfi_index !1527
  %58 = load i32* %i1, align 4, !llfi_index !1527
  %59 = add nsw i32 34, %57, !llfi_index !1528
  %60 = add nsw i32 34, %58, !llfi_index !1528
  %61 = sext i32 %59 to i64, !llfi_index !1529
  %62 = sext i32 %60 to i64, !llfi_index !1529
  %63 = getelementptr inbounds [321 x i32]* %mats0_Lrg, i32 0, i64 %61, !llfi_index !1530
  %64 = getelementptr inbounds [321 x i32]* %mats0_Lrg, i32 0, i64 %62, !llfi_index !1530
  call void bitcast (void (i64, i64)* @global_add to void (i32*, i32*)*)(i32* %63, i32* %64)
  store i32 %55, i32* %63, align 4, !llfi_index !1531
  br label %65, !llfi_index !1532

; <label>:65                                      ; preds = %52
  %66 = load i32* %i1, align 4, !llfi_index !1533
  %67 = load i32* %i1, align 4, !llfi_index !1533
  %68 = add nsw i32 %66, 1, !llfi_index !1534
  %69 = add nsw i32 %67, 1, !llfi_index !1534
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %68, i32 %69)
  store i32 %68, i32* %i1, align 4, !llfi_index !1535
  br label %47, !llfi_index !1536

; <label>:70                                      ; preds = %47
  %71 = bitcast [5 x i32]* %mats1 to i8*, !llfi_index !1537
  %72 = bitcast [5 x i32]* %mats1 to i8*, !llfi_index !1537
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %71, i8* %72)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %71, i8* bitcast ([5 x i32]* @load_mats.mats1 to i8*), i64 20, i32 16, i1 false), !llfi_index !1538
  %73 = bitcast [4 x i32]* %mats2 to i8*, !llfi_index !1539
  %74 = bitcast [4 x i32]* %mats2 to i8*, !llfi_index !1539
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %73, i8* %74)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %73, i8* bitcast ([4 x i32]* @load_mats.mats2 to i8*), i64 16, i32 16, i1 false), !llfi_index !1540
  %75 = bitcast [4 x i32]* %mats3 to i8*, !llfi_index !1541
  %76 = bitcast [4 x i32]* %mats3 to i8*, !llfi_index !1541
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %75, i8* %76)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %75, i8* bitcast ([4 x i32]* @load_mats.mats3 to i8*), i64 16, i32 16, i1 false), !llfi_index !1542
  %77 = bitcast [27 x i32]* %mats4 to i8*, !llfi_index !1543
  %78 = bitcast [27 x i32]* %mats4 to i8*, !llfi_index !1543
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %77, i8* %78)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %77, i8* bitcast ([27 x i32]* @load_mats.mats4 to i8*), i64 108, i32 16, i1 false), !llfi_index !1544
  %79 = bitcast [21 x i32]* %mats5 to i8*, !llfi_index !1545
  %80 = bitcast [21 x i32]* %mats5 to i8*, !llfi_index !1545
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %79, i8* %80)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %79, i8* bitcast ([21 x i32]* @load_mats.mats5 to i8*), i64 84, i32 16, i1 false), !llfi_index !1546
  %81 = bitcast [21 x i32]* %mats6 to i8*, !llfi_index !1547
  %82 = bitcast [21 x i32]* %mats6 to i8*, !llfi_index !1547
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %81, i8* %82)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %81, i8* bitcast ([21 x i32]* @load_mats.mats6 to i8*), i64 84, i32 16, i1 false), !llfi_index !1548
  %83 = bitcast [21 x i32]* %mats7 to i8*, !llfi_index !1549
  %84 = bitcast [21 x i32]* %mats7 to i8*, !llfi_index !1549
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %83, i8* %84)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %83, i8* bitcast ([21 x i32]* @load_mats.mats7 to i8*), i64 84, i32 16, i1 false), !llfi_index !1550
  %85 = bitcast [21 x i32]* %mats8 to i8*, !llfi_index !1551
  %86 = bitcast [21 x i32]* %mats8 to i8*, !llfi_index !1551
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %85, i8* %86)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %85, i8* bitcast ([21 x i32]* @load_mats.mats8 to i8*), i64 84, i32 16, i1 false), !llfi_index !1552
  %87 = bitcast [21 x i32]* %mats9 to i8*, !llfi_index !1553
  %88 = bitcast [21 x i32]* %mats9 to i8*, !llfi_index !1553
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %87, i8* %88)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %87, i8* bitcast ([21 x i32]* @load_mats.mats9 to i8*), i64 84, i32 16, i1 false), !llfi_index !1554
  %89 = bitcast [9 x i32]* %mats10 to i8*, !llfi_index !1555
  %90 = bitcast [9 x i32]* %mats10 to i8*, !llfi_index !1555
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %89, i8* %90)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %89, i8* bitcast ([9 x i32]* @load_mats.mats10 to i8*), i64 36, i32 16, i1 false), !llfi_index !1556
  %91 = bitcast [9 x i32]* %mats11 to i8*, !llfi_index !1557
  %92 = bitcast [9 x i32]* %mats11 to i8*, !llfi_index !1557
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %91, i8* %92)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %91, i8* bitcast ([9 x i32]* @load_mats.mats11 to i8*), i64 36, i32 16, i1 false), !llfi_index !1558
  %93 = load i64* %2, align 8, !llfi_index !1559
  %94 = load i64* %2, align 8, !llfi_index !1559
  %95 = icmp eq i64 %93, 68, !llfi_index !1560
  %96 = icmp eq i64 %94, 68, !llfi_index !1560
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %95, i1 %96)
  br i1 %95, label %97, label %118, !llfi_index !1561

; <label>:97                                      ; preds = %70
  %98 = load i32*** %mats, align 8, !llfi_index !1562
  %99 = load i32*** %mats, align 8, !llfi_index !1562
  %100 = getelementptr inbounds i32** %98, i64 0, !llfi_index !1563
  %101 = getelementptr inbounds i32** %99, i64 0, !llfi_index !1563
  %102 = load i32** %100, align 8, !llfi_index !1564
  %103 = load i32** %101, align 8, !llfi_index !1564
  %104 = bitcast i32* %102 to i8*, !llfi_index !1565
  %105 = bitcast i32* %103 to i8*, !llfi_index !1565
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %104, i8* %105)
  %106 = bitcast [34 x i32]* %mats0_Sml to i8*, !llfi_index !1566
  %107 = bitcast [34 x i32]* %mats0_Sml to i8*, !llfi_index !1566
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %106, i8* %107)
  %108 = load i32** %1, align 8, !llfi_index !1567
  %109 = load i32** %1, align 8, !llfi_index !1567
  %110 = getelementptr inbounds i32* %108, i64 0, !llfi_index !1568
  %111 = getelementptr inbounds i32* %109, i64 0, !llfi_index !1568
  %112 = load i32* %110, align 4, !llfi_index !1569
  %113 = load i32* %111, align 4, !llfi_index !1569
  %114 = sext i32 %112 to i64, !llfi_index !1570
  %115 = sext i32 %113 to i64, !llfi_index !1570
  %116 = mul i64 %114, 4, !llfi_index !1571
  %117 = mul i64 %115, 4, !llfi_index !1571
  call void @global_add(i64 %116, i64 %117)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %104, i8* %106, i64 %116, i32 4, i1 false), !llfi_index !1572
  br label %139, !llfi_index !1573

; <label>:118                                     ; preds = %70
  %119 = load i32*** %mats, align 8, !llfi_index !1574
  %120 = load i32*** %mats, align 8, !llfi_index !1574
  %121 = getelementptr inbounds i32** %119, i64 0, !llfi_index !1575
  %122 = getelementptr inbounds i32** %120, i64 0, !llfi_index !1575
  %123 = load i32** %121, align 8, !llfi_index !1576
  %124 = load i32** %122, align 8, !llfi_index !1576
  %125 = bitcast i32* %123 to i8*, !llfi_index !1577
  %126 = bitcast i32* %124 to i8*, !llfi_index !1577
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %125, i8* %126)
  %127 = bitcast [321 x i32]* %mats0_Lrg to i8*, !llfi_index !1578
  %128 = bitcast [321 x i32]* %mats0_Lrg to i8*, !llfi_index !1578
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %127, i8* %128)
  %129 = load i32** %1, align 8, !llfi_index !1579
  %130 = load i32** %1, align 8, !llfi_index !1579
  %131 = getelementptr inbounds i32* %129, i64 0, !llfi_index !1580
  %132 = getelementptr inbounds i32* %130, i64 0, !llfi_index !1580
  %133 = load i32* %131, align 4, !llfi_index !1581
  %134 = load i32* %132, align 4, !llfi_index !1581
  %135 = sext i32 %133 to i64, !llfi_index !1582
  %136 = sext i32 %134 to i64, !llfi_index !1582
  %137 = mul i64 %135, 4, !llfi_index !1583
  %138 = mul i64 %136, 4, !llfi_index !1583
  call void @global_add(i64 %137, i64 %138)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %125, i8* %127, i64 %137, i32 4, i1 false), !llfi_index !1584
  br label %139, !llfi_index !1585

; <label>:139                                     ; preds = %118, %97
  %140 = load i32*** %mats, align 8, !llfi_index !1586
  %141 = load i32*** %mats, align 8, !llfi_index !1586
  %142 = getelementptr inbounds i32** %140, i64 1, !llfi_index !1587
  %143 = getelementptr inbounds i32** %141, i64 1, !llfi_index !1587
  %144 = load i32** %142, align 8, !llfi_index !1588
  %145 = load i32** %143, align 8, !llfi_index !1588
  %146 = bitcast i32* %144 to i8*, !llfi_index !1589
  %147 = bitcast i32* %145 to i8*, !llfi_index !1589
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %146, i8* %147)
  %148 = bitcast [5 x i32]* %mats1 to i8*, !llfi_index !1590
  %149 = bitcast [5 x i32]* %mats1 to i8*, !llfi_index !1590
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %148, i8* %149)
  %150 = load i32** %1, align 8, !llfi_index !1591
  %151 = load i32** %1, align 8, !llfi_index !1591
  %152 = getelementptr inbounds i32* %150, i64 1, !llfi_index !1592
  %153 = getelementptr inbounds i32* %151, i64 1, !llfi_index !1592
  %154 = load i32* %152, align 4, !llfi_index !1593
  %155 = load i32* %153, align 4, !llfi_index !1593
  %156 = sext i32 %154 to i64, !llfi_index !1594
  %157 = sext i32 %155 to i64, !llfi_index !1594
  %158 = mul i64 %156, 4, !llfi_index !1595
  %159 = mul i64 %157, 4, !llfi_index !1595
  call void @global_add(i64 %158, i64 %159)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %146, i8* %148, i64 %158, i32 4, i1 false), !llfi_index !1596
  %160 = load i32*** %mats, align 8, !llfi_index !1597
  %161 = load i32*** %mats, align 8, !llfi_index !1597
  %162 = getelementptr inbounds i32** %160, i64 2, !llfi_index !1598
  %163 = getelementptr inbounds i32** %161, i64 2, !llfi_index !1598
  %164 = load i32** %162, align 8, !llfi_index !1599
  %165 = load i32** %163, align 8, !llfi_index !1599
  %166 = bitcast i32* %164 to i8*, !llfi_index !1600
  %167 = bitcast i32* %165 to i8*, !llfi_index !1600
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %166, i8* %167)
  %168 = bitcast [4 x i32]* %mats2 to i8*, !llfi_index !1601
  %169 = bitcast [4 x i32]* %mats2 to i8*, !llfi_index !1601
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %168, i8* %169)
  %170 = load i32** %1, align 8, !llfi_index !1602
  %171 = load i32** %1, align 8, !llfi_index !1602
  %172 = getelementptr inbounds i32* %170, i64 2, !llfi_index !1603
  %173 = getelementptr inbounds i32* %171, i64 2, !llfi_index !1603
  %174 = load i32* %172, align 4, !llfi_index !1604
  %175 = load i32* %173, align 4, !llfi_index !1604
  %176 = sext i32 %174 to i64, !llfi_index !1605
  %177 = sext i32 %175 to i64, !llfi_index !1605
  %178 = mul i64 %176, 4, !llfi_index !1606
  %179 = mul i64 %177, 4, !llfi_index !1606
  call void @global_add(i64 %178, i64 %179)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %166, i8* %168, i64 %178, i32 4, i1 false), !llfi_index !1607
  %180 = load i32*** %mats, align 8, !llfi_index !1608
  %181 = load i32*** %mats, align 8, !llfi_index !1608
  %182 = getelementptr inbounds i32** %180, i64 3, !llfi_index !1609
  %183 = getelementptr inbounds i32** %181, i64 3, !llfi_index !1609
  %184 = load i32** %182, align 8, !llfi_index !1610
  %185 = load i32** %183, align 8, !llfi_index !1610
  %186 = bitcast i32* %184 to i8*, !llfi_index !1611
  %187 = bitcast i32* %185 to i8*, !llfi_index !1611
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %186, i8* %187)
  %188 = bitcast [4 x i32]* %mats3 to i8*, !llfi_index !1612
  %189 = bitcast [4 x i32]* %mats3 to i8*, !llfi_index !1612
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %188, i8* %189)
  %190 = load i32** %1, align 8, !llfi_index !1613
  %191 = load i32** %1, align 8, !llfi_index !1613
  %192 = getelementptr inbounds i32* %190, i64 3, !llfi_index !1614
  %193 = getelementptr inbounds i32* %191, i64 3, !llfi_index !1614
  %194 = load i32* %192, align 4, !llfi_index !1615
  %195 = load i32* %193, align 4, !llfi_index !1615
  %196 = sext i32 %194 to i64, !llfi_index !1616
  %197 = sext i32 %195 to i64, !llfi_index !1616
  %198 = mul i64 %196, 4, !llfi_index !1617
  %199 = mul i64 %197, 4, !llfi_index !1617
  call void @global_add(i64 %198, i64 %199)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %186, i8* %188, i64 %198, i32 4, i1 false), !llfi_index !1618
  %200 = load i32*** %mats, align 8, !llfi_index !1619
  %201 = load i32*** %mats, align 8, !llfi_index !1619
  %202 = getelementptr inbounds i32** %200, i64 4, !llfi_index !1620
  %203 = getelementptr inbounds i32** %201, i64 4, !llfi_index !1620
  %204 = load i32** %202, align 8, !llfi_index !1621
  %205 = load i32** %203, align 8, !llfi_index !1621
  %206 = bitcast i32* %204 to i8*, !llfi_index !1622
  %207 = bitcast i32* %205 to i8*, !llfi_index !1622
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %206, i8* %207)
  %208 = bitcast [27 x i32]* %mats4 to i8*, !llfi_index !1623
  %209 = bitcast [27 x i32]* %mats4 to i8*, !llfi_index !1623
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %208, i8* %209)
  %210 = load i32** %1, align 8, !llfi_index !1624
  %211 = load i32** %1, align 8, !llfi_index !1624
  %212 = getelementptr inbounds i32* %210, i64 4, !llfi_index !1625
  %213 = getelementptr inbounds i32* %211, i64 4, !llfi_index !1625
  %214 = load i32* %212, align 4, !llfi_index !1626
  %215 = load i32* %213, align 4, !llfi_index !1626
  %216 = sext i32 %214 to i64, !llfi_index !1627
  %217 = sext i32 %215 to i64, !llfi_index !1627
  %218 = mul i64 %216, 4, !llfi_index !1628
  %219 = mul i64 %217, 4, !llfi_index !1628
  call void @global_add(i64 %218, i64 %219)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %206, i8* %208, i64 %218, i32 4, i1 false), !llfi_index !1629
  %220 = load i32*** %mats, align 8, !llfi_index !1630
  %221 = load i32*** %mats, align 8, !llfi_index !1630
  %222 = getelementptr inbounds i32** %220, i64 5, !llfi_index !1631
  %223 = getelementptr inbounds i32** %221, i64 5, !llfi_index !1631
  %224 = load i32** %222, align 8, !llfi_index !1632
  %225 = load i32** %223, align 8, !llfi_index !1632
  %226 = bitcast i32* %224 to i8*, !llfi_index !1633
  %227 = bitcast i32* %225 to i8*, !llfi_index !1633
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %226, i8* %227)
  %228 = bitcast [21 x i32]* %mats5 to i8*, !llfi_index !1634
  %229 = bitcast [21 x i32]* %mats5 to i8*, !llfi_index !1634
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %228, i8* %229)
  %230 = load i32** %1, align 8, !llfi_index !1635
  %231 = load i32** %1, align 8, !llfi_index !1635
  %232 = getelementptr inbounds i32* %230, i64 5, !llfi_index !1636
  %233 = getelementptr inbounds i32* %231, i64 5, !llfi_index !1636
  %234 = load i32* %232, align 4, !llfi_index !1637
  %235 = load i32* %233, align 4, !llfi_index !1637
  %236 = sext i32 %234 to i64, !llfi_index !1638
  %237 = sext i32 %235 to i64, !llfi_index !1638
  %238 = mul i64 %236, 4, !llfi_index !1639
  %239 = mul i64 %237, 4, !llfi_index !1639
  call void @global_add(i64 %238, i64 %239)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %226, i8* %228, i64 %238, i32 4, i1 false), !llfi_index !1640
  %240 = load i32*** %mats, align 8, !llfi_index !1641
  %241 = load i32*** %mats, align 8, !llfi_index !1641
  %242 = getelementptr inbounds i32** %240, i64 6, !llfi_index !1642
  %243 = getelementptr inbounds i32** %241, i64 6, !llfi_index !1642
  %244 = load i32** %242, align 8, !llfi_index !1643
  %245 = load i32** %243, align 8, !llfi_index !1643
  %246 = bitcast i32* %244 to i8*, !llfi_index !1644
  %247 = bitcast i32* %245 to i8*, !llfi_index !1644
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %246, i8* %247)
  %248 = bitcast [21 x i32]* %mats6 to i8*, !llfi_index !1645
  %249 = bitcast [21 x i32]* %mats6 to i8*, !llfi_index !1645
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %248, i8* %249)
  %250 = load i32** %1, align 8, !llfi_index !1646
  %251 = load i32** %1, align 8, !llfi_index !1646
  %252 = getelementptr inbounds i32* %250, i64 6, !llfi_index !1647
  %253 = getelementptr inbounds i32* %251, i64 6, !llfi_index !1647
  %254 = load i32* %252, align 4, !llfi_index !1648
  %255 = load i32* %253, align 4, !llfi_index !1648
  %256 = sext i32 %254 to i64, !llfi_index !1649
  %257 = sext i32 %255 to i64, !llfi_index !1649
  %258 = mul i64 %256, 4, !llfi_index !1650
  %259 = mul i64 %257, 4, !llfi_index !1650
  call void @global_add(i64 %258, i64 %259)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %246, i8* %248, i64 %258, i32 4, i1 false), !llfi_index !1651
  %260 = load i32*** %mats, align 8, !llfi_index !1652
  %261 = load i32*** %mats, align 8, !llfi_index !1652
  %262 = getelementptr inbounds i32** %260, i64 7, !llfi_index !1653
  %263 = getelementptr inbounds i32** %261, i64 7, !llfi_index !1653
  %264 = load i32** %262, align 8, !llfi_index !1654
  %265 = load i32** %263, align 8, !llfi_index !1654
  %266 = bitcast i32* %264 to i8*, !llfi_index !1655
  %267 = bitcast i32* %265 to i8*, !llfi_index !1655
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %266, i8* %267)
  %268 = bitcast [21 x i32]* %mats7 to i8*, !llfi_index !1656
  %269 = bitcast [21 x i32]* %mats7 to i8*, !llfi_index !1656
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %268, i8* %269)
  %270 = load i32** %1, align 8, !llfi_index !1657
  %271 = load i32** %1, align 8, !llfi_index !1657
  %272 = getelementptr inbounds i32* %270, i64 7, !llfi_index !1658
  %273 = getelementptr inbounds i32* %271, i64 7, !llfi_index !1658
  %274 = load i32* %272, align 4, !llfi_index !1659
  %275 = load i32* %273, align 4, !llfi_index !1659
  %276 = sext i32 %274 to i64, !llfi_index !1660
  %277 = sext i32 %275 to i64, !llfi_index !1660
  %278 = mul i64 %276, 4, !llfi_index !1661
  %279 = mul i64 %277, 4, !llfi_index !1661
  call void @global_add(i64 %278, i64 %279)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %266, i8* %268, i64 %278, i32 4, i1 false), !llfi_index !1662
  %280 = load i32*** %mats, align 8, !llfi_index !1663
  %281 = load i32*** %mats, align 8, !llfi_index !1663
  %282 = getelementptr inbounds i32** %280, i64 8, !llfi_index !1664
  %283 = getelementptr inbounds i32** %281, i64 8, !llfi_index !1664
  %284 = load i32** %282, align 8, !llfi_index !1665
  %285 = load i32** %283, align 8, !llfi_index !1665
  %286 = bitcast i32* %284 to i8*, !llfi_index !1666
  %287 = bitcast i32* %285 to i8*, !llfi_index !1666
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %286, i8* %287)
  %288 = bitcast [21 x i32]* %mats8 to i8*, !llfi_index !1667
  %289 = bitcast [21 x i32]* %mats8 to i8*, !llfi_index !1667
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %288, i8* %289)
  %290 = load i32** %1, align 8, !llfi_index !1668
  %291 = load i32** %1, align 8, !llfi_index !1668
  %292 = getelementptr inbounds i32* %290, i64 8, !llfi_index !1669
  %293 = getelementptr inbounds i32* %291, i64 8, !llfi_index !1669
  %294 = load i32* %292, align 4, !llfi_index !1670
  %295 = load i32* %293, align 4, !llfi_index !1670
  %296 = sext i32 %294 to i64, !llfi_index !1671
  %297 = sext i32 %295 to i64, !llfi_index !1671
  %298 = mul i64 %296, 4, !llfi_index !1672
  %299 = mul i64 %297, 4, !llfi_index !1672
  call void @global_add(i64 %298, i64 %299)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %286, i8* %288, i64 %298, i32 4, i1 false), !llfi_index !1673
  %300 = load i32*** %mats, align 8, !llfi_index !1674
  %301 = load i32*** %mats, align 8, !llfi_index !1674
  %302 = getelementptr inbounds i32** %300, i64 9, !llfi_index !1675
  %303 = getelementptr inbounds i32** %301, i64 9, !llfi_index !1675
  %304 = load i32** %302, align 8, !llfi_index !1676
  %305 = load i32** %303, align 8, !llfi_index !1676
  %306 = bitcast i32* %304 to i8*, !llfi_index !1677
  %307 = bitcast i32* %305 to i8*, !llfi_index !1677
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %306, i8* %307)
  %308 = bitcast [21 x i32]* %mats9 to i8*, !llfi_index !1678
  %309 = bitcast [21 x i32]* %mats9 to i8*, !llfi_index !1678
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %308, i8* %309)
  %310 = load i32** %1, align 8, !llfi_index !1679
  %311 = load i32** %1, align 8, !llfi_index !1679
  %312 = getelementptr inbounds i32* %310, i64 9, !llfi_index !1680
  %313 = getelementptr inbounds i32* %311, i64 9, !llfi_index !1680
  %314 = load i32* %312, align 4, !llfi_index !1681
  %315 = load i32* %313, align 4, !llfi_index !1681
  %316 = sext i32 %314 to i64, !llfi_index !1682
  %317 = sext i32 %315 to i64, !llfi_index !1682
  %318 = mul i64 %316, 4, !llfi_index !1683
  %319 = mul i64 %317, 4, !llfi_index !1683
  call void @global_add(i64 %318, i64 %319)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %306, i8* %308, i64 %318, i32 4, i1 false), !llfi_index !1684
  %320 = load i32*** %mats, align 8, !llfi_index !1685
  %321 = load i32*** %mats, align 8, !llfi_index !1685
  %322 = getelementptr inbounds i32** %320, i64 10, !llfi_index !1686
  %323 = getelementptr inbounds i32** %321, i64 10, !llfi_index !1686
  %324 = load i32** %322, align 8, !llfi_index !1687
  %325 = load i32** %323, align 8, !llfi_index !1687
  %326 = bitcast i32* %324 to i8*, !llfi_index !1688
  %327 = bitcast i32* %325 to i8*, !llfi_index !1688
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %326, i8* %327)
  %328 = bitcast [9 x i32]* %mats10 to i8*, !llfi_index !1689
  %329 = bitcast [9 x i32]* %mats10 to i8*, !llfi_index !1689
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %328, i8* %329)
  %330 = load i32** %1, align 8, !llfi_index !1690
  %331 = load i32** %1, align 8, !llfi_index !1690
  %332 = getelementptr inbounds i32* %330, i64 10, !llfi_index !1691
  %333 = getelementptr inbounds i32* %331, i64 10, !llfi_index !1691
  %334 = load i32* %332, align 4, !llfi_index !1692
  %335 = load i32* %333, align 4, !llfi_index !1692
  %336 = sext i32 %334 to i64, !llfi_index !1693
  %337 = sext i32 %335 to i64, !llfi_index !1693
  %338 = mul i64 %336, 4, !llfi_index !1694
  %339 = mul i64 %337, 4, !llfi_index !1694
  call void @global_add(i64 %338, i64 %339)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %326, i8* %328, i64 %338, i32 4, i1 false), !llfi_index !1695
  %340 = load i32*** %mats, align 8, !llfi_index !1696
  %341 = load i32*** %mats, align 8, !llfi_index !1696
  %342 = getelementptr inbounds i32** %340, i64 11, !llfi_index !1697
  %343 = getelementptr inbounds i32** %341, i64 11, !llfi_index !1697
  %344 = load i32** %342, align 8, !llfi_index !1698
  %345 = load i32** %343, align 8, !llfi_index !1698
  %346 = bitcast i32* %344 to i8*, !llfi_index !1699
  %347 = bitcast i32* %345 to i8*, !llfi_index !1699
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %346, i8* %347)
  %348 = bitcast [9 x i32]* %mats11 to i8*, !llfi_index !1700
  %349 = bitcast [9 x i32]* %mats11 to i8*, !llfi_index !1700
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %348, i8* %349)
  %350 = load i32** %1, align 8, !llfi_index !1701
  %351 = load i32** %1, align 8, !llfi_index !1701
  %352 = getelementptr inbounds i32* %350, i64 11, !llfi_index !1702
  %353 = getelementptr inbounds i32* %351, i64 11, !llfi_index !1702
  %354 = load i32* %352, align 4, !llfi_index !1703
  %355 = load i32* %353, align 4, !llfi_index !1703
  %356 = sext i32 %354 to i64, !llfi_index !1704
  %357 = sext i32 %355 to i64, !llfi_index !1704
  %358 = mul i64 %356, 4, !llfi_index !1705
  %359 = mul i64 %357, 4, !llfi_index !1705
  call void @global_add(i64 %358, i64 %359)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %346, i8* %348, i64 %358, i32 4, i1 false), !llfi_index !1706
  %360 = load i32*** %mats, align 8, !llfi_index !1707
  %361 = load i32*** %mats, align 8, !llfi_index !1707
  call void bitcast (void (i64, i64)* @global_add to void (i32**, i32**)*)(i32** %360, i32** %361)
  ret i32** %360, !llfi_index !1708
}

; Function Attrs: nounwind uwtable
define double** @load_concs(i32* %num_nucs) #0 {
  %1 = alloca i32*, align 8, !llfi_index !1709
  %concs = alloca double**, align 8, !llfi_index !1710
  %i = alloca i32, align 4, !llfi_index !1711
  %i1 = alloca i32, align 4, !llfi_index !1712
  %j = alloca i32, align 4, !llfi_index !1713
  store i32* %num_nucs, i32** %1, align 8, !llfi_index !1714
  %2 = call noalias i8* @malloc(i64 96) #3, !llfi_index !1715
  %3 = bitcast i8* %2 to double**, !llfi_index !1716
  %4 = bitcast i8* %2 to double**, !llfi_index !1716
  call void bitcast (void (i64, i64)* @global_add to void (double**, double**)*)(double** %3, double** %4)
  store double** %3, double*** %concs, align 8, !llfi_index !1717
  store i32 0, i32* %i, align 4, !llfi_index !1718
  br label %5, !llfi_index !1719

; <label>:5                                       ; preds = %36, %0
  %6 = load i32* %i, align 4, !llfi_index !1720
  %7 = load i32* %i, align 4, !llfi_index !1720
  %8 = icmp slt i32 %6, 12, !llfi_index !1721
  %9 = icmp slt i32 %7, 12, !llfi_index !1721
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %8, i1 %9)
  br i1 %8, label %10, label %41, !llfi_index !1722

; <label>:10                                      ; preds = %5
  %11 = load i32* %i, align 4, !llfi_index !1723
  %12 = load i32* %i, align 4, !llfi_index !1723
  %13 = sext i32 %11 to i64, !llfi_index !1724
  %14 = sext i32 %12 to i64, !llfi_index !1724
  %15 = load i32** %1, align 8, !llfi_index !1725
  %16 = load i32** %1, align 8, !llfi_index !1725
  %17 = getelementptr inbounds i32* %15, i64 %13, !llfi_index !1726
  %18 = getelementptr inbounds i32* %16, i64 %14, !llfi_index !1726
  %19 = load i32* %17, align 4, !llfi_index !1727
  %20 = load i32* %18, align 4, !llfi_index !1727
  %21 = sext i32 %19 to i64, !llfi_index !1728
  %22 = sext i32 %20 to i64, !llfi_index !1728
  %23 = mul i64 %21, 8, !llfi_index !1729
  %24 = mul i64 %22, 8, !llfi_index !1729
  call void @global_add(i64 %23, i64 %24)
  %25 = call noalias i8* @malloc(i64 %23) #3, !llfi_index !1730
  %26 = bitcast i8* %25 to double*, !llfi_index !1731
  %27 = bitcast i8* %25 to double*, !llfi_index !1731
  call void bitcast (void (i64, i64)* @global_add to void (double*, double*)*)(double* %26, double* %27)
  %28 = load i32* %i, align 4, !llfi_index !1732
  %29 = load i32* %i, align 4, !llfi_index !1732
  %30 = sext i32 %28 to i64, !llfi_index !1733
  %31 = sext i32 %29 to i64, !llfi_index !1733
  %32 = load double*** %concs, align 8, !llfi_index !1734
  %33 = load double*** %concs, align 8, !llfi_index !1734
  %34 = getelementptr inbounds double** %32, i64 %30, !llfi_index !1735
  %35 = getelementptr inbounds double** %33, i64 %31, !llfi_index !1735
  call void bitcast (void (i64, i64)* @global_add to void (double**, double**)*)(double** %34, double** %35)
  store double* %26, double** %34, align 8, !llfi_index !1736
  br label %36, !llfi_index !1737

; <label>:36                                      ; preds = %10
  %37 = load i32* %i, align 4, !llfi_index !1738
  %38 = load i32* %i, align 4, !llfi_index !1738
  %39 = add nsw i32 %37, 1, !llfi_index !1739
  %40 = add nsw i32 %38, 1, !llfi_index !1739
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %39, i32 %40)
  store i32 %39, i32* %i, align 4, !llfi_index !1740
  br label %5, !llfi_index !1741

; <label>:41                                      ; preds = %5
  store i32 0, i32* %i1, align 4, !llfi_index !1742
  br label %42, !llfi_index !1743

; <label>:42                                      ; preds = %86, %41
  %43 = load i32* %i1, align 4, !llfi_index !1744
  %44 = load i32* %i1, align 4, !llfi_index !1744
  %45 = icmp slt i32 %43, 12, !llfi_index !1745
  %46 = icmp slt i32 %44, 12, !llfi_index !1745
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %45, i1 %46)
  br i1 %45, label %47, label %91, !llfi_index !1746

; <label>:47                                      ; preds = %42
  store i32 0, i32* %j, align 4, !llfi_index !1747
  br label %48, !llfi_index !1748

; <label>:48                                      ; preds = %80, %47
  %49 = load i32* %j, align 4, !llfi_index !1749
  %50 = load i32* %j, align 4, !llfi_index !1749
  %51 = load i32* %i1, align 4, !llfi_index !1750
  %52 = load i32* %i1, align 4, !llfi_index !1750
  %53 = sext i32 %51 to i64, !llfi_index !1751
  %54 = sext i32 %52 to i64, !llfi_index !1751
  %55 = load i32** %1, align 8, !llfi_index !1752
  %56 = load i32** %1, align 8, !llfi_index !1752
  %57 = getelementptr inbounds i32* %55, i64 %53, !llfi_index !1753
  %58 = getelementptr inbounds i32* %56, i64 %54, !llfi_index !1753
  %59 = load i32* %57, align 4, !llfi_index !1754
  %60 = load i32* %58, align 4, !llfi_index !1754
  %61 = icmp slt i32 %49, %59, !llfi_index !1755
  %62 = icmp slt i32 %50, %60, !llfi_index !1755
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %61, i1 %62)
  br i1 %61, label %63, label %85, !llfi_index !1756

; <label>:63                                      ; preds = %48
  %64 = load i32* %j, align 4, !llfi_index !1757
  %65 = load i32* %j, align 4, !llfi_index !1757
  %66 = sext i32 %64 to i64, !llfi_index !1758
  %67 = sext i32 %65 to i64, !llfi_index !1758
  %68 = load i32* %i1, align 4, !llfi_index !1759
  %69 = load i32* %i1, align 4, !llfi_index !1759
  %70 = sext i32 %68 to i64, !llfi_index !1760
  %71 = sext i32 %69 to i64, !llfi_index !1760
  %72 = load double*** %concs, align 8, !llfi_index !1761
  %73 = load double*** %concs, align 8, !llfi_index !1761
  %74 = getelementptr inbounds double** %72, i64 %70, !llfi_index !1762
  %75 = getelementptr inbounds double** %73, i64 %71, !llfi_index !1762
  %76 = load double** %74, align 8, !llfi_index !1763
  %77 = load double** %75, align 8, !llfi_index !1763
  %78 = getelementptr inbounds double* %76, i64 %66, !llfi_index !1764
  %79 = getelementptr inbounds double* %77, i64 %67, !llfi_index !1764
  call void bitcast (void (i64, i64)* @global_add to void (double*, double*)*)(double* %78, double* %79)
  store double 1.140000e+02, double* %78, align 8, !llfi_index !1765
  br label %80, !llfi_index !1766

; <label>:80                                      ; preds = %63
  %81 = load i32* %j, align 4, !llfi_index !1767
  %82 = load i32* %j, align 4, !llfi_index !1767
  %83 = add nsw i32 %81, 1, !llfi_index !1768
  %84 = add nsw i32 %82, 1, !llfi_index !1768
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %83, i32 %84)
  store i32 %83, i32* %j, align 4, !llfi_index !1769
  br label %48, !llfi_index !1770

; <label>:85                                      ; preds = %48
  br label %86, !llfi_index !1771

; <label>:86                                      ; preds = %85
  %87 = load i32* %i1, align 4, !llfi_index !1772
  %88 = load i32* %i1, align 4, !llfi_index !1772
  %89 = add nsw i32 %87, 1, !llfi_index !1773
  %90 = add nsw i32 %88, 1, !llfi_index !1773
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %89, i32 %90)
  store i32 %89, i32* %i1, align 4, !llfi_index !1774
  br label %42, !llfi_index !1775

; <label>:91                                      ; preds = %42
  %92 = load double*** %concs, align 8, !llfi_index !1776
  %93 = load double*** %concs, align 8, !llfi_index !1776
  call void bitcast (void (i64, i64)* @global_add to void (double**, double**)*)(double** %92, double** %93)
  ret double** %92, !llfi_index !1777
}

; Function Attrs: nounwind uwtable
define double** @load_concs_v(i32* %num_nucs) #0 {
  %1 = alloca i32*, align 8, !llfi_index !1778
  %concs = alloca double**, align 8, !llfi_index !1779
  %i = alloca i32, align 4, !llfi_index !1780
  %i1 = alloca i32, align 4, !llfi_index !1781
  %j = alloca i32, align 4, !llfi_index !1782
  store i32* %num_nucs, i32** %1, align 8, !llfi_index !1783
  %2 = call noalias i8* @malloc(i64 96) #3, !llfi_index !1784
  %3 = bitcast i8* %2 to double**, !llfi_index !1785
  %4 = bitcast i8* %2 to double**, !llfi_index !1785
  call void bitcast (void (i64, i64)* @global_add to void (double**, double**)*)(double** %3, double** %4)
  store double** %3, double*** %concs, align 8, !llfi_index !1786
  store i32 0, i32* %i, align 4, !llfi_index !1787
  br label %5, !llfi_index !1788

; <label>:5                                       ; preds = %36, %0
  %6 = load i32* %i, align 4, !llfi_index !1789
  %7 = load i32* %i, align 4, !llfi_index !1789
  %8 = icmp slt i32 %6, 12, !llfi_index !1790
  %9 = icmp slt i32 %7, 12, !llfi_index !1790
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %8, i1 %9)
  br i1 %8, label %10, label %41, !llfi_index !1791

; <label>:10                                      ; preds = %5
  %11 = load i32* %i, align 4, !llfi_index !1792
  %12 = load i32* %i, align 4, !llfi_index !1792
  %13 = sext i32 %11 to i64, !llfi_index !1793
  %14 = sext i32 %12 to i64, !llfi_index !1793
  %15 = load i32** %1, align 8, !llfi_index !1794
  %16 = load i32** %1, align 8, !llfi_index !1794
  %17 = getelementptr inbounds i32* %15, i64 %13, !llfi_index !1795
  %18 = getelementptr inbounds i32* %16, i64 %14, !llfi_index !1795
  %19 = load i32* %17, align 4, !llfi_index !1796
  %20 = load i32* %18, align 4, !llfi_index !1796
  %21 = sext i32 %19 to i64, !llfi_index !1797
  %22 = sext i32 %20 to i64, !llfi_index !1797
  %23 = mul i64 %21, 8, !llfi_index !1798
  %24 = mul i64 %22, 8, !llfi_index !1798
  call void @global_add(i64 %23, i64 %24)
  %25 = call noalias i8* @malloc(i64 %23) #3, !llfi_index !1799
  %26 = bitcast i8* %25 to double*, !llfi_index !1800
  %27 = bitcast i8* %25 to double*, !llfi_index !1800
  call void bitcast (void (i64, i64)* @global_add to void (double*, double*)*)(double* %26, double* %27)
  %28 = load i32* %i, align 4, !llfi_index !1801
  %29 = load i32* %i, align 4, !llfi_index !1801
  %30 = sext i32 %28 to i64, !llfi_index !1802
  %31 = sext i32 %29 to i64, !llfi_index !1802
  %32 = load double*** %concs, align 8, !llfi_index !1803
  %33 = load double*** %concs, align 8, !llfi_index !1803
  %34 = getelementptr inbounds double** %32, i64 %30, !llfi_index !1804
  %35 = getelementptr inbounds double** %33, i64 %31, !llfi_index !1804
  call void bitcast (void (i64, i64)* @global_add to void (double**, double**)*)(double** %34, double** %35)
  store double* %26, double** %34, align 8, !llfi_index !1805
  br label %36, !llfi_index !1806

; <label>:36                                      ; preds = %10
  %37 = load i32* %i, align 4, !llfi_index !1807
  %38 = load i32* %i, align 4, !llfi_index !1807
  %39 = add nsw i32 %37, 1, !llfi_index !1808
  %40 = add nsw i32 %38, 1, !llfi_index !1808
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %39, i32 %40)
  store i32 %39, i32* %i, align 4, !llfi_index !1809
  br label %5, !llfi_index !1810

; <label>:41                                      ; preds = %5
  store i32 0, i32* %i1, align 4, !llfi_index !1811
  br label %42, !llfi_index !1812

; <label>:42                                      ; preds = %87, %41
  %43 = load i32* %i1, align 4, !llfi_index !1813
  %44 = load i32* %i1, align 4, !llfi_index !1813
  %45 = icmp slt i32 %43, 12, !llfi_index !1814
  %46 = icmp slt i32 %44, 12, !llfi_index !1814
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %45, i1 %46)
  br i1 %45, label %47, label %92, !llfi_index !1815

; <label>:47                                      ; preds = %42
  store i32 0, i32* %j, align 4, !llfi_index !1816
  br label %48, !llfi_index !1817

; <label>:48                                      ; preds = %81, %47
  %49 = load i32* %j, align 4, !llfi_index !1818
  %50 = load i32* %j, align 4, !llfi_index !1818
  %51 = load i32* %i1, align 4, !llfi_index !1819
  %52 = load i32* %i1, align 4, !llfi_index !1819
  %53 = sext i32 %51 to i64, !llfi_index !1820
  %54 = sext i32 %52 to i64, !llfi_index !1820
  %55 = load i32** %1, align 8, !llfi_index !1821
  %56 = load i32** %1, align 8, !llfi_index !1821
  %57 = getelementptr inbounds i32* %55, i64 %53, !llfi_index !1822
  %58 = getelementptr inbounds i32* %56, i64 %54, !llfi_index !1822
  %59 = load i32* %57, align 4, !llfi_index !1823
  %60 = load i32* %58, align 4, !llfi_index !1823
  %61 = icmp slt i32 %49, %59, !llfi_index !1824
  %62 = icmp slt i32 %50, %60, !llfi_index !1824
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %61, i1 %62)
  br i1 %61, label %63, label %86, !llfi_index !1825

; <label>:63                                      ; preds = %48
  %64 = call double @rn_v(), !llfi_index !1826
  %65 = load i32* %j, align 4, !llfi_index !1827
  %66 = load i32* %j, align 4, !llfi_index !1827
  %67 = sext i32 %65 to i64, !llfi_index !1828
  %68 = sext i32 %66 to i64, !llfi_index !1828
  %69 = load i32* %i1, align 4, !llfi_index !1829
  %70 = load i32* %i1, align 4, !llfi_index !1829
  %71 = sext i32 %69 to i64, !llfi_index !1830
  %72 = sext i32 %70 to i64, !llfi_index !1830
  %73 = load double*** %concs, align 8, !llfi_index !1831
  %74 = load double*** %concs, align 8, !llfi_index !1831
  %75 = getelementptr inbounds double** %73, i64 %71, !llfi_index !1832
  %76 = getelementptr inbounds double** %74, i64 %72, !llfi_index !1832
  %77 = load double** %75, align 8, !llfi_index !1833
  %78 = load double** %76, align 8, !llfi_index !1833
  %79 = getelementptr inbounds double* %77, i64 %67, !llfi_index !1834
  %80 = getelementptr inbounds double* %78, i64 %68, !llfi_index !1834
  call void bitcast (void (i64, i64)* @global_add to void (double*, double*)*)(double* %79, double* %80)
  store double %64, double* %79, align 8, !llfi_index !1835
  br label %81, !llfi_index !1836

; <label>:81                                      ; preds = %63
  %82 = load i32* %j, align 4, !llfi_index !1837
  %83 = load i32* %j, align 4, !llfi_index !1837
  %84 = add nsw i32 %82, 1, !llfi_index !1838
  %85 = add nsw i32 %83, 1, !llfi_index !1838
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %84, i32 %85)
  store i32 %84, i32* %j, align 4, !llfi_index !1839
  br label %48, !llfi_index !1840

; <label>:86                                      ; preds = %48
  br label %87, !llfi_index !1841

; <label>:87                                      ; preds = %86
  %88 = load i32* %i1, align 4, !llfi_index !1842
  %89 = load i32* %i1, align 4, !llfi_index !1842
  %90 = add nsw i32 %88, 1, !llfi_index !1843
  %91 = add nsw i32 %89, 1, !llfi_index !1843
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %90, i32 %91)
  store i32 %90, i32* %i1, align 4, !llfi_index !1844
  br label %42, !llfi_index !1845

; <label>:92                                      ; preds = %42
  %93 = load double*** %concs, align 8, !llfi_index !1846
  %94 = load double*** %concs, align 8, !llfi_index !1846
  call void bitcast (void (i64, i64)* @global_add to void (double**, double**)*)(double** %93, double** %94)
  ret double** %93, !llfi_index !1847
}

; Function Attrs: nounwind uwtable
define i32 @pick_mat(i64* %seed) #0 {
  %1 = alloca i32, align 4, !llfi_index !1848
  %2 = alloca i64*, align 8, !llfi_index !1849
  %dist = alloca [12 x double], align 16, !llfi_index !1850
  %roll = alloca double, align 8, !llfi_index !1851
  %i = alloca i32, align 4, !llfi_index !1852
  %running = alloca double, align 8, !llfi_index !1853
  %j = alloca i32, align 4, !llfi_index !1854
  store i64* %seed, i64** %2, align 8, !llfi_index !1855
  %3 = getelementptr inbounds [12 x double]* %dist, i32 0, i64 0, !llfi_index !1856
  %4 = getelementptr inbounds [12 x double]* %dist, i32 0, i64 0, !llfi_index !1856
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (double*, double*)*)(double* %3, double* %4)
  store double 1.400000e-01, double* %3, align 8, !llfi_index !1857
  %5 = getelementptr inbounds [12 x double]* %dist, i32 0, i64 1, !llfi_index !1858
  %6 = getelementptr inbounds [12 x double]* %dist, i32 0, i64 1, !llfi_index !1858
  call void bitcast (void (i64, i64)* @global_add to void (double*, double*)*)(double* %5, double* %6)
  store double 5.200000e-02, double* %5, align 8, !llfi_index !1859
  %7 = getelementptr inbounds [12 x double]* %dist, i32 0, i64 2, !llfi_index !1860
  %8 = getelementptr inbounds [12 x double]* %dist, i32 0, i64 2, !llfi_index !1860
  call void bitcast (void (i64, i64)* @global_add to void (double*, double*)*)(double* %7, double* %8)
  store double 2.750000e-01, double* %7, align 8, !llfi_index !1861
  %9 = getelementptr inbounds [12 x double]* %dist, i32 0, i64 3, !llfi_index !1862
  %10 = getelementptr inbounds [12 x double]* %dist, i32 0, i64 3, !llfi_index !1862
  call void bitcast (void (i64, i64)* @global_add to void (double*, double*)*)(double* %9, double* %10)
  store double 1.340000e-01, double* %9, align 8, !llfi_index !1863
  %11 = getelementptr inbounds [12 x double]* %dist, i32 0, i64 4, !llfi_index !1864
  %12 = getelementptr inbounds [12 x double]* %dist, i32 0, i64 4, !llfi_index !1864
  call void bitcast (void (i64, i64)* @global_add to void (double*, double*)*)(double* %11, double* %12)
  store double 1.540000e-01, double* %11, align 8, !llfi_index !1865
  %13 = getelementptr inbounds [12 x double]* %dist, i32 0, i64 5, !llfi_index !1866
  %14 = getelementptr inbounds [12 x double]* %dist, i32 0, i64 5, !llfi_index !1866
  call void bitcast (void (i64, i64)* @global_add to void (double*, double*)*)(double* %13, double* %14)
  store double 6.400000e-02, double* %13, align 8, !llfi_index !1867
  %15 = getelementptr inbounds [12 x double]* %dist, i32 0, i64 6, !llfi_index !1868
  %16 = getelementptr inbounds [12 x double]* %dist, i32 0, i64 6, !llfi_index !1868
  call void bitcast (void (i64, i64)* @global_add to void (double*, double*)*)(double* %15, double* %16)
  store double 6.600000e-02, double* %15, align 8, !llfi_index !1869
  %17 = getelementptr inbounds [12 x double]* %dist, i32 0, i64 7, !llfi_index !1870
  %18 = getelementptr inbounds [12 x double]* %dist, i32 0, i64 7, !llfi_index !1870
  call void bitcast (void (i64, i64)* @global_add to void (double*, double*)*)(double* %17, double* %18)
  store double 5.500000e-02, double* %17, align 8, !llfi_index !1871
  %19 = getelementptr inbounds [12 x double]* %dist, i32 0, i64 8, !llfi_index !1872
  %20 = getelementptr inbounds [12 x double]* %dist, i32 0, i64 8, !llfi_index !1872
  call void bitcast (void (i64, i64)* @global_add to void (double*, double*)*)(double* %19, double* %20)
  store double 8.000000e-03, double* %19, align 8, !llfi_index !1873
  %21 = getelementptr inbounds [12 x double]* %dist, i32 0, i64 9, !llfi_index !1874
  %22 = getelementptr inbounds [12 x double]* %dist, i32 0, i64 9, !llfi_index !1874
  call void bitcast (void (i64, i64)* @global_add to void (double*, double*)*)(double* %21, double* %22)
  store double 1.500000e-02, double* %21, align 8, !llfi_index !1875
  %23 = getelementptr inbounds [12 x double]* %dist, i32 0, i64 10, !llfi_index !1876
  %24 = getelementptr inbounds [12 x double]* %dist, i32 0, i64 10, !llfi_index !1876
  call void bitcast (void (i64, i64)* @global_add to void (double*, double*)*)(double* %23, double* %24)
  store double 2.500000e-02, double* %23, align 8, !llfi_index !1877
  %25 = getelementptr inbounds [12 x double]* %dist, i32 0, i64 11, !llfi_index !1878
  %26 = getelementptr inbounds [12 x double]* %dist, i32 0, i64 11, !llfi_index !1878
  call void bitcast (void (i64, i64)* @global_add to void (double*, double*)*)(double* %25, double* %26)
  store double 1.300000e-02, double* %25, align 8, !llfi_index !1879
  %27 = call double @rn_v(), !llfi_index !1880
  store double %27, double* %roll, align 8, !llfi_index !1881
  store i32 0, i32* %i, align 4, !llfi_index !1882
  br label %28, !llfi_index !1883

; <label>:28                                      ; preds = %70, %0
  %29 = load i32* %i, align 4, !llfi_index !1884
  %30 = load i32* %i, align 4, !llfi_index !1884
  %31 = icmp slt i32 %29, 12, !llfi_index !1885
  %32 = icmp slt i32 %30, 12, !llfi_index !1885
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %31, i1 %32)
  br i1 %31, label %33, label %75, !llfi_index !1886

; <label>:33                                      ; preds = %28
  store double 0.000000e+00, double* %running, align 8, !llfi_index !1887
  %34 = load i32* %i, align 4, !llfi_index !1888
  %35 = load i32* %i, align 4, !llfi_index !1888
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %34, i32 %35)
  store i32 %34, i32* %j, align 4, !llfi_index !1889
  br label %36, !llfi_index !1890

; <label>:36                                      ; preds = %54, %33
  %37 = load i32* %j, align 4, !llfi_index !1891
  %38 = load i32* %j, align 4, !llfi_index !1891
  %39 = icmp sgt i32 %37, 0, !llfi_index !1892
  %40 = icmp sgt i32 %38, 0, !llfi_index !1892
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %39, i1 %40)
  br i1 %39, label %41, label %59, !llfi_index !1893

; <label>:41                                      ; preds = %36
  %42 = load i32* %j, align 4, !llfi_index !1894
  %43 = load i32* %j, align 4, !llfi_index !1894
  %44 = sext i32 %42 to i64, !llfi_index !1895
  %45 = sext i32 %43 to i64, !llfi_index !1895
  %46 = getelementptr inbounds [12 x double]* %dist, i32 0, i64 %44, !llfi_index !1896
  %47 = getelementptr inbounds [12 x double]* %dist, i32 0, i64 %45, !llfi_index !1896
  %48 = load double* %46, align 8, !llfi_index !1897
  %49 = load double* %47, align 8, !llfi_index !1897
  %50 = load double* %running, align 8, !llfi_index !1898
  %51 = load double* %running, align 8, !llfi_index !1898
  %52 = fadd double %50, %48, !llfi_index !1899
  %53 = fadd double %51, %49, !llfi_index !1899
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %52, double %53)
  store double %52, double* %running, align 8, !llfi_index !1900
  br label %54, !llfi_index !1901

; <label>:54                                      ; preds = %41
  %55 = load i32* %j, align 4, !llfi_index !1902
  %56 = load i32* %j, align 4, !llfi_index !1902
  %57 = add nsw i32 %55, -1, !llfi_index !1903
  %58 = add nsw i32 %56, -1, !llfi_index !1903
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %57, i32 %58)
  store i32 %57, i32* %j, align 4, !llfi_index !1904
  br label %36, !llfi_index !1905

; <label>:59                                      ; preds = %36
  %60 = load double* %roll, align 8, !llfi_index !1906
  %61 = load double* %roll, align 8, !llfi_index !1906
  %62 = load double* %running, align 8, !llfi_index !1907
  %63 = load double* %running, align 8, !llfi_index !1907
  %64 = fcmp olt double %60, %62, !llfi_index !1908
  %65 = fcmp olt double %61, %63, !llfi_index !1908
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %64, i1 %65)
  br i1 %64, label %66, label %69, !llfi_index !1909

; <label>:66                                      ; preds = %59
  %67 = load i32* %i, align 4, !llfi_index !1910
  %68 = load i32* %i, align 4, !llfi_index !1910
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %67, i32 %68)
  store i32 %67, i32* %1, !llfi_index !1911
  br label %76, !llfi_index !1912

; <label>:69                                      ; preds = %59
  br label %70, !llfi_index !1913

; <label>:70                                      ; preds = %69
  %71 = load i32* %i, align 4, !llfi_index !1914
  %72 = load i32* %i, align 4, !llfi_index !1914
  %73 = add nsw i32 %71, 1, !llfi_index !1915
  %74 = add nsw i32 %72, 1, !llfi_index !1915
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %73, i32 %74)
  store i32 %73, i32* %i, align 4, !llfi_index !1916
  br label %28, !llfi_index !1917

; <label>:75                                      ; preds = %28
  store i32 0, i32* %1, !llfi_index !1918
  br label %76, !llfi_index !1919

; <label>:76                                      ; preds = %75, %66
  %77 = load i32* %1, !llfi_index !1920
  %78 = load i32* %1, !llfi_index !1920
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %77, i32 %78)
  ret i32 %77, !llfi_index !1921
}

; Function Attrs: nounwind uwtable
define %struct.NuclideGridPoint** @gpmatrix(i64 %m, i64 %n) #0 {
  %1 = alloca i64, align 8, !llfi_index !1922
  %2 = alloca i64, align 8, !llfi_index !1923
  %i = alloca i32, align 4, !llfi_index !1924
  %j = alloca i32, align 4, !llfi_index !1925
  %full = alloca %struct.NuclideGridPoint*, align 8, !llfi_index !1926
  %M = alloca %struct.NuclideGridPoint**, align 8, !llfi_index !1927
  store i64 %m, i64* %1, align 8, !llfi_index !1928
  store i64 %n, i64* %2, align 8, !llfi_index !1929
  %3 = load i64* %1, align 8, !llfi_index !1930
  %4 = load i64* %1, align 8, !llfi_index !1930
  %5 = load i64* %2, align 8, !llfi_index !1931
  %6 = load i64* %2, align 8, !llfi_index !1931
  %7 = mul i64 %3, %5, !llfi_index !1932
  %8 = mul i64 %4, %6, !llfi_index !1932
  %9 = mul i64 %7, 48, !llfi_index !1933
  %10 = mul i64 %8, 48, !llfi_index !1933
  call void @global_add(i64 %9, i64 %10)
  %11 = call noalias i8* @malloc(i64 %9) #3, !llfi_index !1934
  %12 = bitcast i8* %11 to %struct.NuclideGridPoint*, !llfi_index !1935
  %13 = bitcast i8* %11 to %struct.NuclideGridPoint*, !llfi_index !1935
  call void bitcast (void (i64, i64)* @global_add to void (%struct.NuclideGridPoint*, %struct.NuclideGridPoint*)*)(%struct.NuclideGridPoint* %12, %struct.NuclideGridPoint* %13)
  store %struct.NuclideGridPoint* %12, %struct.NuclideGridPoint** %full, align 8, !llfi_index !1936
  %14 = load i64* %1, align 8, !llfi_index !1937
  %15 = load i64* %1, align 8, !llfi_index !1937
  %16 = mul i64 %14, 8, !llfi_index !1938
  %17 = mul i64 %15, 8, !llfi_index !1938
  call void @global_add(i64 %16, i64 %17)
  %18 = call noalias i8* @malloc(i64 %16) #3, !llfi_index !1939
  %19 = bitcast i8* %18 to %struct.NuclideGridPoint**, !llfi_index !1940
  %20 = bitcast i8* %18 to %struct.NuclideGridPoint**, !llfi_index !1940
  call void bitcast (void (i64, i64)* @global_add to void (%struct.NuclideGridPoint**, %struct.NuclideGridPoint**)*)(%struct.NuclideGridPoint** %19, %struct.NuclideGridPoint** %20)
  store %struct.NuclideGridPoint** %19, %struct.NuclideGridPoint*** %M, align 8, !llfi_index !1941
  store i32 0, i32* %i, align 4, !llfi_index !1942
  store i32 0, i32* %j, align 4, !llfi_index !1943
  br label %21, !llfi_index !1944

; <label>:21                                      ; preds = %65, %0
  %22 = load i32* %i, align 4, !llfi_index !1945
  %23 = load i32* %i, align 4, !llfi_index !1945
  %24 = sext i32 %22 to i64, !llfi_index !1946
  %25 = sext i32 %23 to i64, !llfi_index !1946
  %26 = load i64* %1, align 8, !llfi_index !1947
  %27 = load i64* %1, align 8, !llfi_index !1947
  %28 = load i64* %2, align 8, !llfi_index !1948
  %29 = load i64* %2, align 8, !llfi_index !1948
  %30 = mul i64 %26, %28, !llfi_index !1949
  %31 = mul i64 %27, %29, !llfi_index !1949
  %32 = icmp ult i64 %24, %30, !llfi_index !1950
  %33 = icmp ult i64 %25, %31, !llfi_index !1950
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %32, i1 %33)
  br i1 %32, label %34, label %70, !llfi_index !1951

; <label>:34                                      ; preds = %21
  %35 = load i32* %i, align 4, !llfi_index !1952
  %36 = load i32* %i, align 4, !llfi_index !1952
  %37 = sext i32 %35 to i64, !llfi_index !1953
  %38 = sext i32 %36 to i64, !llfi_index !1953
  %39 = load i64* %2, align 8, !llfi_index !1954
  %40 = load i64* %2, align 8, !llfi_index !1954
  %41 = urem i64 %37, %39, !llfi_index !1955
  %42 = urem i64 %38, %40, !llfi_index !1955
  %43 = icmp eq i64 %41, 0, !llfi_index !1956
  %44 = icmp eq i64 %42, 0, !llfi_index !1956
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %43, i1 %44)
  br i1 %43, label %45, label %64, !llfi_index !1957

; <label>:45                                      ; preds = %34
  %46 = load i32* %i, align 4, !llfi_index !1958
  %47 = load i32* %i, align 4, !llfi_index !1958
  %48 = sext i32 %46 to i64, !llfi_index !1959
  %49 = sext i32 %47 to i64, !llfi_index !1959
  %50 = load %struct.NuclideGridPoint** %full, align 8, !llfi_index !1960
  %51 = load %struct.NuclideGridPoint** %full, align 8, !llfi_index !1960
  %52 = getelementptr inbounds %struct.NuclideGridPoint* %50, i64 %48, !llfi_index !1961
  %53 = getelementptr inbounds %struct.NuclideGridPoint* %51, i64 %49, !llfi_index !1961
  call void bitcast (void (i64, i64)* @global_add to void (%struct.NuclideGridPoint*, %struct.NuclideGridPoint*)*)(%struct.NuclideGridPoint* %52, %struct.NuclideGridPoint* %53)
  %54 = load i32* %j, align 4, !llfi_index !1962
  %55 = load i32* %j, align 4, !llfi_index !1962
  %56 = add nsw i32 %54, 1, !llfi_index !1963
  %57 = add nsw i32 %55, 1, !llfi_index !1963
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %56, i32 %57)
  store i32 %56, i32* %j, align 4, !llfi_index !1964
  %58 = sext i32 %54 to i64, !llfi_index !1965
  %59 = sext i32 %55 to i64, !llfi_index !1965
  %60 = load %struct.NuclideGridPoint*** %M, align 8, !llfi_index !1966
  %61 = load %struct.NuclideGridPoint*** %M, align 8, !llfi_index !1966
  %62 = getelementptr inbounds %struct.NuclideGridPoint** %60, i64 %58, !llfi_index !1967
  %63 = getelementptr inbounds %struct.NuclideGridPoint** %61, i64 %59, !llfi_index !1967
  call void bitcast (void (i64, i64)* @global_add to void (%struct.NuclideGridPoint**, %struct.NuclideGridPoint**)*)(%struct.NuclideGridPoint** %62, %struct.NuclideGridPoint** %63)
  store %struct.NuclideGridPoint* %52, %struct.NuclideGridPoint** %62, align 8, !llfi_index !1968
  br label %64, !llfi_index !1969

; <label>:64                                      ; preds = %45, %34
  br label %65, !llfi_index !1970

; <label>:65                                      ; preds = %64
  %66 = load i32* %i, align 4, !llfi_index !1971
  %67 = load i32* %i, align 4, !llfi_index !1971
  %68 = add nsw i32 %66, 1, !llfi_index !1972
  %69 = add nsw i32 %67, 1, !llfi_index !1972
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %68, i32 %69)
  store i32 %68, i32* %i, align 4, !llfi_index !1973
  br label %21, !llfi_index !1974

; <label>:70                                      ; preds = %21
  %71 = load %struct.NuclideGridPoint*** %M, align 8, !llfi_index !1975
  %72 = load %struct.NuclideGridPoint*** %M, align 8, !llfi_index !1975
  call void bitcast (void (i64, i64)* @global_add to void (%struct.NuclideGridPoint**, %struct.NuclideGridPoint**)*)(%struct.NuclideGridPoint** %71, %struct.NuclideGridPoint** %72)
  ret %struct.NuclideGridPoint** %71, !llfi_index !1976
}

; Function Attrs: nounwind uwtable
define void @gpmatrix_free(%struct.NuclideGridPoint** %M) #0 {
  %1 = alloca %struct.NuclideGridPoint**, align 8, !llfi_index !1977
  store %struct.NuclideGridPoint** %M, %struct.NuclideGridPoint*** %1, align 8, !llfi_index !1978
  %2 = load %struct.NuclideGridPoint*** %1, align 8, !llfi_index !1979
  %3 = load %struct.NuclideGridPoint*** %1, align 8, !llfi_index !1979
  %4 = load %struct.NuclideGridPoint** %2, align 8, !llfi_index !1980
  %5 = load %struct.NuclideGridPoint** %3, align 8, !llfi_index !1980
  %6 = bitcast %struct.NuclideGridPoint* %4 to i8*, !llfi_index !1981
  %7 = bitcast %struct.NuclideGridPoint* %5 to i8*, !llfi_index !1981
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %6, i8* %7)
  call void @free(i8* %6) #3, !llfi_index !1982
  %8 = load %struct.NuclideGridPoint*** %1, align 8, !llfi_index !1983
  %9 = load %struct.NuclideGridPoint*** %1, align 8, !llfi_index !1983
  %10 = bitcast %struct.NuclideGridPoint** %8 to i8*, !llfi_index !1984
  %11 = bitcast %struct.NuclideGridPoint** %9 to i8*, !llfi_index !1984
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %10, i8* %11)
  call void @free(i8* %10) #3, !llfi_index !1985
  ret void, !llfi_index !1986
}

; Function Attrs: nounwind
declare void @free(i8*) #2

; Function Attrs: nounwind uwtable
define i32 @NGP_compare(i8* %a, i8* %b) #0 {
  %1 = alloca i32, align 4, !llfi_index !1987
  %2 = alloca i8*, align 8, !llfi_index !1988
  %3 = alloca i8*, align 8, !llfi_index !1989
  %i = alloca %struct.NuclideGridPoint*, align 8, !llfi_index !1990
  %j = alloca %struct.NuclideGridPoint*, align 8, !llfi_index !1991
  store i8* %a, i8** %2, align 8, !llfi_index !1992
  store i8* %b, i8** %3, align 8, !llfi_index !1993
  %4 = load i8** %2, align 8, !llfi_index !1994
  %5 = load i8** %2, align 8, !llfi_index !1994
  %6 = bitcast i8* %4 to %struct.NuclideGridPoint*, !llfi_index !1995
  %7 = bitcast i8* %5 to %struct.NuclideGridPoint*, !llfi_index !1995
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (%struct.NuclideGridPoint*, %struct.NuclideGridPoint*)*)(%struct.NuclideGridPoint* %6, %struct.NuclideGridPoint* %7)
  store %struct.NuclideGridPoint* %6, %struct.NuclideGridPoint** %i, align 8, !llfi_index !1996
  %8 = load i8** %3, align 8, !llfi_index !1997
  %9 = load i8** %3, align 8, !llfi_index !1997
  %10 = bitcast i8* %8 to %struct.NuclideGridPoint*, !llfi_index !1998
  %11 = bitcast i8* %9 to %struct.NuclideGridPoint*, !llfi_index !1998
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (%struct.NuclideGridPoint*, %struct.NuclideGridPoint*)*)(%struct.NuclideGridPoint* %10, %struct.NuclideGridPoint* %11)
  store %struct.NuclideGridPoint* %10, %struct.NuclideGridPoint** %j, align 8, !llfi_index !1999
  %12 = load %struct.NuclideGridPoint** %i, align 8, !llfi_index !2000
  %13 = load %struct.NuclideGridPoint** %i, align 8, !llfi_index !2000
  %14 = getelementptr inbounds %struct.NuclideGridPoint* %12, i32 0, i32 0, !llfi_index !2001
  %15 = getelementptr inbounds %struct.NuclideGridPoint* %13, i32 0, i32 0, !llfi_index !2001
  %16 = load double* %14, align 8, !llfi_index !2002
  %17 = load double* %15, align 8, !llfi_index !2002
  %18 = load %struct.NuclideGridPoint** %j, align 8, !llfi_index !2003
  %19 = load %struct.NuclideGridPoint** %j, align 8, !llfi_index !2003
  %20 = getelementptr inbounds %struct.NuclideGridPoint* %18, i32 0, i32 0, !llfi_index !2004
  %21 = getelementptr inbounds %struct.NuclideGridPoint* %19, i32 0, i32 0, !llfi_index !2004
  %22 = load double* %20, align 8, !llfi_index !2005
  %23 = load double* %21, align 8, !llfi_index !2005
  %24 = fcmp ogt double %16, %22, !llfi_index !2006
  %25 = fcmp ogt double %17, %23, !llfi_index !2006
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %24, i1 %25)
  br i1 %24, label %26, label %27, !llfi_index !2007

; <label>:26                                      ; preds = %0
  store i32 1, i32* %1, !llfi_index !2008
  br label %44, !llfi_index !2009

; <label>:27                                      ; preds = %0
  %28 = load %struct.NuclideGridPoint** %i, align 8, !llfi_index !2010
  %29 = load %struct.NuclideGridPoint** %i, align 8, !llfi_index !2010
  %30 = getelementptr inbounds %struct.NuclideGridPoint* %28, i32 0, i32 0, !llfi_index !2011
  %31 = getelementptr inbounds %struct.NuclideGridPoint* %29, i32 0, i32 0, !llfi_index !2011
  %32 = load double* %30, align 8, !llfi_index !2012
  %33 = load double* %31, align 8, !llfi_index !2012
  %34 = load %struct.NuclideGridPoint** %j, align 8, !llfi_index !2013
  %35 = load %struct.NuclideGridPoint** %j, align 8, !llfi_index !2013
  %36 = getelementptr inbounds %struct.NuclideGridPoint* %34, i32 0, i32 0, !llfi_index !2014
  %37 = getelementptr inbounds %struct.NuclideGridPoint* %35, i32 0, i32 0, !llfi_index !2014
  %38 = load double* %36, align 8, !llfi_index !2015
  %39 = load double* %37, align 8, !llfi_index !2015
  %40 = fcmp olt double %32, %38, !llfi_index !2016
  %41 = fcmp olt double %33, %39, !llfi_index !2016
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %40, i1 %41)
  br i1 %40, label %42, label %43, !llfi_index !2017

; <label>:42                                      ; preds = %27
  store i32 -1, i32* %1, !llfi_index !2018
  br label %44, !llfi_index !2019

; <label>:43                                      ; preds = %27
  store i32 0, i32* %1, !llfi_index !2020
  br label %44, !llfi_index !2021

; <label>:44                                      ; preds = %43, %42, %26
  %45 = load i32* %1, !llfi_index !2022
  %46 = load i32* %1, !llfi_index !2022
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %45, i32 %46)
  ret i32 %45, !llfi_index !2023
}

; Function Attrs: nounwind uwtable
define i32 @binary_search(%struct.NuclideGridPoint* %A, double %quarry, i32 %n) #0 {
  %1 = alloca i32, align 4, !llfi_index !2024
  %2 = alloca %struct.NuclideGridPoint*, align 8, !llfi_index !2025
  %3 = alloca double, align 8, !llfi_index !2026
  %4 = alloca i32, align 4, !llfi_index !2027
  %min = alloca i32, align 4, !llfi_index !2028
  %max = alloca i32, align 4, !llfi_index !2029
  %mid = alloca i32, align 4, !llfi_index !2030
  store %struct.NuclideGridPoint* %A, %struct.NuclideGridPoint** %2, align 8, !llfi_index !2031
  store double %quarry, double* %3, align 8, !llfi_index !2032
  store i32 %n, i32* %4, align 4, !llfi_index !2033
  store i32 0, i32* %min, align 4, !llfi_index !2034
  %5 = load i32* %4, align 4, !llfi_index !2035
  %6 = load i32* %4, align 4, !llfi_index !2035
  %7 = sub nsw i32 %5, 1, !llfi_index !2036
  %8 = sub nsw i32 %6, 1, !llfi_index !2036
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %7, i32 %8)
  store i32 %7, i32* %max, align 4, !llfi_index !2037
  %9 = load %struct.NuclideGridPoint** %2, align 8, !llfi_index !2038
  %10 = load %struct.NuclideGridPoint** %2, align 8, !llfi_index !2038
  %11 = getelementptr inbounds %struct.NuclideGridPoint* %9, i64 0, !llfi_index !2039
  %12 = getelementptr inbounds %struct.NuclideGridPoint* %10, i64 0, !llfi_index !2039
  %13 = getelementptr inbounds %struct.NuclideGridPoint* %11, i32 0, i32 0, !llfi_index !2040
  %14 = getelementptr inbounds %struct.NuclideGridPoint* %12, i32 0, i32 0, !llfi_index !2040
  %15 = load double* %13, align 8, !llfi_index !2041
  %16 = load double* %14, align 8, !llfi_index !2041
  %17 = load double* %3, align 8, !llfi_index !2042
  %18 = load double* %3, align 8, !llfi_index !2042
  %19 = fcmp ogt double %15, %17, !llfi_index !2043
  %20 = fcmp ogt double %16, %18, !llfi_index !2043
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %19, i1 %20)
  br i1 %19, label %21, label %22, !llfi_index !2044

; <label>:21                                      ; preds = %0
  store i32 0, i32* %1, !llfi_index !2045
  br label %126, !llfi_index !2046

; <label>:22                                      ; preds = %0
  %23 = load i32* %4, align 4, !llfi_index !2047
  %24 = load i32* %4, align 4, !llfi_index !2047
  %25 = sub nsw i32 %23, 1, !llfi_index !2048
  %26 = sub nsw i32 %24, 1, !llfi_index !2048
  %27 = sext i32 %25 to i64, !llfi_index !2049
  %28 = sext i32 %26 to i64, !llfi_index !2049
  %29 = load %struct.NuclideGridPoint** %2, align 8, !llfi_index !2050
  %30 = load %struct.NuclideGridPoint** %2, align 8, !llfi_index !2050
  %31 = getelementptr inbounds %struct.NuclideGridPoint* %29, i64 %27, !llfi_index !2051
  %32 = getelementptr inbounds %struct.NuclideGridPoint* %30, i64 %28, !llfi_index !2051
  %33 = getelementptr inbounds %struct.NuclideGridPoint* %31, i32 0, i32 0, !llfi_index !2052
  %34 = getelementptr inbounds %struct.NuclideGridPoint* %32, i32 0, i32 0, !llfi_index !2052
  %35 = load double* %33, align 8, !llfi_index !2053
  %36 = load double* %34, align 8, !llfi_index !2053
  %37 = load double* %3, align 8, !llfi_index !2054
  %38 = load double* %3, align 8, !llfi_index !2054
  %39 = fcmp olt double %35, %37, !llfi_index !2055
  %40 = fcmp olt double %36, %38, !llfi_index !2055
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %39, i1 %40)
  br i1 %39, label %41, label %46, !llfi_index !2056

; <label>:41                                      ; preds = %22
  %42 = load i32* %4, align 4, !llfi_index !2057
  %43 = load i32* %4, align 4, !llfi_index !2057
  %44 = sub nsw i32 %42, 2, !llfi_index !2058
  %45 = sub nsw i32 %43, 2, !llfi_index !2058
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %44, i32 %45)
  store i32 %44, i32* %1, !llfi_index !2059
  br label %126, !llfi_index !2060

; <label>:46                                      ; preds = %22
  br label %47, !llfi_index !2061

; <label>:47                                      ; preds = %46
  br label %48, !llfi_index !2062

; <label>:48                                      ; preds = %122, %47
  %49 = load i32* %max, align 4, !llfi_index !2063
  %50 = load i32* %max, align 4, !llfi_index !2063
  %51 = load i32* %min, align 4, !llfi_index !2064
  %52 = load i32* %min, align 4, !llfi_index !2064
  %53 = icmp sge i32 %49, %51, !llfi_index !2065
  %54 = icmp sge i32 %50, %52, !llfi_index !2065
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %53, i1 %54)
  br i1 %53, label %55, label %123, !llfi_index !2066

; <label>:55                                      ; preds = %48
  %56 = load i32* %min, align 4, !llfi_index !2067
  %57 = load i32* %min, align 4, !llfi_index !2067
  %58 = sitofp i32 %56 to double, !llfi_index !2068
  %59 = sitofp i32 %57 to double, !llfi_index !2068
  %60 = load i32* %max, align 4, !llfi_index !2069
  %61 = load i32* %max, align 4, !llfi_index !2069
  %62 = load i32* %min, align 4, !llfi_index !2070
  %63 = load i32* %min, align 4, !llfi_index !2070
  %64 = sub nsw i32 %60, %62, !llfi_index !2071
  %65 = sub nsw i32 %61, %63, !llfi_index !2071
  %66 = sitofp i32 %64 to double, !llfi_index !2072
  %67 = sitofp i32 %65 to double, !llfi_index !2072
  %68 = fdiv double %66, 2.000000e+00, !llfi_index !2073
  %69 = fdiv double %67, 2.000000e+00, !llfi_index !2073
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %68, double %69)
  %70 = call double @floor(double %68) #9, !llfi_index !2074
  %71 = fadd double %58, %70, !llfi_index !2075
  %72 = fadd double %59, %70, !llfi_index !2075
  %73 = fptosi double %71 to i32, !llfi_index !2076
  %74 = fptosi double %72 to i32, !llfi_index !2076
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %73, i32 %74)
  store i32 %73, i32* %mid, align 4, !llfi_index !2077
  %75 = load i32* %mid, align 4, !llfi_index !2078
  %76 = load i32* %mid, align 4, !llfi_index !2078
  %77 = sext i32 %75 to i64, !llfi_index !2079
  %78 = sext i32 %76 to i64, !llfi_index !2079
  %79 = load %struct.NuclideGridPoint** %2, align 8, !llfi_index !2080
  %80 = load %struct.NuclideGridPoint** %2, align 8, !llfi_index !2080
  %81 = getelementptr inbounds %struct.NuclideGridPoint* %79, i64 %77, !llfi_index !2081
  %82 = getelementptr inbounds %struct.NuclideGridPoint* %80, i64 %78, !llfi_index !2081
  %83 = getelementptr inbounds %struct.NuclideGridPoint* %81, i32 0, i32 0, !llfi_index !2082
  %84 = getelementptr inbounds %struct.NuclideGridPoint* %82, i32 0, i32 0, !llfi_index !2082
  %85 = load double* %83, align 8, !llfi_index !2083
  %86 = load double* %84, align 8, !llfi_index !2083
  %87 = load double* %3, align 8, !llfi_index !2084
  %88 = load double* %3, align 8, !llfi_index !2084
  %89 = fcmp olt double %85, %87, !llfi_index !2085
  %90 = fcmp olt double %86, %88, !llfi_index !2085
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %89, i1 %90)
  br i1 %89, label %91, label %96, !llfi_index !2086

; <label>:91                                      ; preds = %55
  %92 = load i32* %mid, align 4, !llfi_index !2087
  %93 = load i32* %mid, align 4, !llfi_index !2087
  %94 = add nsw i32 %92, 1, !llfi_index !2088
  %95 = add nsw i32 %93, 1, !llfi_index !2088
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %94, i32 %95)
  store i32 %94, i32* %min, align 4, !llfi_index !2089
  br label %122, !llfi_index !2090

; <label>:96                                      ; preds = %55
  %97 = load i32* %mid, align 4, !llfi_index !2091
  %98 = load i32* %mid, align 4, !llfi_index !2091
  %99 = sext i32 %97 to i64, !llfi_index !2092
  %100 = sext i32 %98 to i64, !llfi_index !2092
  %101 = load %struct.NuclideGridPoint** %2, align 8, !llfi_index !2093
  %102 = load %struct.NuclideGridPoint** %2, align 8, !llfi_index !2093
  %103 = getelementptr inbounds %struct.NuclideGridPoint* %101, i64 %99, !llfi_index !2094
  %104 = getelementptr inbounds %struct.NuclideGridPoint* %102, i64 %100, !llfi_index !2094
  %105 = getelementptr inbounds %struct.NuclideGridPoint* %103, i32 0, i32 0, !llfi_index !2095
  %106 = getelementptr inbounds %struct.NuclideGridPoint* %104, i32 0, i32 0, !llfi_index !2095
  %107 = load double* %105, align 8, !llfi_index !2096
  %108 = load double* %106, align 8, !llfi_index !2096
  %109 = load double* %3, align 8, !llfi_index !2097
  %110 = load double* %3, align 8, !llfi_index !2097
  %111 = fcmp ogt double %107, %109, !llfi_index !2098
  %112 = fcmp ogt double %108, %110, !llfi_index !2098
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %111, i1 %112)
  br i1 %111, label %113, label %118, !llfi_index !2099

; <label>:113                                     ; preds = %96
  %114 = load i32* %mid, align 4, !llfi_index !2100
  %115 = load i32* %mid, align 4, !llfi_index !2100
  %116 = sub nsw i32 %114, 1, !llfi_index !2101
  %117 = sub nsw i32 %115, 1, !llfi_index !2101
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %116, i32 %117)
  store i32 %116, i32* %max, align 4, !llfi_index !2102
  br label %121, !llfi_index !2103

; <label>:118                                     ; preds = %96
  %119 = load i32* %mid, align 4, !llfi_index !2104
  %120 = load i32* %mid, align 4, !llfi_index !2104
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %119, i32 %120)
  store i32 %119, i32* %1, !llfi_index !2105
  br label %126, !llfi_index !2106

; <label>:121                                     ; preds = %113
  br label %122, !llfi_index !2107

; <label>:122                                     ; preds = %121, %91
  br label %48, !llfi_index !2108

; <label>:123                                     ; preds = %48
  %124 = load i32* %max, align 4, !llfi_index !2109
  %125 = load i32* %max, align 4, !llfi_index !2109
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %124, i32 %125)
  store i32 %124, i32* %1, !llfi_index !2110
  br label %126, !llfi_index !2111

; <label>:126                                     ; preds = %123, %118, %41, %21
  %127 = load i32* %1, !llfi_index !2112
  %128 = load i32* %1, !llfi_index !2112
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %127, i32 %128)
  ret i32 %127, !llfi_index !2113
}

; Function Attrs: nounwind readnone
declare double @floor(double) #6

; Function Attrs: nounwind uwtable
define double @rn(i64* %seed) #0 {
  %1 = alloca i64*, align 8, !llfi_index !2114
  %ret = alloca double, align 8, !llfi_index !2115
  %n1 = alloca i64, align 8, !llfi_index !2116
  %a = alloca i64, align 8, !llfi_index !2117
  %m = alloca i64, align 8, !llfi_index !2118
  store i64* %seed, i64** %1, align 8, !llfi_index !2119
  store i64 16807, i64* %a, align 8, !llfi_index !2120
  store i64 2147483647, i64* %m, align 8, !llfi_index !2121
  %2 = load i64* %a, align 8, !llfi_index !2122
  %3 = load i64* %a, align 8, !llfi_index !2122
  %4 = load i64** %1, align 8, !llfi_index !2123
  %5 = load i64** %1, align 8, !llfi_index !2123
  %6 = load i64* %4, align 8, !llfi_index !2124
  %7 = load i64* %5, align 8, !llfi_index !2124
  %8 = mul i64 %2, %6, !llfi_index !2125
  %9 = mul i64 %3, %7, !llfi_index !2125
  %10 = load i64* %m, align 8, !llfi_index !2126
  %11 = load i64* %m, align 8, !llfi_index !2126
  %12 = urem i64 %8, %10, !llfi_index !2127
  %13 = urem i64 %9, %11, !llfi_index !2127
  call void @global_add(i64 %12, i64 %13)
  store i64 %12, i64* %n1, align 8, !llfi_index !2128
  %14 = load i64* %n1, align 8, !llfi_index !2129
  %15 = load i64* %n1, align 8, !llfi_index !2129
  call void @global_add(i64 %14, i64 %15)
  %16 = load i64** %1, align 8, !llfi_index !2130
  %17 = load i64** %1, align 8, !llfi_index !2130
  call void bitcast (void (i64, i64)* @global_add to void (i64*, i64*)*)(i64* %16, i64* %17)
  store i64 %14, i64* %16, align 8, !llfi_index !2131
  %18 = load i64* %n1, align 8, !llfi_index !2132
  %19 = load i64* %n1, align 8, !llfi_index !2132
  %20 = uitofp i64 %18 to double, !llfi_index !2133
  %21 = uitofp i64 %19 to double, !llfi_index !2133
  %22 = load i64* %m, align 8, !llfi_index !2134
  %23 = load i64* %m, align 8, !llfi_index !2134
  %24 = uitofp i64 %22 to double, !llfi_index !2135
  %25 = uitofp i64 %23 to double, !llfi_index !2135
  %26 = fdiv double %20, %24, !llfi_index !2136
  %27 = fdiv double %21, %25, !llfi_index !2136
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %26, double %27)
  store double %26, double* %ret, align 8, !llfi_index !2137
  %28 = load double* %ret, align 8, !llfi_index !2138
  %29 = load double* %ret, align 8, !llfi_index !2138
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %28, double %29)
  ret double %28, !llfi_index !2139
}

; Function Attrs: nounwind uwtable
define double @rn_v() #0 {
  %ret = alloca double, align 8, !llfi_index !2140
  %n1 = alloca i64, align 8, !llfi_index !2141
  %a = alloca i64, align 8, !llfi_index !2142
  %m = alloca i64, align 8, !llfi_index !2143
  store i64 16807, i64* %a, align 8, !llfi_index !2144
  store i64 2147483647, i64* %m, align 8, !llfi_index !2145
  %1 = load i64* %a, align 8, !llfi_index !2146
  %2 = load i64* %a, align 8, !llfi_index !2146
  %3 = load i64* @rn_v.seed, align 8, !llfi_index !2147
  %4 = load i64* @rn_v.seed, align 8, !llfi_index !2147
  %5 = mul i64 %1, %3, !llfi_index !2148
  %6 = mul i64 %2, %4, !llfi_index !2148
  %7 = load i64* %m, align 8, !llfi_index !2149
  %8 = load i64* %m, align 8, !llfi_index !2149
  %9 = urem i64 %5, %7, !llfi_index !2150
  %10 = urem i64 %6, %8, !llfi_index !2150
  call void @global_check()
  call void @global_add(i64 %9, i64 %10)
  store i64 %9, i64* %n1, align 8, !llfi_index !2151
  %11 = load i64* %n1, align 8, !llfi_index !2152
  %12 = load i64* %n1, align 8, !llfi_index !2152
  call void @global_add(i64 %11, i64 %12)
  store i64 %11, i64* @rn_v.seed, align 8, !llfi_index !2153
  %13 = load i64* %n1, align 8, !llfi_index !2154
  %14 = load i64* %n1, align 8, !llfi_index !2154
  %15 = uitofp i64 %13 to double, !llfi_index !2155
  %16 = uitofp i64 %14 to double, !llfi_index !2155
  %17 = load i64* %m, align 8, !llfi_index !2156
  %18 = load i64* %m, align 8, !llfi_index !2156
  %19 = uitofp i64 %17 to double, !llfi_index !2157
  %20 = uitofp i64 %18 to double, !llfi_index !2157
  %21 = fdiv double %15, %19, !llfi_index !2158
  %22 = fdiv double %16, %20, !llfi_index !2158
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %21, double %22)
  store double %21, double* %ret, align 8, !llfi_index !2159
  %23 = load double* %ret, align 8, !llfi_index !2160
  %24 = load double* %ret, align 8, !llfi_index !2160
  call void bitcast (void (i64, i64)* @global_add to void (double, double)*)(double %23, double %24)
  ret double %23, !llfi_index !2161
}

; Function Attrs: nounwind uwtable
define i32 @hash(i8* %str, i32 %nbins) #0 {
  %1 = alloca i8*, align 8, !llfi_index !2162
  %2 = alloca i32, align 4, !llfi_index !2163
  %hash = alloca i32, align 4, !llfi_index !2164
  %c = alloca i32, align 4, !llfi_index !2165
  store i8* %str, i8** %1, align 8, !llfi_index !2166
  store i32 %nbins, i32* %2, align 4, !llfi_index !2167
  store i32 5381, i32* %hash, align 4, !llfi_index !2168
  br label %3, !llfi_index !2169

; <label>:3                                       ; preds = %14, %0
  %4 = load i8** %1, align 8, !llfi_index !2170
  %5 = load i8** %1, align 8, !llfi_index !2170
  %6 = getelementptr inbounds i8* %4, i32 1, !llfi_index !2171
  %7 = getelementptr inbounds i8* %5, i32 1, !llfi_index !2171
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %6, i8* %7)
  store i8* %6, i8** %1, align 8, !llfi_index !2172
  %8 = load i8* %4, align 1, !llfi_index !2173
  %9 = load i8* %5, align 1, !llfi_index !2173
  %10 = zext i8 %8 to i32, !llfi_index !2174
  %11 = zext i8 %9 to i32, !llfi_index !2174
  store i32 %10, i32* %c, align 4, !llfi_index !2175
  %12 = icmp ne i32 %10, 0, !llfi_index !2176
  %13 = icmp ne i32 %11, 0, !llfi_index !2176
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %12, i1 %13)
  br i1 %12, label %14, label %27, !llfi_index !2177

; <label>:14                                      ; preds = %3
  %15 = load i32* %hash, align 4, !llfi_index !2178
  %16 = load i32* %hash, align 4, !llfi_index !2178
  %17 = shl i32 %15, 5, !llfi_index !2179
  %18 = shl i32 %16, 5, !llfi_index !2179
  %19 = load i32* %hash, align 4, !llfi_index !2180
  %20 = load i32* %hash, align 4, !llfi_index !2180
  %21 = add i32 %17, %19, !llfi_index !2181
  %22 = add i32 %18, %20, !llfi_index !2181
  %23 = load i32* %c, align 4, !llfi_index !2182
  %24 = load i32* %c, align 4, !llfi_index !2182
  %25 = add i32 %21, %23, !llfi_index !2183
  %26 = add i32 %22, %24, !llfi_index !2183
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %25, i32 %26)
  store i32 %25, i32* %hash, align 4, !llfi_index !2184
  br label %3, !llfi_index !2185

; <label>:27                                      ; preds = %3
  %28 = load i32* %hash, align 4, !llfi_index !2186
  %29 = load i32* %hash, align 4, !llfi_index !2186
  %30 = load i32* %2, align 4, !llfi_index !2187
  %31 = load i32* %2, align 4, !llfi_index !2187
  %32 = urem i32 %28, %30, !llfi_index !2188
  %33 = urem i32 %29, %31, !llfi_index !2188
  call void @global_check()
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %32, i32 %33)
  ret i32 %32, !llfi_index !2189
}

; Function Attrs: nounwind uwtable
define i64 @estimate_mem_usage(%struct.Inputs* byval align 8 %in) #0 {
  %single_nuclide_grid = alloca i64, align 8, !llfi_index !2190
  %all_nuclide_grids = alloca i64, align 8, !llfi_index !2191
  %size_GridPoint = alloca i64, align 8, !llfi_index !2192
  %size_UEG = alloca i64, align 8, !llfi_index !2193
  %memtotal = alloca i64, align 8, !llfi_index !2194
  %1 = getelementptr inbounds %struct.Inputs* %in, i32 0, i32 2, !llfi_index !2195
  %2 = getelementptr inbounds %struct.Inputs* %in, i32 0, i32 2, !llfi_index !2195
  %3 = load i64* %1, align 8, !llfi_index !2196
  %4 = load i64* %2, align 8, !llfi_index !2196
  %5 = mul i64 %3, 48, !llfi_index !2197
  %6 = mul i64 %4, 48, !llfi_index !2197
  call void @global_add(i64 %5, i64 %6)
  store i64 %5, i64* %single_nuclide_grid, align 8, !llfi_index !2198
  %7 = getelementptr inbounds %struct.Inputs* %in, i32 0, i32 1, !llfi_index !2199
  %8 = getelementptr inbounds %struct.Inputs* %in, i32 0, i32 1, !llfi_index !2199
  %9 = load i64* %7, align 8, !llfi_index !2200
  %10 = load i64* %8, align 8, !llfi_index !2200
  %11 = load i64* %single_nuclide_grid, align 8, !llfi_index !2201
  %12 = load i64* %single_nuclide_grid, align 8, !llfi_index !2201
  %13 = mul i64 %9, %11, !llfi_index !2202
  %14 = mul i64 %10, %12, !llfi_index !2202
  call void @global_add(i64 %13, i64 %14)
  store i64 %13, i64* %all_nuclide_grids, align 8, !llfi_index !2203
  %15 = getelementptr inbounds %struct.Inputs* %in, i32 0, i32 1, !llfi_index !2204
  %16 = getelementptr inbounds %struct.Inputs* %in, i32 0, i32 1, !llfi_index !2204
  %17 = load i64* %15, align 8, !llfi_index !2205
  %18 = load i64* %16, align 8, !llfi_index !2205
  %19 = mul i64 %17, 4, !llfi_index !2206
  %20 = mul i64 %18, 4, !llfi_index !2206
  %21 = add i64 16, %19, !llfi_index !2207
  %22 = add i64 16, %20, !llfi_index !2207
  call void @global_add(i64 %21, i64 %22)
  store i64 %21, i64* %size_GridPoint, align 8, !llfi_index !2208
  %23 = getelementptr inbounds %struct.Inputs* %in, i32 0, i32 1, !llfi_index !2209
  %24 = getelementptr inbounds %struct.Inputs* %in, i32 0, i32 1, !llfi_index !2209
  %25 = load i64* %23, align 8, !llfi_index !2210
  %26 = load i64* %24, align 8, !llfi_index !2210
  %27 = getelementptr inbounds %struct.Inputs* %in, i32 0, i32 2, !llfi_index !2211
  %28 = getelementptr inbounds %struct.Inputs* %in, i32 0, i32 2, !llfi_index !2211
  %29 = load i64* %27, align 8, !llfi_index !2212
  %30 = load i64* %28, align 8, !llfi_index !2212
  %31 = mul nsw i64 %25, %29, !llfi_index !2213
  %32 = mul nsw i64 %26, %30, !llfi_index !2213
  %33 = load i64* %size_GridPoint, align 8, !llfi_index !2214
  %34 = load i64* %size_GridPoint, align 8, !llfi_index !2214
  %35 = mul i64 %31, %33, !llfi_index !2215
  %36 = mul i64 %32, %34, !llfi_index !2215
  call void @global_add(i64 %35, i64 %36)
  store i64 %35, i64* %size_UEG, align 8, !llfi_index !2216
  %37 = load i64* %all_nuclide_grids, align 8, !llfi_index !2217
  %38 = load i64* %all_nuclide_grids, align 8, !llfi_index !2217
  %39 = load i64* %size_UEG, align 8, !llfi_index !2218
  %40 = load i64* %size_UEG, align 8, !llfi_index !2218
  %41 = add i64 %37, %39, !llfi_index !2219
  %42 = add i64 %38, %40, !llfi_index !2219
  call void @global_add(i64 %41, i64 %42)
  store i64 %41, i64* %memtotal, align 8, !llfi_index !2220
  %43 = load i64* %all_nuclide_grids, align 8, !llfi_index !2221
  %44 = load i64* %all_nuclide_grids, align 8, !llfi_index !2221
  %45 = udiv i64 %43, 1048576, !llfi_index !2222
  %46 = udiv i64 %44, 1048576, !llfi_index !2222
  call void @global_add(i64 %45, i64 %46)
  store i64 %45, i64* %all_nuclide_grids, align 8, !llfi_index !2223
  %47 = load i64* %size_UEG, align 8, !llfi_index !2224
  %48 = load i64* %size_UEG, align 8, !llfi_index !2224
  %49 = udiv i64 %47, 1048576, !llfi_index !2225
  %50 = udiv i64 %48, 1048576, !llfi_index !2225
  call void @global_add(i64 %49, i64 %50)
  store i64 %49, i64* %size_UEG, align 8, !llfi_index !2226
  %51 = load i64* %memtotal, align 8, !llfi_index !2227
  %52 = load i64* %memtotal, align 8, !llfi_index !2227
  %53 = udiv i64 %51, 1048576, !llfi_index !2228
  %54 = udiv i64 %52, 1048576, !llfi_index !2228
  call void @global_add(i64 %53, i64 %54)
  store i64 %53, i64* %memtotal, align 8, !llfi_index !2229
  %55 = load i64* %memtotal, align 8, !llfi_index !2230
  %56 = load i64* %memtotal, align 8, !llfi_index !2230
  call void @global_add(i64 %55, i64 %56)
  ret i64 %55, !llfi_index !2231
}

; Function Attrs: nounwind uwtable
define void @binary_dump(i64 %n_isotopes, i64 %n_gridpoints, %struct.NuclideGridPoint** %nuclide_grids, %struct.GridPoint* %energy_grid) #0 {
  %1 = alloca i64, align 8, !llfi_index !2232
  %2 = alloca i64, align 8, !llfi_index !2233
  %3 = alloca %struct.NuclideGridPoint**, align 8, !llfi_index !2234
  %4 = alloca %struct.GridPoint*, align 8, !llfi_index !2235
  %fp = alloca %struct._IO_FILE*, align 8, !llfi_index !2236
  %i = alloca i64, align 8, !llfi_index !2237
  %i1 = alloca i64, align 8, !llfi_index !2238
  store i64 %n_isotopes, i64* %1, align 8, !llfi_index !2239
  store i64 %n_gridpoints, i64* %2, align 8, !llfi_index !2240
  store %struct.NuclideGridPoint** %nuclide_grids, %struct.NuclideGridPoint*** %3, align 8, !llfi_index !2241
  store %struct.GridPoint* %energy_grid, %struct.GridPoint** %4, align 8, !llfi_index !2242
  %5 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([12 x i8]* @.str60, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str161, i32 0, i32 0)), !llfi_index !2243
  store %struct._IO_FILE* %5, %struct._IO_FILE** %fp, align 8, !llfi_index !2244
  store i64 0, i64* %i, align 8, !llfi_index !2245
  br label %6, !llfi_index !2246

; <label>:6                                       ; preds = %29, %0
  %7 = load i64* %i, align 8, !llfi_index !2247
  %8 = load i64* %i, align 8, !llfi_index !2247
  %9 = load i64* %1, align 8, !llfi_index !2248
  %10 = load i64* %1, align 8, !llfi_index !2248
  %11 = icmp slt i64 %7, %9, !llfi_index !2249
  %12 = icmp slt i64 %8, %10, !llfi_index !2249
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %11, i1 %12)
  br i1 %11, label %13, label %34, !llfi_index !2250

; <label>:13                                      ; preds = %6
  %14 = load i64* %i, align 8, !llfi_index !2251
  %15 = load i64* %i, align 8, !llfi_index !2251
  %16 = load %struct.NuclideGridPoint*** %3, align 8, !llfi_index !2252
  %17 = load %struct.NuclideGridPoint*** %3, align 8, !llfi_index !2252
  %18 = getelementptr inbounds %struct.NuclideGridPoint** %16, i64 %14, !llfi_index !2253
  %19 = getelementptr inbounds %struct.NuclideGridPoint** %17, i64 %15, !llfi_index !2253
  %20 = load %struct.NuclideGridPoint** %18, align 8, !llfi_index !2254
  %21 = load %struct.NuclideGridPoint** %19, align 8, !llfi_index !2254
  %22 = bitcast %struct.NuclideGridPoint* %20 to i8*, !llfi_index !2255
  %23 = bitcast %struct.NuclideGridPoint* %21 to i8*, !llfi_index !2255
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %22, i8* %23)
  %24 = load i64* %2, align 8, !llfi_index !2256
  %25 = load i64* %2, align 8, !llfi_index !2256
  call void @global_add(i64 %24, i64 %25)
  %26 = load %struct._IO_FILE** %fp, align 8, !llfi_index !2257
  %27 = load %struct._IO_FILE** %fp, align 8, !llfi_index !2257
  call void bitcast (void (i64, i64)* @global_add to void (%struct._IO_FILE*, %struct._IO_FILE*)*)(%struct._IO_FILE* %26, %struct._IO_FILE* %27)
  %28 = call i64 @fwrite(i8* %22, i64 48, i64 %24, %struct._IO_FILE* %26), !llfi_index !2258
  br label %29, !llfi_index !2259

; <label>:29                                      ; preds = %13
  %30 = load i64* %i, align 8, !llfi_index !2260
  %31 = load i64* %i, align 8, !llfi_index !2260
  %32 = add nsw i64 %30, 1, !llfi_index !2261
  %33 = add nsw i64 %31, 1, !llfi_index !2261
  call void @global_add(i64 %32, i64 %33)
  store i64 %32, i64* %i, align 8, !llfi_index !2262
  br label %6, !llfi_index !2263

; <label>:34                                      ; preds = %6
  store i64 0, i64* %i1, align 8, !llfi_index !2264
  br label %35, !llfi_index !2265

; <label>:35                                      ; preds = %77, %34
  %36 = load i64* %i1, align 8, !llfi_index !2266
  %37 = load i64* %i1, align 8, !llfi_index !2266
  %38 = load i64* %1, align 8, !llfi_index !2267
  %39 = load i64* %1, align 8, !llfi_index !2267
  %40 = load i64* %2, align 8, !llfi_index !2268
  %41 = load i64* %2, align 8, !llfi_index !2268
  %42 = mul nsw i64 %38, %40, !llfi_index !2269
  %43 = mul nsw i64 %39, %41, !llfi_index !2269
  %44 = icmp slt i64 %36, %42, !llfi_index !2270
  %45 = icmp slt i64 %37, %43, !llfi_index !2270
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %44, i1 %45)
  br i1 %44, label %46, label %82, !llfi_index !2271

; <label>:46                                      ; preds = %35
  %47 = load i64* %i1, align 8, !llfi_index !2272
  %48 = load i64* %i1, align 8, !llfi_index !2272
  %49 = load %struct.GridPoint** %4, align 8, !llfi_index !2273
  %50 = load %struct.GridPoint** %4, align 8, !llfi_index !2273
  %51 = getelementptr inbounds %struct.GridPoint* %49, i64 %47, !llfi_index !2274
  %52 = getelementptr inbounds %struct.GridPoint* %50, i64 %48, !llfi_index !2274
  %53 = getelementptr inbounds %struct.GridPoint* %51, i32 0, i32 0, !llfi_index !2275
  %54 = getelementptr inbounds %struct.GridPoint* %52, i32 0, i32 0, !llfi_index !2275
  %55 = bitcast double* %53 to i8*, !llfi_index !2276
  %56 = bitcast double* %54 to i8*, !llfi_index !2276
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %55, i8* %56)
  %57 = load %struct._IO_FILE** %fp, align 8, !llfi_index !2277
  %58 = load %struct._IO_FILE** %fp, align 8, !llfi_index !2277
  call void bitcast (void (i64, i64)* @global_add to void (%struct._IO_FILE*, %struct._IO_FILE*)*)(%struct._IO_FILE* %57, %struct._IO_FILE* %58)
  %59 = call i64 @fwrite(i8* %55, i64 8, i64 1, %struct._IO_FILE* %57), !llfi_index !2278
  %60 = load i64* %i1, align 8, !llfi_index !2279
  %61 = load i64* %i1, align 8, !llfi_index !2279
  %62 = load %struct.GridPoint** %4, align 8, !llfi_index !2280
  %63 = load %struct.GridPoint** %4, align 8, !llfi_index !2280
  %64 = getelementptr inbounds %struct.GridPoint* %62, i64 %60, !llfi_index !2281
  %65 = getelementptr inbounds %struct.GridPoint* %63, i64 %61, !llfi_index !2281
  %66 = getelementptr inbounds %struct.GridPoint* %64, i32 0, i32 1, !llfi_index !2282
  %67 = getelementptr inbounds %struct.GridPoint* %65, i32 0, i32 1, !llfi_index !2282
  %68 = load i32** %66, align 8, !llfi_index !2283
  %69 = load i32** %67, align 8, !llfi_index !2283
  %70 = bitcast i32* %68 to i8*, !llfi_index !2284
  %71 = bitcast i32* %69 to i8*, !llfi_index !2284
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %70, i8* %71)
  %72 = load i64* %1, align 8, !llfi_index !2285
  %73 = load i64* %1, align 8, !llfi_index !2285
  call void @global_add(i64 %72, i64 %73)
  %74 = load %struct._IO_FILE** %fp, align 8, !llfi_index !2286
  %75 = load %struct._IO_FILE** %fp, align 8, !llfi_index !2286
  call void bitcast (void (i64, i64)* @global_add to void (%struct._IO_FILE*, %struct._IO_FILE*)*)(%struct._IO_FILE* %74, %struct._IO_FILE* %75)
  %76 = call i64 @fwrite(i8* %70, i64 4, i64 %72, %struct._IO_FILE* %74), !llfi_index !2287
  br label %77, !llfi_index !2288

; <label>:77                                      ; preds = %46
  %78 = load i64* %i1, align 8, !llfi_index !2289
  %79 = load i64* %i1, align 8, !llfi_index !2289
  %80 = add nsw i64 %78, 1, !llfi_index !2290
  %81 = add nsw i64 %79, 1, !llfi_index !2290
  call void @global_add(i64 %80, i64 %81)
  store i64 %80, i64* %i1, align 8, !llfi_index !2291
  br label %35, !llfi_index !2292

; <label>:82                                      ; preds = %35
  %83 = load %struct._IO_FILE** %fp, align 8, !llfi_index !2293
  %84 = load %struct._IO_FILE** %fp, align 8, !llfi_index !2293
  call void bitcast (void (i64, i64)* @global_add to void (%struct._IO_FILE*, %struct._IO_FILE*)*)(%struct._IO_FILE* %83, %struct._IO_FILE* %84)
  %85 = call i32 @fclose(%struct._IO_FILE* %83), !llfi_index !2294
  ret void, !llfi_index !2295
}

declare i64 @fwrite(i8*, i64, i64, %struct._IO_FILE*) #1

; Function Attrs: nounwind uwtable
define void @binary_read(i64 %n_isotopes, i64 %n_gridpoints, %struct.NuclideGridPoint** %nuclide_grids, %struct.GridPoint* %energy_grid) #0 {
  %1 = alloca i64, align 8, !llfi_index !2296
  %2 = alloca i64, align 8, !llfi_index !2297
  %3 = alloca %struct.NuclideGridPoint**, align 8, !llfi_index !2298
  %4 = alloca %struct.GridPoint*, align 8, !llfi_index !2299
  %stat = alloca i32, align 4, !llfi_index !2300
  %fp = alloca %struct._IO_FILE*, align 8, !llfi_index !2301
  %i = alloca i64, align 8, !llfi_index !2302
  %i1 = alloca i64, align 8, !llfi_index !2303
  store i64 %n_isotopes, i64* %1, align 8, !llfi_index !2304
  store i64 %n_gridpoints, i64* %2, align 8, !llfi_index !2305
  store %struct.NuclideGridPoint** %nuclide_grids, %struct.NuclideGridPoint*** %3, align 8, !llfi_index !2306
  store %struct.GridPoint* %energy_grid, %struct.GridPoint** %4, align 8, !llfi_index !2307
  %5 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([12 x i8]* @.str60, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str262, i32 0, i32 0)), !llfi_index !2308
  store %struct._IO_FILE* %5, %struct._IO_FILE** %fp, align 8, !llfi_index !2309
  store i64 0, i64* %i, align 8, !llfi_index !2310
  br label %6, !llfi_index !2311

; <label>:6                                       ; preds = %31, %0
  %7 = load i64* %i, align 8, !llfi_index !2312
  %8 = load i64* %i, align 8, !llfi_index !2312
  %9 = load i64* %1, align 8, !llfi_index !2313
  %10 = load i64* %1, align 8, !llfi_index !2313
  %11 = icmp slt i64 %7, %9, !llfi_index !2314
  %12 = icmp slt i64 %8, %10, !llfi_index !2314
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %11, i1 %12)
  br i1 %11, label %13, label %36, !llfi_index !2315

; <label>:13                                      ; preds = %6
  %14 = load i64* %i, align 8, !llfi_index !2316
  %15 = load i64* %i, align 8, !llfi_index !2316
  %16 = load %struct.NuclideGridPoint*** %3, align 8, !llfi_index !2317
  %17 = load %struct.NuclideGridPoint*** %3, align 8, !llfi_index !2317
  %18 = getelementptr inbounds %struct.NuclideGridPoint** %16, i64 %14, !llfi_index !2318
  %19 = getelementptr inbounds %struct.NuclideGridPoint** %17, i64 %15, !llfi_index !2318
  %20 = load %struct.NuclideGridPoint** %18, align 8, !llfi_index !2319
  %21 = load %struct.NuclideGridPoint** %19, align 8, !llfi_index !2319
  %22 = bitcast %struct.NuclideGridPoint* %20 to i8*, !llfi_index !2320
  %23 = bitcast %struct.NuclideGridPoint* %21 to i8*, !llfi_index !2320
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %22, i8* %23)
  %24 = load i64* %2, align 8, !llfi_index !2321
  %25 = load i64* %2, align 8, !llfi_index !2321
  call void @global_add(i64 %24, i64 %25)
  %26 = load %struct._IO_FILE** %fp, align 8, !llfi_index !2322
  %27 = load %struct._IO_FILE** %fp, align 8, !llfi_index !2322
  call void bitcast (void (i64, i64)* @global_add to void (%struct._IO_FILE*, %struct._IO_FILE*)*)(%struct._IO_FILE* %26, %struct._IO_FILE* %27)
  %28 = call i64 @fread(i8* %22, i64 48, i64 %24, %struct._IO_FILE* %26), !llfi_index !2323
  %29 = trunc i64 %28 to i32, !llfi_index !2324
  %30 = trunc i64 %28 to i32, !llfi_index !2324
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %29, i32 %30)
  store i32 %29, i32* %stat, align 4, !llfi_index !2325
  br label %31, !llfi_index !2326

; <label>:31                                      ; preds = %13
  %32 = load i64* %i, align 8, !llfi_index !2327
  %33 = load i64* %i, align 8, !llfi_index !2327
  %34 = add nsw i64 %32, 1, !llfi_index !2328
  %35 = add nsw i64 %33, 1, !llfi_index !2328
  call void @global_add(i64 %34, i64 %35)
  store i64 %34, i64* %i, align 8, !llfi_index !2329
  br label %6, !llfi_index !2330

; <label>:36                                      ; preds = %6
  store i64 0, i64* %i1, align 8, !llfi_index !2331
  br label %37, !llfi_index !2332

; <label>:37                                      ; preds = %83, %36
  %38 = load i64* %i1, align 8, !llfi_index !2333
  %39 = load i64* %i1, align 8, !llfi_index !2333
  %40 = load i64* %1, align 8, !llfi_index !2334
  %41 = load i64* %1, align 8, !llfi_index !2334
  %42 = load i64* %2, align 8, !llfi_index !2335
  %43 = load i64* %2, align 8, !llfi_index !2335
  %44 = mul nsw i64 %40, %42, !llfi_index !2336
  %45 = mul nsw i64 %41, %43, !llfi_index !2336
  %46 = icmp slt i64 %38, %44, !llfi_index !2337
  %47 = icmp slt i64 %39, %45, !llfi_index !2337
  call void bitcast (void (i64, i64)* @global_add to void (i1, i1)*)(i1 %46, i1 %47)
  br i1 %46, label %48, label %88, !llfi_index !2338

; <label>:48                                      ; preds = %37
  %49 = load i64* %i1, align 8, !llfi_index !2339
  %50 = load i64* %i1, align 8, !llfi_index !2339
  %51 = load %struct.GridPoint** %4, align 8, !llfi_index !2340
  %52 = load %struct.GridPoint** %4, align 8, !llfi_index !2340
  %53 = getelementptr inbounds %struct.GridPoint* %51, i64 %49, !llfi_index !2341
  %54 = getelementptr inbounds %struct.GridPoint* %52, i64 %50, !llfi_index !2341
  %55 = getelementptr inbounds %struct.GridPoint* %53, i32 0, i32 0, !llfi_index !2342
  %56 = getelementptr inbounds %struct.GridPoint* %54, i32 0, i32 0, !llfi_index !2342
  %57 = bitcast double* %55 to i8*, !llfi_index !2343
  %58 = bitcast double* %56 to i8*, !llfi_index !2343
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %57, i8* %58)
  %59 = load %struct._IO_FILE** %fp, align 8, !llfi_index !2344
  %60 = load %struct._IO_FILE** %fp, align 8, !llfi_index !2344
  call void bitcast (void (i64, i64)* @global_add to void (%struct._IO_FILE*, %struct._IO_FILE*)*)(%struct._IO_FILE* %59, %struct._IO_FILE* %60)
  %61 = call i64 @fread(i8* %57, i64 8, i64 1, %struct._IO_FILE* %59), !llfi_index !2345
  %62 = trunc i64 %61 to i32, !llfi_index !2346
  %63 = trunc i64 %61 to i32, !llfi_index !2346
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %62, i32 %63)
  store i32 %62, i32* %stat, align 4, !llfi_index !2347
  %64 = load i64* %i1, align 8, !llfi_index !2348
  %65 = load i64* %i1, align 8, !llfi_index !2348
  %66 = load %struct.GridPoint** %4, align 8, !llfi_index !2349
  %67 = load %struct.GridPoint** %4, align 8, !llfi_index !2349
  %68 = getelementptr inbounds %struct.GridPoint* %66, i64 %64, !llfi_index !2350
  %69 = getelementptr inbounds %struct.GridPoint* %67, i64 %65, !llfi_index !2350
  %70 = getelementptr inbounds %struct.GridPoint* %68, i32 0, i32 1, !llfi_index !2351
  %71 = getelementptr inbounds %struct.GridPoint* %69, i32 0, i32 1, !llfi_index !2351
  %72 = load i32** %70, align 8, !llfi_index !2352
  %73 = load i32** %71, align 8, !llfi_index !2352
  %74 = bitcast i32* %72 to i8*, !llfi_index !2353
  %75 = bitcast i32* %73 to i8*, !llfi_index !2353
  call void bitcast (void (i64, i64)* @global_add to void (i8*, i8*)*)(i8* %74, i8* %75)
  %76 = load i64* %1, align 8, !llfi_index !2354
  %77 = load i64* %1, align 8, !llfi_index !2354
  call void @global_add(i64 %76, i64 %77)
  %78 = load %struct._IO_FILE** %fp, align 8, !llfi_index !2355
  %79 = load %struct._IO_FILE** %fp, align 8, !llfi_index !2355
  call void bitcast (void (i64, i64)* @global_add to void (%struct._IO_FILE*, %struct._IO_FILE*)*)(%struct._IO_FILE* %78, %struct._IO_FILE* %79)
  %80 = call i64 @fread(i8* %74, i64 4, i64 %76, %struct._IO_FILE* %78), !llfi_index !2356
  %81 = trunc i64 %80 to i32, !llfi_index !2357
  %82 = trunc i64 %80 to i32, !llfi_index !2357
  call void bitcast (void (i64, i64)* @global_add to void (i32, i32)*)(i32 %81, i32 %82)
  store i32 %81, i32* %stat, align 4, !llfi_index !2358
  br label %83, !llfi_index !2359

; <label>:83                                      ; preds = %48
  %84 = load i64* %i1, align 8, !llfi_index !2360
  %85 = load i64* %i1, align 8, !llfi_index !2360
  %86 = add nsw i64 %84, 1, !llfi_index !2361
  %87 = add nsw i64 %85, 1, !llfi_index !2361
  call void @global_add(i64 %86, i64 %87)
  store i64 %86, i64* %i1, align 8, !llfi_index !2362
  br label %37, !llfi_index !2363

; <label>:88                                      ; preds = %37
  %89 = load %struct._IO_FILE** %fp, align 8, !llfi_index !2364
  %90 = load %struct._IO_FILE** %fp, align 8, !llfi_index !2364
  call void bitcast (void (i64, i64)* @global_add to void (%struct._IO_FILE*, %struct._IO_FILE*)*)(%struct._IO_FILE* %89, %struct._IO_FILE* %90)
  %91 = call i32 @fclose(%struct._IO_FILE* %89), !llfi_index !2365
  ret void, !llfi_index !2366
}

declare i64 @fread(i8*, i64, i64, %struct._IO_FILE*) #1

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

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { noreturn nounwind }
attributes #8 = { nounwind readonly }
attributes #9 = { nounwind readnone }

!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0}

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
!1579 = metadata !{i64 1579}
!1580 = metadata !{i64 1580}
!1581 = metadata !{i64 1581}
!1582 = metadata !{i64 1582}
!1583 = metadata !{i64 1583}
!1584 = metadata !{i64 1584}
!1585 = metadata !{i64 1585}
!1586 = metadata !{i64 1586}
!1587 = metadata !{i64 1587}
!1588 = metadata !{i64 1588}
!1589 = metadata !{i64 1589}
!1590 = metadata !{i64 1590}
!1591 = metadata !{i64 1591}
!1592 = metadata !{i64 1592}
!1593 = metadata !{i64 1593}
!1594 = metadata !{i64 1594}
!1595 = metadata !{i64 1595}
!1596 = metadata !{i64 1596}
!1597 = metadata !{i64 1597}
!1598 = metadata !{i64 1598}
!1599 = metadata !{i64 1599}
!1600 = metadata !{i64 1600}
!1601 = metadata !{i64 1601}
!1602 = metadata !{i64 1602}
!1603 = metadata !{i64 1603}
!1604 = metadata !{i64 1604}
!1605 = metadata !{i64 1605}
!1606 = metadata !{i64 1606}
!1607 = metadata !{i64 1607}
!1608 = metadata !{i64 1608}
!1609 = metadata !{i64 1609}
!1610 = metadata !{i64 1610}
!1611 = metadata !{i64 1611}
!1612 = metadata !{i64 1612}
!1613 = metadata !{i64 1613}
!1614 = metadata !{i64 1614}
!1615 = metadata !{i64 1615}
!1616 = metadata !{i64 1616}
!1617 = metadata !{i64 1617}
!1618 = metadata !{i64 1618}
!1619 = metadata !{i64 1619}
!1620 = metadata !{i64 1620}
!1621 = metadata !{i64 1621}
!1622 = metadata !{i64 1622}
!1623 = metadata !{i64 1623}
!1624 = metadata !{i64 1624}
!1625 = metadata !{i64 1625}
!1626 = metadata !{i64 1626}
!1627 = metadata !{i64 1627}
!1628 = metadata !{i64 1628}
!1629 = metadata !{i64 1629}
!1630 = metadata !{i64 1630}
!1631 = metadata !{i64 1631}
!1632 = metadata !{i64 1632}
!1633 = metadata !{i64 1633}
!1634 = metadata !{i64 1634}
!1635 = metadata !{i64 1635}
!1636 = metadata !{i64 1636}
!1637 = metadata !{i64 1637}
!1638 = metadata !{i64 1638}
!1639 = metadata !{i64 1639}
!1640 = metadata !{i64 1640}
!1641 = metadata !{i64 1641}
!1642 = metadata !{i64 1642}
!1643 = metadata !{i64 1643}
!1644 = metadata !{i64 1644}
!1645 = metadata !{i64 1645}
!1646 = metadata !{i64 1646}
!1647 = metadata !{i64 1647}
!1648 = metadata !{i64 1648}
!1649 = metadata !{i64 1649}
!1650 = metadata !{i64 1650}
!1651 = metadata !{i64 1651}
!1652 = metadata !{i64 1652}
!1653 = metadata !{i64 1653}
!1654 = metadata !{i64 1654}
!1655 = metadata !{i64 1655}
!1656 = metadata !{i64 1656}
!1657 = metadata !{i64 1657}
!1658 = metadata !{i64 1658}
!1659 = metadata !{i64 1659}
!1660 = metadata !{i64 1660}
!1661 = metadata !{i64 1661}
!1662 = metadata !{i64 1662}
!1663 = metadata !{i64 1663}
!1664 = metadata !{i64 1664}
!1665 = metadata !{i64 1665}
!1666 = metadata !{i64 1666}
!1667 = metadata !{i64 1667}
!1668 = metadata !{i64 1668}
!1669 = metadata !{i64 1669}
!1670 = metadata !{i64 1670}
!1671 = metadata !{i64 1671}
!1672 = metadata !{i64 1672}
!1673 = metadata !{i64 1673}
!1674 = metadata !{i64 1674}
!1675 = metadata !{i64 1675}
!1676 = metadata !{i64 1676}
!1677 = metadata !{i64 1677}
!1678 = metadata !{i64 1678}
!1679 = metadata !{i64 1679}
!1680 = metadata !{i64 1680}
!1681 = metadata !{i64 1681}
!1682 = metadata !{i64 1682}
!1683 = metadata !{i64 1683}
!1684 = metadata !{i64 1684}
!1685 = metadata !{i64 1685}
!1686 = metadata !{i64 1686}
!1687 = metadata !{i64 1687}
!1688 = metadata !{i64 1688}
!1689 = metadata !{i64 1689}
!1690 = metadata !{i64 1690}
!1691 = metadata !{i64 1691}
!1692 = metadata !{i64 1692}
!1693 = metadata !{i64 1693}
!1694 = metadata !{i64 1694}
!1695 = metadata !{i64 1695}
!1696 = metadata !{i64 1696}
!1697 = metadata !{i64 1697}
!1698 = metadata !{i64 1698}
!1699 = metadata !{i64 1699}
!1700 = metadata !{i64 1700}
!1701 = metadata !{i64 1701}
!1702 = metadata !{i64 1702}
!1703 = metadata !{i64 1703}
!1704 = metadata !{i64 1704}
!1705 = metadata !{i64 1705}
!1706 = metadata !{i64 1706}
!1707 = metadata !{i64 1707}
!1708 = metadata !{i64 1708}
!1709 = metadata !{i64 1709}
!1710 = metadata !{i64 1710}
!1711 = metadata !{i64 1711}
!1712 = metadata !{i64 1712}
!1713 = metadata !{i64 1713}
!1714 = metadata !{i64 1714}
!1715 = metadata !{i64 1715}
!1716 = metadata !{i64 1716}
!1717 = metadata !{i64 1717}
!1718 = metadata !{i64 1718}
!1719 = metadata !{i64 1719}
!1720 = metadata !{i64 1720}
!1721 = metadata !{i64 1721}
!1722 = metadata !{i64 1722}
!1723 = metadata !{i64 1723}
!1724 = metadata !{i64 1724}
!1725 = metadata !{i64 1725}
!1726 = metadata !{i64 1726}
!1727 = metadata !{i64 1727}
!1728 = metadata !{i64 1728}
!1729 = metadata !{i64 1729}
!1730 = metadata !{i64 1730}
!1731 = metadata !{i64 1731}
!1732 = metadata !{i64 1732}
!1733 = metadata !{i64 1733}
!1734 = metadata !{i64 1734}
!1735 = metadata !{i64 1735}
!1736 = metadata !{i64 1736}
!1737 = metadata !{i64 1737}
!1738 = metadata !{i64 1738}
!1739 = metadata !{i64 1739}
!1740 = metadata !{i64 1740}
!1741 = metadata !{i64 1741}
!1742 = metadata !{i64 1742}
!1743 = metadata !{i64 1743}
!1744 = metadata !{i64 1744}
!1745 = metadata !{i64 1745}
!1746 = metadata !{i64 1746}
!1747 = metadata !{i64 1747}
!1748 = metadata !{i64 1748}
!1749 = metadata !{i64 1749}
!1750 = metadata !{i64 1750}
!1751 = metadata !{i64 1751}
!1752 = metadata !{i64 1752}
!1753 = metadata !{i64 1753}
!1754 = metadata !{i64 1754}
!1755 = metadata !{i64 1755}
!1756 = metadata !{i64 1756}
!1757 = metadata !{i64 1757}
!1758 = metadata !{i64 1758}
!1759 = metadata !{i64 1759}
!1760 = metadata !{i64 1760}
!1761 = metadata !{i64 1761}
!1762 = metadata !{i64 1762}
!1763 = metadata !{i64 1763}
!1764 = metadata !{i64 1764}
!1765 = metadata !{i64 1765}
!1766 = metadata !{i64 1766}
!1767 = metadata !{i64 1767}
!1768 = metadata !{i64 1768}
!1769 = metadata !{i64 1769}
!1770 = metadata !{i64 1770}
!1771 = metadata !{i64 1771}
!1772 = metadata !{i64 1772}
!1773 = metadata !{i64 1773}
!1774 = metadata !{i64 1774}
!1775 = metadata !{i64 1775}
!1776 = metadata !{i64 1776}
!1777 = metadata !{i64 1777}
!1778 = metadata !{i64 1778}
!1779 = metadata !{i64 1779}
!1780 = metadata !{i64 1780}
!1781 = metadata !{i64 1781}
!1782 = metadata !{i64 1782}
!1783 = metadata !{i64 1783}
!1784 = metadata !{i64 1784}
!1785 = metadata !{i64 1785}
!1786 = metadata !{i64 1786}
!1787 = metadata !{i64 1787}
!1788 = metadata !{i64 1788}
!1789 = metadata !{i64 1789}
!1790 = metadata !{i64 1790}
!1791 = metadata !{i64 1791}
!1792 = metadata !{i64 1792}
!1793 = metadata !{i64 1793}
!1794 = metadata !{i64 1794}
!1795 = metadata !{i64 1795}
!1796 = metadata !{i64 1796}
!1797 = metadata !{i64 1797}
!1798 = metadata !{i64 1798}
!1799 = metadata !{i64 1799}
!1800 = metadata !{i64 1800}
!1801 = metadata !{i64 1801}
!1802 = metadata !{i64 1802}
!1803 = metadata !{i64 1803}
!1804 = metadata !{i64 1804}
!1805 = metadata !{i64 1805}
!1806 = metadata !{i64 1806}
!1807 = metadata !{i64 1807}
!1808 = metadata !{i64 1808}
!1809 = metadata !{i64 1809}
!1810 = metadata !{i64 1810}
!1811 = metadata !{i64 1811}
!1812 = metadata !{i64 1812}
!1813 = metadata !{i64 1813}
!1814 = metadata !{i64 1814}
!1815 = metadata !{i64 1815}
!1816 = metadata !{i64 1816}
!1817 = metadata !{i64 1817}
!1818 = metadata !{i64 1818}
!1819 = metadata !{i64 1819}
!1820 = metadata !{i64 1820}
!1821 = metadata !{i64 1821}
!1822 = metadata !{i64 1822}
!1823 = metadata !{i64 1823}
!1824 = metadata !{i64 1824}
!1825 = metadata !{i64 1825}
!1826 = metadata !{i64 1826}
!1827 = metadata !{i64 1827}
!1828 = metadata !{i64 1828}
!1829 = metadata !{i64 1829}
!1830 = metadata !{i64 1830}
!1831 = metadata !{i64 1831}
!1832 = metadata !{i64 1832}
!1833 = metadata !{i64 1833}
!1834 = metadata !{i64 1834}
!1835 = metadata !{i64 1835}
!1836 = metadata !{i64 1836}
!1837 = metadata !{i64 1837}
!1838 = metadata !{i64 1838}
!1839 = metadata !{i64 1839}
!1840 = metadata !{i64 1840}
!1841 = metadata !{i64 1841}
!1842 = metadata !{i64 1842}
!1843 = metadata !{i64 1843}
!1844 = metadata !{i64 1844}
!1845 = metadata !{i64 1845}
!1846 = metadata !{i64 1846}
!1847 = metadata !{i64 1847}
!1848 = metadata !{i64 1848}
!1849 = metadata !{i64 1849}
!1850 = metadata !{i64 1850}
!1851 = metadata !{i64 1851}
!1852 = metadata !{i64 1852}
!1853 = metadata !{i64 1853}
!1854 = metadata !{i64 1854}
!1855 = metadata !{i64 1855}
!1856 = metadata !{i64 1856}
!1857 = metadata !{i64 1857}
!1858 = metadata !{i64 1858}
!1859 = metadata !{i64 1859}
!1860 = metadata !{i64 1860}
!1861 = metadata !{i64 1861}
!1862 = metadata !{i64 1862}
!1863 = metadata !{i64 1863}
!1864 = metadata !{i64 1864}
!1865 = metadata !{i64 1865}
!1866 = metadata !{i64 1866}
!1867 = metadata !{i64 1867}
!1868 = metadata !{i64 1868}
!1869 = metadata !{i64 1869}
!1870 = metadata !{i64 1870}
!1871 = metadata !{i64 1871}
!1872 = metadata !{i64 1872}
!1873 = metadata !{i64 1873}
!1874 = metadata !{i64 1874}
!1875 = metadata !{i64 1875}
!1876 = metadata !{i64 1876}
!1877 = metadata !{i64 1877}
!1878 = metadata !{i64 1878}
!1879 = metadata !{i64 1879}
!1880 = metadata !{i64 1880}
!1881 = metadata !{i64 1881}
!1882 = metadata !{i64 1882}
!1883 = metadata !{i64 1883}
!1884 = metadata !{i64 1884}
!1885 = metadata !{i64 1885}
!1886 = metadata !{i64 1886}
!1887 = metadata !{i64 1887}
!1888 = metadata !{i64 1888}
!1889 = metadata !{i64 1889}
!1890 = metadata !{i64 1890}
!1891 = metadata !{i64 1891}
!1892 = metadata !{i64 1892}
!1893 = metadata !{i64 1893}
!1894 = metadata !{i64 1894}
!1895 = metadata !{i64 1895}
!1896 = metadata !{i64 1896}
!1897 = metadata !{i64 1897}
!1898 = metadata !{i64 1898}
!1899 = metadata !{i64 1899}
!1900 = metadata !{i64 1900}
!1901 = metadata !{i64 1901}
!1902 = metadata !{i64 1902}
!1903 = metadata !{i64 1903}
!1904 = metadata !{i64 1904}
!1905 = metadata !{i64 1905}
!1906 = metadata !{i64 1906}
!1907 = metadata !{i64 1907}
!1908 = metadata !{i64 1908}
!1909 = metadata !{i64 1909}
!1910 = metadata !{i64 1910}
!1911 = metadata !{i64 1911}
!1912 = metadata !{i64 1912}
!1913 = metadata !{i64 1913}
!1914 = metadata !{i64 1914}
!1915 = metadata !{i64 1915}
!1916 = metadata !{i64 1916}
!1917 = metadata !{i64 1917}
!1918 = metadata !{i64 1918}
!1919 = metadata !{i64 1919}
!1920 = metadata !{i64 1920}
!1921 = metadata !{i64 1921}
!1922 = metadata !{i64 1922}
!1923 = metadata !{i64 1923}
!1924 = metadata !{i64 1924}
!1925 = metadata !{i64 1925}
!1926 = metadata !{i64 1926}
!1927 = metadata !{i64 1927}
!1928 = metadata !{i64 1928}
!1929 = metadata !{i64 1929}
!1930 = metadata !{i64 1930}
!1931 = metadata !{i64 1931}
!1932 = metadata !{i64 1932}
!1933 = metadata !{i64 1933}
!1934 = metadata !{i64 1934}
!1935 = metadata !{i64 1935}
!1936 = metadata !{i64 1936}
!1937 = metadata !{i64 1937}
!1938 = metadata !{i64 1938}
!1939 = metadata !{i64 1939}
!1940 = metadata !{i64 1940}
!1941 = metadata !{i64 1941}
!1942 = metadata !{i64 1942}
!1943 = metadata !{i64 1943}
!1944 = metadata !{i64 1944}
!1945 = metadata !{i64 1945}
!1946 = metadata !{i64 1946}
!1947 = metadata !{i64 1947}
!1948 = metadata !{i64 1948}
!1949 = metadata !{i64 1949}
!1950 = metadata !{i64 1950}
!1951 = metadata !{i64 1951}
!1952 = metadata !{i64 1952}
!1953 = metadata !{i64 1953}
!1954 = metadata !{i64 1954}
!1955 = metadata !{i64 1955}
!1956 = metadata !{i64 1956}
!1957 = metadata !{i64 1957}
!1958 = metadata !{i64 1958}
!1959 = metadata !{i64 1959}
!1960 = metadata !{i64 1960}
!1961 = metadata !{i64 1961}
!1962 = metadata !{i64 1962}
!1963 = metadata !{i64 1963}
!1964 = metadata !{i64 1964}
!1965 = metadata !{i64 1965}
!1966 = metadata !{i64 1966}
!1967 = metadata !{i64 1967}
!1968 = metadata !{i64 1968}
!1969 = metadata !{i64 1969}
!1970 = metadata !{i64 1970}
!1971 = metadata !{i64 1971}
!1972 = metadata !{i64 1972}
!1973 = metadata !{i64 1973}
!1974 = metadata !{i64 1974}
!1975 = metadata !{i64 1975}
!1976 = metadata !{i64 1976}
!1977 = metadata !{i64 1977}
!1978 = metadata !{i64 1978}
!1979 = metadata !{i64 1979}
!1980 = metadata !{i64 1980}
!1981 = metadata !{i64 1981}
!1982 = metadata !{i64 1982}
!1983 = metadata !{i64 1983}
!1984 = metadata !{i64 1984}
!1985 = metadata !{i64 1985}
!1986 = metadata !{i64 1986}
!1987 = metadata !{i64 1987}
!1988 = metadata !{i64 1988}
!1989 = metadata !{i64 1989}
!1990 = metadata !{i64 1990}
!1991 = metadata !{i64 1991}
!1992 = metadata !{i64 1992}
!1993 = metadata !{i64 1993}
!1994 = metadata !{i64 1994}
!1995 = metadata !{i64 1995}
!1996 = metadata !{i64 1996}
!1997 = metadata !{i64 1997}
!1998 = metadata !{i64 1998}
!1999 = metadata !{i64 1999}
!2000 = metadata !{i64 2000}
!2001 = metadata !{i64 2001}
!2002 = metadata !{i64 2002}
!2003 = metadata !{i64 2003}
!2004 = metadata !{i64 2004}
!2005 = metadata !{i64 2005}
!2006 = metadata !{i64 2006}
!2007 = metadata !{i64 2007}
!2008 = metadata !{i64 2008}
!2009 = metadata !{i64 2009}
!2010 = metadata !{i64 2010}
!2011 = metadata !{i64 2011}
!2012 = metadata !{i64 2012}
!2013 = metadata !{i64 2013}
!2014 = metadata !{i64 2014}
!2015 = metadata !{i64 2015}
!2016 = metadata !{i64 2016}
!2017 = metadata !{i64 2017}
!2018 = metadata !{i64 2018}
!2019 = metadata !{i64 2019}
!2020 = metadata !{i64 2020}
!2021 = metadata !{i64 2021}
!2022 = metadata !{i64 2022}
!2023 = metadata !{i64 2023}
!2024 = metadata !{i64 2024}
!2025 = metadata !{i64 2025}
!2026 = metadata !{i64 2026}
!2027 = metadata !{i64 2027}
!2028 = metadata !{i64 2028}
!2029 = metadata !{i64 2029}
!2030 = metadata !{i64 2030}
!2031 = metadata !{i64 2031}
!2032 = metadata !{i64 2032}
!2033 = metadata !{i64 2033}
!2034 = metadata !{i64 2034}
!2035 = metadata !{i64 2035}
!2036 = metadata !{i64 2036}
!2037 = metadata !{i64 2037}
!2038 = metadata !{i64 2038}
!2039 = metadata !{i64 2039}
!2040 = metadata !{i64 2040}
!2041 = metadata !{i64 2041}
!2042 = metadata !{i64 2042}
!2043 = metadata !{i64 2043}
!2044 = metadata !{i64 2044}
!2045 = metadata !{i64 2045}
!2046 = metadata !{i64 2046}
!2047 = metadata !{i64 2047}
!2048 = metadata !{i64 2048}
!2049 = metadata !{i64 2049}
!2050 = metadata !{i64 2050}
!2051 = metadata !{i64 2051}
!2052 = metadata !{i64 2052}
!2053 = metadata !{i64 2053}
!2054 = metadata !{i64 2054}
!2055 = metadata !{i64 2055}
!2056 = metadata !{i64 2056}
!2057 = metadata !{i64 2057}
!2058 = metadata !{i64 2058}
!2059 = metadata !{i64 2059}
!2060 = metadata !{i64 2060}
!2061 = metadata !{i64 2061}
!2062 = metadata !{i64 2062}
!2063 = metadata !{i64 2063}
!2064 = metadata !{i64 2064}
!2065 = metadata !{i64 2065}
!2066 = metadata !{i64 2066}
!2067 = metadata !{i64 2067}
!2068 = metadata !{i64 2068}
!2069 = metadata !{i64 2069}
!2070 = metadata !{i64 2070}
!2071 = metadata !{i64 2071}
!2072 = metadata !{i64 2072}
!2073 = metadata !{i64 2073}
!2074 = metadata !{i64 2074}
!2075 = metadata !{i64 2075}
!2076 = metadata !{i64 2076}
!2077 = metadata !{i64 2077}
!2078 = metadata !{i64 2078}
!2079 = metadata !{i64 2079}
!2080 = metadata !{i64 2080}
!2081 = metadata !{i64 2081}
!2082 = metadata !{i64 2082}
!2083 = metadata !{i64 2083}
!2084 = metadata !{i64 2084}
!2085 = metadata !{i64 2085}
!2086 = metadata !{i64 2086}
!2087 = metadata !{i64 2087}
!2088 = metadata !{i64 2088}
!2089 = metadata !{i64 2089}
!2090 = metadata !{i64 2090}
!2091 = metadata !{i64 2091}
!2092 = metadata !{i64 2092}
!2093 = metadata !{i64 2093}
!2094 = metadata !{i64 2094}
!2095 = metadata !{i64 2095}
!2096 = metadata !{i64 2096}
!2097 = metadata !{i64 2097}
!2098 = metadata !{i64 2098}
!2099 = metadata !{i64 2099}
!2100 = metadata !{i64 2100}
!2101 = metadata !{i64 2101}
!2102 = metadata !{i64 2102}
!2103 = metadata !{i64 2103}
!2104 = metadata !{i64 2104}
!2105 = metadata !{i64 2105}
!2106 = metadata !{i64 2106}
!2107 = metadata !{i64 2107}
!2108 = metadata !{i64 2108}
!2109 = metadata !{i64 2109}
!2110 = metadata !{i64 2110}
!2111 = metadata !{i64 2111}
!2112 = metadata !{i64 2112}
!2113 = metadata !{i64 2113}
!2114 = metadata !{i64 2114}
!2115 = metadata !{i64 2115}
!2116 = metadata !{i64 2116}
!2117 = metadata !{i64 2117}
!2118 = metadata !{i64 2118}
!2119 = metadata !{i64 2119}
!2120 = metadata !{i64 2120}
!2121 = metadata !{i64 2121}
!2122 = metadata !{i64 2122}
!2123 = metadata !{i64 2123}
!2124 = metadata !{i64 2124}
!2125 = metadata !{i64 2125}
!2126 = metadata !{i64 2126}
!2127 = metadata !{i64 2127}
!2128 = metadata !{i64 2128}
!2129 = metadata !{i64 2129}
!2130 = metadata !{i64 2130}
!2131 = metadata !{i64 2131}
!2132 = metadata !{i64 2132}
!2133 = metadata !{i64 2133}
!2134 = metadata !{i64 2134}
!2135 = metadata !{i64 2135}
!2136 = metadata !{i64 2136}
!2137 = metadata !{i64 2137}
!2138 = metadata !{i64 2138}
!2139 = metadata !{i64 2139}
!2140 = metadata !{i64 2140}
!2141 = metadata !{i64 2141}
!2142 = metadata !{i64 2142}
!2143 = metadata !{i64 2143}
!2144 = metadata !{i64 2144}
!2145 = metadata !{i64 2145}
!2146 = metadata !{i64 2146}
!2147 = metadata !{i64 2147}
!2148 = metadata !{i64 2148}
!2149 = metadata !{i64 2149}
!2150 = metadata !{i64 2150}
!2151 = metadata !{i64 2151}
!2152 = metadata !{i64 2152}
!2153 = metadata !{i64 2153}
!2154 = metadata !{i64 2154}
!2155 = metadata !{i64 2155}
!2156 = metadata !{i64 2156}
!2157 = metadata !{i64 2157}
!2158 = metadata !{i64 2158}
!2159 = metadata !{i64 2159}
!2160 = metadata !{i64 2160}
!2161 = metadata !{i64 2161}
!2162 = metadata !{i64 2162}
!2163 = metadata !{i64 2163}
!2164 = metadata !{i64 2164}
!2165 = metadata !{i64 2165}
!2166 = metadata !{i64 2166}
!2167 = metadata !{i64 2167}
!2168 = metadata !{i64 2168}
!2169 = metadata !{i64 2169}
!2170 = metadata !{i64 2170}
!2171 = metadata !{i64 2171}
!2172 = metadata !{i64 2172}
!2173 = metadata !{i64 2173}
!2174 = metadata !{i64 2174}
!2175 = metadata !{i64 2175}
!2176 = metadata !{i64 2176}
!2177 = metadata !{i64 2177}
!2178 = metadata !{i64 2178}
!2179 = metadata !{i64 2179}
!2180 = metadata !{i64 2180}
!2181 = metadata !{i64 2181}
!2182 = metadata !{i64 2182}
!2183 = metadata !{i64 2183}
!2184 = metadata !{i64 2184}
!2185 = metadata !{i64 2185}
!2186 = metadata !{i64 2186}
!2187 = metadata !{i64 2187}
!2188 = metadata !{i64 2188}
!2189 = metadata !{i64 2189}
!2190 = metadata !{i64 2190}
!2191 = metadata !{i64 2191}
!2192 = metadata !{i64 2192}
!2193 = metadata !{i64 2193}
!2194 = metadata !{i64 2194}
!2195 = metadata !{i64 2195}
!2196 = metadata !{i64 2196}
!2197 = metadata !{i64 2197}
!2198 = metadata !{i64 2198}
!2199 = metadata !{i64 2199}
!2200 = metadata !{i64 2200}
!2201 = metadata !{i64 2201}
!2202 = metadata !{i64 2202}
!2203 = metadata !{i64 2203}
!2204 = metadata !{i64 2204}
!2205 = metadata !{i64 2205}
!2206 = metadata !{i64 2206}
!2207 = metadata !{i64 2207}
!2208 = metadata !{i64 2208}
!2209 = metadata !{i64 2209}
!2210 = metadata !{i64 2210}
!2211 = metadata !{i64 2211}
!2212 = metadata !{i64 2212}
!2213 = metadata !{i64 2213}
!2214 = metadata !{i64 2214}
!2215 = metadata !{i64 2215}
!2216 = metadata !{i64 2216}
!2217 = metadata !{i64 2217}
!2218 = metadata !{i64 2218}
!2219 = metadata !{i64 2219}
!2220 = metadata !{i64 2220}
!2221 = metadata !{i64 2221}
!2222 = metadata !{i64 2222}
!2223 = metadata !{i64 2223}
!2224 = metadata !{i64 2224}
!2225 = metadata !{i64 2225}
!2226 = metadata !{i64 2226}
!2227 = metadata !{i64 2227}
!2228 = metadata !{i64 2228}
!2229 = metadata !{i64 2229}
!2230 = metadata !{i64 2230}
!2231 = metadata !{i64 2231}
!2232 = metadata !{i64 2232}
!2233 = metadata !{i64 2233}
!2234 = metadata !{i64 2234}
!2235 = metadata !{i64 2235}
!2236 = metadata !{i64 2236}
!2237 = metadata !{i64 2237}
!2238 = metadata !{i64 2238}
!2239 = metadata !{i64 2239}
!2240 = metadata !{i64 2240}
!2241 = metadata !{i64 2241}
!2242 = metadata !{i64 2242}
!2243 = metadata !{i64 2243}
!2244 = metadata !{i64 2244}
!2245 = metadata !{i64 2245}
!2246 = metadata !{i64 2246}
!2247 = metadata !{i64 2247}
!2248 = metadata !{i64 2248}
!2249 = metadata !{i64 2249}
!2250 = metadata !{i64 2250}
!2251 = metadata !{i64 2251}
!2252 = metadata !{i64 2252}
!2253 = metadata !{i64 2253}
!2254 = metadata !{i64 2254}
!2255 = metadata !{i64 2255}
!2256 = metadata !{i64 2256}
!2257 = metadata !{i64 2257}
!2258 = metadata !{i64 2258}
!2259 = metadata !{i64 2259}
!2260 = metadata !{i64 2260}
!2261 = metadata !{i64 2261}
!2262 = metadata !{i64 2262}
!2263 = metadata !{i64 2263}
!2264 = metadata !{i64 2264}
!2265 = metadata !{i64 2265}
!2266 = metadata !{i64 2266}
!2267 = metadata !{i64 2267}
!2268 = metadata !{i64 2268}
!2269 = metadata !{i64 2269}
!2270 = metadata !{i64 2270}
!2271 = metadata !{i64 2271}
!2272 = metadata !{i64 2272}
!2273 = metadata !{i64 2273}
!2274 = metadata !{i64 2274}
!2275 = metadata !{i64 2275}
!2276 = metadata !{i64 2276}
!2277 = metadata !{i64 2277}
!2278 = metadata !{i64 2278}
!2279 = metadata !{i64 2279}
!2280 = metadata !{i64 2280}
!2281 = metadata !{i64 2281}
!2282 = metadata !{i64 2282}
!2283 = metadata !{i64 2283}
!2284 = metadata !{i64 2284}
!2285 = metadata !{i64 2285}
!2286 = metadata !{i64 2286}
!2287 = metadata !{i64 2287}
!2288 = metadata !{i64 2288}
!2289 = metadata !{i64 2289}
!2290 = metadata !{i64 2290}
!2291 = metadata !{i64 2291}
!2292 = metadata !{i64 2292}
!2293 = metadata !{i64 2293}
!2294 = metadata !{i64 2294}
!2295 = metadata !{i64 2295}
!2296 = metadata !{i64 2296}
!2297 = metadata !{i64 2297}
!2298 = metadata !{i64 2298}
!2299 = metadata !{i64 2299}
!2300 = metadata !{i64 2300}
!2301 = metadata !{i64 2301}
!2302 = metadata !{i64 2302}
!2303 = metadata !{i64 2303}
!2304 = metadata !{i64 2304}
!2305 = metadata !{i64 2305}
!2306 = metadata !{i64 2306}
!2307 = metadata !{i64 2307}
!2308 = metadata !{i64 2308}
!2309 = metadata !{i64 2309}
!2310 = metadata !{i64 2310}
!2311 = metadata !{i64 2311}
!2312 = metadata !{i64 2312}
!2313 = metadata !{i64 2313}
!2314 = metadata !{i64 2314}
!2315 = metadata !{i64 2315}
!2316 = metadata !{i64 2316}
!2317 = metadata !{i64 2317}
!2318 = metadata !{i64 2318}
!2319 = metadata !{i64 2319}
!2320 = metadata !{i64 2320}
!2321 = metadata !{i64 2321}
!2322 = metadata !{i64 2322}
!2323 = metadata !{i64 2323}
!2324 = metadata !{i64 2324}
!2325 = metadata !{i64 2325}
!2326 = metadata !{i64 2326}
!2327 = metadata !{i64 2327}
!2328 = metadata !{i64 2328}
!2329 = metadata !{i64 2329}
!2330 = metadata !{i64 2330}
!2331 = metadata !{i64 2331}
!2332 = metadata !{i64 2332}
!2333 = metadata !{i64 2333}
!2334 = metadata !{i64 2334}
!2335 = metadata !{i64 2335}
!2336 = metadata !{i64 2336}
!2337 = metadata !{i64 2337}
!2338 = metadata !{i64 2338}
!2339 = metadata !{i64 2339}
!2340 = metadata !{i64 2340}
!2341 = metadata !{i64 2341}
!2342 = metadata !{i64 2342}
!2343 = metadata !{i64 2343}
!2344 = metadata !{i64 2344}
!2345 = metadata !{i64 2345}
!2346 = metadata !{i64 2346}
!2347 = metadata !{i64 2347}
!2348 = metadata !{i64 2348}
!2349 = metadata !{i64 2349}
!2350 = metadata !{i64 2350}
!2351 = metadata !{i64 2351}
!2352 = metadata !{i64 2352}
!2353 = metadata !{i64 2353}
!2354 = metadata !{i64 2354}
!2355 = metadata !{i64 2355}
!2356 = metadata !{i64 2356}
!2357 = metadata !{i64 2357}
!2358 = metadata !{i64 2358}
!2359 = metadata !{i64 2359}
!2360 = metadata !{i64 2360}
!2361 = metadata !{i64 2361}
!2362 = metadata !{i64 2362}
!2363 = metadata !{i64 2363}
!2364 = metadata !{i64 2364}
!2365 = metadata !{i64 2365}
!2366 = metadata !{i64 2366}
