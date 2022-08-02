USER=mamad 
UID=1000
GID=1000

# echo $USER
# echo $UID
# echo $GID

# cd DockerFile
# echo "buiding DockerFile..."
# sudo docker build --build-arg UNAME=$USER --build-arg UID=$UID --build-arg GID=$GID -t nvidia_docer2_kinetic:ros .

echo "buiding DockerFile_TF..."
# # cd ..
cd DockerFile_TF
sudo docker build --build-arg UNAME=$USER --build-arg UID=$UID --build-arg GID=$GID -t nvidia_docer2_kinetic:TF .

# echo "buiding DockerFile_TF2..."
# cd ..
# cd DockerFile_TF2
# sudo docker build --build-arg UNAME=$USER --build-arg UID=$UID --build-arg GID=$GID -t nvidia_docer2_kinetic:TF2 .

# echo "buiding DockerFile_tensorflow_pytorch..."
# cd ..
# cd DockerFile_tensorflow_pytorch
# sudo docker build --build-arg UNAME=$USER --build-arg UID=$UID --build-arg GID=$GID -t nvidia_docer2_kinetic:pytorch .

