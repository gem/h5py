#!/bin/bash
set -e

destdir="$(head -n 1 debian/changelog  | sed 's/\([^ ]*\)[ ]*(\([^-)]*\).*/\1-\2/g')"
    
if [ "$1" = "build" ]; then
    mkdir "$destdir"
    git archive HEAD | tar -x -C "$destdir"
    rm -rf "$destdir"/orig
elif [ "$1" = "clean" ]; then
    rm -rf "$destdir"
fi