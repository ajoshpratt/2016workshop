global env
#Load all the files.  The frames are the parent structure, followed by all frames in the current segment.
mol new chig.psf
mol addfile parent.pdb
mol addfile seg.dcd waitfor all
set nframes [molinfo top get numframes]
set nframesm1 [expr $nframes - 1]
mol new reference.pdb
#set up backbone atom selections
set backbone [atomselect 0 "name N or name CA or name C"]
set backboneref  [atomselect 1 "name N or name CA or name C"]
set allatoms [atomselect 0 "all"]
#measure the RMSD for each frame.
set outfile [open "rmsd.out" "w"]
for {set i 0} {$i < $nframes} {incr i} {
	animate goto $i
	set matrix [measure fit $backbone $backboneref]
	$allatoms move $matrix
	set rmsd [measure rmsd $backbone $backboneref] 
	puts $outfile "$i $rmsd"
}
close $outfile
exit

