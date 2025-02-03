#!bin/bash

#Write a shell script to take student records (Roll|Name|Marks) as an input file and update
#one record from that file according to the user choice.

input="students.txt"

if [ ! -f "$input" ];then
	echo "file not found"
	exit 1
fi

echo "Enter roll no: "
read roll_no

if ! grep -q "^$roll_no|" "$input" ;then
	echo "No record found"
	exit 1
fi

echo "Enter a new name"
read new_name
echo "Enter new marks"
read new_marks
temp_file=$(mktemp)

while IFS= read -r line;do
	roll_field=$(echo "$line" | cut -d'|' -f1)
	if [ "$roll_field" -eq "$roll_no" ];then
		echo "$roll_no|$new_name|$new_marks" >> "$temp_file"
	else
		echo "$line" >> "$temp_file"
	fi
done < "$input"
mv "$temp_file" "$input"
