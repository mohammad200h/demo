#!/bin/bash -l


#*******************ENV variables************************
# Set all the Singularity cache dirs to Scratch
export SINGULARITY_CACHEDIR=$HOME/.singularity/
export SINGULARITY_TMPDIR=$SINGULARITY_CACHEDIR/tmp
export SINGULARITY_LOCALCACHEDIR=$SINGULARITY_CACHEDIR/localcache
export SINGULARITY_PULLFOLDER=$SINGULARITY_CACHEDIR/pull

# Bind your Scratch directory so it is accessible from inside the container
export SINGULARITY_BINDPATH=/home/$USER

#******************ENV for experiement********************


# Batch script to run a GPU job under SGE.

#$ -R y

# Request ten minutes of wallclock time (format hours:minutes:seconds).
#$ -l h_rt=1008:0:0

# Request 1 gigabyte of RAM (must be an integer followed by M, G, or T)
#$ -l tmem=500M

# Request 16 cores.
#$ -pe smp 20



# Set the name of the job.
#$ -N notGPUJob

# Set the working directory to somewhere in your scratch space.
# Replace "<your_UCL_id>" with your UCL user ID :)
#$ -wd /home/mhamid/hand_RL_ws



# load the cuda module (in case you are running a CUDA program)
module unload compilers mpi
module load compilers/gnu/4.9.2
module load cuda/7.5.18/gnu-4.9.2

# Run the application - the line below is just a random example.
singularity shell -B $SINGULARITY_BINDPATH/hand_RL_ws:$SINGULARITY_BINDPATH/hand_RL_ws  $SINGULARITY_BINDPATH/hand_RL_ws/SingularityTest/hand_RL_ws.sif  <<EOF


#Env vraible for expirement folder
export EXP_FOLDER=$1

# Runing the code in singularity
source ./devel/setup.bash
cd src/iiwa_pybullet_integration/Training/kuka_PPO_Algorithem7/ppo_presets/
coach -p  ./kuka_hand_ppo.py -n 20
EOF



