EESchema Schematic File Version 4
LIBS:weather-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Weather Station ESP8266"
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Device:R_PHOTO R2
U 1 1 5D1259C1
P 5950 4600
F 0 "R2" H 6020 4646 50  0000 L CNN
F 1 "R_PHOTO" H 6020 4555 50  0000 L CNN
F 2 "Weather_Station_Project:PhotoResistor_THT_Horizontal" V 6000 4350 50  0001 L CNN
F 3 "~" H 5950 4550 50  0001 C CNN
	1    5950 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5950 4450 6350 4450
Wire Wire Line
	5950 4750 6350 4750
$Comp
L weather-rescue:microSD_Reader_Writer J1
U 1 1 5D1390C2
P 5750 2050
F 0 "J1" H 5756 2625 50  0000 C CNN
F 1 "microSD_Reader_Writer" H 5756 2534 50  0000 C CNN
F 2 "Weather_Station_Project:MicroSD_Card_Modul" H 5794 2432 50  0001 C CNN
F 3 "" H 5794 2432 50  0001 C CNN
	1    5750 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	6050 1700 6300 1700
Wire Wire Line
	6050 1800 6300 1800
Wire Wire Line
	6050 1900 6300 1900
Wire Wire Line
	6050 2000 6300 2000
Wire Wire Line
	6050 2100 6300 2100
Text Label 6300 1700 0    50   ~ 0
microSD_CS
Text Label 6300 2000 0    50   ~ 0
microSD_MISO
Text Label 6300 2100 0    50   ~ 0
5V_Test
Text Label 6350 4450 0    50   ~ 0
ADC0
Text Label 6350 4750 0    50   ~ 0
3V3_Test
$Comp
L power:GND #PWR0102
U 1 1 5D161B8C
P 6050 2200
F 0 "#PWR0102" H 6050 1950 50  0001 C CNN
F 1 "GND" H 6055 2027 50  0000 C CNN
F 2 "" H 6050 2200 50  0001 C CNN
F 3 "" H 6050 2200 50  0001 C CNN
	1    6050 2200
	1    0    0    -1  
$EndComp
$Comp
L weather-rescue:NodeMCU_Lolin_ESP8266-myLib2 U1
U 1 1 5D164A8A
P 2400 2600
F 0 "U1" H 2350 3375 50  0000 C CNN
F 1 "NodeMCU_Lolin_ESP8266" H 2350 3284 50  0000 C CNN
F 2 "Weather_Station_Project:NodeMCU_ESP8266" H 2500 2600 50  0001 C CNN
F 3 "" H 2500 2600 50  0001 C CNN
	1    2400 2600
	1    0    0    -1  
$EndComp
NoConn ~ 2850 2050
Wire Wire Line
	2850 2150 3200 2150
Wire Wire Line
	2850 2250 3200 2250
Wire Wire Line
	2850 2850 3200 2850
Wire Wire Line
	1850 2050 1400 2050
$Comp
L power:GND #PWR06
U 1 1 5D174B58
P 2850 2650
F 0 "#PWR06" H 2850 2400 50  0001 C CNN
F 1 "GND" V 2855 2522 50  0000 R CNN
F 2 "" H 2850 2650 50  0001 C CNN
F 3 "" H 2850 2650 50  0001 C CNN
	1    2850 2650
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR01
U 1 1 5D174C36
P 1850 2150
F 0 "#PWR01" H 1850 1900 50  0001 C CNN
F 1 "GND" V 1855 2022 50  0000 R CNN
F 2 "" H 1850 2150 50  0001 C CNN
F 3 "" H 1850 2150 50  0001 C CNN
	1    1850 2150
	0    1    1    0   
