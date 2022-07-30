
class ActionRepeatDecay():
  def __init__(self,
               total_training_steps,
               decay_mode="stair_case",
               param={}
              ):
    self.param = param
    self.staring_portion = 100
    self.total_training_steps = total_training_steps
    self.decay_mode = decay_mode
    self.new_portion =100

    self._success_record={
      "count":0,
      "current_decay":1
    }
  
  def stair_case(self,action_repeat,current_training_step):
    #This does not depend on how often the agent succeded it depends on currrent training step
    new_action_repeat = None
   
    #check param dic has the right keys
    if self.check_if_keys_are_correct_stair_case():
      threshold = self.param["decay_portion"]/self.staring_portion*self.total_training_steps
      # print("threshold:: ",threshold)
      # print("current_training_step % threshold:: ",current_training_step % threshold)
      if current_training_step % threshold ==0:
        self.new_portion =self.staring_portion-self.param["decay_portion"]*current_training_step / threshold

      new_action_repeat = action_repeat* self.new_portion/self.staring_portion

      # print("action_repeat:: ",action_repeat)
      # print("self.new_portion:: ",self.new_portion)
      # print("new_action_repeat:: ",new_action_repeat)
      return new_action_repeat
    else: 
      #It should raise an error saying wrong parameters where set for decay
      return False


  def get_decay_on_success(self,action_repeat):
    """
    get action repeat with current decay applied
    """
    #check param dic has the right keys
    if self.check_if_keys_are_correct_decay_on_success():
      decay = self._success_record["current_decay"]
      if decay >0:
        return action_repeat*decay
      else:
        return 1 #No action repreat
       
    else:
      #Todo: raise an error for wrong key
       return False
    

  def update_decay_on_success(self):
    self._success_record["count"] +=1

    if self._success_record["count"] == self.param["success_threshold"]: # The agent has succeded enough with the current action repeate 
      #increase action repeate decay
      if self._success_record["current_decay"] >0.2:
     
        self._success_record["current_decay"] -= self.param["decay_portion"]
      else:
    
        self._success_record["current_decay"] = 0

      self._success_record["count"]=0
    
  
  #utility functions
  def check_if_keys_are_correct_stair_case(self):
    keys = self.param.keys()
    if len(keys)> 0:
      if "decay_portion" in keys:
        return True

    return False

  def check_if_keys_are_correct_decay_on_success(self):
    keys = self.param.keys()
    if len(keys)> 0:
      if "success_threshold" in keys and "decay_portion" in keys:
        return True

    return False

  def get_keys_for_stair_case(self):
    keys_dic = {
      "decay_portion": "This is protion of 100% \nthat will cause the stair case reduction.\
       \nThis given in term of percentage"
    }

    return keys_dic


  
  
