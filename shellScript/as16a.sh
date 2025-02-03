#!bin/bash

#Write a shell script to check if a given date is valid or not.

echo "Enter a date in(YYYY/MM/DD)"
read input

year=$(echo "$input" | cut -d "/" -f1)
month=$(echo "$input" | cut -d "/" -f2)
day=$(echo "$input" | cut -d "/" -f3)

if date -d "$year-$month-$day" >/dev/null 2>&1;then
	echo "A valid date"
else
	echo "A invalid date"
fi
