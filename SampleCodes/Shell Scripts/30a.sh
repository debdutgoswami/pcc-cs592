#!/bin/bash

mkdir Letter Report Assignment
cd Letter
mkdir Friendly Formal
cd ../Report
mkdir Personal Business School Temp
ls && rm -r Temp && ls
mkdir ../Assignment/Unit
cd ../Letter/Friendly && touch A1.txt && printf "Name: Hello World\nEmail: hello@world.com\nID: 2356xx89\nDate: 03/02/2020\n" >>A1.txt
cp A1.txt B1.txt && ls
mv B1.txt A.txt && ls && rm A1.txt && ls
chmod 760 A.txt # r 4; w 2; x 1
ls -l
cd ../../
tree
