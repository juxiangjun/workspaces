#!/bin/sh
if test -z $1; then
    export
else 
    export > $1
    echo "the result has been saved to $1"
fi
