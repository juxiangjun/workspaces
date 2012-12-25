#!/bin/sh
echo $1
case $1 in

　　-h) help;shift 1;; # function help is called

　　--) shift;break;; # end of options

　　-*) error "error: no such option $1. -h for help";;

　　*) break;;

esac

help() {
    echo "help"
}

error(){
    echo $1
}

shift() {
    echo $1
}

