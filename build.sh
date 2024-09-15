#!/bin/sh

set -e

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/compat

rm -rdf llama.cpp
[ -z "$LLAMA_CPP_VERSION" ] && LLAMA_CPP_VERSION=master
git clone -b "$LLAMA_CPP_VERSION" https://github.com/ggerganov/llama.cpp llama.cpp
mkdir build
cmake -B build llama.cpp -DGGML_NATIVE=OFF -DLLAMA_BUILD_SERVER=ON -DGGML_CUDA=ON -DBUILD_SHARED_LIBS=ON -DGGML_RPC=ON
cmake --build build --config Release -j $(nproc)
cmake --install build --prefix install
tar czvf build.tar.gz -C ./install .