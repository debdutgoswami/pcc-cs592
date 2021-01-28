#!/bin/bash

clear
rm g1
printf "Pallindromes:\n\n" >>g1

file1=$1
# -f $file1 checks if the file is read able or not
if [ -f $file1 ]; then
    # fetching the list of all words ignoring special characters
    words=$(cat $file1 | grep -o "[a-zA-Z][a-zA-Z][a-zA-Z]*")
    for word in $words; do
        if [ $word == $(echo $word | rev) ]; then
            printf "$word\n" >>g1
        fi
    done
fi

cat $file1
printf "\n\n"
cat g1
