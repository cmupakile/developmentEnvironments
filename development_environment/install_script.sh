#!/bin/bash

# update the sources list
sudo apt-get update -y

# upgrade any plackages available
sudo apt-get upgrade -y

# install git
sudo apt-get install git -y


# install npm
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install -y nodejs

# install pm2
sudo npm install pm2 -g
###############################

# going to this directory
cd ~/app

#Download the curl and nginx
sudo apt-get install curl
sudo apt-get install nginx



# change directory
cd ~/
sudo rm -r /etc/nginx/sites-available/default
          # /home/ubuntu/environment --- this is a safer pathfinder
sudo cp /home/ubuntu/developmentEnvironment/nginx.default /etc/nginx/sites-available/default

 # sudo mv /etc/nginx/sites-available/nginx.default /etc/nginx/sites-available/default

# restart the server
sudo service nginx restart

echo 'script working'
