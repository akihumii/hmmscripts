#!/bin/bash

for i in {$1..$2}
do qdel $i
done
