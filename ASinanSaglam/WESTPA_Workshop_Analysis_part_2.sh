# Created by: Ali Sinan Saglam
# For 2016 WESTPA Workshop, analysis tools 

module load westpa/15acf5d3

# Note:
# For every tool I suggest using -h option if you get stuck or want to learn
# more, tools are well documented! 

### Part 2: Free Energy Landscape ### 

# Histogramming tool: w_pdist

# w_pdist is the tool used in order to generate histograms 
# for different datasets (including but not limited to the progress coordinate). 

# usage: w_pdist [-h] [-r RCFILE] [--quiet | --verbose | --debug] [--version]
#                [--max-queue-length MAX_QUEUE_LENGTH] [-W WEST_H5FILE]
#                [--first-iter N_ITER] [--last-iter N_ITER] [-b BINEXPR]
#                [-o OUTPUT] [-C] [--loose]
#                [--construct-dataset CONSTRUCT_DATASET | --dsspecs DSSPEC [DSSPEC ...]]
#                [--serial | --parallel | --work-manager WORK_MANAGER]
#                [--n-workers N_WORKERS]

# By default the tool will histogram the progress coordinate with the bins 
# as defined in the system.py (or west.cfg) files. 

# A very useful thing to know about the w_pdist command is the option to pull in auxiliary datasets 
# and being able to histogram those. This way you can keep track of auxiliary data during your simulation
# This is done by defining a python function and supplying the function to the option --construct-dataset
# We will also change the binning as defined in the system.py and instead bin the auxiliary dataset 
w_pdist -W west.h5 --construct-dataset assignment.pull_data -o pdist.h5 -b 200

# Plotting the histograms
# 1D plotting and basic plotting controls

# usage: plothist average [-h] [-o PLOT_OUTPUT] [--hdf5-output HDF5_OUTPUT]
#                         [--plot-contour] [--title TITLE]
#                         [--linear | --energy | --zero-energy E | --log10]
#                         [--range RANGE]
#                         [--postprocess-function POSTPROCESS_FUNCTION]
#                         [--text-output TEXT_OUTPUT] [--first-iter N_ITER]
#                         [--last-iter N_ITER]
#                         input [DIMENSION] [ADDTLDIM]

# 1D average plots
# The following command will produce a png that plots the free energy landscape of the 
# first dimension of the progress coordinate and sets the y-axis limit to 10kT. 
plothist average -o 1d_average.png --range 0,10 --postprocess-function plotting.avg_1d pdist.h5 0

# 1D evolution plots
# The following command will produce a png that plots the free energy landscape of the 
# first dimension of the progress coordinate as a function of WE iteration and sets the color bar to 10kT.
plothist evolution -o 1d_evolution.png --range 0,10 --postprocess-function plotting.evo_1d pdist.h5 0

# 2D free energy surface plotting 

# Since we have the progress coordinate already histogrammed we can plot the two dimensions 
# of the progress coordinate. This next command wiill produce a color map of the free energy
# as a function of the two progress coordinates. 
#plothist average -o 2d_average.png --range 0,10 --postprocess-function plotting.avg_2d pdist.h5 0 1 
