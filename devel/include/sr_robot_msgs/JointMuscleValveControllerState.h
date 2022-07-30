// Generated by gencpp from file sr_robot_msgs/JointMuscleValveControllerState.msg
// DO NOT EDIT!


#ifndef SR_ROBOT_MSGS_MESSAGE_JOINTMUSCLEVALVECONTROLLERSTATE_H
#define SR_ROBOT_MSGS_MESSAGE_JOINTMUSCLEVALVECONTROLLERSTATE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>

namespace sr_robot_msgs
{
template <class ContainerAllocator>
struct JointMuscleValveControllerState_
{
  typedef JointMuscleValveControllerState_<ContainerAllocator> Type;

  JointMuscleValveControllerState_()
    : header()
    , set_valve_muscle_0(0)
    , set_valve_muscle_1(0)
    , set_duration_muscle_0(0)
    , set_duration_muscle_1(0)
    , current_valve_muscle_0(0)
    , current_valve_muscle_1(0)
    , current_duration_muscle_0(0)
    , current_duration_muscle_1(0)
    , packed_valve(0.0)
    , muscle_pressure_0(0)
    , muscle_pressure_1(0)
    , time_step(0.0)  {
    }
  JointMuscleValveControllerState_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , set_valve_muscle_0(0)
    , set_valve_muscle_1(0)
    , set_duration_muscle_0(0)
    , set_duration_muscle_1(0)
    , current_valve_muscle_0(0)
    , current_valve_muscle_1(0)
    , current_duration_muscle_0(0)
    , current_duration_muscle_1(0)
    , packed_valve(0.0)
    , muscle_pressure_0(0)
    , muscle_pressure_1(0)
    , time_step(0.0)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef int8_t _set_valve_muscle_0_type;
  _set_valve_muscle_0_type set_valve_muscle_0;

   typedef int8_t _set_valve_muscle_1_type;
  _set_valve_muscle_1_type set_valve_muscle_1;

   typedef uint64_t _set_duration_muscle_0_type;
  _set_duration_muscle_0_type set_duration_muscle_0;

   typedef uint64_t _set_duration_muscle_1_type;
  _set_duration_muscle_1_type set_duration_muscle_1;

   typedef int8_t _current_valve_muscle_0_type;
  _current_valve_muscle_0_type current_valve_muscle_0;

   typedef int8_t _current_valve_muscle_1_type;
  _current_valve_muscle_1_type current_valve_muscle_1;

   typedef uint64_t _current_duration_muscle_0_type;
  _current_duration_muscle_0_type current_duration_muscle_0;

   typedef uint64_t _current_duration_muscle_1_type;
  _current_duration_muscle_1_type current_duration_muscle_1;

   typedef double _packed_valve_type;
  _packed_valve_type packed_valve;

   typedef uint16_t _muscle_pressure_0_type;
  _muscle_pressure_0_type muscle_pressure_0;

   typedef uint16_t _muscle_pressure_1_type;
  _muscle_pressure_1_type muscle_pressure_1;

   typedef double _time_step_type;
  _time_step_type time_step;





