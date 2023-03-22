#!/bin/bash

GUPPYCFG=$1

## Create output folder
mkdir -p /mnt/data/basecalled/


## Run the basecaller
guppy_basecaller -i /mnt/data/tmp_fast5/ -s /mnt/data/basecalled/ -c $GUPPYCFG --do_read_splitting -x "cuda:0"


## Do NOT remove the fast5 files
# rm -r /mnt/data/tmp_fast5/
