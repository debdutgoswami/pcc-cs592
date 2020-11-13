#!/bin/bash
# 1 + x^2/2! + x^4/4! + ... + x^(2n)/(2*n)!
factorial() {
    n=$1
    fact=1
    for ((i = 2; i <= $n; i++)); do
        fact=$(expr $fact \* $i)
    done
    # we need to do echo instead of return
    # return returns the status and not the value
    # https://unix.stackexchange.com/questions/619437/syntax-error-operand-expected-error-token-is
    echo $fact
}

read -p "x = " x
read -p "n = " n

sum=0
for ((i = 1; i <= n; i++)); do
    val=$((2 ** ($i - 1)))
    ex=$(($x ** $val))
    f=$(factorial $val)
    a=$(($ex / $f))
    sum=$(($sum + $a))
done
echo $sum
