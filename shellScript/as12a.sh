#!/bin/bash


#Write a shell script to collect n number of years from command line argument and
#calculates which years are leap years.

is_leapYear(){
	n=$1
	if [ $((n % 4)) -eq 0 ]; then
        if [ $((n % 100)) -ne 0 ] || [ $((n % 400)) -eq 0 ]; then
            echo "1"
        else
            echo "0"
        fi
    else
        echo "0"
    fi
}

echo "Leap Years: "

for num in "$@";do
	res=$(is_leapYear $num)
	if [ $res -eq "1" ];then
		echo "$num"
	fi
done
