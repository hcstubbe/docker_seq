# syntax=docker/dockerfile:1

# FROM python:3.8-buster

FROM ubuntu:20.04

ARG VERSION="2.18"

RUN apt-get update && apt-get install -y \
		python3 \
		curl \
		bzip2 && \
		apt-get autoclean && rm -rf /var/lib/apt/lists/*

COPY scripts /app/

RUN curl -L https://github.com/lh3/minimap2/releases/download/v${VERSION}/minimap2-${VERSION}_x64-linux.tar.bz2 | tar -jxvf - && \
 mkdir /data

ENV PATH="${PATH}:/minimap2-${VERSION}_x64-linux"

WORKDIR /app
CMD ["sh", "/app/minimap2.sh"]