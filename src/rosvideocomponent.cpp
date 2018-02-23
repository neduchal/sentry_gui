#include <gui/rosvideocomponent.hpp>

ROSVideoComponent::ROSVideoComponent(QQuickItem * parent) : QQuickPaintedItem(parent), currentImage(NULL), currentBuffer(NULL) {

}

void ROSVideoComponent::setup(ros::NodeHandle * nh, std::string topic, QImage::Format format, std::string transportType) {
    image_transport::ImageTransport imgTrans(*nh);
    imageSub = imgTrans.subscribe(topic, 2, &ROSVideoComponent::receiveImage, this, image_transport::TransportHints(transportType));
    imageFormat = format;
}

void ROSVideoComponent::receiveImage(const sensor_msgs::Image::ConstPtr &msg) {
    // delete "old" image to avoid memory leak
    if(currentImage) {
        delete currentImage;
    }
    // allocate a buffer
    uchar * tempBuffer = (uchar *) malloc(sizeof(uchar) * msg->data.size());
    // copy the message into the buffer
    memcpy(tempBuffer, msg->data.data(), msg->data.size());

    // we then create a new QImage
    currentImage = new QImage(tempBuffer, msg->width, msg->height, imageFormat);
    // We then swap out of buffer to avoid memory leaks
    if(currentBuffer) {
        delete currentBuffer;
        currentBuffer = tempBuffer;
    }
    // And re-render the component to display the new image.
    update();
}

void ROSVideoComponent::paint(QPainter *painter) {
    if(currentImage) {
        painter->drawImage(QPoint(0,0), *(currentImage));
    }
}
