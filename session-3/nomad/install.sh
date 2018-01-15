#!/bin/bash
sudo mkdir -p /opt/nomad/bin /opt/nomad/conf /opt/nomad/data
sudo wget https://releases.hashicorp.com/nomad/0.7.1/nomad_0.7.1_linux_amd64.zip -O nomad.zip;sudo unzip nomad.zip -d /opt/nomad/bin
echo "PATH=$PATH:/opt/nomad/bin" >> ~/.bashrc
source ~/.bashrc
sudo apt-get install git
git clone https://github.com/ops-school/session-containers.git
sudo cp session-containers/session-3/nomad/conf/* /opt/nomad/conf
