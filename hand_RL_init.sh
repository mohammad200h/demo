
echo "installing wget...."
echo "Y"| sudo apt-get install wget
echo "downloading large files from dropbox...."

echo "downloading cuda11.2...."
wget https://www.dropbox.com/s/uw2dm2jz4552wak/cuda11.2.zip?dl=0

echo "downloading drivers...."
wget https://www.dropbox.com/s/9222m379ym72vzu/driverFiles.zip?dl=0


echo "renaming downloaded files...."
mv ./cuda11.2.zip?dl=0 cuda11.2.zip
mv ./driverFiles.zip?dl=0 driverFiles.zip




echo "unziping downloaded files..."
echo "y" | unzip cuda11.2.zip

echo "y" | unzip driverFiles.zip



# copying files to appropriate docker folder

cp -R cuda11.2 ./DockerFile_TF/

cp -R cuda11.2 ./SingularityTest/
cp -R driverFiles ./SingularityTest/




