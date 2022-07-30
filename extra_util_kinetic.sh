f
#installing vscode
sudo dpkg -i code_1.36.1-1562627527_amd64.deb
echo "y"|sudo apt-get -f install

#instaling ssh
echo "y" |sudo apt-get install ssh

#installing ssh server
sudo apt-get install openssh-server

#installing ifconfig
sudo apt-get install net-tools


#ROS
echo "y" |sudo -S  apt-get install ros-kinetic-ros-control ros-kinetic-ros-controllers 

sudo apt-get install -y ros-kinetic-control-toolbox

echo "y" |sudo -S apt-get install ros-kinetic-moveit
sudo apt-get install -y ros-kinetic-perception
sudo apt install -y libgazebo7-dev


echo "y" |sudo -S apt-get install graphicsmagick-libmagick-dev-compat

sudo -S pip install pyyaml

echo "y" |sudo apt install -y ros-kinetic-ethercat-grant

sudo apt-get install -y libcap-dev

sudo apt-get install -y binutils-dev

echo "y" |sudo apt-get install libnlopt-dev

sudo apt-get install -y swig

sudo pip3 install --upgrade pip
sudo pip3 install opencv-python

sudo pip3 install rospkg catkin_pkg
sudo apt-get install -y python3-tk

sudo pip3 install slacker

sudo pip3 install schedule

sudo pip3 install PyYAML

sudo pip3 install matplotlib
sudo pip3 install  Pillow

sudo pip3 install open3d==0.9
sudo apt-get update
sudo apt-get install -y libstdc++6
sudo add-apt-repository ppa:ubuntu-toolchain-r/test
sudo apt-get update
sudo apt-get install -y gcc-4.9
sudo apt-get upgrade libstdc++6


echo "Y"|sudo apt-get install git build-essential cmake python3-pip checkinstall
echo "Y"|sudo apt-get install python3-empy python3-nose libgtest-dev 
sudo apt-get install -y ros-kinetic-catkin python-catkin-tools 

sudo pip3 install enum34


# terminator
echo "y" |sudo apt install libcanberra-gtk-module libcanberra-gtk3-module
sudo apt-get install -y wget
cd 
mkdir -p ~/.config/terminator
touch ~/.config/terminator/config

# tilix
sudo add-apt-repository ppa:webupd8team/terminix -y
sudo apt update
sudo apt install terminix -y

sudo apt-get install -y ros-kinetic-trac-ik


sudo pip3 install  namegenerator


sudo pip3 install h5py
sudo python -m pip install h5py


sudo python -m pip install pandas

sudo python -m pip install tables

sudo apt-get install -y libproj-dev