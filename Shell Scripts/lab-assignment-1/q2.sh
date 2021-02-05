#!/bin/bash

# Write a shell script to find the GCD and LCM of a set of numbers.
# (size of the set and numbers will be provided as command line argument)

gcd() {
    x=$1
    y=$2
    while [ $x -ne $y ]; do
        if [ $x -gt $y ]; then
            x=$(expr $x - $y)
        else
            y=$(expr $y - $x)
        fi
    done
    echo "$x"
}

count=$#
if [ $count -lt 2 ]; then
    echo "Not possible"
    exit
fi

j=1
for i in $*; do
    a[j]=$i
    j=$(expr $j + 1)
done
g=${a[1]}
l=${a[1]}
for ((i = 2; i <= count; i++)); do
    g="$(gcd ${a[i]} $g)"
    l=$(expr \( ${a[i]} \* $l \) / $g)
    if [ $g -eq 1 ]; then
        break
    fi
done
echo "GCD: $g"
echo "LCM: $l"
