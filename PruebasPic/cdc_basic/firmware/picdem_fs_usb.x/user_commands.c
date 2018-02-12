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
    LATB = inputBuffer[0];
}