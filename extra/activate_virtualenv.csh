set virtualenvpath=${HOME}/.virtualenvs/!:$

if -e ${virtualenvpath} then
    if ! ( $?oldpath ) then
        setenv oldpath "$path"
    endif

    setenv VIRTUALENV "!:$"
    set path=(${virtualenvpath}/bin $path)

    alias cdvirtualenv 'cd ${virtualenvpath}'
    alias cdsitepackages 'cd ${virtualenvpath}/lib/python*/site-packages'
    alias setprompt 'set prompt="v=${VIRTUALENV} ${rvminfo}`parse_git_branch``parse_hg_branch`wd=$cwd:t% "'
    setprompt
else
    echo "virtualenv !:$ not found"
endif
