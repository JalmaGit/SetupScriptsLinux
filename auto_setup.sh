#!/bin/bash

echo "Hello, Welcome To Your New Linux Installation"
echo "What do you want to do?"

echo "[1] Complete Install, Contains TeamsSpeak3, Discord, Steam, Programming Tools"
echo "[2] Standard Install, Contains Discord, Programming Tools"
echo "[3] Minimal Install, Contains Programming Tools"

read -p "Enter selection: " userInput

if [ "$userInput" = "1" ]; then
    echo "User Selected One [1]"
    if [ "$(lsb_release -rs)" = "22.04" ]; then
        echo "Not Currently Supported"
    elif [ "$(lsb_release -rs)" = "24.04" ]; then
        echo "Not Currently Supported"
    else
        echo "Your current distro is not supported"
        echo "Exiting..."
    fi

elif [ "$userInput" = "2" ]; then
    echo "User Selected Two [2]"
    
    if [ "$(lsb_release -rs)" = "22.04" ]; then
        if [ "$(uname -m)" = "x86_64" ]; then
            source scripts/auto_setup_jammy.sh
        elif [ "$(uname -m)" = "aarch64" ]; then
            source scripts/auto_setup_jammy_jetson.sh
        else
            echo "Not Supported"
        fi
    elif [ "$(lsb_release -rs)" = "24.04" ]; then
        echo "it works"
        if [ "$(uname -m)" = "x86_64" ]; then
            source scripts/auto_setup_noble.sh
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
        echo "Not Currently Supported"
    elif [ "$(lsb_release -rs)" = "24.04" ]; then
        echo "Not Currently Supported"
    else
        echo "Your current distro is not supported"
        echo "Exiting..."
    fi 
else
    echo "Wrong Input/Nothing was selected. Exiting..."
fi