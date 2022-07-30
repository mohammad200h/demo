rm -R ./kuka_handlit
rm -R ./kuka_PPO_Algorithem7
rm -R ./cuda9.2
rm -R ./cuda10.0
rm -R ./cuda10.1
rm -R ./cuda11.2
rm -R ./kuka_handlit_multiprocess
rm -R ./sb_3

cp -R /home/mamad/hand_RL_ws/src/iiwa_pybullet_integration/Training/kuka_handlit ./kuka_handlit
cp -R /home/mamad/hand_RL_ws/src/iiwa_pybullet_integration/Training/kuka_PPO_Algorithem7 ./kuka_PPO_Algorithem7
cp -R /home/mamad/hand_RL_ws/src/iiwa_pybullet_integration/Training/kuka_handlit_multiprocess ./kuka_handlit_multiprocess
cp -R /home/mamad/hand_RL_ws/src/iiwa_pybullet_integration/Training/sb_3 ./sb_3

cp -R /home/mamad/hand_RL_ws/driverFiles  ./driverFiles
cp -R /home/mamad/hand_RL_ws/cuda9.2  ./cuda9.2
cp -R /home/mamad/hand_RL_ws/cuda10.0 ./cuda10.0
cp -R /home/mamad/hand_RL_ws/cuda10.1 ./cuda10.1
cp -R /home/mamad/hand_RL_ws/cuda11.2 ./cuda11.2