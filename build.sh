#!/bin/bash

sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install build-essential libssl-dev libffi-dev python-dev python-pip

pip install --upgrade pip
pip install ansible==2.1.1.0

ansible-playbook -i "localhost," -c local playbook.yml

sudo apt -y autoremove

sudo intel-graphics-update-tool &
jetbrains-toolbox &
