#include <gui/ROSVideoComponent.hpp>

ROSVideoComponent::ROSVideoComponent(QQuickItem * parent) : QQuickPaintedItem(parent), currentImage(NULL), currentBuffer(NULL) {

}

void ROSVideoComponent::setup(ros::NodeHandle * nh, std::string topic) {
    image_transport::ImageTransport imgTrans(*nh);
    imageSub = imgTrans.subscribe(topic, 1, &ROSVideoComponent::receiveImage, this, image_transport::TransportHints("compressed"));
    //ROS_INFO("setup");
}

void ROSVideoComponent::receiveImage(const sensor_msgs::Image::ConstPtr &msg) {
    // delete "old" image to avoid memory leak
    if(this->currentImage) {
        delete this->currentImage;
    }
    // allocate a buffer
    uchar * tempBuffer = (uchar *) malloc(sizeof(uchar) * msg->data.size());
    // copy the message into the buffer
    memcpy(tempBuffer, msg->data.data(), msg->data.size());
    // we then create a new QImage
    this->currentImage = new QImage(tempBuffer, msg->width, msg->height, QImage::Format_RGB888);
    ROS_INFO("Recieved");
    // We then swap out of buffer to avoid memory leaks
    if(this->currentBuffer) {
        delete this->currentBuffer;
        this->currentBuffer = tempBuffer;
    }
    // And re-render the component to display the new image.
    update();
}

void ROSVideoComponent::paint(QPainter *painter) {
    if(currentImage) {
        painter->drawImage(QPoint(0,0), *(this->currentImage));
    }
}
