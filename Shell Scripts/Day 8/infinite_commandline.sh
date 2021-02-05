# counts number of command line arguments
count=$#

echo "Number of command line arguments: $count"
j=1
for i in $*; do
    a[j]=$i
    j=$(expr $j + 1)
done
echo ${a[@]}
