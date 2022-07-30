require 'yaml'

class Base
    #constants
    M_PI = 3.1415926535897931
    attr_accessor :forearm,:palm,:mesh_c,:mesh_v
    def initialize(sim_env)
        @forearm ={  # object pose
                    'pose'=> [0,0,0,
                                   0,0,M_PI/2],
                    # inetia 
                    'pose_i'=> [0,0,0.09,
                                     0,0,0],                   
                    'mass'=> 1.8,
                    'ixx'=> 0.108 ,'ixy'=> 0     ,'ixz'=> 0 ,
                    'iyy'=> 0.108 ,'iyz'=> 0     ,'izz'=> 0.054 ,
                    #color
                    "ambient"=>  [0,0,0,1],
                    "diffuse"=>  [0,0,0,1],
                    "specular"=> [0,0,0,1],
                    "emissive"=> [0,0,0,0]
        }

        @palm =  {  # object pose
                'pose'=> [0+forearm['pose'][0],
                         -0.015+forearm['pose'][1],
                          0.149+forearm['pose'][2],
                         -40*M_PI/180,0,0],
                # inetia 
                'pose_i'=> [0,0,0.035,
                                0,0,0],                   
                'mass'=> 0.3,
                'ixx'=> 0.0003581 ,'ixy'=> 0     ,'ixz'=> 0 ,
                'iyy'=> 0.0005287 ,'iyz'=> 0     ,'izz'=> 0.000191 ,
                #color
                "ambient"=>  [0,0,0,1],
                "diffuse"=>  [0,0,0,1],
                "specular"=> [0,0,0,1],
                "emissive"=> [0,0,0,0]
        }
        def loadYamlAndChange()
            file = YAML.load_file("config.yml")
            #print file 
         
                
            #print finger
            links = file["BASE"]["Links"]
            links.each do |linkName,link|

                color = link["color"]
                mass  = link["mass"]
                if !(linkName == "forearm")
                    joint = link["joint"]
                end
                

                if linkName == "forearm"
                    #visual
                    @forearm["ambient"] = color["ambient"]
                    @forearm["diffuse"] = color["diffuse"]
                    @forearm["specular"] = color["specular"]
                    @forearm["emissive"] = color["emissive"]
                    #physical prop
                    @forearm["mass"] = mass


                elsif linkName== "palm"
                    #visual
                    @palm["ambient"] = color["ambient"]
                    @palm["diffuse"] = color["diffuse"]
                    @palm["specular"] = color["specular"]
                    @palm["emissive"] = color["emissive"]
                    #physical prop
                    @palm["mass"] = mass


                end
            end
              
            
        end
        loadYamlAndChange()
        path_v ={
            "palm"      => "meshes/palm.dae",
            "forearm"   =>"meshes/forearm_lite.dae",
    
        }
        path_c ={
            "palm"      => "meshes/palm.dae",
            "forearm"   =>"meshes/forearm_lite.dae",
              
        }
        @mesh_c={}
        @mesh_v={}
        
        if sim_env == "gazebo"
            #model://+default path
            path_c.each do |key,value|
              @mesh_c.merge!({key => "model://shadow_handlit/"+value})
            end
            path_v.each do |key,value|
              @mesh_v.merge!({key => "model://shadow_handlit/"+value})
            end
        
        elsif sim_env == "pybullet"
            #deafult path
            @mesh_v = path_v
            @mesh_c = path_c
        else
            puts "Fingers:   well life sucks!not everything is supported.A'nt life a bitch? "
        end 
    end
end

