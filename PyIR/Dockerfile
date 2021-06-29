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

RUN pip3 install tqdm  && \
	git clone https://github.com/crowelab/PyIR  && \
	cd PyIR && \
	pip3 install .

	
RUN mkdir /app/igblast
RUN mkdir /app/igblast/bin

# Download IgBLAST from NCBI
# Download and extract IgBLAST (code from https://changeo.readthedocs.io/en/stable/examples/igblast.html)
ENV VERSION="1.17.0"
RUN  cd /app/igblast && \
	wget ftp://ftp.ncbi.nih.gov/blast/executables/igblast/release/${VERSION}/ncbi-igblast-${VERSION}-x64-linux.tar.gz  && \
	tar -zxf ncbi-igblast-${VERSION}-x64-linux.tar.gz  && \
	cp ncbi-igblast-${VERSION}/bin/* /app/igblast/bin   && \
	rm ncbi-igblast-${VERSION}-x64-linux.tar.gz
	
# Download reference databases and setup IGDATA directory 
COPY scripts /app/igblast/scripts	
RUN /app/igblast/scripts/fetch_igblastdb.sh -o /app/igblast/data && \
	cp -r /app/igblast/ncbi-igblast-${VERSION}/internal_data /app/igblast/data && \
	cp -r /app/igblast/ncbi-igblast-${VERSION}/optional_file /app/igblast/data && \
	# Build IgBLAST database from IMGT reference sequences && \
	/app/igblast/scripts/fetch_imgtdb.sh -o /app/igblast/data/germlines/imgt && \
	/app/igblast/scripts/imgt2igblast.sh -i /app/igblast/data/germlines/imgt -o /app/igblast/data/igblast

ENV PATH="$PATH:/app/igblast/bin/"

COPY scripts /app/scripts



CMD ["sh", "/app/scripts/igblast.sh"]