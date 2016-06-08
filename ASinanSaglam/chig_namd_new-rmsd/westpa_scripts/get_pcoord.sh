#!/bin/bash -v

if [ -n "$SEG_DEBUG" ] ; then
    set -x
    env | sort
fi

cd $WEST_SIM_ROOT/namd_config/

echo "Hi there!" > get-pcoord-output
# Get progress coordinate
/usr/local/bin/vmd -e $WEST_SIM_ROOT/namd_config/measure-rmsd-init.tcl >& get-pcoord-vmd.out #|| exit 1
gawk '{print $2}' rmsd.out > $WEST_PCOORD_RETURN 
#rm -f rmsd.temp

if [ -n "$SEG_DEBUG" ] ; then
    head -v $WEST_PCOORD_RETURN
fi


