# program to find  largest among three numbers

echo "enter three number: "
read a b c
if [ $a -ge $b ]; then
    if $a -ge $c; then
        echo $a
    else
        echo $c
    fi
else
    if [ $b -ge $c ]; then
        echo $b
    else
        echo $c
    fi
fi
