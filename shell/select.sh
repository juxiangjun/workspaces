#!/bin/sh
echo "what's your favorite OS?"
select var in "Windows" "Ubuntu" "FreeBSD"; 
do
    break
done

echo "you have selected $var"
