# syntax=docker/dockerfile:1

# FROM python:3.8-buster

FROM ubuntu:20.04

RUN apt-get update && apt-get install -y \
		python3 \
		python3-pip && \
		apt-get autoclean && rm -rf /var/lib/apt/lists/*
		
COPY scripts /app/

CMD ["sh", "/app/pipeline.sh"]