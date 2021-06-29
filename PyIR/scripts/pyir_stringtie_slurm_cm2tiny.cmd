#!/bin/bash
#SBATCH -J pyir
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

ch-run -w ~/ccl_images/pyir -b ~/seq_data/test_data/  -b ~/seq_data/ref_data/ -- sh pyir /mnt/0/output_c3poa/UMI_Splint_1/R2C2_Consensus.fasta
