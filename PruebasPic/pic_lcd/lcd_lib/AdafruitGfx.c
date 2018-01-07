/*
This is the core graphics library for all our displays, providing a common
set of graphics primitives (points, lines, circles, etc.).  It needs to be
paired with a hardware-specific library for each display device we carry
(to handle the lower-level functions).

Adafruit invests time and resources providing this open source code, please
support Adafruit & open-source hardware by purchasing products from Adafruit!

Copyright (c) 2013 Adafruit Industries.  All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

- Redistributions of source code must retain the above copyright notice,
this list of conditions and the following disclaimer.
- Redistributions in binary form must reproduce the above copyright notice,
this list of conditions and the following disclaimer in the documentation
and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
POSSIBILITY OF SUCH DAMAGE.
*/

#include <string.h>

#include "TftLcdDef.h"
#include "../src/usb_device.h"

// *** SPFD5408 change -- Begin
#include "AdafruitGfx.h"
// *** SPFD5408 change -- End

#include "glcdfont.c"
#ifdef __AVR__
#include <avr/pgmspace.h>
#elif defined(ESP8266)
#include <pgmspace.h>
#else
#define pgm_read_byte(addr) (*(const unsigned char *)(addr))
#endif

#ifndef min
#define min(a,b) ((a < b) ? a : b)
#endif


Gfx* Gfx_Init(Gfx* pGfx, int16_t w, int16_t h, Gfx_DrawPixelFunc pDrawPixelFunc)
{
    //putrsUSBUSART("In: Gfx_Init");
    
	pGfx->WIDTH = w;
	pGfx->HEIGHT = h;

	pGfx->_width = w;
	pGfx->_height = h;

	pGfx->rotation = 0;
	pGfx->cursor_x = 0;
	pGfx->cursor_y = 0;
	pGfx->textsize = 1;
	pGfx->textcolor = 0xFFFF;
	pGfx->textbgcolor = 0xFFFF;
	pGfx->wrap = true;
	pGfx->_cp437 = false;

	Gfx_SetDrawPixelFunction(pDrawPixelFunc);	

	return Gfx_Set(pGfx);
}

Gfx* Gfx_Set(Gfx* pGfx)
{
	Gfx* pOldGfx = g_pGfx;
	g_pGfx = pGfx;

	return pOldGfx;
}

Gfx* Gfx_Get()
{
	return g_pGfx;
}

Gfx_DrawPixelFunc* Gfx_SetDrawPixelFunction(Gfx_DrawPixelFunc* pDrawPixelFunc)
{	
	Gfx_DrawPixelFunc* pOldFunc = g_pDrawPixelFunc;
	g_pDrawPixelFunc = pDrawPixelFunc;

	return pOldFunc;
}

Gfx_DrawPixelFunc* Gfx_GetDrawPixelFunction()
{
	return g_pDrawPixelFunc;
}

// Draw a circle outline
void Gfx_DrawCircle(int16_t x0, int16_t y0, int16_t r,
	uint16_t color) 
{
	int16_t f = 1 - r;
	int16_t ddF_x = 1;
	int16_t ddF_y = -2 * r;
	int16_t x = 0;
	int16_t y = r;

	g_pDrawPixelFunc(x0, y0 + r, color);
	g_pDrawPixelFunc(x0, y0 - r, color);
	g_pDrawPixelFunc(x0 + r, y0, color);
	g_pDrawPixelFunc(x0 - r, y0, color);

	while (x<y) 
	{
		if (f >= 0)
		{
			y--;
			ddF_y += 2;
			f += ddF_y;
		}
		x++;
		ddF_x += 2;
		f += ddF_x;

		g_pDrawPixelFunc(x0 + x, y0 + y, color);
		g_pDrawPixelFunc(x0 - x, y0 + y, color);
		g_pDrawPixelFunc(x0 + x, y0 - y, color);
		g_pDrawPixelFunc(x0 - x, y0 - y, color);
		g_pDrawPixelFunc(x0 + y, y0 + x, color);
		g_pDrawPixelFunc(x0 - y, y0 + x, color);
		g_pDrawPixelFunc(x0 + y, y0 - x, color);
		g_pDrawPixelFunc(x0 - y, y0 - x, color);
	}
}

