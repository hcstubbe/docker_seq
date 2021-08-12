# Use the base image with Ubuntu 18.04 and NVIDIA CUDA 10.2
FROM nvidia/cuda:10.2-cudnn8-devel-ubuntu18.04

# Install Ubuntu dependencies with python3 in a virtual python environment.
RUN : \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        software-properties-common \
    && add-apt-repository -y ppa:deadsnakes \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        zlib1g-dev \
        python3-dev \
        python3-venv \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && :
RUN python3 -m venv /venv
ENV PATH=/venv/bin:$PATH

# Install python dependencies of the basecaller bonito 0.4.0
RUN pip3 install --no-cache-dir -U install setuptools pip
RUN pip3 install --no-cache-dir "cupy-cuda102==8.6.0"
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

# Install the bascaller bonito 0.4.0
# This can only be installed, if a CUDA device is present. Otherwiese, the intall will throw an error.
RUN pip3 install --no-cache-dir "ont-bonito==0.4.0"

CMD ["bonito", "basecaller", "dna_r9.4.1", "--reference", "/mnt/1/hg38.fa", "mnt/0/data/fast5/", ">", "mnt/0/data/output/out.sam", "--min_qscore", "7", "--device", "cuda:0"]
