#!/bin/bash

cwd=$PWD

year="2018"
index="${cwd%%$year*}"
sessionDir=${cwd:${#index}}

targetDir='/volume1/Hippocampus/Data/picasso/'
targetDir+=$sessionDir

echo $targetDir

ssh -p 8398 hippocampus@cortex.nus.edu.sg mkdir -p $targetDir
scp -P 8398 -vr ./* hippocampus@cortex.nus.edu.sg:$targetDir &&
#scp -P 8398 -vr  *.xlsx *.edf *.png 18* analog sessiontest *.mat rsHPC_submit_file.txt.* *.txt RawData_T1* hippocampus@cortex.nus.edu.sg:$targetDir 
rm -rv * && 
touch transferredSession.txt &&
touch transferred.txt
