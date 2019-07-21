#!/usr/bin/env bash
# Filename: gen-mem.sh
# Target: XFCE Generic Monitor (xfce4-genmon-plugin)
# Description: Displays NVIDIA GPU temperature and useful stats 
# Dependencies: bash>=3.2, file, gawk
# Copyright (C) 2019 N.Lichtwald, see <https://github.com/niwald/>
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
readonly NVIDIA_ICON="${DIR}/icons/nvid.png"

# GPU Core Temperature
readonly GTMP=$(nvidia-settings -q gpucoretemp -t)

# GPU Name / Model
readonly GMODEL=$(nvidia-settings -g | grep "renderer string:" | awk '{print $4,$5,$6}')

# GPU Used / Total Memory
readonly GUSEDMEM=$(nvidia-settings -q [gpu:0]/UsedDedicatedGPUMemory -t)
readonly GTOTALMEM=$(nvidia-settings -q [gpu:0]/TotalDedicatedGPUMemory -t)

# GPU Processor Clock, Fan speed, CUDA Cores
readonly GPROCCFREQ=$(nvidia-settings -q GPUCurrentProcessorClockFreqs -t)
readonly GFANSPEED=$(nvidia-settings -q [fan:0]/GPUCurrentFanSpeed -t)
readonly GCUDACORES=$(nvidia-settings -q CUDACores -t)

# GPU Driver Version
readonly GDRIVER=$(nvidia-settings -q NvidiaDriverVersion -t)

# Indicator color
XCOLOR="#000000"

# Determine color of temerature indicator
# Max temperature depending on your GPU is 91 to 105 degrees celsius
# Anything above 70 - 80 degrees celsius should be indicated red
if [ $GTMP -gt 40 ]; then
	XCOLOR="#FFFF00" #yellow
elif [ $GTMP -gt 70 ]; then
	XCOLOR="#FF0000" #red
else
	XCOLOR="#33CC00" #green
fi

# Genmon panel XML
XPAN="<img>${NVIDIA_ICON}</img>"
XPAN+="<txt>"
XPAN+=" <span fgcolor='${XCOLOR}'>${GTMP}°</span> "
XPAN+="</txt>"

# Genmon tooltip XML
XTOOL="<tool>"
XTOOL+="Used Memory: <span weight='bold'>${GUSEDMEM} / ${GTOTALMEM}</span> MB\n"
XTOOL+="Processor Clock: <span weight='bold'>${GPROCCFREQ}</span> MHz\n"
XTOOL+="Fan Speed: <span weight='bold'>${GFANSPEED}%</span>\n"
XTOOL+="CUDA Cores: ${GCUDACORES}\n\n"
XTOOL+="<span fgcolor='#669900'>${GMODEL}</span>\n"
XTOOL+="<span fgcolor='#CCCCCC'>Driver Version: ${GDRIVER}</span>"
XTOOL+="</tool>"

# Echo the panel
echo -e "${XPAN}"

# Echo the tooltip
echo -e "${XTOOL}"
