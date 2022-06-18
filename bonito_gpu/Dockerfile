# Use the base image with Ubuntu 20.04 and NVIDIA CUDA 11.3
FROM nvidia/cuda:11.3.0-devel-ubuntu20.04

# Install Ubuntu dependencies (0.5.3 requires specific python versions; e.g. python 3.9)
RUN apt-get update --yes && \
    apt-get install --yes \
        pip

# Install the bascaller bonito 0.5.3
RUN pip install -f https://download.pytorch.org/whl/torch_stable.html ont-bonito-cuda113
RUN bonito download --models