# syntax=docker/dockerfile:1

# FROM python:3.8-buster

FROM ubuntu:21.04

RUN apt-get update && apt-get install -y \
		wget \
		curl \
		minimap2 \
		stringtie \
		samtools && \
		apt-get autoclean && rm -rf /var/lib/apt/lists/*
		
COPY scripts /app/

CMD ["sh", "/app/pipeline.sh"]