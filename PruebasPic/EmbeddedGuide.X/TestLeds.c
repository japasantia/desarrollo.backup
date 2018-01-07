/* 
 * File:   TestLeds.c
 * Author: jarias
 *
 * Created on 8 de mayo de 2017, 01:34 PM
 */

#include <stdio.h>
#include <stdlib.h>

#include <xc.h>
#include "usb.h"
#include "usb_device_cdc.h"
#include "system.h"


/** CONFIGURATION Bits **********************************************/
// BEGIN_MOD
    // #pragma config PLLDIV   = 5       //(20 MHz crystal on PICDEM FS USB board)
    #pragma config PLLDIV   = 4         // (16 MHz crystal)
// END_MOD
#pragma config CPUDIV   = OSC1_PLL2
#pragma config USBDIV   = 2         // Clock source from 96MHz PLL/2
#pragma config FOSC     = HSPLL_HS
#pragma config FCMEN    = OFF
#pragma config IESO     = OFF
#pragma config PWRT     = OFF
#pragma config BOR      = ON
#pragma config BORV     = 3
#pragma config VREGEN   = ON      //USB Voltage Regulator
#pragma config WDT      = OFF
#pragma config WDTPS    = 32768
#pragma config MCLRE    = ON
#pragma config LPT1OSC  = OFF
#pragma config PBADEN   = OFF
//#pragma config CCP2MX   = ON
#pragma config STVREN   = ON
#pragma config LVP      = OFF
//#pragma config ICPRT    = OFF       // Dedicated In-Circuit Debug/Programming
#pragma config XINST    = OFF       // Extended Instruction Set
#pragma config CP0      = OFF
#pragma config CP1      = OFF
//#pragma config CP2      = OFF
//#pragma config CP3      = OFF
#pragma config CPB      = OFF
//#pragma config CPD      = OFF
#pragma config WRT0     = OFF
#pragma config WRT1     = OFF
//#pragma config WRT2     = OFF
//#pragma config WRT3     = OFF
#pragma config WRTB     = OFF       // Boot Block Write Protection
#pragma config WRTC     = OFF
//#pragma config WRTD     = OFF
#pragma config EBTR0    = OFF
#pragma config EBTR1    = OFF
//#pragma config EBTR2    = OFF
//#pragma config EBTR3    = OFF
#pragma config EBTRB    = OFF

#define LEDS_ON_OFF     0x55
#define LEDS_OFF_ON     0xAA
#define INSTR_CYCLE_DELAY   250000000
#define _XTAL_FREQ          48000000
#define BLINK_DELAY_MS      500
#define BLINK_DELAY_COUNT   BLINK_DELAY_MS * _XTAL_FREQ / (4 * 1000)         

bool blinkLedsOn = false;
bool blinkLedsChange = true;
unsigned long blinkDelayCounter = 0;

typedef enum tagLED 
{
    USB_LED_STATE,
    TEST_LED_STATE
} LED;

#define USB_LED_STATE_BIT   LATBbits.LB7
#define TEST_LED_STATE_BIT  LATBbits.LB6

#define USB_LED_STATE_TRIS_BIT   LATBbits.LB7
#define TEST_LED_STATE_TRIS_BIT  LATBbits.LB6

//------------------------------------------------------------------------------
//Select a USB stack operating mode.  In the USB_INTERRUPT mode, the USB stack
//main task handler gets called only when necessary as an interrupt handler.
//This can potentially minimize CPU utilization, but adds context saving
//and restoring overhead associated with interrupts, which can potentially 
//decrease performance.
//When the USB_POLLING mode is selected, the USB stack main task handler
//(ex: USBDeviceTasks()) must be called periodically by the application firmware
//at a minimum rate as described in the inline code comments in usb_device.c.
//------------------------------------------------------
//#define USB_POLLING
#define USB_INTERRUPT

// Usb read & write buffers
static uint8_t readBuffer[CDC_DATA_OUT_EP_SIZE];
static uint8_t writeBuffer[CDC_DATA_IN_EP_SIZE];

