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
     --container-mounts=/home/ru75jul2/seq_data/CORKUM_04/:/data \
     --container-image='hstubbe/bgpu' \
     bonito basecaller dna_r9.4.1 --fastq /data/fast5 > /home/ru75jul2/seq_data/basecalls_corkum_04.fastq

