#!/usr/bin/env python
import yaml
import random
import io
import subprocess
from pkg_resources import resource_string,resource_filename
import os
print("\n\n")
print("modelGenerator::path:",os.path.abspath(os.getcwd()))
print(" resource_filename(__name__)", resource_filename(__name__,""))
print("\n\n")
class DomainRandomization():
    def __init__(self,path=None):
        print("path:: ",path)
        if path == None:
            self.config_path = resource_filename(__name__,"")+"/config.yml"
            self.shell_path  = resource_filename(__name__,"")+"/modelGenerator.sh"
            self.lib_path    =  resource_filename(__name__,"")
            self.folder_path =  resource_filename(__name__,"")
            print("\n\n")
            print("self.config_path::",self.config_path)
            print("\n\n")
        else:
            self.config_path = path+"/adaptiveActionRepeat/kuka/config.yml"
            self.shell_path = resource_filename(__name__,"/modelGenerator.sh")
            self.lib_path =  resource_filename(__name__,"")
            self.folder_path = path+"/kuka"
        with open(self.config_path, 'r') as stream:
            try:
                self.config_dic = yaml.safe_load(stream)
            except yaml.YAMLError as exc:
                print(exc) 
    

    def visual_randomization(self):
        """
        randomize the color values:
            ambient
            diffuse
            specular
        """
        def color_randomizer():
            color = [0,0,0,1]
            for i in range(len(color)-1):
                color[i]  = random.uniform(0, 1)
            return color
    
        config_dic_copy = self.config_dic
        for hand_part,_ in self.config_dic.items():
            links = self.config_dic[hand_part]["Links"]
            for link,_ in links.items():
                #print(link)
                #print(config_dic_copy[hand_part]["Links"][link]["color"]["ambient"])
                if link !="thhub":
                    config_dic_copy[hand_part]["Links"][link]["color"]["ambient"]  = color_randomizer()
                    config_dic_copy[hand_part]["Links"][link]["color"]["diffuse"]  = color_randomizer()
                    config_dic_copy[hand_part]["Links"][link]["color"]["specular"] = color_randomizer()
        self.config_dic = config_dic_copy

    def physic_prop_randomizer(self,damping_limit =[0.1-0.01,0.1+0.1],friction_limit=[0,0+0.01]):
        """
        changes damping and friction 
            input: 
                -damping_limit  = [lower_limit,upper_limit]
                -friction_limit = [lower_limit,upper_limit]
        """
        def damping_randomizer(damping_limit):
            return random.uniform(damping_limit[0],damping_limit[1])
        def friction_randomizer(friction_limit):
            return random.uniform(friction_limit[0],friction_limit[1])
        
        config_dic_copy = self.config_dic
        for hand_part,_ in self.config_dic.items():
            links = self.config_dic[hand_part]["Links"]
            for link,_ in links.items():
                #print(link)
                #print(config_dic_copy[hand_part]["Links"][link]["color"]["ambient"])
                if link !="forearm":
                    config_dic_copy[hand_part]["Links"][link]["joint"]["damping"]  = damping_randomizer(damping_limit)
                    config_dic_copy[hand_part]["Links"][link]["joint"]["friction"] = friction_randomizer(friction_limit)
       
        self.config_dic = config_dic_copy
   
    def get_config():
        return self.config_dic

    def save_setting(self,config_dic = None):
        if config_dic !=None:
            self.config_dic = config_dic
    
        
        #dump dic to file
        with io.open(self.config_path, 'w', encoding='utf8') as outfile:
            yaml.dump(self.config_dic, outfile)
    def launch_model_sdf(self):
        subprocess.call(['bash', './modelGenerator.sh', 'false', 'true'])
    def generate_model_sdf(self):
        print("Doing it..")
        print( self.folder_path)
        subprocess.call(['bash', self.shell_path, 'true', 'false',str(self.folder_path),str(self.lib_path)])
    def generateAndLaunch_model_sdf(self):
        subprocess.call(['bash', './modelGenerator.sh', 'true', 'true'])



# dr = DomainRandomization()
# dr.visual_randomization()
#dr.physic_prop_randomizer()
# dr.save_setting()

#dr.launch_model_sdf()
#dr.generate_model_sdf()
# dr.generateAndLaunch_model_sdf()
