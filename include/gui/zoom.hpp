#ifndef ZOOM_HPP
#define ZOOM_HPP

#include <QDebug>
#include <QObject>
#include <iostream>
#include <ros/ros.h>
#include <std_msgs/Float32.h>

class Zoom : public QObject
{
    Q_OBJECT


     ros::NodeHandle nh;
     ros::Publisher zoom_publisher;
public:
    explicit Zoom(QObject *parent = 0);

public slots:
    void zoomMinus();
    void zoomPlus();



};

#endif // BUTTONCLICK_HPP
