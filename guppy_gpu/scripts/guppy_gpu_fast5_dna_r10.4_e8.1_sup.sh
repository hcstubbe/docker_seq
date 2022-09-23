#!/bin/bash

##### FAST5 FILES WILL BE Deleted (SEE LINE 16)!!! ####

## Move fast5 files to /data/tmp/
mkdir -p /data/tmp_fast5/
find /data/ -iname *.fast5 -exec mv {} /data/tmp_fast5/ \;
mkdir -p /data/basecalled/


## Run the basecaller
guppy_basecaller -i /data/tmp_fast5/ -s /data/basecalled/ -c dna_r10.4_e8.1_sup.cfg -x "cuda:0"


## Remove the fast5 files
rm -r /data/tmp_fast5/
