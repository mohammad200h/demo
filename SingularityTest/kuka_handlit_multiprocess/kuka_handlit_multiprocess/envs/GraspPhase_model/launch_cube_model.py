#!/usr/bin/env python

import pybullet as p



if __name__ == '__main__':
	p.connect(p.GUI)	
	objects = p.loadSDF("./model.sdf")
	

	while(1):
		cube = objects
		p.setRealTimeSimulation(1)
		
