#!/bin/bash


## Pass positional variables
RUNNAME=$1


## Unzip fast5 files to /data/tmp/
mkdir -p /data/$RUNNAME/tmp/
mkdir -p /data/$RUNNAME/fast5/
unzip /data/*.zip -d /data/$RUNNAME/tmp/
find /data/$RUNNAME/tmp/ -iname *.fast5 -exec mv {} /data/$RUNNAME/fast5/ \;
rm -r /data/$RUNNAME/tmp/
mkdir -p /data/$RUNNAME/basecalled/


## Run the basecaller
guppy_basecaller -i /data/$RUNNAME/fast5/ -s /data/$RUNNAME/basecalled/ -c dna_r10.4_e8.1_sup.cfg -x "cuda:0"


## Remove the unzipped fast5 files
rm -r /data/$RUNNAME/fast5/
