#include <QtWidgets/QApplication>
#include "Serial_main.h"

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    SerialMain w;
    w.show();
    
    return a.exec();
}
