if ($?oldpath) then
    set path=($oldpath)
    unsetenv oldpath

    unalias cdvirtualenv
    unalias cdsitepackages
    alias setprompt 'set prompt="${machine}$cwd:t% "'
    setprompt
else
    echo "virtualenv not active"
endif
