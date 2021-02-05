echo "Menu:"
echo "1. Contents of the file "
echo "2. Present working directory and files under current directory"
echo "3. Current Date"
echo "4. Calender of a particular year"
echo "5. Exit"
read -p "enter: " a
case $a in
1)
    read -p "Enter file name: " file
    cat $file
    ;; # break
2) pwd && ls ;;
3) date +%m.%d.%Y ;;
4)
    read -p "Enter year: " year
    cal -y $year
    ;;
5) exit ;;
*) echo "Wrong input" ;;
esac
