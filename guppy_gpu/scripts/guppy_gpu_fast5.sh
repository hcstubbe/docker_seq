#!/bin/bash

GUPPYSCRIPT=$1

find . -type f -name "*dna_r10.4.1_e8.2_260bps*" > /mnt/data/models.txt

## Move fast5 files to /mnt/data/tmp/
mkdir -p /mnt/data/tmp_fast5/
mkdir -p /mnt/data/reports/
find /mnt/data/ -iname *.pdf -exec mv {} /mnt/data/reports/ \;
find /mnt/data/ -iname *.html -exec mv {} /mnt/data/reports/ \;
find /mnt/data/ -iname *.fast5 -exec mv {} /mnt/data/tmp_fast5/ \;
mkdir -p /mnt/data/basecalled/


## Run the basecaller
guppy_basecaller -i /mnt/data/tmp_fast5/ -s /mnt/data/basecalled/ -c $GUPPYSCRIPT -x "cuda:0" --do_read_splitting


## Do NOT remove the fast5 files
# rm -r /mnt/data/tmp_fast5/
