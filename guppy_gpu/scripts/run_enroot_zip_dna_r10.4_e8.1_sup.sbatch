#!/bin/bash
#SBATCH -J guppy_gpu_sup
#SBATCH -N 1
#SBATCH -p lrz-dgx-1-v100x8
#SBATCH --gres=gpu:1
#SBATCH --ntasks=1
#SBATCH --mail-type=end
#SBATCH --mail-user=hstubbe@med.lmu.de
#SBATCH -o ./seq_data/logfiles/%x.%j.%N.out
#SBATCH -e ./seq_data/logfiles/%x.%j.%N.error
#SBATCH --time=24:00:00

RUNNAME=[name of sequencing run in zip file]
DATAPATH=[/path/to/data/]
GUPPYSCRIPT=/app/guppy_gpu_zip_dna_r10.4_e8.1_sup.sh
 
srun --mpi=pmi2 --container-mounts=$DATAPATH:/data/ \
     --container-image='hstubbe/guppy_gpu' \
     sh $GUPPYSCRIPT $RUNNAME
