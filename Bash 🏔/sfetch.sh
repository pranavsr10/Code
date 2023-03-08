#!/bin/sh

# system
OS=`distro | grep Name: | sed "s/Name: //"`
ARCH=`uname -m`
KERNEL=`uname -r`
WM="$(xprop -id $(xprop -root -notype | awk '$1=="_NET_SUPPORTING_WM_CHECK:"{print $5}') -notype -f _NET_WM_NAME 8t | grep "WM_NAME" | cut -f2 -d \")"
UPTIME=`uptime | sed "s/.*up \([0-9]*\).*/\1/"`
SHELL=`echo $SHELL | sed "s/\/bin\///"`
RAMUSAGE=`free -m | grep Mem: | awk '{print $3 "/" $2 "M"}'`

# colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# fetch
echo -e "    .--.      ${BLUE}$(whoami)${NC}@$(cat /proc/sys/kernel/hostname)"
echo "   |o_o |     ---------------------"
echo -e "   |:_/ |     ${BLUE} ⸳ ${NC}$OS $ARCH"
echo -e "  //   \ \    ${RED} ⸳ ${NC}$KERNEL"
echo -e " (|     | )   ${YELLOW} ⸳ ${NC}$WM"
echo -e "/'\_   _/'\   ${GREEN} ⸳ ${NC}$SHELL"
echo -e "\___)=(___/   ${PURPLE} ⸳ ${NC}$RAMUSAGE"
