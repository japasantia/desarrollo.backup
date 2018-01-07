// Touch screen library with X Y and Z (pressure) readings as well
// as oversampling to avoid 'bouncing'
// (c) ladyada / adafruit
// Code under MIT License

// #include "pins_arduino.h"
// #include "wiring_private.h"
#ifdef __AVR
  #include <avr/pgmspace.h>
#elif defined(ESP8266)
  #include <pgmspace.h>
#endif

#include "TftTouchScreen.h"
#include "TftLcdIO.h"

// increase or decrease the touchscreen oversampling. This is a little different than you make think:
// 1 is no oversampling, whatever data we get is immediately returned
// 2 is double-sampling and we only return valid data if both points are the same
// 3+ uses insert sort to get the median value.
// We found 2 is precise yet not too slow so we suggest sticking with it!

#define NUMSAMPLES 2

void TSPoint_Init(TSPoint* point, int16_t x0, int16_t y0, 
	int16_t z0)
{
		point->x = x0;
		point->y = y0;
		point->z = z0;
}

bool TSPoint_Equal(TSPoint* pPointA, TSPoint* pPointB)
{
	return ((pPointA->x == pPointB->x) && (pPointA->y == pPointB->y) 
		&& (pPointA->z == pPointB->z));
}

#if (NUMSAMPLES > 2)
static void insert_sort(int array[], uint8_t size) {
  uint8_t j;
  int save;
  
  for (int i = 1; i < size; i++) {
    save = array[i];
    for (j = i; j >= 1 && save < array[j - 1]; j--)
      array[j] = array[j - 1];
    array[j] = save; 
  }
}
#endif


TS_INLINE void TouchScreen_SetRxPlate(uint16_t rxplate)
{
	g_rxplate = rxplate;
}

TS_INLINE uint16_t TouchScreen_GetRxPlate()
{
	return g_rxplate;
}

