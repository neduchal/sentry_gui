#include <gui/MainApplication.hpp>
#include <QTimer>
#include <string>
#include <QDebug>
#include <gui/rosvideocomponent.hpp>
#include <gui/rosmapentity.hpp>
#include <QtGlobal>

MainApplication::MainApplication() {

}

void MainApplication::run() {
  // Registration of QML component
  qmlRegisterType<ROSVideoComponent>("ros.videocomponent",1,0,"ROSVideoComponent");
  qmlRegisterType<ROSMapEntity>("ros.mapentity",1,0,"ROSMapEntity");
  //qmlRegisterType<ROSMapComponent>("ros.mapcomponent",1,0,"ROSMapComponent");


  //this loads the qml file we are about to create
  this->load(QUrl(QStringLiteral("qrc:/qml/MainWindow.qml")));

  //Setup a timer to get the application's idle loop
  QTimer *timer = new QTimer(this);
  connect(timer, SIGNAL(timeout()), this, SLOT(mainLoop()));
  timer->start(0);

  // Objects of ROSVideoComponent for Camera, TermoCamera and Map streams
  ROSVideoComponent *  camera = this->rootObjects()[0]->findChild<ROSVideoComponent*>(QString("cameraStream"));
  ROSVideoComponent * thermo = this->rootObjects()[0]->findChild<ROSVideoComponent*>(QString("thermoStream"));
  //ROSVideoComponent * map = this->rootObjects()[0]->findChild<ROSVideoComponent*>(QString("mapStream"));
  //ROSMapComponent * map = this->rootObjects()[0]->findChild<ROSMapComponent*>(QString("mapStream"));

  // Setup of streams
  camera->setup(&nh, "/pylon_camera_node/image_raw", QImage::Format_Grayscale8, "raw"); // in the case of grayscale cam
  thermo->setup(&nh, "/thermo_topic", QImage::Format_Grayscale8, "raw");
  //map->setup(&nh, "/map_stream", QImage::Format_RGB888, "raw");


  statusSub = this->nh.subscribe<jackal_msgs::Status>("/status", 10, &MainApplication::receiveStatus, this);
  speedModeSub = this->nh.subscribe<std_msgs::Int32>("/jackal_speed_mode", 10, &MainApplication::receiveSpeedMode, this);

}

void MainApplication::mainLoop() {
  ros::spinOnce();
}

QObject * MainApplication::getQmlObject(const QString &objectName)
{
  QObject *rootObject = this->rootObjects().first();
  QObject *qmlObject = rootObject->findChild<QObject *>(objectName);
  return qmlObject;
}

void MainApplication::receiveStatus(const jackal_msgs::Status::ConstPtr& msg)
{
  QObject *batteryVoltageValue = this->getQmlObject("batteryVoltageValue");
  batteryVoltageValue->setProperty("text", QString::number(msg->measured_battery));
}

void MainApplication::receiveSpeedMode(const std_msgs::Int32::ConstPtr& msg)
{
  QObject *SpeedModeValue = this->getQmlObject("speedModeValue");
  QString speed_mode;
  switch (msg->data) {
  case 0:
    speed_mode = "STOP";
    break;
  case 1:
    speed_mode = "SLOW";
    break;
  case 2:
    speed_mode = "NORMAL";
    break;
  case 3:
    speed_mode = "FAST";
    break;
  case 4:
    speed_mode = "TURBO";
    break;
  default:
    speed_mode = "N/A";
    break;
  }
  SpeedModeValue->setProperty("text", speed_mode);
}

/*
void MainApplication::receiveJoy(const sensor_msgs::Joy::ConstPtr& msg)
{
  this->steering = msg->axes[0];
  this->throttle = msg->axes[2];
  QObject *joy = this->getQmlObject("joy");
  joy->setProperty("text", QString::number(msg->axes[0]));
  QObject *textJoy = this->getQmlObject("textJoy");
  textJoy->setProperty("text", QString::number(msg->axes[2]));
}
*/
