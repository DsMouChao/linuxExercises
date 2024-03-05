#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <dir> <n> - removes all files in directory <dir> larger than <n> bytes"
    exit 1
fi

directory=$1
size=$2

find "$directory" -type f -size +"${size}"c -exec rm {} \;

