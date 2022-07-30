;; Auto-generated. Do not edit!


(when (boundp 'sr_robot_msgs::GetSegmentedLine)
  (if (not (find-package "SR_ROBOT_MSGS"))
    (make-package "SR_ROBOT_MSGS"))
  (shadow 'GetSegmentedLine (find-package "SR_ROBOT_MSGS")))
(unless (find-package "SR_ROBOT_MSGS::GETSEGMENTEDLINE")
  (make-package "SR_ROBOT_MSGS::GETSEGMENTEDLINE"))
(unless (find-package "SR_ROBOT_MSGS::GETSEGMENTEDLINEREQUEST")
  (make-package "SR_ROBOT_MSGS::GETSEGMENTEDLINEREQUEST"))
(unless (find-package "SR_ROBOT_MSGS::GETSEGMENTEDLINERESPONSE")
  (make-package "SR_ROBOT_MSGS::GETSEGMENTEDLINERESPONSE"))

(in-package "ROS")



(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))


(defclass sr_robot_msgs::GetSegmentedLineRequest
  :super ros::object
  :slots ())

(defmethod sr_robot_msgs::GetSegmentedLineRequest
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass sr_robot_msgs::GetSegmentedLineResponse
  :super ros::object
  :slots (_line_cloud ))

(defmethod sr_robot_msgs::GetSegmentedLineResponse
  (:init
   (&key
    ((:line_cloud __line_cloud) (instance sensor_msgs::PointCloud2 :init))
    )
   (send-super :init)
   (setq _line_cloud __line_cloud)
   self)
  (:line_cloud
   (&rest __line_cloud)
   (if (keywordp (car __line_cloud))
       (send* _line_cloud __line_cloud)
     (progn
       (if __line_cloud (setq _line_cloud (car __line_cloud)))
       _line_cloud)))
  (:serialization-length
   ()
   (+
    ;; sensor_msgs/PointCloud2 _line_cloud
    (send _line_cloud :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; sensor_msgs/PointCloud2 _line_cloud
       (send _line_cloud :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; sensor_msgs/PointCloud2 _line_cloud
     (send _line_cloud :deserialize buf ptr-) (incf ptr- (send _line_cloud :serialization-length))
   ;;
   self)
  )

(defclass sr_robot_msgs::GetSegmentedLine
  :super ros::object
  :slots ())

(setf (get sr_robot_msgs::GetSegmentedLine :md5sum-) "e52f6bd605c2394bdcc68a7000875e0c")
(setf (get sr_robot_msgs::GetSegmentedLine :datatype-) "sr_robot_msgs/GetSegmentedLine")
(setf (get sr_robot_msgs::GetSegmentedLine :request) sr_robot_msgs::GetSegmentedLineRequest)
(setf (get sr_robot_msgs::GetSegmentedLine :response) sr_robot_msgs::GetSegmentedLineResponse)

(defmethod sr_robot_msgs::GetSegmentedLineRequest
  (:response () (instance sr_robot_msgs::GetSegmentedLineResponse :init)))

(setf (get sr_robot_msgs::GetSegmentedLineRequest :md5sum-) "e52f6bd605c2394bdcc68a7000875e0c")
(setf (get sr_robot_msgs::GetSegmentedLineRequest :datatype-) "sr_robot_msgs/GetSegmentedLineRequest")
(setf (get sr_robot_msgs::GetSegmentedLineRequest :definition-)
      "---
sensor_msgs/PointCloud2 line_cloud


================================================================================
MSG: sensor_msgs/PointCloud2
# This message holds a collection of N-dimensional points, which may
# contain additional information such as normals, intensity, etc. The
# point data is stored as a binary blob, its layout described by the
# contents of the \"fields\" array.

# The point cloud data may be organized 2d (image-like) or 1d
# (unordered). Point clouds organized as 2d images may be produced by
# camera depth sensors such as stereo or time-of-flight.

# Time of sensor data acquisition, and the coordinate frame ID (for 3d
# points).
Header header

# 2D structure of the point cloud. If the cloud is unordered, height is
# 1 and width is the length of the point cloud.
uint32 height
uint32 width

# Describes the channels and their layout in the binary data blob.
PointField[] fields

bool    is_bigendian # Is this data bigendian?
uint32  point_step   # Length of a point in bytes
uint32  row_step     # Length of a row in bytes
uint8[] data         # Actual point data, size is (row_step*height)

bool is_dense        # True if there are no invalid points

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id

================================================================================
MSG: sensor_msgs/PointField
# This message holds the description of one point entry in the
# PointCloud2 message format.
uint8 INT8    = 1
uint8 UINT8   = 2
uint8 INT16   = 3
uint8 UINT16  = 4
uint8 INT32   = 5
uint8 UINT32  = 6
uint8 FLOAT32 = 7
uint8 FLOAT64 = 8

string name      # Name of field
uint32 offset    # Offset from start of point struct
uint8  datatype  # Datatype enumeration, see above
uint32 count     # How many elements in the field
")

(setf (get sr_robot_msgs::GetSegmentedLineResponse :md5sum-) "e52f6bd605c2394bdcc68a7000875e0c")
(setf (get sr_robot_msgs::GetSegmentedLineResponse :datatype-) "sr_robot_msgs/GetSegmentedLineResponse")
(setf (get sr_robot_msgs::GetSegmentedLineResponse :definition-)
      "---
sensor_msgs/PointCloud2 line_cloud


================================================================================
MSG: sensor_msgs/PointCloud2
# This message holds a collection of N-dimensional points, which may
# contain additional information such as normals, intensity, etc. The
# point data is stored as a binary blob, its layout described by the
# contents of the \"fields\" array.

# The point cloud data may be organized 2d (image-like) or 1d
# (unordered). Point clouds organized as 2d images may be produced by
# camera depth sensors such as stereo or time-of-flight.

# Time of sensor data acquisition, and the coordinate frame ID (for 3d
# points).
Header header

# 2D structure of the point cloud. If the cloud is unordered, height is
# 1 and width is the length of the point cloud.
uint32 height
uint32 width

# Describes the channels and their layout in the binary data blob.
PointField[] fields

bool    is_bigendian # Is this data bigendian?
uint32  point_step   # Length of a point in bytes
uint32  row_step     # Length of a row in bytes
uint8[] data         # Actual point data, size is (row_step*height)

bool is_dense        # True if there are no invalid points

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id

================================================================================
MSG: sensor_msgs/PointField
# This message holds the description of one point entry in the
# PointCloud2 message format.
uint8 INT8    = 1
uint8 UINT8   = 2
uint8 INT16   = 3
uint8 UINT16  = 4
uint8 INT32   = 5
uint8 UINT32  = 6
uint8 FLOAT32 = 7
uint8 FLOAT64 = 8

string name      # Name of field
uint32 offset    # Offset from start of point struct
uint8  datatype  # Datatype enumeration, see above
uint32 count     # How many elements in the field
")



(provide :sr_robot_msgs/GetSegmentedLine "e52f6bd605c2394bdcc68a7000875e0c")


