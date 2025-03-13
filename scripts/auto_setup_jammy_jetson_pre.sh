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

echo "______Folder Setup________"

DIRECTORY=~/Documents/GitHub
if [ ! -d "$DIRECTORY" ]; then
    mkdir ~/Documents/GitHub
else 
    echo "Github folder already exists"
fi

DIRECTORY=~/Documents/Local
if [ ! -d "$DIRECTORY" ]; then
    mkdir ~/Documents/Local
    mkdir ~/Documents/Local/PythonProjects
    mkdir ~/Documents/Local/ros2_3rdparty_ws
    mkdir ~/Documents/Local/ros2_3rdparty_ws
    mkdir ~/Documents/Local/ros2_ws
    mkdir ~/Documents/Local/ros2_ws/src
else
    echo "Local folder already exists"
fi


echo "______CMake Install_______"

if [ ! -x "$(command -v cmake)" ]; then
    sudo apt-get update
    sudo apt-get install ca-certificates gpg wget

    test -f /usr/share/doc/kitware-archive-keyring/copyright ||
    wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | gpg --dearmor - | sudo tee /usr/share/keyrings/kitware-archive-keyring.gpg >/dev/null

    echo 'deb [signed-by=/usr/share/keyrings/kitware-archive-keyring.gpg] https://apt.kitware.com/ubuntu/ jammy main' | sudo tee /etc/apt/sources.list.d/kitware.list >/dev/null
    sudo apt-get update

    test -f /usr/share/doc/kitware-archive-keyring/copyright ||
    sudo rm /usr/share/keyrings/kitware-archive-keyring.gpg

    sudo apt-get install kitware-archive-keyring

    yes | sudo apt-get install cmake
else
    echo "cmake is already installed"
fi
