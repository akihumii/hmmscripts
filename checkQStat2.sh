#!/bin/bash

## input 1 for showing the first few lines, input 2 for showing the middle few lines

line=61

case $1 in
1)
checkRoutine.sh echo 'qstat | head -61' | xargs
;;

2)
checkRoutine.sh 'qstat | sed -n '32,94p''
;;

*)
checkRoutine.sh 'qstat | head -61'
;;

esac

