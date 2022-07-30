#!/bin/sh

input=$3/model.sdf.erb
output=$3/model.sdf

if ($1 );
then
    echo "Generating Model .."
    echo $input
    erb path=$3 lib_path=$4 $input   > $output  
fi

if ( $2 );
then
    
    echo "Launching Model .."
    python3 launch_hand_model.py
fi




 