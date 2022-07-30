#!/bin/bash -l

repeate_expirement_nTime=5
#*******************reading list of expirements**********
input="./expirement_list.txt"
declare -a list_of_expirements

exec <$input
while read  line
do
   
    if [ "$line" != "" ]; then
        list_of_expirements+=($line)
        # echo $line
    fi
    
done 

# echo ${list_of_expirements[0]}
# echo ${list_of_expirements[1]}
#***************making duplcate of the expirement********
for exp in ${list_of_expirements[@]}
do 
    echo $exp
    for i in $(seq 1 $repeate_expirement_nTime)
    do
        folder_name="$exp"_"$i"
        path=/cluster/project2/hand_RL_ws/src/iiwa_pybullet_integration/Training/sb_3/run_continious/Expirements/$folder_name
        cp -a /cluster/project2/hand_RL_ws/EmptyExpirementFolders/chapter4/stable_baseline/ALL/$exp $path
    done
done


#***************submitting job for each expirement*******
for exp in ${list_of_expirements[@]}
do 
    echo $exp
    for i in $(seq 1 $repeate_expirement_nTime)
    do
        folder_name="$exp"_"$i"
        qsub -N $folder_name hand_RL_job.sh $folder_name
    done
done

