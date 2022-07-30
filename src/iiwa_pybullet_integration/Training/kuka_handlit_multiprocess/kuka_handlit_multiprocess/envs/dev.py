from kuka_handlitGymEnv import Kuka_HandlitGymEnv
from kuka_handlitGymEnv import AW_process

awp=AW_process()
env = Kuka_HandlitGymEnv(render=True,timeStep=1/100,AW_mode=1,AW_process=awp)

while(1):
    action = env.action_space.sample()
    env.step(action)