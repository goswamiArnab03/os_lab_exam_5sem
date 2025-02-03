#!bin/bash

#A file contains day_name & temperature for some days. Write a shell script which
#takes that file name as command line argument. Then it reads day_name & temperature
#from that file and broadcast the weather as follows. Store the weather report in a file.

input="weather.txt"

if [ ! -f "$input" ];then
	echo "File not found"
	exit 1
fi
output="weather_report.txt"
> "$output"
while IFS= read -r line;do
	day_name=$(echo "$line" | cut -d '|' -f1)
	temparature=$(echo "$line" | cut -d '|' -f2)
	if [ $temparature -lt "15" ];then
		echo "$day_name|$temparature|very_cold" >> "$output"
	elif [ $temparature -ge "15" ] && [ $temparature -lt "25" ];then
		echo "$day_name|$temparature|cold" >> "$output"
	elif [ $temparature -ge "25" ] && [ $temparature -lt "35" ];then
		echo "$day_name|$temparature|hot" >> "$output"
	else
		echo "$day_name|$temparature|very_hot" >> "$output"
	fi
done < "$input"
cat "$output"
