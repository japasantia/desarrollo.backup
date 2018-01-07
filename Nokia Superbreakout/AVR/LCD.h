

/* Copyright (c) 2010, Peter Barrett
**
** Permission to use, copy, modify, and/or distribute this software for
** any purpose with or without fee is hereby granted, provided that the
** above copyright notice and this permission notice appear in all copies.
**
** THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL
** WARRANTIES WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED
** WARRANTIES OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR
** BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES
** OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS,
** WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION,
** ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS
** SOFTWARE.
*/

#ifndef u8
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned long u32;
#endif

#define DELAY_MS 0x200

typedef void (*LCDRectangleProc)(int x, int y, int width, int height, int color);
typedef void (*LCDSetBoundsProc)(int x, int y, int width, int height);
typedef void (*LCDFillProc)(u32 color, u32 count);
typedef void (*LCDBlitProc)(const u8* data, u32 count);
typedef void (*LCDBlitIndexedProc)(const u8* data, const u8* palette, u32 count);
typedef void (*LCDScrollProc)(int y);

typedef struct
{
	u32	id;
	int	width;
	int	height;
	int	format;
	int	feature;

	LCDRectangleProc	Rectangle;
	LCDSetBoundsProc	SetBounds;
	LCDFillProc			Fill;
	LCDBlitProc			Blit;
	LCDBlitIndexedProc	BlitIndexed;
	LCDScrollProc		Scroll;
} LCDInfo;

u32 LCDReadID();
int LCDInit();

void LCDBegin();	// Select LCD
void LCDEnd();		// Release LCD
u32 LCDChanged();

void LCDLine(int x0, int y0, int x1, int y1, int color);

#define LCDWidth() 		_lcd.width
#define LCDHeight() 	_lcd.height
#define LCDFormat() 	_lcd.format
#define LCDRectangle 	_lcd.Rectangle
#define LCDSetBounds 	_lcd.SetBounds
#define LCDFill 		_lcd.Fill
#define LCDBlit 		_lcd.Blit
#define LCDBlitIndexed	_lcd.BlitIndexed
#define LCDScroll 		_lcd.Scroll
#define LCDID() 		_lcd.id

extern LCDInfo _lcd;

