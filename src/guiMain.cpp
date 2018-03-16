#include <ros/ros.h>
#include <QGuiApplication>
#include <QApplication>
#include <QQmlContext>
#include <gui/MainApplication.hpp>
#include <gui/zoom.hpp>

int main(int argc, char **argv)
{
  ros::init(argc, argv, "guiMain");

  std::cout << QT_VERSION_STR << std::endl;

  QApplication app(argc, argv);

  MainApplication engine;
  //ButtonClick buttonClass;
  Zoom zoomClass;

  engine.rootContext()->setContextProperty("_zoomClass", &zoomClass);
  engine.run();

  return app.exec();
}
