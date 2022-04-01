from distutils.debug import DEBUG
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

DEBUG_FLAG = True

COMPILE_ALL = False

COMPILE_BENCHMARK_LIST = ['bfs2', 'blackscholes', 'histo', 'sad', 'spmv', 'stencil', 'susan', 'tpacf', 'hpccg', 'EP']

RUNNING_TIME = 143
print("DBF RUNNING TIME: ", RUNNING_TIME)

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

def select_filename(file_dir):
    instruction_file_abspath_list = []
    for root, dirs, fileList in os.walk(file_dir):   
        # print(root) #当前目录路径
        # print(dirs) #当前路径下所有子目录

        for file in fileList:
            if file.find(".ll") != -1:
                for select_bm_name in COMPILE_BENCHMARK_LIST:
                    if file.find(select_bm_name) != -1:
                    # if file.find(".ll") != -1 and file.find("-") == -1:
                        # print(root + str("/") + file)
                        instruction_file_abspath_list.append(root + str("/") + file)
        # if files[0].index("all_seed"):
        #     print(files) #当前路径下所有非目录子文件    return all_seed_list
    return list(set(instruction_file_abspath_list))

if __name__=="__main__":    
    if DEBUG_FLAG == True:
        os.system("rm -rf " + FAULT_INJECTION_PATH + "/*")
    
    reference_data_instruction_file_set = set(os.listdir(REFERENCE_DATA_PATH))
    print(reference_data_instruction_file_set)
    if COMPILE_ALL == True:
        print("use all benchmarks")
        instruction_file_abspath_list = filename(BENCHMARK_PATH)
    else:
        print("select benchmarks!")
        instruction_file_abspath_list = select_filename(BENCHMARK_PATH)
    pprint(instruction_file_abspath_list)
    
    os.listdir(FAULT_INJECTION_PATH) 
    for instruction_file_abspath in instruction_file_abspath_list:
        instruction_file_current_path = '/'.join(instruction_file_abspath.split("/")[0:-1])
        os.chdir(instruction_file_current_path)
        # print(instruction_file_current_path)
        instruction_file_name = instruction_file_abspath.split("/")[-1]
        # print(instruction_file_name)
        
        # Compile Files
        cmd_compile = "clang++ " + instruction_file_abspath + " -O0  -o " + instruction_file_name.split(".ll")[0]
        # print(cmd_compile)
        os.system(cmd_compile)
        
        # # remove dir 
        # cmd_rm_dir =  "mv " + FAULT_INJECTION_PATH + "/" + instruction_file_name.split(".ll")[0] + " /tmp"
        # print(cmd_rm_dir)
        # os.system(cmd_rm_dir)
        
        # mkdir in fault_injection_path
        cmd_mkdir = "mkdir " + FAULT_INJECTION_PATH + "/" + instruction_file_name.split(".ll")[0]
        # print(cmd_mkdir)
        os.system(cmd_mkdir)
        
        # mv binary file
        cmd_cp_program = "mv " + instruction_file_current_path + "/" + instruction_file_name.split(".ll")[0] + " " + FAULT_INJECTION_PATH + "/" + instruction_file_name.split(".ll")[0] 
        # print(cmd_cp_program)
        os.system(cmd_cp_program) 
        
        # # cp common files
        cmd_common_files = "cp " + COMMON_FILES_PATH + "/clear.sh " + COMMON_FILES_PATH + "/measure.py " + FAULT_INJECTION_PATH + "/" + instruction_file_name.split(".ll")[0]
        print(cmd_common_files)
        os.system(cmd_common_files)

        # The first time to run
        # current_instruction_reference_scripts_path = REFERENCE_SCRIPTS_PATH + "/" + instruction_file_name.split(".")[0].split("-")[0] 
        # os.system("cp " + EXAMPLE_PATH + "/faultinject.py " + current_instruction_reference_scripts_path +  "/faultinject.py "  )

        # cp specific files
        current_instruction_reference_scripts_path = REFERENCE_SCRIPTS_PATH + "/" + instruction_file_name.split(".")[0].split("-")[0] 
        cmd_cp_others = "cp " + current_instruction_reference_scripts_path +  "/faultinject.py "  + FAULT_INJECTION_PATH + "/" + instruction_file_name.split(".ll")[0]
        # print(cmd_cp_others)
        os.system(cmd_cp_others)


        # read args
        with open(current_instruction_reference_scripts_path + "/args.txt", "r") as fp:
            args = fp.read().strip()
            print(args)
        
        # write args
        if "hpccg" in instruction_file_name.split(".ll")[0]:
           python_scripts_str = "python3 ./faultinject.py ./" + instruction_file_name.split(".ll")[0] + ' "' + args + '" ' +  str(15) 
        else:
            if len(args) != 0:
                python_scripts_str = "python3 ./faultinject.py ./" + instruction_file_name.split(".ll")[0] + ' "' + args + '" ' + str(RUNNING_TIME)
            else:
                python_scripts_str = "python3 ./faultinject.py ./" + instruction_file_name.split(".ll")[0] + ' " " ' +  str(RUNNING_TIME)
        print("runFaultInject.sh String: ", python_scripts_str)
        
        with open(FAULT_INJECTION_PATH + "/" + instruction_file_name.split(".ll")[0]  + "/runFaultInject.sh", "w") as fp:
            fp.write(python_scripts_str)
 
                
        # cp specific data 
        if instruction_file_name.split(".")[0].split("-")[0] in reference_data_instruction_file_set:
            print("move data!")
            print(instruction_file_name.split(".")[0].split("-")[0])
            cmd_cp_specific_data ="cp " + REFERENCE_DATA_PATH + "/" + instruction_file_name.split(".")[0].split("-")[0] + "/* " + FAULT_INJECTION_PATH + "/" + instruction_file_name.split(".ll")[0] 
            print(cmd_cp_specific_data)
            os.system(cmd_cp_specific_data)
        
    os.listdir(FAULT_INJECTION_PATH)