
echo "OpenCV with anaconda3 support"

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
    cmake -D CMAKE_BUILD_TYPE=Release -D PYTHON3_EXECUTABLE=~/anaconda3/bin/python -D PYTHON3_LIBRARY=~/anaconda3/lib/python3.12 -D PYTHON3_INCLUDE_DIR=~/anaconda3/include/python3.12 -D PYTHON3_PACKAGES_PATH=~/anaconda3/lib/python3.12/site-packages -D BUILD_opencv_python2=OFF -D BUILD_opencv_python3=ON -D INSTALL_PYTHON_EXAMPLES=OFF -D INSTALL_C_EXAMPLES=OFF -D OPENCV_ENABLE_NONFREE=ON -D BUILD_EXAMPLES=OFF ../

    make -j6

    sudo make install
    
    cd ~/
else
    echo "OpenCV is already installed"
fi


echo "______Conda Install________"

DIRECTORY=~/anaconda3

if [ ! -d "$DIRECTORY" ]; then
    yes | sudo apt install libgl1-mesa-glx libegl1-mesa libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6
    curl -O https://repo.anaconda.com/archive/Anaconda3-2024.10-1-Linux-aarch64.sh
    bash ~/Anaconda3-2024.10-1-Linux-aarch64.sh -b
    source ~/anaconda3/bin/activate
    conda init --all
    conda config --set auto_activate_base True
    yes | conda install -c conda-forge glib gstreamer gst-plugins-base gtk3 pkg-config
    sudo rm Anaconda3-2024.10-1-Linux-aarch64.sh
else
    echo "Conda is already installed"
fi