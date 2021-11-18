#!/usr/bin/env bash

## Author  : Arghya Sarkar
## Mail    : contact@calinix.tech
## Github  : @arghyagod-coder
## 

# Available Styles
# >> Created and tested on : rofi 1.6.0-1
#
# blurry	blurry_full		kde_simplemenu		kde_krunner		launchpad
# gnome_do	slingshot		appdrawer			appdrawer_alt	appfolder
# column	row				row_center			screen			row_dock		row_dropdown

theme="screen"
dir="$HOME/.config/rofi/launchers/misc"

# comment these lines to disable random style
themes=($(ls -p --hide="launcher.sh" $dir))
# theme="${themes[$(( $RANDOM % 16 ))]}"
theme=blurry_full.rasi

rofi -no-lazy-grab -show drun -modi drun -theme $dir/"$theme"
