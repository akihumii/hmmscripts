#!/bin/bash
#PBS -q serial

cd $PBS_O_WORKDIR

cd session01 &&
~/hmmscripts/transfersession.sh &&

cd ../sessiontest &&
~/hmmscripts/transfersession.sh &&

cd ../sessioneye &&
~/hmmscripts/transfersession.sh &&

cd .. &&
~/hmmscripts/transfersession.sh 


