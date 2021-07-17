# docker_seq
 Dockerfiles for sequencing data pipeline

## Docker images
- c3poa: consensus calling of r2c2 reads
- guppy_gpu: base calling of minion raw data with gpu acceleration
- longread_stringtie: pipeline for analyzing long reads using stringtie

## Rationale for using docker
- Ease of use: dependencies are installed automatically when building the image; after building and testing, the image can be moved between machines/servers
- Reproducibility: once the image is build, behaviour is stable across machines/servers; behaviour does not change when using the image later
- Scalabiliy: test on a local machine/laptop, run on a workstation/high performance computing server

## Using charliecloud

Convert docker image c3poa and export to tar using [charliecloud](https://hpc.github.io/charliecloud/).

```bash
ch-docker2tar c3poa ~/
```
