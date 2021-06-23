#!/bin/bash


## Create folders
mkdir /mnt/0/input_pre
mkdir /mnt/0/output_c3poa

## Concatenate all fastq files of the sample to one
cat /mnt/0/*.fastq > /mnt/0/input_pre/all.fastq

## Run the C3POa script
cd /app/C3POa/
python3 /app/C3POa/C3POa.py -r /mnt/0/input_pre/all.fastq \
							-s /app/data/UMI_Splints.fasta \
							-o /mnt/0/output_c3poa \
							-c /app/config_c3poa.cfg \
							-l 1000 \
							-d 500 \
							-n 12 \
							-g 1000 \
							-z
				
## Remove concatenated fastq file
rm -r /mnt/0/input_pre



## Create folder
mkdir /mnt/0/output_c3poa_postprocessing


## Run the postprocessing script
python3 /app/C3POa/C3POa_postprocessing.py -i /mnt/0/output_c3poa/UMI_Splint_1/R2C2_Consensus.fasta \
							-o /mnt/0/output_c3poa_postprocessing \
							-c /app/config_c3poa.cfg \
							-a /app/data/Smartseq_adapter.fasta \
							-n 12 \
							-g 1000 \
							-u \
							-t

# Exith the script
exit
