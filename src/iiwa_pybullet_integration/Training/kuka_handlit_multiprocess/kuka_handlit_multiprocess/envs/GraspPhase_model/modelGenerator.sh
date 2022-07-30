#!/bin/sh

input=$3/model.sdf.erb
output=$3/model.sdf

if ($1 );
then
    echo "Generating Model .."
    echo $input
    erb path=$3  $input > $output
fi

if ( $2 );
then
    
    echo "Launching Model .."
    python3 launch_AW_model.py
fi
