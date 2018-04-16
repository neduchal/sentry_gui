#include <gui/layer_button.hpp>

Layer_button::Layer_button(QObject *parent) : QObject(parent)
{
    layers_status_publisher = n.advertise<std_msgs::Int32>("/sentry_gui/map_layers_status", 10);
    map_layers_status = 0;
}

/**
 * @brief MainApplication::publishMapLayersStatus
 *
 * Publikovani stavu (zapnuto/vypnuto) vrstev mapy
 */
void Layer_button::saveLayerStatus(int button, int value) {
  std_msgs::Int32 msg;

  if (value == 1) {
    map_layers_status |= (value << button);
  } else {
    map_layers_status &= ~(1 << button);
  }

  msg.data = map_layers_status;
  layers_status_publisher.publish(msg);
}
