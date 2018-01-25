#include <ros/ros.h>
#include <QGuiApplication>
#include <QQmlContext>
#include <gui/MainApplication.hpp>
#include <gui/buttonclick.hpp>

int main(int argc, char **argv)
{
  ros::init(argc, argv, "guiMain");
  ros::NodeHandle nh;

  QGuiApplication app(argc, argv); 

  MainApplication engine;
  ButtonClick buttonClass;


  ros::Subscriber sub = nh.subscribe<sensor_msgs::Joy>("/joy", 10, &MainApplication::receiveJoy, &engine);
  engine.rootContext()->setContextProperty("_myClass", &buttonClass);

  engine.run();

  return app.exec();
}
