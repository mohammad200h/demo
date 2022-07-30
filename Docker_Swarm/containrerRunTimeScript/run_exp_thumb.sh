#!/bin/bash
#Numner of cores for this expirmeent
CORES=$1

#Env vraible for expirement folder
export EXP_FOLDER=$2
echo "CORES::$CORES"

echo "EXP_FOLDER::$EXP_FOLDER"
# Runing the code in singularity
echo "runing::cd ~/hand_RL_ws"
cd ~/hand_RL_ws
pwd
echo "runing::source ./devel/setup.bash"
source ./devel/setup.bash
echo "runing::cd ~/hand_RL_ws/src/iiwa_pybullet_integration/hand_Tuner/thumb_PPO_Algorithem7/ppo_presets/"
cd ~/hand_RL_ws/src/iiwa_pybullet_integration/hand_Tuner/thumb_PPO_Algorithem7/ppo_presets/
pwd
echo "runing:: coach -p  ./thumb_ppo.py -n $CORES"
coach -p  ./thumb_ppo.py -n $CORES


