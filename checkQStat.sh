#!/bin/bash

## input 1 for showing the first few lines, input 2 for showing the middle few lines

count=1
lastNum=6

filename='QStat'
filename+=$(date +%Y%m%d%H%M%S)
filename+='.txt'

line=61

while :
do 
case $1 in
1)
qstat | sort | head -$line
qstat | sort | head -$line | grep -v "Job" >> $filename 
;;

2)
qstat | sort | sed -n '32,94p'
qstat | sort | sed -n '32,94p' | grep -v "Job" >> $filename
;;

3)
qstat | sort | tail -$line 
qstat | sort | tail -$line | grep -v "Job" >> $filename
;;

*)
qstat | sort | head -$line | grep -v "Job" 
qstat | sort | head -$line | grep -v "Job" >> $filename
;;

esac

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

sleep 5 

done

