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
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

parse_current_rvm() {
  ~/.rvm/bin/rvm-prompt i v
}

# WELCOME MESSAGE
echo -e ""
echo -ne "Today is "; date
echo -e ""; cal;
echo -ne "Up time: ";uptime | awk /'up/ {print $3,$4}'
echo "";

##
# Your previous /Users/francisco/.bash_profile file was backed up as /Users/francisco/.bash_profile.macports-saved_2010-03-26_at_16:40:20
##

export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/1.5.0/Home
export ANT_HOME=$HOME/Applications/apache-ant-1.7.1
# MacPorts Installer addition on 2010-03-26_at_16:40:20: adding an appropriate PATH variable for use with MacPorts.
export PATH=$ANT_HOME/bin:/opt/local/bin:/opt/local/sbin:$PATH
export EP_LIB=/Users/francisco/Documents/workspace/wine/env/ep6lib
# Finished adapting your PATH environment variable for use with MacPorts.

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
  local current_rvm=parse_current_rvm
  if "$current_rvm" != ''
  then
    export PS1="${WHITE}(\$(parse_current_rvm)) ${WHITE}\u${RED}@${PURPLE}\h ${CYAN}\w ${WHITE}\$(parse_git_branch) ${YELLOW}$ \[\e[m\]\[\e[m\]"
  else
    export PS1="${WHITE}\u${RED}@${PURPLE}\h ${CYAN}\w ${WHITE}\$(parse_git_branch) ${YELLOW}$ \[\e[m\]\[\e[m\]"
  fi
}
prompt

source /usr/local/bin/virtualenvwrapper.sh

function work () {
    typeset env_name="$1"
    if [ "$env_name" = "" ]
    then
        virtualenvwrapper_show_workon_options
        return 1
    fi

    virtualenvwrapper_verify_workon_environment $env_name || return 1

    echo "source ~/.profile
          workon $env_name" > ~/.virtualenvrc

    bash --rcfile ~/.virtualenvrc
}
