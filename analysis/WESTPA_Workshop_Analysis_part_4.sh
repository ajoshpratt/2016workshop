# Created and edited by: Ali Sinan Saglam
# Script by: Justin Spiriti
# For 2015 WESTPA Workshop, analysis tools 

source env.sh

# Bridges/2016 workshop note:
# In order to concatenate the trajectories please copy over your DCD folder you generated on Bridges 
# to the analysis folder 
# e.g. 
# scp -r USERNAME@bridges.psc.edu:/PATH/TO/YOUR/DCD/FOLDER dcds


# Note:
# For every tool I suggest using -h option if you get stuck or want to learn
# more, tools are well documented! 

### Part 4: Tracing continuous pathways ###

if [[ -n $BRIDGES ]];then

  # Tracing tool: w_trace 
  
  # w_trace traces one walker backwards in history finding 
  # it's parents. Only needs the h5 file from the simulation
  
  # usage: w_trace [-h] [-r RCFILE] [--quiet | --verbose | --debug] [--version]
  #               [-W WEST_H5FILE] [-d DSNAME] [--output-pattern OUTPUT_PATTERN]
  #               [-o OUTPUT]
  #               N_ITER:SEG_ID [N_ITER:SEG_ID ...]
  
  # This is going to trace walker 10 from iteration 100
  if [[ -e trajs.h5 ]];then
    rm trajs.h5
  fi
  #w_trace -W ../namd_chig/west.h5 100:10
  w_trace -W ../namd_chig/west.h5 4:1
  
  # A sample bash script to pull files from the walker tree (traj_segs)
  # I also pull the initial state coordinate for convenience if you would
  # like to take a look at the trajectory in your favorite visualization
  # software, it's called init.gro
  trace="traj_4_1_trace.txt"
  #trace="traj_100_10_trace.txt"
  
  files=`awk  '{if (NF==0) next; if (substr($0,1,1)=="#") next; iter=$1; seg=$2; if (iter<=0) next; printf("traj_segs/%06d/%06d/seg.dcd ",iter,seg)}' $trace`
  
  if [[ ! -e dcds ]];then
    mkdir dcds
  fi 

  cd ../namd_chig
  ctr=1
  for file in $files;do
    echo $file
    cp $file ../analysis/dcds/${ctr}.dcd
    ctr=$((ctr+1))
  done
else
  # A sample bash script to concatenate dcd files
  output="chig-100-10.dcd"
  freq=1
  
  psf=chig.psf
  files=`ls dcds/*dcd`
  catdcd -o $output -otype dcd -s $psf -stype psf -stride 1 $files
fi
