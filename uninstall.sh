#!/bin/bash
# ZiVPN Remover
# Forked By Me..
clear
echo -e "Uninstalling AIO-Tunnel VPN ..."
systemctl stop zivpn.services
systemctl disable zivpn.service
rm /etc/systemd/system/zivpn.service 1> /dev/null 2> /dev/null
killall zivpn 
rm -rf /etc/zivpn 1> /dev/null 2> /dev/null
rm /usr/local/bin/zivpn 1> /dev/null 2> /dev/null
if pgrep "zivpn" >/dev/null; then
  echo -e "Server Running"
else
  echo -e "Server Stopped"
fi
file="/usr/local/bin/zivpn" 1> /dev/null 2> /dev/null
if [ -e "$file" ] 1> /dev/null 2> /dev/null; then
  echo -e "Files still remaining, try again"
else
  echo -e "Successfully Removed"
fi
echo "Cleaning Cache & Swap"
echo 3 > /proc/sys/vm/drop_caches
sysctl -w vm.drop_caches=3
swapoff -a && swapon -a
rm ziun.* 1> /dev/null 2> /dev/null
echo -e "Done."
