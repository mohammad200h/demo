import subprocess


class ContainerDeployer:
    def __init__(self):
        pass

    def deploy_container(self,name):

        base_command = "sudo docker run   -it  --name "+name
        volume_command = "-v  dockercompose_Expirements:/home/ros/hand_RL_ws/src/iiwa_pybullet_integration/Training/kuka_PPO_Algorithem7/Expirements  -v dockercompose_ExpirementRecord:/home/ros/hand_RL_ws/src/iiwa_pybullet_integration/Training/kuka_PPO_Algorithem7/ExpirementRecord"
        general_env_var_command = "-e LOCAL_USER_ID=$(id -u)"
        exp_env_var_command = "-e EXP_LIST="+"\"['exp1_noAW_state','exp2_noAW_state']\""+" -e DEVELOPMENT=False  -e PASS=ros"
        user_command =  "--user=$(id -u)"
        image_command = "dockercompose_hand_rl_ws"
        

        command = base_command+" "+volume_command+" "+" "+general_env_var_command+" "+exp_env_var_command+" "+user_command+" "+image_command
        print("command:: ",command)
        p1=subprocess.run(command,shell=True)


cd = ContainerDeployer()
cd.deploy_container("test")