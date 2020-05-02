FROM ubuntu:18.04 

LABEL maintainer="Ben Mason <locutus@the-collective.net>"
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y autoconf autoconf-archive automake build-essential check cmake default-jdk doxygen g++ gcc gettext git graphviz libboost-dev libboost-filesystem-dev libboost-serialization-dev libboost-system-dev libboost-test-dev libcairo2-dev libftdi-dev libftdi1 libftdi1-dev libgirepository1.0-dev libglib2.0-dev libglibmm-2.4-dev libqt5svg5-dev libqwt-qt5-dev libtool libusb-1.0-0 libusb-1.0-0-dev libvisa-dev libvisa0 libzip-dev make pkg-config python python-dev python-gi-dev python-numpy python-setuptools python3 python3-dev python3-pip qtbase5-dev ruby ruby-dev sdcc sdcc-libraries swig qttools5-dev
#libzip4 python-pip pyvisa

# libzip to found
RUN pip3 install --no-cache-dir --upgrade numpy pygobject doxypy 

RUN git clone git://sigrok.org/sigrok-util && \
    cd sigrok-util/cross-compile/linux && \
    ./sigrok-cross-linux

RUN echo /root/sr/lib > /etc/ld.so.conf.d/sigrok.conf

ENV PATH="/root/sr/bin/:${PATH}"
WORKDIR /root
