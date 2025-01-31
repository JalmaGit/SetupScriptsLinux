#!/bin/bash

echo "Hello, Welcome To Your New Linux Installation"
echo "I Will Install Your Programs For You"


echo "______Installing Required Tools_______"

sudo apt update
yes | sudo apt upgrade

sudo apt install curl -y
sudo apt install wget -y
sudo apt install git -y
sudo apt install build-essential -y
sudo apt install unzip -y

yes | sudo apt-get install python3-dev python3-numpy
yes | sudo apt-get install libavcodec-dev libavformat-dev libswscale-dev
yes | sudo apt-get install libgstreamer-plugins-base1.0-dev libgstreamer1.0-dev
yes | sudo apt-get install libgtk-3-dev
yes | sudo apt-get install libpng-dev
yes | sudo apt-get install libjpeg-dev
yes | sudo apt-get install libopenexr-dev
yes | sudo apt-get install libtiff-dev
yes | sudo apt-get install libwebp-dev

sudo apt install gcc -y
sudo apt install gcc-12 -y
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-12 1


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
    mkdir ~/Documents/Local/PythonEnvs
    mkdir ~/Documents/Local/Other
else
    echo "Local folder already exists"
fi


echo "______CMake Install_______"

if ! [ -x "$(command -v cmake)" ]; then
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



echo "______Conda Install________"

DIRECTORY=~/anaconda3

if [ ! -d "$DIRECTORY" ]; then
    yes | sudo apt install libgl1-mesa-glx libegl1-mesa libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6
    curl -O https://repo.anaconda.com/archive/Anaconda3-2024.10-1-Linux-aarch64.sh
    bash ~/Anaconda3-2024.10-1-Linux-aarch64.sh -b
    source ~/anaconda3/bin/activate
    conda init --all
    conda config --set auto_activate_base True
    sudo rm Anaconda3-2024.10-1-Linux-aarch64.sh
else
    echo "Conda is already installed"
fi



echo "______OpenCV Install________"
DIRECTORY="~/Libs/opencv"

if [ ! -d "$DIRECTORY" ]; then
    mkdir ~/Libs/
    cd ~/Libs
    
    wget -O opencv.zip https://github.com/opencv/opencv/archive/refs/tags/4.10.0.zip
    unzip opencv.zip
    mv opencv-4.10.0/ opencv

    cd opencv

    mkdir -p build && cd build
    cmake -D PYTHON3_EXECUTABLE=$HOME/anaconda3/bin/python -D PYTHON3_LIBRARY=$HOME/anaconda3/lib/python3.12 -D OPENCV_ENABLE_NONFREE=ON ../
    make -j4

    sudo make install
    
    cd ~/
else
    echo "OpenCV is already installed"
fi



echo "______RealSense D435 Setup________"
if ! [ -x "$(command -v realsense-viewer)" ]; then
    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key F6E65AC044F831AC80A06380C8B3A55A6F3EFCDE || sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-key F6E65AC044F831AC80A06380C8B3A55A6F3EFCDE
    sudo add-apt-repository "deb https://librealsense.intel.com/Debian/apt-repo $(lsb_release -cs) main" -u
    sudo apt-get install librealsense2-utils
    sudo apt-get install librealsense2-dev
else
    echo "RealSense is already installed"
fi


echo "______Pycharm Setup_______"

DIRECTORY="/opt/pycharm-2024.3.1.1/"

if [ ! -d "$DIRECTORY" ]; then
    wget "https://download.jetbrains.com/python/pycharm-professional-2024.3.1.1-aarch64.tar.gz"
    sudo tar xzf pycharm-*.tar.gz -C /opt/
    sudo rm pycharm-*.tar.gz
    echo -e "\nexport PATH=\"/opt/pycharm-2024.3.1.1/bin:\$PATH\"" >> ~/.bashrc
else
    echo "Pycharm is already installed ${DIRECTORY}"
fi



echo "______Clion Setup_________"

DIRECTORY="/opt/clion-2024.3.1.1/bin"

if [ ! -d "$DIRECTORY" ]; then
    wget "https://download.jetbrains.com/cpp/CLion-2024.3.2-aarch64.tar.gz"
    sudo tar xvzf CLion-*.tar.gz -C /opt/
    sudo rm CLion-*.tar.gz
    echo -e "\nexport PATH=\"/opt/clion-2024.3.2/bin:\$PATH\"" >> ~/.bashrc
else
    echo "CLion is already installed ${DIRECTORY}"
fi



echo "______VS Code Setup________"

if ! [ -x "$(command -v code)" ]; then
    echo "code code/add-microsoft-repo boolean true" | sudo debconf-set-selections
    wget "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-arm64" -O vscode.deb
    yes | sudo apt install ./vscode.deb
    sudo rm vscode.deb
else
    echo "Visual Studio Code is already installed"
fi