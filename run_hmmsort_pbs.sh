#!/bin/bash

# make sure you have swap to session direcotry already
# input 1 for running hmmsort_pbs.py

cwd=$PWD
	
for i in `find . -name "channel???"`
do echo $i
cd $i
rm -rf decode* learn* hmmsort; 
case $1 in
1)
~/hmmsort/hmmsort_pbs.py ~/hmmsort # run hmmsort_pbs.py 
;;
*)
;;
esac
cd $cwd
done


