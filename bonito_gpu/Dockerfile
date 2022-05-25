# Use the base image with Ubuntu 18.04 and NVIDIA CUDA 10.2
FROM nvidia/cuda:11.3.0-devel-ubuntu20.04

# Install Ubuntu dependencies
RUN apt-get update \
    && apt-get install -y python3 \
	&& apt-get install -y pip

# Install the bascaller bonito 0.5.3
RUN pip install -f https://download.pytorch.org/whl/torch_stable.html ont-bonito-cuda113
RUN bonito download --models
