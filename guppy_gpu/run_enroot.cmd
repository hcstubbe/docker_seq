#!/bin/bash
#SBATCH -N 1
#SBATCH -p dgx
#SBATCH --gres=gpu:8
#SBATCH --ntasks=8
#SBATCH -o enroot_test.out
#SBATCH -e enroot_test.err
 
srun --mpi=pmi2 --container-mounts=~/test_data/co_07:/data/ \
     --container-image='guppy_gpu'