FROM nvidia_docer2_kinetic:devel101
#****************Setting up user *********************
ARG UNAME=ros
ARG PASS=ros
ARG UID=1000
ARG GID=1000

#************************************setting python version**************************
RUN echo $PASS| sudo -S echo "fuck me!"
RUN echo "\u000A" |sudo -s add-apt-repository ppa:deadsnakes/ppa
RUN $PASS|sudo -s apt-get update
RUN echo "y" | sudo apt-get install python3.6
RUN echo "y" | sudo apt-get install python3-pip

RUN echo $PASS| sudo -S echo "fuck me3!"
# RUN echo $PASS|sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.5.1
# RUN echo $PASS|sudo update-alternatives  --set python3  /usr/bin/python3.6
RUN echo $PASS|sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 1
#***********************************Installing TF*************************
RUN echo $PASS| sudo -S echo "fuck me!"
RUN $PASS|sudo -s apt-get update
COPY cuda10.2 /tmp

COPY cuda10.2/cuda/lib64/* /usr/local/cuda/lib64/

COPY cuda10.2/cuda/include/* /usr/local/cuda/include/


RUN echo $PASS | sudo -S echo "fuck meèee!"
RUN echo $PASS|sudo -s dpkg -i /tmp/libcudnn8_8.0.5.39-1+cuda10.2_amd64.deb
RUN echo $PASS|sudo -s dpkg -i /tmp/libcudnn8-dev_8.0.5.39-1+cuda10.2_amd64.deb

RUN pip install --upgrade pip==20.2.4

RUN echo $PASS | sudo -S echo "fuck mee!"

RUN $PASS|sudo -s apt-get update



RUN echo "y"|sudo -S apt install cuda-toolkit-10-1
RUN echo "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda-10.2/lib64/" >> ~/.bashrc

RUN echo $PASS| sudo -S echo "fuck mee!"
RUN echo $PASS| sudo -s pip3 install --upgrade pip==20.2.4

RUN echo $PASS| sudo -S pip3 install setuptools==44.0.0
RUN echo $PASS| sudo -S pip3 install --ignore-installed  enum34
RUN echo $PASS| sudo -S pip3 install --ignore-installed  pyasn1-modules
RUN echo $PASS| sudo -S echo "fuck mee3!"



RUN echo "y"|sudo -S apt-get install -y --no-install-recommends libnvinfer6=6.0.1-1+cuda10.2 \
    libnvinfer-dev=6.0.1-1+cuda10.2 \
    libnvinfer-plugin6=6.0.1-1+cuda10.2



#********************Installing pytorch***************
RUN echo $PASS | sudo -S sudo pip3  install torch torchvision

#*****************************************************
RUN echo $PASS | sudo -S echo "fuck mee!"

RUN echo "y" | sudo apt-get install python3 python-dev python3-dev \
     build-essential libssl-dev libffi-dev \
     libxml2-dev libxslt1-dev zlib1g-dev \
     python3-pip

RUN echo $PASS| sudo -s pip3 install pybullet
RUN echo $PASS| sudo -s pip install pybullet

#**********************************************************************************
CMD /bin/bash
