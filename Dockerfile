FROM ubuntu:22.04

# Install dependencies
RUN apt-get -y update \
  && apt-get -y install git \
  make \
  ninja-build \
  gettext \
  cmake \
  unzip \
  curl 

ENV CMAKE_BUILD_TYPE=Release

WORKDIR /opt/neovim

RUN git clone https://github.com/neovim/neovim.git

WORKDIR /opt/neovim/neovim

RUN make install

RUN git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.13.1

RUN echo ". $HOME/.asdf/asdf.sh" >> ~/.bashrc
