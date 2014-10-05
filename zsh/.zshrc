# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

CASE_SENSITIVE="true"
export UPDATE_ZSH_DAYS=30
DISABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
plugins=(git)
ZSH_THEME="agnoster"
DEFAULT_USER="arrayjam"

source $ZSH/oh-my-zsh.sh

# Overriding PATHs
# Node
PATH=./node_modules/.bin:$PATH

# Powerline
PATH=~/Library/Python/2.7/bin:$PATH

# Local
PATH=$HOME/bin:$PATH

# Homebrew
PATH=/usr/local/bin:$PATH

# Normal stuff
PATH=$PATH:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games
#PATH=$HOME/.rvm/gems/ruby-2.0.0-p247/bin:$PATH

export PATH


#export TERM=xterm-256color
#. ~/Library/Python/2.7/lib/python/site-packages/Powerline/bindings/zsh/powerline.zsh

grep -A1000 '\[alias\]' ~/.gitconfig | grep -Ev '^[ 	]*(#|$|\[alias\])' | sed -e 's_^[ 	]*__g' -e 's_[ 	]*=.*$__' -e 's_^\(.*\)$_alias \1="git "\1_' > ~/.zshrc.aliases
source ~/.zshrc.aliases

#alias tmux="TERM=xterm tmux"
#alias irssi="TERM=screen irssi"
#. /etc/bash_completion.d/virtualenvwrapper
#VIRTUAL_ENV_DISABLE_PROMPT="true"

function ref() { git clone https://github.com/${1}.git ~/ref/${1} && git clone https://github.com/${1}.wiki.git ~/ref/${1}.wiki }
function cdref() { cd ${1} }
function ghu() { reply=(`find ~/ref -maxdepth 2 -mindepth 2 -type d -exec ls -d "{}" \;`) }
compctl -K ghu cdref
function updateref() {
	for i in `find ~/ref -maxdepth 2 -mindepth 2 -type d -exec echo "{}" \;`
	do
		cd $i
		echo "Updating $i"
		git pull --rebase
	done
}


#PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

#eval `keychain --quiet --eval --agents ssh github gitlab`

#alias t="todo"
setopt auto_cd

# chruby
source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh
chruby ruby-2.1.2

alias sr="http-server -o"
echo -n "fuck yeah, aww yeaaa, wow" | perl -e 'my @a = split(/,\s+/, <>); print $a[rand @a]' | figlet -f whimsy -w 1000 | lolcat
export PATH=/usr/local/sbin:$PATH

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

function cdr() {
	cd $(git rev-parse --show-toplevel)
}

function vr() {
	vim "+cd $(git rev-parse --show-toplevel)"
}
