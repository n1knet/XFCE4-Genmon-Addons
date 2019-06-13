#!/usr/bin/env bash
# Filename: gen-uptime.sh
# Target: XFCE Generic Monitor (xfce-genmon-plugin)
# Description: Displays readable system uptime and last boot
# Dependencies: bash>=3.2, file, gawk
# Author: N.Lichtwald, see <https://github.com/niwald/>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# GNU General Public License
# More at: <http://www.gnu.org/licenses/>

# Script portability
readonly DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Absolut path of the icon, 24x24px
readonly UPTIME_ICON="${DIR}/icons/uptime1.png"

# System uptime and last boot
readonly UPTIME=$(uptime | awk -F, '{sub(".*up ",x,$1);print $1}')
readonly UPTIMELONG=$(uptime)
readonly LASTBOOT=$(who -b | awk '{print $3, $4}')

# Genmon panel XML
XPAN="<img>${UPTIME_ICON}</img>"
XPAN+="<txt>" 
XPAN+=" <span weight='Bold' fgcolor='#cccccc'>${UPTIME}</span> "
XPAN+="</txt>"

# Genmon tooltip XML
XTOOL="<tool>"
XTOOL+="<span weight='bold'>System boot:</span> \n"
XTOOL+="${LASTBOOT}"
XTOOL+="</tool>"

# Echo the panel
echo -e "${XPAN}"

# Echo the tooltip
echo -e "${XTOOL}"
