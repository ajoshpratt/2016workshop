# Created by: Ali Sinan Saglam
# For 2015 WESTPA Workshop, on analysis tools 

# Setup environment
source env.sh
if [[ -n $BRIDGES ]];then
  cd ../namd_chig
fi

### Part 3: Rate constant calculations ### 
# Post analysis # 
w_assign -W west.h5 --bins-from-file BINS --states-from-file STATES -o assign.h5 --construct-dataset assignment.pull_data_assign

# If running on bridges
if [[ -n $BRIDGES ]];then
  west $WT_ROOT/w_postanalysis_matrix.py -W west.h5 -a assign.h5 -o post_mat.h5 
  west $WT_ROOT/w_postanalysis_reweight.py -W west.h5 -a assign.h5 -k post_mat.h5 -o post_rew.h5 -e cumulative --step-iter 1
else 
  w_postanalysis_matrix -W west.h5 -a assign.h5 -o post_mat.h5 
  w_postanalysis_reweight -W west.h5 -a assign.h5 -k post_mat.h5 -o post_rew.h5 -e cumulative --step-iter 1
fi