$EndComp
NoConn ~ 1850 2350
NoConn ~ 1850 2450
NoConn ~ 1850 3150
NoConn ~ 1850 3250
NoConn ~ 1850 3450
Text Label 3200 2150 0    50   ~ 0
OLED_SCL
Text Label 3200 2250 0    50   ~ 0
OLED_SDA
Text Label 1400 2050 2    50   ~ 0
ADC0
$Comp
L weather-rescue:DHT22-Sensor U2
U 1 1 5D18651B
P 9500 4700
F 0 "U2" H 9270 4746 50  0000 R CNN
F 1 "DHT22" H 9270 4655 50  0000 R CNN
F 2 "Weather_Station_Project:DHT22" H 9650 4950 50  0001 C CNN
F 3 "http://akizukidenshi.com/download/ds/aosong/DHT11.pdf" H 9650 4950 50  0001 C CNN
	1    9500 4700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR03
U 1 1 5D1865F4
P 9400 5000
F 0 "#PWR03" H 9400 4750 50  0001 C CNN
F 1 "GND" H 9405 4827 50  0000 C CNN
F 2 "" H 9400 5000 50  0001 C CNN
F 3 "" H 9400 5000 50  0001 C CNN
	1    9400 5000
	1    0    0    -1  
$EndComp
Text Label 9400 4400 0    50   ~ 0
3V3_Test
Text Label 9800 4700 0    50   ~ 0
DHT22_IO
NoConn ~ 9250 -100
Wire Wire Line
	1850 2250 1400 2250
Text Label 1400 2250 2    50   ~ 0
5V
$Comp
L power:GND #PWR0105
U 1 1 5D093447
P 5500 6900
F 0 "#PWR0105" H 5500 6650 50  0001 C CNN
F 1 "GND" H 5505 6727 50  0000 C CNN
F 2 "" H 5500 6900 50  0001 C CNN
F 3 "" H 5500 6900 50  0001 C CNN
	1    5500 6900
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 5D09344D
P 5500 6900
F 0 "#FLG0101" H 5500 6975 50  0001 C CNN
F 1 "PWR_FLAG" H 5500 7073 50  0000 C CNN
F 2 "" H 5500 6900 50  0001 C CNN
F 3 "~" H 5500 6900 50  0001 C CNN
	1    5500 6900
	1    0    0    -1  
$EndComp
NoConn ~ 2850 2350
$Comp
L oled_i2c:OLED_I2C DS1
U 1 1 5D090F10
P 9400 2000
F 0 "DS1" H 9381 2415 50  0000 C CNN
F 1 "OLED_I2C" H 9381 2324 50  0000 C CNN
F 2 "Weather_Station_Project:OLED_I2C" H 9400 2000 50  0001 C CNN
F 3 "" H 9400 2000 50  0001 C CNN
	1    9400 2000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 5D090FF0
P 9700 1850
F 0 "#PWR0101" H 9700 1600 50  0001 C CNN
F 1 "GND" V 9705 1722 50  0000 R CNN
F 2 "" H 9700 1850 50  0001 C CNN
F 3 "" H 9700 1850 50  0001 C CNN
	1    9700 1850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9700 1950 9950 1950
Wire Wire Line
	9700 2050 9950 2050
Wire Wire Line
	9700 2150 9950 2150
Text Label 9950 1950 0    50   ~ 0
3V3_Test
Text Label 9950 2050 0    50   ~ 0
OLED_SCL
Text Label 9950 2150 0    50   ~ 0
OLED_SDA
Wire Notes Line
	700  650  4150 650 
Wire Notes Line
	4450 650  4450 3300
Wire Notes Line
	4450 3300 7800 3300
Wire Notes Line
	7800 3300 7800 650 
Wire Notes Line
	7800 650  4450 650 
Wire Notes Line
	4450 6250 7900 6250
Wire Notes Line
	7900 6250 7900 3500
Wire Notes Line
	7900 3500 4450 3500
Wire Notes Line
	4450 3500 4450 6250
Wire Notes Line
	8200 3500 8200 6250
Wire Notes Line
	8200 6250 11000 6250
Wire Notes Line
	17300 6900 17300 4150
Wire Notes Line
	11000 3500 8200 3500
Wire Notes Line
	8100 700  8100 3250
Wire Notes Line
	8100 3250 10950 3250
Wire Notes Line
	10950 3250 10950 700 