TSPoint TouchScreen_GetPoint(void) 
{
  int x, y, z;
  int samples[NUMSAMPLES];
  uint8_t i, valid;
  
  TftLcdIO_BeginTouchScreenRead();

  valid = 1;
  /*
  pinMode(_yp, INPUT);
  pinMode(_ym, INPUT);
  
  *portOutputRegister(yp_port) &= ~yp_pin;
  *portOutputRegister(ym_port) &= ~ym_pin;
  */
  //digitalWrite(_yp, LOW);
  //digitalWrite(_ym, LOW);
    
  TftLcdIO_HiImpedanceYp();
  TftLcdIO_HiImpedanceYm();
  TftLcdIO_ClrYp();
  TftLcdIO_ClrYm();

  /* 
  pinMode(_xp, OUTPUT);
  pinMode(_xm, OUTPUT);
  */ 
  //digitalWrite(_xp, HIGH);
  //digitalWrite(_xm, LOW);
  /*
  *portOutputRegister(xp_port) |= xp_pin;
  *portOutputRegister(xm_port) &= ~xm_pin;
  */
  TftLcdIO_OutputXp();
  TftLcdIO_OutputXm();
  TftLcdIO_SetXp();
  TftLcdIO_ClrXm();
   
	/*
	for (i=0; i<NUMSAMPLES; i++) {
		samples[i] = analogRead(_yp);
	}
	*/
	for (i = 0; i < NUMSAMPLES; i++) 
	{
		samples[i] = TftLcdIO_AnalogReadYp();
	}  
   
#if NUMSAMPLES > 2
	insert_sort(samples, NUMSAMPLES);
#endif
#if NUMSAMPLES == 2
	if (samples[0] != samples[1]) 
	{ 
		valid = 0; 
	}
#endif
	x = (1023 - samples[NUMSAMPLES / 2]);
	
	/*
	pinMode(_xp, INPUT);
	pinMode(_xm, INPUT);	 
	*portOutputRegister(xp_port) &= ~xp_pin;
	*/ 
	//digitalWrite(_xp, LOW);
	TftLcdIO_HiImpedanceXp();
	TftLcdIO_HiImpedanceXm();
   
	/*
	pinMode(_yp, OUTPUT);
	*portOutputRegister(yp_port) |= yp_pin;
	//digitalWrite(_yp, HIGH);
	pinMode(_ym, OUTPUT);
	*/
	TftLcdIO_OutputYp();
	TftLcdIO_SetYp(); 
	TftLcdIO_OutputYm();	
	TftLcdIO_ClrYm();
	
	/*
	for (i = 0; i < NUMSAMPLES; i++) 
	{
		samples[i] = analogRead(_xm);
	}
	*/
	for (i = 0; i < NUMSAMPLES; i++) 
	{
		samples[i] = TftLcdIO_AnalogReadXm();
	}	
	 

#if NUMSAMPLES > 2
	insert_sort(samples, NUMSAMPLES);
#endif
#if NUMSAMPLES == 2
	if (samples[0] != samples[1]) 
	{ 
		valid = 0; 
	}
#endif

	y = (1023 - samples[NUMSAMPLES / 2]);

	// Set X+ to ground
	/*
	pinMode(_xp, OUTPUT);
	*portOutputRegister(xp_port) &= ~xp_pin;
	*/ 
	//digitalWrite(_xp, LOW);
	TftLcdIO_OutputXp();
	TftLcdIO_ClrXp();	


	// Set Y- to VCC
	//*portOutputRegister(ym_port) |= ym_pin;
	//digitalWrite(_ym, HIGH); 
	TftLcdIO_OutputYm();
	TftLcdIO_SetYm();

	// Hi-Z X- and Y+
	//*portOutputRegister(yp_port) &= ~yp_pin;
	//digitalWrite(_yp, LOW);
	//pinMode(_yp, INPUT);	
	TftLcdIO_ClrYp();
	TftLcdIO_HiImpedanceYp();
	/*
	int z1 = analogRead(_xm); 
	int z2 = analogRead(_yp);
	*/
	int z1 = TftLcdIO_AnalogReadXm();
	int z2 = TftLcdIO_AnalogReadYp();
	
	uint16_t _rxplate = TouchScreen_GetRxPlate();

	if (_rxplate != 0)
	{
	 // now read the x 
	 float rtouch;
	 rtouch = z2;
	 rtouch /= z1;
	 rtouch -= 1;
	 rtouch *= x;
	 rtouch *= _rxplate;
	 rtouch /= 1024;
	 
	 z = rtouch;
	} 
	else 
	{
	 z = (1023 -(z2 - z1));
	}

	if (! valid)
	{
	 z = 0;
	}	
	
	//return TSPoint(x, y, z);

	// *** SPFD5408 change -- Begin
	// SPFD5408 change, because Y coordinate is inverted in this controller
	//return TSPoint(x, 1023 - y, z);
	// -- End
	TSPoint tsPoint;
	// TSPoint_Init(&tsPoint, x, 1023 - y, z);	
	TSPoint_Init(&tsPoint, x, y, z);	
	
	TftLcdIO_EndTouchScreenRead();
	
	return tsPoint;
}
/*
TouchScreen::TouchScreen(uint8_t xp, uint8_t yp, uint8_t xm, uint8_t ym) {
  _yp = yp;
  _xm = xm;
  _ym = ym;
  _xp = xp;
  _rxplate = 0;
  pressureThreshhold = 10;
}


TouchScreen::TouchScreen(uint8_t xp, uint8_t yp, uint8_t xm, uint8_t ym,
			 uint16_t rxplate) {
  _yp = yp;
  _xm = xm;
  _ym = ym;
  _xp = xp;
  _rxplate = rxplate;

  pressureThreshhold = 10;
}
*/

int TouchScreen_ReadTouchX(void) 
{
	/*
	pinMode(_yp, INPUT);
	pinMode(_ym, INPUT);
	digitalWrite(_yp, LOW);
	digitalWrite(_ym, LOW);

	pinMode(_xp, OUTPUT);
	digitalWrite(_xp, HIGH);
	pinMode(_xm, OUTPUT);
	digitalWrite(_xm, LOW);

	return (1023-analogRead(_yp));
	*/
	
	TftLcdIO_BeginTouchScreenRead();
	
	TftLcdIO_HiImpedanceYp(); 
	TftLcdIO_HiImpedanceYm();
	TftLcdIO_ClrYp();
	TftLcdIO_ClrYm();	
	
	TftLcdIO_OutputXp();
	TftLcdIO_SetXp();	
	// TftLcdIO_ClrXp();		
	TftLcdIO_OutputXm();
	TftLcdIO_ClrXm();	
	// TftLcdIO_SetXm();		
	
	// int x = 1023 - TftLcdIO_AnalogReadYp();
	// int x = TftLcdIO_AnalogReadYp();
	
	uint32_t x = 0;
	for (int i = 0; i < 100; i++)
	{
		x += TftLcdIO_AnalogReadYp();	
	}
	x /= 100;	
	
	TftLcdIO_EndTouchScreenRead();
	
	return x;
}


