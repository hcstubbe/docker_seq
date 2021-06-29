#!/bin/bash


## Pass positional variable(s)
NTHREADS=$1
NTHREADS="${NTHREADS:=12}"
echo "Processing with $NTHREADS thread(s)." 

echo "Running PyIR." 

## Create folders
mkdir /mnt/0/output_pyir
mkdir /mnt/0/tmp_pyir

pyir /mnt/0/output_c3poa/UMI_Splint_1/R2C2_Consensus.fasta -m $NTHREADS --tmp_dir /mnt/0/tmp_pyir 


echo "done!"							
# Exit the script
exit
