// *** SPFD5408 change -- Begin
#include "TftLcd.h"
#include "TftLcdIO.h"
#include "../src/usb_device.h"

// -- End

// #include "pins_arduino.h"
// #include "wiring_private.h"

//#include "pin_magic.h"

#include "registers.h"

void TftLcd_Init()
{
	/* TODO:		
		Initialize here TftLcdIO
		Initialize here Gfx (AdafruitGfx)
		Update this function
	*/
	// pTftLcd->_driver = driver;

	// Serial.println("On TftLcd::init");
    // putrsUSBUSART("In: TftLcd_Init");

	TftLcdIO_SetCsIdle(); // Set all control bits to idle state
	TftLcdIO_SetWrIdle();
	TftLcdIO_SetRdIdle();
	TftLcdIO_SetCdData();
	
	TftLcdIO_SetRstActive();

	TftLcdIO_SetWriteDir(); // Set up LCD data port(s) for WRITE operations

	
	Gfx_SetRotation(0);
	// Gxf_Get()->Gfx_SetRotation(1);
	Gfx_SetCursorX(0);
	Gfx_SetCursorY(0);
	Gfx_SetTextSize(1);
	Gfx_SetTextColor(0xFFFF);
	Gfx_SetWidth(TFTWIDTH);
	Gfx_SetHeight(TFTHEIGHT);	
	
	// Gfx_SetDrawPixelFunction(&TftLcd_DrawPixel);

	TftLcd_Begin();

	return;
}

// Initialization command table
#define TFTLCD_DELAY 0xFF

void TftLcd_Begin() 
{	
	//uint8_t i = 0;    
    
	TftLcd_Reset();
    
	 //delay(200);	
    __delay_ms(200);

	//uint16_t a, d;
	
	TftLcdIO_SetCsActive();
	TftLcdIO_WriteRegister8(ILI9341_SOFTRESET, 0);
	// delay(50);
    __delay_ms(50);
	TftLcdIO_WriteRegister8(ILI9341_DISPLAYOFF, 0);

	TftLcdIO_WriteRegister8(ILI9341_POWERCONTROL1, 0x23);
	TftLcdIO_WriteRegister8(ILI9341_POWERCONTROL2, 0x10);
	TftLcdIO_WriteRegister16(ILI9341_VCOMCONTROL1, 0x2B2B);
	TftLcdIO_WriteRegister8(ILI9341_VCOMCONTROL2, 0xC0);
	TftLcdIO_WriteRegister8(ILI9341_MEMCONTROL, ILI9341_MADCTL_MY | ILI9341_MADCTL_BGR);
	// TftLcdIO_WriteRegister8(ILI9341_MEMCONTROL, ILI9341_MADCTL_MY | ILI9341_MADCTL_RGB);
	TftLcdIO_WriteRegister8(ILI9341_PIXELFORMAT, 0x55);
	TftLcdIO_WriteRegister16(ILI9341_FRAMECONTROL, 0x001B);

	TftLcdIO_WriteRegister8(ILI9341_ENTRYMODE, 0x07);
	/* WriteRegister32(ILI9341_DISPLAYFUNC, 0x0A822700);*/

	TftLcdIO_WriteRegister8(ILI9341_SLEEPOUT, 0);
	// delay(150);
    __delay_ms(150);
	TftLcdIO_WriteRegister8(ILI9341_DISPLAYON, 0);
	// delay(500);
	// *** SPFD5408 change -- Begin
	// Not tested yet
	//WriteRegister8(ILI9341_INVERTOFF, 0);
	//delay(500);
    __delay_ms(500);
	// *** SPFD5408 change -- End
	TftLcd_SetAddrWindow(0, 0, TFTWIDTH - 1, TFTHEIGHT - 1);

	return;	
}

uint8_t TftLcd_GetDriver()
{
	return ID_9341;
}

void TftLcd_Reset(void) 
{

	TftLcdIO_SetCsIdle();
	//  SetCdData();
	TftLcdIO_SetWrIdle();
	TftLcdIO_SetRdIdle();

	/*
	digitalWrite(5, LOW);
	delay(2);
	digitalWrite(5, HIGH);
	*/
	TftLcdIO_SetRstActive();
	// delay(2);
    __delay_ms(2);
	TftLcdIO_SetRstIdle();

	// Data transfer sync
	TftLcdIO_SetCsActive();
	TftLcdIO_SetCdCommand();
	TftLcdIO_Write8(0x00);
	for (uint8_t i = 0; i<3; i++) 
		TftLcdIO_WrStrobe(); // Three extra 0x00s
		
	TftLcdIO_SetCsIdle();
}

