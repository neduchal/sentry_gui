#ifndef LAYER_BUTTON_HPP
#define LAYER_BUTTON_HPP

#include <QDebug>
#include <QObject>
#include <iostream>
#include <ros/ros.h>
#include <std_msgs/Int32.h>

class Layer_button : public QObject
{
    Q_OBJECT

     ros::NodeHandle n;
     ros::Publisher layers_status_publisher;

     int map_layers_status;

public:
    explicit Layer_button(QObject *parent = 0);

public slots:
    void saveLayerStatus(int button, int value);

};

#endif // LAYER_BUTTON_HPP
