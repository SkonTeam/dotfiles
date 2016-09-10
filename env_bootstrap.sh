#!/bin/sh

# Exit with a message
Abort(){
	echo "[x] $1 not detected, Aborting."
	exit
}

# Returns 0 if command is non existant
CommandExists(){
	local CommandReturnVal=`command -v $1`
	if [[ -z "$CommandReturnVal" ]]; then
		return 0
	else
		return 1
	fi
}

# Check if running Arch linux
if [[ -f /etc/arch-release ]]; then
	echo "[✓] Arch linux."
else
	Abort "Arch Linux"
fi

# Check if running Gnome desktop
if [[ $DESKTOP_SESSION -eq "gnome" ]]; then
	echo "[✓] GNOME."
else
	Abort "GNOME"
fi

# Check for Yaourt and install
CommandExists "yaourt"
lastRetVal=$?
if [[ "$lastRetVal" == 0 ]]; then
	echo "[✓] Installing Yaourt dependencies..."
		sudo pacman -S --needed base-devel git wget yajl
	echo "[✓] Installing packge-query..."
		mkdir /tmp/yaourt_install
		cd /tmp/yaourt_install/
		git clone https://aur.archlinux.org/package-query.git
		cd package-query/
		makepkg -si --needed
		cd ..
	echo "[✓] Installing yaourt..."
		git clone https://aur.archlinux.org/yaourt.git
		cd yaourt/
		makepkg -si -needed
	echo "[✓] Yaourt."
else
	echo "[✓] Yaourt."
fi

# Check for NeoVim and install
CommandExists "nvim"
lastRetVal=$?
if [[ "$lastRetVal" == 0 ]]; then
	echo "[✓] Installing NeoVim..."
	sudo pacman -S neovim
	echo "[✓] NeoVim."
else
	echo "[✓] NeoVim."
fi

#Check and install ZSH
CommandExists "zsh"
lastRetVal=$?
if [[ "$lastRetVal" == 0 ]]; then
	echo "[✓] Installing ZSH..."
	sudo pacman -S zsh
	echo "[✓] ZSH."
else
	echo "[✓] ZSH."
fi

CommandExists "antigen"
lastRetVal=$?
if [[ "$lastRetVal" == 0 ]]; then
	echo "[✓] Installing Antigen..."
	mkdir -p $HOME/.zsh/antigen/
	curl https://cdn.rawgit.com/zsh-users/antigen/v1.0.4/antigen.zsh > $HOME/.zsh/antigen/antigen.zsh
	echo "[✓] Antigen."
else
	echo "[✓] Antigen."
fi

# TODO: Add ZSH install [DONE]
# TODO: Add Antigen install
# TODO: Add dotfiles install (github.com/skonteam/dotfiles)
# TODO: Add interactive zshrc manipulation : GOPATH , NVM ,etc...
# TODO: Add font : fira-mono , vim deoplete python3.
# TODO: try i3 , awesome , BSPWM.
