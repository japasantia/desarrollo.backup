/* 
 * File:   app_custom_cdc.h
 * Author: vsk hs-ulm
 *
 * Created on 22. July 2014, 13:30
 */
#ifndef CUSTOM_CDC_H
#define	CUSTOM_CDC_H

//------------------------------------------- P U B L I C    P R O T O T Y P E S
void APP_CustomCDCInitialize(void);     // legacy
void APP_CustomCDCTasks(void);          // legacy ProcessIO()

void APP_USBCBSuspend(void);            // empty ;-)
void APP_USBCBWakeFromSuspend(void);    //
void APP_USBCB_SOF_Handler(void);       //
void APP_USBCBErrorHandler(void);       //
void APP_USBCBStdSetDscHandler(void);   //

//## HSU LED CTRL  I N S T R U C T I O N    D E F I N I T I O N S ##############

typedef enum {
    CMD_INIT    = 0x00,     // init processor
//    CMD_STOP,               // stop Data
//    CMD_OPEN,               // activate system
//    CMD_CLOSE,              // terminate everything but communications
//    CMD_SEND,               // send Data
//    CMD_BUSY    = 0x8F,
    CMD_DEVICE  = 0x10,     // send device identification string
    CMD_VERSION,            // send version info-string
    CMD_DATE,               // send date info-string
    CMD_MANU,               // send developper info-string
    CMD_MISC,               // send miscellanous info-string
    CMD_LED3_OFF = 0x30,    //
    CMD_LED3_ON,            //
    CMD_LED3_TOG,
    CMD_LED4_OFF = 0x40,    //
    CMD_LED4_ON,            //
    CMD_LED4_TOG,
    CMD_BUTTON   = 0x50,    // get button state (1 == pressed)
    CMD_POTI     = 0x60,    // get analog value
    ID_MESSAGE   = 0x80,
    ID_ERROR     = 0xFF
}COMMANDS;

#endif	/* CUSTOM_CDC_H */

