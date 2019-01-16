#!/bin/bash
## move to the target channel directory first then run it
## input arguments: HPC-user-name

# set variable
sshtarget="$1@atlas7.nus.edu.sg"

# get current directory
cwd=$PWD
channelDir=${cwd#*picasso/}

# create folder in HPC
ssh $sshtarget "mkdir -p ~/hpctmp/Data/rerun/$channelDir" &&

# copy rplraw and rsData to HPC
scp rplraw.mat $sshtarget:hpctmp/Data/rerun/$channelDir/ && 
scp ${cwd%/array*}/rsData.mat $sshtarget:hpctmp/Data/rerun/${channelDir%/array*}/ &&

ssh $sshtarget "cd ~/hpctmp/Data/rerun/$channelDir && runqsubeyehplfp.sh" &&

echo Done...

