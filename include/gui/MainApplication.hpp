#ifndef MAINAPPLICATION_H
#define MAINAPPLICATION_H

#include <string>
#include <QString>
#include <ros/ros.h>
#include <QtQml/QQmlApplicationEngine>
#include "geometry_msgs/Twist.h"
#include "geometry_msgs/Vector3.h"
#include "sensor_msgs/Joy.h"

class MainApplication : public QQmlApplicationEngine {
    Q_OBJECT
    public:
        MainApplication();
        //this method is used to setup all the ROS functionality we need, before the application starts running
        void run();
        void receiveJoy(const sensor_msgs::Joy::ConstPtr& msg);
        QObject * getQmlObject(const QString &objectName);

    //this defines a slot that will be called when the application is idle.
    public slots:
        void mainLoop();

   private:
        ros::NodeHandle nh;

        float steering;
        float throttle;


};

#endif // MAINAPPLICATION_H
