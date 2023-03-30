#!/usr/bin/env bash
#
# script name: dm-wifi
# Description: Connect to wifi using dmenu
# Dependencies: dmenu, fzf, rofi, nmcli, Any Nerd Font
# GitLab: https://www.gitlab.com/dwt1/dmscripts
# License: https://www.gitlab.com/dwt1/dmscripts/LICENSE
# Contributor: WitherCubes
#              Derek Taylor

# Set with the flags "-e", "-u","-o pipefail" cause the script to fail
# if certain things happen, which is a good thing.  Otherwise, we can
# get hidden bugs that are hard to discover.
set -euo pipefail
_path="$(cd "$(dirname "${BASH_SOURCE[0]}")" && cd "$(dirname "$(readlink "${BASH_SOURCE[0]}" || echo ".")")" && pwd)"
if [[  -f "${_path}/_dm-helper.sh" ]]; then
  # shellcheck disable=SC1090,SC1091
  source "${_path}/_dm-helper.sh"
else
  # shellcheck disable=SC1090
  echo "No helper-script found"
fi

# script will not hit this if there is no config-file to load
# shellcheck disable=SC1090
source "$(get_config)"

# Check if config has updates that should be displayed to the user
check_updated_config

main() {
  # TODO: Fix cut line at some point
  bssid=$(nmcli device wifi list | sed -n '1!p' | cut -b 9- | ${MENU} "Select Wifi  :" | cut -d' ' -f1)
  pass=$(echo "" | ${MENU} "Enter Password  :")
  # We are disabling a shellcheck warning about using && and || as it doesn't apply here.
  # shellcheck disable=SC2015
  [ -n "$pass" ] && nmcli device wifi connect "$bssid" password "$pass" || nmcli device wifi connect "$bssid"
  sleep 10
  if ping -q -c 2 -W 2 google.com >/dev/null; then
    notify-send "Your internet is working :)"
  else
    notify-send "Your internet is not working :("
  fi
}

noOpt=1
# If script is run with '-d', it will use 'dmenu'
# If script is run with '-f', it will use 'fzf'
# If script is run with '-d', it will use 'rofi'
while getopts "dfrh" arg 2>/dev/null; do
    case "${arg}" in
        d) # shellcheck disable=SC2153
           MENU=${DMENU}
           [[ "${BASH_SOURCE[0]}" == "${0}" ]] && main ;;
        f) # shellcheck disable=SC2153
           MENU=${FMENU}
           [[ "${BASH_SOURCE[0]}" == "${0}" ]] && main ;;
        r) # shellcheck disable=SC2153
           MENU=${RMENU}
           [[ "${BASH_SOURCE[0]}" == "${0}" ]] && main "@";;
        h) help ;;
        *) printf '%s\n' "Error: invalid option" "Type $(basename "$0") -h for help" ;;
    esac
    noOpt=0
done

# If script is run with NO argument, it will use 'dmenu'
[ $noOpt = 1 ] && MENU=${DMENU} && [[ "${BASH_SOURCE[0]}" == "${0}" ]] && main "$@"

