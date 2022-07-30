
echo "installing wget...."
echo "Y"| sudo apt-get install wget
echo "downloading large files from dropbox...."
echo "downloading cuda9.2...."
wget https://www.dropbox.com/s/sj23msz24vk78wg/cuda9.2.zip?dl=0
echo "downloading cuda10.0...."
wget https://www.dropbox.com/s/r9r2cm0vq9ilwy7/cuda10.0.zip?dl=0
echo "downloading cuda10.1...."
wget https://www.dropbox.com/s/4l7kexlvptpw9o4/cuda10.1.zip?dl=0
echo "downloading cuda10.2...."
wget https://www.dropbox.com/s/qejjxtyrpbpvrdz/cuda10.2.zip?dl=0
echo "downloading cuda11.2...."
wget https://www.dropbox.com/s/uw2dm2jz4552wak/cuda11.2.zip?dl=0

echo "downloading drivers...."
wget https://www.dropbox.com/s/9222m379ym72vzu/driverFiles.zip?dl=0


echo "renaming downloaded files...."
mv ./cuda9.2.zip?dl=0 cuda9.2.zip
mv ./cuda10.0.zip?dl=0 cuda10.0.zip
mv ./cuda10.1.zip?dl=0 cuda10.1.zip
mv ./cuda10.2.zip?dl=0 cuda10.2.zip
mv ./cuda11.2.zip?dl=0 cuda11.2.zip
mv ./driverFiles.zip?dl=0 driverFiles.zip




echo "unziping downloaded files..."
echo "y" | unzip cuda9.2.zip
echo "y" | unzip cuda10.0.zip
echo "y" | unzip cuda10.1.zip
echo "y" | unzip cuda10.2.zip
echo "y" | unzip cuda11.2.zip
echo "y" | unzip driverFiles.zip



# copying files to appropriate docker folder
cp -R cuda9.2 ./DockerFile/
cp -R cuda10.2 ./DockerFile/

cp -R cuda11.2 ./DockerFile_tensorflow_pytorch/

cp -R cuda9.2 ./DockerFile_TF/

cp -R driverFiles ./SingularityTest/




