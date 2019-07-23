# Golang Variables
set -x GOPATH ~/go
set -x GOROOT /usr/lib/go
set -Ux GEM_HOME ~/.gem
# Ruby Variables
set -x RubyBin (ruby -e 'print Gem.user_dir')/bin
set -x GemPath (ruby -r rubygems -e 'puts Gem.user_dir')/bin

# Pythong / Pip local bin folder
set -x LOCALBIN ~/.local/bin
# Cargo (Rust)  Bin
set -x CARGOBIN ~/.cargo/bin
# Apache Maven Bin
set -x MAVENBIN /usr/share/apache-maven/bin
# Universal Node.js variable
set -Ux npm_config_prefix ~/.node_modules
set -x NPMBIN ~/.node_modules/bin

# fzf default command with ripgrep
set -Ux FZF_DEFAULT_COMMAND 'rg --files --no-ignore --hidden --follow --glob "!.git/*"'

# set -Ux QT_QPA_PLATFORM wayland
# set -Ux QT_QPA_PLATFORMTHEME qt5ct
# set -gx QT_WAYLAND_DISABLE_WINDOWDECORATION '1'
# set -Ux GTK_THEME 'Arc-Darker'

# Default Universal Variables
set -Ux VISUAL nvim
set -Ux EDITOR nvim
set -Ux PAGER most
# set -gx TERM "tmux256color"
set -gx TERM 'xterm-256color'

# Path
set -x PATH $GOROOT $GOPATH $GOPATH/bin $GemPath $GEM_HOME $RubyBin $PATH
set -x PATH $MAVENBIN $LOCALBIN $CARGOBIN $NPMBIN $PATH
set -x PATH $PATH

# Aliases
function vim -d 'overwrite vim to be nvim'
    command nvim $argv
end

function zshconfig -d 'open zsh config'
    nvim ~/.zshrc
end

function fishconfig -d 'open fish config'
    nvim ~/.config/fish/config.fish
end

function tmuxconfig -d 'open tmux config'
    nvim ~/.tmux.conf
end

function vimconfig -d 'open neovim config'
    nvim ~/.config/nvim/init.vim
end

function swayconfig -d 'open sway config'
    nvim ~/.config/sway/config
end

function waybarconfig -d 'open sway config'
    nvim ~/.config/waybar/config
end

# Tmux shotcuts
function tls -d 'list all tmux sessions'
    tmux ls
end

function tns -d 'make a new tmux session with <name>'
    command tmux new-session -s $argv
end

function tat -d 'attach tmuc pane/window'
    command tmux attach -t $argv
end

function tkill -d 'kill a tmux session'
    command tmux kill-session -t $argv
end
