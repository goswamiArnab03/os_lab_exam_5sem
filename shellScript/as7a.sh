#!/bin/bash

#Write a shell script to find the number of characters, words and lines in a set of files
#given by user through the command line argument.

for file in "$@";do
	if [ ! -f "$file" ];then
		echo "File: $file not found"
		echo "------"
		continue
	fi
	lines=$(wc -l<"$file")
	words=$(wc -w<"$file")
	characters=$(wc -m<"$file")
	echo "File: $file"
	echo "Lines: $lines"
	echo "Words: $words"
	echo "characters: $characters"
	echo "------"
done
