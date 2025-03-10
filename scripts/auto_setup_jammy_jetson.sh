#!/bin/bash
selection="$1"

echo "Hello, Welcome To Your New Linux Installation"
echo "I Will Install Your Programs For You"


echo "______Installing Required Tools_______"

sudo apt update
sudo apt upgrade -y


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
    cmake -D CMAKE_BUILD_TYPE=Release -D BUILD_EXAMPLES=OFF ../

    make -j6

    sudo make install
    
    cd ~/
else
    echo "OpenCV is already installed"
fi


echo "______ROS2 Install_______"
DIRECTORY="/opt/ros"

if [ ! -d "$DIRECTORY" ]; then

    locale  # check for UTF-8

    sudo apt update && sudo apt install locales -y
    sudo locale-gen en_US en_US.UTF-8
    sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
    export LANG=en_US.UTF-8

    locale  # verify settings

    sudo apt install software-properties-common -y
    sudo add-apt-repository universe -y

    sudo apt update && sudo apt install curl -y
    sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg

    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

    sudo apt update

    sudo apt upgrade -y

    sudo apt install ros-humble-desktop -y
    sudo apt install ros-dev-tools

    echo -e "\nsource /opt/ros/humble/setup.bash" >> ~/.bashrc
else 
    echo "ROS2 is already installed"
fi


echo "______VCPKG Install_________"
DIRECTORY="~/Libs/vcpkg"

if [ ! -d "$DIRECTORY" ]; then
    cd ~/Libs

    git clone https://github.com/microsoft/vcpkg.git

    cd vcpkg && ./bootstrap-vcpkg.sh

    echo -e "\nexport VCPKG_ROOT=\$HOME/Libs/vcpkg" >> ~/.bashrc
    echo -e "\nexport PATH=\$VCPKG_ROOT:\$PATH" >> ~/.bashrc
    cd ~/
else
    echo "vcpkg already installed"
fi



echo "______RealSense D435 Setup________"
if [ ! -x "$(command -v realsense-viewer)" ]; then
    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key F6E65AC044F831AC80A06380C8B3A55A6F3EFCDE || sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-key F6E65AC044F831AC80A06380C8B3A55A6F3EFCDE
    sudo add-apt-repository "deb https://librealsense.intel.com/Debian/apt-repo $(lsb_release -cs) main" -u
    sudo apt-get install librealsense2-utils -y
    sudo apt-get install librealsense2-dev -y
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

DIRECTORY="/opt/clion-2024.3.2/bin"

if [ ! -d "$DIRECTORY" ]; then
    wget "https://download.jetbrains.com/cpp/CLion-2024.3.2-aarch64.tar.gz"
    sudo tar xvzf CLion-*.tar.gz -C /opt/
    sudo rm CLion-*.tar.gz
    echo -e "\nexport PATH=\"/opt/clion-2024.3.2/bin:\$PATH\"" >> ~/.bashrc
else
    echo "CLion is already installed ${DIRECTORY}"
fi


echo "______VS Code Setup________"

if [ ! -x "$(command -v code)" ]; then
    echo "code code/add-microsoft-repo boolean true" | sudo debconf-set-selections
    wget "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-arm64" -O vscode.deb
    yes | sudo apt install ./vscode.deb
    sudo rm vscode.deb
else
    echo "Visual Studio Code is already installed"
fi


echo "______Discord Setup________"

if [ "$selection" != "3" ]; then

    wget 'https://discord.com/api/download?platform=linux&format=deb' -O discord.deb
    sudo apt install ./discord.deb
    sudo rm discord.deb
else
    echo "Discord won't be installed"
fi


echo "_______________________________________________"
echo "|                                             |"
echo "|             RESTART TERMINAL                |"
echo "|                   FOR                       |"
echo "|                 CHANGES                     |"
echo "|                   TO                        |"
echo "|             COME INTO EFFECT                |"
echo "|                                             |"
echo "‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾"