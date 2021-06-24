#!/bin/bash -x

# constants
HEAD=1
TAIL=0

# variable
flag=$((RANDOM%2))

if [ $flag -eq $HEAD ]
then 
	echo "Coin flips to Head"
else
	echo "Coin flips to Tail"
fi
