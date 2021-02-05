#!/bin/bash

fact() {
    num=$1
    f=1
    for ((i = 1; i <= num; i++)); do
        f=$(expr $f \* $i)
    done
    echo "$f"
}

ncr() {
    n=$1
    r=$2
    a=$(fact $n)
    b=$(fact $r)
    c=$(expr $n - $r)
    d=$(fact $c)
    f=$(expr $a / \( $b \* $d \))
    echo "$f"
}

clear
echo "number of rows? "
read n
x=10
y=40
for ((i = 0; i < n; i++)); do
    tput cup $x $y
    for ((j = 0; j <= i; j++)); do
        echo -n "$(ncr $i $j)     "
    done
    x=$(expr $x + 1)
    y=$(expr $y - 3)
    echo ""
done
