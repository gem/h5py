#!/bin/bash
PKGNAME=h5py
set -x
set -e

destdir="$(head -n 1 debian/changelog  | sed 's/\([^ ]*\)[ ]*(\([^-)]*\).*/\1-\2/g')"
    
if [ "$1" = "build" ]; then
    shift
    mkdir -p "build/$destdir"
    git archive HEAD | tar -x -C "build/$destdir"
    mv "build/$destdir"/orig/* "build/"
    rm -rf "build/$destdir"/orig
    rm -rf "build/$destdir"/builder.sh
    cd "build/$destdir"
    dpkg-buildpackage
elif [ "$1" = "clean" ]; then
    rm -rf "build"
fi

