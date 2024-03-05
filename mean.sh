#!/bin/bash


if [[ $# -lt 1 ]] || [[ $# -gt 2 ]]; then # Recall: "-ne" checks integer inequality.
	echo "usage: $0 <column> [file.csv]" 1>&2 # write error message to stderr (below)
	exit 0
fi

col_idx=$1
if [[ $# -eq 2 ]]; then
    # If a file is specified, use it as input
    input_source="$2"
else
    # Otherwise, read from stdin
    input_source="/dev/stdin"
fi

#file=$2

#echo $col_idx
#echo $file

sum=0
count=0

# Redirect the output into the while loop
#while IFS= read -r line; do
#    sum=$(($sum + $line))
#    ((count++))
#    echo $sum
#    echo $count
#done < <(cut -d "," -f $col_idx $file | tail -n +2)

# Function to process lines and calculate sum and count
process_lines() {
    while IFS= read -r line; do
        if [[ -n $line ]]; then
            sum=$(echo "$sum + $line" | bc)
            ((count++))
       	fi

	done
}


process_lines < <(cut -d "," -f $col_idx $input_source | tail -n +2)



# Use bc for floating point division and format the output
average=$(echo "scale=2; $sum / $count" | bc)
echo "$average"
