#!/bin/bash

echo "Hello, Welcome To Your New Linux Installation"
echo "What do you want to do?"

echo "[1] Complete Install, Contains TeamsSpeak3, Discord, Steam, Programming Tools"
echo "[2] Standard Install, Contains Discord, Programming Tools"
echo "[3] Minimal Install, Contains Programming Tools"

read -p "Enter selection: " userInput

if [ "$userInput" = "1" ]; then
    echo "User Selected One [1]"
elif [ "$userInput" = "2" ]; then
    echo "User Selected Two [2]"
elif [ "$userInput" = "3" ]; then
    echo "User Selected Three [3]"
else
    echo "Wrong Input/Nothing was selected. Exiting..."
fi