#!/bin/bash
if [ -n "$1" ]
then
    if [ -z "$2" ]
    then
        counter=1
        while [ "$counter" -le "$1" ]
        do
            echo $counter
            ((counter++))
        done
    else 
        counter=$2
        while [ "$counter" -le "$1" ]
        do
            echo $counter
            counter=$(($counter + $2))
        done
        fi
else 
    echo "No numbers"
fi