void Gfx_DrawCircleHelper(int16_t x0, int16_t y0,
	int16_t r, uint8_t cornername, uint16_t color)
{
	int16_t f = 1 - r;
	int16_t ddF_x = 1;
	int16_t ddF_y = -2 * r;
	int16_t x = 0;
	int16_t y = r;

	while (x<y) 
	{
		if (f >= 0) 
		{
			y--;
			ddF_y += 2;
			f += ddF_y;
		}
		x++;
		ddF_x += 2;
		f += ddF_x;
		if (cornername & 0x4) 
		{
			g_pDrawPixelFunc(x0 + x, y0 + y, color);
			g_pDrawPixelFunc(x0 + y, y0 + x, color);
		}
		if (cornername & 0x2) 
		{
			g_pDrawPixelFunc(x0 + x, y0 - y, color);
			g_pDrawPixelFunc(x0 + y, y0 - x, color);
		}
		if (cornername & 0x8) 
		{
			g_pDrawPixelFunc(x0 - y, y0 + x, color);
			g_pDrawPixelFunc(x0 - x, y0 + y, color);
		}
		if (cornername & 0x1) 
		{
			g_pDrawPixelFunc(x0 - y, y0 - x, color);
			g_pDrawPixelFunc(x0 - x, y0 - y, color);
		}
	}
}

void Gfx_FillCircle(int16_t x0, int16_t y0, int16_t r,
	uint16_t color) 
{
	Gfx_DrawFastVLine(x0, y0 - r, 2 * r + 1, color);
	Gfx_FillCircleHelper(x0, y0, r, 3, 0, color);
}

// Used to do circles and roundrects
void Gfx_FillCircleHelper(int16_t x0, int16_t y0, int16_t r,
	uint8_t cornername, int16_t delta, uint16_t color) 
{

	int16_t f = 1 - r;
	int16_t ddF_x = 1;
	int16_t ddF_y = -2 * r;
	int16_t x = 0;
	int16_t y = r;

	while (x<y) 
	{
		if (f >= 0)
		{
			y--;
			ddF_y += 2;
			f += ddF_y;
		}
		x++;
		ddF_x += 2;
		f += ddF_x;

		if (cornername & 0x1)
		{
			Gfx_DrawFastVLine(x0 + x, y0 - y, 2 * y + 1 + delta, color);
			Gfx_DrawFastVLine(x0 + y, y0 - x, 2 * x + 1 + delta, color);
		}
		if (cornername & 0x2) 
		{
			Gfx_DrawFastVLine(x0 - x, y0 - y, 2 * y + 1 + delta, color);
			Gfx_DrawFastVLine(x0 - y, y0 - x, 2 * x + 1 + delta, color);
		}
	}
}

// Bresenham's algorithm - thx wikpedia
void Gfx_DrawLine(int16_t x0, int16_t y0,
	int16_t x1, int16_t y1,
	uint16_t color) 
{
	int16_t steep = abs(y1 - y0) > abs(x1 - x0);
	if (steep) 
	{
		swap(x0, y0);
		swap(x1, y1);
	}

	if (x0 > x1) 
	{
		swap(x0, x1);
		swap(y0, y1);
	}

	int16_t dx, dy;
	dx = x1 - x0;
	dy = abs(y1 - y0);

	int16_t err = dx / 2;
	int16_t ystep;

	if (y0 < y1) 
	{
		ystep = 1;
	}
	else 
	{
		ystep = -1;
	}

	for (; x0 <= x1; x0++) {
		if (steep) 
		{
			g_pDrawPixelFunc(y0, x0, color);
		}
		else 
		{
			g_pDrawPixelFunc(x0, y0, color);
		}
		err -= dy;
		if (err < 0) 
		{
			y0 += ystep;
			err += dx;
		}
	}
}

// Draw a rectangle
void Gfx_DrawRect(int16_t x, int16_t y,
	int16_t w, int16_t h,
	uint16_t color) 
{
	Gfx_DrawFastHLine(x, y, w, color);
	Gfx_DrawFastHLine(x, y + h - 1, w, color);
	Gfx_DrawFastVLine(x, y, h, color);
	Gfx_DrawFastVLine(x + w - 1, y, h, color);
}

