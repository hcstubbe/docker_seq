# Set the base image to Ubuntu 18.04 and NVIDIA GPU
FROM nvidia/cuda:10.2-cudnn8-devel-ubuntu18.04

# Set the base image to Ubuntu 18.04 and NVIDIA GPU
FROM nvidia/cuda:10.2-cudnn8-devel-ubuntu18.04

RUN : \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        software-properties-common \
    && add-apt-repository -y ppa:deadsnakes \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        python3.8-venv \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && :

RUN python3.8 -m venv /venv
ENV PATH=/venv/bin:$PATH

#COPY requirements.txt requirements.txt

#RUN pip3 install -r requirements.txt

# CMD ["bonito", "--input_path", "/data/fast5/", "--save_path", "/data/output/", "--flowcell", "FLO-MIN106", "--kit", "SQK-LSK109", "--min_qscore", "7", "--device", "cuda:0"]
