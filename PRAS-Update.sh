#!/bin/bash -e

# Copyleft (c) 2022.
# -------==========-------
# Ubuntu Server 22.04.01
# Hostname: orcp6-5
# Username: c1tech
# Password: 1478963
# -------==========-------
# To Run This Script
# wget https://raw.githubusercontent.com/Hamid-Najafi/C1-Patient-Room-Automation-System/main/PRAS-Update.sh && chmod +x PRAS-Update.sh && sudo ./PRAS-Update.sh
# OR
#
# -------==========-------
echo "-------------------------------------"
echo "Updating Hospital Automation System Application"
echo "-------------------------------------"
url="https://github.com/Hamid-Najafi/C1-Patient-Room-Automation-System.git"
folder="/home/c1tech/C1-Patient-Room-Automation-System"
[ -d "${folder}" ] && rm -rf "${folder}"    
git clone "${url}" "${folder}"
folder="/home/c1tech/C1"
[ -d "${folder}" ] && rm -rf "${folder}"    
cd /home/c1tech/C1-Patient-Room-Automation-System/PRAS/
cmake -G Ninja .
cmake --build . --parallel 4
chown -R c1tech:c1tech /home/c1tech/C1-Patient-Room-Automation-System
echo "-------------------------------------"
echo "Done, Performing System Reboot"
echo "-------------------------------------"
init 6