void Gfx_DrawFastVLine(int16_t x, int16_t y,
	int16_t h, uint16_t color) 
{
	// Update in subclasses if desired!
	Gfx_DrawLine(x, y, x, y + h - 1, color);
}

void Gfx_DrawFastHLine(int16_t x, int16_t y,
	int16_t w, uint16_t color) 
{
	// Update in subclasses if desired!
	Gfx_DrawLine(x, y, x + w - 1, y, color);
}

void Gfx_FillRect(int16_t x, int16_t y, int16_t w, int16_t h,
	uint16_t color) 
{
	// Update in subclasses if desired!
	for (int16_t i = x; i<x + w; i++) 
	{
		Gfx_DrawFastVLine(i, y, h, color);
	}
}

void Gfx_FillScreen(uint16_t color) 
{

	Gfx* pGfx = Gfx_Get();
	Gfx_FillRect(0, 0, pGfx->_width, pGfx->_height, color);
}

// Draw a rounded rectangle
void Gfx_DrawRoundRect(int16_t x, int16_t y, int16_t w,
	int16_t h, int16_t r, uint16_t color) 
{
	// smarter version
	Gfx_DrawFastHLine(x + r, y, w - 2 * r, color); // Top
	Gfx_DrawFastHLine(x + r, y + h - 1, w - 2 * r, color); // Bottom
	Gfx_DrawFastVLine(x, y + r, h - 2 * r, color); // Left
	Gfx_DrawFastVLine(x + w - 1, y + r, h - 2 * r, color); // Right
	// draw four corners
	Gfx_DrawCircleHelper(x + r, y + r, r, 1, color);
	Gfx_DrawCircleHelper(x + w - r - 1, y + r, r, 2, color);
	Gfx_DrawCircleHelper(x + w - r - 1, y + h - r - 1, r, 4, color);
	Gfx_DrawCircleHelper(x + r, y + h - r - 1, r, 8, color);
}

// Fill a rounded rectangle
void Gfx_FillRoundRect(int16_t x, int16_t y, int16_t w,
	int16_t h, int16_t r, uint16_t color)
{
	// smarter version
	Gfx_FillRect(x + r, y, w - 2 * r, h, color);

	// draw four corners
	Gfx_FillCircleHelper(x + w - r - 1, y + r, r, 1, h - 2 * r - 1, color);
	Gfx_FillCircleHelper(x + r, y + r, r, 2, h - 2 * r - 1, color);
}

// Draw a triangle
void Gfx_DrawTriangle(int16_t x0, int16_t y0,
	int16_t x1, int16_t y1,
	int16_t x2, int16_t y2, uint16_t color)
{
	Gfx_DrawLine(x0, y0, x1, y1, color);
	Gfx_DrawLine(x1, y1, x2, y2, color);
	Gfx_DrawLine(x2, y2, x0, y0, color);
}

