#!/bin/sh

set -e

docker build \
    -t llama-cpp-build \
    --no-cache \
    --build-arg UBUNTU_VERSION=$UBUNTU_VERSION \
    --build-arg CUDA_VERSION=$CUDA_VERSION \
    --build-arg LLAMA_CPP_VERSION=$LLAMA_CPP_VERSION \
    .
docker run --name llama-cpp-build-container -t llama-cpp-build
docker cp llama-cpp-build-container:/build.tar.gz .