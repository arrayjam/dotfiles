# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

CASE_SENSITIVE="true"
export UPDATE_ZSH_DAYS=30
DISABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Overriding PATHs
# Node
PATH=./node_modules/.bin:$PATH

# Powerline
PATH=/home/arrayjam/.local/bin:$PATH

# Local
PATH=/home/arrayjam/.bin:$PATH

# Normal stuff
PATH=$PATH:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games

export PATH


export TERM=xterm-256color
. /home/arrayjam/.local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh

grep -A1000 '\[alias\]' ~/.gitconfig | grep -Ev '^[ 	]*(#|$|\[alias\])' | sed -e 's_^[ 	]*__g' -e 's_[ 	]*=.*$__' -e 's_^\(.*\)$_alias \1="git "\1_' > ~/.zshrc.aliases
source ~/.zshrc.aliases

alias tmux="TERM=xterm-256color tmux"
alias irssi="TERM=screen irssi"
. /etc/bash_completion.d/virtualenvwrapper
VIRTUAL_ENV_DISABLE_PROMPT="true"

function ref() { git clone https://github.com/${1}.git ~/ref/${1} && git clone https://github.com/${1}.wiki.git ~/ref/${1}.wiki }
function cdref() { cd ${1} }
function ghu() { reply=(`echo ~/ref/*/*`) }
compctl -K ghu cdref


PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

eval `keychain --quiet --eval --agents ssh github gitlab`

alias t="todo"
