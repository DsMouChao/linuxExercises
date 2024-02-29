#!/bin/bash


if [[ $# -ne 2 ]]; then # Recall: "-ne" checks integer inequality.
	echo "usage: $0 <column> [file.csv]" 1>&2 # write error message to stderr (below)
	exit 0
fi

col_idx=$1
file=$2

#echo $col_idx
#echo $file

sum=0
count=0

# Redirect the output into the while loop
while IFS= read -r line; do
    sum=$(($sum + $line))
    ((count++))
#    echo $sum
#    echo $count
done < <(cut -d "," -f $col_idx $file | tail -n +2)

echo $(($sum/$count))
