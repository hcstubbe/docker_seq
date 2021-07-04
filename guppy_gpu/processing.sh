#!/bin/bash
set -e

# Call script from folder holding the sample data

## Pass positional variables
SMPID=$1
SMPID="${SMPID:=NULL}"
echo "Processing sample $SMPID" 

# Create folders
echo "Creating output folders"
mkdir -p ~/seq_data/$SMPID/log
mkdir -p ~/seq_data/$SMPID/output	
mkdir -p ~/seq_data/$SMPID/fast5

echo "Copying data"
find . -wholename './CORKUM_11/*/*.fast5' -exec cp {} ~/seq_data/$SMPID/fast5 \;
echo "Finished data transfer"


# Start container for sequencing WITHOUT entering the container (the terminal may be closed then!)
echo "Starting basecalling"

docker run --gpus all --rm --name guppy_serv_gpu -d -v ~/seq_data/$SMPID/:/data/  guppy_server_gpu

echo "Submitted job to guppy server"

exit
