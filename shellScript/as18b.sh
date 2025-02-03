#!bin/bash

#Write a shell script to check whether a number is EVEN or ODD using switch-case
#statement.

echo "Enter a no"
read x
y=$((x%2))

case $y in
	0)echo "Even"
	;;
	1)echo "Odd"
	;;
	*)echo "Invalid"
	;;
esac
