# syntax=docker/dockerfile:1

# FROM python:3.8-buster

FROM ubuntu:20.04


WORKDIR /app


RUN apt-get update 
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata

RUN apt-get update && apt-get install -y \
		wget \
		gawk \
		git \
		tar \
		python3 \
		python3-pip \
		libuv1-dev \
		lsb && \
		apt-get autoclean && rm -rf /var/lib/apt/lists/*

RUN pip3 install changeo

COPY ./scripts/ scripts/

ENV PATH="${PATH}:/app/scripts/"

	

# Download and extract IgBLAST
ENV VERSION="1.17.0"
RUN mkdir /app/bin
RUN wget ftp://ftp.ncbi.nih.gov/blast/executables/igblast/release/${VERSION}/ncbi-igblast-${VERSION}-x64-linux.tar.gz && \
	tar -zxf ncbi-igblast-${VERSION}-x64-linux.tar.gz && \
	cp ncbi-igblast-${VERSION}/bin/* /app/bin && \
	fetch_igblastdb.sh -o /app/share/igblast && \
	cp -r ncbi-igblast-${VERSION}/internal_data /app/share/igblast && \
	cp -r ncbi-igblast-${VERSION}/optional_file /app/share/igblast && \
	fetch_imgtdb.sh -o /app/share/germlines/imgt && \
	imgt2igblast.sh -i /app/share/germlines/imgt -o /app/share/igblast


CMD ["sh", "/app/scripts/changeo.sh"]