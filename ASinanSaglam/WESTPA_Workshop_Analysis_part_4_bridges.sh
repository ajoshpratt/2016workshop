# Created and edited by: Ali Sinan Saglam
# Script by: Justin Spiriti
# For 2015 WESTPA Workshop, analysis tools 

source env.sh

# Note:
# For every tool I suggest using -h option if you get stuck or want to learn
# more, tools are well documented! 

### Part 3: Tracing continuous pathways ###

# Tracing tool: w_trace 

# w_trace traces one walker backwards in history finding 
# it's parents. Only needs the h5 file from the simulation

# usage: w_trace [-h] [-r RCFILE] [--quiet | --verbose | --debug] [--version]
#               [-W WEST_H5FILE] [-d DSNAME] [--output-pattern OUTPUT_PATTERN]
#               [-o OUTPUT]
#               N_ITER:SEG_ID [N_ITER:SEG_ID ...]

# This is going to trace walker 10 from iteration 100
w_trace -W west.h5 100:10

# A sample bash script to pull files from the walker tree (traj_segs)
# I also pull the initial state coordinate for convenience if you would
# like to take a look at the trajectory in your favorite visualization
# software, it's called init.gro
trace="traj_100_10_trace.txt"

files=`awk  '{if (NF==0) next; if (substr($0,1,1)=="#") next; iter=$1; seg=$2; if (iter<=0) next; printf("traj_segs/%06d/%06d/seg.dcd ",iter,seg)}' $trace`

mkdir dcds
cp $files dcds/.
