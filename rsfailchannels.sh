#!/bin/bash
cwd=$PWD

cat failchannels.txt | grep -v analog | while iFS= read i; do

echo $i

cd $i

rm $(ls | grep -v rplraw.mat)

qsub ~/matlab/Hippocampus/Compiler/hplfp/eyehplfpHPC_submit_file.txt

cd $cwd

done
