
echo "installing wget...."
echo "Y"| sudo apt-get install wget
echo "downloading large files from dropbox...."
echo "downloading package compatiable with kinetic...."
echo "downloading bioIK...."
wget https://www.dropbox.com/s/c02v10khqieaqic/bio_ik.zip?dl=0
echo "downloading iiwa_fri_stack...."
wget https://www.dropbox.com/s/c678chrug10x1z6/iiwa_fri_stack.zip?dl=0
echo "downloading shadow_dep...."
wget https://www.dropbox.com/s/w09cvoqgx5ly5qy/shadow_dep.zip?dl=0
echo "downloading AW2...."
wget https://www.dropbox.com/s/3jfd5jep0ej3uhf/AW2.zip?dl=0
echo "downloading pybulletIK...."
wget https://www.dropbox.com/s/0hfualwnr9v84ar/pybullet_ik.zip?dl=0


echo "renaming and moving downloaded files...."
mv ./bio_ik.zip?dl=0            ./src/iiwa_pybullet_integration/bio_ik.zip
mv ./iiwa_fri_stack.zip?dl=0    ./src/iiwa_pybullet_integration/iiwa_fri_stack.zip
mv ./shadow_dep.zip?dl=0        ./src/iiwa_pybullet_integration/shadow_dep.zip
mv ./AW2.zip?dl=0               ./src/iiwa_pybullet_integration/AW2.zip
mv ./pybullet_ik.zip?dl=0               ./src/iiwa_pybullet_integration/pybullet_ik.zip



cd ./src/iiwa_pybullet_integration/

echo "unziping downloaded files..."
echo "y" | unzip bio_ik.zip
echo "y" | unzip iiwa_fri_stack.zip
echo "y" | unzip shadow_dep.zip
echo "y" | unzip AW2.zip
echo "y" | unzip pybullet_ik.zip





