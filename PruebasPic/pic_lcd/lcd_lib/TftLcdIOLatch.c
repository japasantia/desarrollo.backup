//#include "C:\Proyectos\TftLcdLib\TftLcdLib.c\TftLcdIOLatch\LatchPortExpander.c"
//#include "C:\Proyectos\TftLcdLib\TftLcdLib.c\TftLcdIOLatch\TftLcdIOLatch.h"
#include "LatchPortExpander.c"
#include "TftLcdIOLatch.h"

// RST | CS | CD | WR | RD 
LatchPortExpander g_lpeControl;	

// D7 | D6 | D5 | D4 | D3 | D2 | D1 | D0
LatchPortExpander g_lpeData;


TftLcdIO* TftLcdIO_Init(TftLcdIO* pTftLcdIO, 
	uint8_t cs, uint8_t cd, uint8_t wr, uint8_t rd,	uint8_t rst,
	uint8_t oeControl, uint8_t oeData, uint8_t clkControl, uint8_t clkData)
{
	pTftLcdIO->_cs = cs;
	pTftLcdIO->_cd = cd;
	pTftLcdIO->_wr = wr;
	pTftLcdIO->_rd = rd;
	pTftLcdIO->_rst = rst;
	
	pTftLcdIO->_oeControl = oeControl;
	pTftLcdIO->_oeData = oeData;
	pTftLcdIO->_clkControl = clkControl;
	pTftLcdIO->_clkData = clkData;
	
	
	LatchPortExpander_Init(&g_lpeControl, oeControl, clkControl);
	LatchPortExpander_Init(&g_lpeData, oeData, clkData);
	
	TftLcdIO_SetWriteDir();
	
	TftLcdIO_SetCsIdle();	
	
	return TftLcdIO_Set(pTftLcdIO);
}

TftLcdIO* TftLcdIO_Set(TftLcdIO* pTftLcdIO)
{
	TftLcdIO* pOld =  g_pTftLcdIO;
	g_pTftLcdIO = pTftLcdIO;

	return g_pTftLcdIO;
}

TLIO_INLINE TftLcdIO* TftLcdIO_Get()
{
	return g_pTftLcdIO;	
}

void TftLcdIO_SetControlIdle()
{
	TftLcdIO_SetRstIdle();
	TftLcdIO_SetCsIdle();
	TftLcdIO_SetCdIdle();
	TftLcdIO_SetWrIdle();
	TftLcdIO_SetRdIdle();
}

TLIO_INLINE void TftLcdIO_SetCsActive()
{
	// CS = LOW
	//digitalWrite(TftLcdIO_Get()->_cs, LOW);
	LatchPortExpander_ClrBit(&g_lpeControl, TftLcdIO_Get()->_cs);
	
}

TLIO_INLINE void TftLcdIO_SetWrActive()
{
	// WR = LOW
	//digitalWrite(TftLcdIO_Get()->_wr, LOW);
	LatchPortExpander_ClrBit(&g_lpeControl, TftLcdIO_Get()->_wr);
}

TLIO_INLINE void TftLcdIO_SetRdActive()
{
	// RD = LOW
	// digitalWrite(TftLcdIO_Get()->_rd, LOW);
	LatchPortExpander_ClrBit(&g_lpeControl, TftLcdIO_Get()->_rd);	
}

TLIO_INLINE void TftLcdIO_SetCdActive()
{
	// CD = LOW
	// digitalWrite(TftLcdIO_Get()->_cd, LOW);
	LatchPortExpander_ClrBit(&g_lpeControl, TftLcdIO_Get()->_cd);	
}

TLIO_INLINE void TftLcdIO_SetRstActive()
{
	// RST = LOW
	// digitalWrite(TftLcdIO_Get()->_rst, LOW);
	LatchPortExpander_ClrBit(&g_lpeControl, TftLcdIO_Get()->_rst);	
}

TLIO_INLINE void TftLcdIO_SetCsIdle()
{
	// CS = HIGH
	// digitalWrite(TftLcdIO_Get()->_cs, HIGH);
	LatchPortExpander_SetBit(&g_lpeControl, TftLcdIO_Get()->_cs);		
}

TLIO_INLINE void TftLcdIO_SetWrIdle()
{
	// WR = HIGH
	// digitalWrite(TftLcdIO_Get()->_wr, HIGH);
	LatchPortExpander_SetBit(&g_lpeControl, TftLcdIO_Get()->_wr);			
}

TLIO_INLINE void TftLcdIO_SetRdIdle()
{
	// RD = HIGH
	// digitalWrite(TftLcdIO_Get()->_rd, HIGH);
	LatchPortExpander_SetBit(&g_lpeControl, TftLcdIO_Get()->_rd);				
}

TLIO_INLINE void TftLcdIO_SetCdIdle()
{
	// CD = HIGH
	// digitalWrite(TftLcdIO_Get()->_cd, HIGH);
	LatchPortExpander_SetBit(&g_lpeControl, TftLcdIO_Get()->_cd);			
}

TLIO_INLINE void TftLcdIO_SetRstIdle()
{
	// RST = HIGH
	// digitalWrite(TftLcdIO_Get()->_rst, HIGH);
	LatchPortExpander_SetBit(&g_lpeControl, TftLcdIO_Get()->_rst);				
}

