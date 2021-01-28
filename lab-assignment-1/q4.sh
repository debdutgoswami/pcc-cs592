#!/bin/bash

# using bubble sort technique to sort the number in ascending order

read -p "enter n: " n
echo "enter the array elements:"
for ((i = 0; i < n; i++)); do
    read a[i]
done
for ((i = 0; i < n - 1; i++)); do
    for ((j = 0; j < n - i - 1; j++)); do
        if [ ${a[j]} -gt ${a[j + 1]} ]; then
            tmp=${a[j]}
            a[j]=${a[j + 1]}
            a[j + 1]=$tmp
        fi
    done
done
echo "sorted array"
for ((i = 0; i < n; i++)); do
    printf ${a[i]}, " "
done
echo ""
