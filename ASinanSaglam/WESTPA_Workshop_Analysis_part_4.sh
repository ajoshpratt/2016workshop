# Created by: Ali Sinan Saglam
# For 2015 WESTPA Workshop, analysis tools 

set -e

module load westpa/15acf5d3
module load namd/2.11

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

# This is going to trace walker 10 from iteration 120
if [[ -e trajs.h5 ]];then
  rm trajs.h5
fi
w_trace -W west.h5 120:10

# A sample bash script to pull files from the walker tree (traj_segs)
# I also pull the initial state coordinate for convenience if you would
# like to take a look at the trajectory in your favorite visualization
# software, it's called init.gro
./trj_trace.sh traj_120_10_trace.txt

# Now stitch together the xtc files
# This particular part uses GROMACS tool trjcat to stitch together the 
# trajectory 
cd traced_traj
trjcat -f *xtc -o full_traj.xtc -cat
