#!/bin/bash

sudo apt update -y
sudo apt install -y python3 python3-pip python3-dev build-essential
sudo pip3 install --upgrade pip
sudo pip3 install certbot
sudo pip3 install certbot-nginx
