echo "enter 1 for today's date"
echo "enter 2 display 3 month from now"
echo "enter 3 display monday as first day"
echo "enter 4 display day of the week"
echo "enter 5 for exit"

for (( ; ; )); do
    read -p "enter: " n
    case $n in
    1) date +"%d %b %Y" ;;
    2) cal -A 3 ;;
    3) ncal -M ;;
    4) date +%w ;;
    5) exit 0 ;;
#    6) cal | awk '{ print " "$0; getline; print " Mo Tu We Th Fr Sa Su"; \
#getline; if (substr($0,1,2) == " 1") print "                    1 "; \
#do { prevline=$0; if (getline == 0) exit; print " " \
#substr(prevline,4,17) " " substr($0,1,2) " "; } while (1) }' ;;
    esac
done
