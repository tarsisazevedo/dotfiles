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

setenv ANDROID_SDK /opt/local/android-sdk-macosx

set path=($RBENV/shims /usr/local/bin /usr/local/sbin ${GOROOT}/bin ${GOPATH}/bin /opt/local/bin ${ANDROID_SDK}/tools ${ANDROID_SDK}/platform-tools ${path} ${HOME}/Projects/dotfiles/bin)
set history=50

setenv EDITOR vim
setenv PAGER less
setenv MANPAGER ${PAGER}

setenv CC /usr/bin/clang
setenv CXX /usr/bin/clang++
setenv CFLAGS "-I/usr/local/include/ -Wall -Wextra -pedantic-errors"
setenv CXXFLAGS "${CFLAGS}"
setenv LDFLAGS "-L/usr/local/lib/"
setenv VIRTUALENVS ${HOME}/.venvs

set machine=""

if $?SSH_CLIENT then
    set machine="ssh=%m "
endif

alias parse_git_branch "git branch >& /dev/null && git branch | sed -e '/^[^*]/d' -e 's/* \(.*\)/g=\1 /'"
alias parse_hg_branch "hg branch >& /dev/null && hg branch | awk '{print $1}' | sed -e 's/\(.*\)/h=\1 /'"
alias v "source ${HOME}/Projects/dotfiles/extra/activate_virtualenv.csh"
alias d "source ${HOME}/Projects/dotfiles/extra/deactivate_virtualenv.csh"
alias mkv "test -d ${VIRTUALENVS} || mkdir -p ${VIRTUALENVS} ; virtualenv ${VIRTUALENVS}/\!:1"
alias rmv "rm -rf ${VIRTUALENVS}/\!:1 && echo 'Removed ${VIRTUALENVS}/\!:1'"
alias rbenv_version "cat $RBENV/version >& /dev/null && cat $RBENV/version | sed -e 's/^.*\(1.[0-9].[0-9]\).*/r=\1 /'"
alias dr "rm $RBENV/version"

alias setprompt 'set prompt="${machine}`rbenv_version``parse_git_branch``parse_hg_branch`wd=$cwd:t% "'
alias precmd setprompt
setprompt
