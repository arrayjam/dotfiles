export TERM=xterm-256color

PATH=$PATH:$HOME/.bin
PATH=$HOME/.local/bin:$PATH
export PATH

. /home/arrayjam/.local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh

# Create aliases for all our gitaliases such that "cx" is aliased to "git cx".
grep -A1000 '\[alias\]' ~/.gitconfig | grep -Ev '^[ 	]*(#|$|\[alias\])' | sed -e 's_^[ 	]*__g' -e 's_[ 	]*=.*$__' -e 's_^\(.*\)$_alias \1="git "\1_' > ~/.zshrc.aliases
source ~/.zshrc.aliases
source ~/.zshrc.local

alias tmux="TERM=xterm-256color ssh-agent tmux"
