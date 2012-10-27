#!/bin/sh
if test -x $1; then
    $1 > $2
    echo "the result has been save to $2"
    vi $2
else
    echo "the command you inputed ( $1 ) can't be executed"
fi
