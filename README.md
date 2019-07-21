# XFCE4 Generic Monitor Addons

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

| Filename            | Preview     | Genmon Period(s)   | Description		                                 |
|:--------------------|:-----------:|:------------------:|:--------------------------------------------------|
| [gen-uptime.sh]     | Coming soon | 1,00               | Uptime since last login and login time.           |
| [gen-cputemp.sh]    | Coming soon | 5,00               | CPU temperature for 2 cores                       |
| [gen-nvidia.sh]     | Coming soon | 3,60               | NVIDIA temperature, used memory, CUDA cores, etc  |

<!--- Paths to script -->
[gen-uptime.sh]: gen-uptime.sh
[gen-nvidia.sh]: gen-nvidia.sh
[gen-cputemp.sh]: gen-cputemp.sh

