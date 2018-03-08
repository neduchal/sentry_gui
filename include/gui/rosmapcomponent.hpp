#ifndef ROSVIDEOCOMPONENT_HPP
#define ROSVIDEOCOMPONENT_HPP

#include <QQuickPaintedItem>
#include <ros/ros.h>
#include <string>
#include <image_transport/image_transport.h>
#include <sensor_msgs/Image.h>
#include <nav_msgs/OccupancyGrid.h>
#include <QImage>
#include <QPainter>

#include "rviz/visualization_manager.h"
#include "rviz/render_panel.h"
#include "rviz/display.h"

class ROSMapComponent : public QQuickPaintedItem {
    // this marks the component as a Qt Widget
    Q_OBJECT

    public:
        ROSMapComponent(QQuickItem *parent = 0);
        virtual ~ROSMapComponent();

        void paint(QPainter *painter);
        void setup(ros::NodeHandle *nh, std::string topic);

    private:
        ros::NodeHandle * nh;
        ros::Subscriber map_subscriber;
        rviz::VisualizationManager* manager_;
        rviz::RenderPanel* render_panel_;
        rviz::Display* grid_;
        rviz::Display* map_;
        // these are used to store our image buffer
};

#endif // ROSVIDEOCOMPONENT_HPP
