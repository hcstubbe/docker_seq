#!/bin/bash


## Pass positional variable(s)
NTHREADS=$1
NTHREADS="${NTHREADS:=12}"
echo "Processing with $NTHREADS thread(s)." 

echo "Running PyIR." 

## Create folders
mkdir /mnt/0/tmp_pyir
mkdir /mnt/0/output_pyir

pyir /mnt/0/output_c3poa_postprocessing/R2C2_full_length_consensus_reads.fasta -m $NTHREADS --tmp_dir /mnt/0/tmp_pyir --enable_filter --outfmt tsv --out /mnt/0/output_pyir/pyir.csv 

rm -r /mnt/0/tmp_pyir

echo "Done!"							
# Exit the script
exit
