FROM nvidia/cudagl:11.2.0-devel-ubuntu20.04
#https://github.com/phusion/baseimage-docker/issues/58
#Telling consoul to shut the fuck up!
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
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
RUN echo "asssss"

#*******************************
RUN echo $PASS | sudo -S apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/3bf863cc.pub
RUN echo $PASS | sudo -S apt-get update
# RUN printf '%s\n%s\n%s\n%s\n' ${PASS} 'y' '8' '27'| sudo -S apt-get install software-properties-common

# RUN echo $PASS |  sudo -S apt-get install -y software-properties-common
#***********************************Installing TF*************************

RUN echo $PASS|sudo -S apt-get update
COPY cuda11.2 /tmp

COPY cuda11.2/cuda/lib64/* /usr/local/cuda/lib64/

COPY cuda11.2/cuda/include/* /usr/local/cuda/include/



RUN echo $PASS|sudo -S dpkg -i /tmp/libcudnn8_8.0.5.39-1+cuda11.1_amd64.deb
RUN echo $PASS|sudo -S dpkg -i /tmp/libcudnn8-dev_8.0.5.39-1+cuda11.1_amd64.deb

RUN echo $PASS|sudo -S apt-get update

RUN printf '%s\n%s\n' ${PASS} 'y' |sudo -S apt-get install python3-pip

RUN pip3 install --upgrade pip==20.2.4



#********************Installing pytorch***************
RUN echo $PASS | sudo -S sudo pip3  install torch torchvision

#*****************************************************

RUN echo $PASS| sudo -S apt-get install dialog apt-utils -y

RUN printf '%s\n%s\n' ${PASS} '8' | sudo -S apt-get install -y python3 python-dev python3-dev \
     build-essential libssl-dev libffi-dev \
     libxml2-dev libxslt1-dev zlib1g-dev \
     python3-pip

RUN echo $PASS| sudo -S pip3 install pybullet


#*************************terminator***************

RUN echo $PASS | sudo -S apt-get update

RUN printf '%s\n%s\n' ${PASS} 'y'|sudo -S apt-get install terminator
#******************** Installing ros neotic************************

RUN echo $PASS | sudo -S apt-get update
RUN echo $PASS | sudo -S sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
RUN echo $PASS | sudo -S apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
RUN echo $PASS | sudo -S apt update
RUN echo $PASS | sudo -S apt install -y ros-noetic-desktop-full

RUN echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
RUN bash /opt/ros/noetic/setup.bash
RUN echo $PASS | sudo -S apt install -y python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential
RUN echo $PASS | sudo -S apt install -y python3-rosdep
RUN echo $PASS | sudo -S rosdep init
RUN echo $PASS | sudo -S rosdep update
RUN echo $PASS | sudo -S apt-get install -y python3-catkin-pkg-modules
RUN echo $PASS | sudo -S apt-get install -y python3-rospkg-modules
RUN echo $PASS | sudo -S apt-get install -y python3-rospy
RUN echo $PASS | sudo -S apt install -y ros-noetic-moveit
#***********************************
CMD /bin/bash
