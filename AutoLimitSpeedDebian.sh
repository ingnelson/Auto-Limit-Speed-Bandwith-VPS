#!/bin/bash
#=================================
# Create by https://t.me/PR_Aiman
# Copyright © Beginner 2024
#=================================

# Download file Limit Speed
cd /usr/bin
wget -O limit "https://github.com/praiman99/Auto-Limit-Speed-Bandwith-VPS/raw/Beginner/limit-speed.sh"; chmod +x limit; bash limit

# Add Limit Speed At Crontab
echo "30 6 * * * root bash limit" >> /etc/Crontab

rm -f AutoLimitSpeedDebian.sh