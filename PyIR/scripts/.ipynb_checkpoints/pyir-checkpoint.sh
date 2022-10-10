#!/bin/bash


## Pass positional variable(s)
NTHREADS=$1
NTHREADS="${NTHREADS:=12}"

echo "Processing with $NTHREADS thread(s)." 

echo "Running PyIR." 

## Create folders
mkdir -p /data/pyir/
FILES=find /data/ -iname *_seqs.fastq -printf "%f\n" 


## Run PyIR on every fastq file in the /data/demultiplexed/ folder
for fx in $FILES
do
    echo "Processing $fx..."
    mkdir -p /data/pyir/tmp_pyir/$fx/
    pyir /data/demultiplexed/$fx -m $NTHREADS --tmp_dir /data/pyir/tmp_pyir/$fx/ --enable_filter --outfmt tsv --out /data/pyir/$fx.pyir.csv 
    rm -r /data/pyir/tmp_pyir/$fx/
done

echo "Done!"							
# Exit the script
exit
