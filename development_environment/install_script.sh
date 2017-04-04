#!/bin/bash

# update the sources list
sudo apt-get update -y

# upgrade any plackages available
sudo apt-get upgrade -y

# install nginx
sudo apt-get install nginx -y

# install npm
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install -y nodejs

# install pm2
sudo npm install pm2 -g

# install git
sudo apt-get install git -y
