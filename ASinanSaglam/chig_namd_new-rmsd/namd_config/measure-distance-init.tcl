#Load all the files.  The frames are the parent structure, followed by all frames in the current segment.
mol new chig.psf
mol addfile seg_initial.pdb
#Find the atom indices corresponding to Gly 1 N and Gly 10 C.
set sel1 [atomselect top "resid 1 and name N"]
set atom1idx [lindex [$sel1 get index] 0]
set sel2 [atomselect top "resid 10 and name C"]
set atom2idx [lindex [$sel2 get index] 0]
#Measure all the distances.
set indices [list $atom1idx $atom2idx]
set distances [measure bond $indices frame all]
set firstdist [lindex $distances 0] 
#output the data to the input file required by WESTPA (from the environment variable $WEST_PCOORD_RETURN
set pcoordfname $::env(WEST_PCOORD_RETURN)
set pcoordfile [open $pcoordfname "w"]
puts $pcoordfile $firstdist
close $pcoordfile
exit

