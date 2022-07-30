USER=mamad 
UID=1000
GID=1000


echo "buiding DockerFile_TF_Swarm..."
cd DockerFile_TF_Swarm
sudo docker build --build-arg UNAME=$USER --build-arg UID=$UID --build-arg GID=$GID -t nvidia_docer2_kinetic:TFSwarm .





