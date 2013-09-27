// Face It
// ITP Fall 2013
// Daniel Shiffman
// https://github.com/shiffman/Faces

import processing.video.*;

// Video library
import processing.video.*;

// OpenCV Library
import gab.opencv.*;

// Also need HTTP Requests for Rekognition
import httprocessing.*;

// Java Rectangle class
import java.awt.Rectangle;


// OpenCV and Capture
OpenCV opencv;
Capture cam;

// We will need a smaller image for fast real-time detection
PImage smaller;

int scl = 4;            // Overall scale for drawing faces

FaceDetector detector;

void setup() {
  size(640, 480);
  opencv = new OpenCV(this, width/scl, height/scl);
  // Scaled down image
  smaller = createImage(opencv.width, opencv.height, RGB);
  // Larger capture object
  cam = new Capture(this, width, height);
  cam.start();
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE); 
 
  // A generic time-based face detector
  detector = new FaceDetector();}

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



