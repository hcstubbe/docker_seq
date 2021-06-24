# syntax=docker/dockerfile:1

# FROM python:3.8-buster

FROM ubuntu:latest


WORKDIR /app

RUN apt-get update && apt-get install -y \
		python3 \
		curl \
		git \
		bzip2 && \
		apt-get autoclean && rm -rf /var/lib/apt/lists/*
		
RUN git clone https://github.com/gpertea/stringtie.git
WORKDIR /app/stringtie
RUN make release
WORKDIR /app

COPY scripts /app

CMD ["sh", "/app/stringtie.sh"]
