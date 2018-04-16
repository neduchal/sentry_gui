#ifndef SET_GOAL_HPP
#define SET_GOAL_HPP

#include <QDebug>
#include <QObject>
#include <iostream>
#include <ros/ros.h>
#include <geometry_msgs/Point32.h>

class Set_goal : public QObject
{
    Q_OBJECT

     ros::NodeHandle n;
     ros::Publisher goal_point_publisher;

public:
    explicit Set_goal(QObject *parent = 0);

public slots:
    void setGoal(int x, int y);

};

#endif // LAYER_BUTTON_HPP
