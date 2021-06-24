#!/bin/bash


## Create folders
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
