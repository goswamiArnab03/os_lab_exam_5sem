#!/bin/bash

#Write a shell script which receives any number of filenames as command line
#argument. The shell script should check whether every argument supplies are a file or a
#directory.
#i) If it is a directory then it should be appropriately reported.
#ii) if it is a file name then name of the file as well as the no. of lines, words present in it should
#be reported.
#iii) Check the file permission for the group. If group has no write permission then gives the write
#permission or vice versa.

for item in "$@";do
	if [ -d "$item" ];then
		echo "$item is directory"
	elif [ -f "$item" ];then
		echo "$item is a file"
		
		lines=$(wc -l < "$item")
		words=$(wc -w < "$item")
		character=$(wc -m < "$item")
		
		echo "Lines: $lines"
		echo "Words: $words"
		echo "Character: $character"
		
		if [ -g "$item" ];then
			if [ -w "$item" ];then
				echo "group has write permission;removing it"
				chmod g-w "$item"
				echo "permission removed"
			else
				echo "group has no write permission;adding it"
				chmod g+w "$item"
				echo "permission added"
			fi
		else
			echo "$item is not a group"
		fi
	else
		echo "$item is neither file nor directory"
	fi
done
