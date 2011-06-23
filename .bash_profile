# Make bash check its window size after a process completes
shopt -s checkwinsize

# LS COLORS
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# ENVIRONMENT

# GREP
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;37'
alias grep='grep --color=auto' # Always highlight grep search term

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

parse_git_branch_with_brackets() {
  typeset current_branch=$(parse_git_branch)
  if [ "$current_branch" != "" ]
  then
      echo "($current_branch)"
  fi
}

parse_hg_branch_with_brackets() {
  hg branch 2> /dev/null | awk '{print "("$1")"}'
}

parse_current_rvm() {
  typeset current_rvm=`rvm current i v`
  if [ "$current_rvm" != "system" ]
  then
      echo "($current_rvm) "
  fi
}

# Go stuff
export GOROOT=$HOME/lib/go
export GOBIN=$GOROOT/bin
export GOOS=darwin
export GOARCH=amd64
export GOMAXPROCS=1

# Android path
export ANDROID_HOME=/opt/android-sdk
export PATH=/usr/local/bin:/usr/local/sbin:/opt/python/bin:$GOBIN:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:/opt/local/bin:/opt/local/sbin:$PATH

# Setting PATH for MacPython 2.6
PATH="/Library/Frameworks/Python.framework/Versions/2.6/bin:${PATH}"
export PATH

# 30m - Black
# 31m - Red
# 32m - Green
# 33m - Yellow
# 34m - Blue
# 35m - Purple
# 36m - Cyan
# 37m - White
# Everything else is green...
# 0 - Normal
# 1 - Bold
# 2 - 
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
    export PS1="${WHITE}\$(parse_current_rvm)${WHITE}\u${RED}@${PURPLE}\h ${CYAN}\w ${WHITE}\$(parse_git_branch_with_brackets)${WHITE}\$(parse_hg_branch_with_brackets)
${YELLOW}$ \[\e[m\]\[\e[m\]"
}
prompt

export VIRTUALENVWRAPPER_PYTHON=`which python`
source `which virtualenvwrapper.sh`
[[ -s "/Users/francisco.souza/.rvm/scripts/rvm" ]] && source "/Users/francisco.souza/.rvm/scripts/rvm"  # This loads RVM into a shell session.

function work () {
    typeset env_name="$1"
    if [ "$env_name" = "" ]
    then
        virtualenvwrapper_show_workon_options
        return 1
    fi

    virtualenvwrapper_verify_workon_environment $env_name || return 1

    echo "source ~/.bash_profile
          workon $env_name" > ~/.virtualenvrc

    bash --rcfile ~/.virtualenvrc
}

# Push git changes. $1 = destination branch
function git_push() {
    typeset current_branch=$(parse_git_branch)
    typeset destination_branch="$1"
    if [ "$destination_branch" = "" ]
    then
        typeset destination_branch="master"
    fi
    git pull origin $destination_branch && git checkout $destination_branch && git merge $current_branch && git push origin $destination_branch && git checkout $current_branch
}

function start_g1_app() {
    mkdir -p $1
    for file in "__init__.py" "models.py" "views.py" "widgets.py"
    do
        touch "${1}/${file}"
    done

    for directory in "$1/tests" "$1/tests/unit" "$1/tests/functional"
    do
        mkdir -p ${directory}
        touch "${directory}/__init__.py"
    done
}

export PYTHONPATH=$HOME/Projetos/publicacao-core/publicacao:$HOME/Projetos/dynamo:$HOME/lib/python:$PYTHONPATH
export VIRTUOSO_HOME=/usr/local/Cellar/virtuoso/6.1.2

