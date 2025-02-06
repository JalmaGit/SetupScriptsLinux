# SetupScriptsLinux
Linux Software Installation Script For Quicker Setup.

The following software will be installed with this script. The list below displays the most important software and tools installed. An expection to the list below is when installing on a Jetson Orin Nano. On Jetson Orin Nano there is no Steam, KiCad and Anaconda3 install, however there is Intel RealSense SDK installed:

| Software/Tool |  Version  | NOTE |
|:-----|:--------:|------:|
| GCC  | 14.2, 13.3 or 12.3 | 14.2 is the default 24.04, 12.3 is the default on 22.04 due to only supporting up to 12.3 |
| CMake   |  3.31.3  | Uses CMake's own repository, not ubuntu universe |
| OpenCV | 4.10.0 | Built from Source, when full install is selected, will link to Anaconda environment |
| VCPKG | Latest Release | n/a |
| ROS2 | Humble or Jazzy | Humble for 22.04, Jazzy for 24.04 |
| Pycharm   | 3.1.1 | n/a |
| CLion  | 3.1.1 | n/a |
| VSCode | Latest Release | n/a |
| Anaconda | 2024.10-1 |n/a |
| KiCad | Latest Release | Uses KiCad's own repository, not ubuntu universe |
| Discord | Latest Release | n/a |
| Steam | Latest Release | n/a|
| TeamSpeak3 | n/a  | NOT IMPLEMENTED |

Download this github as a zip, extract it and run this command in the Terminal:

```
source auto_setup.sh
```
