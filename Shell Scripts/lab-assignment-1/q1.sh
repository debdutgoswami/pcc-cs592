#!/bin/bash

factorial() {
    n=$1
    fact=1
    for ((i = 2; i <= n; i++)); do
        fact=$(expr $fact \* $i)
    done

    echo "$fact"
}

clear

read -p "x = " x
read -p "n = " n

sum=0
for ((i = 0; i <= n; i++)); do
    new_n=$((2 * $i))
    facto=$(factorial $new_n)
    pow=$(($x ** $new_n))
    sum=$(($sum + $(($pow / $facto))))
done

echo "Sum = $sum"
