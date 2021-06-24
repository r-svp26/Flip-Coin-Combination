#!/bin/bash -x

# constants
LIMIT=100

# variable
hh=0
ht=0
th=0
tt=0
flag=0

declare -A result

while [ $flag -lt $LIMIT ]
do
	flip1=$((RANDOM%2))
	flip2=$((RANDOM%2))
	if [ $flip1 -eq 1 ] && [ $flip2 -eq 1 ]
	then
		let hh++

	elif [ $flip1 -eq 1 ] && [ $flip2 -eq 0 ]
	then 
		let ht++

	elif [ $flip1 -eq 0 ] && [ $flip2 -eq 1 ]
	then
		let th++

	else
		let tt++

	fi
	let flag++
done

hhPercentage=`echo $hh $LIMIT | awk '{hh=$1/$2*100} {print hh}'`
htPercentage=`echo $ht $LIMIT | awk '{ht=$1/$2*100} {print ht}'`
thPercentage=`echo $th $LIMIT | awk '{th=$1/$2*100} {print th}'`
ttPercentage=`echo $tt $LIMIT | awk '{tt=$1/$2*100} {print tt}'`

result[hh]=$hhPercentage
result[ht]=$htPercentage
result[th]=$thPercentage
result[tt]=$ttPercentage

echo ${result[@]} 

echo "Combination of HH is $hhPercentage%"
echo "Combination of HT is $htPercentage%"
echo "Combination of TH is $thPercentage%"
echo "Combination of TT is $ttPercentage%"
