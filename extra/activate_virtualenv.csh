set virtualenvpath=${VIRTUALENVS}/!:$

if !:$ == 'v' then
    ls ${VIRTUALENVS}
else if -e ${virtualenvpath} then
    if ! ( $?oldpath ) then
        setenv oldpath "$path"
    endif

    setenv VIRTUALENV "!:$"
    set path=(${virtualenvpath}/bin $path)

    alias cdvirtualenv 'cd ${virtualenvpath}'
    alias cdsitepackages 'cd ${virtualenvpath}/lib/python*/site-packages'
    alias setprompt 'set prompt="v=${VIRTUALENV} ${machine}$cwd:t% "'
    setprompt
else
    echo "virtualenv !:$ not found"
endif
