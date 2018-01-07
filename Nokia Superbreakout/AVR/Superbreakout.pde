#include <LCD.h>


void BacklightPWM()
{
  ICR1 = 32-1;  // 500khz
  OCR1A = 20-1;  // duty cycle
  TCCR1A = (1<< WGM11);
  TCCR1B = (1 << WGM13) | (1<<WGM12) | (1 << CS10);
  TCCR1A |= 2 <<  6;  // enable PWM on port B1
}

void PrintId()
{
  u32 a = LCDID();
  Serial.print((byte)(a>>16),HEX);
  Serial.print((byte)(a>>8),HEX);
  Serial.print((byte)a,HEX);
  Serial.print("\n");
}

void setup()
{
  Serial.begin(9600);
  while (LCDInit() == -1)
  {
    Serial.print("Unidentified LCD\n");
    continue;
  }
  Serial.print("LCD ID:");
  PrintId();
  BacklightPWM();
}
u16 xor16(void);

void Draw8(int cx, int cy, int x, int y, int color)
{
  LCDRectangle(cx-y,cy-x,y<<1,1,color);
  LCDRectangle(cx-x,cy-y,x<<1,1,color);
  LCDRectangle(cx-x,cy+y,x<<1,1,color);
  LCDRectangle(cx-y,cy+x,y<<1,1,color);
}

//	Octant circle drawing
void Circle(int cx, int cy, int radius, int color)
{
	int error = -radius;
	int x = radius;
	int y = 0;

//	draws in 4 strips from top down and middle up + reflection about y
	while (x >= y)
	{
		Draw8(cx, cy, x, y,color);
		error += y;
		++y;
		error += y;
		if (error >= 0)
		{
			--x;
			error -= x<<1;
		}
	}
}

void TestBlit()
{
  int buf[132];
  int w = LCDWidth();
  int h = LCDHeight();
  for (int i = 0; i < w; i++)
    buf[i] = 0xF800 + (i >> 2);
  LCDSetBounds(0,0,w,h);
  for (int y = 0; y < h; y++)
    LCDBlit((const u8*)buf,w);
}

void TestIndexedBlit()
{
  int palette[132];
  u8 indx[132];
  int w = LCDWidth();
  int h = LCDHeight();
  for (int i = 0; i < w; i++)
  {
    palette[i] = 0xF800 + (i >> 2);
    indx[i] = i;
  }
  LCDSetBounds(0,0,w,h);
  for (int y = 0; y < h; y++)
    LCDBlitIndexed(( u8*)indx,(u8*)palette,w);
}

void TestFill()
{
  int cx = xor16() % LCDWidth();
  int cy = xor16() % LCDHeight();
  int radius = xor16() % LCDWidth();
  Circle(cx,cy,radius>>2,xor16());
}

void loop()
{
      LCDBegin();
      TestBlit();
      for (int i = 0; i < 1000; i++)
        TestFill();
      LCDEnd();
}
