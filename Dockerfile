FROM debian:stretch

LABEL maintainer "cnspeckn@googlemail.com"
LABEL version "linaro-7.1.1-2017.08"

RUN apt-get update && \
    apt-get -y install curl xz-utils && \
    rm -fr /var/cache/apt

RUN curl -L https://github.com/tianon/gosu/releases/download/1.10/gosu-amd64 > /sbin/gosu && \
    chmod 700 /sbin/gosu

RUN cd /tmp && \
    curl -L https://releases.linaro.org/components/toolchain/binaries/latest/arm-eabi/gcc-linaro-7.1.1-2017.08-x86_64_arm-eabi.tar.xz > linearo.tar.xz && \
    tar -xf linearo.tar.xz && \
    mv gcc-linaro-7.1.1-2017.08-x86_64_arm-eabi /opt && \
    rm linearo.tar.xz


ADD wrapper.sh /
RUN chmod 777 /wrapper.sh && mkdir /work

ENV DOCKER_UID=0
ENV DOCKER_GID=0
VOLUME /work
WORKDIR /work

ENTRYPOINT [ "/wrapper.sh" ]