Wire Notes Line
	10950 700  8100 700 
Wire Notes Line
	4450 7650 6850 7650
Wire Notes Line
	6850 7650 6850 6400
Wire Notes Line
	6850 6400 4450 6400
Wire Notes Line
	4450 6400 4450 7650
$Comp
L Mechanical:MountingHole H3
U 1 1 5D0B1569
P 6150 7250
F 0 "H3" H 6250 7296 50  0000 L CNN
F 1 "MountingHole" H 6250 7205 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_DIN965" H 6150 7250 50  0001 C CNN
F 3 "~" H 6150 7250 50  0001 C CNN
	1    6150 7250
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H4
U 1 1 5D0B15D8
P 6150 7450
F 0 "H4" H 6250 7496 50  0000 L CNN
F 1 "MountingHole" H 6250 7405 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_DIN965" H 6150 7450 50  0001 C CNN
F 3 "~" H 6150 7450 50  0001 C CNN
	1    6150 7450
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 5D0B161C
P 6150 7050
F 0 "H2" H 6250 7096 50  0000 L CNN
F 1 "MountingHole" H 6250 7005 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_DIN965" H 6150 7050 50  0001 C CNN
F 3 "~" H 6150 7050 50  0001 C CNN
	1    6150 7050
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H1
U 1 1 5D0B1671
P 6150 6850
F 0 "H1" H 6250 6896 50  0000 L CNN
F 1 "MountingHole" H 6250 6805 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_DIN965" H 6150 6850 50  0001 C CNN
F 3 "~" H 6150 6850 50  0001 C CNN
	1    6150 6850
	1    0    0    -1  
$EndComp
Wire Notes Line
	700  650  700  5600
Wire Notes Line
	700  5600 4150 5600
Wire Notes Line
	4150 5600 4150 650 
Wire Notes Line
	700  5800 4150 5800
Wire Notes Line
	4150 5800 4150 7650
Wire Notes Line
	4150 7650 700  7650
Wire Notes Line
	700  7650 700  5800
Text Notes 1000 950  0    118  ~ 24
NodeMCU ESP8266
Text Notes 4600 950  0    118  ~ 24
MicroSD Module
Text Notes 8250 1000 0    118  ~ 24
OLED Display
Text Notes 8350 3750 0    118  ~ 24
DHT22 Sensor
Text Notes 4550 3800 0    118  ~ 24
Photo Resistor
Text Notes 800  6100 0    118  ~ 24
Test Point
Text Notes 4550 6600 0    118  ~ 24
Mounting
Text Label 3100 6550 0    50   ~ 0
3V3
Text Label 1850 6600 0    50   ~ 0
5V
$Comp
L power:GND #PWR04
U 1 1 5D1674DB
P 3100 6850
F 0 "#PWR04" H 3100 6600 50  0001 C CNN
F 1 "GND" V 3105 6722 50  0000 R CNN
F 2 "" H 3100 6850 50  0001 C CNN
F 3 "" H 3100 6850 50  0001 C CNN
	1    3100 6850
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR02
U 1 1 5D16616B
P 1850 6900
F 0 "#PWR02" H 1850 6650 50  0001 C CNN
F 1 "GND" V 1855 6772 50  0000 R CNN
F 2 "" H 1850 6900 50  0001 C CNN
F 3 "" H 1850 6900 50  0001 C CNN
	1    1850 6900
	0    -1   -1   0   
$EndComp
$Comp
L testpoint:3V3_TestPoint U4
U 1 1 5D15C2CC
P 2850 6700
F 0 "U4" H 2958 7075 50  0000 C CNN
F 1 "3V3_TestPoint" H 2958 6984 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 2850 6700 50  0001 C CNN
F 3 "" H 2850 6700 50  0001 C CNN
	1    2850 6700
	1    0    0    -1  
$EndComp
$Comp
L testpoint:5V_TestPoint U3
U 1 1 5D15BAC7
P 1650 6800
F 0 "U3" H 1708 7265 50  0000 C CNN
F 1 "5V_TestPoint" H 1708 7174 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 1650 6800 50  0001 C CNN
F 3 "" H 1650 6800 50  0001 C CNN
	1    1650 6800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2850 3050 3200 3050
