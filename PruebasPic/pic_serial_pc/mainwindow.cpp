#include "mainwindow.h"
#include "ui_mainwindow.h"

#include <QMessageBox>
#include <QtSerialPort/QSerialPort>
#include <QThread>

QT_USE_NAMESPACE

#define SET_DATA            ((char) 0x10)
#define GET_DATA            ((char) 0x11)
#define SET_CONTROL         ((char) 0x12)
#define GET_CONTROL         ((char) 0x13)
#define SET_CONTROL_BIT     ((char) 0x14)
#define WR_STROBE           ((char) 0x15)
#define PULSE_1MS           ((char) 0x16)
#define PULSE_1US           ((char) 0x17)
#define UPDATE_PORTA        ((char) 0x18)
#define UPDATE_PORTB        ((char) 0x19)
#define UPDATE_PORTC        ((char) 0x1A)
#define READ_ANALOG         ((char) 0x1B)
#define SCREEN_INIT         ((char) 0x1C)
#define CMD_UNK             ((char) 0x01)
#define CMD_OK              ((char) 0xFF)
#define CMD_ERROR           ((char) 0x00)


MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    serial = new QSerialPort(this);

    connect(ui->openSerialButton, SIGNAL(clicked()),
            this, SLOT(openSerialPort()));

    connect(ui->closeSerialButton, SIGNAL(clicked()),
            this, SLOT(closeSerialPort()));

    connect(ui->setDataButton, SIGNAL(clicked()),
            this, SLOT(setData()));

    connect(ui->getDataButton, SIGNAL(clicked()),
            this, SLOT(getData()));

    connect(ui->setControlButton, SIGNAL(clicked()),
            this, SLOT(setControl()));

    connect(ui->pulse1msButton, SIGNAL(clicked()),
            this, SLOT(pulse1ms()));

    connect(ui->initializeScreenButton, SIGNAL(clicked()),
                this, SLOT(initializeScreen()));

    connect(ui->updatePortAButton, SIGNAL(clicked()),
            this, SLOT(updatePortA()));

    connect(ui->updatePortBButton, SIGNAL(clicked()),
                this, SLOT(updatePortB()));

    connect(ui->updatePortCButton, SIGNAL(clicked()),
                this, SLOT(updatePortC()));

    connect(ui->readAnalogButton, SIGNAL(clicked()),
            this, SLOT(readAnalog()));


    connect(serial, SIGNAL(readyRead()),
                this, SLOT(serialReceive()));

}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::openSerialPort()
{
    serial->setDataBits(QSerialPort::DataBits::Data8);
    serial->setBaudRate(115200);
    serial->setFlowControl(QSerialPort::FlowControl::NoFlowControl);

    serial->setPortName(ui->devicePath->text());

    if (serial->open(QIODevice::ReadWrite))
    {
        QMessageBox::information(this, tr("PicSerial"), tr("Aplicacion lista"));
    }
    else
    {
        QMessageBox::critical(this, tr("Error"), tr("Error al abrir puerto serial"));
    }
}

void MainWindow::closeSerialPort()
{
    serial->close();
}

void MainWindow::setData()
{


    bool ok = true;
    char buffer[2];  
    int writtenBytes;

    int data = ui->inputText->text().toInt(&ok);

    if (ok)
    {        
        buffer[0] = SET_DATA;
        buffer[1] = data;

        serial->clear();
        writtenBytes = serial->write(buffer, 2);

        ui->outputText->setText(QString::asprintf("setData: %d bytes sent", writtenBytes));
    }
}

void MainWindow::getData()
{
    char buffer[3];
    int writtenBytes;

    buffer[0] = GET_DATA;

    serial->clear();
    writtenBytes = serial->write(buffer, 1);

    ui->outputText->setText(QString::asprintf("getData: %d bytes sent", writtenBytes));
}

void MainWindow::setControl()
{
    bool ok = true;
    char buffer[2];
    int writtenBytes;

    int data = ui->inputText->text().toInt(&ok);

    if (ok)
    {
        buffer[0] = SET_CONTROL;
        buffer[1] = data;

        serial->clear();
        writtenBytes = serial->write(buffer, 2);

        ui->outputText->setText(QString::asprintf("setControl: %d bytes sent", writtenBytes));
    }
}

void MainWindow::pulse1ms()
{
    char buffer[5];

    bool ok;
    int data;
    int writtenBytes;

    data = ui->inputText->text().toInt(&ok);

    if (ok)
    {
        buffer[0] = PULSE_1MS;
        *((int*)(buffer + 1)) = data;
        serial->clear();
        writtenBytes = serial->write(buffer, 5);

        ui->outputText->setText(QString::asprintf("pulse1ms: %d bytes sent", writtenBytes));
    }
}

void MainWindow::initializeScreen()
{
    char data[1];
    int writtenBytes;

    data[0] = SCREEN_INIT;

    serial->clear();
    writtenBytes = serial->write(data, 1);

    ui->outputText->setText(QString::asprintf("initializeScreen: %d bytes sent", writtenBytes));
}

void MainWindow::updatePortA()
{
    char buffer[2];
    bool ok;
    int writtenBytes;

    int data = ui->inputText->text().toInt(&ok);

    if (ok)
    {
        buffer[0] = UPDATE_PORTA;
        buffer[1] = data;

        writtenBytes = serial->write(buffer, 2);

        ui->outputText->setText(QString::asprintf("updatePortA: %d bytes sent", writtenBytes));
    }
}

void MainWindow::updatePortB()
{
    char buffer[2];
    bool ok;
    int writtenBytes;

    int data = ui->inputText->text().toInt(&ok);

    if (ok)
    {
        buffer[0] = UPDATE_PORTB;
        buffer[1] = data;

        writtenBytes = serial->write(buffer, 2);

        ui->outputText->setText(QString::asprintf("updatePortB: %d bytes sent", writtenBytes));
    }
}

void MainWindow::updatePortC()
{
    char buffer[2];
    bool ok;
    int writtenBytes;

    int data = ui->inputText->text().toInt(&ok);

    if (ok)
    {
        buffer[0] = UPDATE_PORTC;
        buffer[1] = data;

        writtenBytes = serial->write(buffer, 2);

        ui->outputText->setText(QString::asprintf("updatePortC: %d bytes sent", writtenBytes));
    }
}

void MainWindow::readAnalog()
{
    char buffer[2];
    bool ok;
    int writtenBytes;

    int data = ui->inputText->text().toInt(&ok);

    if (ok)
    {
        buffer[0] = READ_ANALOG;
        buffer[1] = data;

        writtenBytes = serial->write(buffer, 2);

         ui->outputText->setText(QString::asprintf("updatePortC: %d bytes sent", writtenBytes));
    }
}


void MainWindow::serialReceive()
{        
    QString message;
    QByteArray data = serial->readAll();

    int length = data.length();

    if (data.at(0) == CMD_UNK)
    {
        message = QString::asprintf("Command not recognized\n");
    }
    else
    {
        message = QString::asprintf("Command %d: %s\n",
                      data.at(0),
                      ((data.at(1) == CMD_OK) ? "success" : "fails"));
    }

    ui->outputText->setText(message);

    for (int i = 0; i < length; ++i)
    {
        ui->outputText->append(QString::asprintf("%2X ", data.at(i)));
    }
}

