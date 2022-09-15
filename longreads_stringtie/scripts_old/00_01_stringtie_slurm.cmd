#!/bin/bash
#SBATCH -J strt1_mock
#SBATCH -o ./seq_data/logfiles/%x.%j.%N.out
#SBATCH -e ./seq_data/logfiles/%x.%j.%N.error
#SBATCH --get-user-env
#SBATCH --clusters=cm2
#SBATCH --mem=48gb
#SBATCH --cpus-per-task=24
#SBATCH --mail-type=end
#SBATCH --mail-user=hstubbe@med.lmu.de
#SBATCH --export=NONE
#SBATCH --time=02:00:00

module load charliecloud

ch-run -w ~/ccl_images/longreads_stringtie -b /dss/dssfs02/lwp-dss-0001/u7x81/u7x81-dss-0000/ru75jul2/ir_seq/adv/basecalled/guppy_mock_PAM07790_PAM08973/out/demult/:/mnt/0/  -b ~/seq_data/ref_data/:/mnt/1/ -- sh /app/01_longread_stringtie.sh 24 guppy_mock_PAM07790_barcode_4_seqs.fastq guppy_mock_PAM07790_barcode_4

ch-run -w ~/ccl_images/longreads_stringtie -b /dss/dssfs02/lwp-dss-0001/u7x81/u7x81-dss-0000/ru75jul2/ir_seq/adv/basecalled/guppy_mock_PAM07790_PAM08973/out/demult/:/mnt/0/  -b ~/seq_data/ref_data/:/mnt/1/ -- sh /app/01_longread_stringtie.sh 24 guppy_mock_PAM07790_barcode_5_seqs.fastq guppy_mock_PAM07790_barcode_5

ch-run -w ~/ccl_images/longreads_stringtie -b /dss/dssfs02/lwp-dss-0001/u7x81/u7x81-dss-0000/ru75jul2/ir_seq/adv/basecalled/guppy_mock_PAM07790_PAM08973/out/demult/:/mnt/0/  -b ~/seq_data/ref_data/:/mnt/1/ -- sh /app/01_longread_stringtie.sh 24 guppy_mock_PAM07790_barcode_6_seqs.fastq guppy_mock_PAM07790_barcode_6
