#include <stdarg.h>
#include <stdio.h>

#include "C:\Proyectos\TftLcdLib\TftLcdLib.c\TftLcdIO.h"
#include "C:\Proyectos\TftLcdLib\TftLcdLib.c\TftLcdIO.c"
#include "C:\Proyectos\TftLcdLib\TftLcdLib3\TftLcd.c"
#include "C:\Proyectos\TftLcdLib\TftLcdLib.c\TftLcd.c"

#include "C:\Proyectos\TftLcdLib\TftLcdLib.c\StringScanner.cpp"


TftLcdIO g_tftLcdIO;
TftLcd g_tftLcd;
Gfx g_gfx;


uint16_t controllers[] =
{
  0x9325,
  0x9341,
  0x8357,
  0x7575
};

long int ledTime;
int ledDelay = 500;

void setup()
{
  Serial.begin(115200);
  Serial.println("in setup");

  TftLcdIO_Init(&g_tftLcdIO);
  Gfx_Init(&g_gfx, TFTWIDTH, TFTHEIGHT, &TftLcd_DrawPixel);
  TftLcd_Init(&g_tftLcd)


  ledTime = millis() + ledDelay;

  Serial.println("Exiting setup");
}

void loop()
{
  /*
   if (ledTime < millis())
   {
     digitalWrite(13, !digitalRead(13));
     ledTime = millis() + ledDelay;
   }
   */
}

template<class T>
class ListNode
{
  public:

    ListNode(T* pItem, T* pNextNode = NULL)
      _pItem(pItem), _pNextNode(pNextNode)
    { }

    T* Item()
    {
      return _pItem;
    }

    ListNode<T>* Next()
    {
      return _pNextNode;
    }

    bool HasNext()
    {
      return _pNextNode != NULL;
    }

  private:

    T* _pItem;
    ListNode<T>* _pNextNode;
};

template<class T>
class List
{
  public:

    List()
      pFirstNode(NULL), pLastNode(NULL), pCurrNode(NULL),
      count(0)
    { }

    T* Add(T* item)
    {
      ListNode<T> newNode = new ListNode<T>(item);

      if (pFirstNode == NULL)
      {
        pFirstNode = pCurrNode = pLastNode = newNode;
      }
      else
      {
        pLastNode->Next() = newNode;
        pLastNode = newNode;
      }

      count++;
      return item;
    }

    void MoveFirst()
    {
      pCurrNode = pFirstNode;
    }

    bool HasNext()
    {
      return pCurrNode != NULL;
    }

    T* Next()
    {
      T* item = NULL;
      if (pCurrNode != NULL)
      {
        item = pCurrNode->Item();
        pCurrNode = pCurrNode->Next();
      }

      return item;
    }

    unsigned int Count()
    {
      return count;
    }

  private:
    ListNode<T>* pFirstNode;
    ListNode<T>* pLastNode;
    ListNode<T>* pCurrNode;

    unsigned int count;
};

void printf(const char* pchFormat, ...)
{
  va_list arguments;
  va_start(arguments, pchFormat);

  bool foundFormat = false;
  bool foundEscape = false;

  while (pchFormat != '/0')
  {
    if (foundFormat)
    {
      switch (*pchFormat)
      {
        case '%':
          Serial.print('%');
          break;

        case 'd':
          int intArg = va_arg(arguments, int);
          Serial.print(intArg);
          break;

        case 'f':
          int doubleArg = va_arg(arguments, double);
          Serial.print(doubleArg);
          break;

        case 's':
          char* stringArg = va_arg(arguments, char*);
          Serial.print(stringArg);
          break;
      }
      foundFormat = false;
    }
    else if (foundEscape)
    {
      switch (pchFormat)
      {
        case '\\':
          Serial.print('\\');
          break;
        case 'n':
          Serial.println();
          break;
        case 't':
          Serial.print('\t');
          break;
      }
      foundEscape = false;
    }
    else if (*pchFormat == '%')
    {
      foundFormat = true;
    }
    else if(*pchFormat == '\\')
    {
      foundEscape = true;
    }
    else
    {
      Serial.print(*pchFormat);
    }
    pchFormat++;
  }

  va_end(arguments);
}