Wire Wire Line
	2850 2950 3200 2950
Wire Wire Line
	2850 2750 3200 2750
Wire Wire Line
	2850 2450 3200 2450
Text Label 3200 2450 0    50   ~ 0
DHT22_IO
NoConn ~ 1850 2550
NoConn ~ 1850 2650
NoConn ~ 1850 2750
NoConn ~ 1850 2850
Text Label 3200 2750 0    50   ~ 0
microSD_SCLK
Text Label 3200 3050 0    50   ~ 0
microSD_CS
Text Label 3200 2950 0    50   ~ 0
microSD_MOSI
Text Label 6300 1900 0    50   ~ 0
microSD_MOSI
Text Label 3200 2850 0    50   ~ 0
microSD_MISO
Text Label 6300 1800 0    50   ~ 0
microSD_SCLK
NoConn ~ 2850 3250
NoConn ~ 2850 3150
$Comp
L power:GND #PWR07
U 1 1 5D197535
P 1850 3350
F 0 "#PWR07" H 1850 3100 50  0001 C CNN
F 1 "GND" V 1855 3222 50  0000 R CNN
F 2 "" H 1850 3350 50  0001 C CNN
F 3 "" H 1850 3350 50  0001 C CNN
	1    1850 3350
	0    1    1    0   
$EndComp
Connection ~ 5950 4450
$Comp
L power:GND #PWR0104
U 1 1 5D08D7AA
P 5450 4750
F 0 "#PWR0104" H 5450 4500 50  0001 C CNN
F 1 "GND" H 5455 4577 50  0000 C CNN
F 2 "" H 5450 4750 50  0001 C CNN
F 3 "" H 5450 4750 50  0001 C CNN
	1    5450 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 4450 5950 4450
$Comp
L Device:R R1
U 1 1 5D125AB8
P 5450 4600
F 0 "R1" H 5520 4646 50  0000 L CNN
F 1 "10K" H 5520 4555 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 5380 4600 50  0001 C CNN
F 3 "~" H 5450 4600 50  0001 C CNN
	1    5450 4600
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 5D1998D7
P 2100 6350
F 0 "R3" H 2170 6396 50  0000 L CNN
F 1 "0" H 2170 6305 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 2030 6350 50  0001 C CNN
F 3 "~" H 2100 6350 50  0001 C CNN
	1    2100 6350
	1    0    0    -1  
$EndComp
$Comp
L Device:R R4
U 1 1 5D19A645
P 3350 6350
F 0 "R4" H 3420 6396 50  0000 L CNN
F 1 "0" H 3420 6305 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 3280 6350 50  0001 C CNN
F 3 "~" H 3350 6350 50  0001 C CNN
	1    3350 6350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 6200 2100 6050
Wire Wire Line
	3350 6200 3350 6000
Wire Wire Line
	3100 6550 3350 6550
Wire Wire Line
	3350 6550 3350 6500
Wire Wire Line
	1850 6600 2100 6600
Wire Wire Line
	2100 6600 2100 6500
Text Label 2100 6050 0    50   ~ 0
5V_Test
Text Label 3350 6000 0    50   ~ 0
3V3_Test
$Comp
L power:GND #PWR05
U 1 1 5D19F44C
P 1850 2950
F 0 "#PWR05" H 1850 2700 50  0001 C CNN
F 1 "GND" V 1855 2822 50  0000 R CNN
F 2 "" H 1850 2950 50  0001 C CNN
F 3 "" H 1850 2950 50  0001 C CNN
	1    1850 2950
	0    1    1    0   
$EndComp
NoConn ~ 2850 3450
NoConn ~ 1850 6750
NoConn ~ 3100 6700
NoConn ~ 2850 3350
Wire Wire Line
	2850 2550 3200 2550
Text Label 3200 2550 0    50   ~ 0
3V3
NoConn ~ 1850 3050
$EndSCHEMATC
