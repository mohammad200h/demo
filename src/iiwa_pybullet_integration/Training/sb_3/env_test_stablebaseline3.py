import gym

from stable_baselines3 import PPO


# import torch
# print(torch.__version__)

env = gym.make('MountainCar-v0')

model = PPO('MlpPolicy', env, verbose=1)
model.learn(total_timesteps=100)

obs = env.reset()
for i in range(1000):
    print("runing loop")
    action, _states = model.predict(obs, deterministic=True)
    print("action:: ",action)
    print("_states:: ",_states)
    # print("sample_action::",env.action_space.sample())
    obs, reward, done, info = env.step(action)
    env.render()
    if done:
      obs = env.reset()

    print("i:: ",i)
    print("obs:: ",obs)
env.close()

print("program ended successfully")