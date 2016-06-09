# This file defines where WEST and NAMD can be found
# Modify to taste
module load anaconda
module load westpa
module load namd
export WEST_ROOT=/opt/packages/westpa
export NODELOC=$XDG_RUNTIME_DIR

# Set environment variable for NAMD for convenience
export NAMD=$(which namd2)

# Inform WEST where to find Python and our other scripts where to find WEST
export WEST_PYTHON=$(which python2.7)
if [[ -z "$WEST_ROOT" ]]; then
    echo "Must set environ variable WEST_ROOT"
    exit
fi

# Explicitly name our simulation root directory
if [[ -z "$WEST_SIM_ROOT" ]]; then
    export WEST_SIM_ROOT="$PWD"
fi

# Set simulation name
export SIM_NAME=$(basename $WEST_SIM_ROOT)
echo "simulation $SIM_NAME root is $WEST_SIM_ROOT"

# Export environment variables for the ZMQ work manager.
export WM_ZMQ_MASTER_HEARTBEAT=100
export WM_ZMQ_WORKER_HEARTBEAT=100
export WM_ZMQ_TIMEOUT_FACTOR=300
