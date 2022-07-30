// Generated by gencpp from file gazebo_msgs/ContactsState.msg
// DO NOT EDIT!


#ifndef GAZEBO_MSGS_MESSAGE_CONTACTSSTATE_H
#define GAZEBO_MSGS_MESSAGE_CONTACTSSTATE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>
#include <gazebo_msgs/ContactState.h>

namespace gazebo_msgs
{
template <class ContainerAllocator>
struct ContactsState_
{
  typedef ContactsState_<ContainerAllocator> Type;

  ContactsState_()
    : header()
    , states()  {
    }
  ContactsState_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , states(_alloc)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef std::vector< ::gazebo_msgs::ContactState_<ContainerAllocator> , typename ContainerAllocator::template rebind< ::gazebo_msgs::ContactState_<ContainerAllocator> >::other >  _states_type;
  _states_type states;





  typedef boost::shared_ptr< ::gazebo_msgs::ContactsState_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::gazebo_msgs::ContactsState_<ContainerAllocator> const> ConstPtr;

}; // struct ContactsState_

typedef ::gazebo_msgs::ContactsState_<std::allocator<void> > ContactsState;

typedef boost::shared_ptr< ::gazebo_msgs::ContactsState > ContactsStatePtr;
typedef boost::shared_ptr< ::gazebo_msgs::ContactsState const> ContactsStateConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::gazebo_msgs::ContactsState_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::gazebo_msgs::ContactsState_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace gazebo_msgs

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': True}
// {'sensor_msgs': ['/opt/ros/kinetic/share/sensor_msgs/cmake/../msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'trajectory_msgs': ['/opt/ros/kinetic/share/trajectory_msgs/cmake/../msg'], 'gazebo_msgs': ['/home/mamad/Demo/demo/src/iiwa_pybullet_integration/shadow_dep/gazebo_ros_pkgs/gazebo_msgs/msg'], 'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::gazebo_msgs::ContactsState_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::gazebo_msgs::ContactsState_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::gazebo_msgs::ContactsState_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::gazebo_msgs::ContactsState_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::gazebo_msgs::ContactsState_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::gazebo_msgs::ContactsState_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::gazebo_msgs::ContactsState_<ContainerAllocator> >
{
  static const char* value()
  {
    return "acbcb1601a8e525bf72509f18e6f668d";
  }

  static const char* value(const ::gazebo_msgs::ContactsState_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xacbcb1601a8e525bULL;
  static const uint64_t static_value2 = 0xf72509f18e6f668dULL;
};

template<class ContainerAllocator>
struct DataType< ::gazebo_msgs::ContactsState_<ContainerAllocator> >
{
  static const char* value()
  {
    return "gazebo_msgs/ContactsState";
  }

  static const char* value(const ::gazebo_msgs::ContactsState_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::gazebo_msgs::ContactsState_<ContainerAllocator> >
{
  static const char* value()
  {
    return "Header header                                   # stamp\n\
gazebo_msgs/ContactState[] states            # array of geom pairs in contact\n\
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
\n\
================================================================================\n\
MSG: gazebo_msgs/ContactState\n\
string info                                   # text info on this contact\n\
string collision1_name                        # name of contact collision1\n\
string collision2_name                        # name of contact collision2\n\
geometry_msgs/Wrench[] wrenches               # list of forces/torques\n\
geometry_msgs/Wrench total_wrench             # sum of forces/torques in every DOF\n\
geometry_msgs/Vector3[] contact_positions     # list of contact position\n\
geometry_msgs/Vector3[] contact_normals       # list of contact normals\n\
float64[] depths                              # list of penetration depths\n\
\n\
================================================================================\n\
MSG: geometry_msgs/Wrench\n\
# This represents force in free space, separated into\n\
# its linear and angular parts.\n\
Vector3  force\n\
Vector3  torque\n\
\n\
================================================================================\n\
MSG: geometry_msgs/Vector3\n\
# This represents a vector in free space. \n\
# It is only meant to represent a direction. Therefore, it does not\n\
# make sense to apply a translation to it (e.g., when applying a \n\
# generic rigid transformation to a Vector3, tf2 will only apply the\n\
# rotation). If you want your data to be translatable too, use the\n\
# geometry_msgs/Point message instead.\n\
\n\
float64 x\n\
float64 y\n\
float64 z\n\
";
  }

  static const char* value(const ::gazebo_msgs::ContactsState_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::gazebo_msgs::ContactsState_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.states);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct ContactsState_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::gazebo_msgs::ContactsState_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::gazebo_msgs::ContactsState_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "states[]" << std::endl;
    for (size_t i = 0; i < v.states.size(); ++i)
    {
      s << indent << "  states[" << i << "]: ";
      s << std::endl;
      s << indent;
      Printer< ::gazebo_msgs::ContactState_<ContainerAllocator> >::stream(s, indent + "    ", v.states[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // GAZEBO_MSGS_MESSAGE_CONTACTSSTATE_H
