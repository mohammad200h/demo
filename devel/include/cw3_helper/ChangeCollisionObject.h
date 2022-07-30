// Generated by gencpp from file cw3_helper/ChangeCollisionObject.msg
// DO NOT EDIT!


#ifndef CW3_HELPER_MESSAGE_CHANGECOLLISIONOBJECT_H
#define CW3_HELPER_MESSAGE_CHANGECOLLISIONOBJECT_H

#include <ros/service_traits.h>


#include <cw3_helper/ChangeCollisionObjectRequest.h>
#include <cw3_helper/ChangeCollisionObjectResponse.h>


namespace cw3_helper
{

struct ChangeCollisionObject
{

typedef ChangeCollisionObjectRequest Request;
typedef ChangeCollisionObjectResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct ChangeCollisionObject
} // namespace cw3_helper


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::cw3_helper::ChangeCollisionObject > {
  static const char* value()
  {
    return "bc93e0d7ed716275a8d9336d083ffb50";
  }

  static const char* value(const ::cw3_helper::ChangeCollisionObject&) { return value(); }
};

template<>
struct DataType< ::cw3_helper::ChangeCollisionObject > {
  static const char* value()
  {
    return "cw3_helper/ChangeCollisionObject";
  }

  static const char* value(const ::cw3_helper::ChangeCollisionObject&) { return value(); }
};


// service_traits::MD5Sum< ::cw3_helper::ChangeCollisionObjectRequest> should match 
// service_traits::MD5Sum< ::cw3_helper::ChangeCollisionObject > 
template<>
struct MD5Sum< ::cw3_helper::ChangeCollisionObjectRequest>
{
  static const char* value()
  {
    return MD5Sum< ::cw3_helper::ChangeCollisionObject >::value();
  }
  static const char* value(const ::cw3_helper::ChangeCollisionObjectRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::cw3_helper::ChangeCollisionObjectRequest> should match 
// service_traits::DataType< ::cw3_helper::ChangeCollisionObject > 
template<>
struct DataType< ::cw3_helper::ChangeCollisionObjectRequest>
{
  static const char* value()
  {
    return DataType< ::cw3_helper::ChangeCollisionObject >::value();
  }
  static const char* value(const ::cw3_helper::ChangeCollisionObjectRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::cw3_helper::ChangeCollisionObjectResponse> should match 
// service_traits::MD5Sum< ::cw3_helper::ChangeCollisionObject > 
template<>
struct MD5Sum< ::cw3_helper::ChangeCollisionObjectResponse>
{
  static const char* value()
  {
    return MD5Sum< ::cw3_helper::ChangeCollisionObject >::value();
  }
  static const char* value(const ::cw3_helper::ChangeCollisionObjectResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::cw3_helper::ChangeCollisionObjectResponse> should match 
// service_traits::DataType< ::cw3_helper::ChangeCollisionObject > 
template<>
struct DataType< ::cw3_helper::ChangeCollisionObjectResponse>
{
  static const char* value()
  {
    return DataType< ::cw3_helper::ChangeCollisionObject >::value();
  }
  static const char* value(const ::cw3_helper::ChangeCollisionObjectResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // CW3_HELPER_MESSAGE_CHANGECOLLISIONOBJECT_H