TLIO_INLINE void TftLcdIO_SetCdCommand()
{
	// CD = LOW
	// digitalWrite(TftLcdIO_Get()->_cd, LOW);
	LatchPortExpander_ClrBit(&g_lpeControl, TftLcdIO_Get()->_cd);					
}

TLIO_INLINE void TftLcdIO_SetCdData()
{
	// CD = HIGH
	// digitalWrite(TftLcdIO_Get()->_cd, HIGH);
	LatchPortExpander_SetBit(&g_lpeControl, TftLcdIO_Get()->_cd);						
}

void TftLcdIO_SetWriteDir()
{
	DDRD = B11111110;
	DDRB = B00111111;
}

void TftLcdIO_SetReadDir()
{
	DDRD = B00000010;
	DDRB = B00111100;
}


TLIO_INLINE void TftLcdIO_WrStrobe()
{
	TftLcdIO_SetWrActive();
	//delayMicroseconds(50);	
	TftLcdIO_SetWrIdle();
	//delayMicroseconds(50);		
}


void TftLcdIO_Write8(byte d)
{
	/*
	PORTD = d << 2;		
	PORTB &= B11111100;
	PORTB |= ( 0x03 & ( d >> 6 ) );		
	*/
	
	/*
	if (d & B10000000)
		digitalWrite(9, HIGH);
	else
		digitalWrite(9, LOW);

	if (d & B01000000)
		digitalWrite(8, HIGH);
	else
		digitalWrite(8, LOW);
	*/
	/*
	byte portData = LatchPortExpander_GetData(&g_lpeControl);
	portData &= B00011111;
	// Latch 0:
	//  7  6  5  4  3  2  1  0
	// D4 D3 D2 
	portData |= ( (unsigned byte)d << 3 ) & B11100000;
	LatchPortExpander_SetData(&g_lpeControl, portData);
	
	// Latch 1: 
	//  7  6  5  4  3  2  1  0
	//          D1 D0 D7 D6 D5
	
	portData = (unsigned byte) d << 3;	// bits D1 D0
	portData |= ( (unsigned byte)d >> 5 ) & B00000111; 	// bits D7 D6 D5	
	LatchPortExpander_SetData(&g_lpe1, portData);
	*/
	
	LatchPortExpander_SetData(&g_lpeData, d);	 

	TftLcdIO_WrStrobe();
}

byte TftLcdIO_Read8()
{
	/*
	TftLcdIO_SetRdActive();
	delayMicroseconds(500);
	int data = (PORTB << 6) | (PORTD >> 2);
	TftLcdIO_SetRdIdle();
	return data;
	*/	
	
	return 0xFF;	
}

void TftLcdIO_WriteRegister8(byte a, byte d)
{
	TftLcdIO_SetCdCommand();
	TftLcdIO_Write8(a);
	TftLcdIO_SetCdData();
	TftLcdIO_Write8(d);
}

void TftLcdIO_WriteRegister16(int a, int d)
{
	byte hi, lo;

	hi = a >> 8;
	lo = a;
	TftLcdIO_SetCdCommand();
	TftLcdIO_Write8(hi);
	TftLcdIO_Write8(lo);

	hi = d >> 8;
	lo = d;
	TftLcdIO_SetCdData();
	TftLcdIO_Write8(hi);
	TftLcdIO_Write8(lo);
}

void TftLcdIO_WriteRegister24(uint8_t r, uint32_t d) 
{		
	TftLcdIO_SetCsActive();		
	TftLcdIO_SetCdCommand();
	TftLcdIO_Write8(r);		
	TftLcdIO_SetCdData();
	delayMicroseconds(10);
	TftLcdIO_Write8(d >> 16);
	delayMicroseconds(10);
	TftLcdIO_Write8(d >> 8);
	delayMicroseconds(10);
	TftLcdIO_Write8(d);
	TftLcdIO_SetCsIdle();
}

void TftLcdIO_WriteRegister32(byte r, long int d)
{
	TftLcdIO_SetCsActive();
	TftLcdIO_SetCdCommand();
	TftLcdIO_Write8(r);
	TftLcdIO_SetCdData();
	delayMicroseconds(10);
	TftLcdIO_Write8(d >> 24);
	delayMicroseconds(10);
	TftLcdIO_Write8(d >> 16);
	delayMicroseconds(10);
	TftLcdIO_Write8(d >> 8);
	delayMicroseconds(10);
	TftLcdIO_Write8(d);
	TftLcdIO_SetCsIdle();
}
/*
#define writeRegisterPairInline(aH, aL, d) { \
uint8_t hi = (d) >> 8, lo = (d); \
CD_COMMAND; TftLcdIO_Write8(aH); CD_DATA; TftLcdIO_Write8(hi); \
CD_COMMAND; TftLcdIO_Write8(aL); CD_DATA; TftLcdIO_Write8(lo); }
*/
void TftLcdIO_WriteRegisterPair(uint8_t aH, uint8_t aL, uint16_t d)
{
	uint8_t hi = d >> 8, lo = d;
	TftLcdIO_SetCdCommand();
	TftLcdIO_Write8(aH);
	TftLcdIO_SetCdData();
	TftLcdIO_Write8(hi);
	TftLcdIO_SetCdCommand();
	TftLcdIO_Write8(aL);
	TftLcdIO_SetCdData();
	TftLcdIO_Write8(lo);

}
