# syntax=docker/dockerfile:1

# FROM python:3.8-buster

FROM ubuntu:latest


RUN DEBIAN_FRONTEND=noninteractive apt-get update -qq && apt-get install -y --no-install-recommends tzdata

RUN apt-get update && apt-get install -y \
	python3 \
	make \
	cmake \
	autoconf \
	automake \
	curl \
	bzip2 \
	zlib1g-dev \
	libbz2-dev \
	liblzma-dev \
	libcurl4-gnutls-dev \
	libssl-dev \
	libncurses5-dev \
	wget && \
	apt-get autoclean && rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/samtools/samtools/releases/download/1.12/samtools-1.12.tar.bz2 && \
	tar -vxjf samtools-1.12.tar.bz2
WORKDIR /samtools-1.12
RUN make
WORKDIR /
ENV PATH="$PATH:/samtools-1.12/"

RUN wget https://github.com/samtools/htslib/releases/download/1.12/htslib-1.12.tar.bz2 && \
	tar -vxjf htslib-1.12.tar.bz2
WORKDIR /htslib-1.12
RUN make
WORKDIR /
ENV PATH="$PATH:/htslib-1.12/"

RUN wget https://github.com/samtools/bcftools/releases/download/1.12/bcftools-1.12.tar.bz2 && \
	tar -vxjf bcftools-1.12.tar.bz2
WORKDIR /bcftools-1.12
RUN make
WORKDIR /
ENV PATH="$PATH:/bcftools-1.12/"


COPY scripts /app/


CMD ["sh", "/app/samtools.sh"]
