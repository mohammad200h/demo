    #Environment setup 
    echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
    #source can not be used in bash so instead of "source ~/.bashrc " use ". ~/.bashrc "
    source ~/.bashrc 
    chmod +x /opt/ros/kinetic/setup.bash
    bash /opt/ros/kinetic/setup.bash