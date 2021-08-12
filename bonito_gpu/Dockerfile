# Set the base image to Ubuntu 18.04 and NVIDIA GPU
FROM nvidia/cuda:10.2-cudnn8-devel

RUN apt-get update -y && \
    apt-get install -y --no-install-recommends \
    python3.8 \
    python3-dev \
    python3-pip \
    python3-wheel \
    python3-setuptools \
    git && \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*

RUN pip3 install --no-cache-dir -U install setuptools pip
RUN pip3 install --no-cache-dir "cupy-cuda102[all]==8.6.0"

RUN git clone https://github.com/nanoporetech/bonito.git && \
    cd /bonito && \
    python3 -m pip install -r requirements.txt && \
    python3 setup.py develop && \
    bonito download --models
    
# RUN apt-get autoremove --purge --yes && \
#    apt-get clean

#COPY requirements.txt requirements.txt

#RUN pip3 install -r requirements.txt

# CMD ["bonito", "--input_path", "/data/fast5/", "--save_path", "/data/output/", "--flowcell", "FLO-MIN106", "--kit", "SQK-LSK109", "--min_qscore", "7", "--device", "cuda:0"]