class Finger
    #constants
    M_PI = 3.1415926535897931
    attr_accessor :knuckle,:proximal,:middle,:distal,:palm,:fingername,:mesh_c,:mesh_v
    def initialize(sim_env,palm,biase,fingername)
        @fingername = fingername
        @palm = palm
        @knuckle ={ # object pose
                    'pose'=> [-0.033+palm['pose'][0]+biase[0],
                            0.0611+palm['pose'][1]+biase[1],
                            0.07277+palm['pose'][2]+biase[2],
                            0,0,0],
                    # inetia 
                    'pose_i'=> [0,0,0,
                                0,0,0],                   
                    'mass'=> 0.008,
                    'ixx'=> 0.00000026 ,'ixy'=> 0     ,'ixz'=> 0 ,
                    'iyy'=> 0.00000026 ,'iyz'=> 0     ,'izz'=>0.00000032,
                    # joint 
                    "name"       =>"knuckle",
                    "p_name"       =>"palm",
                    "j_name"     =>"J4",
                    "j_type"     =>"revolute",
                    "j_axis"     => [0,-1,0],
                    "j_limit"    => [-20/180*M_PI,20/180*M_PI], #[lower,upper]
                    "j_effort"   => 2.0,
                    "j_velocity" => 2.0,
                    "j_damping"  => 0.1 ,
                    #color
                    "ambient"=>  [0,0,0,1],
                    "diffuse"=>  [0,0,0,1],
                    "specular"=> [0,0,0,1],
                    "emissive"=> [0,0,0,0]
        }
        @proximal = {  # object pose
                      'pose'=> [0+knuckle['pose'][0],
                              0+knuckle['pose'][1],
                              0+knuckle['pose'][2],
                              0,0,0],
                      # inetia 
                      'pose_i'=> [0,0,0.0225,
                                      0,0,0],                   
                      'mass'=> 0.030,
                      'ixx'=> 0.0000098 ,'ixy'=> 0     ,'ixz'=> 0 ,
                      'iyy'=> 0.00001 ,'iyz'=> 0     ,'izz'=>0.0000018 ,
                       # joint 
                       "name"       =>"proximal",
                       "p_name"     =>"knuckle",
                       "j_name"     =>"J3",
                       "j_type"     =>"revolute",
                       "j_axis"     => [1,0,0],
                       "j_limit"    => [0,M_PI/2], #[lower,upper]
                       "j_effort"   => 2.0,
                       "j_velocity" => 2.0,
                       "j_damping"  => 0.1 ,
                        #color
                        "ambient"=>  [0,0,0,1],
                        "diffuse"=>  [0,0,0,1],
                        "specular"=> [0,0,0,1],
                        "emissive"=> [0,0,0,0]
                       
        } 
        @middle =   {  # object pose
                      'pose'=> [0+proximal['pose'][0],
                              0+proximal['pose'][1],
                              0.045+proximal['pose'][2],
                              0,0,0],
                      # inetia 
                      'pose_i'=> [0,0,0.0125,
                                      0,0,0],                   
                      'mass'=> 0.017,
                      'ixx'=>0.0000026 ,'ixy'=> 0     ,'ixz'=> 0 ,
                      'iyy'=>0.0000027 ,'iyz'=> 0     ,'izz'=>0.00000087,
                      # joint 
                      "name"       =>"middle",
                      "p_name"     =>"proximal",
                      "j_name"     =>"J2",
                      "j_type"     =>"revolute",
                      "j_axis"     => [1,0,0],
                      "j_limit"    => [0,M_PI/2], #[lower,upper]
                      "j_effort"   => 2.0,
                      "j_velocity" => 2.0,
                      "j_damping"  => 0.1 ,
                      #color
                      "ambient"=>  [0,0,0,1],
                      "diffuse"=>  [0,0,0,1],
                      "specular"=> [0,0,0,1],
                      "emissive"=> [0,0,0,0]
        }
        @distal =   {  # object pose
                        'pose'=> [0+middle['pose'][0],
                                  0+middle['pose'][1],
                                  0.025+middle['pose'][2],
                                  0,0,0],
                        # inetia 
                        'pose_i'=> [0,0,0.012,
                                        0,0,0],                   
                        'mass'=> 0.012,
                        'ixx'=>0.00000094 ,'ixy'=> 0     ,'ixz'=> 0 ,
                        'iyy'=>0.0000011 ,'iyz'=> 0     ,'izz'=>0.00000053,
                        # joint 
                        "name"       =>"distal",
                        "p_name"     =>"middle",
                        "j_name"     =>"J1",
                        "j_type"     =>"revolute",
                        "j_axis"     => [1,0,0],
                        "j_limit"    => [0,M_PI/2], #[lower,upper]
                        "j_effort"   => 2.0,
                        "j_velocity" => 2.0,
                        "j_damping"  => 0.1 ,
                        #color
                        "ambient"=>  [0,0,0,1],
                        "diffuse"=>  [0,0,0,1],
                        "specular"=> [0,0,0,1],
                        "emissive"=> [0,0,0,0]
        }
        def loadYamlAndChange()
            file = YAML.load_file("config.yml")
            #print file 
         
                
            #print finger
            links = file[ @fingername]["Links"]
            links.each do |linkName,link|

                color = link["color"]
                mass  = link["mass"] 
                joint = link["joint"]

                if linkName == "knuckle"
                    #visual
                    @knuckle["ambient"] = color["ambient"]
                    @knuckle["diffuse"] = color["diffuse"]
                    @knuckle["specular"] = color["specular"]
                    @knuckle["emissive"] = color["emissive"]
                    #physical prop
                    @knuckle["mass"] = mass
                    @knuckle["j_damping"] = joint["damping"]
                    @knuckle["j_friction"] = joint["friction"]
                elsif linkName== "proximal"
                    #visual
                    @proximal["ambient"] = color["ambient"]
                    @proximal["diffuse"] = color["diffuse"]
                    @proximal["specular"] = color["specular"]
                    @proximal["emissive"] = color["emissive"]
                    #physical prop
                    @proximal["mass"] = mass
                    @proximal["j_damping"] = joint["damping"]
                    @proximal["j_friction"] = joint["friction"]
                elsif linkName== "middle"
                    #visual
                    @middle["ambient"] = color["ambient"]
                    @middle["diffuse"] = color["diffuse"]
                    @middle["specular"] = color["specular"]
                    @middle["emissive"] = color["emissive"]
                    #physical prop
                    @middle["mass"] = mass
                    @middle["j_damping"] = joint["damping"]
                    @middle["j_friction"] = joint["friction"]
                elsif linkName== "distal"
                    #visual
                    @distal["ambient"] = color["ambient"]
                    @distal["diffuse"] = color["diffuse"]
                    @distal["specular"] = color["specular"]
                    @distal["emissive"] = color["emissive"]
                    #physical prop
                    @distal["mass"] = mass
                    @distal["j_damping"] = joint["damping"]
                    @distal["j_friction"] = joint["friction"]
                end
            end
              
            
        end
        loadYamlAndChange()
        path_c = {  "distal"   => "meshes/F1.dae",
                    "middle"   => "meshes/F2.dae",
                    "proximal" => "meshes/F3.dae",
                    "knuckle"  => "meshes/knuckle.dae",
                    "palm"     => "meshes/palm.dae",
                    "forearm"  => "meshes/forearm_lite.dae",
        }
        path_v = {  "distal"   => "meshes/F1.dae",
                    "middle"   => "meshes/F2.dae",
                    "proximal" => "meshes/F3.dae",
                    "knuckle"  => "meshes/knuckle.dae"
        }
        @mesh_c={}
        @mesh_v={}
        if sim_env == "gazebo"
          #model://+default path
          path_c.each do |key,value|
            @mesh_c.merge!({key => "model://shadow_hand/"+value})
          end
          path_v.each do |key,value|
            @mesh_v.merge!({key => "model://shadow_hand/"+value})
          end

        elsif sim_env == "pybullet"
          #deafult path
          @mesh_v = path_v
          @mesh_c = path_c
        else
          puts "well life sucks!not everything is supported.A'nt life a bitch? "
        end
            
    end
