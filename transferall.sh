#!/bin/bash

cwd=$PWD

find . -name 'channel???' | while IFS= read i; do
    echo $i
    cd $i
    rm transfer_job0001.pbs.*
    qsub ~/hmmsort/transfer_job0001.pbs
    cd $cwd
done

    
