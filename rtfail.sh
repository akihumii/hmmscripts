#!/bin/bash

cwd=`pwd`

for i in $(cat notransferreddirs.txt); do
    echo $i
    cd $i
    qsub ~/hmmscripts/transfersession.pbs
    cd $cwd
done

    
