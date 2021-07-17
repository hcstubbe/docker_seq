# docker_seq
 Dockerfiles for sequencing data pipeline

## Docker images
- c3poa: consensus calling of [r2c2](https://vollmerslab.soe.ucsc.edu/) reads
- guppy_gpu: base calling of [ONT](https://nanoporetech.com/) minion raw data with gpu acceleration
- longread_stringtie: pipeline for analyzing long reads using [stringtie](http://ccb.jhu.edu/software/stringtie/)

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
