#!/usr/bin/env python

from modelGenerator import DomainRandomization
import pybullet as p



if __name__ == '__main__':

	dr = DomainRandomization()
	dr.visual_randomization()
	dr.save_setting()
	dr.generate_model_sdf()
	dr.generate_collison_model()

	p.connect(p.GUI)
	objects = p.loadSDF("./model_collision.sdf")
	robot_id = objects[0]
	joints_state = []
	for i in range(23):
		joints_state.append(p.getJointState(robot_id,i))
	print("joints_state:: ",joints_state)
	while(1):
		
		
		p.setRealTimeSimulation(1)
