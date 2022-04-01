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
            if file.find(".ll") != -1:
            # if file.find(".ll") != -1 and file.find("-") == -1:
                # print(root + str("/") + file)
                instruction_file_abspath_list.append(root + str("/") + file)
        # if files[0].index("all_seed"):
        #     print(files) #当前路径下所有非目录子文件    return all_seed_list
    return list(set(instruction_file_abspath_list))


def worker(program_name):
    os.chdir(FAULT_INJECTION_PATH + "/" + program_name)
    print(os.getcwd())
    os.system("bash runFaultInject.sh")
    os.chdir(ROOT_PATH)
    return "success with " + program_name
    
    
if __name__=="__main__":
    os.chdir(ROOT_PATH)
    # bechmark_name_list = ["fft", "fft2", "xsbench", "stringsearch", "qsort"]
    # bechmark_name_list = ["basicmath", "bfs2", "blackscholes", "CG", "crc32", "dijkstra", "EP", "fft", "fft2", "histo", "hpccg", "ifft2", "IS", "patricia", "qsort", "sad", "spmv", "stencil", "stringsearch", "susan", "tpacf", "xsbench"]
    bechmark_name_list = ['bfs2', 'blackscholes', 'histo', 'sad', 'spmv', 'stencil', 'susan', 'tpacf', 'hpccg', 'EP']
    program_name_list = []
    # instruction_file_abspath_list = filename(BENCHMARK_PATH)
    
    level_list = ["", "0.3", "0.5", "0.7", "1.0", "oridup"]
    # level_list = [""]
    for bechmark_name in bechmark_name_list:
        for level in level_list:
            if level != "":
                program_name_list.append(bechmark_name + "-" + level)
            else:
                program_name_list.append(bechmark_name )    
    print(program_name_list)

    with Pool(processes=len(program_name_list)) as pool:
        for result in pool.imap_unordered(worker, program_name_list):
            print(result)
