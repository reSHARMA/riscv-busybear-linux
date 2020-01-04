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
  libexpat-dev

COPY ./* /
RUN chmod +x /run.sh
ENTRYPOINT ["bash", "run.sh"]


