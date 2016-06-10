# Created and edited by: Ali Sinan Saglam
# Script by: Justin Spiriti
# For 2015 WESTPA Workshop, analysis tools 

source env.sh

# Note:
# For every tool I suggest using -h option if you get stuck or want to learn
# more, tools are well documented! 

### Part 4: Tracing continuous pathways ###

# A sample bash script to concatenate dcd files
output="chig-100-10.dcd"
freq=1

psf=chig.psf
files=`ls dcds/*dcd`
catdcd -o $output -otype dcd -s $psf -stype psf -stride 1 $files
