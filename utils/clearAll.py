import os
from multiprocessing import Pool
from pprint import pprint


ROOT_PATH = "/home/liuxk/CLionProjects/PIN-v3.5/source/tools/PINFI-DBF-V1"
BENCHMARK_PATH = ROOT_PATH + "/benchmarks"
EXAMPLE_PATH = ROOT_PATH + "/example"
FAULT_INJECTION_PATH = ROOT_PATH + "/fault_injection"
REFERENCE_DATA_PATH = ROOT_PATH + "/reference_data"
REFERENCE_SCRIPTS_PATH = ROOT_PATH + "/reference_scripts"

COMMON_FILES_PATH = ROOT_PATH + "/common_files"

UTIL_PATH = ROOT_PATH + "/utils/"


def filename(file_dir):
    instruction_file_abspath_list = []
    for root, dirs, fileList in os.walk(file_dir):   
        # print(root) #当前目录路径
        # print(dirs) #当前路径下所有子目录

        for file in fileList:
            # if file.find(".ll") != -1 and file.find("1.0") == -1:
            if file.find(".ll") != -1 and file.find("-") == -1:
                # print(root + str("/") + file)
                instruction_file_abspath_list.append(root + str("/") + file)
        # if files[0].index("all_seed"):
        #     print(files) #当前路径下所有非目录子文件    return all_seed_list
    return instruction_file_abspath_list

def get_benchmark_name(directory_dir):
    benchmark_name_list = []
    directory_abspath_list = os.listdir(FAULT_INJECTION_PATH)
    for directory_abspath in directory_abspath_list:
        benchmark_name_list.append(directory_abspath)
    return benchmark_name_list

def worker(program_name):
    os.chdir(FAULT_INJECTION_PATH + "/" + program_name)
    os.system("bash clear.sh")
    os.chdir(ROOT_PATH)
    return "success with " + program_name
    
    
if __name__=="__main__":
    os.chdir(ROOT_PATH)
    # benchmark_name_list = ["fft", "fft2", "xsbench", "stringsearch", "qsort"]

    benchmark_name_list = get_benchmark_name(FAULT_INJECTION_PATH) 
    print(benchmark_name_list)
    
    program_name_list = []
    # level_list = ["", "0.3", "0.5", "0.7"]
    level_list = [""]

    for bechmark_name in benchmark_name_list:
        for level in level_list:
            if level != "":
                program_name_list.append(bechmark_name + "-" + level)
            else:
                program_name_list.append(bechmark_name )    
    print(program_name_list)

    with Pool(processes=len(program_name_list)) as pool:
        for result in pool.imap_unordered(worker, program_name_list):
            print(result)
