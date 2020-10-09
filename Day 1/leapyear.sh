# program to check whether a year is a leap year or not

echo "enter the year: "
read year
if [ $(expr $year % 400) -eq 0 -o \( $(expr $year % 4) -eq 0 -a $(expr $year % 100) -ne 0 \) ]; then
    echo "leap year"
else
    echo "not leap year"
fi
