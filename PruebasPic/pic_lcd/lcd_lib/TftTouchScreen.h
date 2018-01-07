// Touch screen library with X Y and Z (pressure) readings as well
// as oversampling to avoid 'bouncing'
// (c) ladyada / adafruit
// Code under MIT License

#ifndef _ADAFRUIT_TOUCHSCREEN_H_
#define _ADAFRUIT_TOUCHSCREEN_H_

#include "TftLcdDef.h"

#define TS_INLINE inline

/*
class TSPoint {
 public:
  TSPoint(void);
  TSPoint(int16_t x, int16_t y, int16_t z);
  
  bool operator==(TSPoint);
  bool operator!=(TSPoint);

  int16_t x, y, z;
};
*/

typedef struct tagTSPoint 
{
	int16_t x;
	int16_t y;	
	int16_t z;	
} TSPoint;

void TSPoint_Init(TSPoint* point, int16_t x0, int16_t y0, int16_t z0);
bool TSPoint_Equal(TSPoint* pointA, TSPoint* pointB);

/*
class TouchScreen {
 public:
  TouchScreen(uint8_t xp, uint8_t yp, uint8_t xm, uint8_t ym);
  TouchScreen(uint8_t xp, uint8_t yp, uint8_t xm, uint8_t ym, uint16_t rx);

  bool isTouching(void);
  uint16_t pressure(void);
  int readTouchY();
  int readTouchX();
  TSPoint getPoint();
  int16_t pressureThreshhold;

private:
  uint8_t _yp, _ym, _xm, _xp;
  uint16_t _rxplate;
};
*/

static uint16_t g_rxplate = 0;
	
TS_INLINE void TouchScreen_SetRxPlate(uint16_t rxplate);
TS_INLINE uint16_t TouchScreen_GetRxPlate();

bool TouchScreen_IsTouching();
uint16_t TouchScreen_Pressure();
int TouchScreen_ReadTouchY();
int TouchScreen_ReadTouchX();
TSPoint TouchScreen_GetPoint();
int16_t TouchScreen_PressureThreshold();


#endif
