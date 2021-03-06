#!/bin/bash

# install needed dependencies
sudo apt-get update
sudo apt-get install \
      build-essential pkg-config libc6-dev m4 g++-multilib \
      autoconf libtool ncurses-dev unzip git python python-zmq \
      zlib1g-dev wget curl bsdmainutils automake 

# bitzecBitcore
cd
git clone https://github.com/bitzec/bitzec
cd bitzec
./zcutil/fetch-params.sh
./zcutil/build.sh --disable-tests -j$(nproc)
mkdir -p ~/.bitzec
echo "addnode=bzcseed.raptorpool.org" >~/.bitzec/bitzec.conf
cd
echo "Bitzecd with extended RPC functionalities is prepared. Please run following command to install insight explorer for bitzec"
echo "wget -qO- https://raw.githubusercontent.com/bitzec/bitcore-node-bitzec/master/installExplorer.sh | bash"
