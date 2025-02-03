#!/bin/bash

#Write a shell script to calculate the value of the series: 1+ (x/2)^2 –(x/2)^3 + (x/2)^4–(x/2)^5+..

echo "Enter x: "
read x
echo "Enter n: "
read n

term=$(echo "scale=4;$x/2" | bc -l)
i=2
ans=1
sign=-1
while [ $i -le $n ];do
	base=$(echo "scale=4;$term^$i" | bc -l)
	sign=$(echo "$sign*-1")
	res=$(echo "scale=4;$base*$sign" | bc -l)
	ans=$(echo "scale=4;$ans+$res" | bc -l)
	i=$((i+1))
done
echo "The ans: $ans"
