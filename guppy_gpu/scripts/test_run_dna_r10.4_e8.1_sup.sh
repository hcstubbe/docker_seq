#!/bin/bash

DATAPATH=$1
GUPPYSCRIPT=/app/guppy_gpu_zip_dna_r10.4_e8.1_sup.sh

docker run -v $DATAPATH:/data --rm --gpus all hstubbe/guppy_gpu sh $GUPPYSCRIPT