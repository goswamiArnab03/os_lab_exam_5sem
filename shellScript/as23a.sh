#!/bin/bash

#Write a shell script to take student records (Roll | Name | Marks) as an input file and
#insert n number of new records to the file according to the user choice.

input="students.txt"
if [ ! -f "$input" ];then
	echo "File not found"
	exit 1
fi

echo "Enter no of n:"
read n

i=0

while [ $i -lt $n ];do
	echo "Enter new roll:"
	read roll
	echo "Enter new name:"
	read name
	echo "Enter new marks:"
	read marks
	echo "$roll|$name|$marks" >> "$input"
	i=$((i+1))
done
cat "$input"
