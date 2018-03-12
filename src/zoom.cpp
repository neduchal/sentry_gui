#include <gui/zoom.hpp>

Zoom::Zoom(QObject *parent) : QObject(parent)
{
    zoom_publisher = nh.advertise<std_msgs::Float32>("/map_tile_size", 10);
}

void Zoom::zoomPlus() {
   std_msgs::Float32 zoom_factor = 2.0;
   zoom_publisher.publish(zoom_factor);
}

void Zoom::zoomMinus() {
    std_msgs::Float32 zoom_factor = -2.0;
    zoom_publisher.publish(zoom_factor);
}
