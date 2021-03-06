#!/bin/bash
#SBATCH -J strt
#SBATCH -o ./seq_data/logfiles/%x.%j.%N.out
#SBATCH -e ./seq_data/logfiles/%x.%j.%N.error
#SBATCH --get-user-env
#SBATCH --clusters=cm2_tiny
#SBATCH --mem=48gb
#SBATCH --nodes=1
#SBATCH --cpus-per-task=24
#SBATCH --mail-type=end
#SBATCH --mail-user=[ENTER VALID MAIL ADDRESS]
#SBATCH --export=NONE
#SBATCH --time=12:00:00

module load charliecloud

ch-run -w ~/ccl_images/r2c2_stringtie -b ~/seq_data/test_data/  -b ~/seq_data/ref_data/ -- sh /app/r2c2_stringtie.sh 24