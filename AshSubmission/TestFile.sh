#!/bin/bash
count_lines(){
	echo "The number of lines in the file is" `wc -l < $1`
}

count_words(){
	grep 'Lorem' $1 | grep 'model' | grep 'Ipsum' | grep 'will'
}

add_text(){
	echo "enter a sentence to append to $1"
	read sentence
	echo $sentence >> $1
}

copy(){
	mkdir solution
	cp $1 solution/
}

if ! [ -f "$1" ]
then
	echo "file does not exist"
	exit
fi
INPUT=0
while [ "$INPUT" -ne 5 ];
do
	echo "Choose what you would like to do
	1. Line count
	2. Word count
	3. Add text
	4. Copy to the solution directory
	5. Exit"
	read INPUT
	case $INPUT in
		1)
			count_lines $1
			;;
		2)
			count_words $1
			;;
		3)
			add_text $1
			;;
		4)
			copy $1
			;;
		5)
			exit
			;;
		*)
			echo "invalid option."
			INPUT = -1
			;;
	esac
done