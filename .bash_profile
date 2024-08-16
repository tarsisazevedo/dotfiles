# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# go lang
GOROOT="/usr/local/Cellar/go/r60.1"

# Homebrew
PATH="/usr/local/bin:/usr/local/sbin:$HOME/.poetry/bin:$PATH"

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

export LSCOLORS=gxfxcxdxbxegedabagacad

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

source ~/projects/pessoal/dotfiles/.bash_aliases

export HISTCONTROL=ignoredups
export HISTFILESIZE=100000000

export GOPATH=~/.go

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export HOMEBREW_NO_ANALYTICS=1

export CDPATH="$GOPATH/src:$CDPATH"
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
source ~/.git-prompt.sh
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export PATH="$HOME/.cargo/bin:$PATH"

source $HOME/.cargo/env
export PATH="$HOME/.poetry/bin:$PATH"
export PATH="$HOME/projects/k8s/jusbr-kube/scripts:$PATH"
export PATH="/Library/TeX/texbin/latex:$PATH"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completionexport PATH="/usr/local/opt/openssl@3/bin:$PATH"

export PYENV_ROOT="$HOME/.pyenv"
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/tarsisazevedo/google-cloud-sdk/path.bash.inc' ]; then . '/Users/tarsisazevedo/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/tarsisazevedo/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/tarsisazevedo/google-cloud-sdk/completion.bash.inc'; fi
export PATH="/Users/tarsisazevedo/projects/homebrew/opt/openssl@3/bin:$PATH"
export PATH="/Users/tarsisazevedo/projects/homebrew/opt/bzip2/bin:$PATH"
eval "$(/Users/tarsisazevedo/projects/homebrew/bin/brew shellenv)"
export PATH="/Users/tarsisazevedo/projects/homebrew/opt/sqlite/bin:$PATH"

# bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"export PATH="/Users/tarsisazevedo/projects/homebrew/opt/llvm@11/bin:$PATH"

export PATH="/Users/tarsisazevedo/projects/homebrew/opt/postgresql@11/bin:$PATH"
export LDFLAGS="-L/Users/tarsisazevedo/projects/homebrew/opt/postgresql@11/lib"
export CPPFLAGS="-I/Users/tarsisazevedo/projects/homebrew/opt/postgresql@11/include"
export PKG_CONFIG_PATH="/Users/tarsisazevedo/projects/homebrew/opt/postgresql@11/lib/pkgconfig"