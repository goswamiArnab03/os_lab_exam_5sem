#!bin/bash

#In an input file, there are some records of students (Roll | Name | Marks). Find the
#student name and roll number of the student who gets the highest marks.

input="students.txt"

if [ ! -f "$input" ];then
	echo "No file found"
	exit 1
fi

highest_marks=$(sort -t '|' -k3,3 -n "$input" | tail -n 1)

roll=$(echo "$highest_marks" | cut -d '|' -f1 | xargs)
name=$(echo "$highest_marks" | cut -d '|' -f2 | xargs)
marks=$(echo "$highest_marks" | cut -d '|' -f3 | xargs)

echo "The highest marks record"
echo "Name: $name"
echo "Roll: $roll"
echo "Marks: $marks"

