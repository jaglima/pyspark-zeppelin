#!/bin/bash


docker run -it --rm -p 8888:8888 -p 8080:8080 \
-v $PWD/data:/root/notebooks \
pyspark-zeppelin $1

