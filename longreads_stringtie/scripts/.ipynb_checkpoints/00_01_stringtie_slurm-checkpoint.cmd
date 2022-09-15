#!/bin/bash
#SBATCH -J name_str1
#SBATCH -o ./seq_data/logfiles/%x.%j.%N.out
#SBATCH -e ./seq_data/logfiles/%x.%j.%N.error
#SBATCH --get-user-env
#SBATCH --clusters=cm2
#SBATCH --mem=48gb
#SBATCH --cpus-per-task=24
#SBATCH --mail-type=end
#SBATCH --mail-user=[VALID E-MAIL]
#SBATCH --export=NONE
#SBATCH --time=02:00:00

module load charliecloud

ch-run -w [path/to/image]/longreads_stringtie -b [path/to/data]:/mnt/0/  -b [path/to/ref_data]:/mnt/1/ -- sh /app/01_longread_stringtie.sh [n cores] [input filename] [ouput filename]
