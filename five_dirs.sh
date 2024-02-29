#!/bin/bash
#This is a shell script that will create dirs and files

# Create the main directory 'five'
mkdir five

# Loop to create subdirectories and files
for i in {1..5}; do
    # Create subdirectory
    mkdir "five/dir$i"
    
    # Create files within each subdirectory
    for j in {1..4}; do
        # Create a file with j lines, each line containing the digit j
        for k in $(seq 1 $j); do
            echo $j >> "five/dir$i/file$j"
        done
    done
done
