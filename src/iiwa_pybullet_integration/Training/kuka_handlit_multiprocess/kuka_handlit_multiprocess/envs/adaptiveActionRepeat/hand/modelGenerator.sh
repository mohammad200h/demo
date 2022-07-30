#!/bin/sh

input=$3/model.sdf.erb
output=$3/model.sdf
output_two=$3/model_$5.sdf

if ($1 );
then
    echo "Generating Model .."
    echo $input
    erb path=$3 lib_path=$4 control_mode=$5  $input   > $output 
    erb path=$3 lib_path=$4 control_mode=$5  $input   > $output_two   
fi

if ( $2 );
then
    
    echo "Launching Model .."
    python3 launch_hand_model.py
fi




 