// Sets the LCD address window (and address counter, on 932X).
// Relevant to rect/screen fills and H/V lines.  Input coordinates are
// assumed pre-sorted (e.g. x2 >= x1).
void TftLcd_SetAddrWindow(int x1, int y1, int x2, int y2) 
{
	// Serial.println("On TftLcd_SetAddrWindow");
	
	TftLcdIO_SetCsActive();	
	
	uint32_t t;

	t = x1;
	t <<= 16;
	t |= x2;
	TftLcdIO_WriteRegister32(ILI9341_COLADDRSET, t);  // HX8357D uses same registers!
	t = y1;
	t <<= 16;
	t |= y2;
	TftLcdIO_WriteRegister32(ILI9341_PAGEADDRSET, t); // HX8357D uses same registers!
	
	TftLcdIO_SetCsIdle();
}

// Unlike the 932X drivers that set the address window to the full screen
// by default (using the address counter for drawPixel operations), the
// 7575 needs the address window set on all graphics operations.  In order
// to save a few register writes on each pixel drawn, the lower-right
// corner of the address window is reset after most fill operations, so
// that drawPixel only needs to change the upper left each time.
void TftLcd_SetLR(void) 
{
	int16_t width = Gfx_GetWidth();
	int16_t height = Gfx_GetHeight();

	TftLcdIO_SetCsActive();
	TftLcdIO_WriteRegisterPair(HX8347G_COLADDREND_HI, HX8347G_COLADDREND_LO, width - 1);
	TftLcdIO_WriteRegisterPair(HX8347G_ROWADDREND_HI, HX8347G_ROWADDREND_LO, height - 1);
	TftLcdIO_SetCsIdle();
}

// Fast block fill operation for fillScreen, fillRect, H/V line, etc.
// Requires TftLcd_SetAddrWindow() has previously been called to set the fill
// bounds.  'len' is inclusive, MUST be >= 1.
void TftLcd_Flood(uint16_t color, uint32_t len)
{
	// Serial.println("On TftLcd_Flood");
	
	uint16_t blocks;
	uint8_t  i, hi = color >> 8,
		lo = color;

	TftLcdIO_SetCsActive();
	TftLcdIO_SetCdCommand();
	
	TftLcdIO_Write8(0x2C);	

	// Write first pixel normally, decrement counter by 1
	TftLcdIO_SetCdData();
	TftLcdIO_Write8(hi);
	TftLcdIO_Write8(lo);
	len--;

	blocks = (uint16_t)(len / 64); // 64 pixels/block
	if (hi == lo) {
		// High and low bytes are identical.  Leave prior data
		// on the port(s) and just toggle the write strobe.
		while (blocks--) {
			i = 16; // 64 pixels/block / 4 pixels/pass
			do {
				TftLcdIO_WrStrobe(); TftLcdIO_WrStrobe(); TftLcdIO_WrStrobe(); TftLcdIO_WrStrobe(); // 2 bytes/pixel
				TftLcdIO_WrStrobe(); TftLcdIO_WrStrobe(); TftLcdIO_WrStrobe(); TftLcdIO_WrStrobe(); // x 4 pixels
			} while (--i);
		}
		// Fill any remaining pixels (1 to 64)
		for (i = (uint8_t)len & 63; i--;) {
			TftLcdIO_WrStrobe();
			TftLcdIO_WrStrobe();
		}
	}
	else {
		while (blocks--) {
			i = 16; // 64 pixels/block / 4 pixels/pass
			do {
				TftLcdIO_Write8(hi); TftLcdIO_Write8(lo); TftLcdIO_Write8(hi); TftLcdIO_Write8(lo);
				TftLcdIO_Write8(hi); TftLcdIO_Write8(lo); TftLcdIO_Write8(hi); TftLcdIO_Write8(lo);
			} while (--i);
		}
		for (i = (uint8_t)len & 63; i--;) {
			TftLcdIO_Write8(hi);
			TftLcdIO_Write8(lo);
		}
	}
	TftLcdIO_SetCsIdle();
	
	// Serial.println("Exiting TftLcd_Flood");
}

void TftLcd_DrawFastHLine(int16_t x, int16_t y, int16_t length,
	uint16_t color)
{
	int16_t x2;
	int16_t width = Gfx_GetWidth();
	int16_t height = Gfx_GetHeight();

	// Initial off-screen clipping
	if ((length <= 0) ||
		(y      <  0) || (y >= height) ||
		(x >= width) || ((x2 = (x + length - 1)) <  0))
		 return;

	if (x < 0) 
	{        // Clip left
		length += x;
		x = 0;
	}
	if (x2 >= width)
	{ // Clip right
		x2 = width - 1;
		length = x2 - x + 1;
	}

	TftLcd_SetAddrWindow(x, y, x2, y);
	TftLcd_Flood(color, length);

	if (TftLcd_GetDriver() == ID_932X) 
		TftLcd_SetAddrWindow(0, 0, width - 1, height - 1);
	else 
		TftLcd_SetLR();
}

