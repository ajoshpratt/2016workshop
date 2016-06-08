# This file defines where WEST can be found
# Modify to taste

# Inform WEST where to find Python and our other scripts where to find WEST
module load westpa/15acf5d3
module load namd/2.11

# Explicitly name our simulation root directory
if [[ -z "$WEST_SIM_ROOT" ]]; then
    export WEST_SIM_ROOT="$PWD"
fi
export SIM_NAME=$(basename $WEST_SIM_ROOT)
echo "simulation $SIM_NAME root is $WEST_SIM_ROOT"
