#!/bin/bash
#SBATCH -N 1
#SBATCH -p dgx-1-v100
#SBATCH --gres=gpu:8
#SBATCH --ntasks=8
#SBATCH -o enroot_test.out
#SBATCH -e enroot_test.err
 
srun --mpi=pmi2 --container-mounts=~/path/to/data/:/data/ \
     --container-image='hstubbe/guppy_gpu'
