#!/bin/bash
sudo mkdir -p /opt/nomad/bin /opt/nomad/conf /opt/nomad/data; /opt/nomad/logs /opt/consul/data /opt/consul/bin /opt/consul/logs; sudo chown -R ubuntu:ubuntu /opt/nomad /opt/consul
sudo apt-get install git unzip jq -y
sudo wget https://releases.hashicorp.com/nomad/0.7.1/nomad_0.7.1_linux_amd64.zip -O nomad.zip;sudo unzip nomad.zip -d /opt/nomad/bin
sudo wget https://releases.hashicorp.com/consul/1.0.2/consul_1.0.2_linux_amd64.zip -O consul.zip;sudo  unzip consul.zip -d /opt/consul/bin
echo "export PATH=$PATH:/opt/nomad/bin" >> ~/.bashrc # run source ~/.bashrc
git clone https://github.com/ops-school/session-containers.git
sudo cp session-containers/session-3/nomad/conf/* /opt/nomad/conf
