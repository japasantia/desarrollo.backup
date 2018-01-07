#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QtCore/QtGlobal>

#include <QMainWindow>
#include <QtSerialPort/QSerialPort>

QT_USE_NAMESPACE

namespace Ui {
class MainWindow;
}

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit MainWindow(QWidget *parent = 0);
    ~MainWindow();

protected slots:

    void openSerialPort();
    void closeSerialPort();

    void initializeScreen();

    void setData();
    void getData();
    void setControl();
    void pulse1ms();

    void updatePortA();
    void updatePortB();
    void updatePortC();
    void serialReceive();
    void readAnalog();    


private:
    Ui::MainWindow *ui;

    QSerialPort* serial;
};

#endif // MAINWINDOW_H
