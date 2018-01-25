#ifndef ROSVIDEOCOMPONENT_HPP
#define ROSVIDEOCOMPONENT_HPP

#include <QQuickPaintedItem>
#include <ros/ros.h>
#include <string>
#include <image_transport/image_transport.h>
#include <sensor_msgs/Image.h>
#include <QImage>
#include <QPainter>

class ROSVideoComponent : public QQuickPaintedItem {
    // this marks the component as a Qt Widget
    Q_OBJECT

    public:
        ROSVideoComponent(QQuickItem *parent = 0);

        void paint(QPainter *painter);
        void setup(ros::NodeHandle * nh, std::string topic);

    private:
        void receiveImage(const sensor_msgs::Image::ConstPtr & msg);

        ros::NodeHandle * nh;
        image_transport::Subscriber imageSub;
        // these are used to store our image buffer
        QImage * currentImage;
        uchar * currentBuffer;
};

#endif // ROSVIDEOCOMPONENT_HPP
