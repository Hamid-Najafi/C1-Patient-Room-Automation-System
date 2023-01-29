#!/bin/bash -e

# Copyleft (c) 2022.
# -------==========-------
# Ubuntu Server 22.04.01
# Hostname: orcp6-5
# Username: c1tech
# Password: 1478963
# -------==========-------
# To Run This Script
# wget https://raw.githubusercontent.com/Hamid-Najafi/C1-Hospital-Automation-System/main/HAS-Update.sh && chmod +x HAS-Update.sh && sudo ./HAS-Update.sh
# OR
#
# -------==========-------
echo "-------------------------------------"
echo "Updating Hospital Automation System Application"
echo "-------------------------------------"
url="https://github.com/Hamid-Najafi/C1-Hospital-Automation-System.git"
folder="/home/c1tech/C1-Hospital-Automation-System"
[ -d "${folder}" ] && rm -rf "${folder}"    
git clone "${url}" "${folder}"
folder="/home/c1tech/C1"
[ -d "${folder}" ] && rm -rf "${folder}"    
mv /home/c1tech/C1-Hospital-Automation-System/C1 /home/c1tech/
cd /home/c1tech/C1-Hospital-Automation-System/Panel
touch -r *.*
qmake
make -j4 

chown -R c1tech:c1tech /home/c1tech/C1-Hospital-Automation-System
echo "-------------------------------------"
echo "Done, Performing System Reboot"
echo "-------------------------------------"
init 6