#!/bin/bash

is_prime() {
    #storing the number to be checked
    number=$1
    i=2

    #flag variable
    f=0
    #running a loop from 2 to number/2
    while [ $i -le $(expr $number / 2) ]; do
        #checking if i is factor of number
        if [ $(expr $number % $i) -eq 0 ]; then
            f=1
        fi
        #increment the loop variable
        i=$(expr $i + 1)
    done
    if [ $f -eq 1 ]; then
        echo 0
    else
        echo 1
    fi
}

low=$1
high=$2

for ((i = low; i <= high; i++)); do
    if [ $(is_prime $i) -eq 1 ]; then
        echo $i
    fi
done
