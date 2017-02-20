#!/bin/bash
# Script I need to execute on startup - enables wifi, swapfile...

# Configure internet connection with wpa_supplicant
sudo wpa_supplicant -Dwext -iwlp4s0 -c /etc/wpa_supplicant/wpa_supplicant.conf -B
sudo dhcpcd wlp4s0

# Enable swap file
sudo swapon /swapfile

