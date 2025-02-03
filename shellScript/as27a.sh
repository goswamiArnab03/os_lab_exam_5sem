#!/bin/bash

#Write a shell script to find out palindrome numbers from a list of numbers provided
#through an input file.

input="numbers.txt"

if [ ! -f "$input" ];then
	echo "File not found"
	exit 1
fi

is_palindrom(){
	n=$1
	reverse=$(echo "$n" | rev)
	if [ $n -eq "$reverse" ];then
		echo "1"
	else
		echo "0"
	fi
}

echo "Palindroms are"

while IFS= read -r number;do
	res=$(is_palindrom $number)
	if [ $res -eq "1" ];then 
		echo "$number"
	fi
done < "$input"
