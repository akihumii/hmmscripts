#!/bin/bash

cwd=$PWD

for i in $(cat notransferreddirs.txt); do
    echo $i
    cd $i
    ~/hmmscripts/transfersession.sh &&
    touch transferred.txt
    #qsub ~/hmmscripts/transfersession.pbs
cd $cwd
done

    
