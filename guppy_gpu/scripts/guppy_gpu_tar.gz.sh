#!/bin/bash

GUPPYCFG=$1

print "Create folder for bascalled files"
mkdir -p /mnt/data/basecalled/


## Run the basecaller
print "Running basecaller..."
guppy_basecaller -i /mnt/data/tmp_fast5/ -s /mnt/data/basecalled/ -c $GUPPYCFG --do_read_splitting -x "cuda:0"


## Remove the unzipped fast5 files
print "Removing tmp_fast5 folder"
rm -r /mnt/data/tmp_fast5/
