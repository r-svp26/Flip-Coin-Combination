#!/bin/bash -x

# constants
LIMIT=100

# variable
hhh=0
hht=0
hth=0
thh=0
ttt=0
tht=0
thh=0
flag=0

declare -A result

while [ $flag -lt $LIMIT ]
do
	flip1=$((RANDOM%2))
	flip2=$((RANDOM%2))
	flip3=$((RANDOM%2))
	if [ $flip1 -eq 1 ] && [ $flip2 -eq 1 ] && [ $flip3 -eq 1 ]
	then
		let hhh++

	elif [ $flip1 -eq 1 ] && [ $flip2 -eq 1 ] && [ $flip3 -eq 0 ]
	then 
		let hht++

	elif [ $flip1 -eq 1 ] && [ $flip2 -eq 0 ] && [ $flip3 -eq 1 ]
	then
		let hth++
	
	elif [ $flip1 -eq 1 ] && [ $flip2 -eq 0 ] && [ $flip3 -eq 0 ]
        then
                let htt++

	elif [ $flip1 -eq 0 ] && [ $flip2 -eq 0 ] && [ $flip3 -eq 0 ]
        then
                let ttt++

        elif [ $flip1 -eq 0 ] && [ $flip2 -eq 0 ] && [ $flip3 -eq 1 ]
        then
                let tth++

	elif [ $flip1 -eq 0 ] && [ $flip2 -eq 1 ] && [ $flip3 -eq 0 ]
        then
                let tht++

	else
		let thh++

	fi
	let flag++
done

hhhPercentage=`echo $hhh $LIMIT | awk '{hhh=$1/$2*100} {print hhh}'`
hhtPercentage=`echo $hht $LIMIT | awk '{hht=$1/$2*100} {print hht}'`
hthPercentage=`echo $hth $LIMIT | awk '{hth=$1/$2*100} {print hth}'`
httPercentage=`echo $htt $LIMIT | awk '{htt=$1/$2*100} {print htt}'`
tttPercentage=`echo $ttt $LIMIT | awk '{ttt=$1/$2*100} {print ttt}'`
tthPercentage=`echo $tth $LIMIT | awk '{tth=$1/$2*100} {print tth}'`
thtPercentage=`echo $tht $LIMIT | awk '{tht=$1/$2*100} {print tht}'`
thhPercentage=`echo $thh $LIMIT | awk '{thh=$1/$2*100} {print thh}'`




result[hhh]=$hhhPercentage
result[hht]=$hhtPercentage
result[hth]=$hthPercentage
result[htt]=$httPercentage
result[ttt]=$tttPercentage
result[tth]=$tthPercentage
result[tht]=$thtPercentage
result[thh]=$thhPercentage


echo ${result[@]} 

echo "Combination of HHH is $hhhPercentage%"
echo "Combination of HHT is $hhtPercentage%"
echo "Combination of HTH is $hthPercentage%"
echo "Combination of HTT is $httPercentage%"
echo "Combination of TTT is $tttPercentage%"
echo "Combination of TTH is $tthPercentage%"
echo "Combination of THT is $thtPercentage%"
echo "Combination of THH is $thhPercentage%"
