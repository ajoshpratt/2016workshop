# Created by: Ali Sinan Saglam
# For 2015 WESTPA Workshop, on analysis tools 

# Setup environment
#module load westpa/15acf5d3

# If running on bridges
#source ../namd_chig/env.sh
#WT_ROOT="/opt/packages/westpa/lib/west_tools"
source env.sh

### Part 3: Rate constant calculations ### 


# Post analysis # 
w_assign -W west.h5 --bins-from-file BINS --states-from-file STATES -o assign.h5 --construct-dataset assignment.pull_data_assign

# If running on bridges
#west $WT_ROOT/w_postanalysis_matrix.py -W west.h5 -a assign.h5 -o post_mat.h5 
w_postanalysis_matrix -W west.h5 -a assign.h5 -o post_mat.h5 

# If running on bridges
#west $WT_ROOT/w_postanalysis_reweight.py -W west.h5 -a assign.h5 -k post_mat.h5 -o post_rew.h5 -e cumulative --step-iter 1
w_postanalysis_reweight -W west.h5 -a assign.h5 -k post_mat.h5 -o post_rew.h5 -e cumulative --step-iter 1
