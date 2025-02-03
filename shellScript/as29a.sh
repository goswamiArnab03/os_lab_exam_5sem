#!/bin/bash

#Write a shell script to take two directories as a input and check which directory has
#the highest number of files.

echo "Enter first directory"
read dir1
dir1=$(echo "$dir1" | xargs)
if [ ! -d "$dir1" ];then
	echo "Not a directory $dir1"
	exit 1
fi
echo "Enter second directory"
read dir2
dir2=$(echo "$dir2" | xargs)
if [ ! -d "$dir2" ];then
	echo "Not a directory $dir2"
	exit 1
fi

files1=$(find "$dir1" -maxdepth 1 -type f | wc -l)
files2=$(find "$dir2" -maxdepth 1 -type f | wc -l)

echo "No of files in $dir1 is: $files1"
echo "No of files in $dir2 is: $files2"

if [ $files1 -gt $files2 ];then
	echo "$dir1 has more files"
elif [ $files2 -gt $files1 ];then
	echo "$dir2 has more files"
else
	echo "Both directories have same no of files"
fi