int TouchScreen_ReadTouchY(void) 
{	
	/*
	pinMode(_xp, INPUT);
	pinMode(_xm, INPUT);
	digitalWrite(_xp, LOW);
	digitalWrite(_xm, LOW);

	pinMode(_yp, OUTPUT);
	digitalWrite(_yp, HIGH);
	pinMode(_ym, OUTPUT);
	digitalWrite(_ym, LOW);

	return (1023-analogRead(_xm));
	*/
	
	TftLcdIO_BeginTouchScreenRead();
	
	TftLcdIO_HiImpedanceXp();
	TftLcdIO_HiImpedanceXm();
	TftLcdIO_ClrXp();
	TftLcdIO_ClrXm();
	
	TftLcdIO_OutputYp();
	TftLcdIO_SetYp();
	// TftLcdIO_ClrYp();
	TftLcdIO_OutputYm();
	TftLcdIO_ClrYm();	
	// TftLcdIO_SetYm();	
	
	//int y = 1023 - TftLcdIO_AnalogReadXm();	
	// int y = TftLcdIO_AnalogReadXm();
	
	uint32_t y = 0;
	for (int i = 0; i < 100; i++)
	{
		y += TftLcdIO_AnalogReadXm();	
	}
	y /= 100;
	
	TftLcdIO_EndTouchScreenRead();	
	
	return y;
}


uint16_t TouchScreen_Pressure(void) 
{
	/*
	// Set X+ to ground
	pinMode(_xp, OUTPUT);
	digitalWrite(_xp, LOW);

	// Set Y- to VCC
	pinMode(_ym, OUTPUT);
	digitalWrite(_ym, HIGH); 

	// Hi-Z X- and Y+
	digitalWrite(_xm, LOW);
	pinMode(_xm, INPUT);
	digitalWrite(_yp, LOW);
	pinMode(_yp, INPUT);

	int z1 = analogRead(_xm); 
	int z2 = analogRead(_yp);

	if (_rxplate != 0) 
	{
	// now read the x 
	float rtouch;
	rtouch = z2;
	rtouch /= z1;
	rtouch -= 1;
	rtouch *= readTouchX();
	rtouch *= _rxplate;
	rtouch /= 1024;

	return rtouch;
	} 
	else
	{
	return (1023-(z2-z1));
	}
	*/
	
	TftLcdIO_BeginTouchScreenRead();
	
	TftLcdIO_OutputXp();
	// TftLcdIO_ClrXp();
	TftLcdIO_SetXp();
	
	TftLcdIO_OutputYm();
	// TftLcdIO_SetYm();
	TftLcdIO_ClrYm();
	
	TftLcdIO_ClrXm();
	TftLcdIO_HiImpedanceXm();
	TftLcdIO_ClrYp();
	TftLcdIO_HiImpedanceYp();	
	
	int z1 = TftLcdIO_AnalogReadXm();
	int z2 = TftLcdIO_AnalogReadYp();
	
	uint16_t _rxplate = TouchScreen_GetRxPlate();
	float rtouch;
	
	if (_rxplate != 0) 
	{		
		rtouch = z2;
		rtouch /= z1;
		rtouch -= 1;
		rtouch *= TouchScreen_ReadTouchX();
		rtouch *= _rxplate;
		rtouch /= 1024;		
	}
	else 
	{
		rtouch = (1023 - (z2 - z1));
	}	
	
	TftLcdIO_EndTouchScreenRead();
	return rtouch;
}

uint16_t TouchScreen_Pressure1(void) 
{	
	TftLcdIO_BeginTouchScreenRead();
	
	TftLcdIO_OutputXp();
	// TftLcdIO_ClrXp();
	TftLcdIO_SetXp();
	
	TftLcdIO_OutputYm();
	// TftLcdIO_SetYm();
	TftLcdIO_ClrYm();
	
	TftLcdIO_ClrXm();
	TftLcdIO_HiImpedanceXm();
	TftLcdIO_ClrYp();
	TftLcdIO_HiImpedanceYp();	
	
	uint32_t pressure = 0;
	
	for (int i = 0; i < 100; i++)
	{
		pressure += TftLcdIO_AnalogReadXm() -
			TftLcdIO_AnalogReadYp();	
	}
	
	TftLcdIO_EndTouchScreenRead();
	
	return pressure / 100;
}

