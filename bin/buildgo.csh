#!/bin/csh -ef

if ($#argv < 1) then
	echo "usage: buildgo.csh GOOS_GOARCH1 GOOS_GOARCH2 ... GOOS_GOARCHN"
	exit 2
endif

pushd ${GOROOT}/src
./make.bash --no-clean
popd

foreach arch (8 6)
	foreach cmd (a c g l)
		go tool dist install -v cmd/$arch$cmd
	end
end

setenv CGO_ENABLED 0

foreach arg ($argv[*])
	setenv GOOS `echo $arg | cut -d'_' -f1`
	setenv GOARCH `echo $arg | cut -d'_' -f2`
	go tool dist install -v pkg/runtime
	go install -v -a std
end

exit 0
