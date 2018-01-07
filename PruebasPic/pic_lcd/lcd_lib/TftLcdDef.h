/* 
 * File:   TftLcdDef.h
 * Author: jsars
 *
 * Created on 12 de junio de 2017, 07:24 PM
 */

#ifndef TFT_LCD_DEF_H
#define	TFT_LCD_DEF_H

#include <stdint.h>
#include <stdbool.h>
#include <stdlib.h>
#include <stddef.h>

#include <xc.h>

// #define NULL    0
#define true    1
#define false   0

#ifdef	__cplusplus
extern "C" {
#endif

typedef uint8_t boolean;
typedef uint8_t byte;    

 // #define _XTAL_FREQ     16000000
#define _XTAL_FREQ     48000000

#ifdef	__cplusplus
}
#endif

#endif	/* TFTLCDDEF_H */

