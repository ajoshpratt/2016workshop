# Created by: Ali Sinan Saglam
# For 2015 WESTPA Workshop, on analysis tools 

# Setup environment
#module load westpa/15acf5d3
source env.sh

### Part 3: Rate constant calculations ### 

# Assingment tool
# Bin and state definition yaml file 
# w_assign

# usage: w_assign [-h] [-r RCFILE] [--quiet | --verbose | --debug] [--version]
#                [--max-queue-length MAX_QUEUE_LENGTH] [-W WEST_H5FILE]
#                [--bins-from-system | --bins-from-expr BINS_FROM_EXPR | --bins-from-function BINS_FROM_FUNCTION | --bins-from-file BINFILE]
#                [--construct-dataset CONSTRUCT_DATASET | --dsspecs DSSPEC [DSSPEC ...]]
#                [--states STATEDEF [STATEDEF ...] | --states-from-file
#                STATEFILE | --states-from-function STATEFUNC] [-o OUTPUT]
#                [--serial | --parallel | --work-manager WORK_MANAGER]
#                [--n-workers N_WORKERS]

w_assign -W west.h5 --bins-from-file BINS --states-from-file STATES -o assign.h5 --construct-dataset assignment.pull_data_assign

# Kinetics calculation tool
# w_kinetics

# usage: w_kinetics trace [-h] [-W WEST_H5FILE] [--first-iter N_ITER]
#                        [--last-iter N_ITER] [-a ASSIGNMENTS] [-o OUTPUT]
#                        [--no-compression]

w_kinetics trace -W west.h5 -a assign.h5 -o kinetics.h5

# Kinetic averaging tool
# w_kinavg 

# usage: w_kinavg trace [-h] [-W WEST_H5FILE] [--first-iter N_ITER]
#                      [--last-iter N_ITER] [--step-iter STEP] [-a ASSIGNMENTS]
#                      [-k KINETICS] [-o OUTPUT] [--alpha ALPHA]
#                      [--autocorrel-alpha ACALPHA] [--nsets NSETS]
#                      [-e {cumulative,blocked,none}]
#                      [--window-frac WINDOW_FRAC]

w_kinavg trace -W west.h5 -a assign.h5 -k kinetics.h5 -o kinavg.h5 | tee kinavg.txt


# Now defining the state from arbitrary data sets
# The following commands reassign the data, including the end to end distance into bins
# as defined in BINS_AUX and with states as defined in STATES_AUX which is then
# used to calculate rate constants.

#w_assign -W west.h5 --bins-from-file BINS_AUX --states-from-file STATES_AUX -o assign_aux.h5 --construct-dataset assignment.pull_data

#w_kinetics trace -W west.h5 -a assign_aux.h5 -o kinetics_aux.h5

#w_kinavg trace -W west.h5 -a assign_aux.h5 -k kinetics_aux.h5 -o kinavg_aux.h5 | tee kinavg_aux.txt
