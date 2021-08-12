# Set the base image to Ubuntu 18.04 and NVIDIA GPU
FROM nvidia/cuda:10.2-base-ubuntu18.04

# Install required ubuntu dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      python3-minimal \
      python3-pip \
      git \
      build-essential \
      python3-dev \
      libz-dev

# CMD ["bonito", "--input_path", "/data/fast5/", "--save_path", "/data/output/", "--flowcell", "FLO-MIN106", "--kit", "SQK-LSK109", "--min_qscore", "7", "--device", "cuda:0"]
