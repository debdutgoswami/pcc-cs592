clear
read -p "radius: " r
echo $r
for ((i = 2; i < 360; i += 2)); do
    cos=$(echo "scale=3;3.14/180 * $i" | bc | awk '{print cos($1)}')
    sin=$(echo "scale=3;3.14/180 * $i" | bc | awk '{print sin($1)}')
    x=$(echo "scale=3;$r*$cos" | bc | awk '{print int($1)}')
    y=$(echo "scale=3;$r*$sin" | bc | awk '{print int($1)}')
    x=$(expr $x + 7)
    y=$(expr $y + 7)
    tput cup $x $y
    echo "*"
done
