#!/bin/bash


## Pass positional variable(s)
NTHREADS=$1
NTHREADS="${NTHREADS:=4}"
echo "Processing with $NTHREADS thread(s)." 

echo "Running minimap2." 

## Create folders
mkdir /mnt/0/output_minimap2


## Run the postprocessing script
minimap2 -G 400k --secondary=no -ax splice:hq -t $NTHREADS /mnt/1/hg38.fa /mnt/0/output_c3poa_postprocessing/R2C2_full_length_consensus_reads.fasta > /mnt/0/output_minimap2/out.SAM  


echo "Running samtools." 


## Create folders
mkdir /mnt/0/output_samtools


## Run the script
samtools view -Su /mnt/0/output_minimap2/out.SAM | samtools sort - /mnt/0/output_samtools/alns.sorted.BAM


echo "Running stringtie." 
mkdir /mnt/0/output_stringtie

stringtie /mnt/0/output_samtools/alns.sorted.BAM -o mkdir /mnt/0/output_stringtie/out.gtf

echo "done!"							
# Exit the script
exit
