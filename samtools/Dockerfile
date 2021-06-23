# syntax=docker/dockerfile:1

# FROM python:3.8-buster

FROM ubuntu:latest


WORKDIR /app

RUN DEBIAN_FRONTEND=noninteractive apt-get update -qq && apt-get install -y --no-install-recommends tzdata

RUN apt-get update && apt-get install -y \
	python3 \
	make \
	cmake \
	autoconf \
	automake \
	zlib1g-dev \
	libbz2-dev \
	liblzma-dev \
	libcurl4-gnutls-dev \
	libssl-dev \
	libncurses5-dev \
	wget && \
	apt-get autoclean && rm -rf /var/lib/apt/lists/*

COPY scripts /app/

RUN wget https://github.com/samtools/htslib/releases/download/1.12/htslib-1.12.tar.bz2
RUN tar -vxjf htslib-1.12.tar.bz2
WORKDIR /app/htslib-1.12
RUN make
WORKDIR /app


RUN wget https://github.com/samtools/samtools/releases/download/1.12/samtools-1.12.tar.bz2
RUN tar -vxjf samtools-1.12.tar.bz2
WORKDIR /app/samtools-1.12
RUN make
WORKDIR /app


RUN wget https://github.com/samtools/bcftools/releases/download/1.12/bcftools-1.12.tar.bz2
RUN tar -vxjf bcftools-1.12.tar.bz2
WORKDIR /app/bcftools-1.12
RUN make
WORKDIR /app

ENV PATH="$PATH:/app/htslib-1.12"
ENV PATH="$PATH:/app/bcftools-1.12"
ENV PATH="$PATH:/app/samtools-1.12"


CMD ["sh", "/app/samtools.sh"]
