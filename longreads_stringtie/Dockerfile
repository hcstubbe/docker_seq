# syntax=docker/dockerfile:1

FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
		wget \
		curl \
		minimap2 \
		stringtie \
		samtools && \
		apt-get autoclean && rm -rf /var/lib/apt/lists/*
		
COPY scripts /app/
