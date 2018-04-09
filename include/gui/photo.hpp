#ifndef PHOTO_HPP
#define PHOTO_HPP

#include <QDebug>
#include <QObject>
#include <iostream>
#include <ros/ros.h>
#include <std_msgs/Empty.h>

class Photo : public QObject
{
    Q_OBJECT

     ros::NodeHandle nh;
     ros::Publisher photo_publisher;
public:
    explicit Photo(QObject *parent = 0);

public slots:
    void takePhoto();

};

#endif // BUTTONCLICK_HPP
