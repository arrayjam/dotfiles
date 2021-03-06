# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

CASE_SENSITIVE="true"
export UPDATE_ZSH_DAYS=30
DISABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
plugins=(git vagrant)
# ZSH_THEME="agnoster"
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
#
PATH=$PATH:~/.stack/programs/x86_64-osx/ghc-7.8.4/bin
PATH=$PATH:~/.cabal/bin
PATH=$PATH:/usr/local/m-cli
#

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

function gitpulls() {
	alldirs "git pull --rebase"
}

function alldirs() {
	for i in `find . -maxdepth 1 -mindepth 1 -type d -exec echo "{}" \;`
	do
		pushd $i > /dev/null
		echo "In $i"
		eval "$1"
		popd > /dev/null
	done
}

# Command Root: Runs a command in the git root
function cr() {
	pushd $(git rev-parse --show-toplevel)
	"$@"
	popd > /dev/null
}

#PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

#eval `keychain --quiet --eval --agents ssh github gitlab`

#alias t="todo"
setopt auto_cd

# chruby
source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh
chruby ruby-2.1.5

alias sr="http-server -o"
echo -n "aww yeaaaa, wow" | perl -e 'my @a = split(/,\s+/, <>); print $a[rand @a]' | xargs figlet -f "whimsy" | lolcat -8
export PATH=/usr/local/sbin:$PATH

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

function cdr() { cd $(git rev-parse --show-toplevel) }

function vr() { vim "+cd $(git rev-parse --show-toplevel)" }

export EDITOR="edit -w"

# export PKG_CONFIG_PATH=/opt/X11/lib/pkgconfig
# export GIT_PS1_SHOWDIRTYSTATE=true
# export GIT_PS1_SHOWSTASHSTATE=true

alias ls='ls -G'  # OS-X SPECIFIC - the -G command in OS-X is for colors, in Linux it's no groups
export LSCOLORS="gxDxFxdxCxExExhbadgxgx"

function cd() {
	if [ $# -gt 0 ]; then
		builtin cd "$*" && ls
	else
		builtin cd && ls
	fi
}

alias cdfactoriobase='cd /Users/arrayjam/Library/Application Support/Steam/SteamApps/common/Factorio/factorio.app/Contents/data/base'

source ~/.promptline

function play {
	youtube-dl --default-search=ytsearch: \
		--youtube-skip-dash-manifest \
		--output="${TMPDIR:-/tmp/}%(title)-s%(id)s.%(ext)s" \
		--restrict-filenames \
		--format="bestaudio[ext!=webm]" \
		--exec=mplayer -vvv "$*"
}

weather() {
	if [ "$1" ] ; then
		city=$1
	else
		city="melbourne"
	fi

	curl http://wttr.in/$city
}

function commitPlan {
	pushd $(dirname $(readlink ~/.plan)) >/dev/null
	git add .
	git commit -m "$(date)"
	git push origin > ~/plan-push.log 2>&1 &;
	popd >/dev/null
}

# New plan entry for the day
alias np='vim +"execute \"normal! Go\<cr>--- $(date '+%d-%m-%y') ---\<cr>\<cr>\"" ~/.plan && commitPlan'

# Edit plan
alias p='vim +"execute \"normal! Go\"" ~/.plan && commitPlan'

# Encrypt a block for the plan
alias ep='echo > temp; vim temp && cat temp | gpg --armour --encrypt --hidden-recipient plan@email | pbcopy && rm temp'


man() {
	env \
		LESS_TERMCAP_mb=$(printf "\e[1;31m") \
		LESS_TERMCAP_md=$(printf "\e[1;31m") \
		LESS_TERMCAP_me=$(printf "\e[0m") \
		LESS_TERMCAP_se=$(printf "\e[0m") \
		LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
		LESS_TERMCAP_ue=$(printf "\e[0m") \
		LESS_TERMCAP_us=$(printf "\e[1;32m") \
		man "$@"
}

# man() {
# 	env \
# 		LESS_TERMCAP_mb=$(printf "\x1b[38;2;255;200;200m") \
# 		LESS_TERMCAP_md=$(printf "\x1b[38;2;255;100;200m") \
# 		LESS_TERMCAP_me=$(printf "\x1b[0m") \
# 		LESS_TERMCAP_so=$(printf "\x1b[38;2;60;90;90;48;2;40;40;40m") \
# 		LESS_TERMCAP_se=$(printf "\x1b[0m") \
# 		LESS_TERMCAP_us=$(printf "\x1b[38;2;150;100;200m") \
# 		LESS_TERMCAP_ue=$(printf "\x1b[0m") \
# 		man "$@"
# }


tn() {
	tmux new-session -A -c $1 -s $2
}
