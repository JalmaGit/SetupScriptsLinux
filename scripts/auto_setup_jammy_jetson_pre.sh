#!/bin/bash
selection="$1"

echo "Hello, Welcome To Your New Linux Installation"
echo "I Will Install Your Programs For You"


echo "______Installing Required Tools_______"

sudo apt update
sudo apt upgrade -y

sudo apt install curl -y
sudo apt install wget -y
sudo apt install git -y
sudo apt install build-essential -y
sudo apt install unzip -y
sudo apt install gnome-tweaks -y

sudo apt-get install python3-dev -y python3-numpy -y python3-pip -y
yes | sudo apt-get install libavcodec-dev libavformat-dev libswscale-dev
yes | sudo apt-get install libgstreamer-plugins-base1.0-dev libgstreamer1.0-dev
yes | sudo apt-get install libgtk-3-dev
yes | sudo apt-get install libpng-dev
yes | sudo apt-get install libjpeg-dev
yes | sudo apt-get install libopenexr-dev
yes | sudo apt-get install libtiff-dev
yes | sudo apt-get install libwebp-dev

sudo apt install ninja-build -y
sudo apt install arduino -y

sudo apt install gcc -y