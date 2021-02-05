#!/bin/bash
# THIS IS A COMPLICATED METHOD
# Read a txt file as an input and select the pallindrome words from the text
# and store the palindrome words into another file (omit '.' Or ',' after the word)

is_palindrome() {
    word=$1
    len=$((${#word} - 1))
    for ((i = 0; i <= (len / 2); i++)); do
        [[ ${word:i:1} == ${word:len-i:1} ]] || return 1
    done
    return 0
}

clear
rm g1
printf "Pallindromes:\n\n" >>g1

file1=$1
# -f $file1 checks if the file is read able or not
if [ -f $file1 ]; then
    # read reads the file line by line
    # line is just a variable name
    tr -cd "[:print:]\n" <$file1 >temp
    tr -s "[:punct:]" " " <temp >temp1
    rm temp
    f=$(<temp1)
    words=${f,,}
    for word in $words; do
        len=${#word}
        if [ $len -ne 1 ]; then
            if is_palindrome $word; then
                palins+=($word)
            fi
        fi
    done
fi
rm temp1

for palin in "${palins[@]}"; do
    printf "$palin\n" >>g1
done

cat $file1
printf "\n\n"
cat g1
