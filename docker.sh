#!/bin/sh

set -e

docker build \
    -t llama-cpp-build \
    --no-cache \
    --build-arg UBUNTU_VERSION=$UBUNTU_VERSION \
    --build-arg CUDA_VERSION=$CUDA_VERSION \
    "$GITHUB_WORKSPACE/Dockerfile"
docker run -t llama-cpp-build --name llama-cpp-build-container
docker cp llama-cpp-build-container:/build.tar.gz .