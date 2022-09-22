# Use the base image with Ubuntu 20.04 and NVIDIA CUDA 11.3
FROM nvidia/cuda:11.7.1-cudnn8-runtime-ubuntu20.04

# Install Ubuntu dependencies
RUN apt-get update --yes && \
    apt-get install --yes \
        pip

# Install the bascaller bonito 0.5.3
RUN pip install -f https://download.pytorch.org/whl/torch_stable.html ont-bonito-cuda113
RUN bonito download --models