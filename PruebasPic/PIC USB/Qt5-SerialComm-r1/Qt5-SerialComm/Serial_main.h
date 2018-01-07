#ifndef SERIALMAIN_H
#define SERIALMAIN_H


#include <QMainWindow>
#include <QTimer>
#include "qextserialport.h"
#include "../_QT_Libs/HS-ULM/qhsuprot.h"


typedef enum {
    CID_INIT    = 0x00, // not used
    CID_STOP,           // not used
    CID_CLOSE,          // disconnect Device <-> PC
    CID_START,          // not used
    CID_DEVICE  = 0x10, // send device identification string
    CID_VERSION,        // send version info-string
    CID_DATE,           // send date info-string
    CID_MANU,           // send developper info-string
    CID_MISC            // send miscellanous info-string
}TYPE_CMD_ID;

#define PCK_STOP        "aa0101ab"
#define PCK_START       "aa0303ab"
#define PCK_getDEVICE   "aa1010ab"
#define PCK_getVERSION  "aa1111ab"
#define PCK_getDATE     "aa1212ab"
#define PCK_getMANU     "aa1313ab"
#define PCK_getMISC     "aa1414ab"

typedef enum {
    MSG_BIT     = 0x80,
    MID_BUSY    = 0x0F,
    MID_ERROR   = 0xFF
}TYPE_MSG_ID;


namespace Ui {
class SerialMain;
}

class SerialMain : public QMainWindow
{
    Q_OBJECT
    
public:
    explicit SerialMain(QWidget *parent = 0);
    ~SerialMain();
    
private slots:
    void on_btnConnect();
    void on_btnSend_1();
    void on_btnSend_2();
    void on_btnSend_Prot();
    void on_btnSend_File();
    void on_btnClear();
    void on_ReadyRead();
    void on_inPck();
    void closePort();
    void wait_ms(uint milliseconds);

private:
    Ui::SerialMain *ui;
    QTimer *timer;
    QextSerialPort *port;
    QhsuProt *inOut;
    serialPck inPck_;
    serialPck outPck_;

};

#endif // SERIALMAIN_H
