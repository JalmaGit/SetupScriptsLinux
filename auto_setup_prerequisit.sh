#!/bin/bash


if [ "$(lsb_release -rs)" = "22.04" ]; then
    if [ "$(uname -m)" = "x86_64" ]; then
        source scripts/auto_setup_jammy_pre.sh 1
    elif [ "$(uname -m)" = "aarch64" ]; then
        source scripts/auto_setup_jammy_jetson_pre.sh 1
    else
        echo "Not Supported"
    fi
elif [ "$(lsb_release -rs)" = "24.04" ]; then
    if [ "$(uname -m)" = "x86_64" ]; then
        source scripts/auto_setup_noble_pre.sh 1
    elif [ "$(uname -m)" = "aarch64" ]; then
        echo "Not Supported"
    else
        echo "Not Supported"
    fi
else
    echo "Your current distro is not supported"
    echo "Exiting..."
fi