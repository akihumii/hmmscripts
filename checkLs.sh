#!/bin/bash

find . -name 'channel???' | while IFS= read i; do

echo $i' '$(ls $i | wc -l)

done | grep -w -E '1|2|3|5'
