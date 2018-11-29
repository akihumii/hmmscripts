#!/bin/bash

matlab2016a2 -nojvm -nosplash -nodisplay -r "ProcessLevel(rplsplit,'Levels','Day','SaveLevels',3,'SkipLFP','UseHPC','HPCCmd','source ~/.bash_profile; source /etc/profile.d/rec_modules.sh; module load pbs; qsub $GITHUB_MATLAB/Hippocampus/Compiler/rplsplit/rsHPC_submit_file.txt'); exit"
