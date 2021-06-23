#!/bin/bash


## Pass positional variable(s)
echo "Running samtools." 


## Create folders
mkdir /mnt/0/output_samtools


## Run the script
/app/samtools-1.12/samtools view -Su /mnt/0/output_minimap2/out.SAM | samtools sort - /mnt/0/output_samtools/alns.sorted


echo "done!"							
# Exit the script
exit
