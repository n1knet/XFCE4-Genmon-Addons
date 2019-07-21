#!/usr/bin/env bash
# Filename: gen-cputemp.sh
# Target: XFCE Generic Monitor (xfce4-genmon-plugin)
# Description: Displays current CPU temperature via sensors command
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
readonly UPTIME_ICON="${DIR}/icons/icpu.png"

# CPU temperature from sensors command 
readonly CORE0=$(sensors | sed -rn 's/.*Core 0:\s+.([0-9]+).*/\1/p')
readonly CORE2=$(sensors | sed -rn 's/.*Core 2:\s+.([0-9]+).*/\1/p')

# Indicator colors for CORE0 and CORE2
XCOLOR="#000000"
XCOLOR2="#000000"

# Determine color of temerature indicator for CORE0
# Max temperature depending on your CPU is 89(high) to 105(crit) degrees celsius
# Anything above 70 - 80 degrees celsius should be indicated red
if [ $CORE0 -gt 40 ]; then
	XCOLOR="#FFFF00" #yellow
elif [ $CORE0 -gt 70 ]; then
	XCOLOR="#FF0000" #red
else
	XCOLOR="#33CC00" #green
fi

# Determine color of temerature indicator for CORE2
# Max temperature depending on your CPU is 89(high) to 105(crit) degrees celsius
# Anything above 70 - 80 degrees celsius should be indicated red
if [ $CORE2 -gt 40 ]; then
	XCOLOR2="#FFFF00" #yellow
elif [ $CORE2 -gt 70 ]; then
	XCOLOR2="#FF0000" #red
else
	XCOLOR2="#33CC00" #green
fi

# Genmon panel XML
XPAN="<img>${UPTIME_ICON}</img>"
XPAN+="<txt>" 
XPAN+=" <span fgcolor='${XCOLOR}'>${CORE0}°</span> "
XPAN+=" <span fgcolor='${XCOLOR2}'>${CORE2}°</span> "
XPAN+="</txt>"

# Genmon tooltip XML
XTOOL="<tool>"
XTOOL+="<span>Temperature of Core0 and Core1</span>"
XTOOL+="</tool>"

# Echo the panel
echo -e "${XPAN}"

# Echo the tooltip
echo -e "${XTOOL}"