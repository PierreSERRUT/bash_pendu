#!/usr/bin/env bash


init()
{
	if [ $# -ne 0 ] 
	then
		word=$(echo $1 | tr [:upper:] [:lower:])
	else
		line_number=$(shuf -i 0-$(cat $(dirname "$0")/mots.txt | wc -l) -n 1)
		word=$(sed -n "$line_number"p $(dirname "$0")/mots.txt | tr [:upper:] [:lower:])
	fi
word_lenght=${#word}
display_word_guess=""
for ((i=1;i<=word_lenght;++i)); do display_word_guess+="_ "; done
nb_error=0
tested_letters=""
display_word_guess+=" ."
}

