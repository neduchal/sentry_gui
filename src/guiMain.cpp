#include <ros/ros.h>
#include <QGuiApplication>
#include <gui/MainApplication.hpp>

int main(int argc, char **argv)
{
  ros::init(argc, argv, "guiMain");
  ros::NodeHandle nh;

  QGuiApplication app(argc, argv); 
  MainApplication engine;

  ros::Subscriber sub = nh.subscribe<sensor_msgs::Joy>("/joy", 10, &MainApplication::receiveJoy, &engine);

  engine.run();

  return app.exec();
}
