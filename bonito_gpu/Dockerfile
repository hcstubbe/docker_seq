# Set the base image to Ubuntu 18.04 and NVIDIA GPU
FROM nvidia/cuda:10.2-cudnn8-devel-ubuntu18.04

# Set the base image to Ubuntu 18.04 and NVIDIA GPU
FROM nvidia/cuda:10.2-cudnn8-devel-ubuntu18.04

RUN : \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        git \ 
        zlib1g-dev \
        python3.8-dev \
        software-properties-common \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        python3-venv \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && :


RUN pip3 install --no-cache-dir -U install setuptools pip
RUN pip3 install --no-cache-dir "cupy-cuda102==8.6.0"

RUN git clone https://github.com/nanoporetech/bonito.git && \
    cd /bonito && \
    python3 -m pip install -r requirements.txt 
    
RUN cd /bonito && \
    python3 setup.py develop && \
    bonito download --models
    
# RUN apt-get autoremove --purge --yes && \
#    apt-get clean


#COPY requirements.txt requirements.txt

#RUN pip3 install -r requirements.txt

# CMD ["bonito", "--input_path", "/data/fast5/", "--save_path", "/data/output/", "--flowcell", "FLO-MIN106", "--kit", "SQK-LSK109", "--min_qscore", "7", "--device", "cuda:0"]
