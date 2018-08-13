#!/bin/bash

cwd=$PWD

for i in $(cat nodecodedirs.txt); do
    echo $i
    cd $i
    rm decode*
    qsub ~/hmmsort/decode_job0001.pbs
    cd $cwd
done

    
