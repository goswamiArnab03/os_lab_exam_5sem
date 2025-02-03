#!/bin/bash

factorial(){
	n=$1
	p=1
	i=1
	while [ $i -le $n ]
	do
		p=$(($p*$i))
		i=$((i+1))
	done
	echo "$p"
}

echo "Enter the value of x"
read x
echo "Enter a n:"
read n
ans=$x
i=1
while [ $i -lt $n ]
do
	q=$((i * 2))
	res=$(echo "$x^$q" | bc)
	fact=$(factorial $q)
	newres=$(( res / fact ))
	ans=$(( ans + newres))
	i=$((i+1))
done
echo "$ans"
	
