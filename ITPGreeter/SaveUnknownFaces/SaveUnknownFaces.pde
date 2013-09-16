// Which Face Is Which
// Daniel Shiffman

import processing.video.*;

import gab.opencvpro.*;
import java.awt.Rectangle;

OpenCVPro opencv;

Capture cam;
PImage smaller;

// Scaling down the video
int scl = 4;

FaceDetector detector;

void setup() {
  size( 640, 480 );
  opencv = new OpenCVPro(this, width/scl, height/scl);
  smaller = createImage(opencv.width,opencv.height,RGB);
  cam = new Capture(this, width, height);
  cam.start();
  opencv.loadCascade(OpenCVPro.CASCADE_FRONTALFACE_ALT); 
 
  detector = new FaceDetector(); 
}

void captureEvent(Capture cam) {
  cam.read();
}

void draw() {
  background(0);
  image(cam,0,0);
  
  smaller.copy(cam,0,0,cam.width,cam.height,0,0,smaller.width,smaller.height);
  smaller.updatePixels();
  opencv.loadImage(smaller);

  Rectangle[] faces = opencv.detect();
  detector.detect(faces);
  
  detector.showFaces();
  detector.saveNewFaces();
  

  
}