void UsbCdc_LoopProcess();
void Test_Init();
void Test_LedLoopProcess();
void Test_UsbDataProcess(const char* usbData);
void LED_On(LED led);
void LED_Off(LED led);

void APP_LEDUpdateUSBStatus();

int main(int argc, char** argv) 
{   
    // SYSTEM_Initialize(SYSTEM_STATE_USB_START);

    USBDeviceInit();
    USBDeviceAttach();
    
    Test_Init();
    
    while (1) 
    {
        // SYSTEM_Tasks();

        #if defined(USB_POLLING)
            // Interrupt or polling method.  If using polling, must call
            // this function periodically.  This function will take care
            // of processing and responding to SETUP transactions
            // (such as during the enumeration process when you first
            // plug in).  USB hosts require that USB devices should accept
            // and process SETUP packets in a timely fashion.  Therefore,
            // when using polling, this function should be called
            // regularly (such as once every 1.8ms or faster** [see
            // inline code comments in usb_device.c for explanation when
            // "or faster" applies])  In most cases, the USBDeviceTasks()
            // function does not take very long to execute (ex: <100
            // instruction cycles) before it returns.
            USBDeviceTasks();
        #endif

        // Process cdc tranfers per loop
        UsbCdc_LoopProcess();
        // Process led status
        //Test_LedLoopProcess();

    }
    
    return (EXIT_SUCCESS);
}

// Interrupt handler routine ISR
#if defined(__XC8)
void interrupt SYS_InterruptHigh(void)
{
    #if defined(USB_INTERRUPT)
        USBDeviceTasks();
    #endif
}
#endif

/* Required by: usb_events.c
 */
void SYSTEM_Initialize( SYSTEM_STATE state )
{
    switch(state)
    {
        case SYSTEM_STATE_USB_START:
            // BUTTON_Enable(BUTTON_DEVICE_CDC_BASIC_DEMO);
            // LED_Enable(LED_USB_DEVICE_STATE);            
            LED_On(USB_LED_STATE_BIT);
            break;
			
        case SYSTEM_STATE_USB_SUSPEND: 
            break;
            
        case SYSTEM_STATE_USB_RESUME:
            break;
    }
}

void UsbCdc_LoopProcess()
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
    
    /*
    // If the user has pressed the button associated with this demo, then we
    // are going to send a "Button Pressed" message to the terminal.
    
    if(BUTTON_IsPressed(BUTTON_DEVICE_CDC_BASIC_DEMO) == true)
    {
         // Make sure that we only send the message once per button press and
         // not continuously as the button is held.
         
        if(buttonPressed == false)
        {
            // Make sure that the CDC driver is ready for a transmission.             
            if(mUSBUSARTIsTxTrfReady() == true)
            {
                putrsUSBUSART(buttonMessage);
                buttonPressed = true;
            }
        }
    }
    else
    {
        // If the button is released, we can then allow a new message to be
        // sent the next time the button is pressed.        
        buttonPressed = false;
    }
    */

    /* Check to see if there is a transmission in progress, if there isn't, then
     * we can see about performing an echo response to data received.
     */
    if( USBUSARTIsTxTrfReady() == true)
    {
        uint8_t i;
        uint8_t numBytesRead;

        numBytesRead = getsUSBUSART(readBuffer, sizeof(readBuffer));

        /* For every byte that was read... */
        for(i = 0; i < numBytesRead; i++)
        {
            switch(readBuffer[i])
            {
                /* If we receive new line or line feed commands, just echo
                 * them direct.
                 */
                case 0x0A:
                case 0x0D:
                    writeBuffer[i] = readBuffer[i];
                    break;

                /* If we receive something else, then echo it plus one
                 * so that if we receive 'a', we echo 'b' so that the
                 * user knows that it isn't the echo enabled on their
                 * terminal program.
                 */
                default:
                    writeBuffer[i] = readBuffer[i] + 1;                   
                    break;
            }
        }

        if(numBytesRead > 0)
        {
            /* After processing all of the received data, we need to send out
             * the "echo" data now.
             */
            putUSBUSART(writeBuffer, numBytesRead);
            
            /* Process usb data*/
            Test_UsbDataProcess(readBuffer);
            numBytesRead = 0;
        }       
    }

    CDCTxService();
}

