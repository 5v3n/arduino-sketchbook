// Controlling a servo position using a potentiometer (variable resistor)
// based on code by Michal Rinott <http://people.interaction-ivrea.it/m.rinott>
// written by Sven Kraeuter <http://5v3n.com/about> mail@5v3n.com

#include <Servo.h>
 
Servo myservo;  // create servo object to control a servo
 
int potpin   = A3;  // analog pin used to connect the potentiometer
int servopin = 4;
int potval, servoval, oldval=0;    // variables to read, map & lazy log values
 
void setup()
{
  // initialize serial communications at 9600 bps:
  Serial.begin(9600); 
  myservo.attach(servopin);  // attaches the servo on pin 9 to the servo object
}
 
void loop()
{
  potval = analogRead(potpin);            // reads the value of the potentiometer (value between 0 and 1023)
  servoval = map(potval, 0, 1023, 0, 179);     // scale it to use it with the servo (value between 0 and 180) 
  myservo.write(servoval);                  // sets the servo position according to the scaled value
  delay(15);                           // waits for the servo to get there
    // print the results to the serial monitor - lazy mode:
  if (oldval != servoval) {
    oldval = servoval;
    Serial.print("sensor: " );                       
    Serial.print(potval);      
    Serial.print(", output: ");      
    Serial.println(servoval);  
  }
}
