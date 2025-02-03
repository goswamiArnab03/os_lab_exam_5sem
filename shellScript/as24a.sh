#!/bin/bash

#Write a shell script, which shows all prime numbers within a given range. (take the
#lower & upper range through command line argument)

is_prime(){
	n=$1
	if [ $n -le "1" ];then 
		echo 0
		return
	fi
	i=2
	n2=$((n/2))
	
	while [ $i -le $n2 ];do
		res=$((n % i ))
		if [ $res -eq "0" ];then 
			echo 0
			return
		fi
		i=$((i+1))
	done
	echo 1
}

lower=$1
upper=$2
echo "Primes are: "
while [ $lower -le $upper ];do
	resu=$(is_prime $lower)
	if [ $resu -eq 1 ];then
		echo "$lower"
	fi
	lower=$((lower+1))
done

