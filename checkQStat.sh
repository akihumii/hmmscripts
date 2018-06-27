#!/bin/bash

count=1
lastNum=6

while :
do qstat | head -32

#for i in $(seq 1 $count)
for ((j=count;j<=lastNum;j++))
do printf ' '
done

for ((j=1;j<=(2*count-1);j++))
do printf '.' 
done

printf '\n'

if [ $count -lt $lastNum ]
then count=$((count+1))
else count=1
fi

sleep 1
done
