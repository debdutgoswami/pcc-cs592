# for loop does not work in sh
# to run bash scripts type ""bash <program_name>.sh""

echo enter number of rows
read n
for ((i = 1; i <= n; i++)); do
    for ((j = 0; j < (n - i); j++)); do
        echo -ne " "
    done
    for ((j = 0; j < i; j++)); do
        echo -ne "*"
    done
    echo ""
done
