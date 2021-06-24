#!/bin/bash
#SBATCH -J manda
#SBATCH -o ./%x.%j.%N.out
#SBATCH -e ./%x.%j.%N.error
#SBATCH --get-user-env
#SBATCH --clusters=cm2_tiny
#SBATCH --mem=48gb
#SBATCH --nodes=1
#SBATCH --cpus-per-task=28
#SBATCH --mail-type=end
#SBATCH --mail-user=hstubbe@med.lmu.de
#SBATCH --export=NONE
#SBATCH --time=08:00:00

module load charliecloud

ch-run -w ~/ccl_images/c3poa -b ~/seq_data/test_data/ -b ~/seq_data/ref_data/ -- sh /app/mandalorion.sh
