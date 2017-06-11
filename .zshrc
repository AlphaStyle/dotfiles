# Path to your oh-my-zsh installation.
export ZSH=/home/alphastyle/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd/mm/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(zsh-completions git go zsh-syntax-highlighting sublime sudo tmux docker python archlinux web-search compleat pep8 pip pylint encode64 node npm systemd zsh-autosuggestions zsh-better-npm-completion)

source $ZSH/oh-my-zsh.sh

# User configuration

#-----------------------------
# Exporting
#----------------------------
# export TERM=xterm-256color
export TERM=xterm-termite
# export TERM=st-256color # Add True colors to tmux

export GOPATH=~/projects
export GOROOT=/usr/lib/go

export PATH=${PATH}:$GOPATH:$GOROOT:$GOPATH/bin

export EDITOR='nvim'

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias ohmyzsh="nvim ~/.oh-my-zsh"
alias zshconfig="nvim ~/.zshrc"
alias tmuxconfig="nvim ~/.tmux.conf"
alias vim="nvim"
alias vimconfig="nvim ~/.config/nvim/init.vim"
#------------------------------
# Comp stuff
#------------------------------
fpath=(~/.zsh/completion $fpath)

zmodload zsh/complist
autoload -Uz compinit && compinit -i

