# Set the base image to Ubuntu 20.04 and NVIDIA GPU
FROM nvidia/cuda:11.3.0-devel-ubuntu20.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install --yes wget lsb-release

RUN export PLATFORM=$(lsb_release -cs)  && \
    wget -O- https://cdn.oxfordnanoportal.com/apt/ont-repo.pub | apt-key add -  && \
    echo "deb http://cdn.oxfordnanoportal.com/apt ${PLATFORM}-stable non-free" | tee /etc/apt/sources.list.d/nanoporetech.sources.list

RUN apt-get update  && \
    apt-get install --yes ont-guppy

RUN apt-get autoclean && rm -rf /var/lib/apt/lists/*
