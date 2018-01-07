/*
 * File:   user_commands.c
 * Author: jose arias
 *
 * Created on 10 de abril de 2017, 08:22 PM
 */


#include <xc.h>
#include "user_commands.h"

void userInit()
{
    TRISB = 0b11110000;
    PORTB = 0xAA;
}


void userProcess(const char* inputBuffer, char size)
{
    if (inputBuffer[0] == 0x0A || inputBuffer[1] == 0x0D)
    {        
        PORTB &= 0b11110011;
        PORTB |= 0b00000100;
    }
    else
    {
        PORTB = (PORTB & 0xF0) | (0x03 & inputBuffer[0]);        
        PORTB |= 0b00001000;        
    }
}