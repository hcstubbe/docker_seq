# Run C3POa using docker

The repository for C3POa can be found [here](https://github.com/rvolden/C3POa).

For more information check out the web page of the [Vollmers Lab in the Biomolecular Engineering Department at UC Santa Cruz](https://vollmerslab.soe.ucsc.edu/).

## Rationale for using docker
- Ease of use: dependencies are installed automatically when building the image; after building and testing, the image can be moved between machines/servers
- Reproducibility: once the image is build, behaviour is stable across machines/servers; behaviour does not change when using the image later
- Scalabiliy: test on a local machine/laptop, run on a workstation/high performance computing server

## Software requirements for running the docker image
- [Docker](https://docs.docker.com/get-docker/)
- [Charliecloud (optional)](https://hpc.github.io/charliecloud/)
- [C3POa and its dependencies are installed automatically in the docker image build process](https://github.com/rvolden/C3POa)

## Building the docker image:

```bash
git clone https://github.com/hcstubbe/r2c2_docker
cd r2c2_docker
docker build -t c3poa . 
```


## Running the docker image
To run C3POa (C3POa and post-processing) with default settings using the docker image, you have to bind in the folder containing the raw R2C2 fastq files. Adding the option '-d' will run the analysis in the background. The volumes are mounted on the path /mnt/0/ and /mnt/1/ to make things compatible with charliecloud.
```bash
docker run --rm --name c3poa -v /path/to/data:/mnt/0 c3poa 
```

To run the image with adjusted values for number of threads, minimum read length, minimum peak distance and group size you can run the following:

```bash
docker run --rm --name c3poa -v /path/to/data:/mnt/0 c3poa sh c3poa.sh [number of threads] [min length] [min distance] [group size]
```

For maximum control, you can bind in an extra volume with scripts, as well as splint-, adapter-, and index-sequences (as fasta files). You will need to specify the locations of the respective fasta files in your script. You can use [this script](https://github.com/hcstubbe/r2c2_docker/blob/main/scripts/c3poa_main.sh) as template.
```bash
docker run --rm --name c3poa -v /path/to/data:/mnt/0 -v /path/to/script_and_fasta:/mnt/1 c3poa sh /mnt/1/script.sh
```

Or you can run the C3POa.py python script directly. For this, you have to make sure that you bind in the docker volumes holding your data and to specify the python paths in respect to the mounted volume(s). For details of the C3POa options and usage see [here](https://github.com/rvolden/C3POa).
```bash
docker run 	--rm \					# remove docker container after run
		--name c3poa \				# name the docker container c3poa
		-v /path/to/data:/mnt/0 \		# path to the mounted volume with raw r2c2 data (concatenated to one file)
		c3poa \					# name of the docker image
		python3 /app/C3POa/C3POa.py 	-r /mnt/0/all.fastq \		# location of the raw r2c2 data in the mounted volume
						-o /mnt/0 \			# location of the C3POa output in the mounted volume
						-s /app/data/UMI_Splints.fasta \ # UMI splint (alternatively specify mounted splint.fasta)
						-c /app/config_c3poa.cfg \	# config file
						-l 1000 \			# minimal length
						-d 500 \			# minimal distance
						-n 12 \				# number of threads
						-g 1000 \			# group size
						-z				# remove zero-repeat reads
```

# Using charliecloud


Convert docker image c3poa and export to tar using [charliecloud](https://hpc.github.io/charliecloud/).

```bash
ch-docker2tar c3poa ~/
```

Copy image and sequencing data to server.
```bash
scp ~/c3poa.tar.gz user@server.com:~/c3poa.tar.gz  

scp -r [PATH TO seq_data]/* user@server.com:~/seq_data/[SAMPLE ID]/
```

Load charchliecloud module and extract image.
```bash
module load charliecloud 
mkdir ~/ccl_docker
ch-tar2dir ~/c3poa.tar.gz ~/ccl_docker
```

Run the image on the server using charliecloud.
```bash
ch-run -w ~/ccl_docker/c3poa -b ~/seq_data/[SAMPLE ID]/ -- sh c3poa.sh
```

Submit c3poa to SLURM manager.
```bash
sbatch ~/r2c2_docker/scripts/c3poa_main_slurm_cm2tiny.cmd
```

Inspect SLURM queue.
```bash
squeue --clusters=<cluster name>
```

Inspect SLURM run by id.
```bash
scontrol --clusters=<cluster name> show jobid=<job id>
```

