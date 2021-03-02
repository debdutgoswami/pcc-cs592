if [ $# -eq 0 ]; then
    echo "No arguments specified"
    exit
fi
for i in $*; do
    if [ -f $i ]; then
        echo "$i is regular a file"
        echo "Lines: $(cat $i | wc -l)"
        echo "Words: $(cat $i | wc -w)"
        echo "Chars: $(cat $i | wc -m)"
    else
        echo "$i is a directory"
    fi
done
