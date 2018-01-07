#ifndef TFT_LCD_H
#define TFT_LCD_H

// #include "Arduino.h"
#include "AdafruitGfx.h"

//#define TFTWIDTH   320
//#define TFTHEIGHT  480

#define TFTWIDTH   240
#define TFTHEIGHT  320

// LCD controller chip identifiers
#define ID_932X    		0
#define ID_7575    		1
#define ID_9341    		2
#define ID_HX8357D   	3
#define ID_UNKNOWN 		0xFF


void	TftLcd_Init();

void 	TftLcd_Begin();
void    TftLcd_DrawPixel(int16_t x, int16_t y, uint16_t color);
void    TftLcd_DrawFastHLine(int16_t x0, int16_t y0, int16_t w, uint16_t color);
void    TftLcd_DrawFastVLine(int16_t x0, int16_t y0, int16_t h, uint16_t color);
void    TftLcd_FillRect(int16_t x, int16_t y, int16_t w, int16_t h, uint16_t c);
void    TftLcd_FillScreen(uint16_t color);
void    TftLcd_Reset(void);
void    TftLcd_SetRegisters8(uint8_t *ptr, uint8_t n);
void    TftLcd_SetRegisters16(uint16_t *ptr, uint8_t n);
void    TftLcd_SetRotation(uint8_t x);
// These methods are public in order for BMP examples to work:
void    TftLcd_SetAddrWindow(int x1, int y1, int x2, int y2);
void    TftLcd_PushColors(uint16_t *data, uint8_t len, boolean first);

uint16_t TftLcd_Color565(uint8_t r, uint8_t g, uint8_t b),
	TftLcd_ReadPixel(int16_t x, int16_t y),
	TftLcd_ReadID(void);

uint32_t TftLcd_ReadReg(uint8_t r);

uint8_t TftLcd_GetDriver();

/*
void  TftLcd_Init();
	// These items may have previously been defined as macros
	// in pin_magic.h.  If not, function versions are declared:
*/

uint8_t TftLcd_Read8fn(void);

void	TftLcd_SetLR(void);
void	TftLcd_Flood(uint16_t color, uint32_t len);

// For compatibility with sketches written for older versions of library.
// Color function name was changed to 'color565' for parity with 2.2" LCD
// library.
#define Color565 TftLcd_Color565

#endif
