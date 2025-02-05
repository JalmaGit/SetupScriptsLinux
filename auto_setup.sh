#!/bin/bash

echo "Hello, Welcome To Your New Linux Installation"
echo "What do you want to do?"

echo "[1] Complete Install, Contains TeamsSpeak3, Steam, Discord, VSCODE, Pycharm, CLion, ROS2, OpenCV, VCPKG, KiCad, CMAKE, Anaconda3 and more programming tools"
echo "[2] Standard Install, Contains Discord, VSCODE, Pycharm, CLion, ROS2, OpenCV, VCPKG, CMAKE, and more standard programming tools"
echo "[3] Minimal Install, Contains VSCODE, ROS2, OPENCV, VCPKG, CMAKE, and more standard programming tools"

read -p "Enter selection: " userInput

if [ "$userInput" = "1" ]; then
    echo "User Selected One [1]"
    if [ "$(lsb_release -rs)" = "22.04" ]; then
        if [ "$(uname -m)" = "x86_64" ]; then
            source scripts/auto_setup_jammy.sh 1
        elif [ "$(uname -m)" = "aarch64" ]; then
            source scripts/auto_setup_jammy_jetson.sh 1
        else
            echo "Not Supported"
        fi
    elif [ "$(lsb_release -rs)" = "24.04" ]; then
        if [ "$(uname -m)" = "x86_64" ]; then
            source scripts/auto_setup_noble.sh 1
        elif [ "$(uname -m)" = "aarch64" ]; then
            echo "Not Supported"
        else
            echo "Not Supported"
        fi
    else
        echo "Your current distro is not supported"
        echo "Exiting..."
    fi

elif [ "$userInput" = "2" ]; then
    echo "User Selected Two [2]"
    
    if [ "$(lsb_release -rs)" = "22.04" ]; then
        if [ "$(uname -m)" = "x86_64" ]; then
            source scripts/auto_setup_jammy.sh 2
        elif [ "$(uname -m)" = "aarch64" ]; then
            source scripts/auto_setup_jammy_jetson.sh 2
        else
            echo "Not Supported"
        fi
    elif [ "$(lsb_release -rs)" = "24.04" ]; then
        if [ "$(uname -m)" = "x86_64" ]; then
            source scripts/auto_setup_noble.sh 2
        elif [ "$(uname -m)" = "aarch64" ]; then
            echo "Not Supported"
        else
            echo "Not Supported"
        fi

    else
        echo "Your current distro is not supported"
        echo "Exiting..."
    fi

elif [ "$userInput" = "3" ]; then
    echo "User Selected Three [3]"
    
    if [ "$(lsb_release -rs)" = "22.04" ]; then
        if [ "$(uname -m)" = "x86_64" ]; then
            source scripts/auto_setup_jammy.sh 3
        elif [ "$(uname -m)" = "aarch64" ]; then
            source scripts/auto_setup_jammy_jetson.sh 3
        else
            echo "Not Supported"
        fi
    elif [ "$(lsb_release -rs)" = "24.04" ]; then
        if [ "$(uname -m)" = "x86_64" ]; then
            source scripts/auto_setup_noble.sh 3
        elif [ "$(uname -m)" = "aarch64" ]; then
            echo "Not Supported"
        else
            echo "Not Supported"
        fi
    else
        echo "Your current distro is not supported"
        echo "Exiting..."
    fi 
else
    echo "Wrong Input/Nothing was selected. Exiting..."
fi