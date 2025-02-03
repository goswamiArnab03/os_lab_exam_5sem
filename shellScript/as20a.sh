#!/bin/bash

#Write a shell script where you enter birthday in dd/mm/yyyy format. Your age is
#calculated in years, months & days.

echo "Enter date of birth(DD/MM/YYYY)"
read dob

dd=$(echo "$dob" | cut -d '/' -f1)
mm=$(echo "$dob" | cut -d '/' -f2)
yy=$(echo "$dob" | cut -d '/' -f3)

echo "Today is : $dd / $mm / $yy "

d=$(date +"%d")
m=$(date +"%m")
y=$(date +"%Y")


echo "Today is $d / $m / $y"

ad=$((d-dd))
am=$((m-mm))
ay=$((y-yy))

if [ $dd -gt $d ];then
	am=$((am-1))
	ad=$((ad+30))
fi
if [ $mm -gt $m ];then
	ay=$((ay-1))
	am=$((am+12))
fi
echo "Your age: $ay years $am months $ad day"
