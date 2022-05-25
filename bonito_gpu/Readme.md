## The bonito_gpu docker image
The image is used for base calling [ONT](https://nanoporetech.com/) minion raw data with gpu acceleration using the [bonito base caller](https://github.com/nanoporetech/bonito).

## Building the docker image
The Docker image has to be ***build on a system with CUDA capabilities***. Otherwise, the installation will throw an error. 

```bash
git clone https://github.com/hcstubbe/docker_seq
cd docker_seq/bonito_gpu
docker build -t bonito_gpu .
```




## Using enroot with custom docker images
 
To import a custom image from the [standard docker repository](https://hub.docker.com/):
```Bash
enroot import --output [IMAGE NAME].sqsh docker://[USER NAME]@registry.hub.docker.com#[USERNAME]/[IMAGE NAME]
```

To create enroot container:
```Bash
enroot create [IMAGE NAME].sqsh
```

To start enroot container:
```Bash
enroot start [IMAGE NAME]
```

To remove all enroot containers:

```Bash
enroot remove --force $(enroot list)
```

## Starting enroot container using SLURM

Submitting SLURM script:
```Bash
sbatch [SCRIPT NAME].sbatch
```


Inspect SLURM jobs:
```Bash
squeue -u [USER NAME]
```

Cancel SLURM script:
```Bash
scancel [JOB ID]
```

