#!/bin/sh

rm -rf $GOROOT/pkg/darwin_amd64_race
CC=/opt/bin/gcc go install launchpad.net/goyaml
CC=/opt/bin/gcc go install -race launchpad.net/goyaml
