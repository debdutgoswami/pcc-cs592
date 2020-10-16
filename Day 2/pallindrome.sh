echo "enter a number: "
read num
sum=0
copy=$num
while [ $copy -ne 0 ]; do
  a=$(expr $copy % 10)
  sum=$(expr $sum \* 10 + $a)
  copy=$(expr $copy / 10)
done
if [ $sum -eq $num ]; then
  echo "Pallindrome"
else
  echo "Not Pallindrome"
fi
