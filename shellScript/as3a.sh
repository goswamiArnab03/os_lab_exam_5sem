#!/bin/bash

#Write a shell script to find out palindrome numbers from a list of numbers (Numbers
#should be taken as command line argument)

is_palindrom(){
	num=$1
	reverse=0
	original=$num
	while [ $num -gt 0 ];do
		digit=$((num % 10 ))
		reverse=$((reverse * 10 + digit ))
		num=$((num / 10 ))
	done
	if [ $original -eq $reverse ];then
		echo "1"
	else
		echo "0"
	fi
}

echo "Palindrom nos"

for number in "$@";do
	res=$(is_palindrom $number)
	if [ $res -eq "1" ];then
		echo "$number"
	fi
done
