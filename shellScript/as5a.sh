input="input_palindrom_word.txt"

if [ ! -f "$input" ];then
	echo "File $input not found"
	exit 1
fi

is_palindrom(){
	word=$1
	rev=$(echo "$word" | rev)
	if [ $word = $rev ];then
		echo "1"
	else
		echo "0"
	fi
}
echo "Palindrom words"
while IFS= read -r line;do
	for word in $(echo "$line" | tr -d ".,;" | tr ' ' '\n');do
		res=$(is_palindrom $word)
		if [ $res -eq "1" ];then
			echo "$word"
		fi
	done
done < "$input"
