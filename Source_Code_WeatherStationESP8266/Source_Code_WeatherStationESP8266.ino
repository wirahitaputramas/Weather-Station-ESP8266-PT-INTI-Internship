
/* MicroSD Module Property */
#include <SPI.h>
#include <SD.h>
File myFile;
/*End of MicroSD Module Property*/

/* DHT Sensor Property */
#include <DHT.h>

#define DHTPIN 2     // Digital pin connected to the DHT sensor (can be replaced with D4 or 2 -> because D4 = 2) 
#define DHTTYPE    DHT22     // DHT 22 (AM2302)
DHT dht(DHTPIN, DHTTYPE);
/* End of DHT Sensor Property */

/* OLED Display Property */
#include <Wire.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>
#include <Adafruit_Sensor.h>

#define SCREEN_WIDTH 128 // OLED display width, in pixels
#define SCREEN_HEIGHT 64 // OLED display height, in pixels  
Adafruit_SSD1306 display(SCREEN_WIDTH, SCREEN_HEIGHT, &Wire, -1); // Declaration for an SSD1306 display connected to I2C (SDA, SCL pins)
/* End of OLED Display Property */

/* IoT Property */
#include <ESP8266WiFi.h>
const char *ssid =  "SSID";     // replace with your wifi ssid and wpa2 key
const char *pass =  "PASS";
WiFiClient client;

/* Thingspeak Property */
#include <ThingSpeak.h>
unsigned long myChannelNumber = 823396; //Replace with your channel number
const char * myWriteAPIKey = "API KEY"; //Replace with your API key
/* End of Thingspeak Property */

/* NTP Client Property */

#include "NTPClient.h" // this is external library from NTP library Fabrice Weinberg (https://github.com/arduino-libraries/NTPClient.git). Put this library in the same folder with this .ino file
#include <WiFiUdp.h> //handles sending and receiving of UDP packages
WiFiUDP ntpUDP;
NTPClient timeClient(ntpUDP);
String date_time;
/*End of NTP Client Property */

/* End of IoT Property */

/* LDR Sensor Property */
int sensorPin = A0;    // input for LDR
int sensorValue2 = 0;  // variable to store the value coming from sensor LDR
#define MAX_ADC_READING     1023
#define ADC_REF_VOLTAGE     5.0
#define REF_RESISTANCE      10000
#define LUX_CALC_SCALAR     123235178.3654270
#define LUX_CALC_EXPONENT   -1.604568157
/* End of LDR Sensor Property */



void setup() {


  Serial.begin(115200); //open serial monitor on baud rate 115200

  dht.begin(); //set up sensor DHT //Set up OLED Display

  /*OLED Display Set up*/
  if(!display.begin(SSD1306_SWITCHCAPVCC, 0x3C)) {
    Serial.println(F("SSD1306 allocation failed"));
    for(;;); 
  }
  delay(2000);
  display.clearDisplay();
  display.setTextColor(WHITE);
  /*End of OLED Display Set up*/
  
  /*MicroSD Module Set up*/ 
  delay(5000); //delay to slow down the printing process on serial monitor
  Serial.print("Initializing SD card...");

  if (!SD.begin(15)) {
    Serial.println("initialization failed!");
    return;
  }
  Serial.println("initialization done.");
  /*End of MicroSD Module Set up*/

  Serial.println("Connecting to ");
       Serial.println(ssid);
 
 
       WiFi.begin(ssid, pass);
 
      while (WiFi.status() != WL_CONNECTED) 
     {
            delay(500);
            Serial.print(".");
     }
      Serial.println("");
      Serial.println("WiFi connected");

      ThingSpeak.begin(client);  // Initialize ThingSpeak

      timeClient.begin();
      // Set offset time in seconds to adjust for your timezone, for example:
      // GMT +1 = 3600
      // GMT +8 = 28800
      // GMT -1 = -3600
      // GMT 0 = 0
      timeClient.setTimeOffset(25200);
}

