FROM ubuntu 

LABEL maintainer="Ben Mason <locutus@the-collective.net>"

RUN apt update && apt install -y git build-essential librevisa libusb libftdi1 doxygen graphviz python python-pip python3 python3-pip ruby ruby-dev 

RUN pip3 install --no-cache-dir --upgrade numpy pygobject doxypy 

RUN git clone git://sigrok.org/sigrok-util && \
    cd cd sigrok-util/cross-compile/linux && \
    ./sigrok-cross-linux
