# program to input two numbers and calculate
# and then print their sum and product
# for product, we use \* instead of *

echo "enter two nos. "
read a b
c=`expr $a + $b`
echo "sum: $c"
d=`expr $a \* $b`
echo "product: $d"
