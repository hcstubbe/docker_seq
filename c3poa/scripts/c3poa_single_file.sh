#!/bin/bash


## Pass positional variables
NTHREADS=$1
NTHREADS="${NTHREADS:=1}"
echo "Processing with $NTHREADS thread(s)." 

LENGHT=$2
LENGHT="${LENGHT:=1000}"
echo "The minimal read length is set to $LENGHT bp." 

DISTANCE=$3
DISTANCE="${DISTANCE:=500}"
echo "The minimum distance between peaks/minimum insert size is set to $DISTANCE bp."

GROUPSIZE=$4
GROUPSIZE="${GROUPSIZE:=1000}"
echo "The groupsize is set to $GROUPSIZE." 

echo "Excluding zero repeat reads."



## Create folders
mkdir /mnt/0/input_pre
mkdir /mnt/0/output_c3poa



# NOTE : Quote it else use array to avoid problems #
FILES="/mnt/0/*.fastq"
for f in $FILES
do
  echo "Processing $f file..."
  # take action on each file. $f store current file name
  cat "$f" > /mnt/0/input_pre/all.fastq
  
  
  ## Run the C3POa script
  cd /app/C3POa/
  python3 /app/C3POa/C3POa.py -r /mnt/0/input_pre/all.fastq \
  							-s /app/data/UMI_Splints.fasta \
  							-o /mnt/0/output_c3poa \
  							-c /app/config_c3poa.cfg \
  							-l $LENGHT \
  							-d $DISTANCE \
  							-n $NTHREADS \
  							-g $GROUPSIZE \
  							-z
  
  ## Concatenate fasta/fastq files
  cat /mnt/0/output_c3poa/UMI_Splint_1/*.fasta > /mnt/0/output_c3poa/UMI_Splint_1/R2C2_Consensus.tmp.fasta
  cat /mnt/0/output_c3poa/UMI_Splint_1/*.fastq > /mnt/0/output_c3poa/UMI_Splint_1/R2C2_Subreads.tmp.fastq
  
  ## Rename 
  mv /mnt/0/output_c3poa/UMI_Splint_1/R2C2_Consensus.tmp.fasta /mnt/0/output_c3poa/UMI_Splint_1/R2C2_Consensus.out.fasta
  mv /mnt/0/output_c3poa/UMI_Splint_1/R2C2_Subreads.tmp.fastq /mnt/0/output_c3poa/UMI_Splint_1/R2C2_Subreads.out.fastq
  
  ## Remove 
  rm /mnt/0/input_pre/all.fastq
  rm /mnt/0/output_c3poa/tmp/*
  rm /mnt/0/output_c3poa/UMI_Splint_1/R2C2_Consensus.fasta
  rm /mnt/0/output_c3poa/UMI_Splint_1/R2C2_Subreads.fastq
  
done


## Remove concatenated fastq file folder
rm -r /mnt/0/input_pre



## Create folders
mkdir /mnt/0/output_c3poa_postprocessing


## Run the postprocessing script
python3 /app/C3POa/C3POa_postprocessing.py -i /mnt/0/output_c3poa/UMI_Splint_1/R2C2_Consensus.out.fasta \
							-o /mnt/0/output_c3poa_postprocessing \
							-c /app/config_c3poa.cfg \
							-a /app/data/Smartseq_adapter.fasta \
							-n $NTHREADS \
							-g $GROUPSIZE \
							-t \
							-u
							
# Exith the script
exit
