# If not running interactively, don't do anything
[ -z "$PS1" ] && return

source ~/.bash_git
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
alias grep='grep --color=auto' # Always highlight grep search term

function PWD {
    pwd | awk -F\/ '{if (NF>4) print "...", $(NF-2), $(NF-1), $(NF); else if (NF>3) print $(NF-2),$(NF-1),$(NF); else if (NF>2) print $(NF-1),$(NF); else if (NF>1) print $(NF);}' | sed -e 's# #\/#g'
}

function set_ps1() {
	local BLACK="\[\033[0;30m\]"
	local RED="\[\033[0;31m\]"
	local GREEN="\[\033[0;32m\]"
	local YELLOW="\[\033[0;33m\]"
	local BLUE="\[\033[0;34m\]"
	local PURPLE="\[\033[0;35m\]"
	local CYAN="\[\033[0;36m\]"
	local WHITE="\[\033[0;37m\]"
	local WHITEBOLD="\[\033[1;37m\]"
    local LIGHTBLUE="\[\033[1;34m\]"
    local LIGHTYELLOW="\[\033[1;33m\]"
    local LIGHTCYAN="\[\033[1;36m\]"
    local NOCOLOR="\[\e[0m\]"

    local venv=""
    if [[ $VIRTUAL_ENV != "" ]]; then
        venv="($(basename $VIRTUAL_ENV)) "
    fi
    local PS1_PART_1="$LIGHTBLUE${venv}$BLACK$USER$NOCOLOR@$PURPLE$(hostname -s) $NOCOLOR[/$LIGHTBLUE$(PWD)] $NOCOLOR$PURPLE$(__git_ps1)$NOCOLOR"
    local PS1_PART_2="\n\$ "
    local RULER_SIZE=$(expr 73 + 12)
    local EXPANDED_PS1=$(echo $PS1_PART_1 | sed "s/\\\\\[\\\033\\[[0-9];[0-9][0-9]m\\\\\\]//g" | sed "s/\\\\\\[\\\e\\[0m\\\\\\]//g")
    local LEN_PS=$(echo $EXPANDED_PS1 | wc -m)
    if [[ $RULER_SIZE -gt $LEN_PS ]]; then
        local LINE1_EXTRA=$(printf '%*s' $(expr $LEN_PS - $RULER_SIZE + 1) '' | tr ' ' -)
    fi
    export PS1="${PS1_PART_1}${LINE1_EXTRA}${PS1_PART_2}"
}
export PROMPT_COMMAND="set_ps1"
export PS1=""

source /usr/local/bin/virtualenvwrapper.sh
export LSCOLORS=gxfxcxdxbxegedabagacad

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

source ~/projetos/pessoal/dotfiles/.bash_aliases

export CFLAGS=-Qunused-arguments
export CPPFLAGS=-Qunused-arguments

export HISTCONTROL=ignoredups

export GOPATH=/home/tarsis/go

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export HOMEBREW_NO_ANALYTICS=1

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
source ~/.iterm2_shell_integration.`basename $SHELL`

export CDPATH="$GOPATH/src:$CDPATH"
export PATH="$HADOOP_HOME/bin:$PATH"
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
