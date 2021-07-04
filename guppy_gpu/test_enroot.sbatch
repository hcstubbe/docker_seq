#!/bin/bash
#SBATCH -N 1
#SBATCH -p dgx-1-v100
#SBATCH --gres=gpu:1
#SBATCH --ntasks=1
#SBATCH -o enroot_test.out
#SBATCH -e enroot_test.err
#SBATCH --mail-type=end
#SBATCH --mail-user=hstubbe@med.lmu.de
 
srun --mpi=pmi2 --container-mounts=/home/ru75jul2/test_data/co_07/:/mnt/data/ \
     --container-image='hstubbe/guppy_gpu' \
     guppy_basecaller --input_path /mnt/data/fast5/ --save_path /mnt/data/output/ --flowcell FLO-MIN106 --kit SQK-LSK109 --min_qscore 7 --device cuda:0

