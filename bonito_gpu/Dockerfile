# Set the base image to Ubuntu 18.04 and NVIDIA GPU
FROM nvidia/cuda:11.1-base-ubuntu18.04

ARG PACKAGE_VERSION=5.0.11
ARG BUILD_PACKAGES="wget apt-transport-https"
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install --yes $BUILD_PACKAGES libnvidia-compute-460-server python3 && \ 
    mkdir /app && \
    cd /app && \
    git clone https://github.com/nanoporetech/bonito.git && \
    cd bonito && \
    python3 -m venv venv3 && \
    source venv3/bin/activate && \
    rm *.deb && \
    apt-get autoremove --purge --yes && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
    
# CMD guppy_basecaller --input_path /data/fast5/ --save_path /data/output/ --flowcell FLO-MIN106 --kit SQK-LSK109 --min_qscore 7 --device cuda:0

CMD ["bonito", "--input_path", "/data/fast5/", "--save_path", "/data/output/", "--flowcell", "FLO-MIN106", "--kit", "SQK-LSK109", "--min_qscore", "7", "--device", "cuda:0"]
