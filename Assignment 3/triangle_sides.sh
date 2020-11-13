read -p "three sides of triangle: " a b c
# formation checks
if [ $(expr $a + $b) -lt $c ] || [ $(expr $b + $c) -lt $a ] || [ $(expr $a + $c) -lt $b ]; then
    echo "Formation not possible"
    exit
fi
# scale defines number of dgits after decimal point
# default scale is 0
s=$(echo "scale=2;($a+$b+$c)/2" | bc)
temp=$(echo "scale=2;$s*($s-$a)*($s-$b)*($s-$c)" | bc)
# negative squareroot check
check=$(echo "temp<0" | bc)
if [ $check -eq 1 ]; then
    echo "sqrt not possible on negative number"
    exit
fi
sqr=$(echo "scale=2;sqrt($temp)" | bc)
echo "Area of triangle is "
echo $sqr
