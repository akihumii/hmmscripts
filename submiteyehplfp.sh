#!/bin/bash

cwd=$PWD

find . -name 'channel???' | while IFS= read i; do

echo $i' '$(ls $i | wc -l)

done | grep -w -E '1|3' | while IFS= read j; do

cd $j

echo $j

ls | grep -v 'rplraw.mat' | while IFS= read k; do 
rm -v $k; 
done

qsub $GITHUB_MATLAB/Hippocampus/Compiler/hplfp/eyehplfpHPC_submit_file.txt

cd $cwd

done
