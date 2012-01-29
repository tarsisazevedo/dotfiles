if ($?oldpath) then
    set path=($oldpath)
    unsetenv oldpath

    unalias cdvirtualenv
    unalias cdsitepackages
    alias setprompt 'set prompt="`parse_git_branch``parse_hg_branch`wd=$cwd:t% "'
    setprompt
else
    echo "virtualenv not active"
endif
