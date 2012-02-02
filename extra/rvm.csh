#!/usr/bin/env tcsh

set rvm_command="source ${HOME}/.rvm/scripts/rvm; rvm $*"

if ($1 == "use") then
    bash -c "$rvm_command && tcsh"
else
    bash -c "$rvm_command"
endif
