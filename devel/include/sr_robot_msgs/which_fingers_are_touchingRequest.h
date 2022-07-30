// Generated by gencpp from file sr_robot_msgs/which_fingers_are_touchingRequest.msg
// DO NOT EDIT!


#ifndef SR_ROBOT_MSGS_MESSAGE_WHICH_FINGERS_ARE_TOUCHINGREQUEST_H
#define SR_ROBOT_MSGS_MESSAGE_WHICH_FINGERS_ARE_TOUCHINGREQUEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace sr_robot_msgs
{
template <class ContainerAllocator>
struct which_fingers_are_touchingRequest_
{
  typedef which_fingers_are_touchingRequest_<ContainerAllocator> Type;

  which_fingers_are_touchingRequest_()
    : force_thresholds()  {
    }
  which_fingers_are_touchingRequest_(const ContainerAllocator& _alloc)
    : force_thresholds(_alloc)  {
  (void)_alloc;
    }



   typedef std::vector<double, typename ContainerAllocator::template rebind<double>::other >  _force_thresholds_type;
  _force_thresholds_type force_thresholds;





  typedef boost::shared_ptr< ::sr_robot_msgs::which_fingers_are_touchingRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::sr_robot_msgs::which_fingers_are_touchingRequest_<ContainerAllocator> const> ConstPtr;

}; // struct which_fingers_are_touchingRequest_

typedef ::sr_robot_msgs::which_fingers_are_touchingRequest_<std::allocator<void> > which_fingers_are_touchingRequest;

typedef boost::shared_ptr< ::sr_robot_msgs::which_fingers_are_touchingRequest > which_fingers_are_touchingRequestPtr;
typedef boost::shared_ptr< ::sr_robot_msgs::which_fingers_are_touchingRequest const> which_fingers_are_touchingRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::sr_robot_msgs::which_fingers_are_touchingRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::sr_robot_msgs::which_fingers_are_touchingRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace sr_robot_msgs

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'shape_msgs': ['/opt/ros/kinetic/share/shape_msgs/cmake/../msg'], 'actionlib_msgs': ['/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'moveit_msgs': ['/opt/ros/kinetic/share/moveit_msgs/cmake/../msg'], 'trajectory_msgs': ['/opt/ros/kinetic/share/trajectory_msgs/cmake/../msg'], 'sensor_msgs': ['/opt/ros/kinetic/share/sensor_msgs/cmake/../msg'], 'object_recognition_msgs': ['/opt/ros/kinetic/share/object_recognition_msgs/cmake/../msg'], 'octomap_msgs': ['/opt/ros/kinetic/share/octomap_msgs/cmake/../msg'], 'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg'], 'sr_robot_msgs': ['/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/sr_common/sr_robot_msgs/msg', '/home/mamad/Demo/demo/devel/share/sr_robot_msgs/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::sr_robot_msgs::which_fingers_are_touchingRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::sr_robot_msgs::which_fingers_are_touchingRequest_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::sr_robot_msgs::which_fingers_are_touchingRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::sr_robot_msgs::which_fingers_are_touchingRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::sr_robot_msgs::which_fingers_are_touchingRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::sr_robot_msgs::which_fingers_are_touchingRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::sr_robot_msgs::which_fingers_are_touchingRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "f0fd736c3daac04fcc02a89421c67ccd";
  }

  static const char* value(const ::sr_robot_msgs::which_fingers_are_touchingRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xf0fd736c3daac04fULL;
  static const uint64_t static_value2 = 0xcc02a89421c67ccdULL;
};

template<class ContainerAllocator>
struct DataType< ::sr_robot_msgs::which_fingers_are_touchingRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "sr_robot_msgs/which_fingers_are_touchingRequest";
  }

  static const char* value(const ::sr_robot_msgs::which_fingers_are_touchingRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::sr_robot_msgs::which_fingers_are_touchingRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "\n\
\n\
\n\
\n\
float64[] force_thresholds\n\
";
  }

  static const char* value(const ::sr_robot_msgs::which_fingers_are_touchingRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::sr_robot_msgs::which_fingers_are_touchingRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.force_thresholds);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct which_fingers_are_touchingRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::sr_robot_msgs::which_fingers_are_touchingRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::sr_robot_msgs::which_fingers_are_touchingRequest_<ContainerAllocator>& v)
  {
    s << indent << "force_thresholds[]" << std::endl;
    for (size_t i = 0; i < v.force_thresholds.size(); ++i)
    {
      s << indent << "  force_thresholds[" << i << "]: ";
      Printer<double>::stream(s, indent + "  ", v.force_thresholds[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // SR_ROBOT_MSGS_MESSAGE_WHICH_FINGERS_ARE_TOUCHINGREQUEST_H
