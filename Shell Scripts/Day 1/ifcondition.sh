# example to if else

# > -gt
# < -lt
# >= -ge
# <= -le
# == -eq
# not(!)= -ne
# && -a
# || -o

echo "enter two nos. "
read a b c
x=$(expr $a + $b)
if [ $x -gt $c]; then
    echo $x
else
    echo $c
fi
