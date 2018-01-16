#!/bin/bash

sudo apt-get update

sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint "0EBFCD88
pub   4096R/0EBFCD88 2017-02-22
      Key fingerprint = 9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88
uid                  Docker Release (CE deb) <docker@docker.com>
sub   4096R/F273FCD8 2017-02-22"

sudo add-apt-repository \
  "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) \
  stable"

sudo apt-get update
sudo apt-get install -y docker-ce

sudo mkdir -p /opt/nomad/bin /opt/nomad/conf /opt/nomad/data /opt/nomad/logs /opt/consul/data /opt/consul/bin /opt/consul/logs; sudo chown -R ubuntu:ubuntu /opt/nomad /opt/consul
sudo apt-get install git unzip jq -y
sudo wget https://releases.hashicorp.com/nomad/0.7.1/nomad_0.7.1_linux_amd64.zip -O nomad.zip;sudo unzip nomad.zip -d /opt/nomad/bin
sudo wget https://releases.hashicorp.com/consul/1.0.2/consul_1.0.2_linux_amd64.zip -O consul.zip;sudo  unzip consul.zip -d /opt/consul/bin
echo "export PATH=$PATH:/opt/nomad/bin" >> ~/.bashrc # run source ~/.bashrc
git clone https://github.com/ops-school/session-containers.git
sudo cp session-containers/session-3/nomad/conf/* /opt/nomad/conf
