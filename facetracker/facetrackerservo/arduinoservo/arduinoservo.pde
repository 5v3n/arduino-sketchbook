// Controlling a servo position using a serial input
// by Sven Kraeuter <http://5v3n.com/about> mail@5v3n.com

#include <Servo.h>
#include <stdlib.h>     // needed for atoi

char buffer[9], character;

 
Servo myservo;  // create servo object to control a servo
 
int servopin = 4;
// variables to read, map & lazy log values
byte incomingByte=0, inputVal;
unsigned int servoVal, oldVal=0;

void setup()
{
  // initialize serial communications at 9600 bps:
  Serial.begin(9600); 
  myservo.attach(servopin);  // attaches the servo on pin 9 to the servo object
}
 
void loop()
{
  // check if data has been sent via serial:
  if (Serial.available()) {
   incomingByte = Serial.read();
   Serial.print("Read from serial: ");
   Serial.println(incomingByte);
  }
  
  inputVal = int(incomingByte);            // offset 48 for key codes!
  servoVal = map(inputVal, 0, 9, 0, 179);     // scale it to use it with the servo (value between 0 and 180) 
  myservo.write(servoVal);                  // sets the servo position according to the scaled value
  delay(15);                           // waits for the servo to get there
    // print the results to the serial monitor - lazy mode:
  if (oldVal != inputVal) {
    oldVal = inputVal;
    Serial.print("input: " );                       
    Serial.print(inputVal);      
    Serial.print(", output: ");      
    Serial.println(servoVal);  
  }
 
}
