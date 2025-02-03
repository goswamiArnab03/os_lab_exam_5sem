#!/bin/bash

#GCD & LCM of two nos using function

gcd(){
	a=$1
	b=$2
	while [ $b -ne "0" ];do
		temp=$b
		b=$(( a % b))
		a=$temp
	done
	echo $a
}
lcm(){
	a=$1
	b=$2
	gcd_val=$(gcd $a $b)
	echo $(( (a * b) / gcd_val ))
}

echo "Enter two nos"
read n1
read n2

gcd_val=$(gcd $n1 $n2)
lcm_val=$(lcm $n1 $n2)

echo "GCD: $gcd_val"
echo "LCM: $lcm_val"
