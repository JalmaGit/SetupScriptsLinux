#!/bin/bash

#Run this script to update/download only discord
echo "______Discord Updater________"

wget 'https://discord.com/api/download?platform=linux&format=deb' -O discord.deb
sudo apt install ./discord.deb
sudo rm discord.deb