void serialEvent()
{
  Serial.println("In serialEvent");
  if (Serial.available())
  {    
    uint16_t id;
    int r, g, b, x1, y1, x2, y2, x3, y3, w, h;
    unsigned int color;
    long int len;
      
    String input = Serial.readString();
    StringScanner scanner(input);
    
    /*
    List<String> argsList = List<String>();
    while (scanner.HasNext())
    {
      String* pItem = new String(scanner.Next());
      argsList.Add(pItem);
    }
    argsList.MoveFirst();
    String* pCommand = argsList.Next();
    */

    if (*pCommand == "flood")
    {
      r = argsList.Next()->toInt();
      g = argsList.Next()->toInt();
      b = argsList.Next()->toInt();
      len = argsList.Next()->toInt();
      color = TftLcd_Color565(r, g, b);
      pTft->flood(color, len);

      printf("OK: flood executed with r = %d, g = %d, b = %d, "
         "len = %d, color = %d\n",
         r, g, b, len, color);
    }
    else if (command == "fill")
    {
      r = (int)scanner.nextInt();
      g = (int)scanner.nextInt();
      b = (int)scanner.nextInt();
      color = pTft->color565(r, g, b);
      pTft->fillScreen(color);

		printf("OK: fill executed with r = %d, g = %d, b = %d, "
         "color = %d\n",
			r, g, b, color);
    }
    else if(command == "pixel")
    {
      x1 = (int)scanner.nextInt();
      y1 = (int)scanner.nextInt();

      r = (int)scanner.nextInt();
      g = (int)scanner.nextInt();
      b = (int)scanner.nextInt();
      color = pTft->color565(r, g, b);

      pTft->drawPixel(x1, y1, color);
      
      printf("OK: drawPixel executed with x1 = %d, y1 = %d, "
			"r = %d, g = %d, b = %d, color = %d\n",
			x1, y1, r, g, b, color);
    }
    else if (command == "window")
    {
      x1 = (int)scanner.nextInt();
      y1 = (int)scanner.nextInt();
      x2 = (int)scanner.nextInt();
      y2 = (int)scanner.nextInt();

      pTft->setAddrWindow(x1, y1, x2, y2);
      
      printf("OK: setAddrWindow executed with x1 = %d, y1 = %d, "
			 "x2 = %d, y2 = %d\n" 			
			x1, y1, x2, y2);
    }
    else if (command == "rect")
    {
      x1 = (int)scanner.nextInt();
      y1 = (int)scanner.nextInt();
      w = (int)scanner.nextInt();
      h = (int)scanner.nextInt();
      r = (int)scanner.nextInt();
      g = (int)scanner.nextInt();
      b = (int)scanner.nextInt();

      color = pTft->color565(r, g, b);
      pTft->fillRect(x1, y1, w, h, color);
      
      printf("OK: fillRect executed with x1 = %d, y1 = %d, "
        "w = %d, h = %d, "
        "r = %d, g = %d, b = %d, color = %d\n", 
        x1, y1, w, h, r, g, b, color);
    }
    else if (command == "id")
    {
      printf("Ok: readID executed: %d", pTft->readID());      
    }
    else if (command == "line")
    {
      x1 = (int) scanner.nextInt();
      y1 = (int) scanner.nextInt();
      x2 = (int) scanner.nextInt();
      y2 = (int) scanner.nextInt();
      r = (int) scanner.nextInt();
      g = (int) scanner.nextInt();
      b = (int) scanner.nextInt();
      color = pTft->color565(r, g, b);
      pTft->drawLine(x1, y1, x2, y2, color);
      
      printf("OK: drawLine executed with x1 = %d, y1 = %d, "
        "x2 = %d, y2 = %d, "        
        "r = %d, g = %d, b = %d, color = %d\n", 
        x1, y1, x2, y2, r, g, b, color);
    }
    else if (command == "fcircle")
    {
      x1 = (int) scanner.nextInt();
      y1 = (int) scanner.nextInt();
      w = (int) scanner.nextInt();
      r = (int) scanner.nextInt();
      g = (int) scanner.nextInt();
      b = (int) scanner.nextInt();
      color = pTft->color565(r, g, b);
      pTft->fillCircle(x1, y1, w, color);
      
      printf("OK: fillCircle executed with x1 = %d, y1 = %d, "
        "radius = %d, ",
        "r = %d, g = %d, b = %d, color = %d\n", 
        x1, y1, w, r, g, b, color);
    }
    else if (command == "dcircle")
    {
      x1 = (int) scanner.nextInt();
      y1 = (int) scanner.nextInt();
      w = (int) scanner.nextInt();
      r = (int) scanner.nextInt();
      g = (int) scanner.nextInt();
      b = (int) scanner.nextInt();
      color = pTft->color565(r, g, b);
      pTft->drawCircle(x1, y1, w, color);
      
      printf("OK: drawCircle executed with x1 = %d, y1 = %d, "
        "radius = %d, "       
        "r = %d, g = %d, b = %d, color = %d\n", 
        x1, y1, w, r, g, b, color);

    }
    else if (command == "dtriangle")
    {
      x1 = (int) scanner.nextInt();
      y1 = (int) scanner.nextInt();
      x2 = (int) scanner.nextInt();
      y2 = (int) scanner.nextInt();
      x3 = (int) scanner.nextInt();
      y3 = (int) scanner.nextInt();
      r = (int) scanner.nextInt();
      g = (int) scanner.nextInt();
      b = (int) scanner.nextInt();
      color = pTft->color565(r, g, b);
      pTft->drawTriangle(x1, y1, x2, y2, x3, y3, color);
      
      printf("OK: drawTriangle executed with x1 = %d, y1 = %d, "
        "x2 = %d, y2 = %d, x3 = %d, y3 = %d, "        
        "r = %d, g = %d, b = %d, color = %d\n", 
        x1, y1, x2, y2, x3, y3, r, g, b, color);      
    }
    else if (command == "ftriangle")
    {
      x1 = (int) scanner.nextInt();
      y1 = (int) scanner.nextInt();
      x2 = (int) scanner.nextInt();
      y2 = (int) scanner.nextInt();
      x3 = (int) scanner.nextInt();
      y3 = (int) scanner.nextInt();
      r = (int) scanner.nextInt();
      g = (int) scanner.nextInt();
      b = (int) scanner.nextInt();
      color = pTft->color565(r, g, b);
      pTft->fillTriangle(x1, y1, x2, y2, x3, y3, color);

      printf("OK: fillTriangle executed with x1 = %d, y1 = %d, "
        "x2 = %d, y2 = %d, x3 = %d, y3 = %d, "        
        "r = %d, g = %d, b = %d, color = %d\n", 
        x1, y1, x2, y2, x3, y3, r, g, b, color);  
    }
    else if (command == "cursor")
    {
      x1 = (int) scanner.nextInt();
      y1 = (int) scanner.nextInt();
      pTft->setCursor(x1, y1);
      
      printf("Ok: setCursor executed with x1 = %d, y1 = %d\n",
        x1, y1);
    }
    else if (command == "print")
    {
      String text = scanner.next();      
      
      for (int i = 0; i < text.length(); i++)
      {
        pTft->write(text[i]);
      }        
      
      printf("Ok: write executed with text = %s\n", text.c_str());      
    }
    else if (command == "tsize")
    {
      w = (int) scanner.nextInt();
      pTft->setTextSize(w);
      
      printf("Ok: setTextSize executed with size = %d\n", w);            
    }
    else if (command == "tcolor")
    {
      r = (int) scanner.nextInt();
      g = (int) scanner.nextInt();
      b = (int) scanner.nextInt();
      color = pTft->color565(r, g, b);
      pTft->setTextColor(color);
      
      printf("Ok: setTextColor executed with r = %d, g = %d, b = %d",
        "color = %d\n", 
        r, g, b, color);        
    }
    else if (command == "rot")
    {
      r = (int)scanner.nextInt();
      pTft->setRotation(r);
      
      printf("Ok: setRotation executed with r = %d", r);
    } 
    else
    {
      printf("Command not processed: ", command.c_str());      
    }
  }
}
