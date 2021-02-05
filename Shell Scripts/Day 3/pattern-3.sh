# for loop does not work in sh
# to run bash scripts type ""bash <program_name>.sh""

read -p "enter number of rows: " num
for ((i = 1; i <= num; i++)); do
    for ((j = num; j > i; j--)); do
        printf " "
    done
    for ((j = 1; j <= i; j++)); do
        printf "*"
    done
    for ((j = 1; j < i; j++)); do
        printf "*"
    done
    echo ""
done
