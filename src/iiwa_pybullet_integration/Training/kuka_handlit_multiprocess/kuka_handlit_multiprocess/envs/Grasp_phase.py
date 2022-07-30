import pybullet as p



try:
  from GraspPhase_model import GhraspPhase_vsulizer
except:
  from GraspPhase_model.modelGenerator import GhraspPhase_vsulizer



class GraspPhase():
  def __init__(self,obsObject,objectDim,radius,obj_initial_pos,physic_engine):
    self.obs_obj = obsObject
    self.objectDim = objectDim
    self.obj_height =None
    self.radius = radius
    self._p = physic_engine
    self.path = None

    self.visual_id = None
    self.model_id = None

    self.create_model()
    self.load_model(obj_initial_pos)
    self.orn = list(p.getBasePositionAndOrientation(self.model_id))
    self.orn = self.orn[3:]
    

  def create_model(self):
 

      self.visual_id =self._p.createVisualShape(shapeType=p.GEOM_SPHERE,
                                    rgbaColor=[0.5, 0.8, 0.8, 0.3],
                                    specularColor=[0.4, .4, 0],
                                    radius = self.radius
                                    )

  def load_model(self,obj_initial_pos):
      adjusted_pos = obj_initial_pos[:]
      adjusted_pos[2] =0.65 #2cm added to height
      self.model_id=self._p.createMultiBody(baseMass=0,
                      baseVisualShapeIndex=self.visual_id,
                      basePosition=adjusted_pos,
                      useMaximalCoordinates=0)
 

  
  def update_model_pos(self,pos):


    orn = self.orn
    adjusted_pos= pos
    adjusted_pos[2]=0.65
    print("orn:: ",orn)
    print("adjusted_pos:: ",adjusted_pos)
    self._p.resetBasePositionAndOrientation(self.model_id,adjusted_pos,orn)
    
  
  def is_graspPhase(self):
    pure_obs = self.obs_obj.pure_obs()
    palm_xyzrpy = pure_obs['hand']['xyz_rpy']["palm"]
    cube_xyzrpy = pure_obs["cube"]
 
    # self.update_model_pos(cube_xyzrpy[:3])

    dist_x = abs(palm_xyzrpy[0]-cube_xyzrpy[0])
    dist_y = abs(palm_xyzrpy[1]-cube_xyzrpy[1])
    dist_z = abs(palm_xyzrpy[2]-cube_xyzrpy[2])

    dist = [dist_x,dist_y,dist_z]

   
    # print("dist::",dist)
    # print("self.obj_height::",self.obj_height)

    for i,d in enumerate(dist):
      if i <2:
        index =0
      else:
        index =1

      # print("index::",index)
      # print("self.initial_r[index]::",self.initial_r[index])
      # print("dist::",dist)

      if (d >self.radius):
          return False
      else:
          continue
    return True

  

