#include <gui/rosmapcomponent.hpp>
#include <QTimer>
#include <QBrush>
#include <string>
#include <QApplication>

ROSMapComponent::ROSMapComponent(QQuickItem * parent) : QQuickPaintedItem(parent) {
  setOpaquePainting(true);
  setAcceptHoverEvents(true);
  setAcceptedMouseButtons(Qt::AllButtons);
  render_panel_ = new rviz::RenderPanel();
  manager_ = new rviz::VisualizationManager( render_panel_ );
  render_panel_->initialize( manager_->getSceneManager(), manager_ );
  manager_->initialize();
  manager_->startUpdate();
  grid_ = manager_->createDisplay( "rviz/Grid", "adjustable grid", true );
  grid_->subProp( "Line Style" )->setValue( "Billboards" );
  grid_->subProp( "Color" )->setValue( QColor( Qt::white ) );
  QTimer::singleShot(0, this, SLOT(update()));

}

void ROSMapComponent::setup(std::string topic) {
  map_ = manager_->createDisplay("rviz/Map", "Map", true);
  map_->subProp("Topic")->setValue(topic.c_str());
}

ROSMapComponent::~ROSMapComponent() {
  delete manager_;
}

void ROSMapComponent::paint(QPainter *painter) {
  render_panel_->render(painter,  QPoint(), QRegion(), 0);
  update();
}
