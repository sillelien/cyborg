FROM ubuntu:14.04
RUN apt-get update &&  apt-get install -y build-essential build-essential gcc-multilib g++-multilib openjdk-7-jdk wget docker
RUN wget "http://download.robovm.org/robovm-1.4.0.tar.gz"
RUN tar xvfz robovm-1.4.0.tar.gz && mv robovm-1.4.0 /usr/local/robovm
VOLUME /build
WORKDIR /build
COPY wrap.sh /wrap.sh
RUN chmod 755 /wrap.sh
ENTRYPOINT ["/wrap.sh"]
