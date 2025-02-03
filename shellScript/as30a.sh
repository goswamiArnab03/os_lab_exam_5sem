#!/bin/bash

#Write a shell script to take student records (Roll, Name, Marks) as a input file and
#insert n number of new records to the file as sorted by their marks.

input="students.txt"

if [ ! -f "$input" ];then
	echo "File not found"
	exit 1
fi

echo "Enter the no of n:"
read n
i=0
temp_file=$(mktemp)

while [ $i -le $n ];do
	echo "Enter roll"
	read roll
	echo "Enter name"
	read name
	echo "Enter marks"
	read marks
	echo "$roll|$name|$marks" >> "$temp_file"
	i=$((i+1))
done

cat "$input" >> "$temp_file"
sort -t '|' -k3 -n "$temp_file" > "$input"

rm $temp_file

cat "$input"
