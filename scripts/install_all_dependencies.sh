#!/bin/bash

sudo apt update -y

echo "=================== Installing Python and PIP ==================="
sudo apt install -y python3 python3-pip python3-dev build-essential
sudo pip3 install --upgrade pip

echo "=================== Installing Nginx ==================="
sudo apt install -y nginx build-essential
