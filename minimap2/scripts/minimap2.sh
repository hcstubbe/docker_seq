#!/bin/bash


## Pass positional variable(s)
NTHREADS=$1
NTHREADS="${NTHREADS:=4}"
echo "Processing with $NTHREADS thread(s)." 


## Create folders
mkdir /mnt/0/output_minimap2


## Run the postprocessing script
minimap2 -G 400k --secondary=no -ax splice:hq -t $NTHREADS /mnt/1/hg38.fa /mnt/0/output_c3poa_postprocessing/R2C2_full_length_consensus_reads.fasta > /mnt/0/output_minimap2/out.SAM  

echo "done!"							
# Exith the script
exit
