#!/bin/bash


## Pass positional variable(s)
NTHREADS=$1
NTHREADS="${NTHREADS:=12}"
echo "Processing with $NTHREADS thread(s)." 

echo "Running changeo workflow." 

## Create folders
mkdir /mnt/0/output_changeo

AssignGenes.py igblast -s /mnt/0/output_c3poa_postprocessing/R2C2_full_length_consensus_reads.fasta -b /app/share/igblast --organism human --loci ig --format blast

MakeDb.py igblast 	-i HD13M.fmt7 \
					-s HD13M.fasta \
					-r IMGT_Human_IGHV.fasta IMGT_Human_IGHD.fasta IMGT_Human_IGHJ.fasta \
					--extended

echo "Done!"							
# Exit the script
exit
