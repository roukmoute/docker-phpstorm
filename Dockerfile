FROM ubuntu:bionic
MAINTAINER Mathias STRASSER "contact@roukmoute.fr"

RUN apt-get update && \
    apt-get install -y \
    # Install common
    wget \
    # Install JDK
    openjdk-8-jre \
    # Install GIT to automatic detect it in PhpStorm
    git \
    # Install Python for WakaTime plugin
    python3 \
    # Install X11
    libxext-dev libxrender-dev libxtst-dev

# Install Docker
RUN wget -qO- https://get.docker.com/ | sh

# Clean
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

ENV DISPLAY=${DISPLAY:-":0"}

ARG phpstorm_folder=".PhpStorm2018.2"

RUN useradd -m -s /bin/bash developer \
    && mkdir /home/developer/$phpstorm_folder \
    && touch /home/developer/$phpstorm_folder/.keep \
    && chown -R developer.developer /home/developer \
    && mkdir -p /opt/phpstorm \
    && wget -O - https://download-cf.jetbrains.com/webide/PhpStorm-2018.2.2.tar.gz | tar xzf - --strip-components=1 -C "/opt/phpstorm" \
    && usermod -aG docker developer

USER developer
VOLUME /home/developer/$phpstorm_folder
CMD /opt/phpstorm/bin/phpstorm.sh
