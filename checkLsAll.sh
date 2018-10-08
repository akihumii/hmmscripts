#!/bin/bash

printLsAll()
{
find . -name 'channel???' | while IFS= read i; do

echo $i' '$(ls $i | wc -l)

done 
}

# Print all the ls
printLsAll

# Print the number of the directories
printLsAll | wc -l  
