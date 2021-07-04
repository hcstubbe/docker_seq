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

Interactive session (example - pls modify):
```Bash
srun --pty --container-mounts=./data-test:/mnt/data-test \
     --container-name=horovod \
     --container-image='horovod/horovod+0.16.4-tf1.12.0-torch1.1.0-mxnet1.4.1-py3.5' \
     bash
 ```
