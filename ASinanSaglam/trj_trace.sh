#!/bin/bash

# Script that reads in the given w_trace output in it's 
# first argument, pulls the seg.xtc files from each iter/walker 
# index pair 

# Variables # 
SIM_PATH='/gscratch2/lchong/ajp105/p53-ivy'
TRAJ_SEGS=${SIM_PATH}/traj_segs/
FULL_TRJ='traced_traj'

if [[ ! -d $FULL_TRJ ]];then
  mkdir $FULL_TRJ
fi

cp $SIM_PATH/bstates/p53/eq3.gro $FULL_TRJ/initial_struct.gro

for i in `tail -n +9 $1|awk '{print $1"-"$2}'`;do
  # We need the iteration/walker indices as strings
  # so we can name the file properly
  iter=`echo $i|sed 's/-[0-9]*//'`
  p_iter=`printf "%06d" $iter`
  walk=`echo $i|sed 's/^[0-9]*//'|sed 's/-//'`
  p_walk=`printf "%06d" $walk`
  # Make the full path to the seg.xtc 
  TRJ_PATH=`printf "${TRAJ_SEGS}/%06d/%06d" $iter $walk`
  # Copy into the folder!
  cp $TRJ_PATH/seg.xtc ${FULL_TRJ}/${p_iter}_${p_walk}.xtc 
done
