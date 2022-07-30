#!/usr/bin/env python
import yaml
import random
import io
import subprocess
from pkg_resources import resource_string,resource_filename
import os
import sys
class GhraspPhase_vsulizer():
    def __init__(self,path=None):
        print("AW_vsulizer::path::",path)
        if path == None:
            self.config_path = "./config.yml"
            self.shell_path = "./modelGenerator.sh"
            self.lib_path =  ""
            self.folder_path =""
        else:
            self.config_path = path+"/GraspPhase_model/config.yml"
            self.shell_path = resource_filename(__name__,"/modelGenerator.sh")
            self.folder_path = path+"/GraspPhase_model"
        
        if self.folder_path =="":
            self.folder_path ="."
        print("self.folder_path::",self.folder_path)
        # sys.exit()
        with open(self.config_path, 'r') as stream:
            try:
                self.config_dic = yaml.safe_load(stream)
            except yaml.YAMLError as exc:
                print(exc) 
    

    def set_poition(self,position):

        config_dic_copy = self.config_dic
        config_dic_copy["position"] = position
        self.config_dic = config_dic_copy
        self.save_setting()

    def set_dimention(self,dim = {"radius":0.1}):
        config_dic_copy = self.config_dic
        config_dic_copy["radius"] = dim["radius"]
        self.config_dic = config_dic_copy
        self.save_setting()

    def get_config():
        return self.config_dic

    def save_setting(self,config_dic = None):
        if config_dic !=None:
            self.config_dic = config_dic
    
        
        #dump dic to file
        with io.open( self.config_path, 'w', encoding='utf8') as outfile:
            yaml.dump(self.config_dic, outfile)
    
    def launch_model_sdf(self):
        subprocess.call(['bash', self.shell_path, 'false', 'true',str(self.folder_path)])
    def generate_model_sdf(self):
        print("Doing it..")
        print( self.folder_path)
        subprocess.call(['bash', self.shell_path, 'true', 'false',str(self.folder_path)])
    def generateAndLaunch_model_sdf(self):
        subprocess.call(['bash', self.shell_path, 'true', 'true',str(self.folder_path)])



# dr = GhraspPhase_vsulizer()
# dr.set_poition([0.0,0.0,0.3])



# dr.generate_model_sdf()

