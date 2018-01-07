#include "Serial_main.h"
#include "ui_SerialMain.h"
#include <QTextStream>
#include <QFileDialog>

#define VERSION "Serial Communication Demo [24.07.2014]"

#define COM_STRING "COM"            //Windows
//#define COM_STRING "/dev/ttyUSB"    //Linux USB-RS232
//#define COM_STRING "/dev/rfcomm"    //Linux BT


SerialMain::SerialMain(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::SerialMain)
{
    ui->setupUi(this);
    setWindowTitle(VERSION);
    ui->btnSend_1->setEnabled(false);
    ui->btnSend_2->setEnabled(false);
    ui->btnSend_Prot->setEnabled(false);
    ui->btnSend_File->setEnabled(false);
    ui->edReceive->moveCursor(QTextCursor::End);  // (for auto-scolling)


    PortSettings settings = {(BaudRateType)ui->sbBaudrate->value(),
                              DATA_8, PAR_NONE, STOP_1, FLOW_OFF, 1000};
    port = new QextSerialPort(QString(COM_STRING) +"1", settings, QextSerialPort::EventDriven);
    if(port->isOpen())port->close();
    inOut = new QhsuProt();

    connect(ui->btnConnect, SIGNAL(clicked()), SLOT(on_btnConnect()));
    connect(ui->btnSend_1, SIGNAL(clicked()), SLOT(on_btnSend_1()));
    connect(ui->btnSend_2, SIGNAL(clicked()), SLOT(on_btnSend_2()));
    connect(ui->btnSend_Prot, SIGNAL(clicked()), SLOT(on_btnSend_Prot()));
    connect(ui->btnSend_File, SIGNAL(clicked()), SLOT(on_btnSend_File()));
    connect(ui->btnClear,SIGNAL(clicked()), SLOT(on_btnClear()));
}

//------------------------------------------------------------------------------
SerialMain::~SerialMain()
{
    if(port->isOpen()){
        closePort();
    }
    wait_ms(1000);
    delete port;
    delete inOut;
    delete ui;
}

//------------------------------------------------------------------------------
void SerialMain::on_btnConnect()
{
    QByteArray rxName;

    if (port->isOpen()){
        closePort();
    }
    else {//open given port
        QApplication::setOverrideCursor(Qt::WaitCursor);
        port->setBaudRate((BaudRateType)ui->sbBaudrate->value());
        if(ui->cbDevice->currentText().startsWith("COM")
                || ui->cbDevice->currentText().startsWith("/dev/")){
            port->setPortName(ui->cbDevice->currentText());
            port->open(QIODevice::ReadWrite);
            if (port->isOpen()) {
                ui->lblDevice->setText(ui->cbDevice->currentText()+" connected");
                ui->btnConnect->setText("Disconnect");
                connect(this->port, SIGNAL(readyRead()),this, SLOT(on_ReadyRead()));
            }
        }
        else{// ! COM, /dev/...
            for(int n_port = 1; n_port < 50; n_port++){
                port->setPortName(COM_STRING + QString("%1").arg(n_port));
                port->open(QIODevice::ReadWrite);
                if (port->isOpen()) {
                    ui->lblDevice->setText("? "+ QString(COM_STRING) + QString("%1").arg(n_port));
                    port->write(QByteArray::fromHex(PCK_getDEVICE));
                    qApp->processEvents();
                    wait_ms(500);
                    rxName = port->read(20);
                    if(rxName.contains((const char *)ui->cbDevice->currentText().data())){
                        ui->lblDevice->setText(ui->cbDevice->currentText()+" connected ");
                        ui->btnConnect->setText("Disconnect");
                        connect(this->port, SIGNAL(readyRead()),this, SLOT(on_ReadyRead()));
                        port->write(QByteArray::fromHex(PCK_getDEVICE));
                        n_port = 50;
                    }
                    else closePort();
                }
            }//for (int n_port = 1; ...
        }
        if (port->isOpen()) {
            ui->sbBaudrate->setEnabled(false);
            ui->btnSend_1->setEnabled(true);
            ui->btnSend_2->setEnabled(true);
            ui->btnSend_Prot->setEnabled(true);
            ui->btnSend_File->setEnabled(true);
        }
        QApplication::restoreOverrideCursor();
    }
}

//------------------------------------------------------------------------------
void SerialMain::closePort()
{
    port->close();
    disconnect(this->port, SIGNAL(readyRead()),this, SLOT(on_ReadyRead()));
    ui->lblDevice->setText("- - - - - - - - ");
    ui->btnConnect->setText("Connect");
    ui->btnSend_1->setEnabled(false);
    ui->btnSend_2->setEnabled(false);
    ui->btnSend_Prot->setEnabled(false);
    ui->btnSend_File->setEnabled(false);
    ui->sbBaudrate->setEnabled(true);
    on_btnClear();
}

