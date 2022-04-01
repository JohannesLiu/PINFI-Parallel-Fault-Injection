import os
import sys
import filecmp

print("\nBegin\n")

# set directory variables
curdir = os.path.dirname(os.path.realpath(__file__))
std_output = curdir + "/prog_output"
file_output = curdir + "/file_output"
baseline = curdir + "/baseline"
errdir = curdir + "/error_output"
bm_name = curdir.split("/")[-1].split(".ll")[0].split("-")[0]

# read golden output from ./baseline/golden_std_output
print ("Reading golden output...")
file_gld_out = baseline + "/golden_output"
print ("Complete.\n")

# read filenames from ./std_output
print ("Reading filenames...")
files = os.listdir(std_output)
run_count = len(files)
print ("Complete. " + str(run_count) + " fault injection runs were performed\n")


inputDict = {
    "fft": 1,
    "blackscholes": 0,
    "CG": 1,
    "EP": 1,
    "IS": 1,
    "basicmath": 1,
    "qsort": 1,
    "susan": 0,
    "dijkstra": 1,
    "patricia": 1,
    "stringsearch": 1,
    "crc32": 1,
    "fft2": 1,
    "ifft2": 1,
    "bfs2": 0,
    "histo": 0,
    "sad": 0,
    "spmv": 0,
    "stencil": 0,
    "tpacf": 0,
    "hpccg": 1,
    "xsbench": 1
}

def check_output_files():
    if inputDict[bm_name]:
        print("STANDARD PROGRAM OUTPUT")
        return True 
    print("FILEOUTPUT")
    return False



def get_SDC_rate_perinst():
    # check for SDCs
    sdc_count = 0
    benign_count = 0
    crash_count = 0
    hang_count = 0

    # isStandardOutput = check_output_files()
    
    print ("Checking files...")
    for f in range(0, run_count):
        # print ("Checking fault injection run " + str(f) + "...\r")
        file_out = file_output + "/output-" + str(f)

        try:
            file_err = open(errdir + "/errorfile-" + str(f))
            error_msg = file_err.read()
            file_err.close()
        except FileNotFoundError:   # no error output
            error_msg = ""

        try:
            file_out_content = open(file_out)
            file_output_txt = ""
            file_out_content.close()
        except IOError: # no error output
            file_output_txt = "YAFANOUTPUT!"
        
        if ("hang" in error_msg):
            hang_count += 1
        elif ("crash" in error_msg):
            crash_count += 1
        elif("YAFAN" in file_output_txt):
            sdc_count += 1
        elif(filecmp.cmp(file_out, file_gld_out)):
            benign_count += 1
        else:
            sdc_count += 1
    print ("Complete.\r")
    return sdc_count, crash_count, benign_count, hang_count, run_count

if __name__ == "__main__":
    print("Benchmark Name: ", bm_name)
    # print results
    sdc_count, crash_count, benign_count, hang_count, run_count = get_SDC_rate_perinst()
    print ("\n")
    print ("running count = " + str(run_count))
    print ("SDC count     = " + str(sdc_count))
    print ("Crash count   = " + str(crash_count))
    print ("Benign count  = " + str(benign_count))
    print ("Hang count    = " + str(hang_count))
    print ("Total Fi runs = " + str(run_count))
    print ("SDC rate:     = " + str(float(sdc_count)/float(run_count)) )
