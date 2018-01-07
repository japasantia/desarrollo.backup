#include "C:\Proyectos\TftLcdLib\TftLcdLib.c\TftLcdIO.c"
#include "C:\Proyectos\TftLcdLib\TftLcdLib3\TftLcd.c"
#include "C:\Proyectos\TftLcdLib\TftLcdLib.c\TftLcd.c"

#include "C:\Proyectos\TftLcdLib\TftLcdLib.c\StringScanner.c"


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
class tagStringList {

} StringList

void serialEvent()
{
  Serial.println("in serialEvent");
  if (Serial.available())
  {
    String input = Serial.readString();
    String output;
    
    StringScanner scanner(input);
    String command = scanner.next();
    
    uint16_t id;

    int r, g, b, x1, y1, x2, y2, x3, y3, w, h;
    unsigned int color;
    long int len;
    
    if (command == "flood")
    {
      r = (int)scanner.nextInt();
      g = (int)scanner.nextInt();
      b = (int)scanner.nextInt();      
      len = scanner.nextInt();
      color = TftLcd_Color565(r, g, b);
      pTft->flood(color, len);
      
      output = "OK: flood executed with " + 
      output += "r: " + String(r);
      output += "g: " + String(g);
      output += "b: " + String(b);
      output += "color: " + String(color);
      output += "len: " + String(len);       
    }    
    else if (command == "fill")
    {
      r = (int)scanner.nextInt();
      g = (int)scanner.nextInt();
      b = (int)scanner.nextInt();      
      color = pTft->color565(r, g, b);
      pTft->fillScreen(color);      

      output = "OK: fillScreen executed with " + 
      output += "r: " + String(r);
      output += "g: " + String(g);
      output += "b: " + String(b);
      output += "color: " +  String(color);       
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
      
      output = "OK: drawPixel executed with " + 
      output += "x: " + String(x1);
      output += "y: " + String(y1);
      output += "r: " + String(r);
      output += "g: " + String(g);
      output += "b: " + String(b);
      output += "color: " + String(color);              
    }
    else if (command == "window")
    {
      x1 = (int)scanner.nextInt();
      y1 = (int)scanner.nextInt();   
      x2 = (int)scanner.nextInt();
      y2 = (int)scanner.nextInt(); 
      
      pTft->setAddrWindow(x1, y1, x2, y2);
      
      output = "OK: setAddrWindow executed with ";
      output += "x1: " + String(x1);
      output += "y1: " + String(y1);
      output += "x2: " + String(x2);
      output += "y2: " + String(y2) ;         
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
      
      output = "OK: fillRect executed with " + 
      output += "x1: " + String(x1);
      output += "y1: " + String(y1);
      output += "x2: " + String(w);
      output += "y2: " + String(h);      
      output += "r: " + String(r);
      output += "g: " + String(g);
      output += "b: " + String(b);
      output += "color: " + String(color);         
    }
    else if (command == "id")
    {
      output = "Ok: controller id: " + String(pTft->readID());
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
      
      output = "OK: line executed with " + 
      output += "x1: " + String(x1);
      output += "y1: " + String(y1);
      output += "x2: " + String(x1);
      output += "y2: " + String(y1);      
      output += "r: " + String(r);
      output += "g: " + String(g);
      output += "b: " + String(b);
      output += "color: " + String(color);      
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
      
      output = "OK: fcircle executed with " + 
      output += "x: " + String(x1);
      output += "y: " + String(y1);
      output += "r: " + String(w);
      output += "r: " + String(r);
      output += "g: " + String(g);
      output += "b: " + String(b);
      output += "color: " + String(color);      
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
      
      output = "OK: dcircle executed with " + 
      output += "x: " + String(x1);
      output += "y: " + String(y1);
      output += "r: " + String(w);
      output += "r: " + String(r);
      output += "g: " + String(g);
      output += "b: " + String(b);
      output += "color: " + String(color);      
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
      
      output = "OK: dtriangle executed with " + 
      output += "x1: " + String(x1);      
      output += "y1: " + String(y1);
      output += "x2: " + String(x2);
      output += "y2: " + String(y2);
      output += "x3: " + String(x3);
      output += "y3: " + String(y3);      
      output += "r: " + String(r);
      output += "g: " + String(g);
      output += "b: " + String(b);
      output += "color: " + String(color);      
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
      
      output = "OK: ftriangle executed with " + 
      output += "x1: " + String(x1);      
      output += "y1: " + String(y1);
      output += "x2: " + String(x2);
      output += "y2: " + String(y2);
      output += "x3: " + String(x3);
      output += "y3: " + String(y3);      
      output += "r: " + String(r);
      output += "g: " + String(g);
      output += "b: " + String(b);
      output += "color: " + String(color);      
    } 
    else if (command == "cursor")   
    {
      x1 = (int) scanner.nextInt();
      y1 = (int) scanner.nextInt();
      pTft->setCursor(x1, y1);
      output = "Ok: set cursor to: " + String(x1) + ", " + String(y1);
    }
    else if (command == "print")   
    {      
      String text = scanner.next();
      bool printContinue = true;
      output = "Ok: printed: \"" + text;
      
      while (printContinue)
      {        
        for (int i = 0; i < text.length(); i++)
        {
          pTft->write(text[i]);          
        }
        text = scanner.next();        
        if (text.length() > 0)
        {
          pTft->write(' ');
          output += ' ' + text;
        }
        else
        {
          printContinue = false;
          output += "\'";
        }        
      }   
    }
    else if (command == "tsize")
    {
      w = (int) scanner.nextInt();
      pTft->setTextSize(w);
      output = "Ok: text size set to: " + String(w);
    }
    else if (command == "tcolor")
    {
      r = (int) scanner.nextInt();
      g = (int) scanner.nextInt();   
      b = (int) scanner.nextInt();         
      color = pTft->color565(r, g, b);
      pTft->setTextColor(color);
      output = "Ok: text color set to: " + String(color);
    }
    else if (command == "rot")
    {
      r = (int)scanner.nextInt();
      pTft->setRotation(r);
      output = "Ok: rotation set to: " + String(r);
    }
    
    if (output.length() > 0)
    {
      Serial.println(output);
    }
    else
    {
      Serial.println("Command maybe not processed: " + command);
    }
  }  
}
