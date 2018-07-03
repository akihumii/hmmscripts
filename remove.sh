#!/bin/bash

cwd=$PWD

for i in session01 session02 session03 session04 sessioneye sessiontest
do cd $i
rm -rf a* *.txt rsHPC_submit_file.txt.* rplsplit.mat rsData.mat process* rpllfp.mat decode* learn* hmmsort
cd $cwd
done

