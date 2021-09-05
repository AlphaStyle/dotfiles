#!/bin/bash
# ./updatedotfiles.sh

# If a file has been changed
# then run git push.
run_git_push=false

# If file and directory doesnt exist,
# it will create the file and / or directory.
function doesItExist {
    if [ ! -e $1 ]; then
        if [ ! -d $(dirname $1) ]; then
            mkdir -p $(dirname $1)
        fi

        echo >> $1
    fi
}

# Will check if the local file exist, if it doesnt
# it will create the file and then compare the local
# file with the extenal file to see if the files has
# different content. If it has different content it will
# overwrite the local file with the external file and
# then commit to git.
function compareFiles {
    doesItExist $1 $2

    if cmp --silent $1 $2; then
        echo "Local $(basename $1) and External $(basename $2) has the same content."
    else
        echo "Local $(basename $1) and External $(basename $2) has different content."
        cp -f $2 $1
        git add $1
        run_git_push=true
        echo "Local $(basename $1) has been updated!"
    fi
}

REPO="$HOME/Downloads/dotfiles"

# VIM_LOCAL="$HOME/.dotfiles/nvim/init.vim"
VIM_LOCAL="$REPO/nvim/init.vim"
VIM_EXTERNAL="$HOME/.config/nvim/init.vim"
compareFiles $VIM_LOCAL $VIM_EXTERNAL

# ZSH_LOCAL="$HOME/.dotfiles/.zshrc"
ZSH_LOCAL="$REPO/.zshrc"
ZSH_EXTERNAL="$HOME/.zshrc"
compareFiles $ZSH_LOCAL $ZSH_EXTERNAL

# FISH_LOCAL="$HOME/.dotfiles/.config/fish/config.fish"
FISH_LOCAL="$REPO/fish/config.fish"
FISH_EXTERNAL="$HOME/.config/fish/config.fish"
compareFiles $FISH_LOCAL $FISH_EXTERNAL

XRESOURCES_LOCAL="$REPO/.Xresources"
XRESOURCES_EXTERNAL="$HOME/.Xresources"
compareFiles $XRESOURCES_LOCAL $XRESOURCES_EXTERNAL

# TMUX_LOCAL="$HOME/.dotfiles/.tmux.conf"
TMUX_LOCAL="$REPO/.tmux.conf"
TMUX_EXTERNAL="$HOME/.tmux.conf"
compareFiles $TMUX_LOCAL $TMUX_EXTERNAL

# TERMITE_LOCAL="$HOME/.dotfiles/termite/config"
TERMITE_LOCAL="$REPO/termite/config"
TERMITE_EXTERNAL="$HOME/.config/termite/config"
compareFiles $TERMITE_LOCAL $TERMITE_EXTERNAL

# ALACRITTY_LOCAL="$HOME/.dotfiles/alacritty/alacritty.yml"
ALACRITTY_LOCAL="$REPO/alacritty/alacritty.yml"
ALACRITTY_EXTERNAL="$HOME/.config/alacritty/alacritty.yml"
compareFiles $ALACRITTY_LOCAL $ALACRITTY_EXTERNAL

SWAY_LOCAL="$REPO/sway/config"
SWAY_EXTERNAL="$HOME/.config/sway/config"
compareFiles $SWAY_LOCAL $SWAY_EXTERNAL

SWAYNAG_LOCAL="$REPO/swaynag/config"
SWAYNAG_EXTERNAL="$HOME/.config/swaynag/config"
compareFiles $SWAYNAG_LOCAL $SWAYNAG_EXTERNAL

WAYBAR_CONFIG_LOCAL="$REPO/waybar/config"
WAYBAR_CONFIG_EXTERNAL="$HOME/.config/wofi/config"
compareFiles $WAYBAR_CONFIG_LOCAL $WAYBAR_CONFIG_EXTERNAL

WAYBAR_STYLE_LOCAL="$REPO/waybar/style.css"
WAYBAR_STYLE_EXTERNAL="$HOME/.config/wofi/style.css"
compareFiles $WAYBAR_STYLE_LOCAL $WAYBAR_STYLE_EXTERNAL

WOFI_LOCAL="$REPO/wofi/style.css"
WOFI_EXTERNAL="$HOME/.config/wofi/style.css"
compareFiles $WOFI_LOCAL $WOFI_EXTERNAL

MAKO_LOCAL="$REPO/mako/config"
MAKO_EXTERNAL="$HOME/.config/mako/config"
compareFiles $MAKO_LOCAL $MAKO_EXTERNAL

if [ run_git_push ]; then
    git commit -m "Updated: $(date +%F)"
    git push
fi
