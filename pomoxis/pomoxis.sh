#!/bin/bash

## Pass positional variable(s)
NTHREADS=$1
NTHREADS="${NTHREADS:=12}"
echo "Processing with $NTHREADS thread(s)." 

## Run pomoxis program mini_assemble
echo "Running pmoxis tools: mini_assemble" 
mkdir /mnt/0/output_pomoxis_mapping

mini_assemble  -i /mnt/0/output_bonito/all.fastq
               -r /mnt/1/hg38.fa \
               -o /mnt/0/output_mini_assemble/ \
               -t $NTHREADS