void TftLcd_DrawFastVLine(int16_t x, int16_t y, int16_t length,
	uint16_t color)
{
	int16_t y2;
	int16_t width = Gfx_GetWidth();
	int16_t height = Gfx_GetHeight();	

	// Initial off-screen clipping
	if ((length <= 0) ||
		(x      <  0) || (x >= width) ||
		(y >= height) || ((y2 = (y + length - 1)) <  0)) 
		return;

	if (y < 0) 
	{         // Clip top
		length += y;
		y = 0;
	}
	if (y2 >= height) 
	{ // Clip bottom
		y2 = height - 1;
		length = y2 - y + 1;
	}

	TftLcd_SetAddrWindow(x, y, x, y2);
	TftLcd_Flood(color, length);

	if (TftLcd_GetDriver() == ID_932X) 
		TftLcd_SetAddrWindow(0, 0, width - 1, height - 1);
	else    
	    TftLcd_SetLR();
}

void TftLcd_FillRect(int16_t x1, int16_t y1, int16_t w, int16_t h,
	uint16_t fillcolor) 
{
	int16_t  x2, y2;
	int16_t width = Gfx_GetWidth();
	int16_t height = Gfx_GetHeight();	


	// Initial off-screen clipping
	if ((w <= 0) || (h <= 0) ||
		(x1 >= width) || (y1 >= height) ||
		((x2 = x1 + w - 1) <  0) || ((y2 = y1 + h - 1) <  0)) 
		return;

	if (x1 < 0)
	{ // Clip left
		w += x1;
		x1 = 0;
	}
	if (y1 < 0)
	{ // Clip top
		h += y1;
		y1 = 0;
	}
	if (x2 >= width) 
	{ // Clip right
		x2 = width - 1;
		w = x2 - x1 + 1;
	}
	if (y2 >= height) 
	{ // Clip bottom
		y2 = height - 1;
		h = y2 - y1 + 1;
	}

	TftLcd_SetAddrWindow(x1, y1, x2, y2);
	TftLcd_Flood(fillcolor, (uint32_t)w * (uint32_t)h);	
	TftLcd_SetLR();
}

void TftLcd_FillScreen(uint16_t color) 
{	
	// Serial.println("On TftLcd_FillScreen");
	
	int16_t width = Gfx_GetWidth();
	int16_t height = Gfx_GetHeight();	


	TftLcd_SetAddrWindow(0, 0, width - 1, height - 1);	
	TftLcd_Flood(color, (long)TFTWIDTH * (long)TFTHEIGHT);
}

void TftLcd_DrawPixel(int16_t x, int16_t y, uint16_t color)
{
	// Serial.println("On TftLcd_DrawPixel");

	int16_t width = Gfx_GetWidth();
	int16_t height = Gfx_GetHeight();	

	// Clip
	if ((x < 0) || (y < 0) || (x >= width) || (y >= height))
		return;

	TftLcdIO_SetCsActive();	
	
	TftLcd_SetAddrWindow(x, y, width - 1, height - 1);
	TftLcdIO_SetCsActive();
	TftLcdIO_SetCdCommand();
	TftLcdIO_Write8(0x2C);
	TftLcdIO_SetCdData();
	TftLcdIO_Write8(color >> 8); TftLcdIO_Write8(color);	

	TftLcdIO_SetCsIdle();
}

// Issues 'raw' an array of 16-bit color values to the LCD; used
// externally by BMP examples.  Assumes that setWindowAddr() has
// previously been set to define the bounds.  Max 255 pixels at
// a time (BMP examples read in small chunks due to limited RAM).
void TftLcd_PushColors(uint16_t *data, uint8_t len, boolean first) 
{
	uint16_t color;
	uint8_t  hi, lo;
	TftLcdIO_SetCsActive();
	if (first == true)
	{ 
		// Issue GRAM write command only on first call
		TftLcdIO_SetCdCommand();				
		TftLcdIO_Write8(0x2C);		
	}
	TftLcdIO_SetCdData();
	while (len--)
	{
		color = *data++;
		hi = color >> 8; // Don't simplify or merge these
		lo = color;      // lines, there's macro shenanigans
		TftLcdIO_Write8(hi);         // going on.
		TftLcdIO_Write8(lo);
	}
	TftLcdIO_SetCsIdle();
}

