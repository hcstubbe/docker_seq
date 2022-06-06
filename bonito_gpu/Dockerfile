# Use the base image with Ubuntu 20.04 and NVIDIA CUDA 11.3
FROM nvidia/cuda:11.3.0-devel-ubuntu20.04

# Install Ubuntu dependencies (0.5.3 requires specific python versions; e.g. python 3.9)
RUN apt-get update --yes && \
    DEBIAN_FRONTEND=noninteractive apt-get install --yes --no-install-recommends \
        python3.9 \
        pip

# Install the bascaller bonito 0.5.3
RUN python3.9 -m pip install --no-cache-dir -f https://download.pytorch.org/whl/torch_stable.html ont-bonito-cuda113
RUN bonito download --models