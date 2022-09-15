#!/bin/bash


## Pass positional variable(s)
NTHREADS=$1
NTHREADS="${NTHREADS:=12}"
INPUTFOLDER=$2
echo "Processing with $NTHREADS thread(s) .stringtie.gtf files in $INPUTFOLDER (and subfolders)." 

echo "Running stringtie --merge"

find $INPUTFOLDER -iname *.stringtie.gtf > $INPUTFOLDER/mergelist.txt

# Merge transcripts from all samples
stringtie   --merge \
-p $NTHREADS \
-G /mnt/1/gencode.v29.annotation.gtf \
-o $INPUTFOLDER/stringtie02_merged.gtf \
-L \
-v \
$INPUTFOLDER/mergelist.txt


echo "Running stringtie counting abundancies"	

# Estimate transcript abundances and create table counts for Ballgown
find $INPUTFOLDER -mindepth 1 -iname *.alns.sorted.BAM -exec stringtie -e -B -L -p $NTHREADS -G  $OUTPUTFOLDER/stringtie02_merged.gtf -o {}.stringtie03.abund.gtf {} \;



echo "done!"

# Exit the script
exit
