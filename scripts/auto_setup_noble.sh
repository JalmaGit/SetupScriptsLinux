#!/bin/bash
selection="$1"

echo "Hello, Welcome To Your New Linux Installation"
echo "I Will Install Your Programs For You"

echo "______Installing Required Tools_______"

sudo apt update
sudo apt upgrade -y
sudo apt install zlib1g -y

if lspci | grep -qi nvidia; then
    echo "Nvidia GPU detected. Proceeding with CUDA init..."
    echo >> ~/.bashrc
    cat << 'EOF' >> ~/.bashrc

export PATH=/usr/local/cuda-12.8/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda-12.8/lib64\
                         ${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
EOF
    sudo apt-get -y install cudnn9-cuda-12
else
    echo "No Nvidia GPU detected"
fi


echo "______KiCad Install_______"

if [ "$selection" = "1" ]; then

    DIRECTORY=~/Documents/KiCad
    if [ ! -d "$DIRECTORY" ]; then
        mkdir ~/Documents/KiCad
    else
        echo "KiCad folder already created"
    fi

    if ! [ -x "$(command -v kicad)" ]; then
        yes '' | sudo add-apt-repository ppa:kicad/kicad-9.0-releases
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
        cmake -D WITH_CUDA=ON -D WITH_CUDNN=ON -D CUDNN_LIBRARY=/usr/lib/x86_64-linux-gnu/libcudnn.so.9.7.1 -D CUDNN_INCLUDE_DIR=/usr/include -D WITH_GSTREAMER=ON -D WITH_LIBV4L=ON -D CMAKE_BUILD_TYPE=Release -D BUILD_opencv_python2=OFF -D BUILD_opencv_python3=ON -D INSTALL_PYTHON_EXAMPLES=OFF -D INSTALL_C_EXAMPLES=OFF -D BUILD_EXAMPLES=OFF ../opencv-4.10.0/ -D OPENCV_EXTRA_MODULES_PATH=../opencv_contrib-4.10.0/modules
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