void TftLcd_SetRotation(uint8_t x)
{

	// Call parent rotation func first -- sets up rotation flags, etc.
	Gfx_SetRotation(x);
	// Then perform hardware-specific rotation operations...

	TftLcdIO_SetCsActive();
	
	// MEME, HX8357D uses same registers as 9341 but different values
	uint16_t t;

	switch (Gfx_GetRotation()) 
	{
	case 2:
		t = ILI9341_MADCTL_MX | ILI9341_MADCTL_BGR;
		break;
	case 3:
		t = ILI9341_MADCTL_MV | ILI9341_MADCTL_BGR;
		break;
	case 0:
		t = ILI9341_MADCTL_MY | ILI9341_MADCTL_BGR;
		break;
	case 1:
		t = ILI9341_MADCTL_MX | ILI9341_MADCTL_MY | ILI9341_MADCTL_MV | ILI9341_MADCTL_BGR;
		break;
	}

	int16_t width = Gfx_GetWidth();
	int16_t height = Gfx_GetHeight();	

	TftLcdIO_WriteRegister8(ILI9341_MADCTL, t); // MADCTL
	// For 9341, init default full-screen address window:
	TftLcd_SetAddrWindow(0, 0, width - 1, height - 1); // SetCsIdle() happens here
}

// Because this function is used infrequently, it configures the ports for
// the read operation, reads the data, then restores the ports to the write
// configuration.  Write operations happen a LOT, so it's advantageous to
// leave the ports in that state as a default.
uint16_t TftLcd_ReadPixel(int16_t x, int16_t y)
{

	int16_t width = Gfx_GetWidth();
	int16_t height = Gfx_GetHeight();	

	if ((x < 0) || (y < 0) || (x >= width) || (y >= height))
		return 0;

	TftLcdIO_SetCsActive();

	return 0;
}

// Ditto with the read/write port directions, as above.
uint16_t TftLcd_ReadID(void) 
{

	  uint8_t hi, lo;	
	  /*
	  for (uint8_t i=0; i<128; i++) 
	  {
	    Serial.print("$"); Serial.print(i, HEX);
	    Serial.print(" = 0x"); Serial.println(TftLcd_ReadReg(i), HEX);
	  }
	  
	
	  if (TftLcd_ReadReg(0x04) == 0x8000)
	  { // eh close enough
	    // setc!
	    
	      Serial.println("!");
	      for (uint8_t i=0; i<254; i++) 
		  {
			Serial.print("$"); Serial.print(i, HEX);
			Serial.print(" = 0x"); Serial.println(TftLcd_ReadReg(i), HEX);
	      }
	    
	    TftLcdIO_WriteRegister24(HX8357D_SETC, 0xFF8357);
	    delay(300);
	    Serial.println(TftLcd_ReadReg(0xD0), HEX);
	    if (TftLcd_ReadReg(0xD0) == 0x990000) 
		{
	      return 0x8357;
	    }
	  }
	*/
      
	  uint16_t id = TftLcd_ReadReg(0xD3);
	  if (id == 0x9341) 
	  {
	    return id;
	  }
	
	  TftLcdIO_SetCsActive();
	  TftLcdIO_SetCdCommand();
	  TftLcdIO_Write8(0x00);
	  TftLcdIO_WrStrobe();     // Repeat prior byte (0x00)
	  TftLcdIO_SetReadDir();  // Set up LCD data port(s) for READ operations
	  TftLcdIO_SetCdData();
	  hi = TftLcdIO_Read8();
	  lo = TftLcdIO_Read8();
	  TftLcdIO_SetWriteDir();  // Restore LCD data port(s) to WRITE configuration
	  TftLcdIO_SetCsIdle();
	
	  id = hi; id <<= 8; id |= lo;
	  return id;
}

uint32_t TftLcd_ReadReg(uint8_t r) 
{
	uint32_t id;
	uint8_t x;

	// try reading register #4
	TftLcdIO_SetCsActive();
	TftLcdIO_SetCdCommand();
	TftLcdIO_Write8(r);
	TftLcdIO_SetReadDir();  // Set up LCD data port(s) for READ operations
	TftLcdIO_SetCdData();
	//delayMicroseconds(50);
	x = TftLcdIO_Read8();
	id = x;          // Do not merge or otherwise simplify
	id <<= 8;              // these lines.  It's an unfortunate
	x = TftLcdIO_Read8();
	id |= x;        // shenanigans that are going on.
	id <<= 8;              // these lines.  It's an unfortunate
	x = TftLcdIO_Read8();
	id |= x;        // shenanigans that are going on.
	id <<= 8;              // these lines.  It's an unfortunate
	x = TftLcdIO_Read8();
	id |= x;        // shenanigans that are going on.
	TftLcdIO_SetCsIdle();
	TftLcdIO_SetWriteDir();  // Restore LCD data port(s) to WRITE configuration

	//Serial.print("Read $"); Serial.print(r, HEX); 
	//Serial.print(":\t0x"); Serial.println(id, HEX);
	return id; 
}

// Pass 8-bit (each) R,G,B, get back 16-bit packed color
uint16_t TftLcd_Color565(uint8_t r, uint8_t g, uint8_t b) 
{
	return ((r & 0xF8) << 8) | ((g & 0xFC) << 3) | (b >> 3);
}
