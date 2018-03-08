#include <gui/ROSMapComponent.hpp>

ROSMapComponent::ROSMapComponent(QQuickItem * parent) : QQuickPaintedItem(parent) {
  map_subscriber = n.subscribe("/map", 10, &ConverterClass::callback, this);
  render_panel_ = new rviz::RenderPanel();
  manager_ = new rviz::VisualizationManager( render_panel_ );
  render_panel_->initialize( manager_->getSceneManager(), manager_ );
  manager_->initialize();
  manager_->startUpdate();
  grid_ = manager_->createDisplay( "rviz/Grid", "adjustable grid", true );
  grid_->subProp( "Line Style" )->setValue( "Billboards" );
  grid_->subProp( "Color" )->setValue( QColor( Qt::white ) );
}

void ROSMapComponent::setup(ros::NodeHandle * nh, std::string topic) {
  map_ = manager_->createDisplay("rviz/Map", "Map", true);
  map_->subProp("Topic")->setValue(topic);
}

ROSMapComponent::~ROSMapComponent() {
  delete manager_;
}

void ROSVideoComponent::paint(QPainter *painter) {


    if(currentImage) {
        painter->drawImage(QPoint(0,0), *(this->currentImage));
    }
}
