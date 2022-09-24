#!/bin/bash

GUPPYSCRIPT=$1


## Move fast5 files to /data/tmp/
mkdir -p /data/tmp_fast5/
mkdir -p /data/reports/
find /data/ -iname *.pdf -exec mv {} /data/reports/ \;
find /data/ -iname *.fast5 -exec mv {} /data/tmp_fast5/ \;
mkdir -p /data/basecalled/


## Run the basecaller
guppy_basecaller -i /data/tmp_fast5/ -s /data/basecalled/ -c $GUPPYSCRIPT -x "cuda:0"


## Do NOT remove the fast5 files
# rm -r /data/tmp_fast5/
