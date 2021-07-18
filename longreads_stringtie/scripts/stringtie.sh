  #!/bin/bash


## Pass positional variable(s)
NTHREADS=$1
NTHREADS="${NTHREADS:=12}"
echo "Processing with $NTHREADS thread(s)." 


echo "Running stringtie." 
mkdir /mnt/0/output_stringtie

stringtie /mnt/0/output_samtools/alns.sorted.BAM \
                          -v \
                          -p $NTHREADS \
                          -G /mnt/1/gencode.v29.annotation.gtf \
                          -A /mnt/0/output_stringtie/gene_abund.tab \
                          -C /mnt/0/output_stringtie/cov_refs.gtf \
                          -o /mnt/0/output_stringtie/out.gtf \
						  -L \
						  -B

echo "done!"							
# Exit the script
exit
