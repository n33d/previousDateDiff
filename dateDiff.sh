if [[ -f $1 ]]; then
    echo "$1 argument valid"
else
    echo "$1 is not a file"
    exit 1
fi

while read p; do
	echo "$previous - $p"
	echo "-"
	if [ -z $previous ]; then
		previous=$p
	else
		echo difference between previous date: $(( $(date -d "$p" +%s) - $(date -d "$previous" +%s) ))
		previous=$p 
	fi
done < $1
