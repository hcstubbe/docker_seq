#!/bin/bash

PATH=$1/basecalled/pass/

find /data/$PATH -iname *.fastq -exec cat {} >> $PATH/all.fastq \;

exit