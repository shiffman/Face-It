/*

 Face It
 ITP Fall 2013
 Daniel Shiffman
 
 Slightly modified rom Greg Borenstein (https://github.com/atduskgreg) 
 
 This example uses the extended version of FaceOSC to draw
 all of the face points tracked by FaceOSC and to display the
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


void setup() {
  size(640, 480, P3D);
  frameRate(30);
  initMesh();

  oscP5 = new OscP5(this, 8338);

  // USE THESE 2 EVENTS TO DRAW THE 
  // FULL FACE MESH:
  oscP5.plug(this, "found", "/found");
  oscP5.plug(this, "loadMesh", "/raw");

  // initialize the syphon client with the name of the server
  client = new SyphonClient(this, "FaceOSC");
  // prep the PGraphics object to receive the camera image
  canvas = createGraphics(640, 480, P3D);
}

void draw() {  
  background(0);
  stroke(255);
  background(0);

  image(canvas, 0, 0, width, height);    

  if (client.available()) {
    canvas = client.getGraphics(canvas);
  }  

  if (found) {
    fill(100);
    drawFeature(faceOutline);
    drawFeature(leftEyebrow);
    drawFeature(rightEyebrow);
    drawFeature(nosePart1);   
    drawFeature(nosePart2);           
    drawFeature(leftEye);     
    drawFeature(rightEye);    
    drawFeature(mouthPart1);  
    drawFeature(mouthPart2);  
    drawFeature(mouthPart3);
  }
}

void drawFeature(int[] featurePointList) {
  for (int i = 0; i < featurePointList.length; i++) {
    PVector meshVertex = meshPoints[featurePointList[i]];
    if (i > 0) {
      PVector prevMeshVertex = meshPoints[featurePointList[i-1]];
      line(meshVertex.x, meshVertex.y, prevMeshVertex.x, prevMeshVertex.y);
    }
    ellipse(meshVertex.x, meshVertex.y, 3, 3);
  }
}

public void found(int i) {
  // println("found: " + i); // 1 == found, 0 == not found
  found = i == 1;
}

void oscEvent(OscMessage theOscMessage) {
  if (theOscMessage.isPlugged()==false) {
    // For any unplugged messages
    println("UNPLUGGED: " + theOscMessage);
  }
}

