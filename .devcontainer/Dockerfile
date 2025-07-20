FROM docker.io/jenkins/inbound-agent

USER root

RUN apt-get update && \
    apt-get install --no-install-recommends -y curl jq git build-essential python3 python3-pip procps unzip && \
    rm -rf /var/lib/apt/lists/*

RUN pip3 install --upgrade pip && \
    pip3 install intelhex rsa GitPython pyserial conan

RUN mkdir -p /usr/lib/gcc-arm \
    # TODO: CHANGE Artifactory url or download stm32 tool chain from somewhere else !!!
    && curl http://artifactory/artifactory/generic-local/gcc-arm-none-eabi/stm32.10.3-2021.10/stm32.10.3-2021.10.linux64_1.0.0.202111181127.tar.gz \
    | tar zxf - -C /usr/lib/gcc-arm/ && \
    chmod -R +xr /usr/lib/gcc-arm/

ENV PATH="/usr/lib/gcc-arm/bin:${PATH}"
