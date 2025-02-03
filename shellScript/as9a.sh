#!bin/bash

#Write a shell script to find the numbers of files are present within a directory and their
#names. Store the output in a file and display it.

echo "Enter a directory path"
read directory

if [ ! -d "$directory" ];then
	echo "Directory not found"
	exit 1
fi

output="file_names_output.txt"
> "$output"
files=$(find "$directory" -maxdepth 1 -type f)

file_count=$(echo "$files" | wc -l)

echo "No of files: $file_count"  >> "$output"
echo "file lists"  >> "$output"
echo "$files"  >> "$output"

echo "displaying"
cat "$output"
