#!/bin/bash
selection="$1"

echo "Hello, Welcome To Your New Linux Installation"
echo "I Will Install Your Programs For You"


echo "______Installing Required Tools_______"

sudo apt update
yes | sudo apt upgrade


echo "______KiCad Install_______"

if [ "$selection" = "1" ]; then

    DIRECTORY=~/Documents/KiCad
    if [ ! -d "$DIRECTORY" ]; then
        mkdir ~/Documents/KiCad
    else
        echo "KiCad folder already created"
    fi

    if ! [ -x "$(command -v kicad)" ]; then
        yes '' | sudo add-apt-repository ppa:kicad/kicad-8.0-releases
        sudo apt update
        yes | sudo apt install kicad
    else
        echo "KiCad is already installed"
    fi

fi



echo "______OpenCV Install________"
DIRECTORY="~/Libs/opencv"

if [ ! -d "$DIRECTORY" ]; then
    mkdir ~/Libs/
    mkdir ~/Libs/opencv
    cd ~/Libs/opencv
    
    wget -O opencv.zip https://github.com/opencv/opencv/archive/refs/tags/4.10.0.zip
    wget -O opencv_contrib.zip https://github.com/opencv/opencv_contrib/archive/4.10.0.zip
    unzip opencv.zip
    unzip opencv_contrib.zip

    mkdir -p build && cd build

    if lspci | grep -qi nvidia; then
        cmake -D WITH_CUDA=ON -D WITH_CUDNN=ON -D CUDNN_LIBRARY=/usr/lib/x86_64-linux-gnu/libcudnn.so.9.7.1 -D CUDNN_INCLUDE_DIR=/usr/include -D WITH_GSTREAMER=ON -D WITH_LIBV4L=ON -D CMAKE_BUILD_TYPE=Release -D  -D BUILD_opencv_python2=OFF -D BUILD_opencv_python3=ON -D INSTALL_PYTHON_EXAMPLES=OFF -D INSTALL_C_EXAMPLES=OFF -D BUILD_EXAMPLES=OFF ../opencv-4.10.0/ -D OPENCV_EXTRA_MODULES_PATH=../opencv_contrib-4.10.0/modules
    else
        cmake -D CMAKE_BUILD_TYPE=Release -D BUILD_EXAMPLES=OFF ../
    fi

    make -j8

    sudo make install
    
    cd ~/
else
    echo "OpenCV is already installed"
fi


echo "______Pycharm Setup_______"

DIRECTORY="/opt/pycharm-2024.3.1.1/"

if [ ! -d "$DIRECTORY" ] && [ "$selection" != "3" ]; then
    wget "https://download.jetbrains.com/python/pycharm-professional-2024.3.1.1.tar.gz"
    sudo tar xzf pycharm-*.tar.gz -C /opt/
    sudo rm pycharm-*.tar.gz
    echo -e "\nexport PATH=\"/opt/pycharm-2024.3.1.1/bin:\$PATH\"" >> ~/.bashrc
else
    echo "Pycharm is already installed ${DIRECTORY}"
fi



echo "______Clion Setup_________"

DIRECTORY="/opt/clion-2024.3.1.1/bin"

if [ ! -d "$DIRECTORY" ] && [ "$selection" != "3" ]; then
    wget "https://download.jetbrains.com/cpp/CLion-2024.3.1.1.tar.gz"
    sudo tar xvzf CLion-*.tar.gz -C /opt/
    sudo rm CLion-*.tar.gz
    echo -e "\nexport PATH=\"/opt/clion-2024.3.1.1/bin:\$PATH\"" >> ~/.bashrc
else
    echo "CLion is already installed ${DIRECTORY}"
fi



echo "______VS Code Setup________"

if [ ! -x "$(command -v code)" ]; then
    echo "code code/add-microsoft-repo boolean true" | sudo debconf-set-selections
    wget "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64" -O vscode.deb
    yes | sudo apt install ./vscode.deb
    sudo rm vscode.deb
else
    echo "Visual Studio Code is already installed"
fi



echo "______Conda Install________"

DIRECTORY=~/anaconda3

if [ ! -d "$DIRECTORY" ] && [ "$selection" = "1"  ]; then
    yes | sudo apt install libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6
    curl -O https://repo.anaconda.com/archive/Anaconda3-2024.10-1-Linux-x86_64.sh
    bash ~/Anaconda3-2024.10-1-Linux-x86_64.sh -b
    source ~/anaconda3/bin/activate
    conda init --all
    conda config --set auto_activate_base True
    sudo rm Anaconda3-2024.10-1-Linux-x86_64.sh
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

    if [ "$selection" = "1" ]; then
        cmake -D CMAKE_BUILD_TYPE=Release -D PYTHON3_EXECUTABLE=~/anaconda3/bin/python -D PYTHON3_LIBRARY=~/anaconda3/lib/python3.12 -D PYTHON3_INCLUDE_DIR=~/anaconda3/include/python3.12 -D PYTHON3_PACKAGES_PATH=~/anaconda3/lib/python3.12/site-packages -D BUILD_opencv_python2=OFF -D BUILD_opencv_python3=ON -D INSTALL_PYTHON_EXAMPLES=OFF -D INSTALL_C_EXAMPLES=OFF -D BUILD_EXAMPLES=OFF ../
    else
        cmake -D CMAKE_BUILD_TYPE=Release -D BUILD_EXAMPLES=OFF ../
    fi

    make -j8

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
    sudo apt update && sudo apt install ros-dev-tools -y

    sudo apt update && sudo apt upgrade -y

    sudo apt install ros-jazzy-desktop

    echo -e "\nsource /opt/ros/jazzy/setup.bash" >> ~/.bashrc
else 
    echo "ROS2 is already installed"
fi



echo "______Discord Setup________"

if [ "$selection" != "3" ]; then

    wget 'https://discord.com/api/download?platform=linux&format=deb' -O discord.deb
    sudo apt install ./discord.deb
    sudo rm discord.deb
else
    echo "Discord won't be installed"
fi



echo "______Steam Setup__________"

if [ ! -x "$(command -v steam)" ] && [ "$selection" = "1" ]; then
    wget https://cdn.fastly.steamstatic.com/client/installer/steam.deb -O steam.deb
    yes | sudo apt install ./steam.deb
    sudo rm steam.deb
else
    echo "steam is already installed or won't be installed"
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
