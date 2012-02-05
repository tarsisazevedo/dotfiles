setenv GOROOT ${HOME}/lib/go
setenv GOPATH ${HOME}/gocode
setenv GOBIN ${GOROOT}/bin
setenv GOMAXPROCS 1

setenv ANDROID_SDK /opt/local/android-sdk-macosx

set path=(/usr/local/bin /usr/local/sbin ${GOBIN} ${GOPATH}/bin /opt/local/bin ${ANDROID_SDK}/tools ${ANDROID_SDK}/platform-tools /usr/local/etc/rc.d ${path})
set history=500

setenv EDITOR vim
setenv PAGER less
setenv MANPAGER ${PAGER}
setenv VIRTUOSO_HOME /usr/local/virtuoso-opensource

setenv CFLAGS "-I/usr/local/include/"
setenv LDFLAGS "-L/usr/local/lib/"

alias parse_git_branch "git branch >& /dev/null && git branch | sed -e '/^[^*]/d' -e 's/* \(.*\)/g=\1 /'"
alias parse_hg_branch "hg branch >& /dev/null && hg branch | awk '{print $1}' | sed -e 's/\(.*\)/h=\1 /'"
alias v "source ${HOME}/Projects/dotfiles/extra/activate_virtualenv.csh"
alias d "source ${HOME}/Projects/dotfiles/extra/deactivate_virtualenv.csh"
alias j jobs -l
alias mkv "virtualenv ${HOME}/.virtualenvs/\!:1"
alias rmv "rm -rf ${HOME}/.virtualenvs/\!:1 && echo 'Removed ${HOME}/.virtualenvs/\!:1'"
alias vi vim

alias setprompt 'set prompt="`parse_git_branch``parse_hg_branch`wd=$cwd:t% "'
alias precmd setprompt
setprompt
