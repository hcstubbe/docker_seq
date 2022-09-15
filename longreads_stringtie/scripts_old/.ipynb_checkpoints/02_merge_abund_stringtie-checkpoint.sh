#!/bin/bash


## Pass positional variable(s)
NTHREADS=$1
NTHREADS="${NTHREADS:=12}"
INPUTFOLDER=$2
OUTPUTFOLDER=$3
echo "Processing with $NTHREADS thread(s) files in $INPUTFOLDER (and subfolders). Results are saved in $OUTPUTFOLDER" 


echo "Running stringtie --merge"

find $INPUTFOLDER -iname out.gtf > $OUTPUTFOLDER/mergelist.txt

# Merge transcripts from all samples
stringtie   --merge \
-p $NTHREADS \
-G /mnt/1/gencode.v29.annotation.gtf \
-o $OUTPUTFOLDER/stringtie_merged.gtf \
-L \
-v \
$OUTPUTFOLDER/mergelist.txt

echo "Running stringtie counting abundancies"	

# Estimate transcript abundances and create table counts for Ballgown
find /mnt/0/ -mindepth 1 -maxdepth 1 -type d -exec stringtie -e -B -L -p $NTHREADS -G /mnt/0/output_stringtie_merge/stringtie_merged.gtf -o {}/input_ballgown/abund.gtf {}/output_samtools/alns.sorted.BAM \;



echo "done!"

# Exit the script
exit
