/*
 
 Face It
 ITP Fall 2013
 Daniel Shiffman
 
 Based off of the work of Greg Borenstein (https://github.com/atduskgreg)
 
 This example uses the extended version of FaceOSC to draw
 face mesh tracked by FaceOSC and to display the
 original camera image via Syphon
 
 Download the extended version here:
 
 https://github.com/downloads/kylemcdonald/ofxFaceTracker/FaceOSC-osx+Syphon.zip
 
 Download the Syphon library for Processing here:
 
 http://code.google.com/p/syphon-implementations/downloads/list
 
 NOTE WELL: this example will not work with the standard FaceOSC app,
 which does not send the necessary OSC messages with all of the face points
 and does not publish the camera feed over Syphon.
 
 */

import oscP5.*;
import codeanticode.syphon.*;

OscP5 oscP5;
SyphonClient client;

PGraphics canvas;

boolean found;
PVector[] meshPoints;
Triangle[] triangles;

void setup() {
  size(640, 480, P3D);
  frameRate(30);

  oscP5 = new OscP5(this, 8338);

  // USE THESE 2 EVENTS TO DRAW THE 
  // FULL FACE MESH:
  oscP5.plug(this, "found", "/found");
  oscP5.plug(this, "loadMesh", "/raw");

  initMesh();

  // initialize the syphon client with the name of the server
  client = new SyphonClient(this, "FaceOSC");
  // prep the PGraphics object to receive the camera image
  canvas = createGraphics(640, 480, P3D);
}

void draw() {  
  stroke(255);
  background(0);

  image(canvas, 0, 0, width, height);    

  if (client.available()) {
    canvas = client.getGraphics(canvas);
  }  

  if (found) {
    for (Triangle t : triangles) {
      noFill();
      stroke(255);
      beginShape(TRIANGLES);
      vertex(t.a.x,t.a.y);
      vertex(t.b.x,t.b.y);
      vertex(t.c.x,t.c.y);
      endShape();
    }
  }
}

public void found(int i) {
  // println("found: " + i); // 1 == found, 0 == not found
  found = i == 1;
}

void oscEvent(OscMessage theOscMessage) {
  if (theOscMessage.isPlugged()==false) {
    // For any unplugged messages
    // println("UNPLUGGED: " + theOscMessage);
  }
}

