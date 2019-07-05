#!/bin/bash
# input: foldername, HPCaccountname, sortType
# sortType: hmmsort | osort 

if [ “$3” == “hmmsort” ] ; then
	# transfer data to hippocampus
	# scp -r $1 $2@atlas7:~/hpctmp/Data/ &&

	# create a transferdone.txt file as indication
	ssh $2@atlas7 "cd ~/hpctmp/Data/$1 && touch transferdone.txt"

	# copy the general info to Hippocampus
	targetDir="/volume1/Hippocampus/Data/picasso/$1"
	ssh -p 8398 hippocampus@cortex.nus.edu.sg mkdir -p $targetDir
	scp -P 8398 $1/{*.edf,*.txt,*.xlsx,*.mat} hippocampus@cortex.nus.edu.sg:$targetDir &&
	ssh $2@atlas7 "cd ~/hpctmp/Data/$1 && touch transferredGeneralInfo.txt"

	# run Process Level
	ssh $2@atlas7 'cd ~/hpctmp/Data/'$1' && echo $PWD && matlab2016b2 -nojvm -nosplash -nodisplay -r 	"ProcessLevel(rplsplit,'\''Levels'\'','\''Day'\'','\''SaveLevels'\'',3,'\''SkipLFP'\'','\''SkipOSort'\'', '\''Channels'\'', 1:124,'\''UseHPC'\'','\''HPCCmd'\'','\''source ~/.bash_profile; source /etc/profile.d/rec_modules.sh; module load pbs; qsub $GITHUB_MATLAB/Hippocampus/Compiler/rplsplit/rsHPC_submit_file.txt'\''); exit" && touch submitprocessdone.txt'
elif [ “$3” == “osort” ] ; then
	# transfer data to hippocampus
       # scp -r $1 $2@atlas7:~/hpctmp/Data/ &&

	# create a transferdone.txt file as indication
       ssh $2@atlas7 "cd ~/hpctmp/Data/$1 && touch transferdone.txt"

	# copy the general info to Hippocampus
       targetDir="/volume1/Hippocampus/Data/picasso/$1"
	ssh -p 8398 hippocampus@cortex.nus.edu.sg mkdir -p $targetDir

	# run Process Level
	ssh $2@atlas7 'cd ~/hpctmp/Data/'$1' && echo $PWD && matlab2016b2 -nojvm -nosplash -nodisplay -r 	"ProcessLevel(rplsplit,'\''Levels'\'','\''Day'\'','\''SaveLevels'\'',3,'\''SkipLFP'\'','\''SkipSort'\'','\''Channels'\'',1:124,'\''UseHPC'\'','\''HPCCmd'\'','\''source ~/.bash_profile; source /etc/profile.d/rec_modules.sh; module load pbs; qsub $GITHUB_MATLAB/Hippocampus/Compiler/rplsplit/rsHPC_submit_file.txt'\''); exit" && touch submitprocessdone.txt'
else 
	echo invalid sortType
fi
