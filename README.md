# SetupScriptsLinux
Linux Software Installation Script For Quicker Setup.

The following software will be installed with this script. The list below displays the most important software and tools installed:

| Software/Tool |  Version  | NOTE |
|:-----|:--------:|------:|
| gcc  | 14.2, 13.3 or 12.3 | 14.2 is the default 24.04, 12.3 is the default on 22.04 due to only supporting up to 12.3 |
| CMake   |  3.31.3  | Uses CMake's own repository, not ubuntu universe |
| Pycharm   | 3.1.1 | n/a |
| CLion  | 3.1.1 | n/a |
| VSCode | Latest Realese | n/a |
| Anaconda | 2024.10-1 |n/a |
| KiCad | Latest Realse | Uses KiCad's own repository, not ubuntu universe |
| Discord | Latest Realse | n/a |
| TeamSpeak3 | n/a  | NOT IMPLEMENTED |
| Steam | n/a | NOT IMPLEMENTED |

Download this github as a zip, extract it and run with either of these commands:

Ubuntu 24.04 Noble: 

```
source auto_setup_noble.sh
```

Ubuntu 22.04 Jammy:

```
source auto_setup_jammy.sh
```
