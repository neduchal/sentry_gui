#include <gui/set_goal.hpp>

Set_goal::Set_goal(QObject *parent) : QObject(parent)
{
    std::string goal_position_topic;
    std::string goal_position_meters_topic;

    n.param<std::string>(ros::this_node::getName()+"/topic/goal_position", goal_position_topic, "/goal_position");
    n.param<std::string>(ros::this_node::getName()+"/topic/goal_position_meters", goal_position_meters_topic, "/goal_position_meters");

    goal_point_publisher = n.advertise<geometry_msgs::Twist>(goal_position_topic, 10);
    goal_meters_publisher = n.advertise<geometry_msgs::Point32>(goal_position_meters_topic, 10);
    goal_cancel_publisher = n.advertise<actionlib_msgs::GoalID>("/move_base/cancel", 10);
}

void Set_goal::setGoal(int x, int y)
{
   geometry_msgs::Point32 point;
   point.x = float(x);
   point.y = float(y);
   goal_point_publisher.publish(point);
}

void Set_goal::setGoalWithOrientation(int x, int y, int ox, int oy)
{
  geometry_msgs::Twist msg;
  msg.linear.x = float(x);
  msg.linear.y = float(y);
  msg.angular.x = float(ox - x);
  msg.angular.y = float(oy - y);
  goal_point_publisher.publish(msg);
}

void Set_goal::cancelGoal()
{
  actionlib_msgs::GoalID msg;
  goal_cancel_publisher.publish(msg);
}

void Set_goal::setGoalInMeters(float x, float y, float angle)
{
  geometry_msgs::Point32 point;
  point.x = x;
  point.y = y;
  point.z = angle;
  goal_meters_publisher.publish(point);
}
