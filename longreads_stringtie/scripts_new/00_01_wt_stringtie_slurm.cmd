#!/bin/bash
#SBATCH -J strt1_wt
#SBATCH -o ./seq_data/logfiles/%x.%j.%N.out
#SBATCH -e ./seq_data/logfiles/%x.%j.%N.error
#SBATCH --get-user-env
#SBATCH --clusters=cm2
#SBATCH --mem=48gb
#SBATCH --cpus-per-task=24
#SBATCH --mail-type=end
#SBATCH --mail-user=hstubbe@med.lmu.de
#SBATCH --export=NONE
#SBATCH --time=03:00:00

module load charliecloud

ch-run -w ~/ccl_images/longreads_stringtie -b /dss/dssfs02/lwp-dss-0001/u7x81/u7x81-dss-0000/ru75jul2/ir_seq/adv/basecalled/guppy_wt_PAM07790/out/demult2/:/mnt/0/  -b ~/seq_data/ref_data/:/mnt/1/ -- sh /app/01_longread_stringtie.sh 24 guppy_wt_PAM07790_barcode_1_seqs.fastq guppy_wt_PAM07790_barcode_1

ch-run -w ~/ccl_images/longreads_stringtie -b /dss/dssfs02/lwp-dss-0001/u7x81/u7x81-dss-0000/ru75jul2/ir_seq/adv/basecalled/guppy_wt_PAM07790/out/demult2/:/mnt/0/  -b ~/seq_data/ref_data/:/mnt/1/ -- sh /app/01_longread_stringtie.sh 24 guppy_wt_PAM07790_barcode_2_seqs.fastq guppy_wt_PAM07790_barcode_2

ch-run -w ~/ccl_images/longreads_stringtie -b /dss/dssfs02/lwp-dss-0001/u7x81/u7x81-dss-0000/ru75jul2/ir_seq/adv/basecalled/guppy_wt_PAM07790/out/demult2/:/mnt/0/  -b ~/seq_data/ref_data/:/mnt/1/ -- sh /app/01_longread_stringtie.sh 24 guppy_wt_PAM07790_barcode_3_seqs.fastq guppy_wt_PAM07790_barcode_3
