grep -A1000 '\[alias\]' ~/.gitconfig | grep -Ev '^[ 	]*(#|$|\[alias\])' | sed -e 's_^[ 	]*__g' -e 's_[ 	]*=.*$__' -e 's_^\(.*\)$_alias \1="git "\1_' > ~/.bashrc.aliases
source ~/.bashrc.aliases

# Command Root: Runs a command in the git root
function cr() {
	pushd $(git rev-parse --show-toplevel)
	"$@"
	popd > /dev/null
}

# CD Root: cd to the git root
function cdr() { cd $(git rev-parse --show-toplevel) }

# Vim Root: Open vim at git root
function vr() { vim "+cd $(git rev-parse --show-toplevel)" }

