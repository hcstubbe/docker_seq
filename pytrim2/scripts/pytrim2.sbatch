#!/bin/bash
#SBATCH -J pytrim2_batch
#SBATCH -o ./seq_data/logfiles/%x.%j.%N.out
#SBATCH -e ./seq_data/logfiles/%x.%j.%N.error
#SBATCH --get-user-env
#SBATCH --clusters=cm2_tiny
#SBATCH --mem=24gb
#SBATCH --cpus-per-task=12
#SBATCH --nodes=1
#SBATCH --mail-type=end
#SBATCH --mail-user=hstubbe@med.lmu.de
#SBATCH --export=NONE
#SBATCH --time=16:00:00


DATAPATH=/dss/dssfs02/lwp-dss-0001/u7x81/u7x81-dss-0000/ru75jul2/ir_seq/
BARCODEPATH=/dss/dssfs02/lwp-dss-0001/u7x81/u7x81-dss-0000/ru75jul2/ir_seq/ref_data/

module load charliecloud

ch-run -w ~/ccl_images/pytrim2 -b $DATAPATH:/data/ -b $BARCODEPATH:/barcodes/ -- sh /app/batch_run_pytrim2.sh
