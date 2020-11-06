#!/bin/bash

qselect -u $USER | xargs qhold
qselect -u $USER | xargs qdel
echo Finish deleting all job...
