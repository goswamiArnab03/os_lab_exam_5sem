#!/bin/bash
#Write a Shell Script to collect n numbers from command line argument and check
#which are the Armstrong numbers.

is_armstrong(){
	n=$1
	count=0
	temp=$n
	while [ $temp -gt "0" ];do
		temp=$((temp/10))
		count=$((count+1))
	done
	newnum=$n
	res=0
	while [ $newnum -gt "0" ];do
		digit=$((newnum%10))
		newdig=$(echo "$digit^$count" | bc)
		res=$((res+newdig))
		newnum=$((newnum / 10))
	done
	if [ $res -eq $n ];then
		echo "1"
	else
		echo "0"
	fi
}
echo "Armstrong nos"

for num in "$@";do
	res=$(is_armstrong $num)
	if [ $res -eq "1" ];then
		echo "$num"
	fi
done
	
