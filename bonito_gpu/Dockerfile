# Set the base image to Ubuntu 18.04 and NVIDIA GPU
FROM nvidia/cuda:10.2-base-ubuntu18.04

ARG BUILD_PACKAGES="wget apt-transport-https"
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get -y install $BUILD_PACKAGES libnvidia-compute-460-server && \
    apt-get -y install \
	gzip \
	golang \
	git \
	curl \
	rsync \
	gcc \
	cmake \
	python3 \
	python3-pip
    
RUN apt-get autoremove --purge --yes && \
    apt-get clean

COPY requirements.txt requirements.txt

RUN pip3 install -r requirements.txt

# CMD ["bonito", "--input_path", "/data/fast5/", "--save_path", "/data/output/", "--flowcell", "FLO-MIN106", "--kit", "SQK-LSK109", "--min_qscore", "7", "--device", "cuda:0"]
