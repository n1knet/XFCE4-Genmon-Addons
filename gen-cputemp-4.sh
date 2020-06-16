#!/usr/bin/env bash
# Filename: gen-cputemp.sh
# Target: XFCE Generic Monitor (xfce-genmon-plugin)
# Description: 4 CORE Version. Displays current CPU temperature via sensors command
# Dependencies: bash>=3.2, file, gawk, sensors, lscpu, notify-send
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

# CPU temperature from sensors 
readonly CORE0=$(sensors | sed -rn 's/.*Core 0:\s+.([0-9]+).*/\1/p')
readonly CORE1=$(sensors | sed -rn 's/.*Core 1:\s+.([0-9]+).*/\1/p')
readonly CORE2=$(sensors | sed -rn 's/.*Core 2:\s+.([0-9]+).*/\1/p')
readonly CORE3=$(sensors | sed -rn 's/.*Core 3:\s+.([0-9]+).*/\1/p')

# CPU MHz from lscpu 
readonly CPUMHZ=$(lscpu | grep 'CPU MHz' | awk '{print $3}')

# Indicator colors for CORE0, CORE1, CORE2, CORE3
IND0="#000000"
IND1="#000000"
IND2="#000000"
IND3="#000000"

# Shows a temperature warning
# On debian and ubuntu distributions notify-send will be used
function show_warning() {
	notify-send "Warning: CPU Temperature" -u normal -t 5000 -i dialog-error
}

# INDICATOR COLORS *************************************************************
# Determine color of temerature indicator for each core individually
# Max temperature depending on your CPU is 89(high) to 105(crit) degrees celsius
# Anything above 70 - 80 degrees celsius should be indicated red

# CORE0
if [ $CORE0 -gt 50 ]; then
	IND0="#FFFF00" #yellow	
elif [ $CORE0 -gt 70 ]; then
	IND0="#FF0000" #red
	show_warning
else
	IND0="#33CC00" #green
fi

# CORE1
if [ $CORE1 -gt 50 ]; then
	IND1="#FFFF00" #yellow
elif [ $CORE1 -gt 70 ]; then
	IND1="#FF0000" #red
	show_warning
else
	IND1="#33CC00" #green
fi

# CORE2
if [ $CORE1 -gt 50 ]; then
	IND2="#FFFF00" #yellow
elif [ $CORE1 -gt 70 ]; then
	IND2="#FF0000" #red
	show_warning
else
	IND2="#33CC00" #green
fi

# CORE3
if [ $CORE1 -gt 50 ]; then
	IND3="#FFFF00" #yellow
elif [ $CORE1 -gt 70 ]; then
	IND3="#FF0000" #red
	show_warning
else
	IND3="#33CC00" #green
fi
# ******************************************************************************

# Genmon panel XML
# XPAN="<img>${UPTIME_ICON}</img>"
XPAN+="<txt>"
XPAN+=" <span fgcolor='${IND0}'>${CORE0}°</span> "
XPAN+=" <span fgcolor='${IND1}'>${CORE1}°</span> "
XPAN+="</txt>"

# Genmon tooltip XML
XTOOL="<tool>"
XTOOL+="<span>Core 2: <span fgcolor='${IND2}'>${CORE2}°</span></span>\n"
XTOOL+="<span>Core 3: <span fgcolor='${IND3}'>${CORE3}°</span></span>\n"
XTOOL+="<span>MHz: ${CPUMHZ}</span>"
XTOOL+="</tool>"

# Echo the panel
echo -e "${XPAN}"

# Echo the tooltip
echo -e "${XTOOL}"