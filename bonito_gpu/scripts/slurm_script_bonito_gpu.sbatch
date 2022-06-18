#!/bin/bash
#SBATCH -J bgpu
#SBATCH -N 1
#SBATCH -p gpu-v100
#SBATCH --gres=gpu:2
#SBATCH --ntasks=1
#SBATCH --mail-type=end
#SBATCH --mail-user=hstubbe@med.lmu.de
#SBATCH -o enroot.out
#SBATCH -e enroot.err
#SBATCH --time=24:00:00
 
srun --mpi=pmi2 \
     --container-mounts=/home/[USER NAME]/seq_data/:/data \
     --container-image='hstubbe/bonito_gpu' \
     bonito basecaller dna_r10.4_e8.1_sup@v3.4 /data/fast5 > /home/[USER NAME]/basecalls.fastq

