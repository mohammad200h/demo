# installing python 3
echo "\u000A" |sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt-get update
echo "y" |sudo apt-get install python3.6
sudo apt-get install python3-pip


# installing pybullet
sudo apt-get update
echo "y" | sudo apt-get install python3 python-dev python3-dev \
     build-essential libssl-dev libffi-dev \
     libxml2-dev libxslt1-dev zlib1g-dev \
     python3-pip

sudo pip3 install pybullet
sudo pip install pybullet
