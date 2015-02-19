/* Software License Agreement (BSD License)
 *
 * Copyright (c) 2011, Willow Garage, Inc.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 *  * Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *  * Redistributions in binary form must reproduce the above
 *    copyright notice, this list of conditions and the following
 *    disclaimer in the documentation and/or other materials provided
 *    with the distribution.
 *  * Neither the name of Willow Garage, Inc. nor the names of its
 *    contributors may be used to endorse or promote products derived
 *    from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
 * FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
 * COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
 * BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
 * ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 *
 * Auto-generated by genmsg_cpp from file /home/jay/ros/src/roscopter/msg/CurrentMission.msg
 *
 */


#ifndef ROSCOPTER_MESSAGE_CURRENTMISSION_H
#define ROSCOPTER_MESSAGE_CURRENTMISSION_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>

namespace roscopter
{
template <class ContainerAllocator>
struct CurrentMission_
{
  typedef CurrentMission_<ContainerAllocator> Type;

  CurrentMission_()
    : header()
    , mission_num(0)
    , wp_dist(0)
    , target_bearing(0)  {
    }
  CurrentMission_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , mission_num(0)
    , wp_dist(0)
    , target_bearing(0)  {
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef uint16_t _mission_num_type;
  _mission_num_type mission_num;

   typedef uint16_t _wp_dist_type;
  _wp_dist_type wp_dist;

   typedef int16_t _target_bearing_type;
  _target_bearing_type target_bearing;




  typedef boost::shared_ptr< ::roscopter::CurrentMission_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::roscopter::CurrentMission_<ContainerAllocator> const> ConstPtr;

}; // struct CurrentMission_

typedef ::roscopter::CurrentMission_<std::allocator<void> > CurrentMission;

typedef boost::shared_ptr< ::roscopter::CurrentMission > CurrentMissionPtr;
typedef boost::shared_ptr< ::roscopter::CurrentMission const> CurrentMissionConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::roscopter::CurrentMission_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::roscopter::CurrentMission_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace roscopter

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': True}
// {'std_msgs': ['/opt/ros/indigo/share/std_msgs/cmake/../msg'], 'roscopter': ['/home/jay/ros/src/roscopter/msg'], 'geometry_msgs': ['/opt/ros/indigo/share/geometry_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::roscopter::CurrentMission_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::roscopter::CurrentMission_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::roscopter::CurrentMission_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::roscopter::CurrentMission_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::roscopter::CurrentMission_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::roscopter::CurrentMission_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::roscopter::CurrentMission_<ContainerAllocator> >
{
  static const char* value()
  {
    return "deaf93654547b1e516f7011234618190";
  }

  static const char* value(const ::roscopter::CurrentMission_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xdeaf93654547b1e5ULL;
  static const uint64_t static_value2 = 0x16f7011234618190ULL;
};

template<class ContainerAllocator>
struct DataType< ::roscopter::CurrentMission_<ContainerAllocator> >
{
  static const char* value()
  {
    return "roscopter/CurrentMission";
  }

  static const char* value(const ::roscopter::CurrentMission_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::roscopter::CurrentMission_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# Based on MAVLink 1.0 Messages: NAV_CONTROLLER_OUTPUT, MISSION_CURRENT\n\
# See common.xml in MAVLink Messages\n\
\n\
# Information regarding current waypoint target\n\
\n\
Header header\n\
\n\
# Mission Number (sequence)\n\
uint16 mission_num\n\
\n\
# Distance to WP in meters\n\
uint16 wp_dist\n\
\n\
# Bearing to Current target in degrees\n\
int16 target_bearing\n\
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

  static const char* value(const ::roscopter::CurrentMission_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::roscopter::CurrentMission_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.mission_num);
      stream.next(m.wp_dist);
      stream.next(m.target_bearing);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER;
  }; // struct CurrentMission_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::roscopter::CurrentMission_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::roscopter::CurrentMission_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "mission_num: ";
    Printer<uint16_t>::stream(s, indent + "  ", v.mission_num);
    s << indent << "wp_dist: ";
    Printer<uint16_t>::stream(s, indent + "  ", v.wp_dist);
    s << indent << "target_bearing: ";
    Printer<int16_t>::stream(s, indent + "  ", v.target_bearing);
  }
};

} // namespace message_operations
} // namespace ros

#endif // ROSCOPTER_MESSAGE_CURRENTMISSION_H
