#!/bin/bash

# Assignment: Write a shell script to take student records (Roll, Name, Marks) as a input file and perform the following operations:
# 1.Insert
# 2.Delete
# 3.Update
# 4.Display
# 5.Exit
## input.txt
# Roll|Name|Marks
# 1|abc|50
# 2|mno|65
# 3|ddd|98
# 4|xyz|75
# 5|rst|80

# ASSUMPTION: ONLY ONE ROLL NUMBER EXISTS

insert() {
    file1=$1
    read -p "roll=" roll
    read -p "name=" name
    read -p "marks=" marks
    printf "$roll|$name|$marks\n" >>$file1
    echo "INSERTED!!"
}

delete() {
    file1=$1
    read -p "roll no to delete = " roll
    n=$(wc -l <$file1)
    # -f $file1 checks if the file is read able or not
    if [ -f $file1 ]; then
        # finds the line number using grep and regex and splits the output using cut
        line_no=$(grep -n -o "^$roll|*" $file1 | cut -d: -f1)
        # exits the program if no roll number is found
        [ -z $line_no ] && echo "ROLL NUMBER NOT FOUND" && exit 0
        # storing the new marksheet in a temp file
        head -n $(($line_no - 1)) $file1 >>temp.txt
        tail -n $(($n - $line_no)) $file1 >>temp.txt
        # copying it to main file
        cat temp.txt >$file1
        # deleting temp
        rm temp.txt
    fi
}

update() {
    file1=$1
    cat $file1
    read -p "roll no to update = " roll
    n=$(wc -l <$file1)
    # -f $file1 checks if the file is read able or not
    if [ -f $file1 ]; then
        # finds the line number using grep and regex and splits the output using cut
        line_no=$(grep -n -o "^$roll|*" $file1 | cut -d: -f1)
        # exits the program if no roll number is found
        [ -z $line_no ] && echo "ROLL NUMBER NOT FOUND" && exit 0
        # storing the new marksheet in a temp file
        head -n $(($line_no - 1)) $file1 >>temp.txt
        read -p "new/old roll number: " n_roll
        read -p "new/old name: " n_name
        read -p "new/old marks: " n_marks
        printf "$n_roll|$n_name|$n_marks\n" >>temp.txt
        tail -n $(($n - $line_no)) $file1 >>temp.txt
        # copying it to main file
        cat temp.txt >$file1
        # deleting temp
        rm temp.txt
    fi
}

display() {
    file1=$1
    cat $file1
}

clear
echo "1. Insert"
echo "2. Delete"
echo "3. Update"
echo "4. Display"
echo "5. Exit"

read -p "file: " file1
for (( ; ; )); do
    read -p "enter: " n
    case $n in
    1) insert $file1 ;;
    2) delete $file1 ;;
    3) update $file1 ;;
    4) display $file1 ;;
    5) exit 0 ;;
    *) echo "wrong choice" ;;
    esac
done
