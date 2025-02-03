#!bin/bash

#Write a shell script to determine the Grade as per WBUT rule. Students name, roll no
#and marks are taken from an input file and output will store as student name , roll no,
#marks and grade format in a file.( using case)

input="students.txt"

if [ ! -f "$input" ];then
	echo "File $input not exists"
	exit 1
fi

output="students_grade.txt"
> "$output"
while IDS= read -r line;do
	roll=$(echo "$line" | cut -d "|" -f1)
	name=$(echo "$line" | cut -d "|" -f2)
	marks=$(echo "$line" | cut -d "|" -f3)
	points=$((marks/10))
	case $points in
		10)
			grade="O"
			echo "$roll|$name|$marks|$grade" >> "$output"
		;;
		9)
			grade="O"
			echo "$roll|$name|$marks|$grade" >> "$output"
		;;
		8)
			grade="E"
			echo "$roll|$name|$marks|$grade" >> "$output"
		;;
		7)
			grade="A"
			echo "$roll|$name|$marks|$grade" >> "$output"
		;;
		6)
			grade="B"
			echo "$roll|$name|$marks|$grade" >> "$output"
		;;
		5)
			grade="C"
			echo "$roll|$name|$marks|$grade" >> "$output"
		;;
		4)
			grade="D"
			echo "$roll|$name|$marks|$grade" >> "$output"
		;;
		*)
			grade="F"
			echo "$roll|$name|$marks|$grade" >> "$output"
		;;
	esac
done < "$input"
cat "$output"
