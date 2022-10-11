# Run pytrim2

from pytrim2.demultiplex import demultiplex
import sys

path_i = sys.argv[1]

print("start demultiplexing of " + path_i + "/basecalled/pass/all.fastq")

demultiplex("/data/" + path_i + "/basecalled/pass/all.fastq", "fastq", "/barcodes/barcode_primer.fasta", "fasta", "/data/" + path_i + "/demultiplexed", 300, 4)

print("done with " + path_i + "/basecalled/pass/all.fastq" + "!")
