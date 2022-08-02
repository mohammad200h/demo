#!/usr/bin/env python

from modelGenerator import DomainRandomization
import pybullet as p



if __name__ == '__main__':

	dr = DomainRandomization()
	dr.visual_randomization()
	dr.save_setting()
	dr.generate_model_sdf(control_mode="TH")
	dr.generate_collison_model()

	p.connect(p.GUI)
	# objects = p.loadSDF("./model_collision.sdf")
	objects = p.loadSDF("./model.sdf")
	while(1):
		
		shadowHand = objects[0]
		p.setRealTimeSimulation(1)