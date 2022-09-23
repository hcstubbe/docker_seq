#!/bin/bash
#SBATCH -J guppy_gpu_sup
#SBATCH -N 1
#SBATCH -p lrz-dgx-1-v100x8
#SBATCH --gres=gpu:1
#SBATCH --ntasks=1
#SBATCH --mail-type=end
#SBATCH --mail-user=hstubbe@med.lmu.de
#SBATCH -o enroot.out
#SBATCH -e enroot.err
#SBATCH --time=24:00:00

RUNNAME=PCC1
DATAPATH=/dss/dssfs02/lwp-dss-0001/u7x81/u7x81-dss-0000/ru75jul2/ir_seq/pcc/
GUPPYSCRIPT=/app/guppy_gpu_zip_dna_r10.4_e8.1_sup.sh
 
srun --mpi=pmi2 --container-mounts=$DATAPATH:/data/ \
     --container-image='hstubbe/guppy_gpu' \
     sh $GUPPYSCRIPT $RUNNAME
