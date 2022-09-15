#!/bin/bash


## Pass positional variable(s)
NTHREADS=$1
NTHREADS="${NTHREADS:=12}"
INPUTFILE=$2
OUTPUTFILE=$3
echo "Processing $INPUTFILE with $NTHREADS thread(s). Output: $OUTPUTFILE" 

echo "Running minimap2." 


## Run the aligner with correct optios for Stringtie2
minimap2 -G 400k -ax splice:hq -uf -t $NTHREADS /mnt/1/hg38.fa /mnt/0/$INPUTFILE > /mnt/0/$OUTPUTFILE.SAM  


echo "Running samtools." 

## Run the script
# samtools view -Su /mnt/0/output_minimap2/out.SAM | samtools sort /mnt/0/output_samtools/alns.sorted.BAM
samtools view -Su /mnt/0/$OUTPUTFILE.SAM | samtools sort -o /mnt/0/$OUTPUTFILE.alns.sorted.BAM

echo "Running stringtie." 

# run stringtie first time
stringtie   -p $NTHREADS \
            -G /mnt/1/gencode.v29.annotation.gtf \
            -o /mnt/0/$OUTPUTFILE.stringtie.gtf \
            -l STRG \
            -L \
            -v \
            /mnt/0/$OUTPUTFILE.alns.sorted.BAM

echo "done!"							
# Exit the script
exit
