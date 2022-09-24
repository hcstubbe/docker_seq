#!/bin/bash

GUPPYSCRIPT=$1


## Untar and decompress fast5 files to /data/tmp/
mkdir -p /data/tmp/
mkdir -p /data/tmp_fast5/
mkdir -p /data/reports/
tar -xzf /data/*.tar.gz -C /data/tmp/
find /data/tmp/ -iname *.pdf -exec mv {} /data/reports/ \;
find /data/tmp/ -iname *.fast5 -exec mv {} /data/tmp_fast5/ \;
rm -r /data/tmp/
mkdir -p /data/basecalled/


## Run the basecaller
guppy_basecaller -i /data/tmp_fast5/ -s /data/basecalled/ -c $GUPPYSCRIPT -x "cuda:0"


## Remove the unzipped fast5 files
rm -r /data/tmp_fast5/
