#!/bin/bash

#qsub ~/hmmscripts/compilation/compile.txt

#echo `ls ~/hmmscripts/compilation/` are being compiled...


cwd=$PWD

cd ~/hmmscripts/compilation/

for i in `ls`
do echo $i has been submitted for compilation...
qsub $i
done

cd $cwd


