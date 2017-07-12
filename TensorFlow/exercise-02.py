import gym
import time

env = gym.make('CartPole-v0')

for i in range(30):
	observation = env.reset()
	for _ in range(100):
		env.render()
		print observation
		# 1 is right
		ac = env.action_space.sample()
		observation, reward, done, info = env.step(ac)
		if done:
			print 'finished after ', _ + 1, 'steps'
			time.sleep(0.05)
			break

