; Auto-generated. Do not edit!


(cl:in-package sr_robot_msgs-srv)


;//! \htmlinclude GetFastGraspFromBoundingBox-request.msg.html

(cl:defclass <GetFastGraspFromBoundingBox-request> (roslisp-msg-protocol:ros-message)
  ((bounding_box
    :reader bounding_box
    :initarg :bounding_box
    :type shape_msgs-msg:SolidPrimitive
    :initform (cl:make-instance 'shape_msgs-msg:SolidPrimitive))
   (pose
    :reader pose
    :initarg :pose
    :type geometry_msgs-msg:PoseStamped
    :initform (cl:make-instance 'geometry_msgs-msg:PoseStamped)))
)

(cl:defclass GetFastGraspFromBoundingBox-request (<GetFastGraspFromBoundingBox-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetFastGraspFromBoundingBox-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetFastGraspFromBoundingBox-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sr_robot_msgs-srv:<GetFastGraspFromBoundingBox-request> is deprecated: use sr_robot_msgs-srv:GetFastGraspFromBoundingBox-request instead.")))

(cl:ensure-generic-function 'bounding_box-val :lambda-list '(m))
(cl:defmethod bounding_box-val ((m <GetFastGraspFromBoundingBox-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-srv:bounding_box-val is deprecated.  Use sr_robot_msgs-srv:bounding_box instead.")
  (bounding_box m))

(cl:ensure-generic-function 'pose-val :lambda-list '(m))
(cl:defmethod pose-val ((m <GetFastGraspFromBoundingBox-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-srv:pose-val is deprecated.  Use sr_robot_msgs-srv:pose instead.")
  (pose m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetFastGraspFromBoundingBox-request>) ostream)
  "Serializes a message object of type '<GetFastGraspFromBoundingBox-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'bounding_box) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pose) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetFastGraspFromBoundingBox-request>) istream)
  "Deserializes a message object of type '<GetFastGraspFromBoundingBox-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'bounding_box) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pose) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetFastGraspFromBoundingBox-request>)))
  "Returns string type for a service object of type '<GetFastGraspFromBoundingBox-request>"
  "sr_robot_msgs/GetFastGraspFromBoundingBoxRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetFastGraspFromBoundingBox-request)))
  "Returns string type for a service object of type 'GetFastGraspFromBoundingBox-request"
  "sr_robot_msgs/GetFastGraspFromBoundingBoxRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetFastGraspFromBoundingBox-request>)))
  "Returns md5sum for a message object of type '<GetFastGraspFromBoundingBox-request>"
  "ffbffca6a4c0c33cabde5517cccd453b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetFastGraspFromBoundingBox-request)))
  "Returns md5sum for a message object of type 'GetFastGraspFromBoundingBox-request"
  "ffbffca6a4c0c33cabde5517cccd453b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetFastGraspFromBoundingBox-request>)))
  "Returns full string definition for message of type '<GetFastGraspFromBoundingBox-request>"
  (cl:format cl:nil "shape_msgs/SolidPrimitive bounding_box~%geometry_msgs/PoseStamped pose~%~%~%================================================================================~%MSG: shape_msgs/SolidPrimitive~%# Define box, sphere, cylinder, cone ~%# All shapes are defined to have their bounding boxes centered around 0,0,0.~%~%uint8 BOX=1~%uint8 SPHERE=2~%uint8 CYLINDER=3~%uint8 CONE=4~%~%# The type of the shape~%uint8 type~%~%~%# The dimensions of the shape~%float64[] dimensions~%~%# The meaning of the shape dimensions: each constant defines the index in the 'dimensions' array~%~%# For the BOX type, the X, Y, and Z dimensions are the length of the corresponding~%# sides of the box.~%uint8 BOX_X=0~%uint8 BOX_Y=1~%uint8 BOX_Z=2~%~%~%# For the SPHERE type, only one component is used, and it gives the radius of~%# the sphere.~%uint8 SPHERE_RADIUS=0~%~%~%# For the CYLINDER and CONE types, the center line is oriented along~%# the Z axis.  Therefore the CYLINDER_HEIGHT (CONE_HEIGHT) component~%# of dimensions gives the height of the cylinder (cone).  The~%# CYLINDER_RADIUS (CONE_RADIUS) component of dimensions gives the~%# radius of the base of the cylinder (cone).  Cone and cylinder~%# primitives are defined to be circular. The tip of the cone is~%# pointing up, along +Z axis.~%~%uint8 CYLINDER_HEIGHT=0~%uint8 CYLINDER_RADIUS=1~%~%uint8 CONE_HEIGHT=0~%uint8 CONE_RADIUS=1~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetFastGraspFromBoundingBox-request)))
  "Returns full string definition for message of type 'GetFastGraspFromBoundingBox-request"
  (cl:format cl:nil "shape_msgs/SolidPrimitive bounding_box~%geometry_msgs/PoseStamped pose~%~%~%================================================================================~%MSG: shape_msgs/SolidPrimitive~%# Define box, sphere, cylinder, cone ~%# All shapes are defined to have their bounding boxes centered around 0,0,0.~%~%uint8 BOX=1~%uint8 SPHERE=2~%uint8 CYLINDER=3~%uint8 CONE=4~%~%# The type of the shape~%uint8 type~%~%~%# The dimensions of the shape~%float64[] dimensions~%~%# The meaning of the shape dimensions: each constant defines the index in the 'dimensions' array~%~%# For the BOX type, the X, Y, and Z dimensions are the length of the corresponding~%# sides of the box.~%uint8 BOX_X=0~%uint8 BOX_Y=1~%uint8 BOX_Z=2~%~%~%# For the SPHERE type, only one component is used, and it gives the radius of~%# the sphere.~%uint8 SPHERE_RADIUS=0~%~%~%# For the CYLINDER and CONE types, the center line is oriented along~%# the Z axis.  Therefore the CYLINDER_HEIGHT (CONE_HEIGHT) component~%# of dimensions gives the height of the cylinder (cone).  The~%# CYLINDER_RADIUS (CONE_RADIUS) component of dimensions gives the~%# radius of the base of the cylinder (cone).  Cone and cylinder~%# primitives are defined to be circular. The tip of the cone is~%# pointing up, along +Z axis.~%~%uint8 CYLINDER_HEIGHT=0~%uint8 CYLINDER_RADIUS=1~%~%uint8 CONE_HEIGHT=0~%uint8 CONE_RADIUS=1~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetFastGraspFromBoundingBox-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'bounding_box))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pose))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetFastGraspFromBoundingBox-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GetFastGraspFromBoundingBox-request
    (cl:cons ':bounding_box (bounding_box msg))
    (cl:cons ':pose (pose msg))
))
;//! \htmlinclude GetFastGraspFromBoundingBox-response.msg.html

(cl:defclass <GetFastGraspFromBoundingBox-response> (roslisp-msg-protocol:ros-message)
  ((grasp
    :reader grasp
    :initarg :grasp
    :type moveit_msgs-msg:Grasp
    :initform (cl:make-instance 'moveit_msgs-msg:Grasp)))
)

(cl:defclass GetFastGraspFromBoundingBox-response (<GetFastGraspFromBoundingBox-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetFastGraspFromBoundingBox-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetFastGraspFromBoundingBox-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sr_robot_msgs-srv:<GetFastGraspFromBoundingBox-response> is deprecated: use sr_robot_msgs-srv:GetFastGraspFromBoundingBox-response instead.")))

(cl:ensure-generic-function 'grasp-val :lambda-list '(m))
(cl:defmethod grasp-val ((m <GetFastGraspFromBoundingBox-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-srv:grasp-val is deprecated.  Use sr_robot_msgs-srv:grasp instead.")
  (grasp m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetFastGraspFromBoundingBox-response>) ostream)
  "Serializes a message object of type '<GetFastGraspFromBoundingBox-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'grasp) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetFastGraspFromBoundingBox-response>) istream)
  "Deserializes a message object of type '<GetFastGraspFromBoundingBox-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'grasp) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetFastGraspFromBoundingBox-response>)))
  "Returns string type for a service object of type '<GetFastGraspFromBoundingBox-response>"
  "sr_robot_msgs/GetFastGraspFromBoundingBoxResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetFastGraspFromBoundingBox-response)))
  "Returns string type for a service object of type 'GetFastGraspFromBoundingBox-response"
  "sr_robot_msgs/GetFastGraspFromBoundingBoxResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetFastGraspFromBoundingBox-response>)))
  "Returns md5sum for a message object of type '<GetFastGraspFromBoundingBox-response>"
  "ffbffca6a4c0c33cabde5517cccd453b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetFastGraspFromBoundingBox-response)))
  "Returns md5sum for a message object of type 'GetFastGraspFromBoundingBox-response"
  "ffbffca6a4c0c33cabde5517cccd453b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetFastGraspFromBoundingBox-response>)))
  "Returns full string definition for message of type '<GetFastGraspFromBoundingBox-response>"
  (cl:format cl:nil "~%moveit_msgs/Grasp grasp~%~%================================================================================~%MSG: moveit_msgs/Grasp~%# This message contains a description of a grasp that would be used~%# with a particular end-effector to grasp an object, including how to~%# approach it, grip it, etc.  This message does not contain any~%# information about a \"grasp point\" (a position ON the object).~%# Whatever generates this message should have already combined~%# information about grasp points with information about the geometry~%# of the end-effector to compute the grasp_pose in this message.~%~%# A name for this grasp~%string id~%~%# The internal posture of the hand for the pre-grasp~%# only positions are used~%trajectory_msgs/JointTrajectory pre_grasp_posture~%~%# The internal posture of the hand for the grasp~%# positions and efforts are used~%trajectory_msgs/JointTrajectory grasp_posture~%~%# The position of the end-effector for the grasp.  This is the pose of~%# the \"parent_link\" of the end-effector, not actually the pose of any~%# link *in* the end-effector.  Typically this would be the pose of the~%# most distal wrist link before the hand (end-effector) links began.~%geometry_msgs/PoseStamped grasp_pose~%~%# The estimated probability of success for this grasp, or some other~%# measure of how \"good\" it is.~%float64 grasp_quality~%~%# The approach direction to take before picking an object~%GripperTranslation pre_grasp_approach~%~%# The retreat direction to take after a grasp has been completed (object is attached)~%GripperTranslation post_grasp_retreat~%~%# The retreat motion to perform when releasing the object; this information~%# is not necessary for the grasp itself, but when releasing the object,~%# the information will be necessary. The grasp used to perform a pickup~%# is returned as part of the result, so this information is available for ~%# later use.~%GripperTranslation post_place_retreat~%~%# the maximum contact force to use while grasping (<=0 to disable)~%float32 max_contact_force~%~%# an optional list of obstacles that we have semantic information about~%# and that can be touched/pushed/moved in the course of grasping~%string[] allowed_touch_objects~%~%================================================================================~%MSG: trajectory_msgs/JointTrajectory~%Header header~%string[] joint_names~%JointTrajectoryPoint[] points~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: trajectory_msgs/JointTrajectoryPoint~%# Each trajectory point specifies either positions[, velocities[, accelerations]]~%# or positions[, effort] for the trajectory to be executed.~%# All specified values are in the same order as the joint names in JointTrajectory.msg~%~%float64[] positions~%float64[] velocities~%float64[] accelerations~%float64[] effort~%duration time_from_start~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: moveit_msgs/GripperTranslation~%# defines a translation for the gripper, used in pickup or place tasks~%# for example for lifting an object off a table or approaching the table for placing~%~%# the direction of the translation~%geometry_msgs/Vector3Stamped direction~%~%# the desired translation distance~%float32 desired_distance~%~%# the min distance that must be considered feasible before the~%# grasp is even attempted~%float32 min_distance~%~%================================================================================~%MSG: geometry_msgs/Vector3Stamped~%# This represents a Vector3 with reference coordinate frame and timestamp~%Header header~%Vector3 vector~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetFastGraspFromBoundingBox-response)))
  "Returns full string definition for message of type 'GetFastGraspFromBoundingBox-response"
  (cl:format cl:nil "~%moveit_msgs/Grasp grasp~%~%================================================================================~%MSG: moveit_msgs/Grasp~%# This message contains a description of a grasp that would be used~%# with a particular end-effector to grasp an object, including how to~%# approach it, grip it, etc.  This message does not contain any~%# information about a \"grasp point\" (a position ON the object).~%# Whatever generates this message should have already combined~%# information about grasp points with information about the geometry~%# of the end-effector to compute the grasp_pose in this message.~%~%# A name for this grasp~%string id~%~%# The internal posture of the hand for the pre-grasp~%# only positions are used~%trajectory_msgs/JointTrajectory pre_grasp_posture~%~%# The internal posture of the hand for the grasp~%# positions and efforts are used~%trajectory_msgs/JointTrajectory grasp_posture~%~%# The position of the end-effector for the grasp.  This is the pose of~%# the \"parent_link\" of the end-effector, not actually the pose of any~%# link *in* the end-effector.  Typically this would be the pose of the~%# most distal wrist link before the hand (end-effector) links began.~%geometry_msgs/PoseStamped grasp_pose~%~%# The estimated probability of success for this grasp, or some other~%# measure of how \"good\" it is.~%float64 grasp_quality~%~%# The approach direction to take before picking an object~%GripperTranslation pre_grasp_approach~%~%# The retreat direction to take after a grasp has been completed (object is attached)~%GripperTranslation post_grasp_retreat~%~%# The retreat motion to perform when releasing the object; this information~%# is not necessary for the grasp itself, but when releasing the object,~%# the information will be necessary. The grasp used to perform a pickup~%# is returned as part of the result, so this information is available for ~%# later use.~%GripperTranslation post_place_retreat~%~%# the maximum contact force to use while grasping (<=0 to disable)~%float32 max_contact_force~%~%# an optional list of obstacles that we have semantic information about~%# and that can be touched/pushed/moved in the course of grasping~%string[] allowed_touch_objects~%~%================================================================================~%MSG: trajectory_msgs/JointTrajectory~%Header header~%string[] joint_names~%JointTrajectoryPoint[] points~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: trajectory_msgs/JointTrajectoryPoint~%# Each trajectory point specifies either positions[, velocities[, accelerations]]~%# or positions[, effort] for the trajectory to be executed.~%# All specified values are in the same order as the joint names in JointTrajectory.msg~%~%float64[] positions~%float64[] velocities~%float64[] accelerations~%float64[] effort~%duration time_from_start~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: moveit_msgs/GripperTranslation~%# defines a translation for the gripper, used in pickup or place tasks~%# for example for lifting an object off a table or approaching the table for placing~%~%# the direction of the translation~%geometry_msgs/Vector3Stamped direction~%~%# the desired translation distance~%float32 desired_distance~%~%# the min distance that must be considered feasible before the~%# grasp is even attempted~%float32 min_distance~%~%================================================================================~%MSG: geometry_msgs/Vector3Stamped~%# This represents a Vector3 with reference coordinate frame and timestamp~%Header header~%Vector3 vector~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetFastGraspFromBoundingBox-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'grasp))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetFastGraspFromBoundingBox-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GetFastGraspFromBoundingBox-response
    (cl:cons ':grasp (grasp msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GetFastGraspFromBoundingBox)))
  'GetFastGraspFromBoundingBox-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GetFastGraspFromBoundingBox)))
  'GetFastGraspFromBoundingBox-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetFastGraspFromBoundingBox)))
  "Returns string type for a service object of type '<GetFastGraspFromBoundingBox>"
  "sr_robot_msgs/GetFastGraspFromBoundingBox")