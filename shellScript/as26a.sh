#!/bin/bash

#Write a shell script to take student records (Roll | Name | Marks) as an input file and
#delete one record from that file according to the user choice.

input="students.txt"

if [ ! -f "$input" ];then
	echo "File not found"
	exit 1
fi
cat "$input"
echo "Enter the roll to delete"
read new_roll
temp_file=$(mktemp)
while IDS= read -r line;do
	roll=$(echo "$line" | cut -d '|' -f1)
	name=$(echo "$line" | cut -d '|' -f2)
	marks=$(echo "$line" | cut -d '|' -f3)
	
	if [ "$new_roll" -ne "$roll" ];then
		echo "$roll|$name|$marks" >> "$temp_file"
	fi
done < "$input"
mv "$temp_file" "$input"
echo "After update"
cat "$input"
