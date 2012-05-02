set version=!:$

if $version == "trunk" then
    setenv GOROOT ${HOME}/lib/go
    set path=($GOROOT/bin ${path})
else if $version == "go1" then
    setenv GOROOT ${HOME}/lib/go1
    set path=($GOROOT/bin ${path})
else
    echo "go version not found"
endif
