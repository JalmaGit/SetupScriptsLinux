my_first_arg="$1"
my_second_arg="$2"

echo "Argument one is: $my_first_arg"
echo "Argument two is: $my_second_arg"

if [ "$my_first_arg" = "1" ]; then
    echo "worked: $1"
else
    echo "Did not work"
fi

if lspci | grep -qi nvidia; then
    echo "Nvidia GPU detected. Proceeding with driver installation..."
    cat << 'EOF' >> ~/.bashrc
export PATH=/usr/local/cuda-12.8/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda-12.8/lib64\
                         ${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
EOF


  # Place your Nvidia installation commands here
else
    echo "No Nvidia GPU detected. Skipping Nvidia driver installation."
fi