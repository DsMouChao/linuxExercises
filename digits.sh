#!/bin/bash

# Initialize sum
sum=0

# Loop through numbers between 1000 and 2000 (inclusive)
for ((num = 1000; num <= 2000; num++)); do
    # Check if the number contains only digits from the set {0, 1}
    if [[ "$num" =~ ^[01]+$ ]]; then
        sum=$((sum + num))
    fi
done

echo "Sum of numbers between 1000 and 2000 with digits only from {0, 1}: $sum"
