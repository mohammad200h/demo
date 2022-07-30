#
/bin/bash -l


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
#$ -wd /cluster/project2/hand_RL_ws



# load the cuda module (in case you are running a CUDA program)
module unload compilers mpi
module load compilers/gnu/4.9.2
module load cuda/7.5.18/gnu-4.9.2

# Run the application - the line below is just a random example.
singularity shell -B /cluster/project2/hand_RL_ws:/mnt  /cluster/project2/hand_RL_ws/SingularityTest/sb.sif  <<EOF



#Env vraible for expirement folder
export EXP_FOLDER=$1


# Runing the code in singularity
cd /mnt/src/iiwa_pybullet_integration/Training/sb_3/run_continious/
python3 run_PPO_continious.py 20
EOF



