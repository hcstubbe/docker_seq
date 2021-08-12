# Set the base image to Ubuntu 18.04 and NVIDIA GPU
FROM nvidia/cuda:10.2-base-ubuntu18.04

ARG BUILD_PACKAGES="wget apt-transport-https"
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      python3-minimal \
      python3-pip \
      git \
      build-essential \
      python3-dev \
      libz-dev


RUN git clone https://github.com/nanoporetech/bonito.git && \
    cd /bonito && \
    python3 -m pip install --upgrade pip && \
    python3 -m pip install setuptools && \
    python3 -m pip install -r requirements.txt && \
    python3 setup.py develop && \
    bonito download --models
    
# RUN apt-get autoremove --purge --yes && \
#    apt-get clean

COPY requirements.txt requirements.txt

RUN pip3 install -r requirements.txt

# CMD ["bonito", "--input_path", "/data/fast5/", "--save_path", "/data/output/", "--flowcell", "FLO-MIN106", "--kit", "SQK-LSK109", "--min_qscore", "7", "--device", "cuda:0"]
