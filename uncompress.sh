#!/bin/bash

set -xe

if [ -f "$@" ] ; then
    FILE_NAME="$@"
    DIR_NAME="$(echo ${FILE_NAME%.*} | tr " " "-")-extracted"
    mkdir $DIR_NAME
    cp "$@" $DIR_NAME
    pushd $DIR_NAME
    case "$@" in
        *.tar.bz2)  tar xjf "$@"   ;;
        *.tar.gz)   tar xzf "$@"   ;;
        *.tar.xz)   tar xf "$@"  ;;
        *.bz2)      bunzip2 "$@"   ;;
        *.rar)      rar x "$@"     ;;
        *.gz)       gunzip "$@"    ;;
        *.tar)      tar xf "$@"    ;;
        *.tbz2)     tar xjf "$@"   ;;
        *.tgz)      tar xzf "$@"   ;;
        *.xz)       xz -d "$@"     ;;
        *.zip)      unzip "$@"     ;;
        *.Z)        uncompress "$@";;
        *)          echo "contents of '"$@"' cannot be extracted" ;;
    esac
    popd
else
    echo "file not found: '"$@"' "
fi

if [ $? != 0 ]; then
    echo "** extraction failed **"
    exit 1
fi
