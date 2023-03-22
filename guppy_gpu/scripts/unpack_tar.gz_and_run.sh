#!/bin/bash

DATAPATH=$1
SBATCHFILE=$2

## Untar and decompress fast5 files to $DATAPATH/tmp/
print "Creating directories for fast5 files and reports..."
mkdir -p $DATAPATH/tmp/
mkdir -p $DATAPATH/tmp_fast5/
mkdir -p $DATAPATH/reports/

print "Start decompressing fast5 files..."
tar -xzvf $DATAPATH/*.tar.gz -C $DATAPATH/tmp/

print "Sort files into appropriate folders..."
find $DATAPATH/ -iname *.csv -exec mv {} $DATAPATH/reports/ \;
find $DATAPATH/ -iname *.pdf -exec mv {} $DATAPATH/reports/ \;
find $DATAPATH/ -iname *.html -exec mv {} $DATAPATH/reports/ \;
find $DATAPATH/ -iname *.fast5 -exec mv {} $DATAPATH/tmp_fast5/ \;


# Run sbtach file (make sure the file is configured correctly)
sbatch $SBATCHFILE