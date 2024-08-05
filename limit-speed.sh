#!/bin/bash
#=================================
# Create by https://t.me/PR_Aiman.
# Copyright © Beginner 2024
#=================================

red='\e[1;31m'
white='\e[1;37m'
green='\e[0;32m'
NC='\e[0m'
Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[41;37m" && Font_color_suffix="\033[0m"
Info="${Green_font_prefix}[ON]${Font_color_suffix}"
Error="${Red_font_prefix}[OFF]${Font_color_suffix}"
NIC=$(ip -o $ANU -4 route show to default | awk '{print $5}');
down=2000000
up=2000000

# Begin 
clear
git clone  https://github.com/magnific0/wondershaper.git
cd wondershaper
make install
cd
rm -rf wondershaper
echo > /home/limit
wondershaper -ca $NIC
systemctl stop wondershaper.service
echo "Stop Configuration"
sleep 0.5
echo > /home/limit
echo "Done"
sleep 1
clear

# start
if [[ -z "$down" ]] && [[ -z "$up" ]]; then
echo > /dev/null 2>&1
else
echo "Start Configuration"
sleep 0.5
wondershaper -a $NIC -d $down -u $up > /dev/null 2>&1
systemctl enable --now wondershaper.service
echo "start" > /home/limit
echo "Done"
sleep 1
clear
fi

# Status 
cek=$(cat /home/limit)
if [[ "$cek" = "start" ]]; then
sts="${Info}"
else
sts="${Error}"
fi
echo
echo -e "${white} Download Limit Set : $down"
echo -e "${white} Upload Limit Set : $up"
echo -e "${white} Status Limit Speed : $sts"
echo
exit
