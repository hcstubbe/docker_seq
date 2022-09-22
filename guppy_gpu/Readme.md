## How to use the container
```Bash
docker run -v c/Users/hans/Downloads/data/:/data --rm --gpus all hstubbe/guppy_gpu guppy_basecaller -i /data/in -s /data/out -c dna_r10.4_e8.1_sup.cfg -x "cuda:0"
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
