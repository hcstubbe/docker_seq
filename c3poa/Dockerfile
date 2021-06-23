# syntax=docker/dockerfile:1

# FROM python:3.8-buster

FROM ubuntu:latest


WORKDIR /app

RUN apt-get update -qq && \
    apt-get -y upgrade

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata

RUN apt-get update -qq && \
    apt-get -y install \
	gzip \
	golang \
	git \
	curl \
	rsync \
	gcc \
	cmake \
	python3 \
	python3-pip \
	python-is-python3


COPY config/requirements_python.txt requirements_python.txt
COPY config/config_c3poa.cfg /app/
COPY config/config_mandalorion.cfg /app/
COPY data /app/data


RUN pip3 install -r requirements_python.txt &&\
    pip3 install pyabpoa==1.0.6


WORKDIR /usr/local/lib/python3.8/site-packages
RUN git clone https://github.com/rvolden/conk
WORKDIR /usr/local/lib/python3.8/site-packages/conk
RUN make
WORKDIR /app


RUN git clone --recursive https://github.com/isovic/racon.git racon
WORKDIR /app/racon
RUN mkdir build
WORKDIR /app/racon/build
RUN cmake -DCMAKE_BUILD_TYPE=Release ..
RUN make
WORKDIR /app


RUN git clone https://github.com/lh3/minimap2
WORKDIR /app/minimap2
RUN make
WORKDIR /app


RUN git clone https://github.com/rvolden/emtrey
WORKDIR /app/emtrey 
RUN make
WORKDIR /app


RUN git clone https://github.com/yangao07/abPOA.git
WORKDIR /app/abPOA
RUN make
WORKDIR /app

RUN rsync -aP rsync://hgdownload.soe.ucsc.edu/genome/admin/exe/linux.x86_64/blat/ ./


RUN git clone https://github.com/rvolden/C3POa.git C3POa


RUN git clone https://github.com/rvolden/Mandalorion mandalorion

RUN git clone https://github.com/gpertea/stringtie
WORKDIR /app/stringtie
RUN make release
WORKDIR /app


COPY scripts /app

CMD ["sh", "/app/c3poa.sh"]
