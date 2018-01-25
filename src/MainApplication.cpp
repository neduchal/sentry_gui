#include <gui/MainApplication.hpp>
#include <QTimer>
#include <string>
#include <QDebug>
#include <gui/rosvideocomponent.hpp>

MainApplication::MainApplication() {

}

void MainApplication::run() {

    qmlRegisterType<ROSVideoComponent>("ros.videocomponent",1,0,"ROSVideoComponent");


    //this loads the qml file we are about to create
    this->load(QUrl(QStringLiteral("qrc:/qml/MainWindow.qml")));

    //Setup a timer to get the application's idle loop
    QTimer *timer = new QTimer(this);
    connect(timer, SIGNAL(timeout()), this, SLOT(mainLoop()));
    timer->start(0);

    ROSVideoComponent * video = this->rootObjects()[0]->findChild<ROSVideoComponent*>(QString("videoStream"));
    video->setup(&nh, "/wide_stereo/left/image_raw");
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


void MainApplication::receiveJoy(const sensor_msgs::Joy::ConstPtr& msg)
{
  this->steering = msg->axes[0];
  this->throttle = msg->axes[2];
  QObject *joy = this->getQmlObject("joy");
  joy->setProperty("text", QString::number(msg->axes[0]));
  QObject *textJoy = this->getQmlObject("textJoy");
  textJoy->setProperty("text", QString::number(msg->axes[2]));
}
