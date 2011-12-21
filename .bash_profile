# Make bash check its window size after a process completes
shopt -s checkwinsize

# For Lion
export ARCHFLAGS='-arch i386 -arch x86_64'

# LS COLORS
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

vim=/Applications/MacVim.app/Contents/MacOS/Vim
alias vim=$vim

avim() {
    local files=`find . -name "${1}" | xargs`
    vim -p $files
}

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

parse_git_branch_with_brackets() {
    typeset current_branch=$(parse_git_branch)
    if [ "$current_branch" != "" ]
    then
        echo "g=${current_branch} "
    fi
}

parse_hg_branch_with_brackets() {
    hg branch 2> /dev/null | awk '{print "h="$1" "}'
}

parse_current_rvm() {
    typeset current_rvm=`rvm current i v`
    if [ "$current_rvm" != "system" ]
    then
        echo "r=${current_rvm} "
    fi
}

parse_current_virtualenv() {
    if [ $VIRTUAL_ENV ]
    then
        typeset virtualenv=`basename $VIRTUAL_ENV`
        echo "v=${virtualenv} "
    fi
}

current_directory() {
    set -- "$PWD"
    IFS="/"; declare -a parts=($*)
    LEN=`expr ${#parts[@]} - 1`
    dir=${parts[$LEN]}
    user=`whoami`
    if [ $dir != $user ]; then
        echo $dir
    fi
}

#ARQ
export ARQROOT=$HOME/lib/arq
export PATH=$PATH:$ARQROOT/bin

# Go and Plan9 stuff
export PLAN9=$HOME/lib/plan9port
export GOROOT=$HOME/lib/go
export GOBIN=$GOROOT/bin
export GOOS=darwin
export GOARCH=amd64
export GOMAXPROCS=1

# Android path
export ANDROID_HOME=/opt/android-sdk
export PATH=/usr/local/bin:/usr/local/sbin:/opt/python/bin:$GOBIN:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:/opt/local/bin:/opt/local/sbin:$PLAN9/bin:$PATH

# Setting PATH for MacPython 2.5, 2.6 and 2.7
PYTHON_VERSIONS_PATH="/Library/Frameworks/Python.framework/Versions"
PATH="$PYTHON_VERSIONS_PATH/Current/bin:$PYTHON_VERSIONS_PATH/2.5/bin:$PYTHON_VERSIONS_PATH/2.6/bin:$PYTHON_VERSIONS_PATH/2.7/bin:${PATH}"
export PATH

PIP_USE_MIRRORS=true

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
    local WHITE="\[\033[0;37m\]"
    export PS1="${WHITE}\$(parse_current_virtualenv)\$(parse_current_rvm)\$(parse_git_branch_with_brackets)\$(parse_hg_branch_with_brackets)w=\$(current_directory)% \[\e[m\]\[\e[m\]"
}
prompt

export VIRTUALENVWRAPPER_PYTHON=`which python`
export VIRTUAL_ENV_DISABLE_PROMPT=1
source `which virtualenvwrapper.sh`
[[ -s "${HOME}/.rvm/scripts/rvm" ]] && source "${HOME}/.rvm/scripts/rvm"  # This loads RVM into a shell session.

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
function gpush() {
typeset current_branch=$(parse_git_branch)
typeset destination_branch="$1"
if [ "$destination_branch" = "" ]
then
    typeset destination_branch="master"
fi
git checkout $destination_branch && git pull origin $destination_branch && git merge $current_branch && git push origin $destination_branch && git checkout $current_branch
}

function start_g1_app() {
mkdir -p $1
for file in "__init__.py" "models.py" "views.py" "widgets.py"
do
    touch "${1}/${file}"
done

for directory in "$1/tests" "$1/tests/unit" "$1/tests/functional" "$1/tests/integration"
do
    mkdir -p ${directory}
    touch "${directory}/__init__.py"
done
}

export PYTHONPATH=$HOME/lib/python:$PYTHONPATH
export VIRTUOSO_HOME=/usr/local/Cellar/virtuoso/6.1.2

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH
