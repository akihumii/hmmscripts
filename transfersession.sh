#!/bin/bash

cwd=$PWD

sessionDir=${cwd##*/}
dayDir=${cwd%/*}
dayDir=${dayDir##*/}

targetName='/volume1/Hippocampus/Data/picasso/'
targetName+=$dayDir

fileName=${sessionDir}.tar.gz
fullFileName=${targetName}/$fileName
tar -cvf $fileName rplparallel.mat rsData.mat rplsplit.mat rsHPC_submit_file.txt.* nolearndirs.txt nodecodedirs.txt hmmfail.txt 
scp -P 8398 $fileName hippocampus@cortex.nus.edu.sg:$targetName
ssh -p 8398 hippocampus@cortex.nus.edu.sg tar -xvf $fullFileName -C ${targetName}/$sessionDir
ssh -p 8398 hippocampus@cortex.nus.edu.sg rm -v $fullFileName
rm -v $fileName

