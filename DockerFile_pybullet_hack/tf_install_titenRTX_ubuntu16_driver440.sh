sudo apt-get install unzip
echo "y" | unzip cuda9.2.zip
cd cuda9.2
cd cuda/ && sudo cp -P lib64/* /usr/local/cuda/lib64/ && sudo cp -P include/* /usr/local/cuda/include/

pwd

cd ..

sudo dpkg -i libcudnn7_7.6.5.32-1+cuda9.2_amd64.deb 
sudo dpkg -i libcudnn7-dev_7.6.5.32-1+cuda9.2_amd64.deb

pip install --upgrade pip==9.0.1

echo "\u000A" |sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt-get update
echo "y" | sudo apt-get install python3.6
echo "y" | sudo apt-get install python3-pip

echo "y"|sudo apt install cuda-toolkit-9-0



sudo pip3 install --upgrade pip==9.0.1

sudo  pip3 install tensorflow-gpu==1.14.0


echo "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda-9.0/lib64/" >> ~/.bashrc
'
---------------------Errors and Solutions------------------------
Error one: 
W tensorflow/stream_executor/platform/default/dso_loader.cc:55] 
Could not load dynamic library "libcudart.so.10.1"; dlerror: libcudart.so.10.1: 
cannot open shared object file: No such file or directory; 
LD_LIBRARY_PATH: :/usr/local/cuda-10.0/lib64/


solution:
echo "y"  | sudo apt install cuda-toolkit-10-1

echo "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda-10.1/lib64/" >> ~/.bashrc


'



