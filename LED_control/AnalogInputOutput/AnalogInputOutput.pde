// Controlling the modulation of an LED using a potentiometer (variable resistor)

int ledpin = 3;                           // light connected to digital pin 3
int potpin = A3;                          // analog pin used to connect the potentiometer
int sensorValue, outputValue, oldVal = 0;             // variables to read the values 
 
void setup() 
{ 
  // initialize serial communications at 9600 bps:
  Serial.begin(9600); 
} 
 
void loop() 
{ 
  // reads the value of the potentiometer (value between 0 and 1023) 
  sensorValue = analogRead(potpin); 
  // scale it to use it with the LED (value between 0 and 255) 
  outputValue = map(sensorValue, 0, 1023, 0, 254);  
  analogWrite(ledpin, outputValue); 
  // print the results to the serial monitor - lazy mode:
  if (oldVal != outputValue) {
    oldVal = outputValue;
    Serial.print("sensor: " );                       
    Serial.print(sensorValue);      
    Serial.print(", output: ");      
    Serial.println(outputValue);  
  }
  delay(10);   
}

