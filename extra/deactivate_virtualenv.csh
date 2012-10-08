if ($?oldpath) then
    set path=($oldpath)
    unsetenv oldpath

    unalias cdvirtualenv
    unalias cdsitepackages
    alias setprompt 'set prompt="${machine}`rbenv_version`wd=$cwd:t% "'
    setprompt
else
    echo "virtualenv not active"
endif
