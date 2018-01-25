#ifndef BUTTONCLICK_HPP
#define BUTTONCLICK_HPP

#include <QDebug>
#include <QObject>
#include <iostream>

class ButtonClick : public QObject
{
    Q_OBJECT

public:
    explicit ButtonClick(QObject *parent = 0);

public slots:
    void buttonClicked(const QString& in);
};

#endif // BUTTONCLICK_HPP
