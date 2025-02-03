#!bin/bash

# Write a shell script to find the value of y using

#Y(x, n) = {1+x^2 when n=1
#{1+x/n when n=2
#{1+2x when n=3
#{1+nx when n>3 or n<1

echo "Enter x:"
read x
echo "Enter n:"
read n
y=0
case $n in
	1)
		y=$((1+x*x))
		echo "Y is: $y"
	;;
	2)
		y=$((1+x/n))
		echo "Y is: $y"
	;;
	3)
		y=$((1+2*x))
		echo "Y is: $y"
	;;
	*)
		y=$((1+n*x))
		echo "Y is: $y"
	;;
esac
