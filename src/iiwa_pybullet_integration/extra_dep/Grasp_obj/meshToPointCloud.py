# pip3 install pyntcloud
# sudo -H pip3 install pandas
# pip install open3d
# pip install open3d-python
from pyntcloud import PyntCloud
from pyntcloud.io import write_ply
import numpy as np
from open3d import * 

mesh = PyntCloud.from_file("box.ply")
cloud = mesh.get_sample("mesh_random", n=100000, rgb=False, normals=True, as_PyntCloud=True)
# cloud.plot()
cloud.to_file("box_pc.ply")

# viewing mesh
while(1):
    pcd = read_point_cloud("box_pc.ply") # Read the point cloud
    draw_geometries([pcd]) # Visualize the point cloud 


