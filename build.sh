#!/bin/bash

sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install build-essential libssl-dev libffi-dev python-dev python-pip

sudo -H pip install --upgrade pip
sudo -H pip install ansible==2.2.2.0

ansible-playbook -i "localhost," -c local playbook.yml

sudo apt -y autoremove

echo -e "\n\n-----------------------\nNOTES\n-----------------------\nrun: jetbrains-toolbox &"
