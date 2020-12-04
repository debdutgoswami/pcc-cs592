#!/bin/bash
clear
# cols=$(tput cols)
start=20
read -p "height: " rows

for ((i = 0; i < rows - 1; i++)); do
    cols=$((start - i))
    tput cup $i $cols
    printf "*"
    tput cup $i $(expr $i + $start)
    printf "*"
done
echo ""
for ((i = 0; i < rows; i++)); do
    printf "* "
done
echo ""
