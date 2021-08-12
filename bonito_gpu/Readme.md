## Building the docker image:
The Docker image has to be **build on a system with CUDA driver installed**. Otherwise, the installation (with cupy-cuda102==8.6.0) will throw an error. 

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

