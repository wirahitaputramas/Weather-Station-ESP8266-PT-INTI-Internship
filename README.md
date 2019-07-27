# Weather Station ESP8266

# Overview
The repository includes everything needed to build an Weather Station ESP8266 (including hardware information, PCB Design, and footprint):

# What do I Need To Make One?
In this project, we assume that we still need to debug and see the output in serial monitor. So we need :
- Arduino IDE (the lastest version recommended) with serial monitor in PC or Laptop

Other Essential Things :
- Standar USB to Micro USB cable
- ESP-12E Development Board ESP8266 NodeMCU ([Pict](https://raw.githubusercontent.com/wirahitaputramas/Weather-Station-ESP8266-PT-INTI-Internship/master/images/ESP%2012E%20Development%20Board.jpg "ESP-12E Development Board ESP8266 NodeMCU"))
- OLED I2C Display 128x64 Pixel ([Pict](https://raw.githubusercontent.com/wirahitaputramas/Weather-Station-ESP8266-PT-INTI-Internship/master/images/OLED%20I2C%20Display.jpg "OLED I2C Display 128x64 Pixel"))
- SPI MicroSD Module ([Pict](https://raw.githubusercontent.com/wirahitaputramas/Weather-Station-ESP8266-PT-INTI-Internship/master/images/MicroSD%20Modul.jpg "MicroSD Module"))
- MicroSD Card (SDHC Under 32 GB recommended)
- DHT22 Modue ([Pict](https://raw.githubusercontent.com/wirahitaputramas/Weather-Station-ESP8266-PT-INTI-Internship/master/images/DHT22%20Module.jpgg "DHT22 Module"))
- LDR Photoresistor
- SMD Resistor 5 kohm

# How to Make One ?

## Testing and Prototyping on Breadboard
Before we make the circuit on the PCB, we must ensure that we choose the correct GPIO. Because of that, first of all we must hookup all component on breadboard like this picture below :
<div align="center">
  <img src="https://raw.githubusercontent.com/wirahitaputramas/Weather-Station-ESP8266-PT-INTI-Internship/master/images/Weather-Station-V-2.0.jpg" width="300" height="500">
</div>

Here is the raw fritzing file ([Fritzing](https://github.com/wirahitaputramas/Weather-Station-ESP8266-PT-INTI-Internship/blob/master/Weather%20Station%20ESP8266%20on%20Breadboard.fzz "Weather Station ESP8266 on Breadboard"))

Here is the connection of each pin (exclude Vcc & GND) :
- D1 or GPIO5 to OLED SCL
- D2 or GPIO4 to OLED SDA
- D4 or GPIO2 to DHT22 IO (Data)
- D5 or GPIO14 to microSD SCLK
- D6 or GPIO12 to microSD MISO
- D7 or GPIO13 to microSD MOSI
- D8 or GPIO15 to microSD CS
- A0 or ADC0 to LDR Photoresistor

After finish the wiring, just prepare to upload the arduino whole program. We will modify any part of the source code in this repository

1. make sure that you have included the NTP Library from Fabrice Weinberg in the same folder with .ino file. Here is the [NTP Library Fabrice Weinberg](https://github.com/arduino-libraries/NTPClient.git "NTP Library Fabrice Weinberg")

2. Write down your WiFi Accses Point identity in IoT Property Block Code

```
/* IoT Property */
#include <ESP8266WiFi.h>
const char *ssid =  "SSID";     // replace with your wifi ssid and wpa2 key
const char *pass =  "PASS";
WiFiClient client;
```
3. Make your project channel in Thingspeak platform. Allocate three fields to store three different sensor reading data. After that get your channel ID and API key of your project channel. In the Screenshot below, the blue scratch is the channel ID, and the red scratch is the API Key
<div align="center">
  <img src="https://raw.githubusercontent.com/wirahitaputramas/Weather-Station-ESP8266-PT-INTI-Internship/master/images/Screenshot%20(476)_LI.jpg" width="800" height="400">
</div>

Write down your Thingspeak Channel identity in Thingspeak Property Block Code in the source code.ino
```
/* Thingspeak Property */
#include <ThingSpeak.h>
unsigned long myChannelNumber = 823396; //Replace with your channel number
const char * myWriteAPIKey = "API KEY"; //Replace with your API key
/* End of Thingspeak Property */
```

4. Make sure all of pin assign in the source code.ino related to your wiring on breadboard

5. After finish uploading the program. Open the serial monitor and set the baud rate at 115200. Make sure there's no "nan" value. The nan value sometimes appear at DHT22 reading value. To Fix that, just try to plug and unplug again the DHT22 until the exact value appear, or you can trigger the DHT22 by connecting the Vcc pin to 5V

## PCB Desain, Assembly The Final Design, And Run the Weather Station on PCB

After the Prototyping on breadboard finish, now we can design the PCB on KiCad. 

1. First you need to make the Schematic or diagram of your circuit including the connection between each pin in ESP8266 and all the others component.

In this repo, you can get all file you need if you just want to skip this step. Find all .lib files. Those are your symbol schematic library. Our team have made those symbols from the scratch by seeing the datasheet and the real component. But we strongly recommended to learn and try make your own symbol because sometimes the symbol library from the other author doesn't match with your real component, usually it's pin arrangement. This is our schematic
<div align="center">
  <img src="https://raw.githubusercontent.com/wirahitaputramas/Weather-Station-ESP8266-PT-INTI-Internship/master/images/Skematik.jpg" width="800" height="600">
</div>

Use the label method instead of wiring method to make connection between each pin and don't forget to give some outline and comment information

2. Test The connection, and if no error, assign the footprint of each component
In this repo, we have included all footprint of the project, so you can just find the .preety folder and use that

3. Placing and Tracking the PCB
Actually, this process depend on your own preference in placing and route the PCB. It isn't a problem if you try this step and find that your PCB is different with our PCB below, because the importnt things is all ratnest disappear and all the pin connection is right

<div align="center">
  <img src="https://raw.githubusercontent.com/wirahitaputramas/Weather-Station-ESP8266-PT-INTI-Internship/master/images/PCB-Weather-Station-Fix.jpg" width="800" height="500">
</div>

We choose a single layer instead of double layer because in our place double layer PCB more exspensive even when you compare with a huge single layer PCB. And also in our place, The manufacture and Printing Machine only support minimum track size at 0.6 mm and hole or drill diameter at 0.4 mm





