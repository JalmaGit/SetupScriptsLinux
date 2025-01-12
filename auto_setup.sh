#!/bin/bash

echo "Hello Master, Welcome To Your New Linux Installation"
echo "I Will Install Your Programs For You"


echo "______Installing Required Tools_______"

cd ~

sudo apt update
yes | sudo apt upgrade

sudo apt install curl -y
sudo apt install wget -y
sudo apt install git -y
sudo apt install build-essentials -y

sudo apt install gcc -y
sudo apt install gcc-13 -y
sudo apt install gcc-14 -y
sudo apt update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-13 1
sudo apt update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-14 2

echo "______CMake Install_______"

sudo apt-get update
sudo apt-get install ca-certificates gpg wget

test -f /usr/share/doc/kitware-archive-keyring/copyright ||
wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | gpg --dearmor - | sudo tee /usr/share/keyrings/kitware-archive-keyring.gpg >/dev/null

echo 'deb [signed-by=/usr/share/keyrings/kitware-archive-keyring.gpg] https://apt.kitware.com/ubuntu/ noble main' | sudo tee /etc/apt/sources.list.d/kitware.list >/dev/null
sudo apt-get update

test -f /usr/share/doc/kitware-archive-keyring/copyright ||
sudo rm /usr/share/keyrings/kitware-archive-keyring.gpg

sudo apt-get install kitware-archive-keyring

yes | sudo apt-get install cmake



echo "______Pycharm Setup_______"

cd ~
DIRECTORY="/opt/pycharm-2024.3.1.1/"

if [ ! -d "$DIRECTORY" ]; then
    cd ~/Downloads
    wget "https://download.jetbrains.com/python/pycharm-professional-2024.3.1.1.tar.gz"
    sudo tar xzf pycharm-*.tar.gz -C /opt/
    sudo rm pycharm-*.tar.gz
    echo $"\nexport PATH="/opt/pycharm-2024.3.1.1/bin:$PATH""
else
    echo "Pycharm is already installed ${DIRECTORY}"
fi



echo "______Clion Setup_________"

cd ~
DIRECTORY="/opt/clion-2024.3.1.1/bin"

if [ ! -d "$DIRECTORY" ]; then
cd ~/Downloads
wget "https://download.jetbrains.com/cpp/CLion-2024.3.1.1.tar.gz"
sudo tar xvzf CLion-*.tar.gz -C /opt/
sudo rm CLion-*.tar.gz
echo $"\nexport PATH="/opt/clion-2024.3.1.1/bin:$PATH""
else
    echo "CLion is already installed ${DIRECTORY}"
fi



echo "______VS Code Setup_______"

cd ~/Downloads
wget "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64" -O vscode.deb
sudo apt install ./vscode.deb
sudo rm vscode.deb



echo "______Conda Install_______"

cd ~
yes | sudo apt install libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6
curl -O https://repo.anaconda.com/archive/Anaconda3-2024.10-1-Linux-x86_64.sh
yes | bash ~/Anaconda3-2024.10-1-Linux-x86_64.sh
conda config --set auto_activate_base True



echo "______Discord Setup_______"

cd ~/Downloads
wget 'https://discord.com/api/download?platform=linux&format=deb' -O discord.deb
sudo apt install ./discord.deb
sudo rm discord.deb



echo "______TeamSpeak3 Setup____"

cd ~
wget "https://files.teamspeak-services.com/releases/client/3.6.2/TeamSpeak3-Client-linux_amd64-3.6.2.run"
chmod +x TeamSpeak3-Client-linux_amd64-3.6.2.run
yes | sudo ./TeamSpeak3-Client-linux_amd64-3.6.2.run



echo "______Steam Setup_________"

cd ~/Downloads
wget https://cdn.fastly.steamstatic.com/client/installer/steam.deb -O steam.deb
sudo apt install ./steam.deb
sudo rm steam.deb