#!/bin/bash

#Write a shell script which check the file permission of that file and change it for
#different users.


file="input_palindrom_word.txt"

echo "The current permissions"
ls -l "$file"

echo "Enter your choice for user(1/2/3)"
echo "1)Owner"
echo "2)Group"
echo "3)Others"

read user_choice

echo "Select permission to toggle(1/2/3)"
echo "1)read"
echo "2)write"
echo "3)Execute"

read perm_choice

case $user_choice in
	1)user="u"
	;;
	2)user="g"
	;;
	3)user="o"
	;;
esac

case $perm_choice in
	1)perm="r"
	;;
	2)perm="w"
	;;
	3)perm="x"
	;;
esac

perm_check=$(ls -l "$file" | awk '{print $1}')
case $user in
    u) perm_index=2 ;; 
    g) perm_index=5 ;; 
    o) perm_index=8 ;; 
esac

current_perm=$(echo "$perm_check" | cut -c$perm_index)

if [[ "$current_perm" == *"$perm"* ]]; then
	echo "The $user has the permission $perm ; disabiling it"
	chmod "$user-$perm" "$file"
	echo "$perm removed"
else
	echo "The $user has no permission $perm ; enabiling it"
	chmod "$user+$perm" "$file"
	echo "$perm enabled"
fi
echo "updated permission"
ls -l "$file"
