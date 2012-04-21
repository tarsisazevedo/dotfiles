setenv GOROOT ${HOME}/lib/go
setenv GOPATH ${HOME}/gocode
setenv GOMAXPROCS 1

setenv ANDROID_SDK /opt/local/android-sdk-macosx

set path=(/usr/local/bin /usr/local/sbin ${GOROOT}/bin ${GOPATH}/bin /opt/local/bin ${ANDROID_SDK}/tools ${ANDROID_SDK}/platform-tools ${path})
set history=50

setenv EDITOR vim
setenv PAGER less
setenv MANPAGER ${PAGER}

setenv CC "/usr/bin/clang"
setenv CFLAGS "-I/usr/local/include/"
setenv LDFLAGS "-L/usr/local/lib/"

alias parse_git_branch "git branch >& /dev/null && git branch | sed -e '/^[^*]/d' -e 's/* \(.*\)/g=\1 /'"
alias parse_hg_branch "hg branch >& /dev/null && hg branch | awk '{print $1}' | sed -e 's/\(.*\)/h=\1 /'"
alias v "source ${HOME}/Projects/dotfiles/extra/activate_virtualenv.csh"
alias d "source ${HOME}/Projects/dotfiles/extra/deactivate_virtualenv.csh"
alias j jobs -l
alias mkv "virtualenv ${HOME}/.virtualenvs/\!:1"
alias rmv "rm -rf ${HOME}/.virtualenvs/\!:1 && echo 'Removed ${HOME}/.virtualenvs/\!:1'"

set rvminfo = ""
if ($?RUBY_VERSION) then
    set prompt = `rvm-prompt`
    set prompt = `rvm-prompt | awk '{split($0,a,"@");split(a[1],b,"-");print b[2]"@"a[2]}'`
    set rvminfo = "r=${prompt} "
endif

alias setprompt 'set prompt="${rvminfo}`parse_git_branch``parse_hg_branch`wd=$cwd:t% "'
alias precmd setprompt
setprompt
