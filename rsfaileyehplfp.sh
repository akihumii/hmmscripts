#!/bin/bash

cwd=`pwd`

for i in $(cat hmmfail.txt); do
    echo $i
    cd $i
    rm -r hmmsort decode* learn* eyehplfpHPC* rplhighpass.mat rpllfp.mat transfer*
    qsub $GITHUB_MATLAB/Hippocampus/Compiler/hplfp/eyehplfpHPC_submit_file.txt
    cd $cwd
done

    
