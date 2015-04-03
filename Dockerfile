FROM dockerfile/java:oracle-java8

ENV MESOS_VERSION 0.22.0
ENV MESOS_NATIVE_LIBRARY='/usr/local/lib/libmesos.so'

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get -y install unzip git wget tar build-essential python-dev python-boto libcurl4-nss-dev libsasl2-dev maven libapr1-dev libsvn-dev autoconf libtool
ADD http://archive.apache.org/dist/mesos/${MESOS_VERSION}/mesos-${MESOS_VERSION}.tar.gz /root/

WORKDIR /root
RUN tar -zxvf /root/mesos-${MESOS_VERSION}.tar.gz

RUN mkdir /root/mesos-${MESOS_VERSION}/build
WORKDIR /root/mesos-${MESOS_VERSION}/build
RUN ../configure
RUN make install

RUN rm -rf /root/*
