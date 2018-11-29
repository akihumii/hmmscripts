#!/bin/bash

cwd=$PWD

targetDir=${cwd:`expr index "$cwd" 2018`-1}

scp -P 8398 hippocampus@cortex.nus.edu.sg:/volume1/Hippocampus/Data/picasso/$targetDir/highpassdirs.txt ./highpassdirsH.txt &&

echo 'not transferred highpass files:'
cat highpassdirsH.txt allchannels.txt | sort | uniq -u > failhighpass.txt
cat failhighpass.txt


scp -P 8398 hippocampus@cortex.nus.edu.sg:/volume1/Hippocampus/Data/picasso/$targetDir/learndirs.txt ./learndirsH.txt &&

echo 'not transferred learn files:'
cat learndirsH.txt allchannels.txt | sort | uniq -u > faillearn.txt
cat faillearn.txt


echo 'not complete transferred files:'
cat failhighpass.txt faillearn.txt | sort | uniq > failchannels.txt
cat failchannels.txt

rm failhighpass.txt faillearn.txt
