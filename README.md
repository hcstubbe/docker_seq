# docker_seq
 Dockerfiles for sequencing data pipeline

## Docker images
- guppy_gpu: base calling of [ONT](https://nanoporetech.com/) minion raw data with gpu acceleration
- c3poa: consensus calling of [r2c2](https://vollmerslab.soe.ucsc.edu/) reads
- PyIR: align B and T cell receptor sequences using [IgBLAST](https://ncbi.github.io/igblast/) implemented by [PyIR](https://github.com/crowelab/PyIR)
- longread_stringtie: pipeline for analyzing long reads using [stringtie](http://ccb.jhu.edu/software/stringtie/)
- ballgown: plotting and differential expression analysis of stringtie results using [ballgown](https://bioconductor.org/packages/release/bioc/html/ballgown.html)

## How to run the pipeline
- Load the required images (e.g. as charliecloud images)
- Run the docker containers on the data in the following order: (1) guppy_gpu, (2) c3poa, (3) PyIR, (4) longread_stringtie, and (5) ballgown.
- On a SLURM managed cluster, you can run the SLURM script run_pipeline.cmd after installing the images as charliecloud images (see below).

## Rationale for using docker
- Ease of use: dependencies are installed automatically when building the image; after building and testing, the image can be moved between machines/servers
- Reproducibility: once the image is build, behaviour is stable across machines/servers; behaviour does not change when using the image later
- Scalabiliy: test on a local machine/laptop, run on a workstation/high performance computing server

## Using charliecloud

Convert docker image c3poa and export to tar using [charliecloud](https://hpc.github.io/charliecloud/).

```bash
ch-docker2tar [DOCKER IMAGE] ~/
```


Untar image.
```bash
ch-tar2dir [CHARLIE CLOUD IMAGE].tar.gz /path/to/destination
```

Run the image on the server using charliecloud.
```bash
ch-run -w /path/to/destination/[IMAGE] -b ~/path/to/data/ -- sh [SOME SCRIPT].sh
```

Submit image to SLURM manager.
```bash
sbatch /path/to/script/[SOME SLURM SCRIPT].cmd
```

Inspect SLURM queue.
```bash
squeue --clusters=<cluster name>
```

Inspect SLURM run by id.
```bash
scontrol --clusters=<cluster name> show jobid=<job id>
```
