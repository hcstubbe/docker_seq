#!/bin/bash


## Unzip fast5 files to /data/tmp/
mkdir -p /data/tmp/
mkdir -p /data/tmp_fast5/
unzip /data/*.zip -d /data/tmp/
find /data/tmp/ -iname *.fast5 -exec mv {} /data/tmp_fast5/ \;
rm -r /data/tmp/
mkdir -p /data/basecalled/


## Run the basecaller
guppy_basecaller -i /data/tmp_fast5/ -s /data/basecalled/ -c dna_r10.4_e8.1_sup.cfg -x "cuda:0"


## Remove the unzipped fast5 files
rm -r /data/tmp_fast5/
