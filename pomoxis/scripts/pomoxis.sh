#!/bin/bash

## Pass positional variable(s)
NTHREADS=$1
NTHREADS="${NTHREADS:=12}"
echo "Processing with $NTHREADS thread(s)." 

## Run pomoxis programs

# De novo assembly
echo "Running pmoxis tools: mini_assemble" 
mkdir /mnt/0/output_mini_assemble
mini_assemble  -i /mnt/0/output_bonito/all.fastq
               -o /mnt/0/output_mini_assemble/ \
               -t $NTHREADS
               
               
              
# Alining reads
echo "Running pmoxis tools: mini_align" 
mkdir /mnt/0/output_mini_align
mini_align  -i /mnt/0/output_bonito/all.fastq
            -o /mnt/0/output_mini_align/ \
            -t $NTHREADS \
            -r /mnt/1/hg38.fa \
            -n
               
               
echo "Done!               
