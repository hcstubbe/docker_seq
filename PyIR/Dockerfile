# syntax=docker/dockerfile:1

# FROM python:3.8-buster

FROM ubuntu:20.04
# FROM 


RUN apt-get update && apt-get install -y \
		python3 \
		python3-pip && \
		apt-get autoclean && rm -rf /var/lib/apt/lists/*
		
		


# add required Debian packages here (uncomment)
RUN apt-get clean && apt-get update && apt-get install -y wget zip python-pip python-biopython git
RUN wget -O - ftp://ftp.ncbi.nih.gov/blast/executables/igblast/release/1.8.0/ncbi-igblast-1.8.0-x64-linux.tar.gz | tar -xzC ${BBX_OPTDIR}
RUN wget -P /opt/ncbi-igblast-1.8.0/internal_data -w 1 -nH --cut-dirs=5 -r ftp://ftp.ncbi.nih.gov/blast/executables/igblast/release/internal_data/
RUN wget -P /opt/ncbi-igblast-1.8.0/database -w 1 -nH --cut-dirs=5 -r ftp://ftp.ncbi.nih.gov/blast/executables/igblast/release/database/
RUN wget -P /opt/ncbi-igblast-1.8.0/optional_file -w 1 -nH --cut-dirs=5 -r ftp://ftp.ncbi.nih.gov/blast/executables/igblast/release/optional_file/
RUN git  clone https://github.com/williamdlees/TRIgS ${BBX_OPTDIR}/TRIgS

# add task definitions
COPY tasks ${BBX_TASKDIR}

# add required program files
COPY opt /app/opt

COPY etc /app/etc


COPY scripts /app/scripts


CMD ["sh", "/app/scripts/igblast.sh"]