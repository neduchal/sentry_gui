#include <gui/MainApplication.hpp>
#include <QTimer>
#include <string>
#include <QDebug>
#include <gui/rosvideocomponent.hpp>
//#include <gui/rosmapcomponent.hpp>
#include <QtGlobal>

MainApplication::MainApplication() {

}

void MainApplication::run() {
  // Param load
  n.param<std::string>(ros::this_node::getName()+"/topic/map_stream_topic", map_stream_topic, "/map_stream");
  n.param<std::string>(ros::this_node::getName()+"/topic/map_scale_topic", map_scale_topic, "/map_scale");
  n.param<std::string>(ros::this_node::getName()+"/topic/camera_topic", camera_topic, "/camera_topic");
  n.param<std::string>(ros::this_node::getName()+"/topic/speed_mode", speed_mode_topic, "/speed_mode");
  n.param<std::string>(ros::this_node::getName()+"/topic/jackal_status", jackal_status_topic, "/status");

  n.param<float>(ros::this_node::getName()+"/battery/full", battery_full, 30.0);
  n.param<float>(ros::this_node::getName()+"/battery/low", battery_low, 24.0);
  n.param<float>(ros::this_node::getName()+"/battery/critical", battery_critical, 20.0);

  // Registration of QML component
  qmlRegisterType<ROSVideoComponent>("ros.videocomponent",1,0,"ROSVideoComponent");

  //this loads the qml file we are about to create
  this->load(QUrl(QStringLiteral("qrc:/qml/MainWindow.qml")));

  //Setup a timer to get the application's idle loop
  QTimer *timer = new QTimer(this);
  connect(timer, SIGNAL(timeout()), this, SLOT(mainLoop()));
  timer->start(0);

  // Objects of ROSVideoComponent for Camera, TermoCamera and Map streams
  ROSVideoComponent *  camera = this->rootObjects()[0]->findChild<ROSVideoComponent*>(QString("cameraStream"));
  //ROSVideoComponent * thermo = this->rootObjects()[0]->findChild<ROSVideoComponent*>(QString("thermoStream"));
  ROSVideoComponent * map = this->rootObjects()[0]->findChild<ROSVideoComponent*>(QString("mapStream"));

  // Setup of streams
  camera->setup(&n, camera_topic, QImage::Format_Grayscale8, "raw"); // in the case of grayscale cam
  //thermo->setup(&n, "/thermo_topic", QImage::Format_Grayscale8, "raw");
  map->setup(&n, map_stream_topic, QImage::Format_RGB888, "raw");

  statusSub = this->n.subscribe<jackal_msgs::Status>(jackal_status_topic, 10, &MainApplication::receiveStatus, this);
  speedModeSub = this->n.subscribe<std_msgs::Int32>(speed_mode_topic, 10, &MainApplication::receiveSpeedMode, this);
  map_scale_subscriber = this->n.subscribe<std_msgs::Float32>(map_scale_topic, 10, &MainApplication::receiveMapScale, this);

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
  float battery_voltage_value = msg->measured_battery;
  float battery_voltage_percent = 0.0;

  battery_voltage_percent = 100.0 * ((battery_voltage_value - (battery_critical - 2)) / (battery_full - (battery_critical - 2)))

  QObject *batteryVoltageValue = this->getQmlObject("batteryVoltageValue");
  batteryVoltageValue->setProperty("text", QString::number(battery_voltage_percent));
  if (battery_voltage_value > battery_low) {
    batteryVoltageValue->setProperty("color", "#00AA00");
  } else if ((battery_voltage_value <= battery_low) && (battery_voltage_value > battery_critical)) {
    batteryVoltageValue->setProperty("color", "#FFA500");
  } else {
    batteryVoltageValue->setProperty("color", "#AA0000");
  }

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

void MainApplication::receiveMapScale(const std_msgs::Float32::ConstPtr& msg) {
  QObject *SpeedModeValue = this->getQmlObject("mapScaleValue");
  batteryVoltageValue->setProperty("text", QString::number(msg->data));
}
