# for loop does not work in sh
# to run bash scripts type ""bash <program_name>.sh""

read -p "enter number of rows: " num
for ((i = 1; i <= num; i++)); do
    for ((j = 1; j <= i; j++)); do
        printf "*"
    done
    printf "\n"
done
