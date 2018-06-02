#include <gui/photo.hpp>

Photo::Photo(QObject *parent) : QObject(parent)
{
    photo_publisher = nh.advertise<std_msgs::Empty>("/sentry_photo/trigger", 10);
}

void Photo::takePhoto() {
   std_msgs::Empty trigger;
   photo_publisher.publish(trigger);
}
