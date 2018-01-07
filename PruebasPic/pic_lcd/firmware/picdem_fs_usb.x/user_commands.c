/*
 * File:   user_commands.c
 * Author: jose arias
 *
 * Created on 10 de abril de 2017, 08:22 PM
 */


#include <xc.h>
#include <pic18f4550.h>
#include "user_commands.h"
#include "../../src/usb_device_cdc.h"

#include "../../lcd_lib/AdafruitGfx.h"
#include "../../lcd_lib/TftLcd.h"
#include "../../lcd_lib/TftLcdIO.h"

volatile char updateScreen = 0x00;
#define COUNTER_RELOAD (22)
volatile int timer3Counter = COUNTER_RELOAD;

void Commands_ISR()
{
    if (PIE2bits.TMR3IE && PIR2bits.TMR3IF)
    {
        PIR2bits.TMR3IF = 0;        
        
        Commands_UpdateScreen();
    }   
}

void Commands_Initialize()
{
    // Disable ADC
    ADCON0 = 0x00;
    ADCON1 = 0x0F;
    // Disable comparators
    CMCON = 0x07;
    
    // Enable TIMER3 16 bits
    T3CON = 0b10110100;
    PIR2bits.TMR3IF = 0;    
    T3CONbits.TMR3ON = 1;
    PIE2bits.TMR3IE = 1;
    IPR2bits.TMR3IP = 1;
    INTCONbits.PEIE = 1;
    INTCONbits.GIEH = 1;    
    
    ei();
}

/**
 Objeto global manejador del modulo  rutinas graficas para pantalla
 */
Gfx g_gfx;

void Screen_Initialize()
{   
    TftLcdIO_Init();
    Gfx_Init(&g_gfx, TFTWIDTH, TFTHEIGHT, &TftLcd_DrawPixel);
    TftLcd_Init();    
    
    __delay_ms(500);
    
    //Gfx_SetCursor(0, 0);
    TftLcd_SetRotation(1);
    Gfx_SetRotation(1);    
    Gfx_FillScreen(rand() % 0x10000);
    
    Screen_RandomText();

} // end InitializeScreen

void Screen_RandomText()
{       
    Gfx_SetCursor(rand() % TFTWIDTH, rand() % TFTHEIGHT);
    Gfx_SetTextColor(rand() % 0x10000);
    Gfx_SetTextSize(rand() % 4);
    
    Gfx_Print("Cendit Board");    
}

void Commands_UpdateScreen()
{
    updateScreen = 0xFF;
}

static uint8_t readBuffer[CDC_DATA_OUT_EP_SIZE];
static uint8_t writeBuffer[CDC_DATA_IN_EP_SIZE];

