# Run pytrim2

import sys
 
path_i = int(sys.argv[1])

print("import pytrim2")
from pytrim2.demultiplex import demultiplex

print("start demultiplexing of" + path_i + "/basecalled/pass/all.fastq")

demultiplex("/data/" + path_i + "/basecalled/pass/all.fastq", "fastq", "/barcodes/barcode_primer.fasta", "fasta", "/data/" + path_i + "/demultiplexed", 300, 4)

print("done with " + path_i + "/basecalled/pass/all.fastq" + "!")
