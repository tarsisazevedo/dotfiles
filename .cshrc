setenv LANG en_US.UTF-8
setenv LC_COLLATE pt_BR.UTF-8
setenv LC_CTYPE pt_BR.UTF-8
setenv LC_MESSAGES en_US.UTF-8
setenv LC_MONETARY pt_BR.UTF-8
setenv LC_NUMERIC pt_BR.UTF-8
setenv LC_TIME pt_BR.UTF-8

setenv GOROOT ${HOME}/lib/go
setenv GOPATH ${HOME}/gocode
setenv GOMAXPROCS 1
setenv RBENV $HOME/.rbenv

setenv NODE_PATH /usr/local/lib/node_modules

set path=($RBENV/shims $HOME/bin /opt/bin ${GOROOT}/bin ${GOPATH}/bin /usr/local/bin /usr/local/sbin /opt/local/bin ${path} ${HOME}/Projects/dotfiles/bin)
set history=50

setenv JAVA_HOME /Library/Java/JavaVirtualMachines/jdk1.7.0_07.jdk/Contents/Home

setenv EDITOR vim
setenv PAGER less
setenv MANPAGER $PAGER

setenv CC /opt/bin/clang
setenv CXX /opt/bin/clang++
setenv CFLAGS "-I/opt/include -I/usr/local/include/ -Wall -Wextra -Wno-comments -pedantic"
setenv CXXFLAGS "${CFLAGS}"
setenv LDFLAGS "-L/usr/local/lib/ -L/opt/lib"
setenv VIRTUALENVS ${HOME}/.venvs

if $?SSH_CLIENT then
	set machine="ssh=%m/"
else
	set machine=""
endif

alias v "source ${HOME}/Projects/dotfiles/extra/activate_virtualenv.csh"
alias d "source ${HOME}/Projects/dotfiles/extra/deactivate_virtualenv.csh"
alias mkv "test -d ${VIRTUALENVS} || mkdir -p ${VIRTUALENVS} ; virtualenv ${VIRTUALENVS}/\!:1"
alias rmv "rm -rf ${VIRTUALENVS}/\!:1 && echo 'Removed ${VIRTUALENVS}/\!:1'"
alias rbenv_version "cat $RBENV/version >& /dev/null && cat $RBENV/version | sed -e 's/^.*\(1.[0-9].[0-9]\).*/r=\1 /'"
alias dr "rm $RBENV/version"

alias setprompt 'set prompt="${machine}$cwd:t% "'
alias precmd setprompt
setprompt

source /opt/intel/bin/compilervars.csh intel64
