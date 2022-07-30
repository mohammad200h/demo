#!/usr/bin/env python
import yaml
import random
import io
import subprocess
from pkg_resources import resource_string,resource_filename
import re
import sys
class DomainRandomization():
    def __init__(self,path=None):
        self.re_util = regex_util(path)
        if path == None:
            self.config_path = "./config.yml"
            self.shell_path = "./modelGenerator.sh"
            self.lib_path =  ""
            self.folder_path =""
        else:
            self.config_path = path+"/adaptiveActionRepeat/hand/config.yml"
            self.shell_path = resource_filename(__name__,"/modelGenerator.sh")
            self.lib_path =  resource_filename(__name__,"")
            self.folder_path = path+"/adaptiveActionRepeat/hand"

        if self.folder_path =="":
            self.folder_path ="."
        if self.lib_path =="":
            self.lib_path ="."
        print("self.folder_path::",self.folder_path)
        print("self.lib_path::",self.lib_path)
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
   
    def get_config(self):
        return self.config_dic

    def save_setting(self,config_dic = None):
        if config_dic !=None:
            self.config_dic = config_dic
    
        
        #dump dic to file
        with io.open(self.config_path, 'w', encoding='utf8') as outfile:
            yaml.dump(self.config_dic, outfile)
    
    def launch_model_sdf(self):
        subprocess.call(['bash', self.shell_path, 'false', 'true',str(self.folder_path),str(self.lib_path)])
    def generate_model_sdf(self,control_mode="full"):
        print("Doing it..")
        print( self.folder_path)
        subprocess.call(['bash', self.shell_path, 'true', 'false',str(self.folder_path),str(self.lib_path),control_mode])
    def generateAndLaunch_model_sdf(self):
        subprocess.call(['bash', self.shell_path, 'true', 'true',str(self.folder_path),str(self.lib_path)])
    def generate_visual_represnetation_of_collision_model(self):
        """
        This will remove all the collision tags
        """
       

        x= self.re_util.remove_visual_tag_content()
        x = self.re_util.replace_collision_tag_with_visual_tag(x)
        self.re_util.save_file(x)

    def generate_collison_model(self):
  
        x= self.re_util.remove_visual_tag_content()
        x= self.re_util.make_a_copy_of_collison_tags_change_one_copy_to_visual_tag(x)
        self.re_util.save_file(x)

class regex_util():
    def __init__(self,path=None):
        if path == None :
            self.path = "./model.sdf"
            self.save_path = "./model_collision.sdf"
        else:
            self.path = path+"/adaptiveActionRepeat/hand/model.sdf"
            self.save_path = path+"/adaptiveActionRepeat/hand/model_collision.sdf"
        self.file = None 
        print("reading file")
        with open(self.path,"r") as f:
            self.file = f.read()
           
    def find_visual_tags(self):
        """
        (<visual.*?>\n)((.|\n)*?)(<\/visual>)
        """
        print("runing find_visual_tags...")
        regex = r" (<visual.*?>\n)((.|\n)*?)(<\/visual>)"
        result = re.findall(regex,self.file)
        # print(result[0])
        
        return result

    def remove_visual_tag_content(self):

        regex = r" (<visual.*?>\n)((.|\n)*?)(<\/visual>)"
        
        cleaned_text =  re.sub(regex,"",self.file)           

        return cleaned_text

    def replace_collision_tag_with_visual_tag(self,content):
        
        regex_open_tag  = r"<collision"
        regex_close_tag = r"<\/collision>"
        cleaned_text =  re.sub(regex_open_tag,"<visual",content)
        cleaned_text = re.sub(regex_close_tag,"</visual>",cleaned_text)

        return cleaned_text
    def make_a_copy_of_collison_tags_change_one_copy_to_visual_tag(self,content):
        new_content = content
        
        regex = r"(<collision.*?>\n)((.|\n)*?)(<\/collision>)"
        matches = re.findall(regex,new_content) 
      
        for  match in matches:  
            string_match = "".join(match)
            collision_text = string_match
            visual_text = re.sub(r"collision","visual",string_match)
            new_text= visual_text+"\n"+collision_text
            print("collision_text",collision_text)
            print("visual_text",visual_text)
            print("new_text",new_text)
            match_regex = re.compile(string_match)

            new_content = re.sub(match_regex,new_text,new_content)
           

        return new_content   

    def save_file(self,content):
   
        print("saving file")
        with open(self.save_path,"w") as f:
            f.write(content)



