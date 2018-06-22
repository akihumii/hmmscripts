#!/bin/bash

# make sure you have swap to session direcotry already
cwd=$PWD
for i in `find . -name "channel???"`
do echo $i
cd $i
rm -rf decode* learn* hmmsort; 
~/hmmsort/hmmsort_pbs.py ~/hmmsort # run hmmsort_pbs.py 
cd $cwd
done