// Fill a triangle
void Gfx_FillTriangle(int16_t x0, int16_t y0,
	int16_t x1, int16_t y1,
	int16_t x2, int16_t y2, uint16_t color)
{

	int16_t a, b, y, last;

	// Sort coordinates by Y order (y2 >= y1 >= y0)
	if (y0 > y1) 
	{
		swap(y0, y1); swap(x0, x1);
	}
	if (y1 > y2) 
	{
		swap(y2, y1); swap(x2, x1);
	}
	if (y0 > y1) 
	{
		swap(y0, y1); swap(x0, x1);
	}

	if (y0 == y2) 
	{ // Handle awkward all-on-same-line case as its own thing
		a = b = x0;
		if (x1 < a)      a = x1;
		else if (x1 > b) b = x1;
		if (x2 < a)      a = x2;
		else if (x2 > b) b = x2;
		Gfx_DrawFastHLine(a, y0, b - a + 1, color);
		return;
	}

	int16_t
		dx01 = x1 - x0,
		dy01 = y1 - y0,
		dx02 = x2 - x0,
		dy02 = y2 - y0,
		dx12 = x2 - x1,
		dy12 = y2 - y1;
	int32_t
		sa = 0,
		sb = 0;

	// For upper part of triangle, find scanline crossings for segments
	// 0-1 and 0-2.  If y1=y2 (flat-bottomed triangle), the scanline y1
	// is included here (and second loop will be skipped, avoiding a /0
	// error there), otherwise scanline y1 is skipped here and handled
	// in the second loop...which also avoids a /0 error here if y0=y1
	// (flat-topped triangle).
	if (y1 == y2) last = y1;   // Include y1 scanline
	else         last = y1 - 1; // Skip it

	for (y = y0; y <= last; y++) 
	{
		a = x0 + sa / dy01;
		b = x0 + sb / dy02;
		sa += dx01;
		sb += dx02;
		/* longhand:
		a = x0 + (x1 - x0) * (y - y0) / (y1 - y0);
		b = x0 + (x2 - x0) * (y - y0) / (y2 - y0);
		*/
		if (a > b) swap(a, b);
		Gfx_DrawFastHLine(a, y, b - a + 1, color);
	}

	// For lower part of triangle, find scanline crossings for segments
	// 0-2 and 1-2.  This loop is skipped if y1=y2.
	sa = dx12 * (y - y1);
	sb = dx02 * (y - y0);
	for (; y <= y2; y++) {
		a = x1 + sa / dy12;
		b = x0 + sb / dy02;
		sa += dx12;
		sb += dx02;
		/* longhand:
		a = x1 + (x2 - x1) * (y - y1) / (y2 - y1);
		b = x0 + (x2 - x0) * (y - y0) / (y2 - y0);
		*/
		if (a > b) swap(a, b);
		Gfx_DrawFastHLine(a, y, b - a + 1, color);
	}
}

void Gfx_DrawBitmap(int16_t x, int16_t y,
	const uint8_t *bitmap, int16_t w, int16_t h,
	uint16_t color)
{

	int16_t i, j, byteWidth = (w + 7) / 8;

	for (j = 0; j<h; j++)
	{
		for (i = 0; i<w; i++) 
		{
			if (pgm_read_byte(bitmap + j * byteWidth + i / 8) & (128 >> (i & 7))) 
			{
				g_pDrawPixelFunc(x + i, y + j, color);
			}
		}
	}
}

// Draw a 1-bit color bitmap at the specified x, y position from the
// provided bitmap buffer (must be PROGMEM memory) using color as the
// foreground color and bg as the background color.
void Gfx_DrawBitmapBg(int16_t x, int16_t y,
	const uint8_t *bitmap, int16_t w, int16_t h,
	uint16_t color, uint16_t bg)
{

	int16_t i, j, byteWidth = (w + 7) / 8;

	for (j = 0; j<h; j++) 
	{
		for (i = 0; i<w; i++) 
		{
			if (pgm_read_byte(bitmap + j * byteWidth + i / 8) & (128 >> (i & 7))) 
			{
				g_pDrawPixelFunc(x + i, y + j, color);
			}
			else 
			{
				g_pDrawPixelFunc(x + i, y + j, bg);
			}
		}
	}
}

//Draw XBitMap Files (*.xbm), exported from GIMP,
//Usage: Export from GIMP to *.xbm, rename *.xbm to *.c and open in editor.
//C Array can be directly used with this function
void Gfx_DrawXBitmap(int16_t x, int16_t y,
	const uint8_t *bitmap, int16_t w, int16_t h,
	uint16_t color) 
{

	int16_t i, j, byteWidth = (w + 7) / 8;

	for (j = 0; j<h; j++) 
	{
		for (i = 0; i<w; i++) 
		{
			if (pgm_read_byte(bitmap + j * byteWidth + i / 8) & (1 << (i % 8))) 
			{
				g_pDrawPixelFunc(x + i, y + j, color);
			}
		}
	}
}

