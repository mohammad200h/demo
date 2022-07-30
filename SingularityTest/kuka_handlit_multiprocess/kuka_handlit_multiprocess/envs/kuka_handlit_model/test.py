#!/usr/bin/env python
import yaml
import random
import io
import subprocess
from pkg_resources import resource_string,resource_filename
import re

class regex_util():
    def __init__(self,path=None):
        if path == None :
            self.path = "./model.sdf"
            self.save_path = "./model_collision.sdf"
        else:
            self.path = path+"/model.sdf"
            self.save_path = path+"/model_collision.sdf"
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

    def save_file(self,content):
        # f = open("./model_collision.sdf","w")
        # f.close()
        print("saving file")
        with open(self.save_path,"w") as f:
            f.write(content)

# class Collsion_visulizer_model_generator():
#     def __init__(self):
#         pass



print("I am here")

re_util = regex_util()

x= re_util.remove_visual_tag_content()
x = re_util.replace_collision_tag_with_visual_tag(x)
re_util.save_file(x)