
#include <iostream>

#include <ros/ros.h>
#include <bio_ik/bio_ik.h>

#include <gazebo_ros/PhysicsConfig.h>

#include <moveit/robot_model_loader/robot_model_loader.h>
#include <moveit/kinematics_base/kinematics_base.h>
#include <moveit/robot_state/robot_state.h>


#include <pluginlib/class_loader.h>
#include <moveit/planning_interface/planning_interface.h>
#include <moveit/planning_scene_interface/planning_scene_interface.h>
#include <moveit/move_group_interface/move_group_interface.h>
#include <moveit/planning_scene/planning_scene.h>
#include <moveit/kinematic_constraints/utils.h>
#include <moveit_msgs/DisplayTrajectory.h>
#include <moveit_msgs/PlanningScene.h>

#include <tf/tf.h>
#include <tf/transform_listener.h>
#include <tf2_ros/transform_listener.h>
#include <geometry_msgs/TransformStamped.h>
#include <geometry_msgs/Twist.h>
#include <tf/transform_datatypes.h>

#include <gazebo_msgs/ContactState.h>
#include <std_msgs/Float64.h>
#include <sensor_msgs/JointState.h>

#include "cw3_helper/ChangeCollisionObject.h"

#include "geometric_shapes/shapes.h"
#include "geometric_shapes/mesh_operations.h"
#include "geometric_shapes/shape_operations.h"

#include <Eigen/Geometry>
#include <stdio.h>
#include <vector>
#include <math.h>

#include "AW_hand_service/moveRobot.h"
#include "AW_hand_service/moveObj.h"


using namespace std;
using std::vector;

#include <tf/transform_broadcaster.h>


struct jointState{
	std::vector<std::string> name;
	std::vector<double> position;
	std::vector<double> velocity;
	std::vector<double> effort;
};


void tf_for_obj_pc(ros::NodeHandle node_handle,double x,double y,double z){
	tf::TransformBroadcaster br;
	tf::Transform transform;

	ros::Rate rate(10.0);
	while (node_handle.ok()){
  		transform.setOrigin( tf::Vector3(x,y,z) );
  		transform.setRotation( tf::Quaternion(0, 0, 0, 1) );
  		br.sendTransform(tf::StampedTransform(transform, ros::Time::now(), "world", "obj"));
  		rate.sleep();
	}
	
}

