#include <ros/ros.h>
#include <QGuiApplication>
#include <QApplication>
#include <QQmlContext>
#include <gui/MainApplication.hpp>
#include <gui/zoom.hpp>
#include <gui/photo.hpp>
#include <gui/layer_button.hpp>

int main(int argc, char **argv)
{
  ros::init(argc, argv, "guiMain");

  std::cout << QT_VERSION_STR << std::endl;

  QApplication app(argc, argv);

  MainApplication engine;
  //ButtonClick buttonClass;
  Zoom zoomClass;
  Photo photoClass;
  Layer_button layer_button_class;

  //ros::Subscriber sub = nh.subscribe<sensor_msgs::Joy>("/joy", 10, &MainApplication::receiveJoy, engine);
  //engine->rootContext()->setContextProperty("_myClass", &buttonClass);
  engine.rootContext()->setContextProperty("_zoomClass", &zoomClass);
  engine.rootContext()->setContextProperty("_photoClass", &photoClass);
  engine.rootContext()->setContextProperty("_layerButtonClass", &layer_button_class);
  engine.run();

  return app.exec();
}
