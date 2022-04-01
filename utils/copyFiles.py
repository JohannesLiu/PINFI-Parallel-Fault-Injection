import os
from pprint import pprint

ROOT_PATH = "/home/liuxk/CLionProjects/PIN-v3.5/source/tools/PINFI-DBF-V1"
BENCHMARK_PATH = ROOT_PATH + "/benchmarks"
EXAMPLE_PATH = ROOT_PATH + "/example"
FAULT_INJECTION_PATH = ROOT_PATH + "/fault_injection"
REFERENCE_DATA_PATH = ROOT_PATH + "/reference_data"
REFERENCE_SCRIPTS_PATH = ROOT_PATH + "/reference_scripts"

COMMON_FILES_PATH = ROOT_PATH + "/common_files"

UTIL_PATH = ROOT_PATH + "/utils/"

if __name__ == "__main__":
    fault_injection_name_list = os.listdir(FAULT_INJECTION_PATH)
    fault_injection_path_list = fault_injection_name_list 
    for idx in range(len(fault_injection_name_list)):
        print(FAULT_INJECTION_PATH + "/" + fault_injection_name_list[idx])
        os.system("cp " + EXAMPLE_PATH + "/measure.py " +  FAULT_INJECTION_PATH + "/" + fault_injection_name_list[idx])
        os.system("cp " + EXAMPLE_PATH + "/measure-outfile.py " +  FAULT_INJECTION_PATH + "/" + fault_injection_name_list[idx])
    
    