#!/bin/bash

cwd=$PWD

for i in $(cat failedTransferred.txt); do
    echo $i
    cd $i
    rm transfer_job0000.pbs.*
    ~/hmmscripts/transfersession.sh &&
    touch transferred.txt
    #qsub ~/hmmscripts/transfersession.pbs
cd $cwd
done

    
