ARG UBUNTU_VERSION
ARG CUDA_VERSION

FROM nvidia/cuda:${CUDA_VERSION}-devel-ubuntu${UBUNTU_VERSION}

COPY build.sh /build.sh
RUN apt-get update
RUN apt-get install -y build-essential libcurl4-openssl-dev git tar cmake

ARG LLAMA_CPP_VERSION=master
ENV LLAMA_CPP_VERSION=${LLAMA_CPP_VERSION}
CMD ["/bin/sh", "/build.sh"]
