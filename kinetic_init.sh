
echo "installing wget...."
echo "Y"| sudo apt-get install wget
echo "downloading large files from dropbox...."
echo "downloading package compatiable with kinetic...."
echo "downloading bioIK...."
wget https://www.dropbox.com/s/9ds20dqn98ce7p4/bio_ik.zip?dl=0
echo "downloading iiwa_fri_stack...."
wget https://www.dropbox.com/s/ix5pmb96va7wtey/iiwa_fri_stack.zip?dl=0
echo "downloading shadow_dep...."
wget https://www.dropbox.com/s/0sq0mbz177md7pz/shadow_dep.zip?dl=0


echo "renaming and moving downloaded files...."
mv ./bio_ik.zip?dl=0            ./src/iiwa_pybullet_integration/bio_ik.zip
mv ./iiwa_fri_stack.zip?dl=0    ./src/iiwa_pybullet_integration/iiwa_fri_stack.zip
mv ./shadow_dep.zip?dl=0        ./src/iiwa_pybullet_integration/shadow_dep.zip




cd ./src/iiwa_pybullet_integration/

echo "unziping downloaded files..."
echo "y" | unzip bio_ik.zip
echo "y" | unzip iiwa_fri_stack.zip
echo "y" | unzip shadow_dep.zip