void Commands_Process()
{
    /* If the USB device isn't configured yet, we can't really do anything
     * else since we don't have a host to talk to.  So jump back to the
     * top of the while loop. */
    if( USBGetDeviceState() < CONFIGURED_STATE )
    {
        return;
    }

    /* If we are currently suspended, then we need to see if we need to
     * issue a remote wakeup.  In either case, we shouldn't process any
     * keyboard commands since we aren't currently communicating to the host
     * thus just continue back to the start of the while loop. */
    if( USBIsDeviceSuspended()== true )
    {
        return;
    }
    
    if( USBUSARTIsTxTrfReady() == true)
    {
        uint8_t i;
        uint8_t numBytesRead;
        uint8_t numBytesWrite;
        unsigned long delayCount;
        
        char data;

        numBytesRead = getsUSBUSART(readBuffer, sizeof(readBuffer));
        
        if (numBytesRead <= 0)
            return;
    
        char cmd = readBuffer[0];
        /*
        if (cmd == 'i') 
        {            
            Screen_Initialize();
            putrsUSBUSART("Rcv: Initialize screen");
        }
        else if (cmd == 'b' && numBytesRead >= 2)
        {            
            PORTB = readBuffer[1];
            putrsUSBUSART("Rcv: Update PORTB");
        }
        else if (cmd == 'c' && numBytesRead >= 2)
        {          
            PORTC = readBuffer[1];
            putrsUSBUSART("Rcv: Update PORTC");            
        } 
        else 
        {
            putrsUSBUSART("Rcv: Unknown command");
        }    
        */

        #define SET_DATA            0x10
        #define GET_DATA            0x11
        #define SET_CONTROL         0x12
        #define GET_CONTROL         0x13
        #define SET_CONTROL_BIT     0x14
        #define WR_STROBE           0x15
        #define PULSE_1MS           0x16
        #define PULSE_1US           0x17
        #define UPDATE_PORTA        0x18
        #define UPDATE_PORTB        0x19
        #define UPDATE_PORTC        0x1A
        #define READ_ANALOG         0x1B
        #define SCREEN_INIT         0x1C
        #define CMD_UNK             0x01
        #define CMD_OK              0xFF
        #define CMD_ERROR           0x00
        
        switch (cmd)
        {
            case SET_DATA:
                if (numBytesRead > 1)
                {
                    data = readBuffer[1];
                    TftLcdIO_Write8(data);
                    writeBuffer[0] = SET_DATA;
                    writeBuffer[1] = CMD_OK;
                    writeBuffer[2] = data;
                    numBytesWrite = 3;
                }
                
                break;
                
            case GET_DATA:
                
                data = LATB;
                data &= 0b11011111;
                if (RD_BIT != 0)
                {
                    data |= 0b00100000;
                }
                
                writeBuffer[0] = GET_DATA;
                writeBuffer[1] = CMD_OK;
                writeBuffer[2] = data;
                numBytesWrite = 3;
                
                break;
                    
            case SET_CONTROL:
                
                if (numBytesRead  > 1)
                {
                    LATC = (readBuffer[1] >> 2);
                    LATA = (readBuffer[1] & 0b00000011);
                    writeBuffer[0] = SET_CONTROL;
                    writeBuffer[1] = CMD_OK;
                    writeBuffer[2] = (LATC << 2) | (LATA & 0x03);                    
                    numBytesWrite = 3;
                }
                
                break;
                
            case WR_STROBE:
                
                TftLcdIO_WrStrobe();
                
                writeBuffer[0] =  WR_STROBE;
                writeBuffer[1] = CMD_OK;
                numBytesWrite = 2;
                
                break;
                
            case PULSE_1MS:
                
                if (numBytesRead > 4) 
                {
                    delayCount = *( (uint32_t*)(readBuffer + 1) );
                    // memcpy((void*) &delayCount, (void*)(readBuffer + 1), sizeof(uint32_t));
                    /*
                    delayCount = ((uint32_t)readBuffer[4] << 24) | ((uint32_t)readBuffer[3] << 16) | 
                            ((uint32_t)readBuffer[2] << 8) | (uint32_t)readBuffer[1];
                    */
                    writeBuffer[0] = PULSE_1MS;
                    writeBuffer[1] = CMD_OK;                    
                    // memcpy((void*)(writeBuffer + 2), (void*) &delayCount, sizeof(uint32_t));
                    //*((uint32_t*)(writeBuffer + 2)) = delayCount;
                    writeBuffer[2] = delayCount;
                    writeBuffer[3] = delayCount >> 8;
                    writeBuffer[4] = delayCount >> 16;
                    writeBuffer[5] = delayCount >> 24;  
                    numBytesWrite = 6;
                    
                    while (delayCount-- > 0)
                    {
                         __delay_ms(1);
                         RD_BIT = !RD_BIT;
                    }                    
                }
                
                break;
                
            case PULSE_1US:
                
                if (numBytesRead > 4)
                {
                    // delayCount = *( (uint32_t*)(readBuffer + 1) );
                    // memcpy((void*) &delayCount, (void*)(readBuffer + 1), sizeof(uint32_t));
                    delayCount = ((uint32_t)readBuffer[4] << 24) | ((uint32_t)readBuffer[3] << 16) | 
                            ((uint32_t)readBuffer[2] << 8) | (uint32_t)readBuffer[1];
                                      writeBuffer[0] = PULSE_1US;
                                      
                    writeBuffer[0] = PULSE_1US;                  
                    writeBuffer[1] = CMD_OK;
                    // *((uint32_t*)(writeBuffer + 2)) = delayCount;
                    // memcpy((void*)(writeBuffer + 2), (void*) &delayCount, sizeof(uint32_t));
                    writeBuffer[2] = delayCount;
                    writeBuffer[3] = delayCount >> 8;
                    writeBuffer[4] = delayCount >> 16;
                    writeBuffer[5] = delayCount >> 24;
                    numBytesWrite = 6;           
                    
                    while (delayCount-- > 0)
                    {
                         __delay_us(1);
                         RD_BIT = !RD_BIT;
                    }       
                }                
                
                break;     
                
            case UPDATE_PORTA:
                
                if (numBytesRead > 1)
                {
                    LATA = readBuffer[1];
                    writeBuffer[0] = UPDATE_PORTA;
                    writeBuffer[1] = CMD_OK;
                    writeBuffer[2] = LATA;
                    numBytesWrite = 3;
                }
                
                break;
                
            case UPDATE_PORTB:
                
                if (numBytesRead > 1)
                {
                    LATB = readBuffer[1];
                    writeBuffer[0] = UPDATE_PORTB;
                    writeBuffer[1] = CMD_OK;
                    writeBuffer[2] = LATB;
                    numBytesWrite = 3;
                }
                
                break;

            case UPDATE_PORTC:
                
                if (numBytesRead > 1)
                {
                    LATC = readBuffer[1];
                    writeBuffer[0] = UPDATE_PORTC;
                    writeBuffer[1] = CMD_OK;
                    writeBuffer[2] = LATC;
                    numBytesWrite = 3;
                }
                
                break;      
                
            case SCREEN_INIT:
                
                Screen_Initialize();
                
                writeBuffer[0] = SCREEN_INIT;
                writeBuffer[1] = CMD_OK;                
                numBytesWrite = 2;
                
                break;                  
                
            default:
                
                writeBuffer[0] = CMD_UNK;
                writeBuffer[1] = CMD_ERROR;
                numBytesWrite = 1;
                
                break;
        }
        
        if (numBytesWrite > 0)
        {
            putUSBUSART(writeBuffer, numBytesWrite);
            numBytesWrite = 0;
        }
    }   

    // CDCTxService();
}

void Commands_Background()
{
    if (updateScreen != 0x00)
    {
        updateScreen = 0x00;
        
        if (--timer3Counter <= 0)
        {
            timer3Counter = COUNTER_RELOAD;
            Screen_RandomText();
        }
    }    
}