if ! ( $?oldpath ) then
    setenv oldpath "$path"
endif

setenv VIRTUALENV "${1}"
set path=($HOME/.virtualenvs/$1/bin $path)

alias setprompt 'set prompt="v=${VIRTUALENV} `parse_git_branch``parse_hg_branch`w=$cwd:t% "'
setprompt
