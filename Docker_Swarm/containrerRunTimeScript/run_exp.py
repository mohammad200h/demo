import io
import subprocess
import json
import os 
import ast
import multiprocessing
import sys

class NotEnoughResourses(Exception):
    def __init__(self):
        super().__init__("There is not enough cores for experiemnts to run")

class ExpirementRunner():
    def __init__(self,num_repeats,dev=True,num_cores=8):
        
        print("dev:: ",dev)
        print("type::",type(ast.literal_eval(dev)))
        self.num_cores = int(num_cores)
        self.expirement_folder = None
        self.expirementRecord_folder = None
        self.shell_path = None
        self.jobList_path = None
        self.stateMachine_path = None
        self.dev= ast.literal_eval(dev)
        self.stateMachine=None
        self.num_repeats =  num_repeats
        self.there_is_a_expirement_record_file_flag =False
        self.record_dic = {}
        if self.dev:
            self._set_to_developmont_mode()
        else:
            self._set_to_deploy_mode()
        if self.stateMachine ==None:
            if self._expirmeent_record_folder_exitst() and not self.is_folder_empty(self.expirementRecord_folder):
                self._load_state_machine()
            else:
                #copy content into expirement record
                self._initalize_expiremmt_record()
                self._load_state_machine()
        if not self.stateMachine["initalized_expirment_for_all_containers"]:
            print("initalized_expirment_for_all_containers::False")
            self._intialize_job()
            self._initalize_otherthings()
        else:
            self._add_job()
            print("initalized_expirment_for_all_containers::True")

    def _expirmeent_record_folder_exitst(self):
        flag = os.path.isdir(self.expirementRecord_folder)
        print("flag:: ",flag)
        return flag

    def _set_to_developmont_mode(self):
        username =self.get_username()
        self.expirement_folder = "/home/"+username+"/hand_RL_ws/src/iiwa_pybullet_integration/Training/kuka_PPO_Algorithem7/Expirements/" 
        self.expirementRecord_folder ="/home/"+username+"/hand_RL_ws/src/iiwa_pybullet_integration/Training/kuka_PPO_Algorithem7/ExpirementRecord"
        self.shell_path = "/home/"+username+"/hand_RL_ws/Docker_Swarm/containrerRunTimeScript/run_exp.sh"  
        self.jobList_path ="/home/"+username+"/hand_RL_ws/src/iiwa_pybullet_integration/Training/kuka_PPO_Algorithem7/ExpirementRecord/jobsState.json" 
        self.stateMachine_path = "/home/"+username+"/hand_RL_ws/src/iiwa_pybullet_integration/Training/kuka_PPO_Algorithem7/ExpirementRecord/stateMachine.json"

    def _set_to_deploy_mode(self):
        username =self.get_username()
        self.expirement_folder = "/home/"+username+"/hand_RL_ws/src/iiwa_pybullet_integration/Training/kuka_PPO_Algorithem7/Expirements/" 
        self.expirementRecord_folder ="/home/"+username+"/hand_RL_ws/src/iiwa_pybullet_integration/Training/kuka_PPO_Algorithem7/ExpirementRecord" 
        self.shell_path = "/home/"+username+"/hand_RL_ws/Docker_Swarm/containrerRunTimeScript/run_exp.sh"
        self.jobList_path ="/home/"+username+"/hand_RL_ws/src/iiwa_pybullet_integration/Training/kuka_PPO_Algorithem7/ExpirementRecord/jobsState.json" 
        self.stateMachine_path = "/home/"+username+"/hand_RL_ws/src/iiwa_pybullet_integration/Training/kuka_PPO_Algorithem7/ExpirementRecord/stateMachine.json"

    def _load_state_machine(self):
        print("loading state machine::called")
        f= open(self.stateMachine_path)
        data = json.load(f)
        self.stateMachine = data
    
    def _save_state_machine(self):
         with open(self.stateMachine_path, "w") as outfile:
                json_object = json.dumps(self.stateMachine,indent = 4)
                outfile.write(json_object)

    def _initalize_otherthings(self):
        self.path_to_Trainig = "~/hand_RL_ws/src/iiwa_pybullet_integration/Training/"
        self.get_ownership_of_folder(self.path_to_Trainig)
    
    def _add_job(self):
        print("_add_job::called")
        #make copy of expirement folder
        exp_to_run=self._add_expirement_folder()
        self._add_exps_to_jobList(exp_to_run)
        
    def _intialize_job(self):
        print("_intialize_job::called") 
        #make copys of expirement folder
        print("intializing expirement_folder")
        exp_to_run=self._initalize_expirement_folder()
        if self.is_folder_empty():
            self.stateMachine["error"]=True
            self._save_state_machine()
        else:
            #cleaning the jobList
            self._clean_JobList()
            #adding exps to jobList
            print("adding exps to job list")
            self._add_exps_to_jobList(exp_to_run)
            self.stateMachine["initalized_expirment_for_all_containers"]=True
            self._save_state_machine()

    def _clean_JobList(self):
        print("cleaning jobList::called")
        f= open(self.jobList_path)
        data = json.load(f)

        data["jobList"] =[]
        data["runingJobs"] = []

        with open(self.jobList_path, "w") as outfile:
                json_object = json.dumps(data,indent = 4)
                outfile.write(json_object)

    def _add_exps_to_jobList(self,exp_to_run):
        f= open(self.jobList_path)
        data = json.load(f)
        print("_add_exps_to_jobList::exp_to_run:: ",exp_to_run)
        print("_add_exps_to_jobList::data[jobList]:: ",data["jobList"])
        for exp in exp_to_run:
            if not exp in data["jobList"]:
                data["jobList"] +=[exp]
     
        with open(self.jobList_path, "w") as outfile:
                json_object = json.dumps(data,indent = 4)
                outfile.write(json_object)

    def _add_expirement_folder(self):
        print("_add_expirement_folder::called")
        expirments_to_run = []
        #copy empty expirment to volume if the volum is empty
        env_variable_list = os.environ['EXP_LIST']
        exp_repeat_variable_list = os.environ['EXP_LIST_REPEAT']
        print("env_variable_list:: ",env_variable_list)
        print("exp_repeat_variable_list:: ",exp_repeat_variable_list)
        #exp_list = json.loads(env_variable_list)
        exp_list = ast.literal_eval(env_variable_list)
        exp_repeat_list = ast.literal_eval(exp_repeat_variable_list)
        print("\n\n")
        print("exp_list:: ",exp_list)
        print("exp_list::type:: ",type(exp_list))        
        print("\n\n")
        src  =  "~/hand_RL_ws/EmptyExpirementFolders/ALL/"
        dist =  "~/hand_RL_ws/src/iiwa_pybullet_integration/Training/kuka_PPO_Algorithem7/Expirements/"
        
        for repeat,exp in zip(exp_repeat_list,exp_list):
            for i in range(repeat):
                name = exp+"_"+str(i+1)
                if not self.is_exp_already_runing(name):
                   expirments_to_run.append(name)

        if self.is_there_resourses_for_exps(len(expirments_to_run)):            
            return expirments_to_run
        else:
            raise NotEnoughResourses()

    def _initalize_expirement_folder(self):
        print("_initalize_expirement_folder::called")
        expirments_folder_created = []
        #copy empty expirment to volume if the volum is empty
        env_variable_list = os.environ['EXP_LIST']
        exp_repeat_variable_list = os.environ['EXP_LIST_REPEAT']
        print("env_variable_list:: ",env_variable_list)
        
        #exp_list = json.loads(env_variable_list)
        exp_list = ast.literal_eval(env_variable_list)
        exp_repeat_list = ast.literal_eval(exp_repeat_variable_list)
        print("\n\n")
        print("exp_list:: ",exp_list)
        print("exp_list::type:: ",type(exp_list))        
        print("\n\n")
        src  =  "~/hand_RL_ws/EmptyExpirementFolders/ALL/"
        dist =  "~/hand_RL_ws/src/iiwa_pybullet_integration/Training/kuka_PPO_Algorithem7/Expirements/"

        if not self.stateMachine["initalized_expirment_for_all_containers"]:
            for repeat,exp in zip(exp_repeat_list,exp_list):
                for i in range(repeat):
                    print("_initalize_expirement_folder::innerfor::exp::",exp)
                    print("_initalize_expirement_folder::innerfor::repeat::",repeat)
                    print("_initalize_expirement_folder::innerfor::i::",i)
                    name = exp+"_"+str(i+1)
                    self.copy_folder_and_give_new_name(src,dist,name=exp,new_name=name)
                    expirments_folder_created.append(name)
            print("expirments_folder_created:: ",expirments_folder_created)
            self.get_ownership_of_folder(self.expirement_folder)
            return expirments_folder_created
        else:
            return False

    def _initalize_expiremmt_record(self):
        print("_initalize_expiremmt_record::called")
        #copy untouched record file to the empty 
        username=self.get_username()

        name ="ExpirementRecord"
        if self.dev:
            src ="/home/"+username+"/hand_RL_ws/EmptyExpirementFolders/"+name

            dist = "/home/"+username+"/hand_RL_ws/src/iiwa_pybullet_integration/Training/kuka_PPO_Algorithem7/"
            self.copy_folder(src,dist)
        else:
            src = "/home/"+username+"/hand_RL_ws/EmptyExpirementFolders/"+name

            dist= "/home/"+username+"/hand_RL_ws/src/iiwa_pybullet_integration/Training/kuka_PPO_Algorithem7/"
            self.copy_folder(src,dist)

        self.get_ownership_of_folder(self.expirementRecord_folder)

    def find_a_job_to_run(self):
        """
        look at job list and list of runing jobs
        will run the next job that is not runing
        """
        f= open(self.jobList_path)
        data = json.load(f)

        jobList =data["jobList"] 
        runingJobs =data["runingJobs"]
        jobsNotRuning = list(set(jobList) - set(runingJobs))

        print("data::",type(data))
        #returning the first Not runing Job
        if len(jobsNotRuning)!=0:
            #add job to runing list
            jobToRun = jobsNotRuning[0]
            data["runingJobs"].append(jobToRun)
            #Update jason file
            with open(self.jobList_path, "w") as outfile:
                json_object = json.dumps(data,indent = 4)
                outfile.write(json_object)
            return jobToRun

        return None

    def run(self):
        print("run::called")
        num_cores = self.num_cores
        exp_name = self.find_a_job_to_run()
        if exp_name !=None:
            #set the env variable specifying expirement_folder for this container 
            print("runing the script")
            command = "bash"+" "+self.shell_path+" "+str(num_cores)+" "+str(exp_name)
            print("command:: ",command)
            #p1=subprocess.run(command,  stdout=subprocess.PIPE,stderr=subprocess.PIPE,shell=True)
            p1=subprocess.run(command,shell=True)
            #stdout,stderr = p1.stdout,p1.stderr
            #print("stdout:: ",stdout)
            #print("stderr:: ",stderr)

            #subprocess.call(['sh', self.shell_path,str(num_cores),exp_name],shell=True)
            print("ran the script")
            return True
        else:
            return False
    #utiliy functions
    
    def is_folder_empty(self,src=None):
        path = None
        if src==None:
            path = self.expirement_folder
        else:
            path = src
        if len(os.listdir(path)) == 0:
            return True
        else:    
            return False
    
    def are_all_empty_expirements_there(self):
        missing_folder_list = []
        if len(os.listdir(self.expirement_folder)) == 0:
            missing_folder_list = record_dic["jobList"]
        else:
            for exp in self.record_dic["jobList"]:
                if len(os.listdir(self.expirement_folder+exp))>0:
                    missing_folder_list.append(exp)
            return missing_folder_list

    def copy_folder_and_give_new_name(self,source,destination,name,new_name):
        print("copy_folder_and_give_new_name::called")
        src = source+name
        dist = destination
        copy_path = dist+name
        rename_path = dist+new_name
        copy_command = "cp -R"
        
        #move command
        mv_command= "mv"
        if not self.dev:
            password = self.get_pass_from_env_variabe()
            copy_command = "echo "+password+"| sudo -S "+copy_command

            mv_command   = "echo "+password+"| sudo -S "+mv_command

        #copy   
        p1=subprocess.run(copy_command+" "+src+" "+copy_path,  stdout=subprocess.PIPE,stderr=subprocess.PIPE,shell=True)
        stdout,stderr = p1.stdout,p1.stderr
        print("stdout:: ",stdout)
        print("stderr:: ",stderr)
        #rename 
        p2=subprocess.run( mv_command+" "+copy_path+" "+rename_path,shell=True)
        return True
    
    def copy_folder(self,src,dist):
        print("copy_folder::called")
        print("copy_folder::src:: " ,src)
        print("copy_folder::dist:: ",dist)
        copy_command = "cp -R"
        if not self.dev:
            password = self.get_pass_from_env_variabe()
            copy_command = "echo "+password+"| sudo -S "+copy_command
            print("copy_command:: ",copy_command)
        #copy   
        p1=subprocess.run(copy_command+" "+src+" "+dist,  stdout=subprocess.PIPE,stderr=subprocess.PIPE,shell=True)
        stdout,stderr = p1.stdout,p1.stderr
        print("stdout:: ",stdout)
        print("stderr:: ",stderr)
        return True
    
    def get_pass_from_env_variabe(self):
        return os.environ["PASS"]

    def get_username(self):
        
        p=subprocess.run("whoami",stdout=subprocess.PIPE,stderr=subprocess.PIPE,shell=True)
        #print("stdout:: ",str(p.stdout))
        #print(type(p.stdout))
        unclean_data = str(p.stdout)
        #clean the data 
        clean = unclean_data.replace("b'","").replace("\\n'","")
        #print("clean:: ",clean)
        return  clean
    
    def get_ownership_of_folder(self,path):
        if not self.dev:
            print("get_ownership_of_folder::called")
            password = self.get_pass_from_env_variabe()
            username = self.get_username()
            own_command = "echo "+password+"|sudo -S chown -R "+username+" "+path
            p1=subprocess.run(own_command,  stdout=subprocess.PIPE,stderr=subprocess.PIPE,shell=True)
            stdout,stderr = p1.stdout,p1.stderr
            print(stderr)
        
    def is_exp_already_runing(self,exp_name):
        #check the exp_name against runing jobs
        runing_exps=self.get_running_exps()

        if exp_name in runing_exps:
            return True
        else:
            return False
            
    def is_there_resourses_for_exps(self,num_exps):
        total_num_cores = multiprocessing.cpu_count()
        core_per_expirements = self.num_cores
        needed_cores = core_per_expirements *num_exps
        
        already_runing_exp = self.get_running_exps()
        used_cores = core_per_expirements * len(already_runing_exp)

        remaining_cores = total_num_cores -(used_cores+needed_cores)

        if remaining_cores >=0:
            return True
        else:
            return False 
    
    def get_running_exps(self):
        with open(self.jobList_path, "r") as readFile:
            data = json.load(readFile)
            runing_exps = data["runingJobs"]

        return runing_exps

def get_env_variable(key):
    return os.environ[key]

if __name__ == '__main__':

    exp_runner = ExpirementRunner(num_repeats=4,dev=get_env_variable("DEVELOPMENT"),num_cores=get_env_variable("CORES"))
    # sys.exit()
    exp_runner.run()
    exp_runner.get_username()
    print("There was an attempt to run the ecpirement....")
    print("Maybe it did run how knows :)")


