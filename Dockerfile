FROM docker.io/ubuntu:16.04

RUN \
  echo 'deb http://archive.ubuntu.com/ubuntu/ xenial multiverse' >> /etc/apt/sources.list && \
  echo 'deb http://archive.ubuntu.com/ubuntu/ xenial-updates multiverse' >> /etc/apt/sources.list

RUN \
  apt-get update && \
  apt-get -y install xvfb apt-transport-https phantomjs

RUN echo yes | apt-get -y install ttf-mscorefonts-installer

ENV TZ=America/Sao_Paulo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && \
  apt-get -y install tzdata

RUN \
  addgroup --gid 999 docker && \
  useradd apache && \
  usermod -aG docker apache