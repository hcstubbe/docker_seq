#!/bin/bash

DATAPATH=[/path/to/data/]
GUPPYCFG=dna_r10.4_e8.1_sup.cfg ## e.g. dna_r10.4_e8.1_sup.cfg or dna_r10.3_450bps_sup.cfg
INPUTTYPE=zip ## zip, tar.gz or fast5
 
srun --mpi=pmi2 --container-mounts=$DATAPATH:/data/ \
     --container-image='hstubbe/guppy_gpu' \
     sh /app/guppy_gpu_$INPUTTYPE.sh $GUPPYCFG