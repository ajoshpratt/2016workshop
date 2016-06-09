#! /bin/bash

source $WEST_SIM_ROOT/env.sh

if [ -n "$SEG_DEBUG" ] ; then
    set -x
    env | sort
fi

cd $WEST_SIM_ROOT/namd_config/

# Get progress coordinate
python $WEST_SIM_ROOT/rmsdtool.py --reference $WEST_SIM_ROOT/namd_config/reference.pdb --backbone --coords $WEST_SIM_ROOT/namd_config/seg_initial.pdb &> $WEST_PCOORD_RETURN

if [ -n "$SEG_DEBUG" ] ; then
    head -v $WEST_PCOORD_RETURN
fi


