// Controlling the modulation of an LED using a potentiometer (variable resistor)

int ledpin = 3;                           // light connected to digital pin 3
int potpin = A3;                          // analog pin used to connect the potentiometer
int sensorValue, outputValue;             // variables to read the values 
 
void setup() 
{ 
  // initialize serial communications at 9600 bps:
  Serial.begin(9600); 
} 
 
void loop() 
{ 
  sensorValue = analogRead(potpin);               // reads the value of the potentiometer (value between 0 and 1023) 
  outputValue = map(sensorValue, 0, 1023, 0, 254);        // scale it to use it with the LED (value between 0 and 255) 
  analogWrite(ledpin, outputValue); 
  // print the results to the serial monitor:
  Serial.print("sensor = " );                       
  Serial.print(sensorValue);      
  Serial.print("\t output = ");      
  Serial.println(outputValue);  
  delay(250);   
}