void spawn_obj(double x,double y,double z){
		robot_model_loader::RobotModelLoader robot_model_loader("robot_description");
	
	auto robot_model = robot_model_loader.getModel();	
	//https://answers.ros.org/question/276194/how-to-change-position-of-collision-object-in-moveit/
	moveit::planning_interface::PlanningSceneInterface planning_scene_interface;
	
	float object_w = 0.01; //1cm
	
	double scale = 3;
	std::vector<moveit_msgs::CollisionObject> bin; //Create an object msg
	bin.resize(1);
	//****************mesh****************
	shapes::Mesh* m = shapes::createMeshFromResource("package://AW_hand_service/model/box.stl"); //find mesh
	// m->scaleAndPadd (scale, 0); //scaleAndPadd (double scale, double padd)
	shape_msgs::Mesh mesh; //create a mesh msg
	shapes::ShapeMsg mesh_msg; //create a shape msg
	shapes::constructMsgFromShape(m,mesh_msg); //convert shape into a shape msg
	ros::Duration(0.5).sleep();
	mesh = boost::get<shape_msgs::Mesh>(mesh_msg); // shape msg is assigned to mesh msg
	//************************************
	// cout<<"m::"<<m<<endl;
	//cout<<"mesh_msg::"<<mesh_msg<<endl;
	cout<<"mesh::"<<mesh<<endl;

	bin[0].header.frame_id = "world";
	bin[0].id ="object";
 
	bin[0].meshes.resize(1);
	bin[0].meshes[0] =mesh;

	bin[0].mesh_poses.resize(1);
 
	//  Define the pose of the object. 
	bin[0].mesh_poses[0].position.x=x;
	bin[0].mesh_poses[0].position.y=y;
	bin[0].mesh_poses[0].position.z=z;
	bin[0].mesh_poses[0].orientation.w=1;
	bin[0].mesh_poses[0].orientation.x=0;
	bin[0].mesh_poses[0].orientation.y=0;
	bin[0].mesh_poses[0].orientation.z=0;

	bin[0].operation = bin[0].ADD;
	//cout<<"bin[0]"<<bin[0]<<endl;
	planning_scene_interface.applyCollisionObjects(bin);
}
bool pregrasp_hack(double obj_x,double obj_y,double obj_z){
	
	robot_model_loader::RobotModelLoader robot_model_loader("robot_description");
	auto robot_model = robot_model_loader.getModel();	
	//*******************************************Move Groups Interface
	moveit::planning_interface::MoveGroupInterface kuka_group("Kuka");
	moveit::planning_interface::MoveGroupInterface palm_group("palm");
    moveit::planning_interface::MoveGroupInterface hand_group("Robot");
    moveit::planning_interface::MoveGroupInterface ff_group("ff_kuka");
	moveit::planning_interface::MoveGroupInterface mf_group("mf_kuka");
	moveit::planning_interface::MoveGroupInterface rf_group("rf_kuka");
    moveit::planning_interface::MoveGroupInterface th_group("th_kuka");
	//*******************************************Move Groups 
	const robot_state::JointModelGroup *kuka_JMG = kuka_group.getCurrentState()->getJointModelGroup("Kuka");
	const robot_state::JointModelGroup *palm_JMG = palm_group.getCurrentState()->getJointModelGroup("palm");
	const robot_state::JointModelGroup *hand_JMG = hand_group.getCurrentState()->getJointModelGroup("Robot");
	const robot_state::JointModelGroup *ff_JMG = ff_group.getCurrentState()->getJointModelGroup("ff_kuka");
	const robot_state::JointModelGroup *mf_JMG = mf_group.getCurrentState()->getJointModelGroup("mf_kuka");
	const robot_state::JointModelGroup *rf_JMG = rf_group.getCurrentState()->getJointModelGroup("rf_kuka");
	const robot_state::JointModelGroup *th_JMG = th_group.getCurrentState()->getJointModelGroup("th_kuka");
	//*******************************************************************
	auto kuka_tip_name = kuka_JMG->getSolverInstance()->getTipFrames()[0];
	auto palm_tip_name = palm_JMG->getSolverInstance()->getTipFrames()[0];
  	auto ff_tip_name = ff_JMG->getSolverInstance()->getTipFrames()[0];
	auto mf_tip_name = mf_JMG->getSolverInstance()->getTipFrames()[0];
	auto rf_tip_name = rf_JMG->getSolverInstance()->getTipFrames()[0];
	auto th_tip_name = th_JMG->getSolverInstance()->getTipFrames()[0];
	string tip_names[5] = {kuka_tip_name,ff_tip_name,mf_tip_name,rf_tip_name,th_tip_name};
	cout<<"I am here two"<<endl;
	//****************getting current pose of ee_s************
	//http://docs.ros.org/jade/api/moveit_ros_planning_interface/html/classmoveit_1_1planning__interface_1_1MoveGroup.html
	

	static const std::string kuka_ee =  kuka_group.getEndEffectorLink().c_str();
	geometry_msgs::PoseStamped kuka_ee_pose = kuka_group.getCurrentPose(kuka_ee);

	static const std::string palm_ee =  kuka_group.getEndEffectorLink().c_str();
	geometry_msgs::PoseStamped palm_ee_pose = kuka_group.getCurrentPose(palm_ee);
	
	static const std::string ff_ee =  ff_group.getEndEffectorLink().c_str();
	geometry_msgs::PoseStamped ff_ee_pose = ff_group.getCurrentPose(ff_ee);

	static const std::string mf_ee =  mf_group.getEndEffectorLink().c_str();
	geometry_msgs::PoseStamped mf_ee_pose = mf_group.getCurrentPose(mf_ee);

	static const std::string rf_ee =  rf_group.getEndEffectorLink().c_str();
	geometry_msgs::PoseStamped rf_ee_pose = rf_group.getCurrentPose(rf_ee);

	static const std::string th_ee =  th_group.getEndEffectorLink().c_str();
	geometry_msgs::PoseStamped th_ee_pose = th_group.getCurrentPose(th_ee);

	cout<<"I am here three"<<endl;
	//************setting up goal*****************************
	
  	bio_ik::BioIKKinematicsQueryOptions ik_options;
  	ik_options.replace = true;
  	ik_options.return_approximate_solution = true;

  	robot_state::RobotState robot_state_ik(robot_model);


	auto* palm_goal = new bio_ik::PoseGoal();
	auto* th_goal_th5 = new bio_ik::JointVariableGoal();
	auto* th_goal_th4 = new bio_ik::JointVariableGoal();
	auto* th_goal_th2 = new bio_ik::JointVariableGoal();
	auto* th_goal_th1 = new bio_ik::JointVariableGoal();
	
	palm_goal  ->setLinkName(palm_tip_name);
	
	th_goal_th5-> setVariableName("lh_THJ5");
	th_goal_th4-> setVariableName("lh_THJ4");
	th_goal_th2-> setVariableName("lh_THJ2");
	th_goal_th1-> setVariableName("lh_THJ1");

	// th_goal ->setLinkName(th_tip_name);
	th_goal_th5-> setVariablePosition(0.5);//-1.047  1.047
	th_goal_th4-> setVariablePosition(1.222);// 0 	  1.222
	// th_goal_th2-> setVariablePosition();//-0.524  0.524
	// th_goal_th1-> setVariablePosition();// 0	  1.571

	double palm_pose_x = obj_x + 0.0 ;
	double palm_pose_y = obj_y - 0.22;
	double palm_pose_z = obj_z + 0.29;//0.3;
	tf2::Quaternion palm_Quaternion;
	palm_Quaternion.setRPY( 2.53073, 0., 3.14 );//radian
	// cout<<"palm_Quaternion:: "<<palm_Quaternion[0]<<" "<<palm_Quaternion[1]<<" "<<palm_Quaternion[2]<<" "<<palm_Quaternion[3]<<endl;
	cout<<"I am here four"<<endl;
	tf::Quaternion q = tf::Quaternion(palm_Quaternion[0],palm_Quaternion[1],palm_Quaternion[2],palm_Quaternion[3]);

	palm_goal->setPosition(tf::Vector3(palm_pose_x,palm_pose_y,palm_pose_z));
	palm_goal->setOrientation(q);
	

	ik_options.goals.emplace_back(palm_goal);
	ik_options.goals.emplace_back(th_goal_th5);
	ik_options.goals.emplace_back(th_goal_th4);
	ik_options.goals.emplace_back(th_goal_th2);
	ik_options.goals.emplace_back(th_goal_th1);
	


	//http://docs.ros.org/kinetic/api/moveit_core/html/classmoveit_1_1core_1_1RobotState.html#a5cf16e481b6ac17028859db1d264bc4a
  	bool ok = robot_state_ik.setFromIK(
  	            hand_JMG, // joints to be used for IK
  	            EigenSTL::vector_Affine3d(),    // multiple end-effector goal poses
  	            std::vector<std::string>(),         // names of the end-effector links
  	            3, 0.005, // solver attempts and timeout
  	            moveit::core::GroupStateValidityCallbackFn(),
  	            ik_options               // mostly empty
  	          );
	cout<<"I am here five"<<endl;		
	//********************Planing*********************
	moveit::planning_interface::MoveGroupInterface::Plan robot_plan;
    hand_group.setJointValueTarget(robot_state_ik);//bio ik
    hand_group.allowReplanning(true);
    moveit::planning_interface::MoveItErrorCode b_plan_ff = hand_group.plan(robot_plan);
    moveit::planning_interface::MoveItErrorCode b_execute_ff=hand_group.execute(robot_plan);
    std::cout<<"b_plan_ff:::::::::::::::::::"<<b_plan_ff<<std::endl;
    std::cout<<"b_execute_ff::::::::::::::::"<<b_execute_ff<<std::endl;

	if (b_execute_ff==1){
		return true;
	}else{
		return false;
	}
}
bool grasp_hack(double obj_x,double obj_y,double obj_z){

	robot_model_loader::RobotModelLoader robot_model_loader("robot_description");
	auto robot_model = robot_model_loader.getModel();	
	//*******************************************Move Groups Interface
 	moveit::planning_interface::MoveGroupInterface hand_group("Robot");
    moveit::planning_interface::MoveGroupInterface ff_group("ff_kuka");
	moveit::planning_interface::MoveGroupInterface mf_group("mf_kuka");
	moveit::planning_interface::MoveGroupInterface rf_group("rf_kuka");
    moveit::planning_interface::MoveGroupInterface th_group("th_kuka");
	//*******************************************Move Groups 
	const robot_state::JointModelGroup *hand_JMG = hand_group.getCurrentState()->getJointModelGroup("Robot");
	const robot_state::JointModelGroup *ff_JMG = ff_group.getCurrentState()->getJointModelGroup("ff_kuka");
	const robot_state::JointModelGroup *mf_JMG = mf_group.getCurrentState()->getJointModelGroup("mf_kuka");
	const robot_state::JointModelGroup *rf_JMG = rf_group.getCurrentState()->getJointModelGroup("rf_kuka");
	const robot_state::JointModelGroup *th_JMG = th_group.getCurrentState()->getJointModelGroup("th_kuka");
	//*******************************************************************
  	auto ff_tip_name = ff_JMG->getSolverInstance()->getTipFrames()[0];
	auto mf_tip_name = mf_JMG->getSolverInstance()->getTipFrames()[0];
	auto rf_tip_name = rf_JMG->getSolverInstance()->getTipFrames()[0];
	auto th_tip_name = th_JMG->getSolverInstance()->getTipFrames()[0];
	string tip_names[5] = {ff_tip_name,mf_tip_name,rf_tip_name,th_tip_name};
	cout<<"I am here two"<<endl;
	//****************getting current pose of ee_s************
	//http://docs.ros.org/jade/api/moveit_ros_planning_interface/html/classmoveit_1_1planning__interface_1_1MoveGroup.html
		
	static const std::string ff_ee =  ff_group.getEndEffectorLink().c_str();
	geometry_msgs::PoseStamped ff_ee_pose = ff_group.getCurrentPose(ff_ee);

	static const std::string mf_ee =  mf_group.getEndEffectorLink().c_str();
	geometry_msgs::PoseStamped mf_ee_pose = mf_group.getCurrentPose(mf_ee);

	static const std::string rf_ee =  rf_group.getEndEffectorLink().c_str();
	geometry_msgs::PoseStamped rf_ee_pose = rf_group.getCurrentPose(rf_ee);

	static const std::string th_ee =  th_group.getEndEffectorLink().c_str();
	geometry_msgs::PoseStamped th_ee_pose = th_group.getCurrentPose(th_ee);

	cout<<"I am here three"<<endl;
	//************setting up goal*****************************
	
  	bio_ik::BioIKKinematicsQueryOptions ik_options;
  	ik_options.replace = true;
  	ik_options.return_approximate_solution = true;

  	robot_state::RobotState robot_state_ik(robot_model);

	auto* th_goal_th5 = new bio_ik::JointVariableGoal();
	auto* th_goal_th4 = new bio_ik::JointVariableGoal();
	auto* th_goal_th2 = new bio_ik::JointVariableGoal();
	auto* th_goal_th1 = new bio_ik::JointVariableGoal();

	auto* ff_goal_ff4 = new bio_ik::JointVariableGoal();
	auto* ff_goal_ff3 = new bio_ik::JointVariableGoal();
	auto* ff_goal_ff2 = new bio_ik::JointVariableGoal();
	auto* ff_goal_ff1 = new bio_ik::JointVariableGoal();

	auto* mf_goal_mf4 = new bio_ik::JointVariableGoal();
	auto* mf_goal_mf3 = new bio_ik::JointVariableGoal();
	auto* mf_goal_mf2 = new bio_ik::JointVariableGoal();
	auto* mf_goal_mf1 = new bio_ik::JointVariableGoal();

	auto* rf_goal_rf4 = new bio_ik::JointVariableGoal();
	auto* rf_goal_rf3 = new bio_ik::JointVariableGoal();
	auto* rf_goal_rf2 = new bio_ik::JointVariableGoal();
	auto* rf_goal_rf1 = new bio_ik::JointVariableGoal();
	
	th_goal_th5-> setVariableName("lh_THJ5");
	th_goal_th4-> setVariableName("lh_THJ4");
	th_goal_th2-> setVariableName("lh_THJ2");
	th_goal_th1-> setVariableName("lh_THJ1");

	ff_goal_ff4-> setVariableName("lh_FFJ4");
	ff_goal_ff3-> setVariableName("lh_FFJ3");
	ff_goal_ff2-> setVariableName("lh_FFJ2");
	ff_goal_ff1-> setVariableName("lh_FFJ1");

	mf_goal_mf4-> setVariableName("lh_MFJ4");
	mf_goal_mf3-> setVariableName("lh_MFJ3");
	mf_goal_mf2-> setVariableName("lh_MFJ2");
	mf_goal_mf1-> setVariableName("lh_MFJ1");

	rf_goal_rf4-> setVariableName("lh_RFJ4");
	rf_goal_rf3-> setVariableName("lh_RFJ3");
	rf_goal_rf2-> setVariableName("lh_RFJ2");
	rf_goal_rf1-> setVariableName("lh_RFJ1");

	// th_goal ->setLinkName(th_tip_name);
	th_goal_th5-> setVariablePosition(0.5);//-1.047  1.047
	th_goal_th4-> setVariablePosition(1.222);// 0 	  1.222
	// th_goal_th2-> setVariablePosition();//-0.524  0.524
	// th_goal_th1-> setVariablePosition();// 0	  1.571

	ff_goal_ff4->setVariablePosition(0.);// -0.349		0.349
	ff_goal_ff3->setVariablePosition(0.5);// 0	1.571
	ff_goal_ff2->setVariablePosition(0.);// 0	1.571
	ff_goal_ff1->setVariablePosition(0.6);// 0	1.571

	mf_goal_mf4->setVariablePosition(0.);
	mf_goal_mf3->setVariablePosition(0.5);
	mf_goal_mf2->setVariablePosition(0.);
	mf_goal_mf1->setVariablePosition(0.6);

	rf_goal_rf4->setVariablePosition(0.);
	rf_goal_rf3->setVariablePosition(0.5);
	rf_goal_rf2->setVariablePosition(0.);
	rf_goal_rf1->setVariablePosition(0.6);

	ik_options.goals.emplace_back(th_goal_th5);
	ik_options.goals.emplace_back(th_goal_th4);
	ik_options.goals.emplace_back(th_goal_th2);
	ik_options.goals.emplace_back(th_goal_th1);

	ik_options.goals.emplace_back(ff_goal_ff4);
	ik_options.goals.emplace_back(ff_goal_ff3);
	ik_options.goals.emplace_back(ff_goal_ff2);
	ik_options.goals.emplace_back(ff_goal_ff1);

	ik_options.goals.emplace_back(mf_goal_mf4);
	ik_options.goals.emplace_back(mf_goal_mf3);
	ik_options.goals.emplace_back(mf_goal_mf2);
	ik_options.goals.emplace_back(mf_goal_mf1);

	ik_options.goals.emplace_back(rf_goal_rf4);
	ik_options.goals.emplace_back(rf_goal_rf3);
	ik_options.goals.emplace_back(rf_goal_rf2);
	ik_options.goals.emplace_back(rf_goal_rf1);

	//http://docs.ros.org/kinetic/api/moveit_core/html/classmoveit_1_1core_1_1RobotState.html#a5cf16e481b6ac17028859db1d264bc4a
  	bool ok = robot_state_ik.setFromIK(
  	            hand_JMG, // joints to be used for IK
  	            EigenSTL::vector_Affine3d(),    // multiple end-effector goal poses
  	            std::vector<std::string>(),         // names of the end-effector links
  	            3, 0.005, // solver attempts and timeout
  	            moveit::core::GroupStateValidityCallbackFn(),
  	            ik_options               // mostly empty
  	          );
	cout<<"I am here five"<<endl;		
	//********************Planing*********************
	moveit::planning_interface::MoveGroupInterface::Plan robot_plan;
    hand_group.setJointValueTarget(robot_state_ik);//bio ik
    hand_group.allowReplanning(true);
    moveit::planning_interface::MoveItErrorCode b_plan_ff = hand_group.plan(robot_plan);
    moveit::planning_interface::MoveItErrorCode b_execute_ff=hand_group.execute(robot_plan);
    std::cout<<"b_plan_ff:::::::::::::::::::"<<b_plan_ff<<std::endl;
    std::cout<<"b_execute_ff::::::::::::::::"<<b_execute_ff<<std::endl;

	if (b_execute_ff==1){
		return true;
	}else{
		return false;
	}
		

}
jointState RobotJointAfterExecution(){
	robot_model_loader::RobotModelLoader robot_model_loader("robot_description");
	auto robot_model = robot_model_loader.getModel();	
	//*******************************************Move Groups Interface
 	moveit::planning_interface::MoveGroupInterface hand_group("Robot");
	//*******************************************Move Groups 
	const robot_state::JointModelGroup *hand_JMG = hand_group.getCurrentState()->getJointModelGroup("Robot");
	//****************************Getting current joint values**************
	robot_state::RobotStatePtr kinematic_state(new robot_state::RobotState(robot_model));
	// kinematic_state->setToDefaultValues();
	const std::vector<std::string>& joint_names = hand_JMG->getVariableNames();
	std::vector<double> joint_values;

	jointState  currentJointState;
	kinematic_state->copyJointGroupPositions(hand_JMG, joint_values);
	// cout<<"joint_values::"<<joint_values[0]<<endl;
	currentJointState.name = joint_names;
	// vector<float> b(joint_values.begin(), joint_values.end());
	currentJointState.position = joint_values;

	return currentJointState;
}
bool grasp(AW_hand_service::moveRobot::Request &req,AW_hand_service::moveRobot::Response &res){
	//do the grasping
	spawn_obj(req.obj_x,req.obj_y,req.obj_z);
	bool pregrasp_b = pregrasp_hack(req.obj_x,req.obj_y,req.obj_z);
	bool grasp_b    = grasp_hack(req.obj_x,req.obj_y,req.obj_z);

	res.plan_executed = pregrasp_b && grasp_b;
	if (pregrasp_b && grasp_b){
		jointState  currentJointState = RobotJointAfterExecution();
		sensor_msgs::JointState jointsAfterExecution;
		jointsAfterExecution.name 	  = currentJointState.name;
		jointsAfterExecution.position = currentJointState.position;
		res.RobotJoints = jointsAfterExecution;
	}
	return  true;
}
bool moveObj(AW_hand_service::moveObj::Request &req,AW_hand_service::moveObj::Response &res){
	//move object
	spawn_obj(req.x,req.y,req.z);
	res.objMoved = true;
	return  true;
}



int main(int argc, char** argv)
{
	
	ros::init (argc, argv, "AW_moveitInterface");
	ros::NodeHandle node_handle;	
	ros::AsyncSpinner spinner(2);
 	spinner.start();

	
	ros::ServiceServer graspservice   = node_handle.advertiseService("getRobotJoints",grasp);
	ros::ServiceServer moveObjservice = node_handle.advertiseService("moveObject",moveObj);
	// ros::spin();
	ros::waitForShutdown();
	
    return 0;
}

