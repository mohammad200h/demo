// Generated by gencpp from file AW_hand_service/moveRobot.msg
// DO NOT EDIT!


#ifndef AW_HAND_SERVICE_MESSAGE_MOVEROBOT_H
#define AW_HAND_SERVICE_MESSAGE_MOVEROBOT_H

#include <ros/service_traits.h>


#include <AW_hand_service/moveRobotRequest.h>
#include <AW_hand_service/moveRobotResponse.h>


namespace AW_hand_service
{

struct moveRobot
{

typedef moveRobotRequest Request;
typedef moveRobotResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct moveRobot
} // namespace AW_hand_service


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::AW_hand_service::moveRobot > {
  static const char* value()
  {
    return "a379339920dab0da344b2dbd1b8b7fc8";
  }

  static const char* value(const ::AW_hand_service::moveRobot&) { return value(); }
};

template<>
struct DataType< ::AW_hand_service::moveRobot > {
  static const char* value()
  {
    return "AW_hand_service/moveRobot";
  }

  static const char* value(const ::AW_hand_service::moveRobot&) { return value(); }
};


// service_traits::MD5Sum< ::AW_hand_service::moveRobotRequest> should match 
// service_traits::MD5Sum< ::AW_hand_service::moveRobot > 
template<>
struct MD5Sum< ::AW_hand_service::moveRobotRequest>
{
  static const char* value()
  {
    return MD5Sum< ::AW_hand_service::moveRobot >::value();
  }
  static const char* value(const ::AW_hand_service::moveRobotRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::AW_hand_service::moveRobotRequest> should match 
// service_traits::DataType< ::AW_hand_service::moveRobot > 
template<>
struct DataType< ::AW_hand_service::moveRobotRequest>
{
  static const char* value()
  {
    return DataType< ::AW_hand_service::moveRobot >::value();
  }
  static const char* value(const ::AW_hand_service::moveRobotRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::AW_hand_service::moveRobotResponse> should match 
// service_traits::MD5Sum< ::AW_hand_service::moveRobot > 
template<>
struct MD5Sum< ::AW_hand_service::moveRobotResponse>
{
  static const char* value()
  {
    return MD5Sum< ::AW_hand_service::moveRobot >::value();
  }
  static const char* value(const ::AW_hand_service::moveRobotResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::AW_hand_service::moveRobotResponse> should match 
// service_traits::DataType< ::AW_hand_service::moveRobot > 
template<>
struct DataType< ::AW_hand_service::moveRobotResponse>
{
  static const char* value()
  {
    return DataType< ::AW_hand_service::moveRobot >::value();
  }
  static const char* value(const ::AW_hand_service::moveRobotResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // AW_HAND_SERVICE_MESSAGE_MOVEROBOT_H