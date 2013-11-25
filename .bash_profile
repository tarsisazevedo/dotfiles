# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# go lang
GOROOT="/usr/local/Cellar/go/r60.1"

# bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

export ARCHFLAGS="-arch i386 -arch x86_64"

# Homebrew
PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# LS COLORS
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# Alias
alias l="ls"
alias ..="cd .."

# GREP
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;37'
alias grep='grep --color=auto' # Always highlight grep search term

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/' | sed 's/$/ /'
}

function prompt {
	local BLACK="\[\033[0;30m\]"
	local RED="\[\033[0;31m\]"
	local GREEN="\[\033[0;32m\]"
	local YELLOW="\[\033[0;33m\]"
	local BLUE="\[\033[0;34m\]"
	local PURPLE="\[\033[0;35m\]"
	local CYAN="\[\033[0;36m\]"
	local WHITE="\[\033[0;37m\]"
	local WHITEBOLD="\[\033[1;37m\]"
export PS1="${RED}\${CYAN}\u${RED} ${YELLOW}\w ${GREEN}\$(parse_git_branch)${WHITE}$ \[\e[m\]\[\e[m\]"
}
prompt

source /usr/local/bin/virtualenvwrapper.sh
export LSCOLORS=gxfxcxdxbxegedabagacad

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

source ~/projetos/pessoal/dotfiles/.bash_aliases
source /usr/local/etc/bash_completion.d/fab
PATH="/usr/local/heroku/bin:$PATH"

export HISTCONTROL=ignoredups
