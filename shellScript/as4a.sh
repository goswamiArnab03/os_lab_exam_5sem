#!/bin/bash

#Write a shell script to calculate the first n numbers of the Fibonacci series .i.e. 0 1 1 2
#3 5 8... and store the result in an output file.

echo "Enter a no"
read n
output="fibo_output.txt"
> "$output"
a=0
b=1

if [ $n -ge "1" ];then
	echo $a >> "$output"
fi

if [ $n -ge "2" ];then
	echo $b >> "$output"
fi
i=3
while [ $i -le $n ];do
	fib=$((a+b))
	echo $fib >> "$output"
	a=$b
	b=$fib
	i=$((i+1))
done
