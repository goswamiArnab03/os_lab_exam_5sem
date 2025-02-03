#!bin/bash

#Write a shell script to select greatest and lowest numbers from a set of numbers
#which are present in a file.

greatest=0
lowest=1000

for i in "$@";do
	if [ $i -gt $greatest ];then
		greatest=$i
	fi
	if [ $i -lt $lowest ];then
		lowest=$i
	fi
done

echo "Greatest: $greatest"
echo "Lowest: $lowest"
