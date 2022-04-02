# pin -t ../obj-intel64/instcount.so -- ./blackscholes 1 in_16K.txt output.txt
pin -t ../obj-intel64/faultinjection.so -fioption AllInst -- ./blackscholes 1 in_16K.txt output.txt