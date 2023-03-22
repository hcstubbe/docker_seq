#!/bin/bash

DATAPATH=/dss/dssfs02/lwp-dss-0001/u7x81/u7x81-dss-0000/ru75jul2/seq_data/ir_seq/pcc_r1041
SBATCHFILE=./run_dna_r10.4.1_e8.2_sup.sbatch

## Untar and decompress fast5 files to $DATAPATH/tmp/
echo "Creating directories for fast5 files and reports..."
mkdir -p $DATAPATH/tmp/
mkdir -p $DATAPATH/tmp_fast5/
mkdir -p $DATAPATH/reports/

echo "Start decompressing fast5 files..."
tar -xzvf $DATAPATH/*.tar.gz -C $DATAPATH/tmp/

echo "Sort files into appropriate folders..."
find $DATAPATH/ -iname *.csv -exec mv {} $DATAPATH/reports/ \;
find $DATAPATH/ -iname *.pdf -exec mv {} $DATAPATH/reports/ \;
find $DATAPATH/ -iname *.html -exec mv {} $DATAPATH/reports/ \;
find $DATAPATH/ -iname *.fast5 -exec mv {} $DATAPATH/tmp_fast5/ \;


# Run sbtach file (make sure the file is configured correctly)
echo "Running sbtach"
sbatch $SBATCHFILE