#ifndef _ADAFRUIT_GFX_H
#define _ADAFRUIT_GFX_H

#include "TftLcdDef.h"

/*
#if ARDUINO >= 100
#include "Arduino.h"
//#include "Print.h"
#else
#include "WProgram.h"
#endif
*/

/*
 * Ejemplo de inicializacion 
 * 
 *   TftLcdIO_Init(&g_tftLcdIO);
 *   Gfx_Init(&g_gfx, TFTWIDTH, TFTHEIGHT, &TftLcd_DrawPixel);
 *   TftLcd_Init();
 */

#define swap(a, b) { int16_t t = a; a = b; b = t; }

/*
const int16_t
	WIDTH, HEIGHT;   // This is the 'raw' display w/h - never changes
int16_t
	_width, _height, // Display w/h as modified by current rotation
	cursor_x, cursor_y;
uint16_t
	textcolor, textbgcolor;
uint8_t
	textsize,
	rotation;
boolean
	wrap,   // If set, 'wrap' text at right edge of display
	_cp437; // If set, use correct CP437 charset (default is off)
*/

typedef struct tagGfx 
{
	int16_t
		WIDTH, HEIGHT;   // This is the 'raw' display w/h - never changes
	int16_t
		_width, _height, // Display w/h as modified by current rotation
		cursor_x, cursor_y;
	uint16_t
		textcolor, textbgcolor;
	uint8_t
		textsize,
		rotation;
	bool
		wrap,   // If set, 'wrap' text at right edge of display
		_cp437; // If set, use correct CP437 charset (default is off)
} Gfx;

Gfx* g_pGfx;
Gfx* Gfx_Set(Gfx* pGfx);
Gfx* Gfx_Get();


// This MUST be defined by the subclass:
/*virtual void drawPixel(int16_t x, int16_t y, uint16_t color) = 0;*/
typedef void (Gfx_DrawPixelFunc)(int16_t x, int16_t y, uint16_t color);
Gfx_DrawPixelFunc* g_pDrawPixelFunc = NULL;

Gfx_DrawPixelFunc* Gfx_SetDrawPixelFunction(Gfx_DrawPixelFunc* pDrawPixelFunc);
Gfx_DrawPixelFunc* Gfx_GetDrawPixelFunction();

//AdafruitGfx::AdafruitGfx(int16_t w, int16_t h) :
Gfx* Gfx_Init(Gfx* pGfx, int16_t w, int16_t h, Gfx_DrawPixelFunc pDrawPixelFunc);


// These MAY be overridden by the subclass to provide device-specific
// optimized code.  Otherwise 'generic' versions are used.
/*virtual*/ 
void
	Gfx_DrawLine(int16_t x0, int16_t y0, int16_t x1, int16_t y1, uint16_t color),
	Gfx_DrawFastVLine(int16_t x, int16_t y, int16_t h, uint16_t color),
	Gfx_DrawFastHLine(int16_t x, int16_t y, int16_t w, uint16_t color),
	Gfx_DrawRect(int16_t x, int16_t y, int16_t w, int16_t h, uint16_t color),
	Gfx_FillRect(int16_t x, int16_t y, int16_t w, int16_t h, uint16_t color),
	Gfx_FillScreen(uint16_t color),
	Gfx_InvertDisplay(bool i);

// These exist only with AdafruitGfx (no subclass overrides)
void Gfx_DrawCircle(int16_t x0, int16_t y0, int16_t r, uint16_t color);
void Gfx_DrawCircleHelper(int16_t x0, int16_t y0, int16_t r, uint8_t cornername,
	uint16_t color);
void Gfx_FillCircle(int16_t x0, int16_t y0, int16_t r, uint16_t color);
void Gfx_FillCircleHelper(int16_t x0, int16_t y0, int16_t r, uint8_t cornername,
	int16_t delta, uint16_t color);
void Gfx_DrawTriangle(int16_t x0, int16_t y0, int16_t x1, int16_t y1,
	int16_t x2, int16_t y2, uint16_t color);
void Gfx_FillTriangle(int16_t x0, int16_t y0, int16_t x1, int16_t y1,
	int16_t x2, int16_t y2, uint16_t color);
void Gfx_DrawRoundRect(int16_t x0, int16_t y0, int16_t w, int16_t h,
	int16_t radius, uint16_t color);
void Gfx_FillRoundRect(int16_t x0, int16_t y0, int16_t w, int16_t h,
	int16_t radius, uint16_t color);
void Gfx_DrawBitmap(int16_t x, int16_t y, const uint8_t *bitmap,
	int16_t w, int16_t h, uint16_t color);
void Gfx_DrawBitmapBg(int16_t x, int16_t y, const uint8_t *bitmap,
	int16_t w, int16_t h, uint16_t color, uint16_t bg);
void Gfx_DrawXBitmap(int16_t x, int16_t y, const uint8_t *bitmap,
	int16_t w, int16_t h, uint16_t color);
void Gfx_DrawChar(int16_t x, int16_t y, unsigned char c, uint16_t color,
	uint16_t bg, uint8_t size);
void Gfx_SetTextColor(uint16_t c);
void Gfx_SetTextColorBg(uint16_t c, uint16_t bg);
void Gfx_SetTextSize(uint8_t s);
void Gfx_SetTextWrap(bool w);
void Gfx_Cp437(bool x);

	//Adition, not presented in original library
	size_t Gfx_Print(const char* pchBuffer);

// #if ARDUINO >= 100
/*virtual*/ size_t Gfx_Write(uint8_t);
// #else
// /*virtual*/ void  Gfx_Write(uint8_t);
// #endif

int16_t Gfx_GetHeight(void);
int16_t Gfx_GetWidth(void);

uint8_t Gfx_GetRotation(void);

// get current cursor position (get rotation safe maximum values, using: width() for x, height() for y)
int16_t Gfx_GetCursorX(void);
int16_t Gfx_GetCursorY(void);

void Gfx_SetHeight(int16_t height);
void Gfx_SetWidth(int16_t width);

void Gfx_SetRotation(uint8_t rotation);

// set current cursor position 
void Gfx_SetCursor(int16_t x, int16_t y);
void Gfx_SetCursorX(int16_t x);
void Gfx_SetCursorY(int16_t y);


/***************************************************************************/
// code for the GFX button UI element

typedef struct tagGfxButton 
{
	Gfx *_gfx;
	int16_t _x, _y;
	uint16_t _w, _h;
	uint8_t _textsize;
	uint16_t _outlinecolor, _fillcolor, _textcolor;
	char _label[10];

	boolean currstate, laststate;

} GfxButton;

//Adafruit_GFX_Button(void);

void GfxButton_Init(GfxButton* pGfxButton, int16_t x, int16_t y,
	uint8_t w, uint8_t h,
	uint16_t outline, uint16_t fill, uint16_t textcolor,
	char *label, uint8_t textsize);
// void GfxButton_DrawButton(GfxButton* pGfxButton, boolean inverted = false);
void GfxButton_DrawButton(GfxButton* pGfxButton, boolean inverted);
boolean GfxButton_Contains(GfxButton* pGfxButton, int16_t x, int16_t y);

void Gfx_Press(GfxButton* pGfxButton, boolean p);
boolean Gfx_IsPressed(GfxButton* pGfxButton);
boolean Gfx_JustPressed(GfxButton* pGfxButton);
boolean Gfx_JustReleased(GfxButton* pGfxButton);

#endif // _ADAFRUIT_GFX_H
