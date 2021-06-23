#!/bin/bash


## Create folders
mkdir /mnt/0/output_mandalorion

## Run the Mandalorion script
cd /app/mandalorion
python3 /app/mandalorion/Mandalorion.py -c /app/config_mandalorion.cfg \
										-p /mnt/0/output_mandalorion \
										-g /mnt/1/gencode.v29.annotation.gtf \
										-G /mnt/1/hg38.fa \
										-a /app/data/Smartseq_adapter.fasta \
										-f /mnt/0/output_c3poa/UMI_Splint_1/R2C2_Consensus.fasta \
										-b /mnt/0/output_c3poa/UMI_Splint_1/R2C2_Subreads.fastq \
										-R 2 \
										-t 4

# Exith the script
exit
