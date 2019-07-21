# XFCE4 Generic Monitor Addons

![pr-pan]

Addon scripts fo the XFCE4 Generic Monitor (xfce4-genmon-plugin). These can be written in **C** or **Shell**, although in this case C has no significant speed advantage over Shell. I've written those for daily work and tested on multiple desktops and laptops.

## Installation

Obviously you will need XFCE4 and XFCE4 Generic Monitor (xfce4-genmon-plugin).
On Debian systems the plugin is in the repository: 

```sh
$ sudo apt update
$ sudo apt install xfce4-genmon-plugin
```

After that, on panel right click → **'Add New Item'** → **'Generic Monitor'** and link to the script via **'Command'** property.
I recommend you create a folder for all scripts in your home directory for comfortable linking.

## Permissions

Sometimes you will need to make the scripts executable. Get into your script folder and change the permissions.

```sh
$ cd GENMON_ADDONS_FOLDER
$ chmod +x some-script-file.sh
```
Or to make **all** scripts executable **inside** your script folder:

```sh
$ cd GENMON_ADDONS_FOLDER
$ chmod +x *
```

## Shell Scripts

This is the order in which i've aligned them on my machines, but you can use any order you like. The font used in the preview screenshots is **"DejaVu Sans Mono 12"**. Genmon periods are intervals and set within xfce4-genmon-plugin properties.

| Filename            | Preview       | Genmon Period(s)   | Description		                                 |
|:--------------------|:-------------:|:------------------:|:--------------------------------------------------|
| [gen-uptime.sh]     | ![pr-uptime]  | 1,00               | Uptime since last login and login time.           |
| [gen-cputemp.sh]    | ![pr-cputemp] | 5,00               | CPU temperature for 2 cores                       |
| [gen-nvidia.sh]     | ![pr-nvtemp]  | 3,60               | NVIDIA temperature, used memory, CUDA cores, etc  |

<!--- Paths to script -->
[gen-uptime.sh]: gen-uptime.sh
[gen-nvidia.sh]: gen-nvidia.sh
[gen-cputemp.sh]: gen-cputemp.sh

<!--- Previews -->
[pr-pan]: https://raw.githubusercontent.com/niwald/XFCE4-Genmon-Addons/master/preview/genmon-niwald.png "XFCE4 Panel Preview"
[pr-uptime]: https://raw.githubusercontent.com/niwald/XFCE4-Genmon-Addons/master/preview/uptime.jpg "Uptime"
[pr-cputemp]: https://raw.githubusercontent.com/niwald/XFCE4-Genmon-Addons/master/preview/cputemp.jpg "CPU Temperature"
[pr-nvtemp]: https://raw.githubusercontent.com/niwald/XFCE4-Genmon-Addons/master/preview/nvidiatemp.jpg "NVIDIA Temperature and Data"

