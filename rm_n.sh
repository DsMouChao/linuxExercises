#!/bin/bash

# Check if two arguments were provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <dir> <n> - removes all files in directory <dir> larger than <n> bytes"
    exit 1
fi

# Assign arguments to variables for clarity
directory=$1
size=$2

# Find all files larger than the specified size in bytes and remove them
find "$directory" -type f -size +"${size}"c -exec rm {} \;

