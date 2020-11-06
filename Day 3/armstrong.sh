#!/bin/bash
read -p "enter number: " num
copy=$num
sum=0
length=0
while [ $copy -ne 0 ]; do
    copy=$(expr ${copy} / 10)
    length=$(expr ${length} + 1)
done
copy=$num
while [ $copy -ne 0 ]; do
    a=$((${copy} % 10))
    power=$((${a} ** ${length}))
    sum=$((${sum} + ${power}))
    copy=$((${copy} / 10))
done
if [ $sum -eq $num ]; then
    echo "$num is a Armstrong Number"
else
    echo "$num is not a Armstrong Number"
fi
