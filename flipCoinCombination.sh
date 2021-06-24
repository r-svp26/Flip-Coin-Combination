#!/bin/bash -x

# constants
HEAD=1
TAIL=0
LIMIT=150

# variable
headCount=0
tailCount=0
totalCount=0

declare -A result

while [ $totalCount -lt $LIMIT ]
do
	flag=$((RANDOM%2))
	if [ $flag -eq $HEAD ]
	then
		let headCount++

	else
		let tailCount++

	fi
	let totalCount++
done

headPercentage=`echo $headCount $LIMIT | awk '{h=$1/$2*100} {print h}'`
tailPercentage=`echo $tailCount $LIMIT | awk '{t=$1/$2*100} {print t}'`

result[h]=$headPercentage
result[t]=$tailPercentage
echo ${result[@]} 

echo "Head percentage $headPercentage%" 
echo "Tail percentage $tailPercentage%"
