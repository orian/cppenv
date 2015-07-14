# To build use:
# docker build -t orian/cppenv:v1 .
FROM ubuntu:15.04
MAINTAINER Pawel Szczur <public at pawelsz.eu>

LABEL description="A linux C++ build environment."

RUN apt-get update && apt-get install -y \
  gcc \
  clang \
  cmake \
  libgtest-dev \
  libgoogle-glog-dev \
  libboost-all-dev \
  g++ `#Fb folly deps` \
  automake \
  autoconf \
  autoconf-archive \
  libtool \
  libboost-all-dev \
  libevent-dev \
  libdouble-conversion-dev \
  libgoogle-glog-dev \
  libgflags-dev \
  liblz4-dev \
  liblzma-dev \
  libsnappy-dev \
  make \
  zlib1g-dev \
  binutils-dev \
  libjemalloc-dev \
  libssl-dev \
  libiberty-dev

ENV LD_LIBRARY_PATH=/libs
ENV CPLUS_INCLUDE_PATH=/libs/include

RUN mkdir /src
RUN mkdir /build
WORKDIR /build

CMD ["/bin/bash"]