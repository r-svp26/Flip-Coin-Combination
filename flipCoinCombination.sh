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

VALUES=()
count=0
for DATA in "${result[@]}";
do
        VALUES+=("${DATA##*:}")
	let count++
done

for(( i=0;i<count; i++ ))
do
	arr[i]=${VALUES[i]}
done

# array size
size=${#arr[@]}

function sortArray() {
	for (( i=0; i<size; i++ )) {
		for (( j=i+1; j<size; j++ )) {
			if [ ${arr[i]} -gt ${arr[j]} ]
			then
				temp=${arr[i]}
				arr[i]=${arr[j]}
				arr[j]=$temp
			fi
		}
	}
	echo ${arr[@]}
}

# invoking the function to sort the array in ascending order
sortArray ${arr[@]}

echo "Winning combination of Triplet is "${arr[7]}

# Doublet Combination

# variables
hh=0
ht=0
th=0
tt=0
db=0

declare -A doublet

while [ $db -lt $LIMIT ]
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
	let db++
done

hhPercentage=`echo $hh $LIMIT | awk '{hh=$1/$2*100} {print hh}'`
htPercentage=`echo $ht $LIMIT | awk '{ht=$1/$2*100} {print ht}'`
thPercentage=`echo $th $LIMIT | awk '{th=$1/$2*100} {print th}'`
ttPercentage=`echo $tt $LIMIT | awk '{tt=$1/$2*100} {print tt}'`

doublet[hh]=$hhPercentage
doublet[ht]=$htPercentage
doublet[th]=$thPercentage
doublet[tt]=$ttPercentage

echo ${doublet[@]} 

VALUES=()
count=0
for DATA in "${doublet[@]}";
do
        VALUES+=("${DATA##*:}")
	let count++
done

for(( i=0;i<count; i++ ))
do
	d[i]=${VALUES[i]}
done

# array size
sizes=${#d[@]}

function sortArray() {
	for (( i=0; i<sizes; i++ )) {
		for (( j=i+1; j<sizes; j++ )) {
			if [ ${d[i]} -gt ${d[j]} ]
			then
				temp=${d[i]}
				d[i]=${d[j]}
				d[j]=$temp
			fi
		}
	}
	echo ${d[@]}
}

# invoking the function to sort the array in ascending order
sortArray ${d[@]}

echo "Winning combination of Doublet is" ${d[3]}


# Singlet Combination

# constants
HEAD=1
TAIL=0

# variable
headCount=0
tailCount=0
totalCount=0

declare -A singlet

while [ $totalCount -lt $LIMIT ]
do
	rd=$((RANDOM%2))
	if [ $rd -eq $HEAD ]
	then
		let headCount++

	else
		let tailCount++

	fi
	let totalCount++
done

headPercentage=`echo $headCount $LIMIT | awk '{h=$1/$2*100} {print h}'`
tailPercentage=`echo $tailCount $LIMIT | awk '{t=$1/$2*100} {print t}'`

singlet[h]=$headPercentage
singlet[t]=$tailPercentage
echo ${singlet[@]} 

VALUES=()
count=0
for DATA in "${singlet[@]}";
do
        VALUES+=("${DATA##*:}")
	let count++
done

for(( i=0;i<count; i++ ))
do
	sarr[i]=${VALUES[i]}
done

# array size
length=${#singlet[@]}

function sortArray() {
	for (( i=0; i<length; i++ )) {
		for (( j=i+1; j<length; j++ )) {
			if [ ${sarr[i]} -gt ${sarr[j]} ]
			then
				temp=${sarr[i]}
				sarr[i]=${sarr[j]}
				sarr[j]=$temp
			fi
		}
	}
	echo ${sarr[@]}
}

# invoking the function to sort the array in ascending order
sortArray ${sarr[@]}

echo "Winning combination of Singlet is" ${sarr[1]}


