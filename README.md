# XFCE4 Generic Monitor Addons

Addon scripts fo the XFCE4 Generic Monitor (xfce4-genmon-plugin). These can be written in **C** or **Shell**, although in this case C has no significant speed advantage over Shell. I've written those for daily work and tested on multiple desktops and laptops.

## Installation

Obviously you will need XFCE4 and XFCE4 Generic Monitor (xfce4-genmon-plugin).
On Debian systems the plugin is in the repository: 

```sh
$ sudo apt update
$ sudo apt install xfce4-genmon-plugin
```

After that, on panel right click → **'Add New Item'** → **'Generic Monitor'** and link to the script via 'Command' property.
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