// #if ARDUINO >= 100
size_t Gfx_Write(uint8_t c) 
{
// #else
// void Gfx_Write(uint8_t c) 
// {
// #endif
	
	Gfx* pGfx = Gfx_Get();

	if (c == '\n') 
	{
		pGfx->cursor_y += pGfx->textsize * 8;
		pGfx->cursor_x = 0;
	}
	else if (c == '\r') 
	{
		// skip em
	}
	else 
	{
		Gfx_DrawChar(pGfx->cursor_x, pGfx->cursor_y, c, 
			pGfx->textcolor, pGfx->textbgcolor, pGfx->textsize);
		pGfx->cursor_x += pGfx->textsize * 6;
		if (pGfx->wrap && (pGfx->cursor_x > (pGfx->_width - pGfx->textsize * 6)))
		{
			pGfx->cursor_y += pGfx->textsize * 8;
			pGfx->cursor_x = 0;
		}
	}
// #if ARDUINO >= 100
	return 1;
// #endif
}

// Draw a character
void Gfx_DrawChar(int16_t x, int16_t y, unsigned char c,
	uint16_t color, uint16_t bg, uint8_t size)
{	
	
	Gfx* pGfx = Gfx_Get();

	if ((x >= pGfx->_width) || // Clip right
		(y >= pGfx->_height) || // Clip bottom
		((x + 6 * size - 1) < 0) || // Clip left
		((y + 8 * size - 1) < 0))   // Clip top
		return;

	if (!pGfx->_cp437 && (c >= 176)) c++; // Handle 'classic' charset behavior

	for (int8_t i = 0; i<6; i++) 
	{
		uint8_t line;
		if (i == 5)
			line = 0x0;
		else
			line = pgm_read_byte(font + (c * 5) + i);
		for (int8_t j = 0; j<8; j++) {
			if (line & 0x1) {
				if (size == 1) // default size
					g_pDrawPixelFunc(x + i, y + j, color);
				else {  // big size
					Gfx_FillRect(x + (i*size), y + (j*size), size, size, color);
				}
			}
			else if (bg != color) {
				if (size == 1) // default size
					g_pDrawPixelFunc(x + i, y + j, bg);
				else {  // big size
					Gfx_FillRect(x + i*size, y + j*size, size, size, bg);
				}
			}
			line >>= 1;
		}
	}
}

void Gfx_SetCursor(int16_t x, int16_t y) 
{

	Gfx* pGfx = Gfx_Get();

	pGfx->cursor_x = x;
	pGfx->cursor_y = y;
}

void Gfx_SetCursorX(int16_t x) 
{

	Gfx_Get()->cursor_x = x;
}

void Gfx_SetCursorY(int16_t y) 
{

	Gfx_Get()->cursor_y = y;
}

int16_t Gfx_GetCursorX(void)
{

	return Gfx_Get()->cursor_x;
}

int16_t Gfx_GetCursorY(void) 
{

	return Gfx_Get()->cursor_y;
}

void Gfx_SetTextSize(uint8_t s) 
{

	Gfx_Get()->textsize = (s > 0) ? s : 1;
}

void Gfx_SetTextColor(uint16_t c) 
{
	// For 'transparent' background, we'll set the bg 
	// to the same as fg instead of using a flag

	Gfx* pGfx = Gfx_Get();
	pGfx->textcolor = pGfx->textbgcolor = c;
}

void Gfx_SetTextColorBg(uint16_t c, uint16_t b) 
{

	Gfx* pGfx = Gfx_Get();
	pGfx->textcolor = c;
	pGfx->textbgcolor = b;
}

void Gfx_SetTextWrap(boolean w) 
{

	Gfx_Get()->wrap = w;
}

uint8_t Gfx_GetRotation(void) 
{

	return Gfx_Get()->rotation;
}

void Gfx_SetRotation(uint8_t x) 
{

	Gfx* pGfx = Gfx_Get();

	pGfx->rotation = (x & 3);
	switch (pGfx->rotation) {
	case 0:
	case 2:
		pGfx->_width = pGfx->WIDTH;
		pGfx->_height = pGfx->HEIGHT;
		break;
	case 1:
	case 3:
		pGfx->_width = pGfx->HEIGHT;
		pGfx->_height = pGfx->WIDTH;
		break;
	}
}

// Enable (or disable) Code Page 437-compatible charset.
// There was an error in glcdfont.c for the longest time -- one character
// (#176, the 'light shade' block) was missing -- this threw off the index
// of every character that followed it.  But a TON of code has been written
// with the erroneous character indices.  By default, the library uses the
// original 'wrong' behavior and old sketches will still work.  Pass 'true'
// to this function to use correct CP437 character values in your code.
void Gfx_Cp437(boolean x) 
{
	Gfx_Get()->_cp437 = x;
}

