#!/bin/bash
set -e # exit script on any error

VERSION=v$(date +%Y.%m.%d.%H%M)
PREFIX=multifunction-also-needs-firmware-
ZIPFILE=$PREFIX$VERSION.zip
PATH=$HOME/hub-linux-arm-2.3.0-pre10/bin:$PATH

pushd ../../../ultibo-groupstudy-jan2018/student/markfirmware/multifunction
    ./build.sh
    cp kernel7.img multifunction-kernel7.img
    zip $ZIPFILE multifunction-kernel7.img multifunction-config.txt multifunction-cmdline.txt
    mv $ZIPFILE $(dirs -l +1)
popd

hub release create -p -m "multifunction $VERSION" -a $ZIPFILE $VERSION
