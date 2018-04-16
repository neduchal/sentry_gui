#ifndef MAINAPPLICATION_H
#define MAINAPPLICATION_H

#include <string>
#include <QString>
#include <QImage>
#include <ros/ros.h>
#include <QtQml/QQmlApplicationEngine>
#include "geometry_msgs/Twist.h"
#include "geometry_msgs/Vector3.h"
#include "sensor_msgs/Joy.h"
#include "jackal_msgs/Status.h"
#include "std_msgs/Int32.h"
#include "std_msgs/Float32.h"


class MainApplication : public QQmlApplicationEngine {
    Q_OBJECT
    public:
        MainApplication();
        //this method is used to setup all the ROS functionality we need, before the application starts running
        void run();
        void receiveJoy(const sensor_msgs::Joy::ConstPtr& msg);
        void receiveStatus(const jackal_msgs::Status::ConstPtr& msg);
        void receiveSpeedMode(const std_msgs::Int32::ConstPtr& msg);
        void receiveMapScale(const std_msgs::Float32::ConstPtr& msg);

        QObject * getQmlObject(const QString &objectName);

    //this defines a slot that will be called when the application is idle.
    public slots:
        void mainLoop();

   private:
        ros::NodeHandle n;
        ros::Subscriber statusSub;
        ros::Subscriber speedModeSub;
        ros::Subscriber map_scale_subscriber;
        ros::Publisher map_layers_publisher;
        float steering;
        float throttle;

        std::string map_stream_topic;
        std::string map_layers_topic;
        std::string map_scale_topic;
        std::string camera_topic;
        std::string speed_mode_topic;
        std::string jackal_status_topic;

        int map_layers_status;

        int layer_photo;
        int layer_navigation;

        double battery_full;
        double battery_low;
        double battery_critical;

};

#endif // MAINAPPLICATION_H
