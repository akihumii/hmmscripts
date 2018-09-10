#!/bin/bash

cwd=$PWD

sessionDir=${cwd:`expr index "$cwd" 2018`-1}

targetDir='/volume1/Hippocampus/Data/picasso/'
targetDir+=$sessionDir

echo $targetDir

ssh -p 8398 hippocampus@cortex.nus.edu.sg mkdir -p $targetDir
scp -P 8398 -vr 20180910_Notes.txt CellActivityLog.new.xlsx Electrode\ movement\ notes.xlsx P9_10.edf results_Set1_2018_9_10.mat 18* analog rplparallel.mat rsData.mat rplsplit.mat rsHPC_submit_file.txt.* nolearndirs.txt nodecodedirs.txt hmmfail.txt RawData_T1* hippocampus@cortex.nus.edu.sg:$targetDir &&
rm -rv * &&
touch transferredSession.txt

