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


#***************submitting job for each expirement*******
for exp in ${list_of_expirements[@]}
do 
    echo $exp
    for i in $(seq 1 $repeate_expirement_nTime)
    do
        
        export EXP_FOLDER="$exp"_"$i"
        python3 play.py
    done
done