// Return the size of the display (per current rotation)
int16_t Gfx_GetWidth(void) 
{
	return Gfx_Get()->_width;
}

int16_t Gfx_GetHeight(void) 
{
	return Gfx_Get()->_height;
}

void Gfx_SetHeight(int16_t height)
{
	Gfx_Get()->_height = height;
}

void Gfx_SetWidth(int16_t width)
{
	Gfx_Get()->_width = width;
}

void Gfx_InvertDisplay(bool i) 
{
	// Do nothing, must be subclassed if supported
}

// Adition, not presented in original library
size_t Gfx_Print(const char* pchBuffer)
{
  size_t size = strlen(pchBuffer);
  size_t n = 0;
  while (size--) 
  {
    n += Gfx_Write(*pchBuffer++);
  }
  return n;
}

/***************************************************************************/
// code for the GFX button UI element

void GfxButton_InitButton(GfxButton* pGfxButton,
	int16_t x, int16_t y,
	uint8_t w, uint8_t h,
	uint16_t outline, uint16_t fill,
	uint16_t textcolor,
	char *label, uint8_t textsize)
{
	pGfxButton->_x = x;
	pGfxButton->_y = y;
	pGfxButton->_w = w;
	pGfxButton->_h = h;
	pGfxButton->_outlinecolor = outline;
	pGfxButton->_fillcolor = fill;
	pGfxButton->_textcolor = textcolor;
	pGfxButton->_textsize = textsize;
	pGfxButton->_gfx = Gfx_Get();
	strncpy(pGfxButton->_label, label, 9);
	pGfxButton->_label[9] = 0;
}

void GfxButton_DrawButton(GfxButton* pGfxButton, boolean inverted)
{	
	uint16_t fill, outline, text, x, y, w, h, textsize;	

	if (!inverted) 
	{
		fill = pGfxButton->_fillcolor;
		outline = pGfxButton->_outlinecolor;
		text = pGfxButton->_textcolor;
	}
	else 
	{
		fill = pGfxButton->_textcolor;
		outline = pGfxButton->_outlinecolor;
		text = pGfxButton->_fillcolor;
	}

	x = pGfxButton->_x;
	y = pGfxButton->_y;
	w = pGfxButton->_w;
	h = pGfxButton->_h;	
	
	textsize = pGfxButton->_textsize;	

	Gfx_FillRoundRect(x - (w / 2), y - (h / 2), w, h, min(w, h) / 4, fill);
	Gfx_DrawRoundRect(x - (w / 2), y - (h / 2), w, h, min(w, h) / 4, outline);

	Gfx_SetCursor(x - strlen(pGfxButton->_label) * 3 * textsize, y - 4 * textsize);
	Gfx_SetTextColor(text);
	Gfx_SetTextSize(textsize);
	Gfx_Print(pGfxButton->_label);
}

bool GfxButton_Contains(GfxButton* pGfxButton, int16_t x, int16_t y)
{

	int16_t xb = pGfxButton->_x;
	int16_t yb = pGfxButton->_y;
	uint16_t wb = pGfxButton->_w;
	uint16_t hb = pGfxButton->_h;

	if ((x < (xb - wb / 2)) || (x >(xb + wb / 2))) 
		return false;
	if ((y < (yb - hb)) || (y > (yb + hb / 2))) 
		return false;
		
	return true;
}


void GfxButton_Press(GfxButton* pGfxButton, boolean p) 
{
	pGfxButton->laststate = pGfxButton->currstate;
	pGfxButton->currstate = p;
}

bool GfxButton_IsPressed(GfxButton* pGfxButton)
{ 
	return pGfxButton->currstate; 
}

bool GfxButton_JustPressed(GfxButton* pGfxButton) 
{ 
	return (pGfxButton->currstate && !pGfxButton->laststate); 
}

bool GfxButton_JustReleased(GfxButton* pGfxButton) 
{ 
	return (!pGfxButton->currstate && pGfxButton->laststate); 
}
