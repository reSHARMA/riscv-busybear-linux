FROM ubuntu:18.04
LABEL maintainer=Reshabh

RUN apt-get update && \
  apt-get install -y --no-install-recommends \
  autoconf \
  automake \
  autotools-dev \
  curl \
  libmpc-dev \
  libmpfr-dev \
  libgmp-dev \
  gawk \
  build-essential \
  bison \
  flex \
  texinfo \
  gperf \
  libtool \
  patchutils \
  bc \
  zlib1g-dev \
  libexpat-dev \
  git \
  python3 \
  pkg-config \
  libglib2.0-dev \
  libfdt-dev \
  libpixman-1-dev \
  zlib1g-dev \
  libnfs-dev \
  libiscsi-dev \
  sudo \
  ca-certificates && update-ca-certificates
COPY ./ /
RUN /bin/bash /run.sh
ENTRYPOINT /bin/bash /image.sh

