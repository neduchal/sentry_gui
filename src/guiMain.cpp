#include <ros/ros.h>
#include <QGuiApplication>
#include <QApplication>
#include <QQmlContext>
#include <gui/MainApplication.hpp>
#include <gui/zoom.hpp>

int main(int argc, char **argv)
{
  ros::init(argc, argv, "guiMain");

  QApplication app(argc, argv);

  MainApplication engine;
  //ButtonClick buttonClass;
  Zoom zoomClass;

  //ros::Subscriber sub = nh.subscribe<sensor_msgs::Joy>("/joy", 10, &MainApplication::receiveJoy, engine);
  //engine->rootContext()->setContextProperty("_myClass", &buttonClass);
  engine.rootContext()->setContextProperty("_zoomClass", &zoomClass);
  engine.run();

  return app.exec();
}
