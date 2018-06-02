#ifndef SET_GOAL_HPP
#define SET_GOAL_HPP

#include <QDebug>
#include <QObject>
#include <iostream>
#include <ros/ros.h>
#include <string>
#include <geometry_msgs/Point32.h>
#include <geometry_msgs/Twist.h>
#include <actionlib_msgs/GoalID.h>

class Set_goal : public QObject
{
    Q_OBJECT

    ros::NodeHandle n;
    ros::Publisher goal_point_publisher;
    ros::Publisher goal_meters_publisher;
    ros::Publisher goal_cancel_publisher;

public:
    explicit Set_goal(QObject *parent = 0);

public slots:
    void setGoal(int x, int y);
    void setGoalWithOrientation(int x, int y, int ox, int oy);
    void cancelGoal();
    void setGoalInMeters(float x, float y, float angle);

};

#endif // LAYER_BUTTON_HPP