end

class Thumb
    attr_accessor :thbase,:thproximal,:thhub,:thmiddle,:thdistal,:palm,:mesh_c,:mesh_v
    #constants
    M_PI = 3.1415926535897931
    def initialize(sim_env,palm)
        @palm = palm
        @thbase =  {# object pose
                    'pose'=> [-0.034+palm['pose'][0],
                    0.0085+palm['pose'][1],
                    0.029+palm['pose'][2],
                            0,0,0],
                    # inetia 
                    'pose_i'=> [0,0,0,
                                0,0,0],                   
                    'mass'=> 0.010,
                    'ixx'=> 0.00000016 ,'ixy'=> 0     ,'ixz'=> 0 ,
                    'iyy'=> 0.00000016 ,'iyz'=> 0     ,'izz'=>0.00000016 ,
                    # joint 
                    "name"       =>"thbase",
                    "p_name"       =>"palm",
                    "j_name"     =>"THJ5",
                    "j_type"     =>"revolute",
                    "j_axis"     => [0,0,1],
                    "j_limit"    => [-60/180*M_PI,60/180*M_PI], #[lower,upper]
                    "j_effort"   => 0.2,
                    "j_velocity" => 4.0,
                    "j_damping"  => 0.2,
                    #visual
                    "ambient"=>  [0,0,0,1],
                    "diffuse"=>  [0,0,0,1],
                    "specular"=> [0,0,0,1],
                    "emissive"=> [0,0,0,0]
                        
    
        } 
        @thproximal ={# object pose
                    'pose'=> [0+thbase['pose'][0],
                            0+thbase['pose'][1],
                            0+thbase['pose'][2],
                            0,0,0],
                    # inetia 
                    'pose_i'=> [0,0,0.019,
                                0,0,0],                   
                    'mass'=> 0.040,
                    'ixx'=> 0.0000136 ,'ixy'=> 0     ,'ixz'=> 0 ,
                    'iyy'=> 0.0000136 ,'iyz'=> 0     ,'izz'=>0.00000313,
                    # joint 
                    "name"       =>"thproximal",
                    "p_name"     =>"thbase",
                    "j_name"     =>"THJ4",
                    "j_type"     =>"revolute",
                    "j_axis"     => [1,0,0],
                    "j_limit"    => [0,70/180*M_PI], #[lower,upper]
                    "j_effort"   => 3.0,
                    "j_velocity" => 4.0,
                    "j_damping"  => 0.2,
                    #visual
                    "ambient"=>  [0,0,0,1],
                    "diffuse"=>  [0,0,0,1],
                    "specular"=> [0,0,0,1],
                    "emissive"=> [0,0,0,0]                    
        } 
        @thhub = {  # object pose
                    'pose'=> [0+thproximal['pose'][0],
                            0+thproximal['pose'][1],
                            0.038+thproximal['pose'][2],
                            0,0,0],
                    # inetia 
                    'pose_i'=> [0,0,0,
                                0,0,0],                   
                    'mass'=> 0.005,
                    'ixx'=> 0.000001 ,'ixy'=> 0     ,'ixz'=> 0 ,
                    'iyy'=> 0.000001 ,'iyz'=> 0     ,'izz'=>0.0000003 ,
                    # joint 
                    "name"       =>"thhub",
                    "p_name"     =>"thproximal",
                    "j_name"     =>"THJ3",
                    "j_type"     =>"fixed",
                    "j_axis"     => [1,0,0]
                }
        @thmiddle = {# object pose
                    'pose'=> [0+thhub['pose'][0],
                            0+thhub['pose'][1],
                            0.01+thhub['pose'][2],
                            0,0,0],
                    # inetia 
                    'pose_i'=> [0,0,016,
                                0,0,0],                   
                    'mass'=> 0.020,
                    'ixx'=> 0.0000051 ,'ixy'=> 0     ,'ixz'=> 0 ,
                    'iyy'=> 0.0000051 ,'iyz'=> 0     ,'izz'=>0.00000121 ,
                    # joint 
                    "name"       =>"thmiddle",
                    "p_name"     =>"thhub",
                    "j_name"     =>"THJ2",
                    "j_type"     =>"revolute",
                    "j_axis"     => [0,-1,0],
                    "j_limit"    => [-40/180*M_PI,40/180*M_PI], #[lower,upper]
                    "j_effort"   => 2.0,
                    "j_velocity" => 2.0,
                    "j_damping"  => 0.1,
                    #visual
                    "ambient"=>  [0,0,0,1],
                    "diffuse"=>  [0,0,0,1],
                    "specular"=> [0,0,0,1],
                    "emissive"=> [0,0,0,0]
        } 
        @thdistal = {# object pose
                   'pose'=> [0+thmiddle['pose'][0],
                           0+thmiddle['pose'][1],
                           0.032+thmiddle['pose'][2],
                           0,0,M_PI/2],
                   # inetia 
                   'pose_i'=> [0,0,01375,
                               0,0,0],                   
                   'mass'=> 0.016,
                   'ixx'=> 0.0000021 ,'ixy'=> 0     ,'ixz'=> 0 ,
                   'iyy'=> 0.0000022 ,'iyz'=> 0     ,'izz'=>0.000001 ,
                    # joint 
                    "name"       =>"thdistal",
                    "p_name"     =>"thmiddle",
                    "j_name"     =>"THJ1",
                    "j_type"     =>"revolute",
                    "j_axis"     => [1,0,0],
                    "j_limit"    => [0,90.0*M_PI/180], #[lower,upper]
                    "j_effort"   => 1.0,
                    "j_velocity" => 4.0,
                    "j_damping"  => 0.2,
                    #visual
                    "ambient"=>  [0,0,0,1],
                    "diffuse"=>  [0,0,0,1],
                    "specular"=> [0,0,0,1],
                    "emissive"=> [0,0,0,0]
        }
        def loadYamlAndChange()
            file = YAML.load_file("config.yml")
            #print file 
         
                
            #print finger
            links = file["TH"]["Links"]
            links.each do |linkName,link|

                color = link["color"]
                mass  = link["mass"] 
                joint = link["joint"]

                if linkName == "thbase"
                    #visual
                    @thbase["ambient"] = color["ambient"]
                    @thbase["diffuse"] = color["diffuse"]
                    @thbase["specular"] = color["specular"]
                    @thbase["emissive"] = color["emissive"]
                    #physical prop
                    @thbase["mass"] = mass
                    @thbase["j_damping"] = joint["damping"]
                    @thbase["j_friction"] = joint["friction"]
                elsif linkName== "thproximal"
                    #visual
                    @thproximal["ambient"] = color["ambient"]
                    @thproximal["diffuse"] = color["diffuse"]
                    @thproximal["specular"] = color["specular"]
                    @thproximal["emissive"] = color["emissive"]
                    #physical prop
                    @thproximal["mass"] = mass
                    @thproximal["j_damping"] = joint["damping"]
                    @thproximal["j_friction"] = joint["friction"]
                elsif linkName== "thhub"
                    #physical prop
                    @thhub["mass"] = mass
                    @thhub["j_damping"] = joint["damping"]
                    @thhub["j_friction"] = joint["friction"]
                elsif linkName== "thmiddle"
                    #visual
                    @thmiddle["ambient"] = color["ambient"]
                    @thmiddle["diffuse"] = color["diffuse"]
                    @thmiddle["specular"] = color["specular"]
                    @thmiddle["emissive"] = color["emissive"]
                    #physical prop
                    @thmiddle["mass"] = mass
                    @thmiddle["j_damping"] = joint["damping"]
                    @thmiddle["j_friction"] = joint["friction"]
                elsif linkName== "thdistal"
                    #visual
                    @thdistal["ambient"] = color["ambient"]
                    @thdistal["diffuse"] = color["diffuse"]
                    @thdistal["specular"] = color["specular"]
                    @thdistal["emissive"] = color["emissive"]
                    #physical prop
                    @thdistal["mass"] = mass
                    @thdistal["j_damping"] = joint["damping"]
                    @thdistal["j_friction"] = joint["friction"]
                end
            end
              
            
        end
        loadYamlAndChange()
        path_v = {
                'thproximal' => "meshes/TH3_z.dae",
                'thmiddle'   => "meshes/TH2_z.dae",
                'thdistal'   => "meshes/TH1_z.dae"
        }
        path_c = {
                'thproximal' => "meshes/TH3_z.dae",
                'thmiddle'   => "meshes/TH2_z.dae",
                'thdistal'   => "meshes/TH1_z.dae"
        }
        @mesh_c ={}
        @mesh_v ={}
        
        if sim_env == "gazebo"
          #model://+default path
          path_c.each do |key,value|
            @mesh_c.merge!({key => "model://shadow_hand/"+value})
          end
          path_v.each do |key,value|
            @mesh_v.merge!({key => "model://shadow_hand/"+value})
          end
  
        elsif sim_env == "pybullet"
          #deafult path
          @mesh_v = path_v
          @mesh_c = path_c
        else
          puts "well life sucks!not everything is supported.A'nt life a bitch? "
        end


            
    end
end


sim_env = "pybullet"
base =Base.new(sim_env)
biase = [0,0,0]
ff = Finger.new(sim_env,base.palm,biase,"FF")
puts ff.middle["diffuse"]
puts ff.knuckle["mass"]
puts ff.knuckle["j_damping"]
puts ff.knuckle["j_friction"]

#ff = Finger.new(sim_env,palm,biase,"FF","bio")
#print ff.proximal["diffuse"]
#print ff.proximal["emissive"]
#puts ff.proximal["mass"]
#puts ff.proximal["j_damping"]
#puts ff.proximal["j_friction"]

#mf = Finger.new(sim_env,palm,biase,"MF","bio")
#puts mf.distal["specular"]

#thumb = Thumb.new(sim_env,palm,"eli")
#puts thumb.thbase["mass"]
#puts thumb.thbase["ambient"]
#puts thumb.thbase["j_damping"]
#puts thumb.thbase["j_friction"]

#puts thumb.thhub["mass"]
#puts thumb.thhub["j_damping"]
#puts thumb.thhub["j_friction"]

#lf = LFinger.new(sim_env,palm,biase,"LF","eli")
#print lf.metacarpal["diffuse"]
