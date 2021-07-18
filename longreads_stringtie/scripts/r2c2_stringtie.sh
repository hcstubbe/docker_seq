  #!/bin/bash


## Pass positional variable(s)
NTHREADS=$1
NTHREADS="${NTHREADS:=12}"
echo "Processing with $NTHREADS thread(s)." 

echo "Running minimap2." 

## Create folders
mkdir /mnt/0/output_minimap2


## Run the postprocessing script
minimap2 -G 400k --secondary=no -ax splice:hq -t $NTHREADS /mnt/1/hg38.fa /mnt/0/output_c3poa_postprocessing/R2C2_full_length_consensus_reads.fasta > /mnt/0/output_minimap2/out.SAM  


echo "Running samtools." 


## Create folders
mkdir /mnt/0/output_samtools


## Run the script
# samtools view -Su /mnt/0/output_minimap2/out.SAM | samtools sort /mnt/0/output_samtools/alns.sorted.BAM
samtools view -Su /mnt/0/output_minimap2/out.SAM | samtools sort -o /mnt/0/output_samtools/alns.sorted.BAM

echo "Running stringtie." 
mkdir /mnt/0/output_stringtie

stringtie /mnt/0/output_samtools/alns.sorted.BAM \
                          -v \
                          -p $NTHREADS \
                          -G /mnt/1/gencode.v29.annotation.gtf \
                          -A /mnt/0/output_stringtie/gene_abund.tab \
                          -C /mnt/0/output_stringtie/cov_refs.gtf \
                          -o /mnt/0/output_stringtie/out.gtf \
						  -L

echo "done!"							
# Exit the script
exit