void Test_Init()
{
    // Led status 
    USB_LED_STATE_TRIS_BIT = 0;
    TEST_LED_STATE_TRIS_BIT = 0;           
            
    // TRISD = 0x00;
    // LATD = LEDS_ON_OFF;
    
    ADCON1 = 0x0F;
    TRISB = 0x00;
    LATB = LEDS_ON_OFF;      
}


void Test_LedLoopProcess()
{   
    
    if (blinkDelayCounter++ > BLINK_DELAY_COUNT)
    {
        blinkLedsChange = true;
        blinkDelayCounter = 0;
    }
    
    if (blinkLedsChange)
    {
        blinkLedsChange = false;
        
        if (blinkLedsOn)
        {
            LATB &= 0b11000011;    
            LATB |= 0b00111100 & LEDS_ON_OFF;         
            blinkLedsOn = false;
        }
        else        
        {
            LATB &= 0b11000011;
            LATB |= 0b00111100 & LEDS_OFF_ON;
            blinkLedsOn = true;
        }
    }    
}

void Test_UsbDataProcess(const char* usbData)
{
    LATB &= 0b00111100;
    LATB |= 0b11000011 & usbData[0];
}

/*********************************************************************
* Function: void APP_LEDUpdateUSBStatus(void);
*
* Overview: Uses one LED to indicate the status of the device on the USB bus.
*           A fast blink indicates successfully connected.  A slow pulse
*           indicates that it is still in the process of connecting.  Off
*           indicates thta it is not attached to the bus or the bus is suspended.
*           This should be called on every start of frame packet reception and
*           if a suspend/resume event occurs.
*
* PreCondition: LEDs are enabled.
*
* Input: None
*
* Output: None
*
* Required by: usb_events.c 
********************************************************************/
void APP_LEDUpdateUSBStatus()
{
    static uint16_t ledCount = 0;

    if(USBIsDeviceSuspended() == true)
    {
        LED_Off(USB_LED_STATE);
        return;
    }

    switch(USBGetDeviceState())
    {
        case CONFIGURED_STATE:
            /* We are configured.  Blink fast.
             * On for 75ms, off for 75ms, then reset/repeat. */
            if(ledCount == 1)
            {
                LED_On(USB_LED_STATE);
            }
            else if(ledCount == 75)
            {
                LED_Off(USB_LED_STATE);
            }
            else if(ledCount > 150)
            {
                ledCount = 0;
            }
            break;

        default:
            /* We aren't configured yet, but we aren't suspended so let's blink with
             * a slow pulse. On for 50ms, then off for 950ms, then reset/repeat. */
            if(ledCount == 1)
            {
                LED_On(USB_LED_STATE);
            }
            else if(ledCount == 50)
            {
                LED_Off(USB_LED_STATE);
            }
            else if(ledCount > 950)
            {
                ledCount = 0;
            }
            break;
    }

    /* Increment the millisecond counter. */
    ledCount++;
}


/*********************************************************************
* Function: void APP_DeviceCDCBasicDemoInitialize(void);
*
* Overview: Initializes the demo code
*
* PreCondition: None
*
* Input: None
*
* Output: None
*
* Required by: usb_events.c
********************************************************************/
void APP_DeviceCDCBasicDemoInitialize()
{   
    line_coding.bCharFormat = 0;
    line_coding.bDataBits = 8;
    line_coding.bParityType = 0;
    line_coding.dwDTERate = 9600;    
}

void LED_On(LED led)
{
    switch (led)
    {
        case USB_LED_STATE:
            USB_LED_STATE_BIT = 1;
            break;
        
        case TEST_LED_STATE:
            TEST_LED_STATE_BIT = 1;
            break;
    }   
}

void LED_Off(LED led)
{
    switch (led)
    {
        case USB_LED_STATE:
            USB_LED_STATE_BIT = 0;
            break;
        
        case TEST_LED_STATE:
            TEST_LED_STATE_BIT = 0;
            break;
    }    
}