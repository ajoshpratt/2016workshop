# Created and edited by: Ali Sinan Saglam
# For 2015 WESTPA Workshop, analysis tools 

set -x

BRIDGES=$(hostname|grep "bridges")
if [[ -n $BRIDGES ]];then
  module load westpa
  WT_ROOT="/opt/packages/westpa/lib/west_tools"
else
  export WEST_ROOT=~/bin/westpa
  export PATH=$PATH:$WEST_ROOT/bin
  export PATH=$PATH:~/bin
fi
