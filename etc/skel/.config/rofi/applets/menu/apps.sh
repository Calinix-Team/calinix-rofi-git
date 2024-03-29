#!/usr/bin/env bash

## Author  : Arghya Sarkar
## Mail    : contact@calinix.tech
## Github  : @arghyagod-coder
## 

style="$($HOME/.config/rofi/applets/menu/style.sh)"

dir="$HOME/.config/rofi/applets/menu/configs/$style"
rofi_command="rofi -theme $dir/apps.rasi"

# Links
terminal=""
files=""
editor=""
browser=""
music=""
settings=""

# Error msg
msg() {
	rofi -theme "$HOME/.config/rofi/applets/styles/message.rasi" -e "$1"
}

# Variable passed to rofi
options="$terminal\n$files\n$editor\n$browser\n$music\n$settings"

chosen="$(echo -e "$options" | $rofi_command -p "Most Used" -dmenu -selected-row 0)"
case $chosen in
    $terminal)
		if [[ -f /usr/bin/alacritty ]]; then
			alacritty &
		elif [[ -f /usr/bin/urxvt ]]; then
			urxvt &
		elif [[ -f /usr/bin/kitty ]]; then
			kitty &
		elif [[ -f /usr/bin/xterm ]]; then
			xterm &
		elif [[ -f /usr/bin/xfce4-terminal ]]; then
			xfce4-terminal &
		elif [[ -f /usr/bin/gnome-terminal ]]; then
			gnome-terminal &
		else
			msg "No suitable terminal found!"
		fi
        ;;
    $files)
		if [[ -f /usr/bin/nautilus ]]; then
			nautilus &
		elif [[ -f /usr/bin/nemo ]]; then
			nemo &
		elif [[ -f /usr/bin/dolphin ]]; then
			dolphin &
		elif [[ -f /usr/bin/thunar ]]; then
			thunar &
		elif [[ -f /usr/bin/pcmanfm ]]; then
			pcmanfm &
		else
			msg "No suitable file manager found!"
		fi
        ;;
    $editor)
		if [[ -f /usr/bin/geany ]]; then
			geany &
		elif [[ -f /usr/bin/leafpad ]]; then
			leafpad &
		elif [[ -f /usr/bin/mousepad ]]; then
			mousepad &
		elif [[ -f /usr/bin/code ]]; then
			code &
		elif [[ -f /usr/bin/neovide ]]; then
			neovide &
		elif [[ -f /usr/bin/vim ]]; then
			vim &
		else
			msg "No suitable text editor found!"
		fi
        ;;
    $browser)
		if [[ -f /usr/bin/firefox ]]; then
			firefox &
		elif [[ -f /usr/bin/chromium ]]; then
			chromium &
		elif [[ -f /usr/bin/brave ]]; then
			brave &
		elif [[ -f /usr/bin/librewolf ]]; then
			librewolf &
		elif [[ -f /usr/bin/vivaldi-stable ]]; then
			vivaldi-stable &
		elif [[ -f /usr/bin/microsoft-edge-stable ]]; then
			microsoft-edge-stable &
		elif [[ -f /usr/bin/midori ]]; then
			midori &
		else
			msg "No suitable web browser found!"
		fi
        ;;
    $music)
		if [[ -f /usr/bin/lxmusic ]]; then
			lxmusic &
		elif [[ -f /usr/bin/amarok ]]; then
			amarok &
		elif [[ -f /usr/bin/spotify ]]; then
			spotify &
		elif [[ -f /usr/bin/gnome-music ]]; then
			gnome-music &
		elif [[ -f /usr/bin/rythmbox ]]; then
			rythmbox &
		elif [[ -f /usr/bin/cmus ]]; then
			cmus &
		else
			msg "No suitable music player found!"
		fi
        ;;
    $settings)
		if [[ -f /usr/bin/xfce4-settings-manager ]]; then
			xfce4-settings-manager &
		else
			msg "No suitable settings manager found!"
		fi
        ;;
esac
