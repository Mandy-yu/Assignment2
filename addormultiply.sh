#!/usr/bin/bash
sum=$(( $1 + $2 ))
if [[ sum -lt 20 ]]
then 
    echo $sum
else
    echo $(($1 * $2))
fi
