#!bin/bash

#Write a shell script to determine the Grade as per WBUT rule. Students name, roll no
#and marks are taken from an input file and output will store as student name , roll no,
#marks and grade format in a file.( if else)

input="students.txt"

if [ ! -f "$input" ];then
	echo "File not found"
	exit 1
fi
output="students_grade2.txt"
> "$output"
while IDS= read -r line;do
	roll=$(echo "$line" | cut -d '|' -f1)
	name=$(echo "$line" | cut -d '|' -f2)
	marks=$(echo "$line" | cut -d '|' -f3)
	
	if [ $marks -ge "90" ];then
		echo "$roll|$name|$marks|O" >> "$output"
	elif [ $marks -ge "80" ];then
		echo "$roll|$name|$marks|E" >> "$output"
	elif [ $marks -ge "70" ];then
		echo "$roll|$name|$marks|A" >> "$output"
	elif [ $marks -ge "60" ];then
		echo "$roll|$name|$marks|B" >> "$output"
	elif [ $marks -ge "50" ];then
		echo "$roll|$name|$marks|C" >> "$output"
	elif [ $marks -ge "40" ];then
		echo "$roll|$name|$marks|D" >> "$output"
	else
		echo "$roll|$name|$marks|F" >> "$output"
	fi
done < "$input"
cat "$output"
