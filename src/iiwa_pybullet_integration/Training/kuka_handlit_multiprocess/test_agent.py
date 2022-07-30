import gym
import kuka_handlit_multiprocess
from kuka_handlit_multiprocess.envs.kuka_handlitGymEnv import AW_process

awp=AW_process()
def random_agent(episodes=100):
	env = gym.make("kuka_handlit_multiprocess-v0",
					render=True,
					timeStep=1/100,
					AW_mode=1,
					AW_process=awp
	)
	while(1):
		env.reset()
		env.step(env.action_space.sample())
	

if __name__ == "__main__":
    random_agent()
