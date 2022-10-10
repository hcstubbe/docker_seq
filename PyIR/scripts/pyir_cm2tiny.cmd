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

DATAPATHS="/dss/dssfs02/lwp-dss-0001/u7x81/u7x81-dss-0000/ru75jul2/seq_data/ir_seq/corkum/COR1/
/dss/dssfs02/lwp-dss-0001/u7x81/u7x81-dss-0000/ru75jul2/seq_data/ir_seq/corkum/COR3/
/dss/dssfs02/lwp-dss-0001/u7x81/u7x81-dss-0000/ru75jul2/seq_data/ir_seq/corkum/COR4/
/dss/dssfs02/lwp-dss-0001/u7x81/u7x81-dss-0000/ru75jul2/seq_data/ir_seq/corkum/COR5/"

for dp in $DATAPATHS
do
    ch-run -w ~/ccl_images/pyir -b $dp  -- sh /app/scripts/pyir.sh 24
done