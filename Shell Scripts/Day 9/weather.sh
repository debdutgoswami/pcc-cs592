#!/bin/bash
# A file contains day_name & temperature for some days.
# Write a shell script which takes that file name as command line argument.
# Then it reads day_name & temperature from that file and broadcast the weather as follows.
# Store the weather report in a file.
#               Temperature   	Weather
# 		              <15		Very cold
# 	          >=15 && <25		 Cold
# 	          >=25 && <35		  Hot
# 	                >=35		Very hot

clear
rm g1
printf "DAY \t\t TEMP \t WEATHER\n" >>g1

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
        weather="very cold"
        if [ $2 -ge 35 ]; then
            weather="very hot"
        elif [ $2 -ge 25 ]; then
            weather="hot"
        elif [ $2 -ge 15 ]; then
            weather="cold"
        fi
        printf "$1 \t\t $2 \t $weather\n" >>g1
    done
fi
cat $file1
cat g1