void loop() {
  
  timeClient.update();
  date_time = timeClient.getFormattedDate();
  Serial.println(date_time);
  
  delay(5000);
  //read temperature and humidity
  float t = dht.readTemperature();
  float h = dht.readHumidity();

  //read LDR sensor
  sensorValue2 = analogRead(sensorPin);
  delay(100);

  float resistorVoltage, ldrVoltage;
  float ldrResistance;
  float ldrLux;
  resistorVoltage = (float)sensorValue2 / MAX_ADC_READING * ADC_REF_VOLTAGE;
  ldrVoltage = ADC_REF_VOLTAGE - resistorVoltage;
  ldrResistance = ldrVoltage/resistorVoltage * REF_RESISTANCE;
  ldrLux = LUX_CALC_SCALAR * pow(ldrResistance, LUX_CALC_EXPONENT);
  //Serial.print("Light Intensity :"); Serial.print(ldrLux ); Serial.println(" lux");

  //clear display
  display.clearDisplay();
  
  // display temperature
  display.setTextSize(1);
  display.setCursor(0,0);
  
  Serial.print("Temperature: ");
  Serial.print(t);
  Serial.println(" degrees Celcius");
   
  display.print("Temperature: ");
  display.setTextSize(1);
  display.setCursor(0,10);
  display.print(t);
  display.print(" ");
  display.setTextSize(1);
  display.cp437(true);
  display.write(167);
  display.setTextSize(1);
  display.print("C ");
  
  // display humidity
  display.setTextSize(1);
  display.setCursor(0, 20);
   
  Serial.print("Humidity: ");
  Serial.print(h);
  Serial.println(" %");
  
  display.print("Humidity: ");
  display.setTextSize(1);
  display.setCursor(0, 30);
  display.print(h);
  display.print(" % "); 

  //display LDR
  display.setTextSize(1);
  display.setCursor (0,40);

  Serial.print("Light Intensity : ");
  Serial.print(ldrLux);
  Serial.println(" lux");
  
  display.print("Light Intensity: ");
  display.setTextSize(1);
  display.setCursor(0, 50);
  display.print(ldrLux);
  display.print("lux");
  
  display.display();

   // open the file. note that only one file can be open at a time,
  // so you have to close this one before opening another.
  myFile = SD.open("WeatherData.txt", FILE_WRITE);

  // if the file opened okay, write to it:
  if (myFile) {
    Serial.println("");
    Serial.println("Writing to WeatherData.txt...");

    myFile.println(date_time);

    //writing data to MicroSD
    myFile.print("Humidity : ");
    myFile.print(h);
    myFile.println(" %");
    myFile.print("Temperature : ");
    myFile.print(t);
    myFile.println(" C");
    myFile.print("Light Intensity : ");
    myFile.print(ldrLux);
    myFile.println(" lux");

    myFile.println(" ");
    // close the file:
    myFile.close();
    Serial.println("done writing.............");
  } else {
    // if the file didn't open, print an error:
    Serial.println("error opening WeatherData.txt");
  }

  // re-open the file for reading:
  Serial.println("");
  myFile = SD.open("WeatherData.txt");
  if (myFile) {
    Serial.println("Reading WeatherData.txt .........");

    // read from the file until there's nothing else in it:
    while (myFile.available()) {
      Serial.write(myFile.read());
    }
    // close the file:
    myFile.close();
  } else {
    // if the file didn't open, print an error:
    Serial.println("error opening WeatherData.txt");
  }

  Serial.println("done reading..........");

  long int data = ThingSpeak.writeField(myChannelNumber, 1, t, myWriteAPIKey);
  if(data == 200){
    Serial.println("Temp Channel update successful.");
  }
  else{
    Serial.println("Problem updating Temp channel. HTTP error code " + String(data));
  }  
  delay(20000); // Wait 20 seconds to update the channel again

  data = ThingSpeak.writeField(myChannelNumber, 2, h, myWriteAPIKey);
  if(data == 200){
    Serial.println("Humid Channel update successful.");
  }
  else{
    Serial.println("Problem updating Humid channel. HTTP error code " + String(data));
  }
 delay(20000); // Wait 20 seconds to update the channel again

  data = ThingSpeak.writeField(myChannelNumber, 3, ldrLux, myWriteAPIKey);
  if(data == 200){
    Serial.println("LDR Channel update successful.");
  }
  else{
    Serial.println("Problem updating LDR channel. HTTP error code " + String(data));
  }  
  delay(20000); // Wait 20 seconds to update the channel again
  
  
}
  
