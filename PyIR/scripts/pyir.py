import matplotlib
import matplotlib.pyplot as plt
import matplotlib.ticker as ticker
from matplotlib.pyplot import figure
## Initialize PyIR and set example file for processing
from pyir import PyIR
FILE = 'example.fasta'

#create PyIR API instance and return Python dictionary
pyirexample = PyIR(query=FILE, args=['--outfmt', 'dict', '--enable_filter'])
result = pyirexample.run()

cdr3lens = {}
total_reads = 0

#iterate over values returned by PyIR
for key, entry in result.items():
	clen = entry['cdr3_aa_length']
	#if the CDR3 length is not in the dictionary, add it
	if int(clen) not in cdr3lens.keys():
		cdr3lens[int(clen)] = 0
	#increment appropriate dictionary value and total
	cdr3lens[int(clen)] += 1
	total_reads += 1

x = []
y = []

for xval in sorted(cdr3lens.keys()):
	x.append(xval)
	y.append(cdr3lens[xval]/total_reads)

fig, ax = plt.subplots(1 , 1, dpi=600, facecolor='None', edgecolor='None')
plt.bar(x, y, color="#a0814b")
fig.savefig("synth01_cdr3length_distribution.svg", bbox_inches='tight', pad_inches=0)