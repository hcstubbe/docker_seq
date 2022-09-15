  #!/bin/bash


## Pass positional variable(s)
NTHREADS=$1
NTHREADS="${NTHREADS:=12}"
echo "Processing with $NTHREADS thread(s)." 


echo "Running stringtie." 
mkdir /mnt/0/output_stringtie

stringtie   -p $NTHREADS \
            -G /mnt/1/gencode.v29.annotation.gtf \
            -o /mnt/0/output_stringtie/out.gtf \
            -l STRG \
            -L \
            -v \
            /mnt/0/output_samtools/alns.sorted.BAM

echo "done!"							
# Exit the script
exit
