// Face It
// ITP Fall 2013
// Daniel Shiffman

// Demonstration of receiving OSC messages from FaceShift OSC

import oscP5.*;
import netP5.*;

// OSC Object
OscP5 oscP5;

// Here are three "gestures" I want to track
float puff = 0;
float smileL = 0;
float smileR = 0;

void setup() {
  size(400, 400);
  
  // We need to have a larger datagram size to get all the data from FaceShift
  OscProperties properties = new OscProperties();
  properties.setDatagramSize(4096);

  /* the port number you are listening for incoming osc packets. */
  properties.setListeningPort(8338);
  
  // Create OSC Object
  oscP5 = new OscP5(this, properties);
  
  // Plug methods in
  oscP5.plug(this, "puff", "/gesture/jaw/open");
  oscP5.plug(this, "smileL", "/gesture/mouth/smile/left");
  oscP5.plug(this, "smileR", "/gesture/mouth/smile/right");
}


void draw() {
  background(0);
  
  // Draw a circle based on puffing
  stroke(255);
  fill(255, 50);
  float d = map(puff, 0, 1, 0, 200);
  ellipse(width/2, height/2, d, d);
 
  // Draw some circles based on smiling
  ellipse(100, 200+map(smileL, 0, 1, 0, -50), 20, 20);
  ellipse(300, 200+map(smileR, 0, 1, 0, -50), 20, 20);
  
  // Display data
  fill(255);
  text(nf(smileL, 1, 2), 100, 240);
  text(nf(smileR, 1, 2), 300, 240);
  text(nf(puff, 1, 2), 200, 240);
}

// Event methods that will receive data
void puff(float f) {
  puff = f;
}
void smileL(float f) {
  smileL = f;
}
void smileR(float f) {
  smileR = f;
}

/* incoming osc message are forwarded to the oscEvent method. */
void oscEvent(OscMessage theOscMessage) {
  if (theOscMessage.isPlugged()==false) {
    // For any unplugged messages
    //println("UNPLUGGED: " + theOscMessage);
  }
}

