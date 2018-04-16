#include <gui/set_goal.hpp>

Set_goal::Set_goal(QObject *parent) : QObject(parent)
{
    goal_point_publisher = n.advertise<geometry_msgs::Point32>("/sentry_map_stream/goal", 10);
}

void Set_goal::setGoal(int x, int y) {
   geometry_msgs::Point32 point;
   point.x = float(x);
   point.y = float(y);
   goal_point_publisher.publish(point);
}
