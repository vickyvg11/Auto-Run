#!/bin/bash

# Update package lists
sudo apt update

# Install Python and Pip
sudo apt install -y python3 python3-pip

# Install Flask
sudo pip3 install flask

# Install Redis
#sudo apt install lsb-release curl gpg
#curl -fsSL https://packages.redis.io/gpg | sudo gpg --dearmor -o /usr/share/keyrings/redis-archive-keyring.gpg

#echo "deb [signed-by=/usr/share/keyrings/redis-archive-keyring.gpg] https://packages.redis.io/deb $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/redis.list
#sudo add-apt-repository ppa:redislabs/redis -y
#sudo apt update

#sudo apt install -y redis-server

# Start Redis server
curl -fsSL https://packages.redis.io/gpg | sudo gpg --dearmor -o /usr/share/keyrings/redis-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/redis-archive-keyring.gpg] https://packages.redis.io/deb $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/redis.list

sudo apt-get update
sudo apt-get install redis -y
sudo systemctl start redis-server

# Enable Redis to start on boot
sudo systemctl enable redis-server
pip install redis
sudo apt install python3 python3-venv -y
python3.10 -m venv venv/
python3 python.py


echo "Python, Pip, Flask, and Redis have been installed successfully."