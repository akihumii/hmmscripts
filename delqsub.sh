#!/bin/bash

#for i in {$1..$2}
for ((i=$1;i<=$2;i++))
do 
echo deleting $i ...
qdel $i
done
