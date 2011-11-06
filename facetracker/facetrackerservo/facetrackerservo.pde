/** Connecting an arduino controlled servo to processing.
*
*
 */


import processing.serial.*;
import oscP5.*;
import netP5.*;

Serial myPort;  // Create object from Serial class
OscP5 oscP5;
NetAddress myRemoteLocation;
float jaw, eyebrow, mouthHeight, mouthWidth, poseX, poseY, eyeLeft, eyeRight;

void setup() 
{
  // do we need a window?
  size(640, 480);
  //opening the serial port.
  // could use Serial.list()[0] here:
  String portName = "/dev/tty.usbmodem621";
  myPort = new Serial(this, portName, 9600);
  //setting up face osc
  oscP5 = new OscP5(this, 8338);
  myRemoteLocation = new NetAddress("127.0.0.1", 8338);
  
}

void draw(){
}

void keyPressed(){
  myPort.write(key);
  println(key);
}

// parse the OSCface data
void oscEvent(OscMessage theOscMessage) {
 if (theOscMessage.checkAddrPattern("/gesture/mouth/width")==true) {
   float firstValue = theOscMessage.get(0).floatValue();
   mouthWidth = firstValue;
   println("mouthWidth = "+mouthWidth);
   println("sending mouthWidth % 10: " + ((int)mouthWidth%10));
   
   myPort.write(((int)mouthWidth%10));
 }
 /*
  if (theOscMessage.checkAddrPattern("/gesture/eyebrow/left")==true) {
    float firstValue = theOscMessage.get(0).floatValue();
    eyebrow = firstValue;
    println("eyebrow = "+eyebrow);
  }

 if (theOscMessage.checkAddrPattern("/gesture/jaw")==true) {
   float firstValue = theOscMessage.get(0).floatValue();
   jaw = firstValue;
   println("jaw = "+jaw);
 }

 if (theOscMessage.checkAddrPattern("/gesture/mouth/height")==true) {
   float firstValue = theOscMessage.get(1).floatValue();
   mouthHeight = firstValue;
   println("mouthHeight = "+mouthHeight);
 }

 if (theOscMessage.checkAddrPattern("/pose/position")==true) {
   float firstValue = theOscMessage.get(0).floatValue();
   poseX = firstValue;
   println("pose X = "+poseX);
 }

 if (theOscMessage.checkAddrPattern("/pose/position")==true) {
   float firstValue = theOscMessage.get(1).floatValue();
   poseY = firstValue;
   println("pose Y = "+poseY);
 }

 if (theOscMessage.checkAddrPattern("/gesture/eye/left")==true) {
   float firstValue = theOscMessage.get(0).floatValue();
   eyeLeft = firstValue;
   println("eyeLeft = "+eyeLeft);
 }

 if (theOscMessage.checkAddrPattern("/gesture/eye/right")==true) {
   float firstValue = theOscMessage.get(0).floatValue();
   eyeRight = firstValue;
   println("eyeRight = "+eyeRight);
 }*/
}