  typedef boost::shared_ptr< ::sr_robot_msgs::JointMuscleValveControllerState_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::sr_robot_msgs::JointMuscleValveControllerState_<ContainerAllocator> const> ConstPtr;

}; // struct JointMuscleValveControllerState_

typedef ::sr_robot_msgs::JointMuscleValveControllerState_<std::allocator<void> > JointMuscleValveControllerState;

typedef boost::shared_ptr< ::sr_robot_msgs::JointMuscleValveControllerState > JointMuscleValveControllerStatePtr;
typedef boost::shared_ptr< ::sr_robot_msgs::JointMuscleValveControllerState const> JointMuscleValveControllerStateConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::sr_robot_msgs::JointMuscleValveControllerState_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::sr_robot_msgs::JointMuscleValveControllerState_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace sr_robot_msgs

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': True}
// {'shape_msgs': ['/opt/ros/kinetic/share/shape_msgs/cmake/../msg'], 'actionlib_msgs': ['/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'moveit_msgs': ['/opt/ros/kinetic/share/moveit_msgs/cmake/../msg'], 'trajectory_msgs': ['/opt/ros/kinetic/share/trajectory_msgs/cmake/../msg'], 'sensor_msgs': ['/opt/ros/kinetic/share/sensor_msgs/cmake/../msg'], 'object_recognition_msgs': ['/opt/ros/kinetic/share/object_recognition_msgs/cmake/../msg'], 'octomap_msgs': ['/opt/ros/kinetic/share/octomap_msgs/cmake/../msg'], 'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg'], 'sr_robot_msgs': ['/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/sr_common/sr_robot_msgs/msg', '/home/mamad/Demo/demo/devel/share/sr_robot_msgs/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::sr_robot_msgs::JointMuscleValveControllerState_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::sr_robot_msgs::JointMuscleValveControllerState_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::sr_robot_msgs::JointMuscleValveControllerState_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::sr_robot_msgs::JointMuscleValveControllerState_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::sr_robot_msgs::JointMuscleValveControllerState_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::sr_robot_msgs::JointMuscleValveControllerState_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::sr_robot_msgs::JointMuscleValveControllerState_<ContainerAllocator> >
{
  static const char* value()
  {
    return "fc22942516cdb4d514558e60d7263d35";
  }

  static const char* value(const ::sr_robot_msgs::JointMuscleValveControllerState_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xfc22942516cdb4d5ULL;
  static const uint64_t static_value2 = 0x14558e60d7263d35ULL;
};

template<class ContainerAllocator>
struct DataType< ::sr_robot_msgs::JointMuscleValveControllerState_<ContainerAllocator> >
{
  static const char* value()
  {
    return "sr_robot_msgs/JointMuscleValveControllerState";
  }

  static const char* value(const ::sr_robot_msgs::JointMuscleValveControllerState_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::sr_robot_msgs::JointMuscleValveControllerState_<ContainerAllocator> >
{
  static const char* value()
  {
    return "Header header\n\
int8 set_valve_muscle_0\n\
int8 set_valve_muscle_1\n\
uint64 set_duration_muscle_0\n\
uint64 set_duration_muscle_1\n\
int8 current_valve_muscle_0\n\
int8 current_valve_muscle_1\n\
uint64 current_duration_muscle_0\n\
uint64 current_duration_muscle_1\n\
float64 packed_valve\n\
uint16 muscle_pressure_0\n\
uint16 muscle_pressure_1\n\
float64 time_step\n\
\n\
\n\
================================================================================\n\
MSG: std_msgs/Header\n\
# Standard metadata for higher-level stamped data types.\n\
# This is generally used to communicate timestamped data \n\
# in a particular coordinate frame.\n\
# \n\
# sequence ID: consecutively increasing ID \n\
uint32 seq\n\
#Two-integer timestamp that is expressed as:\n\
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n\
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n\
# time-handling sugar is provided by the client library\n\
time stamp\n\
#Frame this data is associated with\n\
# 0: no frame\n\
# 1: global frame\n\
string frame_id\n\
";
  }

  static const char* value(const ::sr_robot_msgs::JointMuscleValveControllerState_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::sr_robot_msgs::JointMuscleValveControllerState_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.set_valve_muscle_0);
      stream.next(m.set_valve_muscle_1);
      stream.next(m.set_duration_muscle_0);
      stream.next(m.set_duration_muscle_1);
      stream.next(m.current_valve_muscle_0);
      stream.next(m.current_valve_muscle_1);
      stream.next(m.current_duration_muscle_0);
      stream.next(m.current_duration_muscle_1);
      stream.next(m.packed_valve);
      stream.next(m.muscle_pressure_0);
      stream.next(m.muscle_pressure_1);
      stream.next(m.time_step);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct JointMuscleValveControllerState_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::sr_robot_msgs::JointMuscleValveControllerState_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::sr_robot_msgs::JointMuscleValveControllerState_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "set_valve_muscle_0: ";
    Printer<int8_t>::stream(s, indent + "  ", v.set_valve_muscle_0);
    s << indent << "set_valve_muscle_1: ";
    Printer<int8_t>::stream(s, indent + "  ", v.set_valve_muscle_1);
    s << indent << "set_duration_muscle_0: ";
    Printer<uint64_t>::stream(s, indent + "  ", v.set_duration_muscle_0);
    s << indent << "set_duration_muscle_1: ";
    Printer<uint64_t>::stream(s, indent + "  ", v.set_duration_muscle_1);
    s << indent << "current_valve_muscle_0: ";
    Printer<int8_t>::stream(s, indent + "  ", v.current_valve_muscle_0);
    s << indent << "current_valve_muscle_1: ";
    Printer<int8_t>::stream(s, indent + "  ", v.current_valve_muscle_1);
    s << indent << "current_duration_muscle_0: ";
    Printer<uint64_t>::stream(s, indent + "  ", v.current_duration_muscle_0);
    s << indent << "current_duration_muscle_1: ";
    Printer<uint64_t>::stream(s, indent + "  ", v.current_duration_muscle_1);
    s << indent << "packed_valve: ";
    Printer<double>::stream(s, indent + "  ", v.packed_valve);
    s << indent << "muscle_pressure_0: ";
    Printer<uint16_t>::stream(s, indent + "  ", v.muscle_pressure_0);
    s << indent << "muscle_pressure_1: ";
    Printer<uint16_t>::stream(s, indent + "  ", v.muscle_pressure_1);
    s << indent << "time_step: ";
    Printer<double>::stream(s, indent + "  ", v.time_step);
  }
};

} // namespace message_operations
} // namespace ros

#endif // SR_ROBOT_MSGS_MESSAGE_JOINTMUSCLEVALVECONTROLLERSTATE_H
