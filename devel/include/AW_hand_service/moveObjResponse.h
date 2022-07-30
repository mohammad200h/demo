// Generated by gencpp from file AW_hand_service/moveObjResponse.msg
// DO NOT EDIT!


#ifndef AW_HAND_SERVICE_MESSAGE_MOVEOBJRESPONSE_H
#define AW_HAND_SERVICE_MESSAGE_MOVEOBJRESPONSE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace AW_hand_service
{
template <class ContainerAllocator>
struct moveObjResponse_
{
  typedef moveObjResponse_<ContainerAllocator> Type;

  moveObjResponse_()
    : objMoved(false)  {
    }
  moveObjResponse_(const ContainerAllocator& _alloc)
    : objMoved(false)  {
  (void)_alloc;
    }



   typedef uint8_t _objMoved_type;
  _objMoved_type objMoved;





  typedef boost::shared_ptr< ::AW_hand_service::moveObjResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::AW_hand_service::moveObjResponse_<ContainerAllocator> const> ConstPtr;

}; // struct moveObjResponse_

typedef ::AW_hand_service::moveObjResponse_<std::allocator<void> > moveObjResponse;

typedef boost::shared_ptr< ::AW_hand_service::moveObjResponse > moveObjResponsePtr;
typedef boost::shared_ptr< ::AW_hand_service::moveObjResponse const> moveObjResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::AW_hand_service::moveObjResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::AW_hand_service::moveObjResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace AW_hand_service

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'sensor_msgs': ['/opt/ros/kinetic/share/sensor_msgs/cmake/../msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::AW_hand_service::moveObjResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::AW_hand_service::moveObjResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::AW_hand_service::moveObjResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::AW_hand_service::moveObjResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::AW_hand_service::moveObjResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::AW_hand_service::moveObjResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::AW_hand_service::moveObjResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "9692ae3b3b37e8e2152ebf4831348840";
  }

  static const char* value(const ::AW_hand_service::moveObjResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x9692ae3b3b37e8e2ULL;
  static const uint64_t static_value2 = 0x152ebf4831348840ULL;
};

template<class ContainerAllocator>
struct DataType< ::AW_hand_service::moveObjResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "AW_hand_service/moveObjResponse";
  }

  static const char* value(const ::AW_hand_service::moveObjResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::AW_hand_service::moveObjResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "bool objMoved\n\
\n\
";
  }

  static const char* value(const ::AW_hand_service::moveObjResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::AW_hand_service::moveObjResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.objMoved);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct moveObjResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::AW_hand_service::moveObjResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::AW_hand_service::moveObjResponse_<ContainerAllocator>& v)
  {
    s << indent << "objMoved: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.objMoved);
  }
};

} // namespace message_operations
} // namespace ros

#endif // AW_HAND_SERVICE_MESSAGE_MOVEOBJRESPONSE_H