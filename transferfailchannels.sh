#!/bin/bash

cwd=$PWD

sessionDir=${cwd:`expr index "$cwd" 2018`-1}

targetDir='/volume1/Hippocampus/Data/picasso/'
targetDir+=$sessionDir

cat failchannels.txt | while IFS= read i; do

scp -P 8398 -r hippocampus@cortex.nus.edu.sg:$targetDir/$i/* $i/

done
