#ifndef TFT_LCD_IO_H
#define TFT_LCD_IO_H

// #include "Arduino.h"
#include "TftLcdDef.h"

#if !defined(TLIO_INLINE)
	#define TLIO_INLINE inline
#endif

// #define TLIO_INLINE

#if !defined(RST)
  #define RST   3
#endif 

#if !defined(CS)
  #define CS    2
#endif 

#if !defined(CD)  
  #define CD    1
#endif 

#if !defined(WR)  
  #define WR    0
#endif   
  
#if !defined(RD)  
  #define RD    4
#endif 

#if !defined(OE_CONTROL)  
	#define OE_CONTROL		13
#endif

#if !defined(OE_DATA)  
	#define OE_DATA			12
#endif

#if !defined(CLK_CONTROL)  
	#define CLK_CONTROL		11
#endif

#if !defined(CLK_DATA)  
	#define	CLK_DATA		10	
#endif

/*
void setControlIdle();
void setRstIdle();
void setCsIdle();
void setRsIdle();
void setWrIdle();
void setRdIdle();
*/

typedef struct tagTftLcdIO 
{
	uint8_t _cs;
	uint8_t _cd;
	uint8_t _wr;
	uint8_t _rd;
	uint8_t _rst;
	
	uint8_t _oeControl;
	uint8_t _oeData;
	uint8_t	_clkControl;
	uint8_t	_clkData;

} TftLcdIO;

static TftLcdIO* g_pTftLcdIO = NULL;

TftLcdIO* TftLcdIO_Init(TftLcdIO* pTftLcdIO, 
	uint8_t cs = CS, uint8_t cd = CD, uint8_t wr = WR, uint8_t rd = RD,
	uint8_t rst = RST, 
	uint8_t oeControl = OE_CONTROL, uint8_t oeData = OE_DATA, 
	uint8_t clkControl = CLK_CONTROL, uint8_t clkData = CLK_DATA);

TftLcdIO* TftLcdIO_Set(TftLcdIO* pTftLcdIO);
TftLcdIO* TftLcdIO_Get();

void TftLcdIO_SetControlIdle();

TLIO_INLINE void TftLcdIO_SetCsActive();

TLIO_INLINE void TftLcdIO_SetWrActive();

TLIO_INLINE void TftLcdIO_SetRdActive();

TLIO_INLINE void TftLcdIO_SetCdActive();

TLIO_INLINE void TftLcdIO_SetRstActive();

TLIO_INLINE void TftLcdIO_SetCsIdle();

TLIO_INLINE void TftLcdIO_SetWrIdle();

TLIO_INLINE void TftLcdIO_SetRdIdle();

TLIO_INLINE void TftLcdIO_SetCdIdle();

TLIO_INLINE void TftLcdIO_SetRstIdle();

TLIO_INLINE void TftLcdIO_SetCdCommand();

TLIO_INLINE void TftLcdIO_SetCdData();

void TftLcdIO_SetWriteDir();

void TftLcdIO_SetReadDir();

TLIO_INLINE void TftLcdIO_WrStrobe();

TLIO_INLINE void TftLcdIO_Write8(byte d);

byte TftLcdIO_Read8();

void TftLcdIO_WriteRegister8(byte a, byte d);

void TftLcdIO_WriteRegister16(int a, int d);

void TftLcdIO_WriteRegister24(uint8_t r, uint32_t d);

void TftLcdIO_WriteRegister32(byte r, long int d);
/*
#define writeRegisterPairInline(aH, aL, d) { \
uint8_t hi = (d) >> 8, lo = (d); \
CD_COMMAND; write8(aH); CD_DATA; write8(hi); \
CD_COMMAND; write8(aL); CD_DATA; write8(lo); }
*/
void TftLcdIO_WriteRegisterPair(uint8_t aH, uint8_t aL, uint16_t d);

#endif
