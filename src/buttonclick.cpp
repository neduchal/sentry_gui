#include <gui/buttonclick.hpp>

ButtonClick::ButtonClick(QObject *parent) : QObject(parent)
{

}

void ButtonClick::buttonClicked(const QString &in) {
   std::cout << in.toUtf8().constData() << std::endl;
}
