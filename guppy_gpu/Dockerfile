# Set the base image to Ubuntu 18.04 and NVIDIA GPU
FROM nvidia/cuda:11.1-base-ubuntu18.04

ARG PACKAGE_VERSION=5.0.11
ARG BUILD_PACKAGES="wget apt-transport-https"
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install --yes $BUILD_PACKAGES libnvidia-compute-460-server && \ 
    cd /tmp && \
    wget -q https://mirror.oxfordnanoportal.com/software/analysis/ont_guppy_${PACKAGE_VERSION}-1~bionic_amd64.deb && \
    apt install --yes /tmp/ont_guppy_${PACKAGE_VERSION}-1~bionic_amd64.deb && \
    rm *.deb && \
    apt-get autoremove --purge --yes && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
    
# CMD guppy_basecaller --input_path /data/fast5/ --save_path /data/output/ --flowcell FLO-MIN106 --kit SQK-LSK109 --min_qscore 7 --device cuda:0

CMD ["guppy_basecaller", "--input_path", "/data/fast5/", "--save_path", "/data/output/", "--flowcell", "FLO-MIN106", "--kit", "SQK-LSK109", "--min_qscore", "7", "--device", "cuda:0"]