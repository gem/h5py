#!/bin/sh -e

# called by uscan with '--upstream-version' <version> <file>

TAR=$3

# move to directory 'tarballs'
if [ -r .svn/deb-layout ]; then
  . .svn/deb-layout
  mv $TAR $origDir
  echo "moved $TAR to $origDir"
fi

