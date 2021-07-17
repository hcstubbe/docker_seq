#!/bin/bash
#SBATCH -N 1
#SBATCH -p dgx-1-v100
#SBATCH --gres=gpu:1
#SBATCH --ntasks=1
#SBATCH --mail-type=end
#SBATCH --mail-user=hstubbe@med.lmu.de
#SBATCH -o enroot_test.out
#SBATCH -e enroot_test.err
 
srun --mpi=pmi2 --container-mounts=/home/ru75jul2/path/to/data/:/mnt/data/ \
     --container-image='hstubbe/guppy_gpu' \
     guppy_basecaller --input_path /mnt/data/fast5/ --save_path /mnt/data/output/ --flowcell FLO-MIN106 --kit SQK-LSK109 --min_qscore 7 --device cuda:0
