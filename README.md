# docker_seq
 Dockerfiles for sequencing data pipeline

## Rationale for using docker
- Ease of use: dependencies are installed automatically when building the image; after building and testing, the image can be moved between machines/servers
- Reproducibility: once the image is build, behaviour is stable across machines/servers; behaviour does not change when using the image later
- Scalabiliy: test on a local machine/laptop, run on a workstation/high performance computing server
