FROM nvidia/cudagl:9.2-devel-ubuntu16.04
#****************Setting up user *********************
ARG UNAME=ros
ARG PASS=ros
ARG UID=1000
ARG GID=1000
RUN apt-get update && apt-get install sudo -y
RUN sudo -i
RUN groupadd -g $GID -o $UNAME
RUN sudo useradd -m -u $UID -g $GID -p $(openssl passwd -1 $PASS) -o -s  /bin/bash $UNAME
RUN usermod -aG sudo $UNAME
USER $UNAME 
WORKDIR home/$UNAME/ 

#*********************Expiremnet Env varables***********************
ARG CORES=16
ARG EXP_List="Not set"

#********************Installing Extra packaged**********************
RUN echo $PASS | sudo -S echo "fuck me!"
RUN echo $PASS | sudo -S apt-get update
RUN echo $PASS | sudo -S apt-get install -y software-properties-common
#gedit
RUN echo "Y" |sudo -S apt-get install gedit
#python2.7
RUN echo "gedit"&& echo $PASS | sudo -S apt-get update
RUN echo "gedit"&& echo "Y" | sudo -S apt upgrade
RUN echo "python"&& echo "Y" | sudo -S apt install python2.7 python-pip

#installing terminator
    #"\u000A" is like pressing the Enter key
RUN echo $PASS | sudo -S apt-get install -y software-properties-common
RUN echo "\u000A" | sudo -S add-apt-repository ppa:gnome-terminator
RUN echo $PASS | sudo -S apt-get update
RUN echo "Y" | sudo -S apt-get install terminator
#******************** Installing ros kinetic************************
RUN echo $PASS | sudo -S echo "fuck me!"
#Setup your sources.list
RUN echo $PASS | sudo -S sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
#Set up your keys
RUN echo $PASS | sudo -S  apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
#Installation
RUN echo $PASS | sudo -S apt-get update
    #Desktop-Full Install: (Recommended) : ROS, rqt, rviz, robot-generic libraries, 2D/3D simulators, navigation and 2D/3D perception 
    RUN echo "Y" | sudo -S  apt-get install ros-kinetic-desktop-full

#Initialize rosdep
RUN echo $PASS | sudo -S rosdep init
RUN rosdep update
#Environment setup 
RUN echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
#source can not be used in bash so instead of "source ~/.bashrc " use ". ~/.bashrc "
RUN . ~/.bashrc 
RUN echo $PASS | sudo -S chmod +x /opt/ros/kinetic/setup.bash
RUN bash /opt/ros/kinetic/setup.bash
#Dependencies for building packages
RUN  echo "Y" | sudo -S  apt install python-rosinstall python-rosinstall-generator python-wstool build-essential

#************************************setting python version**************************
RUN echo $PASS| sudo -S echo "fuck me!"
RUN echo "\u000A" |sudo -s add-apt-repository ppa:deadsnakes/ppa
RUN $PASS|sudo -s apt-get update
RUN echo "y" | sudo apt-get install python3.6
RUN echo "y" | sudo apt-get install python3-pip

RUN echo $PASS| sudo -S echo "fuck me33!"
RUN $PASS|sudo -s apt-get update
RUN echo $PASS|sudo -S update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 1
RUN echo $PASS|sudo -S apt-get install -y python3 python3.6-dev
#***********************************Installing TF*************************
RUN echo $PASS| sudo -S echo "fuck me!"
RUN $PASS|sudo -s apt-get update
RUN pwd
COPY ./Docker_Swarm/DockerFile_TF_Swarm/cuda9.2 /tmp

COPY ./Docker_Swarm/DockerFile_TF_Swarm/cuda9.2/cuda/lib64/* /usr/local/cuda/lib64/

COPY ./Docker_Swarm/DockerFile_TF_Swarm/cuda9.2/cuda/include/* /usr/local/cuda/include/


RUN echo $PASS | sudo -S echo "fuck me??ee!"
RUN echo $PASS|sudo -s dpkg -i /tmp/libcudnn7_7.6.5.32-1+cuda9.2_amd64.deb
RUN echo $PASS|sudo -s dpkg -i /tmp/libcudnn7-dev_7.6.5.32-1+cuda9.2_amd64.deb

RUN echo $PASS | sudo -S echo "fuck me!"
RUN echo "y" |sudo -S apt install cuda-toolkit-9-0
RUN echo "y" |sudo -S apt install cuda-toolkit-10-0

RUN pip3 install --upgrade pip==20.2.4


RUN echo $PASS | sudo -S echo "fuck me!"
RUN $PASS|sudo -S apt-get update


RUN $PASS|sudo -S pip3 install tensorflow-gpu==1.14.0


RUN echo "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda-9.0/lib64/" >> ~/.bashrc
#RUN echo "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda-10.0/lib64/" >> ~/.bashrc

#*****************************************************
RUN echo $PASS | sudo -S echo "fuck mee!"

RUN echo "y" | sudo apt-get install python3 python-dev python3-dev \
     build-essential libssl-dev libffi-dev \
     libxml2-dev libxslt1-dev zlib1g-dev \
     python3-pip

RUN echo $PASS| sudo -s pip3 install pybullet
RUN echo $PASS| sudo -s pip install pybullet

#*********Copyinh hand_RL_ws and Setting it  Up**********
RUN echo home/$UNAME/hand_RL_ws/
ADD .       ./hand_RL_ws/
#ADD ./Docker_Swarm/ home/$UNAME/hand_RL_ws/
#ADD ./build/        home/$UNAME/hand_RL_ws/
#ADD ./devel/        home/$UNAME/hand_RL_ws/
#ADD ./install/      home/$UNAME/hand_RL_ws/
#ADD ./catkin/       home/$UNAME/hand_RL_ws/
RUN cd /home/$UNAME/hand_RL_ws/ &&ls
#****************Installing Coach****************************
RUN cd  /home/$UNAME/hand_RL_ws/src/iiwa_pybullet_integration/Training/kuka_PPO_Algorithem7/ && echo $PASS | sudo -S ./install.sh
#***************Installing kuka_handlit********************
RUN cd  /home/$UNAME/hand_RL_ws/src/iiwa_pybullet_integration/Training/kuka_handlit/ && echo $PASS | sudo -S pip3 install -e .

#*******************************************************
RUN echo "\n\n"
RUN cd  /home/$UNAME/hand_RL_ws/Docker_Swarm/containrerRunTimeScript/ && ls
RUN echo "\n\n"
RUN ls
#RUN echo $PASS|sudo -S  chmod +x /home/$UNAME/hand_RL_ws/Docker_Swarm/containrerRunTimeScript/run_exp.sh

#VOLUME /home/$UNAME/hand_RL_ws/src/

RUN echo $PASS|sudo -S  chmod +x /home/$UNAME/hand_RL_ws/Docker_Swarm/containrerRunTimeScript/run_exp.sh
WORKDIR /home/$UNAME/hand_RL_ws/Docker_Swarm/containrerRunTimeScript
RUN ls

CMD ["run_exp.py"]
ENTRYPOINT ["python3"]

#CMD /bin/bash
