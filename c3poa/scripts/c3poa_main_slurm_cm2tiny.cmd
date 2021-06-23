#!/bin/bash
#SBATCH -J c3poa
#SBATCH -o ./seq_data/logfiles/%x.%j.%N.out
#SBATCH -e ./seq_data/logfiles/%x.%j.%N.error
#SBATCH --get-user-env
#SBATCH --clusters=cm2_tiny
#SBATCH --mem=48gb
#SBATCH --nodes=1
#SBATCH --cpus-per-task=24
#SBATCH --mail-type=end
#SBATCH --mail-user=hstubbe@med.lmu.de
#SBATCH --export=NONE
#SBATCH --time=12:00:00

module load charliecloud

ch-run -w ~/ccl_images/c3poa -b ~/seq_data/CORKUM_12/ -- sh /app/c3poa.sh 24 900 450 1000
