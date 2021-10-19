#!/bin/sh
set -e
mkdir -p "output"
mkdir -p "output-arm"
#builds a native binary and zip
docker build  -t rust-lambda .


#copy from the docker container to host
containerId=$(docker create -ti rust-lambda bash)
docker cp ${containerId}:function.zip ./output

docker build --file Dockerfile.arm -t rust-lambda-arm .


#copy from the docker container to host
containerId=$(docker create -ti rust-lambda-arm bash)
docker cp ${containerId}:function.zip ./output-arm

