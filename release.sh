#!/bin/sh

set -e

if [ -z "$LLAMA_CPP_VERSION" ]; then
    echo 'Error: LLAMA_CPP_VERSION is undefined.' 1>&2
    exit 1
fi
mv build.tar.gz "llama.cpp-$LLAMA_CPP_VERSION-ubuntu$UBUNTU_VERSION-cu$CUDA_VERSION.tar.gz"
gh release create "$LLAMA_CPP_VERSION" "llama.cpp-$LLAMA_CPP_VERSION-ubuntu$UBUNTU_VERSION-cu$CUDA_VERSION.tar.gz"