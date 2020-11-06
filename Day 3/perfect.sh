# for loop does not work in sh
# to run bash scripts type ""bash <program_name>.sh""

echo "enter number: "
read num
sum=0
for ((i = 1; i < n; i++)); do
    if [ $(expr $num % i) -eq 0 ]; then
        sum=$(expr $num + $i)
    fi
done
if [ $sum -eq $num ]; then
    echo "$num is a perfect number"
else
    echo "$num is not a perfect number"
fi