//------------------------------------------------------------------------------
void SerialMain::on_btnSend_1()
{
    if(ui->cbHEX_1->isChecked()){
        port->write(QByteArray::fromHex(ui->leToSend_1->text().toLatin1()));
    }
    else{
        port->write(ui->leToSend_1->text().toLatin1());
    }
}

//------------------------------------------------------------------------------
void SerialMain::on_btnSend_2()
{
    if(ui->cbHEX_2->isChecked()){
        port->write(QByteArray::fromHex(ui->leToSend_2->text().toLatin1()));
    }
    else{
        port->write(ui->leToSend_2->text().toLatin1());
    }
}

//------------------------------------------------------------------------------
void SerialMain::on_btnSend_Prot()
{
    QByteArray buffer;

    if(ui->cbHEX_prot->isChecked()){
        buffer = QByteArray::fromHex(ui->leToSend_prot->text().toLatin1());
    }
    else{
        buffer = ui->leToSend_prot->text().toLatin1();
    }

    outPck_.ID = buffer[0];
    outPck_.Size = buffer.size();
    for(int i = 1; i < buffer.size(); i++){
        outPck_.Bytes[i-1] = buffer[i];
    }
    inOut->MakePck(outPck_);
    port->write((const char*)outPck_.Bytes,outPck_.Size);
}

//------------------------------------------------------------------------------
void SerialMain::on_ReadyRead()
{
    if (port->bytesAvailable()){
        QByteArray inBuffer = port->read(port->bytesAvailable());

        ui->edReceive->moveCursor(QTextCursor::End);
        if(ui->cbHEXrec->isChecked()){
            QString s = "";
            for (int i = 0; i < inBuffer.size();i++){
                s += QString("%1").arg((unsigned char)inBuffer[i],3,16);
            }
            ui->edReceive->insertPlainText(s+"\r");
        }
        else{
            for (int i = 0; i < inBuffer.size();i++){
                if(inBuffer[i] == 0x0d){            //TODO check for non ascii
                    inBuffer[i] = '?';
                }
            }
            ui->edReceive->insertPlainText(QString::fromLatin1(inBuffer)+"\r");
        }
        ui->edReceive->ensureCursorVisible();

        for(int i = 0; i < inBuffer.size(); i++){
            if (inOut->ByteImport(inBuffer[i])==PCKCMPL){
                on_inPck();
            }
        }
    }
}

//------------------------------------------------------------------------------
void SerialMain::on_inPck()
{
    inOut->GetPck(inPck_);
    switch(inPck_.ID - MSG_BIT){
    case CID_CLOSE:
        closePort();
        break;
    case CID_DEVICE:
        outPck_.ID = CID_VERSION;
        outPck_.Size = 1;
        inOut->MakePck(outPck_);
        port->write((const char*)outPck_.Bytes,outPck_.Size);
        break;
    case CID_VERSION:
        outPck_.ID = CID_DATE;
        outPck_.Size = 1;
        inOut->MakePck(outPck_);
        port->write((const char*)outPck_.Bytes,outPck_.Size);
        break;
    case CID_DATE:
        outPck_.ID = CID_MANU;
        outPck_.Size = 1;
        inOut->MakePck(outPck_);
        port->write((const char*)outPck_.Bytes,outPck_.Size);
        break;
    case CID_MANU:
        outPck_.ID = CID_MISC;
        outPck_.Size = 1;
        inOut->MakePck(outPck_);
        port->write((const char*)outPck_.Bytes,outPck_.Size);
        break;
    case CID_MISC:
        break;
//    case CID_DEVICE: port->write(QByteArray::fromHex(PCK_getVERSION)); break;
//    case CID_VERSION: port->write(QByteArray::fromHex(PCK_getDATE)); break;
//    case CID_DATE: port->write(QByteArray::fromHex(PCK_getMANU)); break;
//    case CID_MANU: port->write(QByteArray::fromHex(PCK_getMISC)); break;
//    case CID_MISC: break;
    default: {};
    }
}

//------------------------------------------------------------------------------
void SerialMain::on_btnClear()
{
    ui->edReceive->clear();
}

//------------------------------------------------------------------------------
void SerialMain::on_btnSend_File()               // Daten laden
{

    QString fileName = QFileDialog::getOpenFileName(this, tr("Open File"),"",
                                                    tr("Files (*.bin)"));
    QFile file(fileName);
    if(file.open(QIODevice::ReadOnly))
    {
        QApplication::setOverrideCursor(Qt::WaitCursor);
        QByteArray blob = file.readAll();
        file.close();
        port->write(blob);
    }
    QApplication::restoreOverrideCursor();
}

//------------------------------------------------------------------------------
void SerialMain::wait_ms(uint milliseconds) {
  QEventLoop loop;
  QTimer timer;
  timer.setInterval(milliseconds);
  connect(&timer, SIGNAL(timeout()), &loop, SLOT(quit()));
  timer.start();
  loop.exec();
}
