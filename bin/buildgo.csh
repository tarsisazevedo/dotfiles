#!/bin/csh -ef

if $#argv != 2 then
	echo "usage: buildgo.csh GOOS GOARCH"
	exit 2
endif

pushd ${GOROOT}/src
./clean.bash
./make.bash
popd

foreach arch (8 6)
	foreach cmd (a c g l)
		go tool dist install -v cmd/$arch$cmd
	end
end
setenv CGO_ENABLED 0
setenv GOOS $1
setenv GOARCH $2
go tool dist install -v pkg/runtime
go install -v -a std
exit 0
