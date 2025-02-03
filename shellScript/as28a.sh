#!/bin/bash

#Write a shell script to check how many files in your current directory and display the
#name of the largest file.

no_of_files=$(find . -maxdepth 1 -type f | wc -l)

echo "No of files $no_of_files"

largest_file=$(find . -maxdepth 1 -type f -exec du -b {} + | sort -n -r | head -n 1)


name=$(echo "$largest_file" | awk '{print $2}')
size=$(echo "$largest_file" | awk '{print $1}')

echo "Largest file: $name"
echo "Its size: $size bytes"
