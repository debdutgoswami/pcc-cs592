# create a file
# add the below content to it
# Asd 1 85
# Xyz 2 90
# Rst 3 75
# Pqr 4 35
# Efg 5 70
# one extra blank line is needed at the end

# bash grade.sh input

clear
rm g1
printf "Name \t Roll \t Marks \t Grade\n" >>g1

file1=$1
# -f $file1 checks if the file is read able or not
if [ -f $file1 ]; then
    # exec executes the file
    exec <$file1
    # read reads the file line by line
    # line is just a variable name
    while read line; do
        # here the set command sets the columns as $1 $2 $3
        set $(echo $line)
        grade=F
        if [ $3 -ge 90 ]; then
            grade=O
        elif [ $3 -ge 80 ]; then
            grade=E
        elif [ $3 -ge 70 ]; then
            grade=A
        elif [ $3 -ge 60 ]; then
            grade=B
        elif [ $3 -ge 50 ]; then
            grade=C
        fi
        printf "$1 \t $2 \t\t $3 \t $grade\n" >>g1
    done
fi
cat $file1
cat g1
