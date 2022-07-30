; Auto-generated. Do not edit!


(cl:in-package sr_robot_msgs-srv)


;//! \htmlinclude GetSegmentedLine-request.msg.html

(cl:defclass <GetSegmentedLine-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass GetSegmentedLine-request (<GetSegmentedLine-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetSegmentedLine-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetSegmentedLine-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sr_robot_msgs-srv:<GetSegmentedLine-request> is deprecated: use sr_robot_msgs-srv:GetSegmentedLine-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetSegmentedLine-request>) ostream)
  "Serializes a message object of type '<GetSegmentedLine-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetSegmentedLine-request>) istream)
  "Deserializes a message object of type '<GetSegmentedLine-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetSegmentedLine-request>)))
  "Returns string type for a service object of type '<GetSegmentedLine-request>"
  "sr_robot_msgs/GetSegmentedLineRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetSegmentedLine-request)))
  "Returns string type for a service object of type 'GetSegmentedLine-request"
  "sr_robot_msgs/GetSegmentedLineRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetSegmentedLine-request>)))
  "Returns md5sum for a message object of type '<GetSegmentedLine-request>"
  "e52f6bd605c2394bdcc68a7000875e0c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetSegmentedLine-request)))
  "Returns md5sum for a message object of type 'GetSegmentedLine-request"
  "e52f6bd605c2394bdcc68a7000875e0c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetSegmentedLine-request>)))
  "Returns full string definition for message of type '<GetSegmentedLine-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetSegmentedLine-request)))
  "Returns full string definition for message of type 'GetSegmentedLine-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetSegmentedLine-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetSegmentedLine-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GetSegmentedLine-request
))
;//! \htmlinclude GetSegmentedLine-response.msg.html

(cl:defclass <GetSegmentedLine-response> (roslisp-msg-protocol:ros-message)
  ((line_cloud
    :reader line_cloud
    :initarg :line_cloud
    :type sensor_msgs-msg:PointCloud2
    :initform (cl:make-instance 'sensor_msgs-msg:PointCloud2)))
)

(cl:defclass GetSegmentedLine-response (<GetSegmentedLine-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetSegmentedLine-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetSegmentedLine-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sr_robot_msgs-srv:<GetSegmentedLine-response> is deprecated: use sr_robot_msgs-srv:GetSegmentedLine-response instead.")))

(cl:ensure-generic-function 'line_cloud-val :lambda-list '(m))
(cl:defmethod line_cloud-val ((m <GetSegmentedLine-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_robot_msgs-srv:line_cloud-val is deprecated.  Use sr_robot_msgs-srv:line_cloud instead.")
  (line_cloud m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetSegmentedLine-response>) ostream)
  "Serializes a message object of type '<GetSegmentedLine-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'line_cloud) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetSegmentedLine-response>) istream)
  "Deserializes a message object of type '<GetSegmentedLine-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'line_cloud) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetSegmentedLine-response>)))
  "Returns string type for a service object of type '<GetSegmentedLine-response>"
  "sr_robot_msgs/GetSegmentedLineResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetSegmentedLine-response)))
  "Returns string type for a service object of type 'GetSegmentedLine-response"
  "sr_robot_msgs/GetSegmentedLineResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetSegmentedLine-response>)))
  "Returns md5sum for a message object of type '<GetSegmentedLine-response>"
  "e52f6bd605c2394bdcc68a7000875e0c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetSegmentedLine-response)))
  "Returns md5sum for a message object of type 'GetSegmentedLine-response"
  "e52f6bd605c2394bdcc68a7000875e0c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetSegmentedLine-response>)))
  "Returns full string definition for message of type '<GetSegmentedLine-response>"
  (cl:format cl:nil "sensor_msgs/PointCloud2 line_cloud~%~%~%================================================================================~%MSG: sensor_msgs/PointCloud2~%# This message holds a collection of N-dimensional points, which may~%# contain additional information such as normals, intensity, etc. The~%# point data is stored as a binary blob, its layout described by the~%# contents of the \"fields\" array.~%~%# The point cloud data may be organized 2d (image-like) or 1d~%# (unordered). Point clouds organized as 2d images may be produced by~%# camera depth sensors such as stereo or time-of-flight.~%~%# Time of sensor data acquisition, and the coordinate frame ID (for 3d~%# points).~%Header header~%~%# 2D structure of the point cloud. If the cloud is unordered, height is~%# 1 and width is the length of the point cloud.~%uint32 height~%uint32 width~%~%# Describes the channels and their layout in the binary data blob.~%PointField[] fields~%~%bool    is_bigendian # Is this data bigendian?~%uint32  point_step   # Length of a point in bytes~%uint32  row_step     # Length of a row in bytes~%uint8[] data         # Actual point data, size is (row_step*height)~%~%bool is_dense        # True if there are no invalid points~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: sensor_msgs/PointField~%# This message holds the description of one point entry in the~%# PointCloud2 message format.~%uint8 INT8    = 1~%uint8 UINT8   = 2~%uint8 INT16   = 3~%uint8 UINT16  = 4~%uint8 INT32   = 5~%uint8 UINT32  = 6~%uint8 FLOAT32 = 7~%uint8 FLOAT64 = 8~%~%string name      # Name of field~%uint32 offset    # Offset from start of point struct~%uint8  datatype  # Datatype enumeration, see above~%uint32 count     # How many elements in the field~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetSegmentedLine-response)))
  "Returns full string definition for message of type 'GetSegmentedLine-response"
  (cl:format cl:nil "sensor_msgs/PointCloud2 line_cloud~%~%~%================================================================================~%MSG: sensor_msgs/PointCloud2~%# This message holds a collection of N-dimensional points, which may~%# contain additional information such as normals, intensity, etc. The~%# point data is stored as a binary blob, its layout described by the~%# contents of the \"fields\" array.~%~%# The point cloud data may be organized 2d (image-like) or 1d~%# (unordered). Point clouds organized as 2d images may be produced by~%# camera depth sensors such as stereo or time-of-flight.~%~%# Time of sensor data acquisition, and the coordinate frame ID (for 3d~%# points).~%Header header~%~%# 2D structure of the point cloud. If the cloud is unordered, height is~%# 1 and width is the length of the point cloud.~%uint32 height~%uint32 width~%~%# Describes the channels and their layout in the binary data blob.~%PointField[] fields~%~%bool    is_bigendian # Is this data bigendian?~%uint32  point_step   # Length of a point in bytes~%uint32  row_step     # Length of a row in bytes~%uint8[] data         # Actual point data, size is (row_step*height)~%~%bool is_dense        # True if there are no invalid points~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: sensor_msgs/PointField~%# This message holds the description of one point entry in the~%# PointCloud2 message format.~%uint8 INT8    = 1~%uint8 UINT8   = 2~%uint8 INT16   = 3~%uint8 UINT16  = 4~%uint8 INT32   = 5~%uint8 UINT32  = 6~%uint8 FLOAT32 = 7~%uint8 FLOAT64 = 8~%~%string name      # Name of field~%uint32 offset    # Offset from start of point struct~%uint8  datatype  # Datatype enumeration, see above~%uint32 count     # How many elements in the field~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetSegmentedLine-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'line_cloud))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetSegmentedLine-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GetSegmentedLine-response
    (cl:cons ':line_cloud (line_cloud msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GetSegmentedLine)))
  'GetSegmentedLine-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GetSegmentedLine)))
  'GetSegmentedLine-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetSegmentedLine)))
  "Returns string type for a service object of type '<GetSegmentedLine>"
  "sr_robot_msgs/GetSegmentedLine")